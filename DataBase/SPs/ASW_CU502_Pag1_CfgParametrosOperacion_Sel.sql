USE [ASW]
GO
/****** Object:  StoredProcedure [AswSch].[ASW_CU502_Pag1_CfgParametrosOperacion_Sel]    Script Date: 15/11/2022 03:13:01 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROC [AswSch].[ASW_CU502_Pag1_CfgParametrosOperacion_Sel]
	@PnClaUbicacion INT,
	@PnClaDepartamento INT,
	@PnClaArea INT
AS
BEGIN
	
	SELECT 
	'AswLite_CfgParametrosOperacion' as nombretabla
	,keys = 'ClaUbicacion,ClaDepartamento,ClaArea,IdParametro'
	,fuc = 'FechaUltimaMod'
	,ClaUbicacion
	,ClaDepartamento
	,ClaArea
	,IdParametro
	,Descripcion
	,Tolerancia
	,Intervalo
	,BloqueoApp 
	,CONVERT(VARCHAR, GETDATE(),121) AS [FechaUltimaMod]
	FROM [AswSch].[AswCfgParametrosOperacion]
	WHERE ClaUbicacion = @PnClaUbicacion
	AND  ClaDepartamento = @PnClaDepartamento 
	AND ClaArea = @PnClaArea

END