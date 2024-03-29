--USE [ASW]
--GO
/****** Object:  StoredProcedure [AswSch].[ASW_CU1_Pag2_UsuariosLogin_sel]    Script Date: 14/11/2022 10:46:02 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROC [AswSch].[ASW_CU1_Pag2_UsuariosLogin_sel]
AS
BEGIN
	
	DECLARE @nClaUbicacionDefault INT

	SELECT @nClaUbicacionDefault = Valor1
	FROM [AswSch].[ASWCfgConfiguracion]
	WHERE ClaConfiguracion = 1

;WITH cte_supervisor AS (
	SELECT 'ASWLite_TraUsuarios' as nombretabla
	,Usr.idUsuario
	,LoginUserName
	,TiSeguridad.dbo.FnDecriptaPassword(TiPass.Contrasena) as passwd
	FROM ASWSch.TiTraUsuarioVw  Usr
	JOIN TiSeguridad.dbo.TiTraReferencia ref
	ON Usr.idUsuario = ref.idUsuario
	JOIN TiSeguridad.dbo.TiTraUsuarioContrasena TiPass
	ON TiPass.IdUsuario = Usr.IdUsuario
	WHERE ref.claubicacion = @nClaUbicacionDefault
	and perfil = 0
	and Usr.bajalogica = 0
	and Ref.Bajalogica = 0
	and idPerfilReferenciado = 3500001 --SUPERVISOR
)

SELECT 'ASWLite_TraUsuarios' as nombretabla
,ISNULL(Usr.idUsuario,Sup.idUsuario) as idUsuario
,ISNULL(usr.LoginUserName,Sup.LoginUserName) as LoginUserName
,CASE WHEN sup.idusuario is not null then 1 else 0 end  as supervisor
,ISNULL(null,sup.passwd) as passwd
FROM ASWSch.TiTraUsuarioVw  Usr
JOIN TiSeguridad.dbo.TiTraReferencia ref
ON Usr.idUsuario = ref.idUsuario
FULL OUTER JOIN cte_supervisor sup
ON usr.IdUsuario = sup.IdUsuario
WHERE ref.claubicacion = @nClaUbicacionDefault
and perfil = 0
and Usr.bajalogica = 0
and Ref.Bajalogica = 0
and idPerfilReferenciado BETWEEN 3500000 AND 3500001--OPERATOR
GROUP BY ISNULL(Usr.idUsuario,Sup.idUsuario),ISNULL(usr.LoginUserName,Sup.LoginUserName),sup.idusuario,sup.passwd

END






