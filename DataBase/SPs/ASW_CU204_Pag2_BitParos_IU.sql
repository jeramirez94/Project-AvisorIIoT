USE [ASW]
GO
/****** Object:  StoredProcedure [AswSch].[ASW_CU204_Pag2_BitParos_IU]    Script Date: 10/08/2023 01:09:48 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*==========================================
* CU: 204.1
* Objetivo: Recibir los datos de la recoleccion de la bitacora de paros del sistema de recoleccion (nombre pendiente)  
* Autor: mrodriguezc
* Fecha: 2022-01-13
* EXEC: [AswSch].[ASW_CU204_Pag2_BitParos_IU]
*========================================== */
ALTER PROCEDURE [AswSch].[ASW_CU204_Pag2_BitParos_IU]
	@pnEventoOrigen BIGINT
	,@ptFechaHoraInicio DATETIME
	,@ptFechaHoraFin DATETIME
	,@psClaMaquina VARCHAR(30)
	,@pnClaProducto INT
	,@pnDuracion REAL 
	,@pnClaParo INT 
	,@pnClaUbicacion INT
	,@pnClaArea INT 
	,@pnClaDepartamento INT = NULL
	,@psClaPuntoMedicion VARCHAR(30) = NULL
	,@pnAnio INT = NULL
