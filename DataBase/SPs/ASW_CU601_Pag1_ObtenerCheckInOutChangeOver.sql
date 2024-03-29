--USE [ASW]
--GO
/****** Object:  StoredProcedure [AswSch].[ASW_CU601_Pag1_ObtenerCheckInOutChangeOver]    Script Date: 15/11/2022 03:38:01 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- EXEC [AswSch].[ASW_CU305_Pag1_ObtenerTiempo] 68, '2022-06-27T12:00:00Z', '2022-06-27T21:59:21Z' , 34, 1, 0
-- EXEC  [AswSch].[ASW_CU305_Pag1_ObtenerTiempo] $ClaUbicacion, '${__from:date}', '${__to:date}', $Cell, 1
ALTER PROC [AswSch].[ASW_CU601_Pag1_ObtenerCheckInOutChangeOver]
	@pnClaUbicacion INT
	,@ptFechaDesde DATETIME
	,@ptFechaHasta DATETIME
	,@psIdCelda VARCHAR(30)
	,@pnClaTurno INT 
	,@pnTiempoUTC INT = 0
	,@pnDebug INT = 0
AS
BEGIN

	--SET @ptFechaHasta = COALESCE(@ptFechaHasta, GETDATE())
	--si no hay turno devolver ultimo turno o 0s?
	
	DECLARE
		@nClaAreaProduccion INT
		,@tFechaAdm DATETIME
		,@tFechaInicioTurno DATETIME
		,@tFechaFinTurno DATETIME
		,@tFechaInicioTurnoAnterior DATETIME
		,@tFechaFinTurnoAnterior DATETIME
		,@tFechaTurnoAnterior DATETIME
		,@nClaTurnoAnterior INT
		,@nLastCheckIn VARCHAR(100)
		,@nLastCheckOut VARCHAR(100)
		,@nChangeOver VARCHAR(100)
		,@nCheckOutAnt VARCHAR(100)
		
		

	IF @pnTiempoUTC = 1
	BEGIN
		SET @ptFechaHasta = dateadd(hh, datediff(hh, getutcdate(), getdate()), @ptFechaHasta)
	END

	SET @nClaTurnoAnterior = (SELECT ClaTurno FROM [AswSch].[AswCatTurno] WHERE (ClaTurno <> @pnClaTurno AND ClaTurno <> 2 AND ClaTurno <> -1))

	
 
	SELECT @nClaAreaProduccion = ClaDepartamento 
	FROM [AswSch].[AswCatWorkCenterVw]
	WHERE IdWorkCenter = @psIdCelda

	--obtengo fecha
	SET @tFechaAdm = [AswSch].[ASWGetFechaAdm] (@pnClaUbicacion, @nClaAreaProduccion, @ptFechaHasta)

	IF @nClaTurnoAnterior = 3
		SET @tFechaTurnoAnterior =(SELECT DATEADD(day, -1, @tFechaAdm))
	ELSE IF @nClaTurnoAnterior = 1
		SET @tFechaTurnoAnterior = @tFechaAdm

	--obtengo el inicio y fin de turno para la fecha consultada
	SET @tFechaInicioTurno = [AswSch].[ASWGetInicioTurno](@pnClaUbicacion, @tFechaAdm, @pnClaTurno, @nClaAreaProduccion)
	SET @tFechaFinTurno = [AswSch].[ASWGetFinTurno](@pnClaUbicacion, @tFechaAdm, @pnClaTurno, @nClaAreaProduccion)

	--obtengo el inicio y fin de turno para la fecha del turno anterior
	SET @tFechaInicioTurnoAnterior = [AswSch].[ASWGetInicioTurno](@pnClaUbicacion, @tFechaTurnoAnterior, @nClaTurnoAnterior, @nClaAreaProduccion)
	SET @tFechaFinTurnoAnterior = [AswSch].[ASWGetFinTurno](@pnClaUbicacion, @tFechaTurnoAnterior, @nClaTurnoAnterior, @nClaAreaProduccion)
	
	SET @nLastCheckIn = (SELECT TOP 1 
		FechaUltimaMod AS 'Last Check In'
	FROM [AswSch].[TraReporteProduccionMCSW]
	WHERE IdCelda = @psIdCelda
		AND ClaTurno = @pnClaTurno  AND FechaUltimaMod BETWEEN @tFechaInicioTurno AND @tFechaFinTurno
		AND EsManual = 1 AND ClaTipoRegistro = 1 AND Evento = 'CheckIn'
	ORDER BY FechaUltimaMod DESC)

	IF @nLastCheckIn IS NULL 
		SET @nLastCheckIn = 'NONE'
	ELSE
		SET @nLastCheckIn = (SELECT CONVERT(VARCHAR, @nLastCheckIn, 120))


	SET @nLastCheckOut = (SELECT TOP 1 
		FechaUltimaMod AS 'Last Check Out'
	FROM [AswSch].[TraReporteProduccionMCSW]
	WHERE IdCelda = @psIdCelda
		AND ClaTurno = @pnClaTurno AND FechaUltimaMod BETWEEN @tFechaInicioTurno AND @tFechaFinTurno
		AND EsManual = 1 AND ClaTipoRegistro = 3 AND Evento = 'CheckOut'
	ORDER BY FechaUltimaMod DESC)

	IF @nLastCheckOut IS NULL 
		SET @nLastCheckOut = 'NONE'
	ELSE
		SET @nLastCheckOut = (SELECT CONVERT(VARCHAR, @nLastCheckOut, 120))

	

	SET @nChangeOver = (SELECT TOP 1 
		FechaUltimaMod AS 'Last Check Out'
	FROM [AswSch].[TraReporteProduccionMCSW]
	WHERE IdCelda = @psIdCelda
		AND ClaTurno = @pnClaTurno  AND FechaUltimaMod BETWEEN @tFechaInicioTurno AND @tFechaFinTurno
		AND EsManual = 1 AND ClaTipoRegistro = 1 AND Evento = 'ChangeOver'
	ORDER BY FechaUltimaMod DESC)

	IF @nChangeOver IS NULL 
		SET @nChangeOver = 'NONE'
	ELSE
		SET @nChangeOver = (SELECT CONVERT(VARCHAR, @nChangeOver, 120))

	SET @nCheckOutAnt = (SELECT TOP 1 
		FechaUltimaMod AS 'Check Out Turno Anterior'
	FROM [AswSch].[TraReporteProduccionMCSW]
	WHERE IdCelda = @psIdCelda
		AND ClaTurno = @nClaTurnoAnterior  AND FechaUltimaMod BETWEEN @tFechaInicioTurnoAnterior AND @tFechaFinTurnoAnterior
		AND EsManual = 1 AND ClaTipoRegistro = 1 AND Evento = 'ChangeOver'
	ORDER BY FechaUltimaMod DESC)

	IF @nCheckOutAnt IS NULL 
		SET @nCheckOutAnt = 'NONE'
	ELSE
		SET @nCheckOutAnt = (SELECT CONVERT(VARCHAR, @nCheckOutAnt, 120))

	SELECT @nLastCheckIn AS 'Last Check In', @nLastCheckOut AS 'Last Check Out', @nChangeOver AS 'Last Change Over', @nCheckOutAnt AS 'Previous Shift Check Out'


END

