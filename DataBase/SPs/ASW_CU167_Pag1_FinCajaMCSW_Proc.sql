--USE [ASW]
--GO
/****** Object:  StoredProcedure [AswSch].[ASW_CU167_Pag1_FinCajaMCSW_Proc]    Script Date: 15/11/2022 12:17:09 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROC [AswSch].[ASW_CU167_Pag1_FinCajaMCSW_Proc]
AS
BEGIN

--11/02/2021 302NGALAZ - ENVIA LOS DATOS DE PRODUCCION POR CAJA AL SISTEMA MCSW

	DECLARE @nIdReferenciaInicio INT,
		    @nIdReferenciaFin INT,
			@dFechaHora DATETIME
	
	--PARAMETROS MCSW 
	DECLARE @nIdNumDepto INT,
			@nClaveCelda INT,
			@nEstatus INT,
			@sMensaje VARCHAR(800)

	SELECT @dFechaHora = GETDATE()



	DECLARE @nId                   INT,
			@nClaUbicacion         INT,
			@nClaCelda             INT,
			@nClaMaquina           INT,
			@nClaTurno             INT,
			@nIdOperador           INT,
			@nIdPO                 INT, 
			@nClavePO                 INT, 
			@nIdUnidad             INT,
			@nClaArticulo          INT,
			@dFechaInicio      DATETIME,
			@dFechaFin         DATETIME,
			@nIdMateriaPrimaInicio INT,
			@nIdMateriaPrimaFin    INT,
			@nClaEstatus		   INT,
			@nClaEstatusReplica    INT,
			@dFechaUltimaMod       DATETIME,
			@nClaUsuarioMod        INT,
			@sNombrePcMod          VARCHAR (64),
		    @nError                INT,
		    @sErrorMsg             VARCHAR(500)

	DECLARE @FinCaja TABLE (
		    Id                   INT,
		    ClaUbicacion         INT,
		    ClaCelda             INT,
		    ClaMaquina           INT,
		    ClaTurno             INT,
		    IdUsuario            INT,
		    IdPO                 INT,
			ClavePO			     INT,
		    IdUnidadCaja         INT,
		    ClaArticulo          INT,
		    FechaInicioReal      DATETIME,
		    FechaFinReal         DATETIME,
		    IdMateriaPrimaInicio INT,
		    IdMateriaPrimaFin    INT,
			ClaEstatus			 INT,
		    ClaEstatusReplica    INT,
		    FechaUltimaMod       DATETIME,
		    ClaUsuarioMod        INT,
		    NombrePcMod          VARCHAR (64) 
		)


--OBTENEMOS LOS DATOS QUE VAMOS A ENVIAR
	INSERT INTO @FinCaja (
		    [Id]	
		   ,[ClaUbicacion]
           ,[ClaCelda]
           ,[ClaMaquina]
           ,[ClaTurno]
           ,[IdUsuario]
           ,[IdPO]
		   ,[ClavePO]
           ,[IdUnidadCaja]
           ,[ClaArticulo]
           ,[FechaInicioReal]
           ,[FechaFinReal]
           ,[IdMateriaPrimaInicio]
           ,[IdMateriaPrimaFin]
		   ,[ClaEstatus]
           ,[ClaEstatusReplica]
           ,[FechaUltimaMod]
           ,[ClaUsuarioMod]
           ,[NombrePcMod]
	)
	SELECT	row_number() over (order by ClaCelda,FC.IdPO,IdUnidadCaja) as Id
		   ,FC.[ClaUbicacion]
           ,[ClaCelda]
           ,[ClaMaquina]
           ,[ClaTurno]
           ,[IdUsuario]
		   ,FC.IdPO
           ,OP.[ClavePO]
           ,[IdUnidadCaja]
           ,FC.[ClaArticulo]
           ,FC.[FechaInicioReal]
           ,FC.[FechaFinReal]
           ,[IdMateriaPrimaInicio]
           ,[IdMateriaPrimaFin]
		   ,OP.[ClaEstatus]
           ,[ClaEstatusReplica]
           ,FC.[FechaUltimaMod]
           ,FC.[ClaUsuarioMod]
           ,FC.[NombrePcMod]
	FROM [AswSch].[AswTraFinCajaMCSW] FC
	JOIN [AswSch].[ASWTraOrdenProduccion] OP
		ON FC.ClaUbicacion = OP.ClaUbicacion
		AND FC.IdPO = OP.IdPO
	WHERE ClaEstatusReplica = 1
	AND IdCelda IN (112,33,34,35,37,26,28,29,30,31,38,106,110)
	AND FC.[FechaInicioReal]> dateadd(day, -14, getdate())
	AND (IdCelda IN(112,34) OR FC.[FechaInicioReal]> '2022-08-18 07:00:00')--fecha liberacion

	SELECT @nId = MIN (Id)
	FROM @FinCaja

	WHILE @nId IS NOT NULL
	BEGIN
		SET @nEstatus = 0
		
		SELECT 
		    @nClaUbicacion         = [ClaUbicacion]
           ,@nClaCelda             = [ClaCelda]
           ,@nClaMaquina           = [ClaMaquina]
           ,@nClaTurno             = [ClaTurno]
           ,@nIdOperador           = [IdUsuario]
           ,@nIdPO                 = [IdPO]
           ,@nClavePO              = [ClavePO]
           ,@nIdUnidad             = [IdUnidadCaja]
           ,@nClaArticulo          = [ClaArticulo]
           ,@dFechaInicio      = [FechaInicioReal]
           ,@dFechaFin         = [FechaFinReal]
           ,@nIdMateriaPrimaInicio = [IdMateriaPrimaInicio]
           ,@nIdMateriaPrimaFin    = [IdMateriaPrimaFin]
		   ,@nClaEstatus           = [ClaEstatus]
           ,@nClaEstatusReplica    = [ClaEstatusReplica]
           ,@dFechaUltimaMod       = [FechaUltimaMod]
           ,@nClaUsuarioMod        = [ClaUsuarioMod]
           ,@sNombrePcMod          = [NombrePcMod]
		FROM @FinCaja
		WHERE Id = @nId


		--Materia prima con la que se inicia
		SELECT @nIdReferenciaInicio = Referencia
		FROM [AswSch].[AswTraMateriaPrima]
		WHERE IdBarcode = @nIdMateriaPrimaInicio
	
		--Materia prima con la que termina
		SELECT @nIdReferenciaFin = Referencia
		FROM [AswSch].[AswTraMateriaPrima]
		WHERE IdBarcode = @nIdMateriaPrimaFin
		
		--Obtenemos ClaveCelda 
		SELECT @nClaveCelda = ClaveWorkCenter,
			   @nIdNumDepto = ClaDepartamento
		FROM ASWsch.AswCatWorkCenterVw
		WHERE IdWorkCenter = @nClaCelda

		--INICIAMOS TRANSACCION
		BEGIN TRAN
		
			BEGIN TRY
			SET @nError = NULL
			SET @sErrorMsg = NULL

				EXEC [MSW_LNKSVR].[MCSW_ERP].[MSWSch].[MswRegistraProduccionSCADASrv]
					 @pnClaUbicacion				= @nClaUbicacion
					,@pnIdNumDepto					= @nIdNumDepto
					,@pnClaveCelda					= @nClaveCelda
					,@pnIdComponente				= @nClaMaquina 
					,@pnClaTurno					= @nClaTurno
					,@pnIdOperador					= @nIdOperador
					,@pnIdOPM						= @nClavePO
					,@pnIdUnidad					= @nIdUnidad 
					,@pnClaArticulo					= @nClaArticulo
					,@ptFechaHoraInicio				= @dFechaInicio
					,@ptFechaHoraFin				= @dFechaFin
					,@pnIdMateriaPrima				= @nIdReferenciaInicio 
					,@pnClaEstatus					= @nClaEstatus
					,@pnClaUsuarioMod				= @nClaUsuarioMod
					,@psNombrePcMod					= @sNombrePCMod
					,@ptFechaUltimaMod				= @dFechaHora
					,@pnEstatus                     = @nEstatus
					,@psMensaje                     = @sMensaje      
				--	,@pnStatusError                 = @nError OUTPUT 
				--    ,@psMsgError                    = @sErrorMsg OUTPUT   


				--IF @nEstatus = 0 --SI NO HAY ERROR ACTUALIZAR EL ClaEstatusReplica a 2
				IF @nEstatus = 0
					BEGIN
						UPDATE [AswSch].[AswTraFinCajaMCSW]
							SET ClaEstatusReplica = 2 --REPLICADO
							,Error = @nEstatus
							,ErrorMsg = @sMensaje
						WHERE   ClaUbicacion = @nClaUbicacion
							AND IdPO = @nIdPO
							AND IdUnidadCaja = @nIdUnidad
							AND ClaMaquina = @nClaMaquina
					END
				ELSE
					BEGIN
						UPDATE [AswSch].[AswTraFinCajaMCSW]
							SET Error = @nEstatus
							,ErrorMsg = @sMensaje
						    WHERE   ClaUbicacion = @nClaUbicacion
							AND IdPO = @nIdPO
							AND IdUnidadCaja = @nIdUnidad
							AND ClaMaquina = @nClaMaquina
					END
					
		
				--SI NO HAY ERROR SE HACE COMMIT
				COMMIT TRAN
			END TRY
			BEGIN CATCH
				--EN CASO DE ERROR HACEMOS ROLLBACK
				ROLLBACK
			END CATCH

		--SIGIENTE REGISTRO
		SELECT @nId = MIN (Id)
		FROM @FinCaja
		WHERE Id>@nId

	END 
	


	

END