--USE [ASW]
--GO
/****** Object:  StoredProcedure [AswSch].[ASW_CU601_Pag1_ObtenerAvanceProduccion]    Script Date: 15/11/2022 03:37:05 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- EXEC [AswSch].[ASW_CU305_Pag1_ObtenerTiempo] 68, '2022-06-27T12:00:00Z', '2022-06-27T21:59:21Z' , 34, 1, 0
-- EXEC  [AswSch].[ASW_CU305_Pag1_ObtenerTiempo] $ClaUbicacion, '${__from:date}', '${__to:date}', $Cell, 1
ALTER PROC [AswSch].[ASW_CU601_Pag1_ObtenerAvanceProduccion]
	@pnClaUbicacion INT
	,@ptFechaDesde DATETIME
	,@ptFechaHasta DATETIME
	,@psIdCelda VARCHAR(30)
	,@pnClaTurno INT 
	,@pnTiempoUTC INT = 0
	,@pnDebug INT = 0
AS
BEGIN	
	DECLARE
		@nClaAreaProduccion INT
		,@tFechaAdm DATETIME
		,@tFechaInicioTurno DATETIME
		,@tFechaFinTurno DATETIME
		,@nOrdenProduccion VARCHAR(100)
		,@nPorcentajeProd VARCHAR(100)
		,@nStringProduccion VARCHAR(100)
		,@nIdComponente VARCHAR(30) 
		,@nUnidad INT
		,@nUnidadesProgramadas INT

	IF @pnTiempoUTC = 1
	BEGIN
		SET @ptFechaHasta = dateadd(hh, datediff(hh, getutcdate(), getdate()), @ptFechaHasta)
	END

	SELECT @nClaAreaProduccion = ClaDepartamento 
	FROM [AswSch].[AswCatWorkCenterVw]
	WHERE IdWorkCenter = @psIdCelda

	--obtengo fecha
	SET @tFechaAdm = [AswSch].[ASWGetFechaAdm] (@pnClaUbicacion, @nClaAreaProduccion, @ptFechaHasta)

	--obtengo el inicio y fin de turno para la fecha consultada
	SET @tFechaInicioTurno = [AswSch].[ASWGetInicioTurno](@pnClaUbicacion, @tFechaAdm, @pnClaTurno, @nClaAreaProduccion)
	SET @tFechaFinTurno = [AswSch].[ASWGetFinTurno](@pnClaUbicacion, @tFechaAdm, @pnClaTurno, @nClaAreaProduccion)

	SET @nIdComponente = (SELECT ClaMaquina
	FROM [AswSch].[AswCatWorkUnitVw] 
	WHERE IdWorkCenter = @psIdCelda AND ClaTipoMaquina = 6
	)

	SET @nOrdenProduccion = (SELECT TOP 1 a.ClavePO
	FROM [AswSch].[ASWTraOrdenProduccion] a
	INNER JOIN [AswSch].[ASWTraOrdenProduccionDet] b ON a.IdPO = b.IdPO
	WHERE b.EsTerminado = 1 AND b.IdComponente = @nIdComponente
	AND b.FechaInicioReal BETWEEN @tFechaInicioTurno  AND @tFechaFinTurno ORDER BY b.FechaInicioReal DESC)

	SET @nUnidad = (SELECT TOP 1 b.IdUnidad 
	FROM [AswSch].[ASWTraOrdenProduccion] a
	INNER JOIN [AswSch].[ASWTraOrdenProduccionDet] b ON a.IdPO = b.IdPO
	WHERE b.EsTerminado = 1 AND b.IdComponente = @nIdComponente
	AND b.FechaInicioReal BETWEEN @tFechaInicioTurno  AND @tFechaFinTurno ORDER BY b.FechaInicioReal DESC)

	SET @nUnidadesProgramadas = (SELECT TOP 1 a.UnidadesProgramadas
	FROM [AswSch].[ASWTraOrdenProduccion] a
	INNER JOIN [AswSch].[ASWTraOrdenProduccionDet] b ON a.IdPO = b.IdPO
	WHERE b.IdComponente = @nIdComponente AND a.ClaEstatus = 2)


	SET @nPorcentajeProd = (@nUnidad*100)/@nUnidadesProgramadas

	SET @nStringProduccion = 'WO: #'+CONVERT(VARCHAR,@nOrdenProduccion)+'  '+CONVERT(VARCHAR,@nPorcentajeProd)+'%'
	 
	
	IF @nOrdenProduccion IS NULL 
		SET @nStringProduccion = 'No production registered'
	ELSE
		SET @nStringProduccion = 'WO: #'+CONVERT(VARCHAR,@nOrdenProduccion)+'  '+CONVERT(VARCHAR,@nPorcentajeProd)+'%'
	
	SELECT @nStringProduccion AS 'Produccion'

END

