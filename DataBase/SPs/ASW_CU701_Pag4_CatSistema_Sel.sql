--USE [ASW]
--GO
/****** Object:  StoredProcedure [AswSch].[ASW_CU701_Pag4_CatSistema_Sel]    Script Date: 15/11/2022 03:57:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--	EXEC [AswSch].[ASW_CU701_Pag4_CatSistema_Sel] 68, 4
ALTER PROC [AswSch].[ASW_CU701_Pag4_CatSistema_Sel]
	@PnClaUbicacion INT
	,@PsIdCelda VARCHAR(30)
AS
BEGIN
/*
*	Regresea los turnos configurados para el departamento dado
*/
	SELECT DISTINCT 'ASWLite_MtoCatSistema' as nombretabla
		,keys = 'ClaUbicacion,ClaSistema'
		,fuc = 'FechaUltimaMod'
		,S.[ClaUbicacion]
		,S.[ClaSistema]
		,S.[ClaveSistema]
		,S.[NomSistema]
		,S.[ClaGrupoEquipo]
		,S.[ClaTipoMantenimiento]
		,S.[BajaLogica]
		,CONVERT(VARCHAR, GETDATE(),121) AS [FechaUltimaMod]
	FROM [AswSch].[AswMtoCatEquipoCeldaVw] EC
	JOIN ASWSch.AswMtoCatSistema S
		ON EC.ClaGrupoEquipo = S.ClaGrupoEquipo
	WHERE EC.ClaUbicacion = @pnClaUbicacion
		AND EC.IdCelda = @psIdCelda

END
