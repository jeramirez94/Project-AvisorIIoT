--USE ASWH
--GO 
/*==========================================
* CU: 171.1
* Objetivo: Eliminar rollos 
* Autor: ngalaz
* Fecha: 2023-05-23
* EXEC: EXEC  ASWSch.ASW_CU171_Pag1_EliminarUnidad_Del
	@PnClaUbicacion = 65,
	@PsIdWorkCenter = 'FF-01',
	@PsIdUnidades = '17041,16750,1,2,4',
	@psErrorKey  = @psErrorKey OUT ,
	@psErrorMsg  = @psErrorMsg OUT,
	@psIdioma = 'English',
	@PsNombrePCMod = '-',
	@PnClaUsuarioMod = 0,
	@PnDebug  =0 
*========================================== */

ALTER PROC ASWSch.ASW_CU171_Pag1_EliminarUnidad_Del
	@PnClaUbicacion INT,
	@PsIdWorkCenter VARCHAR(100),
	@PsIdUnidades VARCHAR(1000),
	@psErrorKey VARCHAR(15) OUT ,
	@psErrorMsg VARCHAR(500) OUT,
	@psIdioma VARCHAR(20),
	@PsNombrePCMod VARCHAR(64),
	@PnClaUsuarioMod INT,
	@PnDebug INT = 0 

AS
BEGIN

	DECLARE @nId BIGINT

	DECLARE @sErrorKey_Success VARCHAR(10) = 'SUCCESS',
		    @sErrorKey_IncorrectParams VARCHAR(50) = 'INCORRECT_PARAMETERS'

	SET @psErrorKey = @sErrorKey_Success
	
	IF(@pnClaUbicacion IS NULL OR @PsIdWorkCenter IS NULL OR @PsIdUnidades IS NULL)
	BEGIN
		
		SELECT   @psErrorMsg = Mensaje
				,@psErrorKey = ErrorKey
		FROM [AswSch].[AswCatMensajeError]
		WHERE ErrorKey = @sErrorKey_IncorrectParams
			AND Idioma = @psIdioma

		RETURN
	END

	DECLARE @Unidades TABLE (
		ClaUbicacion INT,
		Id INT,
		IdWorkCenter VARCHAR(100)


	)

	INSERT INTO @Unidades (ClaUbicacion,IdWorkCenter,Id) 
	SELECT @PnClaUbicacion,@PsIdWorkCenter,[value] 
		from [AswSch].[ASWSplitKeyFn](@PsIdUnidades,',')


	IF EXISTS (SELECT 1 FROM @Unidades)
	BEGIN
	
		BEGIN TRAN 
			BEGIN TRY
			UPDATE B
			SET B.BajaLogica = 1
			  , B.FechaBajaLogica = GETDATE()
			  , B.NombrePCMod = @PsNombrePCMod
			  , B.FechaUltimaMod = GETDATE()
			FROM AswSch.AswBitBitacoraProduccionCeldaVw B
			JOIN @Unidades U
			ON B.ClaUbicacion = U.ClaUbicacion
				AND B.IdComponente = U.IdWorkCenter
				AND B.Id = U.Id

		   SELECT @nId = MIN(IdPO)
		   FROM AswSch.AswBitBitacoraProduccionCeldaVw B
			JOIN @Unidades U
			ON B.ClaUbicacion = U.ClaUbicacion
				AND B.IdComponente = U.IdWorkCenter
				AND B.Id = U.Id

		   WHILE @nId IS NOT NULL
		   BEGIN
			IF @PnDebug  = 1
			BEGIN 
				SELECT 'debug' as Debug,
					pnClaubicacion = @PnClaUbicacion,
					psIdMicroProg  =  @nId,
					pnClaUsuarioMod = @PnClaUsuarioMod,
					psNombrePcMod  =  @PsNombrePCMod


			END
			EXEC [AswSch].[ASW_CU151_Pag1_ActualizaProduccion_Proc] 
				@pnClaubicacion = @PnClaUbicacion,
				@psIdMicroProg  =  @nId,
				@pnClaUsuarioMod = @PnClaUsuarioMod,
				@psNombrePcMod  =  @PsNombrePCMod

			SELECT @nId = MIN(IdPO)
			FROM AswSch.AswBitBitacoraProduccionCeldaVw B
			JOIN @Unidades U
			ON B.ClaUbicacion = U.ClaUbicacion
				AND B.IdComponente = U.IdWorkCenter
				AND B.Id = U.Id
			WHERE IdPO > @nId
		   
		   END	

		END TRY  
		BEGIN CATCH    
			IF @@TRANCOUNT > 0  
			ROLLBACK TRANSACTION;  
			THROW;
		END CATCH;  
  
		IF @@TRANCOUNT > 0  
			COMMIT TRANSACTION; 
	END


		
END

GO
