--USE [ASW]
--GO
/****** Object:  StoredProcedure [AswSch].[ASW_CU202_Pag2_BitProduccion_IU]    Script Date: 13/03/2023 05:57:00 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*==========================================
* CU: 202.1
* Objetivo: Recibir los datos de la recoleccion de la bitacora de produccion del sistema de recoleccion (nombre pendiente)  
* Autor: mrodriguezc
* Fecha: 2022-01-13
* EXEC: [AswSch].[ASW_CU202_Pag2_BitProduccion_IU]
* MRODRIGUEZC - 2023-04-06 - Se agregan los datos de orden de produccion, capacidad y multiplo
*========================================== */
ALTER PROCEDURE [AswSch].[ASW_CU202_Pag2_BitProduccion_IU]
	@pnEventoOrigen BIGINT
	,@ptFechaHoraInicio DATETIME
	,@ptFechaHoraFin DATETIME
	,@psClaMaquina VARCHAR(30)
	,@pnClaProducto INT
	,@pnTerminado INT
	,@pnDuracion REAL
	,@pnEntorchadosTotales REAL
	,@pnClaArea INT
	,@pnClaUbicacion INT
	,@pnClaTipoProducto INT
	,@pnClaDepartamento INT = NULL
	,@pnMultiplo INT = 1
	,@psClaPuntoMedicion VARCHAR(30) = NULL
	,@pnAnio INT = NULL
