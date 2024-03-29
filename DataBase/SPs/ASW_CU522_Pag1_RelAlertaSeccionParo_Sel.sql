--USE [ASW]
--GO
/****** Object:  StoredProcedure [AswSch].[ASW_CU522_Pag1_RelAlertaSeccionParo_Sel]    Script Date: 15/11/2022 03:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROC [AswSch].[ASW_CU522_Pag1_RelAlertaSeccionParo_Sel]
	@PsIdCelda VARCHAR 
AS
BEGIN

	
	DECLARE @nClaArea INT

	SELECT @nClaArea = ClaArea
	FROM [AswSch].[AswCatWorkCenterVw]
	WHERE IdWorkCenter = @PsIdCelda

	IF @PsIdCelda IS NOT NULL 
	BEGIN
		SELECT 
			   'ASWLite_RelAlertaSeccionParo' as nombretabla
			   ,keys = 'ClaUbicacion,IdRelAlertaSeccionParo'
			   ,fuc = 'FechaUltimaMod'
			  ,[ClaUbicacion]
			  ,[IdRelAlertaSeccionParo]
			  ,[ClaAlerta]
			  ,[ClaSeccionParo]
			  ,[ClaArea]
			  ,[ClaUsuarioMod]
			  ,CONVERT(VARCHAR, GETDATE(),121) as FechaUltimaMod 
			  ,[NombrePcMod]
			  ,[BajaLogica]
			  ,CONVERT(VARCHAR,[FechaBajaLogica],121) as FechaBajaLogica
			  ,[EsParo]
			  ,[EsAlerta]
		  FROM [AswSch].[AswRelAlertaSeccionParoMCSW]
		  --WHERE ClaArea = @nClaArea
	END
   

END