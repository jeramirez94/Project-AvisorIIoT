--USE [ASW]
--GO
/****** Object:  StoredProcedure [AswSch].[ASW_CU504_Pag1_ReplicaBajaEficiencia_Proc]    Script Date: 15/11/2022 03:17:30 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*
* MRODRIGUEZC
* 2020/07/31
* envia la informacion de BE a MCSW
*/

/*
begin tran

EXECUTE [AswSch].[ASW_CU504_Pag1_ReplicaBajaEficiencia_Proc]	

select * from [AswSch].[AswBitBitacoraBajaEficiencia]
WHERE ClaEstatusReplica = 2

SELECT * FROM [MSW_LNKSVR].[MCSW_Integra].[MSWSch].MSWPAITraBSCBajaEficienciaSrv

rollback tran
*/
ALTER PROCEDURE [AswSch].[ASW_CU504_Pag1_ReplicaBajaEficiencia_Proc]	
AS
BEGIN
SET NOCOUNT ON

	DECLARE
		@nId INT,
		@nClaUbicacion INT,
		@sIdCelda VARCHAR(30),
		@nIdNumDepto INT,
		@nClaveCelda INT,
		@nIdLocal INT,
		@tFechaAdmSCADA DATETIME,
		@nClaTurno INT,
		@nHora TINYINT,
		@tFechaHoraInicial DATETIME,
		@tFechaHoraFinal DATETIME,
		@nIdUsuario INT,
		@nVelocidaObjetivo SMALLINT,
		@nVelocidadReal SMALLINT,
		@nPorcentajeTolerancia NUMERIC(5, 2),
		@nClaBajaEfciencia SMALLINT,
		@nClaEstatusReplica TINYINT,
		@nBajaLogica INT,
		@tFechaBajaLogica DATETIME,
		@nClaUsuarioMod INT,
		@sNombrePCMod VARCHAR(64),
		@tFechaUltimaMod DATETIME,
	    @sError	VARCHAR(500)

	DECLARE @BajaEficiencia TABLE(
		Id INT,
		ClaUbicacion INT,
		IdCelda SMALLINT,
		IdLocal INT,
		FechaAdmSCADA DATETIME,
		ClaTurno INT,
		Hora TINYINT,
		FechaHoraInicial DATETIME,
		FechaHoraFinal DATETIME,
		IdUsuario INT,
		VelocidaObjetivo SMALLINT,
		VelocidadReal SMALLINT,
		PorcentajeTolerancia NUMERIC(5, 2),
		ClaBajaEfciencia SMALLINT,
		ClaEstatusReplica TINYINT,
		BajaLogica INT,
		FechaBajaLogica DATETIME,
		ClaUsuarioMod INT,
		NombrePCMod VARCHAR(64),
		FechaUltimaMod DATETIME
	)
	
	INSERT INTO @BajaEficiencia(
		[Id]
		,[ClaUbicacion]
		,[IdCelda]
		,[IdLocal]
		,[FechaAdmSCADA]
		,[ClaTurno]
		,[Hora]
		,[FechaHoraInicial]
		,[FechaHoraFinal]
		,[IdUsuario]
		,[VelocidaObjetivo]
		,[VelocidadReal]
		,[PorcentajeTolerancia]
		,[ClaBajaEfciencia]
		,[ClaEstatusReplica]
		,[BajaLogica]
		,[FechaBajaLogica]
		,[ClaUsuarioMod]
		,[NombrePCMod]
		,[FechaUltimaMod]
	)
	SELECT [Id]
		,[ClaUbicacion]
		,[IdCelda]
		,[IdLocal]
		,[FechaAdmSCADA]
		,[ClaTurno]
		,[Hora]
		,[FechaHoraInicial]
		,[FechaHoraFinal]
		,[IdUsuario]
		,[VelocidaObjetivo]
		,[VelocidadReal]
		,[PorcentajeTolerancia]
		,[ClaBajaEfciencia]
		,[ClaEstatusReplica]
		,[BajaLogica]
		,[FechaBajaLogica]
		,[ClaUsuarioMod]
		,[NombrePCMod]
		,[FechaUltimaMod]
	FROM [AswSch].[AswBitBitacoraBajaEficiencia] 
	WHERE ClaEstatusReplica = 1
	AND [FechaAdmSCADA]> dateadd(day, -14, getdate())

	SELECT @nId = MIN(id)
	FROM @BajaEficiencia

	--SELECT * FROM @BajaEficiencia

	WHILE @nId IS NOT NULL
	BEGIN

		SELECT @nClaUbicacion = ClaUbicacion
			,@sIdCelda = IdCelda
			,@nIdLocal = IdLocal
			,@tFechaAdmSCADA = FechaAdmSCADA
			,@nClaTurno = ClaTurno
			,@nHora = Hora
			,@tFechaHoraInicial = FechaHoraInicial
			,@tFechaHoraFinal = FechaHoraFinal
			,@nIdUsuario = IdUsuario
			,@nVelocidaObjetivo = VelocidaObjetivo
			,@nVelocidadReal = VelocidadReal
			,@nPorcentajeTolerancia = PorcentajeTolerancia
			,@nClaBajaEfciencia = ClaBajaEfciencia
			,@nClaEstatusReplica = ClaEstatusReplica
			,@nBajaLogica = BajaLogica
			,@tFechaBajaLogica = FechaBajaLogica
			,@nClaUsuarioMod = ClaUsuarioMod
			,@sNombrePCMod = NombrePCMod
			,@tFechaUltimaMod = FechaUltimaMod
		FROM @BajaEficiencia
		WHERE Id = @nId

		SELECT @nIdNumDepto = ClaDepartamento
			,@nClaveCelda = ClaveWorkCenter
		FROM [AswSch].[AswCatWorkCenterVw]
		WHERE IdWorkCenter = @sIdCelda

		BEGIN TRY
			--SELECT *
			--FROM @BajaEficiencia
			--WHERE Id = @nId
			EXEC [MSW_LNKSVR].[MCSW_Integra].[MSWSch].[MswPaiGrabaBajaEficienciaA1Proc] 
				@pnClaUbicacion = @nClaUbicacion 
				--,@psIdCelda = @sIdCelda
				,@pnIdNumDepto = @nIdNumDepto
				,@pnClaveCelda = @nClaveCelda 
				,@ptFechaAdm = @tFechaAdmSCADA 
				,@pnClaTurno = @nClaTurno 
				,@ptFechaInicio = @tFechaHoraInicial 
				,@ptFechaFin = @tFechaHoraFinal 
				,@pnIdUsuario = @nIdUsuario 
				,@pnVelocidaObjetivo = @nVelocidaObjetivo 
				,@pnVelocidadReal = @nVelocidadReal 
				,@pnPorcentaje = @nPorcentajeTolerancia 
				,@pnClaBajaEficiencia = @nClaBajaEfciencia 
				--,@pnClaUsuarioMod = @nClaUsuarioMod 
				--,@psNombrePcMod = @sNombrePcMod 
				--,@ptFechaUltimaMod = @tFechaUltimaMod 

			UPDATE [AswSch].[AswBitBitacoraBajaEficiencia] 
			SET ClaEstatusReplica = 2
			WHERE Id = @nId
		END TRY
		BEGIN CATCH
			
			SELECT @sError = ERROR_MESSAGE()
			--RAISERROR(@sError,16,1)
			print @sError
		END CATCH

		SELECT @nId = MIN(id)
		FROM @BajaEficiencia
		WHERE Id>@nId
	END

END

