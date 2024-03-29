--USE [ASW]
--GO
/****** Object:  StoredProcedure [AswSch].[ASW_CU701_Pag6_CatRcmFuncion_Sel]    Script Date: 15/11/2022 03:59:39 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--	EXEC [AswSch].[ASW_CU701_Pag6_CatRcmFuncion_Sel] 68, 4
ALTER PROC [AswSch].[ASW_CU701_Pag6_CatRcmFuncion_Sel]
	@PnClaUbicacion INT
	,@PsIdCelda VARCHAR(30)
AS
BEGIN
/*
*	Regresea los turnos configurados para el departamento dado
*/
	SELECT DISTINCT 'ASWLite_MtoCatRcmFuncion' as nombretabla
		,keys = 'ClaUbicacion,ClaEquipo,ClaRcmFuncion'
		,fuc = 'FechaUltimaMod'
		,F.[ClaUbicacion]
		,F.[ClaEquipo]
		,F.[ClaRcmFuncion]
		,F.[NomRcmFuncion]
		,F.[ClaSistema]
		,F.[ClaveRcmFuncion]
		,F.[ClaTipoFuncion]
		,F.[ClaRcmFuncionPadre]
		,F.[BajaLogica]
		,CONVERT(VARCHAR, GETDATE(),121) AS FechaUltimaMod
	FROM [AswSch].[AswMtoCatEquipoCeldaVw] EC
	JOIN [AswSch].[AswMtoCatRcmFuncion] F
		ON EC.ClaUbicacion = F.ClaUbicacion
		AND EC.ClaEquipo = F.ClaEquipo
	WHERE EC.ClaUbicacion = @pnClaUbicacion
		AND EC.IdCelda = @psIdCelda

END
