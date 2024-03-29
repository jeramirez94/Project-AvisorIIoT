--USE [ASW]
--GO
/****** Object:  StoredProcedure [AswSch].[ASW_CU701_Pag5_CatSubSistema_Sel]    Script Date: 15/11/2022 03:58:37 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--	EXEC [AswSch].[ASW_CU701_Pag5_CatSubSistema_Sel] 68, 4
ALTER PROC [AswSch].[ASW_CU701_Pag5_CatSubSistema_Sel]
	@PnClaUbicacion INT
	,@PsIdCelda VARCHAR(30)
AS
BEGIN
/*
*	Regresea los turnos configurados para el departamento dado
*/
	SELECT DISTINCT 'ASWLite_MtoCatSubSistema' as nombretabla
		,keys = 'ClaUbicacion,ClaSistema,ClaSubSistema'
		,fuc = 'FechaUltimaMod'
		,SS.[ClaUbicacion]
		,SS.[ClaSistema]
		,SS.[ClaSubSistema]
		,SS.[ClaveSubSistema]
		,SS.[NomSubSistema]
		,SS.[BajaLogica]
		,CONVERT(VARCHAR, GETDATE(),121) AS [FechaUltimaMod]
	FROM [AswSch].[AswMtoCatEquipoCeldaVw] EC
	JOIN ASWSch.AswMtoCatSistema S
		ON EC.ClaGrupoEquipo = S.ClaGrupoEquipo
	JOIN [AswSch].[AswMtoCatSubSistema] SS
		ON S.ClaUbicacion = SS.ClaUbicacion
		AND S.ClaSistema = SS.ClaSistema   
	WHERE EC.ClaUbicacion = @pnClaUbicacion
		AND EC.IdCelda = @psIdCelda

END
