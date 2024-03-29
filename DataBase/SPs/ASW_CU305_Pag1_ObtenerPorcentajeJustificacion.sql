--USE [ASW]
--GO
/****** Object:  StoredProcedure [AswSch].[ASW_CU305_Pag1_ObtenerPorcentajeJustificacion]    Script Date: 15/11/2022 02:52:41 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- EXEC [AswSch].[ASW_CU305_Pag1_ObtenerPorcentajeJustificacion] 68, '2022-07-26T21:59:21Z' , 35, 0, 1
-- EXEC  [AswSch].[ASW_CU305_Pag1_ObtenerTiempo] 68, '2022-06-22T12:00:00.000Z', '2022-06-22T21:59:59.000Z', 112, 1
-- EXEC  [AswSch].[ASW_CU305_Pag1_ObtenerPorcentajeJustificacion] $ClaUbicacion, '${__to:date}', $Cell, 1
ALTER PROC [AswSch].[ASW_CU305_Pag1_ObtenerPorcentajeJustificacion]
	@pnClaUbicacion INT
	,@ptFechaHasta DATETIME
	,@psIdCelda VARCHAR(30)
	,@pnTiempoUTC INT = 0
	,@pnDebug INT = 0
AS
BEGIN

	--SET @ptFechaHasta = COALESCE(@ptFechaHasta, GETDATE())
	--si no hay turno devolver ultimo turno o 0s?
	
	DECLARE
		@nClaAreaProduccion INT
		,@nClaTipoCelda INT
		,@nClaTurno INT
		,@tFechaAdm DATETIME
		,@tFechaInicioTurno DATETIME
		,@tFechaFinTurno DATETIME
		,@nJustificacionDefault INT

	IF @pnTiempoUTC = 1
	BEGIN
		SET @ptFechaHasta = dateadd(hh, datediff(hh, getutcdate(), getdate()), @ptFechaHasta)
	END

	SELECT @nClaAreaProduccion = ClaDepartamento 
		,@nClaTipoCelda = ClaArea
	FROM [AswSch].[AswCatWorkCenterVw]
	WHERE IdWorkCenter = @psIdCelda

	--obtengo la justificacion por default
	SELECT @nJustificacionDefault = SeccionParo
	FROM [AswSch].[AswCfgParametrosOperacion]
	WHERE ClaArea = @nClaTipoCelda

	--obtengo el turno y fecha
	SET @nClaTurno = [AswSch].[ASWGetTurno] (@pnClaUbicacion, @nClaAreaProduccion, @ptFechaHasta)
	SET @tFechaAdm = [AswSch].[ASWGetFechaAdm] (@pnClaUbicacion, @nClaAreaProduccion, @ptFechaHasta)

	--obtengo el inicio y fin de turno para la fecha consultada
	SET @tFechaInicioTurno = [AswSch].[ASWGetInicioTurno](@pnClaUbicacion, @tFechaAdm, @nClaTurno, @nClaAreaProduccion)
	SET @tFechaFinTurno = [AswSch].[ASWGetFinTurno](@pnClaUbicacion, @tFechaAdm, @nClaTurno, @nClaAreaProduccion)
	
	--Si el fin de turno no ha ocurrido el limite es mi fecha actual
	IF (@tFechaFinTurno > GETDATE())
	BEGIN
		SET @tFechaFinTurno = GETDATE()
	END

	IF @pnDebug = 1
	BEGIN
		SELECT *
		FROM [AswSch].[AswBitBitacoraParo] p
		JOIN [AswSch].[AswCatWorkUnitVw] m
			ON p.IdComponente = m.ClaMaquina
				AND ClaTipoMaquina = 3--solo collator
		WHERE IdWorkCenter = @psIdCelda
			AND FechaAdmSCADA = @tFechaAdm
			AND ClaTurno = @nClaTurno
	
	END

	SELECT COUNT(CASE MicroParoSN WHEN 0 THEN IdParo END) AS NoParos
		,COUNT(CASE MicroParoSN WHEN 1 THEN IdParo END) AS NoMicroParos
		,SUM(CASE MicroParoSN WHEN 0 
			THEN CASE WHEN FechaHoraFinal > '1900-01-01' 
				THEN
					DuracionSegundos
				ELSE
					DATEDIFF(SECOND, FechaHoraInicial, @tFechaFinTurno)
				END
			END)/60.0/60.0 AS TiempoParos
		,SUM(CASE MicroParoSN WHEN 1
			THEN CASE WHEN FechaHoraFinal > '1900-01-01' 
				THEN
					DuracionSegundos
				ELSE
					DATEDIFF(SECOND, FechaHoraInicial, @tFechaFinTurno)
				END
			END)/60.0 AS TiempoMicroParos
		,CAST(COALESCE(COUNT(CASE WHEN MicroParoSN = 0 AND ClaSeccionParo <> @nJustificacionDefault THEN IdParo END), 0) AS VARCHAR) + ' / '+
				CAST(COALESCE(COUNT(CASE WHEN MicroParoSN = 0 THEN IdParo END) ,0) AS VARCHAR)
			 AS RatioJustificacion	
		,CASE WHEN COUNT(CASE WHEN MicroParoSN = 0 THEN IdParo END) <> 0
			THEN COUNT(CASE WHEN MicroParoSN = 0 AND ClaSeccionParo <> @nJustificacionDefault THEN IdParo END) 
				/CAST(COUNT(CASE WHEN MicroParoSN = 0 THEN IdParo END) AS FLOAT)*100
			END AS PorcentajeJustificacion		
	FROM [AswSch].[AswBitBitacoraParo] p
	JOIN [AswSch].[AswCatWorkUnitVw] m
		ON p.IdComponente = m.ClaMaquina
			AND ClaTipoMaquina = 3--solo collator
	WHERE IdWorkCenter = @psIdCelda
		AND FechaAdmSCADA = @tFechaAdm
		AND ClaTurno = @nClaTurno
		--AND MicroParoSN = 0
END
