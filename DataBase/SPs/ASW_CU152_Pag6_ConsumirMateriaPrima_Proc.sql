USE [ASW]
GO
/****** Object:  StoredProcedure [AswSch].[ASW_CU152_Pag6_ConsumirMateriaPrima_Proc]    Script Date: 15/11/2022 12:03:33 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--
--Consumir TraMateriaPrima
--Replicar a MCSW

--EXEC StoredProcedure ASWSch.ASW_CU152_Pag6_Grid_CfgConfiguracion_IU  

ALTER PROC [AswSch].[ASW_CU152_Pag6_ConsumirMateriaPrima_Proc]
	   --@pnClaUbicacion INT,
	   @pnIdCelda INT,
	   @pnTurnoActual INT,
	   @psBarcode VARCHAR(50),
	   @pnResultado INT = 1,--si debe devolver un resultset
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
	

	   EXEC  [MSW_LNKSVR].[MCSW_Integra].[MSWSch].[MSW_ConsumirAlambreASW_Proc] 
			@pnIdNumDepto		= @nClaAreaProduccion
			,@pnTurno			= @pnTurnoActual
			,@pnIdCelda			= @nClaveCelda
			,@pnAccionRemTag    = 2--consumir
			,@psTagAEliminar	= @psBarcode
			,@psNombrePcMod		= @psNombrePcMod
			,@pnClaUsuarioMod	= @pnClaUsuarioMod
		
		IF @pnResultado = 1
		BEGIN
			SELECT 1 AS Exito
		END
			
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
  
  --desarrollo: limpio la bd MCSW para poder probar con la misma etiqueta
SET XACT_ABORT ON--solo desarrollo
  delete [MSW_LNKSVR].[MCSW_Integra].[MSWSch].[MSWTraCeldaBackLog4]
  where idCelda=4 and idReferencia=1749719

SET XACT_ABORT OFF--solo desarrollo


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










