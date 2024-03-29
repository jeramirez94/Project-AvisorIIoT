--USE [ASW]
--GO
/****** Object:  StoredProcedure [AswSch].[ASW_CU701_Pag7_CatRcmFuncionFalla_Sel]    Script Date: 15/11/2022 04:00:52 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--	EXEC [AswSch].[ASW_CU701_Pag7_CatRcmFuncionFalla_Sel] 68, 4
ALTER PROC [AswSch].[ASW_CU701_Pag7_CatRcmFuncionFalla_Sel]
	@PnClaUbicacion INT
	,@PsIdCelda VARCHAR(30)
AS
BEGIN
/*
*	Regresea los turnos configurados para el departamento dado
*/
	SELECT DISTINCT 'ASWLite_MtoCatRcmFuncionFalla' as nombretabla
		,keys = 'ClaUbicacion,ClaEquipo,ClaRcmFuncion,ClaRcmFuncionFalla'
		,fuc = 'FechaUltimaMod'
		,FF.[ClaUbicacion]
		,FF.[ClaEquipo]
		,FF.[ClaRcmFuncion]
		,FF.[ClaRcmFuncionFalla]
		,FF.[ClaveRcmFuncionFalla]
		,FF.[NomRcmFuncionFalla]
		,F.[ClaSistema]
		,F.[ClaSubSistema]
		,FF.[ClaRcmFuncionFPadre]
		,FF.[BajaLogica]
		,CONVERT(VARCHAR, GETDATE(),121) AS [FechaUltimaMod]
	FROM [AswSch].[AswMtoCatEquipoCeldaVw] EC
	JOIN [AswSch].[AswMtoCatRcmFuncion] F
		ON EC.ClaUbicacion = F.ClaUbicacion
		AND EC.ClaEquipo = F.ClaEquipo
	JOIN [AswSch].[AswMtoCatRcmFuncionFalla] FF
		ON F.ClaUbicacion = FF.ClaUbicacion
		AND F.ClaEquipo = FF.ClaEquipo
		AND F.ClaRcmFuncion = FF.ClaRcmFuncion
	WHERE EC.ClaUbicacion = @pnClaUbicacion
		AND EC.IdCelda = @psIdCelda

END
