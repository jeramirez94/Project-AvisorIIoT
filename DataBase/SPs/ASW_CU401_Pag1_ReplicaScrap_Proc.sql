--USE [ASW]
--GO
/****** Object:  StoredProcedure [AswSch].[ASW_CU401_Pag1_ReplicaScrap_Proc]    Script Date: 15/11/2022 03:06:43 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [AswSch].[ASW_CU401_Pag1_ReplicaScrap_Proc]	
AS
BEGIN
SET NOCOUNT ON

	DECLARE
		@nId int,
		@nIdScrap int,
		@nIdProduccionCeldaTabletScrap int,
		@nIdPo int,
		@sIdCelda varchar(30),
		@nClaTurno int,
		@tFechaAdmScada datetime,
		@nPeso numeric(22, 4),
		@nClaTipoScrapCelda int,
		@sMotivoScrap varchar(500),
		@nClaEventoReplica int,
		@tFechaBajaLogica datetime,
		@nBajaLogica int,
		@nClaUsuarioMod int,
		@sNombrePCMod varchar(64),
		@tFechaUltimaMod datetime,
		@nEnvioCorreoSN int,
		@nIdNumDepto int,
		@nClaveCelda int,
		@nError int,
		@sErrorMsg varchar(500),
		@sError varchar(500),
		@nClaScrapReason int

	DECLARE @Scrap TABLE(
		[Id] [int] NOT NULL,
		[IdScrap] [int] NOT NULL,
		[IdProduccionCeldaTabletScrap] [int] NULL,
		[IdPo] [int] NOT NULL,
		[IdCelda] [int] NOT NULL,
		[ClaTurno] [int] NULL,
		[FechaAdmScada] [datetime] NULL,
		[Peso] [numeric](22, 4) NOT NULL,
		[ClaTipoScrapCelda] [int] NULL,
		[MotivoScrap] [varchar](500) NULL,
		[ClaEventoReplica] [int] NULL,
		[FechaBajaLogica] [datetime] NULL,
		[BajaLogica] [int] NULL,
		[ClaUsuarioMod] [int] NOT NULL,
		[NombrePCMod] [varchar](64) NOT NULL,
		[FechaUltimaMod] [datetime] NOT NULL,
		[EnvioCorreoSN] [int],
		ClaScrapReason int
	)
	
	INSERT INTO @Scrap(
		[Id]
		,[IdScrap]
		,[IdProduccionCeldaTabletScrap]
		,[IdPo]
		,[IdCelda]
		,[ClaTurno]
		,[FechaAdmScada]
		,[Peso]
		,[ClaTipoScrapCelda]
		,[MotivoScrap]
		,[ClaEventoReplica]
		,[FechaBajaLogica]
		,[BajaLogica]
		,[ClaUsuarioMod]
		,[NombrePCMod] 
		,[FechaUltimaMod]
		,[EnvioCorreoSN]
		,[ClaScrapReason]
	)
	SELECT [Id]
		,[IdScrap]
		,[IdProduccionCeldaTabletScrap]
		,[IdPo]
		,[IdCelda]
		,[ClaTurno]
		,[FechaAdmScada]
		,[Peso]
		,[ClaTipoScrapCelda]
		,[MotivoScrap]
		,[ClaEventoReplica]
		,[FechaBajaLogica]
		,[BajaLogica]
		,[ClaUsuarioMod]
		,[NombrePCMod] 
		,[FechaUltimaMod]
		,[EnvioCorreoSN]
		,[ClaScrapReason]
	FROM [AswSch].[AswTraScrap] 
	WHERE ClaEventoReplica = 1
		AND [FechaAdmSCADA]> dateadd(day, -14, getdate())
		AND IdCelda IN (26,28,29,30,31,33,34,35,37,38,106,110,112)

	SELECT @nId = MIN(id)
	FROM @Scrap

	--SELECT * FROM @Scrap

	WHILE @nId IS NOT NULL 
	BEGIN

		SELECT @nId = Id					
			,@nIdScrap = IdScrap	
			,@nIdProduccionCeldaTabletScrap = IdProduccionCeldaTabletScrap
			,@nIdPo = IdPo				
			,@sIdCelda	= IdCelda			
			,@nClaTurno = ClaTurno			
			,@tFechaAdmScada = FechaAdmScada	
			,@nPeso = Peso				
			,@nClaTipoScrapCelda = ClaTipoScrapCelda
			,@sMotivoScrap = MotivoScrap		
			,@nClaEventoReplica = ClaEventoReplica	
			,@tFechaBajaLogica = FechaBajaLogica	
			,@nBajaLogica = BajaLogica		
			,@nClaUsuarioMod = ClaUsuarioMod	
			,@sNombrePCMod = NombrePCMod 		
			,@tFechaUltimaMod = FechaUltimaMod	
			,@nEnvioCorreoSN = EnvioCorreoSN
			,@nClaScrapReason = ClaScrapReason
		FROM @Scrap
		WHERE Id = @nId

		SELECT @nIdNumDepto = ClaDepartamento       
			,@nClaveCelda = ClaveWorkCenter
		FROM [AswSch].[AswCatworkCenterVw]
		WHERE IdWorkCenter = @sIdCelda
		
		BEGIN TRY
			--SELECT *
			--FROM @Scrap
			--WHERE Id = @nId
			
			SET @nError = NULL
			SET @sErrorMsg = NULL

			--validar que el registro sea nuevo antes de agregarlo
			IF @nIdProduccionCeldaTabletScrap IS NULL
			BEGIN
			
				EXEC [MSW_LNKSVR].[MCSW_ERP].[MSWSch].[_CU420_Pag68_Boton_AddScrap_Srv]
				--SELECT '[MSW_LNKSVR].[MCSW_ERP].[MSWSch].[Msw_CU420_Pag68_Boton_AddScrap_Srv]',
					@pnIdNumDepto = @nIdNumDepto       
				  , @pnTurno = @nClaTurno             
				  , @pnClaveCelda = @nClaveCelda        
				  , @psIdioma = ''            
				  , @ptScrapDate = @tFechaAdmScada         
				  , @pnnpScrap = @nPeso           
				  , @pnClaTipoScrapCelda = @nClaTipoScrapCelda 
				  , @pnClaRazonScrapCelda		 = @nClaScrapReason
				  , @pnmlRazon = @sMotivoScrap     
				  , @pnIdProduccionCeldaTabletScrap = @nIdProduccionCeldaTabletScrap OUTPUT
				  , @pnStatusError = @nError OUTPUT 
				  , @psMsgError = @sErrorMsg OUTPUT


				  select @nIdProduccionCeldaTabletScrap, @nError, @sErrorMsg

			END


			--solo hago la baja hasta que se haya agregado el registro
			IF @nBajaLogica = 1 AND @nIdProduccionCeldaTabletScrap IS NOT NULL
			BEGIN
				EXEC [MSW_LNKSVR].[MCSW_ERP].[MSWSch].[MSW_CU420_Pag68_Boton_RemoveScrap_Srv]
				--SELECT '[MSW_LNKSVR].[MCSW_ERP].[MSWSch].[MSW_CU420_Pag68_Boton_RemoveScrap_Srv]',
					 @pnIdProduccionCeldaTabletScrap = @nIdProduccionCeldaTabletScrap                       
					,@pnClaUsuarioMod = @nClaUsuarioMod                                               
					,@psNombrePcMod = @sNombrePCMod   
				    ,@pnStatusError = @nError OUTPUT 
				    ,@psMsgError = @sErrorMsg OUTPUT                                                                                   

			END

			IF @nError = 0 
			BEGIN
				UPDATE [AswSch].[AswTraScrap] 
				SET ClaEventoReplica = 2
					,IdProduccionCeldaTabletScrap = @nIdProduccionCeldaTabletScrap
					,Error = @nError
					,ErrorMsg = @sErrorMsg
				WHERE Id = @nId
			END
			ELSE
			BEGIN
				UPDATE [AswSch].[AswTraScrap] 
				SET Error = @nError
					,ErrorMsg = @sErrorMsg
					,EnvioCorreoSN = 1
				WHERE Id = @nId

				IF @nEnvioCorreoSN = 0
				BEGIN
					EXEC [AswSch].[ASW_CU401_Pag2_AlertaScrap_Proc]@nIdScrap,@sIdCelda,@nClaTurno,@tFechaAdmScada,@sErrorMsg
				END 
				--todo: Notificar a TI

			END
		END TRY
		BEGIN CATCH
			
			SELECT @sError = ERROR_MESSAGE()
			--RAISERROR(@sError,16,1)
			print ERROR_MESSAGE()
			print @nIdProduccionCeldaTabletScrap

			UPDATE [AswSch].[AswTraScrap] 
			SET  Error = -1
				,ErrorMsg = @sErrorMsg
				,EnvioCorreoSN = 1
			WHERE Id = @nId
			
			IF @nEnvioCorreoSN = 0
			BEGIN
				EXEC [AswSch].[ASW_CU401_Pag2_AlertaScrap_Proc]@nIdScrap,@sIdCelda,@nClaTurno,@tFechaAdmScada,@sError
			END 

		END CATCH

		SELECT @nId = MIN(id)
		FROM @Scrap
		WHERE Id>@nId
	END

END
