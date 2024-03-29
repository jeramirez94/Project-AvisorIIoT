--USE [ASW]
--GO
/****** Object:  StoredProcedure [AswSch].[ASW_CU504_Pag1_BitacoraBajaEficiencia_IU]    Script Date: 15/11/2022 03:16:19 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*
* MRODRIGUEZC
* 2020/07/01
* guarda la informacion de baja eficiencia
*/
ALTER PROCEDURE [AswSch].[ASW_CU504_Pag1_BitacoraBajaEficiencia_IU]	
		@pnIdBajaEficiencia INT,
		@pnClaUbicacion INT,
		@psIdCelda varchar(30),
		@ptFechaAdmSCADA DATETIME,
		@pnClaTurno INT,
		@pnHora TINYINT,
		@ptFechaHoraInicial DATETIME,
		@ptFechaHoraFinal DATETIME,
		@pnIdUsuario INT,
		@pnVelocidaObjetivo SMALLINT,
		@pnVelocidadReal SMALLINT,
		@pnPorcentajeTolerancia NUMERIC(5, 2),
		@pnClaBajaEfciencia SMALLINT,
		@pnClaEstatusReplica TINYINT,
		@pnBajaLogica INT,
		@ptFechaBajaLogica DATETIME,
		@pnClaUsuarioMod INT,
		@psNombrePCMod VARCHAR(64),
		@ptFechaUltimaMod DATETIME
AS
BEGIN
	IF EXISTS (SELECT 1 FROM [AswSch].[AswBitBitacoraBajaEficiencia] WHERE IdCelda = @psIdCelda AND IdLocal = @pnIdBajaEficiencia)
	BEGIN

		UPDATE [AswSch].[AswBitBitacoraBajaEficiencia]
		SET [ClaUbicacion] = @pnClaUbicacion
			,[FechaAdmSCADA] = @ptFechaAdmSCADA
			,[ClaTurno] = @pnClaTurno
			,[Hora] = @pnHora
			,[FechaHoraInicial] = @ptFechaHoraInicial
			,[FechaHoraFinal] = @ptFechaHoraFinal
			,[IdUsuario] = @pnIdUsuario
			,[VelocidaObjetivo] = @pnVelocidaObjetivo
			,[VelocidadReal] = @pnVelocidadReal
			,[PorcentajeTolerancia] = @pnPorcentajeTolerancia
			,[ClaBajaEfciencia] = @pnClaBajaEfciencia
			,[ClaEstatusReplica] = @pnClaEstatusReplica
			,[BajaLogica] = @pnBajaLogica
			,[FechaBajaLogica] = @ptFechaBajaLogica
			,[ClaUsuarioMod] = @pnClaUsuarioMod
			,[NombrePCMod] = @psNombrePCMod
			,[FechaUltimaMod] = @ptFechaUltimaMod
		WHERE [IdCelda] = @psIdCelda
			AND [IdLocal] = @pnIdBajaEficiencia

	END
	ELSE
	BEGIN	

		INSERT INTO [AswSch].[AswBitBitacoraBajaEficiencia]
			([ClaUbicacion]
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
			,[FechaUltimaMod])
		VALUES
			(@pnClaUbicacion,
			@psIdCelda,
			@pnIdBajaEficiencia,
			@ptFechaAdmSCADA,
			@pnClaTurno,
			@pnHora,
			@ptFechaHoraInicial,
			@ptFechaHoraFinal,
			@pnIdUsuario,
			@pnVelocidaObjetivo,
			@pnVelocidadReal,
			@pnPorcentajeTolerancia,
			@pnClaBajaEfciencia,
			@pnClaEstatusReplica,
			@pnBajaLogica,
			@ptFechaBajaLogica,
			@pnClaUsuarioMod,
			@psNombrePCMod,
			@ptFechaUltimaMod)

	END
END
