--USE [ASW]
--GO
/****** Object:  StoredProcedure [AswSch].[ASW_CU304_Pag1_ObtenerEGE]    Script Date: 15/11/2022 02:28:05 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- EXEC [AswSch].[ASW_CU304_Pag1_ObtenerEGE] 68, '2022-06-23 13:22:00', 34, 1
ALTER PROC [AswSch].[ASW_CU304_Pag1_ObtenerEGE]
	@pnClaUbicacion INT
	,@ptFecha DATETIME
	,@psIdCelda VARCHAR(30)
	,@pnDebug INT = 0
AS
BEGIN

	SET @ptFecha = COALESCE(@ptFecha, GETDATE())
	--si no hay turno devolver ultimo turno o 0s?
	--corregir paso de parametro fecha

	SELECT IdWorkCenter AS IdCelda
		,ClaDepartamento AS ClaDepartamento
		,ClaArea AS ClaArea
		,@ptFecha AS Fecha 
		,[AswSch].[ASWGetTurno] (@pnClaUbicacion, ClaDepartamento, @ptFecha) AS ClaTurno
		,[AswSch].[ASWGetFechaAdm] (@pnClaUbicacion, ClaDepartamento, @ptFecha) AS FechaAdm
	INTO #Celda
	FROM [AswSch].[AswCatWorkCenterVw]
	WHERE IdWorkCenter = @psIdCelda

	SELECT IdCelda 
		,[AswSch].[ASWGetInicioTurno](@pnClaUbicacion, FechaAdm, c.ClaTurno, ClaDepartamento) AS InicioTurno
		,[AswSch].[ASWGetFinTurno](@pnClaUbicacion, FechaAdm, c.ClaTurno, ClaDepartamento) AS FinTurno
		,Duracion
		,Duracion AS RunHrs
	INTO #Turno
	FROM #Celda c
	JOIN [AswSch].[AswCatTurno] t
		ON c.ClaTurno = t.ClaTurno
		
	UPDATE #Turno
	SET RunHrs = CASE WHEN GETDATE()>InicioTurno THEN DATEDIFF(Minute, InicioTurno, GETDATE())/60.0 ELSE 0 END
	WHERE GETDATE()<FinTurno

	IF (@pnDebug = 1)
	BEGIN
		select * from #Celda
		select * from #Turno
	END
	
	/*
	Availability= run hrs/Schedule hrs
	TDT = Total downtimes
	NADT = non-affecting downtimes

	Run hrs = (duration of shift * #Arms) – (TDT Arm A + TDT Arm B)
	Schedule hrs = (duration of shift * #Arms) – (NADT Arm A + NADT Arm B)


	* non-affecting downtimes (EsNoAplicaAprovechamiento = 1)

	*/
	SELECT IdWorkCenter AS IdCelda,
		SUM(CASE WHEN FechaHoraFinal>'1900-01-01 00:00:00.000' THEN DuracionSegundos 
			ELSE DATEDIFF(second, FechaHoraInicial, GETDATE()) END
			)/60.0/60.0 AS TiempoParo,
		SUM(CASE rtg.EsNoAplicaAprovechamiento WHEN 1 
			THEN CASE WHEN FechaHoraFinal>'1900-01-01 00:00:00.000' 
					THEN DuracionSegundos 
					ELSE DATEDIFF(second, FechaHoraInicial, GETDATE()) END 
			ELSE 0 END) AS TiempoParoNoAfecta
	INTO #Paros
	FROM #Celda c 
	JOIN [AswSch].[AswCatWorkUnitVw] m
		ON c.IdCelda = m.IdWorkCenter
		AND m.ClaTipoMaquina = 3
	JOIN [AswSch].[AswBitBitacoraParo] bp
		ON m.ClaMaquina = bp.IdComponente
		AND c.FechaAdm = bp.FechaAdmSCADA
		AND c.ClaTurno = bp.ClaTurno
	LEFT JOIN [AswSch].[AswCatSeccionParo] sp
		ON bp.ClaSeccionParo = sp.ClaSeccionParo
	LEFT JOIN [AswSch].[ASWRelTipoParoGpoParo] rtg
		ON SP.IdTipoParoGpoParo = rtg.IdTipoParoGpoParo
		AND SP.ClaSeccionParo   = rtg.ClaTipoParo
	WHERE bp.ClaUbicacion = @pnClaUbicacion
	GROUP BY IdWorkCenter

	IF (@pnDebug = 1)
	BEGIN
		select * from #Paros
		select * 
		FROM #Celda c 
	JOIN [AswSch].[AswCatWorkUnitVw] m
		ON c.IdCelda = m.IdWorkCenter
		AND m.ClaTipoMaquina = 3
	JOIN [AswSch].[AswBitBitacoraParo] bp
		ON m.ClaMaquina = bp.IdComponente
		AND c.FechaAdm = bp.FechaAdmSCADA
		AND c.ClaTurno = bp.ClaTurno
	LEFT JOIN [AswSch].[AswCatSeccionParo] sp
		ON bp.ClaSeccionParo = sp.ClaSeccionParo
	LEFT JOIN [AswSch].[ASWRelTipoParoGpoParo] rtg
		ON SP.IdTipoParoGpoParo = rtg.IdTipoParoGpoParo
		AND SP.ClaSeccionParo   = rtg.ClaTipoParo
	WHERE bp.ClaUbicacion = @pnClaUbicacion
	ORDER BY FechaHoraInicial
	END

	/*
	Performance = produced boxes/ expected boxes

	Produced boxes = produced boxes Arm A + produced boxes Arm B
	Capacity (boxes/hr) = 60 min * if supercell SUM(NPM); else NPM * Wafios 
	Expected boxes = Capacity * RunHrs

	Cell 1:
	Capacity: 240,120 nails/hr
	box: 9000 nails/box (acording to ítem description)
	Capacity in boxes: 26.68 boxes/hr

	*/

	SELECT pd.IdCelda
		--,COUNT(distinct IdCaja) AS Cajas
		,SUM(CASE WHEN ClavosFin-ClavosInicio< 0 THEN 0 ELSE ClavosFin-ClavosInicio END) AS Clavos
		,MAX((COALESCE(NPM,0)+COALESCE(NPM2,0)+COALESCE(NPM3,0))*CantWafios*60.0) AS Capacidad
		,SUM(CASE ClaveCorte WHEN 'FINCAJA' THEN a.Peso ELSE 0 END) AS Peso
	INTO #Produccion
	FROM #Celda ct
	JOIN [AswSch].[AswBitBitacoraProduccion]  pd
		ON ct.IdCelda = pd.IdCelda
		AND ct.FechaAdm = pd.FechaAdm
		AND ct.ClaTurno = pd.ClaTurno
	JOIN [AswSch].[AswCatWorkCenterVw] c
		ON pd.IdCelda = c.IdWorkCenter
	LEFT JOIN [AswSch].[AswCatArticuloGeneral] a
		ON pd.ClaArticulo = a.ClaArticulo
	WHERE pd.ClaUbicacion = @pnClaUbicacion
		AND pd.DuracionSegundos>=0
	--AND m.ClaCelda = 112
	GROUP BY pd.IdCelda


	/*
	Quality = 1 – (scrap/produced boxes * weigth per box)

	Requires scrap entry per PO or comunication to visión system

	*/
	
	SELECT c.IdCelda,
		SUM(peso) AS Scrap
	INTO #Scrap
	FROM #Celda c
	JOIN [AswSch].[ASWTraScrap] s
		ON c.IdCelda = s.IdCelda
		AND c.FechaAdm = s.FechaAdmScada
		AND c.ClaTurno = s.ClaTurno
	WHERE BajaLogica = 0
	GROUP BY c.IdCelda

	--SELECT * FROM #Produccion
	--SELECT * FROM #Scrap

	SELECT CASE WHEN COALESCE(RunHrs - TiempoParoNoAfecta,0) = 0 THEN 0 ELSE (RunHrs - TiempoParo)/(RunHrs - TiempoParoNoAfecta)*100.0 END AS Availability
		,CASE WHEN COALESCE(Capacidad*RunHrs,0) = 0 THEN 0 ELSE Clavos/(Capacidad*RunHrs)*100.0 END AS Performance
		,CASE WHEN COALESCE(Peso,0) = 0 THEN 100 ELSE 100 - (COALESCE(Scrap,0)/Peso*100.0) END AS Quality
	INTO #OEE
	FROM #Turno t
	LEFT JOIN #Paros p
		ON t.IdCelda = p.IdCelda
	LEFT JOIN #Produccion c
		ON t.IdCelda = c.IdCelda
	LEFT JOIN #Scrap s
		ON t.IdCelda = s.IdCelda

	SELECT Availability*Performance*Quality/10000 AS OEE
		,FLOOR(Availability) AS Availability
		,Performance
		,Quality
		--,@ptFecha AS Fecha
		--,@psIdCelda AS Celda
	FROM #OEE
END