AS
BEGIN
DECLARE 
	@nClaTurno INT,
	@tFechaAdm DATETIME,
	@tFechaActual DATETIME,
	@sWorkCenter VARCHAR(30),
	@nHora INT,
	@nCajas INT,
	@nEsPNC INT,
	@nIdPO INT,
	@nClaArticulo INT,
	@nCapacidad NUMERIC(8,2),
	@nIndiceMultiplo INT

	SET NOCOUNT ON

	
		INSERT INTO AswSch.AswRecBitBitProduccion (
			[EventoOrigen],
			[FechaHoraInicio],
			[FechaHoraFin],
			[ClaMaquina],
			[ClaProducto],
			[Terminado],
			[Duracion],
			[EntorchadosTotales],
			[ClaArea],
			[ClaUbicacion],
			[ClaTipoProducto],
			[Multiplo]
		)
		VALUES (
			@pnEventoOrigen,
			@ptFechaHoraInicio,
			@ptFechaHoraFin,
			@psClaMaquina,
			@pnClaProducto,
			@pnTerminado,
			@pnDuracion,
			@pnEntorchadosTotales,
			@pnClaArea,
			@pnClaUbicacion,
			@pnClaTipoProducto,
			@pnMultiplo
		)
			
			
	IF EXISTS (SELECT 1 FROM AswSch.AswRecBitProduccion WHERE EventoOrigen = @pnEventoOrigen AND ClaMaquina = @psClaMaquina)
	BEGIN
		UPDATE AswSch.AswRecBitProduccion
		SET 
			ClaPuntoMedicion = @psClaPuntoMedicion,
			Anio = @pnAnio,
			FechaHoraInicio = @ptFechaHoraInicio,
			FechaHoraFin = @ptFechaHoraFin,
			ClaMaquina = @psClaMaquina,
			ClaProducto = @pnClaProducto,
			Terminado = @pnTerminado,
			Duracion = @pnDuracion,
			EntorchadosTotales = @pnEntorchadosTotales,
			Multiplo = @pnMultiplo,
			ClaArea = @pnClaArea,
			ClaUbicacion = @pnClaUbicacion,
			ClaDepartamento = @pnClaDepartamento,
			ClaTipoProducto = @pnClaTipoProducto,
			FechaUltimaMod = GETDATE()
		WHERE EventoOrigen = @pnEventoOrigen
			AND ClaMaquina = @psClaMaquina
	END
	ELSE
	BEGIN
		INSERT INTO AswSch.AswRecBitProduccion (
			[EventoOrigen],
			[ClaPuntoMedicion],
			[Anio],
			[FechaHoraInicio],
			[FechaHoraFin],
			[ClaMaquina],
			[ClaProducto],
			[Terminado],
			[Duracion],
			[EntorchadosTotales],
			[Multiplo],
			[ClaArea],
			[ClaUbicacion],
			[ClaTipoProducto],
			[ClaDepartamento]
		)
		VALUES (
			@pnEventoOrigen,
			@psClaPuntoMedicion,
			@pnAnio,
			@ptFechaHoraInicio,
			@ptFechaHoraFin,
			@psClaMaquina,
			@pnClaProducto,
			@pnTerminado,
			@pnDuracion,
			@pnEntorchadosTotales,
			@pnMultiplo,
			@pnClaArea,
			@pnClaUbicacion,
			@pnClaTipoProducto,
			@pnClaDepartamento
		)
	END


	--actualizacion de bitacora ASW	(solo terminados)
	IF @pnTerminado IN (-1,1)
	BEGIN
		BEGIN TRY
			SET @nClaTurno = (SELECT [AswSch].[ASWGetTurno] (@pnClaUbicacion, @pnClaDepartamento, COALESCE(@ptFechaHoraFin, @ptFechaHoraInicio)));
			SET @tFechaAdm = (SELECT [AswSch].[ASWGetFechaAdm] (@pnClaUbicacion, @pnClaDepartamento, COALESCE(@ptFechaHoraFin, @ptFechaHoraInicio)));
			SET @tFechaActual = (SELECT GETDATE());
			SET @nHora = (SELECT DATEPART(HOUR, @ptFechaHoraFin))
			SET @sWorkCenter = (SELECT WC.IdWorkCenter 
								FROM [AswSch].[AswCatWorkCenterVw] WC 
								INNER JOIN [AswSch].[AswCatWorkUnitVw]WU 
									ON WC.IdWorkCenter = WU.IdWorkCenter 
								WHERE WU.ClaMaquina = @psClaMaquina )
							
			SET @nCajas = 1

			SET @nEsPNC = CASE @pnTerminado 
							WHEN 1 THEN 0 
							WHEN -1 THEN 1 
							END

			--obtengo los datos de la produccion actual
			SELECT @nIdPO = idMicroProg
				,@nClaArticulo = ClaArticulo
			FROM [AswSch].[AswTraMicroPrograma]
			WHERE IdWorkCenter = @sWorkCenter
				AND ClaEstatus = 2 --En Progreso

			--obtengo los datos de la capacidad de la maquina
			SELECT @nCapacidad = Capacidad
			FROM [AswSch].[AswCatCapacidadMaquinaVw]
			WHERE ClaMaquina = @sWorkCenter
				AND ClaArticulo = @nClaArticulo

			--inserto tantos registros como sea el multiplo 
			--(parche: o al menos una vez si el multiplo viene nulo)
			--no es necesario identificar los registros existentes ya que ambos llevan la misma informacion
			SET @nIndiceMultiplo = 1
			WHILE @nIndiceMultiplo <= COALESCE(@pnMultiplo, 1)
			BEGIN
				EXEC [AswSch].[ASW_CU202_Pag1_ActualizaBitProduccion_IU]
						 @pnClaUbicacion  = @pnClaUbicacion
						,@pnIdBitProduccion  = @pnEventoOrigen
						,@psClaPuntoMedicion = @psClaPuntoMedicion
						,@pnAnio = @pnAnio
						,@pnIdMultiplo = @nIndiceMultiplo
						,@psIdCelda  = @sWorkCenter
						,@pnIdComponente  = @psClaMaquina
						,@pnIdPO  = @nIdPO
						,@pnIdCaja  = NULL
						,@pnClaArticulo  = @nClaArticulo
						,@psClaveCorte  = 'FINCAJA'
						,@ptFechaHoraInicio  = @ptFechaHoraInicio
						,@ptFechaHoraFin  = @ptFechaHoraFin
						,@pnDuracionSegundos = @pnDuracion
						,@pnClavosInicio  = 0
						,@pnClavosFin  = @pnEntorchadosTotales
						,@pnCajasInicio  = 0
						,@pnCajasFin  = @nCajas
						,@pnEsPNC = @nEsPNC
						,@pnCajasXHora  = @nCapacidad
						,@pnMultiplo = @pnMultiplo
						,@pnClaTurno  = @nClaTurno
						,@ptFechaAdm  = @tFechaAdm
						,@pnHora  = @nHora
						,@pnClaEstatusReplica = 0
						,@pnBajaLogica  = 0
						,@ptFechaBajaLogica  = NULL
						,@pnClaUsuarioMod  = 0
						,@psNombrePCMod  = 'Recolección'
						,@ptFechaUltimaMod  = @tFechaActual

				SET @nIndiceMultiplo = @nIndiceMultiplo+1
			END 
		
			--actualizo los encabezados de produccion
			EXEC [AswSch].[ASW_CU151_Pag1_ActualizaProduccion_Proc] 
				@pnClaubicacion = @pnClaUbicacion,
				@psIdMicroProg = @nIdPO,
				@pnClaUsuarioMod = 0,
				@psNombrePcMod = 'Recolección'
		END TRY  
		BEGIN CATCH  
			--TODO: procesar el error
			SELECT   
				ERROR_NUMBER() AS ErrorNumber  
			   ,ERROR_MESSAGE() AS ErrorMessage;  
		END CATCH  

		--reenvio a desarrollo TEMPORALMENTE
		IF @@SERVERNAME = 'SRVHOUBD01'
		BEGIN
			BEGIN TRY
				EXEC [DCSDTII02\SQL2012].ASWH.[AswSch].[ASW_CU202_Pag2_BitProduccion_IU]
					@pnEventoOrigen 
					,@ptFechaHoraInicio 
					,@ptFechaHoraFin
					,@psClaMaquina 
					,@pnClaProducto 
					,@pnTerminado 
					,@pnDuracion 
					,@pnEntorchadosTotales 
					,@pnClaArea 
					,@pnClaUbicacion 
					,@pnClaTipoProducto 
					,@pnClaDepartamento 
					,@pnMultiplo 
					,@psClaPuntoMedicion 
					,@pnAnio 
			END TRY  
			BEGIN CATCH  
				--TODO: procesar el error
				SELECT   
					ERROR_NUMBER() AS ErrorNumber  
				   ,ERROR_MESSAGE() AS ErrorMessage;  
			END CATCH  
		END
	END
END
