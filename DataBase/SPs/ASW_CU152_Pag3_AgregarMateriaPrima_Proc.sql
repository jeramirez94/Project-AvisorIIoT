USE [ASW]
GO
/****** Object:  StoredProcedure [AswSch].[ASW_CU152_Pag3_AgregarMateriaPrima_Proc]    Script Date: 14/11/2022 11:59:08 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--
--Agregar TraMateriaPrima
--Replicar a MCSW

--EXEC StoredProcedure ASWSch.ASW_CU152_Pag3_Grid_CfgConfiguracion_IU  

ALTER PROC [AswSch].[ASW_CU152_Pag3_AgregarMateriaPrima_Proc]
	   --@pnClaUbicacion INT,
	   @pnIdCelda INT,
	   @pnTurnoActual INT,
	   @psBarcode VARCHAR(50),
	   @psNombrePcMod VARCHAR(64),
	   @pnClausuarioMod INT

AS
BEGIN

	DECLARE 
		@nClaAreaProduccion INT
		,@nClaveCelda INT
		,@nIdReferencia INT

	DECLARE 
		@ErrorMessage  NVARCHAR(4000)
		,@ErrorSeverity INT
		,@ErrorState    INT

	DECLARE
		@nEsTransaccionPropia INT

	DECLARE @tRespuestaAdd TABLE(
		IdSiguienteCeldaBack INT
		--,IdCelda INT
		,ClaveCelda INT
		,IdNumDepto INT
		,Turno INT
		,IdReferencia INT
		,EsEnUso INT
		,FechaUltimaMod DATETIME
		,NombrePcMod VARCHAR(64)
		,ClaUsuarioMod INT
		,EsRegistroManual INT
		,IdError INT
		,MsgError VARCHAR(255)
	)

	DECLARE @tConsultaAlambron TABLE(
		Orden INT	
		,CodigoAlambre VARCHAR(50)	
		,IdReferencia INT
		,DescripcionAlambre VARCHAR(100)	
		,NomProvedor VARCHAR(100)	
		,Peso VARCHAR(100)	
		,Colada VARCHAR(15)
		,IdError INT
		,MsgError VARCHAR(255)
	)

	SELECT @nClaAreaProduccion = ClaAreaProduccion
		,@nClaveCelda = ClaveCelda
	FROM [AswSch].[AswCatCeldas]
	WHERE IdCelda = @pnIdCelda

	IF (@@TRANCOUNT = 0)  
	BEGIN  		
		SET @nEsTransaccionPropia = 1  
	END
	ELSE
	BEGIN
		SET @nEsTransaccionPropia = 0
	END
	

	IF @nEsTransaccionPropia = 1
	BEGIN
		BEGIN TRAN		

	END
	BEGIN TRY
	

	   INSERT INTO @tRespuestaAdd
	   EXEC  [MSW_LNKSVR].[MCSW_Integra].[MSWSch].[MSW_AgregarAlambreASW_Proc] 
			@pnIdNumDepto		= @nClaAreaProduccion
			,@pnTurno			= @pnTurnoActual
			,@pnClaveCelda		= @nClaveCelda
			,@psScanNvoTag		= @psBarcode
			--@pnNoEsProdArt		INT = NULL,
			,@psNombrePcMod		= @psNombrePcMod
			,@pnClaUsuarioMod	= @pnClaUsuarioMod
			--@pnEsCaptMan		INT = NULL,
			--@pnEsDebug			INT = 0
	
		SELECT @nIdReferencia=IdReferencia FROM @tRespuestaAdd
		

		--consulta
		INSERT INTO @tConsultaAlambron
		EXEC [MSW_LNKSVR].[MCSW_Integra].[MSWSch].[MSW_ConsultaAlambreASW_Proc] 
			@pnClaveCelda =@nClaveCelda, 
			@pnTurno  =@pnTurnoActual,
			@pnIdNumDepto =@nClaAreaProduccion 
			

	END TRY 
	BEGIN CATCH
	
		SELECT 
			@ErrorMessage = ERROR_MESSAGE(), 
			@ErrorSeverity = ERROR_SEVERITY(), 
			@ErrorState = ERROR_STATE();
  
		IF @nEsTransaccionPropia = 1
		BEGIN
			IF @@TRANCOUNT > 0  
				ROLLBACK TRANSACTION;
		END  	

		RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState);
		RETURN
	END CATCH;  

	SELECT Orden
		,IdReferencia 	
		,CodigoAlambre 
		,DescripcionAlambre 
		,NomProvedor 	
		,CASE WHEN ISNUMERIC(REPLACE(Peso,'Lbs','')) = 1 THEN  CAST(REPLACE(Peso,'Lbs','') AS NUMERIC(24,4)) ELSE NULL END AS Peso
		,Colada
	FROM @tConsultaAlambron 
	WHERE IdReferencia = @nIdReferencia
	
  
  IF @nEsTransaccionPropia = 1
	BEGIN
	IF @@TRANCOUNT > 0  
		COMMIT TRANSACTION  
	END
  
	--IF @nEsTransaccionPropia = 1
	--BEGIN
	--IF @@TRANCOUNT > 0  
	--	ROLLBACK TRANSACTION  --para prueba en desarrollo
	--END

END












*/