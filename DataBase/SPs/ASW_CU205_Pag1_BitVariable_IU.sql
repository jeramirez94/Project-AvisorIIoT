--USE [ASW]
--GO
/****** Object:  StoredProcedure [AswSch].[ASW_CU205_Pag1_BitVariable_IU]    Script Date: 01/03/2023 09:04:57 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*==========================================
* CU: 205.1
* Objetivo: Recibir los datos de la recoleccion de la bitacora de variables del sistema de recoleccion (nombre pendiente)  
* Autor: mrodriguezc
* Fecha: 2022-01-13
* EXEC: [AswSch].[ASW_CU205_Pag1_BitVariable_IU]
*========================================== */
ALTER PROCEDURE [AswSch].[ASW_CU205_Pag1_BitVariable_IU]
	@pnEventoOrigen BIGINT,
	@ptFechaHoraMaquina DATETIME,
	@pnClaVariable INT,
	@psClaMaquina VARCHAR(30),
	@pnValor REAL,
	@pnClaProducto BIGINT,
	@pnClaUbicacion INT,
	@pnClaArea INT,
	@pnClaSubarea INT,
	@pnClaDepartamento INT = NULL,
	@psClaPuntoMedicion VARCHAR(30) = NULL,
	@pnAnio INT = NULL
AS
BEGIN
	SET NOCOUNT ON
	
	IF NOT EXISTS (SELECT 1 FROM AswSch.AswRecBitVariable WHERE EventoOrigen = @pnEventoOrigen AND ClaMaquina = @psClaMaquina)
	BEGIN 
		INSERT INTO AswSch.AswRecBitVariable(
			[EventoOrigen],
			[ClaPuntoMedicion],
			[Anio],
			[FechaHoraMaquina],
			[ClaVariable],
			[ClaMaquina],
			[Valor],
			[ClaProducto],
			[ClaUbicacion],
			[ClaArea],
			[ClaSubarea],
			[ClaDepartamento]
		)
		VALUES(
			@pnEventoOrigen,
			@psClaPuntoMedicion,
			@pnAnio,
			@ptFechaHoraMaquina,
			@pnClaVariable,
			@psClaMaquina,
			@pnValor,
			@pnClaProducto,
			@pnClaUbicacion,
			@pnClaArea,
			@pnClaSubarea,
			@pnClaDepartamento
		)
	END
	ELSE
	BEGIN
		UPDATE [AswSch].[AswRecBitVariable]
		SET [ClaPuntoMedicion] = @psClaPuntoMedicion,
			[Anio] = @pnAnio,
			[FechaHoraMaquina] = @ptFechaHoraMaquina,
			[ClaVariable] = @pnClaVariable,
			[ClaMaquina] = @psClaMaquina,
			[Valor] = @pnValor,
			[ClaProducto] = @pnClaProducto,
			[ClaUbicacion] = @pnClaUbicacion,
			[ClaDepartamento] = @pnClaDepartamento,
			[ClaArea] = @pnClaArea,
			[ClaSubarea] = @pnClaSubarea,
			[FechaUltimaMod] = GETDATE()
		WHERE EventoOrigen = @pnEventoOrigen
			AND ClaMaquina = @psClaMaquina

	END

END