AS
BEGIN

	SET NOCOUNT ON

	--variables para la actualizacion de la bitacora ASW
	DECLARE 
		@nClaTurnoInicio INT,
		@tFechaAdmInicio DATETIME,
		@tFechaActual DATETIME,
		@sWorkCenter VARCHAR(30),
		@nDuracionMicroParo INT,
		@nMicroParo INT,
		@nClaTurnoFin INT,
		@tFechaAdmFin DATETIME,
		@tFechaHoraCierre DATETIME,
		@tFechaHoraApertura DATETIME,
		@nDuracion INT,
		@nIdPO INT 

	--log de ejecucion del servicio [AswSch].[ASW_CU204_Pag2_BitParos_IU]
	INSERT INTO AswSch.AswRecBitBitParos (
		EventoOrigen,
		FechaHoraInicio,
		FechaHoraFin,
		ClaMaquina,
		ClaProducto,
		Duracion,
		ClaParo,
		ClaUbicacion,
		ClaArea
	)
	VALUES (
		@pnEventoOrigen,
		@ptFechaHoraInicio,
		@ptFechaHoraFin,
		@psClaMaquina,
		@pnClaProducto,
		@pnDuracion,
		@pnClaParo,
		@pnClaUbicacion,
		@pnClaArea
	)

	--Actualizacion de la bitacora de recoleccion
	IF EXISTS(SELECT 1 FROM AswSch.AswRecBitParos WHERE EventoOrigen = @pnEventoOrigen AND ClaMaquina = @psClaMaquina)
	BEGIN
		UPDATE AswSch.AswRecBitParos
		SET ClaPuntoMedicion = @psClaPuntoMedicion,
			Anio = @pnAnio,
			FechaHoraInicio = @ptFechaHoraInicio,
			FechaHoraFin = @ptFechaHoraFin,
			ClaMaquina = @psClaMaquina,
			ClaProducto = @pnClaProducto,
			Duracion = @pnDuracion,
			ClaParo = @pnClaParo,
			ClaUbicacion = @pnClaUbicacion,
			ClaDepartamento = @pnClaDepartamento,
			ClaArea = @pnClaArea,
			FechaUltimaMod = GETDATE()
		WHERE EventoOrigen = @pnEventoOrigen
			AND ClaMaquina = @psClaMaquina
	END
	ELSE	
	BEGIN
		INSERT INTO AswSch.AswRecBitParos (
			EventoOrigen,
			ClaPuntoMedicion,
			Anio,
			FechaHoraInicio,
			FechaHoraFin,
			ClaMaquina,
			ClaProducto,
			Duracion,
			ClaParo,
			ClaUbicacion,
			ClaArea,
			ClaDepartamento
		)
		VALUES (
			@pnEventoOrigen,
			@psClaPuntoMedicion,
			@pnAnio,
			@ptFechaHoraInicio,
			@ptFechaHoraFin,
			@psClaMaquina,
			@pnClaProducto,
			@pnDuracion,
			@pnClaParo,
			@pnClaUbicacion,
			@pnClaArea,
			@pnClaDepartamento
		)
	END
	
	/*
	Actualizacion de la bitacora ASW
	*/

	SET @sWorkCenter = (SELECT WC.IdWorkCenter 
						FROM [AswSch].[AswCatWorkUnitVw] WU 
						INNER JOIN [AswSch].[AswCatWorkCenterVw] WC  
							ON WC.IdWorkCenter = WU.IdWorkCenter 
						WHERE WU.ClaMaquina = @psClaMaquina)
	SET @nDuracionMicroParo = (SELECT Valor1 
							   FROM [AswSch].[ASWCfgConfiguracion] 
							   WHERE ClaveConfiguracion = 'MICROPARO')

	--obtengo los datos del inicio de paro
	SET @nClaTurnoInicio = (SELECT [AswSch].[ASWGetTurno] (@pnClaUbicacion, @pnClaDepartamento, @ptFechaHoraInicio));
	SET @tFechaAdmInicio = (SELECT [AswSch].[ASWGetFechaAdm] (@pnClaUbicacion, @pnClaDepartamento, @ptFechaHoraInicio));

	--por default mantengo los datos iguales
	SET @tFechaHoraCierre = @ptFechaHoraFin

	SET @tFechaActual = (SELECT GETDATE());

	SELECT @nIdPO = idMicroProg 
	FROM AswSch.AswTraMicroPrograma
	WHERE IdWorkCenter = @sWorkCenter
	AND ClaEstatus = 2 --opm actual 
	
	IF @ptFechaHoraFin IS NOT NULL
	BEGIN
		SET @nClaTurnoFin = (SELECT [AswSch].[ASWGetTurno] (@pnClaUbicacion, @pnClaDepartamento, @ptFechaHoraFin));
		SET @tFechaAdmFin = (SELECT [AswSch].[ASWGetFechaAdm] (@pnClaUbicacion, @pnClaDepartamento, @ptFechaHoraFin));

		--si es cierre de paro y cierra fuera del turno original calculo la fecha de cierre y apertura
		IF @nClaTurnoInicio<>@nClaTurnoFin OR @tFechaAdmInicio<>@tFechaAdmFin
		BEGIN
			SET @tFechaHoraCierre = (SELECT [AswSch].[ASWGetFinTurno] (@pnClaUbicacion,@tFechaAdmInicio,@nClaTurnoInicio, @pnClaDepartamento));
			SET @tFechaHoraApertura = (SELECT [AswSch].[ASWGetInicioTurno] (@pnClaUbicacion,@tFechaAdmFin,@nClaTurnoFin, @pnClaDepartamento));

			--inicio la actualizacion del paro en el turno de cierre
			--Duracion y microparo
			SET @nDuracion = (SELECT DATEDIFF(s, @tFechaHoraApertura, @ptFechaHoraFin));
	
			IF @nDuracion > @nDuracionMicroParo*60
			BEGIN
				SET @nMicroParo = 0
			END
			ELSE
			BEGIN
				SET @nMicroParo = 1
			END
	
			--se actualiza el paro dentro del mismo turno o el paro del turno en que inicio
			EXEC [AswSch].[ASW_CU204_Pag1_BitParos_IU]
					 @pnClaUbicacion = @pnClaUbicacion
					,@pnIdComponente = @psClaMaquina
					,@pnIdParo = @pnEventoOrigen
					,@psClaPuntoMedicion = @psClaPuntoMedicion
					,@pnAnio = @pnAnio
					,@pnIdPOInicio  = @nIdPO
					,@pnIdPOFin = NULL
					,@pnIdUnidad = NULL
					,@pnIdUsuario = NULL
					,@ptFechaHoraInicial = @tFechaHoraApertura
					,@ptFechaHoraFinal = @ptFechaHoraFin
					,@pnMicroParoSN = @nMicroParo
					,@pnDuracionSegundos = @nDuracion
					,@ptFechaAdmSCADA = @tFechaAdmFin
					,@pnClaTurno = @nClaTurnoFin
					,@pnClaGrupoParo = NULL
					,@pnClaParo = NULL
					,@pnClaSeccionParo = NULL
					,@pnClaEstatusReplica = NULL
					,@pnClaEventoParo = NULL
					,@pnClaEventoJustificacion = NULL
					,@pnClaEventoReasignacion = NULL
					,@pnClaEventoAtencion = NULL
					,@pnClaEventoSolucionado = NULL
					,@pnClaEventoCierre = NULL
					,@pnIdParoProgramado = NULL
					,@ptFechaHoraJustificado = NULL
					,@ptFechaHoraReasignado = NULL
					,@ptFechaHoraAtencion = NULL
					,@ptFechaHoraSolucion = NULL
					,@pnIdAgrupador = NULL
					,@pnClaUsuarioMod = 0
					,@psNombrePCMod = 'Recolección'
					,@ptFechaUltimaMod = @tFechaActual
					,@pnBajaLogica = 0
					,@psComentarios = NULL
					,@psComentariosSolucion = NULL
					,@psNombreEmpleado = NULL
		END
	END

	--Duracion y microparo
	SET @nDuracion = (SELECT DATEDIFF(s, @ptFechaHoraInicio, @tFechaHoraCierre));
	
	IF @nDuracion > @nDuracionMicroParo*60
	BEGIN
		SET @nMicroParo = 0
	END
	ELSE
	BEGIN
		SET @nMicroParo = 1
	END
	
	--se actualiza el paro dentro del mismo turno o el paro del turno en que inicio
	EXEC [AswSch].[ASW_CU204_Pag1_BitParos_IU]
			 @pnClaUbicacion = @pnClaUbicacion
			,@pnIdComponente = @psClaMaquina
			,@pnIdParo = @pnEventoOrigen
			,@psClaPuntoMedicion = @psClaPuntoMedicion
			,@pnAnio = @pnAnio
			,@pnIdPOInicio  = @nIdPO
			,@pnIdPOFin = NULL
			,@pnIdUnidad = NULL
			,@pnIdUsuario = NULL
			,@ptFechaHoraInicial = @ptFechaHoraInicio
			,@ptFechaHoraFinal = @tFechaHoraCierre
			,@pnMicroParoSN = @nMicroParo
			,@pnDuracionSegundos = @nDuracion
			,@ptFechaAdmSCADA = @tFechaAdmInicio
			,@pnClaTurno = @nClaTurnoInicio
			,@pnClaGrupoParo = NULL
			,@pnClaParo = NULL
			,@pnClaSeccionParo = NULL
			,@pnClaEstatusReplica = NULL
			,@pnClaEventoParo = NULL
			,@pnClaEventoJustificacion = NULL
			,@pnClaEventoReasignacion = NULL
			,@pnClaEventoAtencion = NULL
			,@pnClaEventoSolucionado = NULL
			,@pnClaEventoCierre = NULL
			,@pnIdParoProgramado = NULL
			,@ptFechaHoraJustificado = NULL
			,@ptFechaHoraReasignado = NULL
			,@ptFechaHoraAtencion = NULL
			,@ptFechaHoraSolucion = NULL
			,@pnIdAgrupador = NULL
			,@pnClaUsuarioMod = 0
			,@psNombrePCMod = 'Recolección'
			,@ptFechaUltimaMod = @tFechaActual
			,@pnBajaLogica = 0
			,@psComentarios = NULL
			,@psComentariosSolucion = NULL
			,@psNombreEmpleado = NULL

	

	--reenvio a desarrollo TEMPORALMENTE
	IF @@SERVERNAME = 'SRVHOUBD01'
	BEGIN
		BEGIN TRY
			EXEC [DCSDTII02\SQL2012].ASWH.[AswSch].[ASW_CU204_Pag2_BitParos_IU]
				@pnEventoOrigen 
				,@ptFechaHoraInicio 
				,@ptFechaHoraFin 
				,@psClaMaquina 
				,@pnClaProducto 
				,@pnDuracion  
				,@pnClaParo  
				,@pnClaUbicacion 
				,@pnClaArea  
				,@pnClaDepartamento 
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
