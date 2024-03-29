--USE [ASW]
--GO
/****** Object:  StoredProcedure [AswSch].[ASW_CU701_Pag8_TraRcmModoFalla_Sel]    Script Date: 15/11/2022 04:03:25 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--	EXEC [AswSch].[ASW_CU701_Pag8_TraRcmModoFalla_Sel] 68, 4
ALTER PROC [AswSch].[ASW_CU701_Pag8_TraRcmModoFalla_Sel]
	@PnClaUbicacion INT
	,@PsIdCelda VARCHAR(30)
AS
BEGIN
/*
*	Regresea los turnos configurados para el departamento dado
*/
	SELECT DISTINCT 'ASWLite_MtoTraRcmModoFalla' as nombretabla
		,keys = 'ClaUbicacion,ClaEquipo,ClaRcmFuncion,ClaRcmFuncionFalla,ClaRcmModoFalla'
		,fuc = 'FechaUltimaMod'
		,MF.[ClaUbicacion]
		,MF.[ClaEquipo]
		,MF.[ClaRcmFuncion]
		,MF.[ClaRcmFuncionFalla]
		,MF.[ClaRcmModoFalla]
		,MF.[DescRcmModoFalla]
		,MF.[EsActivo]
		,MF.[ClaDepartamento]
		,MF.[ClaArea]
		,MF.[ClaRcmDecision]
		,MF.[ClaTipoMantenimiento]
		,MF.[ClaveRcmModoFalla]
		,MF.[ClaRcmModoFPadre]
		,MF.[BajaLogica]
		,CONVERT(VARCHAR, GETDATE(),121) AS FechaUltimaMod
	FROM [AswSch].[AswMtoCatEquipoCeldaVw] EC
	JOIN [AswSch].[AswMtoTraRcmModoFalla] MF
		ON EC.ClaUbicacion = MF.ClaUbicacion
		AND EC.ClaEquipo = MF.ClaEquipo
	WHERE EC.ClaUbicacion = @pnClaUbicacion
		AND EC.IdCelda = @psIdCelda

END
