--USE [ASW]
--GO
/****** Object:  StoredProcedure [AswSch].[ASW_CU601_Pag1_AppMonitor]    Script Date: 15/11/2022 03:30:21 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- EXEC [AswSch].[ASW_CU305_Pag1_ObtenerTiempo] 68, '2022-06-27T12:00:00Z', '2022-06-27T21:59:21Z' , 34, 1, 0
-- EXEC  [AswSch].[ASW_CU305_Pag1_ObtenerTiempo] $ClaUbicacion, '${__from:date}', '${__to:date}', $Cell, 1
ALTER PROC [AswSch].[ASW_CU601_Pag1_AppMonitor]
	@pnClaUbicacion INT
	,@ptFechaDesde DATETIME
	,@ptFechaHasta DATETIME
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
		

	IF @pnTiempoUTC = 1
	BEGIN
		SET @ptFechaHasta = dateadd(hh, datediff(hh, getutcdate(), getdate()), @ptFechaHasta)
	END

	SET @nClaTurnoAnterior = (SELECT ClaTurno FROM [AswSch].[AswCatTurno] WHERE (ClaTurno <> @pnClaTurno AND ClaTurno <> 2 AND ClaTurno <> -1))

	
 
	SELECT @nClaAreaProduccion = ClaDepartamento 
	FROM [AswSch].[AswCatWorkCenterVw]
	WHERE IdWorkCenter IN (26,28,29,30,31,33,34,35,37,38,106,110,112)

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

	SELECT IdWorkCenter, ClaveWorkCenter
	INTO #Celdas
	FROM [AswSch].[AswCatWorkCenterVw]
	WHERE IdWorkCenter IN (26,28,29,30,31,33,34,35,37,38,106,110,112)

	SELECT IdCelda, MAX(FechaUltimaMod) AS 'Fecha'
	INTO #CheckInTable
	FROM [AswSch].[TraReporteProduccionMCSW]
	WHERE  IdCelda IN (26,28,29,30,31,33,34,35,37,38,106,110,112)
		AND ClaTurno = @pnClaTurno  AND FechaUltimaMod >= @tFechaInicioTurno AND FechaUltimaMod <= @tFechaFinTurno
		AND EsManual = 1 AND ClaTipoRegistro = 1 AND Evento = 'CheckIn'
	GROUP BY IdCelda ORDER BY IdCelda

	SELECT IdCelda, MAX(FechaUltimaMod) AS 'Fecha'
	INTO #CheckOutTable 
	FROM [AswSch].[TraReporteProduccionMCSW]
	WHERE  IdCelda IN (26,28,29,30,31,33,34,35,37,38,106,110,112)
		AND ClaTurno = @pnClaTurno AND FechaUltimaMod >= @tFechaInicioTurno AND FechaUltimaMod <= @tFechaFinTurno
		AND EsManual = 1 AND ClaTipoRegistro = 3 AND Evento = 'CheckOut'
	GROUP BY IdCelda ORDER BY IdCelda

	SELECT IdCelda, MAX(FechaUltimaMod) AS 'Fecha'
	INTO #ChangeOverTable
	FROM [AswSch].[TraReporteProduccionMCSW]
	WHERE  IdCelda IN (26,28,29,30,31,33,34,35,37,38,106,110,112)
		AND ClaTurno = @pnClaTurno  AND FechaUltimaMod >= @tFechaInicioTurno AND FechaUltimaMod <= @tFechaFinTurno
		AND EsManual = 1 AND ClaTipoRegistro = 1 AND Evento = 'ChangeOver'
	GROUP BY IdCelda ORDER BY IdCelda

	SELECT IdCelda, MAX(FechaUltimaMod) AS 'Fecha'
	INTO #CheckOutAntTable
	FROM [AswSch].[TraReporteProduccionMCSW]
	WHERE  IdCelda IN (26,28,29,30,31,33,34,35,37,38,106,110,112)
		AND ClaTurno = @nClaTurnoAnterior  AND FechaUltimaMod >= @tFechaInicioTurnoAnterior AND FechaUltimaMod <= @tFechaFinTurnoAnterior
		AND EsManual = 1 AND ClaTipoRegistro = 1 AND Evento = 'CheckOut'
	GROUP BY IdCelda ORDER BY IdCelda

	SELECT COUNT(*) AS Cantidad,IdWorkCenter
	INTO #ParosTotales
	FROM [AswSch].[AswBitBitacoraParo] p
		JOIN [AswSch].[AswCatWorkUnitVw] m
			ON p.IdComponente = m.ClaMaquina
			AND ClaTipoMaquina = 3
	WHERE IdWorkCenter IN (26,28,29,30,31,33,34,35,37,38,106,110,112)
		AND p.FechaHoraInicial >= @tFechaInicioTurno AND p.FechaHoraInicial <= @tFechaFinTurno
		AND p.ClaTurno = @pnClaTurno 
		GROUP BY IdWorkCenter ORDER BY IdWorkCenter 

	SELECT COUNT(*) AS Cantidad,IdWorkCenter
	INTO #ParosJustificados
	FROM [AswSch].[AswBitBitacoraParo] p
		JOIN [AswSch].[AswCatWorkUnitVw] m
			ON p.IdComponente = m.ClaMaquina
			AND ClaTipoMaquina = 3
	WHERE IdWorkCenter IN (26,28,29,30,31,33,34,35,37,38,106,110,112)
		AND p.FechaHoraInicial >= @tFechaInicioTurno AND p.FechaHoraInicial <= @tFechaFinTurno
		AND p.ClaTurno = @pnClaTurno 
		AND (p.ClaEventoJustificacion = 2 OR p.ClaEventoJustificacion = 1) AND p.ClaSeccionParo <> 184 AND p.ClaSeccionParo <> 185 
		GROUP BY IdWorkCenter ORDER BY IdWorkCenter 
	
	SELECT COUNT(*) AS Cantidad,IdWorkCenter
	INTO #Andons
	FROM [AswSch].[AswBitAndon] p
		JOIN [AswSch].[AswCatWorkUnitVw] m
		ON p.IdComponente = m.ClaMaquina
	AND (ClaTipoMaquina = 1 OR ClaTipoMaquina = 2 OR ClaTipoMaquina = 3 OR ClaTipoMaquina = 6)
	WHERE IdWorkCenter IN (26,28,29,30,31,33,34,35,37,38,106,110,112)
	AND FechaAdmSCADA = @tFechaAdm
	AND ClaTurno = @pnClaTurno
	GROUP BY IdWorkCenter ORDER BY IdWorkCenter 

	SELECT IdCelda,SUM(Peso) AS Peso
	INTO #Scrap
	FROM [AswSch].[ASWTraScrap]
	WHERE IdCelda IN(26,28,29,30,31,33,34,35,37,38,106,110,112)
	AND ClaTurno = @pnClaTurno  AND FechaAdmScada = @tFechaAdm
	GROUP BY IdCelda ORDER BY IdCelda

	SELECT IdWorkCenter AS IdCelda, ClaMaquina AS IdComponente
	INTO #Robots
	FROM [AswSch].[AswCatWorkUnitVw] 
	WHERE IdWorkCenter IN (26,28,29,30,31,33,34,35,37,38,106,110,112) AND ClaTipoMaquina = 6
	
	SELECT COUNT(*) AS Cantidad, IdComponente, IdPO
	INTO #CajasProducidas
	FROM [AswSch].[ASWTraOrdenProduccionDet]
	WHERE EsTerminado = 1 AND FechaInicioReal >= @tFechaInicioTurno AND FechaInicioReal <= @tFechaFinTurno
	GROUP BY IdComponente,IdPO ORDER BY IdComponente, IdPO
	
	SELECT MAX(a.FechaInicioReal) AS Fecha, a.IdPO, b.ClavePO, b.UnidadesProducidas AS Produccion, b.UnidadesProgramadas AS Unidades, c.IdComponente, c.IdCelda, cp.Cantidad AS Cajas
	INTO #DatosProduccion
	FROM [AswSch].[ASWTraOrdenProduccionDet] a
	INNER JOIN [AswSch].[ASWTraOrdenProduccion] b
	ON a.IdPO = b.IdPO
	INNER JOIN #Robots c
    ON a.IdComponente=c.IdComponente
	INNER JOIN #CajasProducidas cp
	ON a.IdComponente = cp.IdComponente
	AND a.IdPO = cp.IdPO
	WHERE a.EsTerminado=1 AND a.FechaInicioReal >=@tFechaInicioTurno AND a.FechaInicioReal <= @tFechaFinTurno
	GROUP BY a.IdComponente,a.IdPO,b.ClavePO,b.UnidadesProducidas,b.UnidadesProgramadas, c.IdComponente ,c.IdCelda, cp.Cantidad
	ORDER BY a.IdComponente, a.IdPO,b.ClavePO,c.IdComponente,c.IdCelda, cp.Cantidad

	

	SELECT c.IdCelda AS IdCelda, nj.Cantidad AS Totales, j.Cantidad AS Justificados  
	INTO #AuxParos
	FROM #Celdas c
	LEFT JOIN #ParosTotales nj
		ON c.IdCelda = nj.ClaCelda
	LEFT JOIN #ParosJustificados j
		ON c.IdCelda = j.ClaCelda


	SELECT c.ClaveCelda AS Cell, 
	CASE WHEN i.Fecha IS NULL THEN 'None' ELSE CONVERT(VARCHAR,DATEADD(second, DATEDIFF(second, GETDATE(), GETUTCDATE()), i.Fecha),108) END AS 'CheckIn', 
	CASE WHEN o.Fecha IS NULL THEN 'None' ELSE CONVERT(VARCHAR,DATEADD(second, DATEDIFF(second, GETDATE(), GETUTCDATE()), o.Fecha),108) END AS 'Checkout', 
	CASE WHEN co.Fecha IS NULL THEN 'None' ELSE CONVERT(VARCHAR,DATEADD(second, DATEDIFF(second, GETDATE(), GETUTCDATE()), co.Fecha),108) END AS 'ChangeOver', 
	CASE WHEN ant.Fecha IS NULL THEN 'None' ELSE CONVERT(VARCHAR,DATEADD(second, DATEDIFF(second, GETDATE(), GETUTCDATE()), ant.Fecha),108) END AS 'Previous Shift Checkout',
	CASE WHEN ap.Justificados IS NULL AND ap.Totales IS NULL THEN CONVERT(VARCHAR,0)+'/'+CONVERT(VARCHAR,0) 
		 WHEN ap.Justificados IS NULL AND ap.Totales IS NOT NULL THEN CONVERT(VARCHAR,0)+'/'+CONVERT(VARCHAR,ap.Totales) 
	ELSE CONVERT(VARCHAR,ap.Justificados)+'/'+CONVERT(VARCHAR,ap.Totales) END AS 'Downtimes', 
	CASE WHEN aa.Cantidad IS NULL THEN 0 ELSE aa.Cantidad END AS 'Andons', 
	CASE WHEN s.Peso IS NULL THEN 0 ELSE s.Peso END AS 'Scrap (lbs)',
	CASE WHEN dp.Unidades IS NULL THEN 'No production registered' ELSE 'WO: #'+CONVERT(VARCHAR,dp.ClavePO)+' '+CONVERT(VARCHAR,Cajas)+' Boxes' END AS 'Production'
	INTO #TablaFinalCantidades
	FROM #Celdas c 
	LEFT JOIN #CheckInTable i
	ON c.IdCelda = i.IdCelda
	LEFT JOIN #CheckOutTable o
	ON c.IdCelda = o.IdCelda
	LEFT JOIN #ChangeOverTable co
	ON c.IdCelda = co.IdCelda
	LEFT JOIN #CheckOutAntTable ant
	ON c.IdCelda = ant.IdCelda
	LEFT JOIN #AuxParos ap
	ON c.IdCelda = ap.IdCelda
	LEFT JOIN #Andons aa
	ON c.IdCelda = aa.ClaCelda
	LEFT JOIN #Scrap s
	ON c.IdCelda = s.IdCelda
	LEFT JOIN #DatosProduccion dp
	ON c.IdCelda = dp.IdCelda


	SELECT * FROM #TablaFinalCantidades

	

END

