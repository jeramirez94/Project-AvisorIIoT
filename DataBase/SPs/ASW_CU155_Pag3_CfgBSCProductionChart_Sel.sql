USE [ASW]
GO
/****** Object:  StoredProcedure [AswSch].[ASW_CU155_Pag3_CfgBSCProductionChart_Sel]    Script Date: 15/11/2022 12:05:02 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROC [AswSch].[ASW_CU155_Pag3_CfgBSCProductionChart_Sel]
AS
BEGIN

	SELECT 'ASWLite_CfgBSCProductionChart' as nombretabla
	,keys = 'ClaProductionChart'
	,fuc = 'FechaUltimaMod'
	,ClaProductionChart
	,NomProductionChart
	,RedValue
	,YellowValue
	,GreenValue
	,convert(varchar,getdate(),121) as FechaUltimaMod
	,NombrePcMod
	,ClaUsuarioMod
	FROM [AswSch].[ASWCfgBSCProductionChart]
	

END

