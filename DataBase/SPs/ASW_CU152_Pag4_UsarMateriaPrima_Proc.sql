USE [ASW]
GO
/****** Object:  StoredProcedure [AswSch].[ASW_CU152_Pag4_UsarMateriaPrima_Proc]    Script Date: 15/11/2022 12:00:32 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--
--Usar TraMateriaPrima
--Replicar a MCSW

--EXEC StoredProcedure ASWSch.ASW_CU152_Pag4_Grid_CfgConfiguracion_IU  

ALTER PROC [AswSch].[ASW_CU152_Pag4_UsarMateriaPrima_Proc]
	  --@pnClaUbicacion INT,
	  @pnIdCelda INT,
	  @pnIdReferencia INT,
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
	   --si no regresa nada esta bien
	   EXEC  [MSW_LNKSVR].[MCSW_Integra].[MSWSch].[MSW_PonerUsoAlambreASW_Proc] 
			@pnIdNumDepto		= @nClaAreaProduccion
			,@pnIdCelda			= @nClaveCelda
			,@pnAlamUsa			= @pnIdReferencia
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
