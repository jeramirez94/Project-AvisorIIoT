--USE [ASW]
--GO
/****** Object:  StoredProcedure [AswSch].[ASW_CU305_Pag1_CalculaEGEJerarquico]    Script Date: 15/11/2022 02:36:52 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- EXEC [AswSch].[ASW_CU305_Pag1_CalculaEGEHora] 68, '2022-06-29 16:01:00', 1
DROP PROC [AswSch].[ASW_CU305_Pag1_CalculaEGEJerarquico]
--	@pnClaUbicacion INT
--	,@ptFecha DATETIME
--	,@pnDebug INT = 0
--	,@condicion VARCHAR(MAX)
--AS
--BEGIN
--SET NOCOUNT ON

--	DECLARE
--		@tFechaFin DATETIME

--	SET @ptFecha = COALESCE(@ptFecha, DATEADD(HOUR, -1, GETDATE()))
	
--	--solo hora
--	SET @ptFecha = DATEADD(HOUR, DATEDIFF(HOUR, '2000-01-01', @ptFecha), '2000-01-01')
--	SET @tFechaFin = DATEADD(HOUR, 1, @ptFecha)

--	--si aun no termina el periodo que se esta calculando
--	IF @tFechaFin > GETDATE()
--	BEGIN
--		SET @tFechaFin = GETDATE()
--	END

--	IF @pnDebug = 1
--	BEGIN
--		SELECT @ptFecha AS FechaInicial, @tFechaFin AS FechaFinal
--	END	
--	DECLARE @sql  NVARCHAR(max)

--	SET @sql = 'SELECT IdCelda
--		,ClaAreaProduccion AS ClaDepartamento
--		,NomAreaProduccion AS [NomDeapartamento]
--		,ClaTipoCelda AS ClaArea
--		,NomTipoCelda AS [NomArea]
--		,[ClaveCelda]
--		,Descripcion AS [NomCelda]
--		,CASE EsSuperCelda WHEN 1 THEN COALESCE(NPM,0) + COALESCE(NPM2,0) + COALESCE(NPM3,0) ELSE COALESCE(CantWafios,1)*COALESCE(NPM,0) END AS [Capacidad]
--		,[AswSch].[ASWGetFechaAdm] ('+CAST (@pnClaUbicacion AS  varchar(10))+', ClaAreaProduccion, @ptFecha) AS FechaAdm
--		,@ptFecha AS FechaReporte 
--		,DATEPART(HOUR, @ptFecha) AS Hora
--		,[AswSch].[ASWGetTurno] ('+CAST (@pnClaUbicacion AS  varchar(10))+', ClaAreaProduccion, @ptFecha) AS ClaTurno		
--	INTO #Celda
--	FROM [AswSch].[AswCatCeldas]
--	'+@condicion+'
	
--	--Condicion departamento, tipo celda, idcelda

--	--Quito celdas que no tienen turno en ese periodo
--	DELETE #Celda WHERE ClaTurno IS NULL OR ClaTurno = -1

--	SELECT IdCelda 
--		,[NomTurno]
--		,Duracion
--		,[AswSch].[ASWGetInicioTurno]('+CAST (@pnClaUbicacion AS  varchar(10))+', FechaAdm, c.ClaTurno, ClaDepartamento) AS InicioTurno
--		,[AswSch].[ASWGetFinTurno]('+CAST (@pnClaUbicacion AS  varchar(10))+', FechaAdm, c.ClaTurno, ClaDepartamento) AS FinTurno
--		,ROUND(DATEDIFF(MINUTE, [AswSch].[ASWGetInicioTurno]('+CAST (@pnClaUbicacion AS  varchar(10))+', FechaAdm, c.ClaTurno, ClaDepartamento), '''+CONVERT(VARCHAR(50), @tFechaFin, 120)+''')/60.0, 2) AS RunHrs
--		,ROUND(DATEDIFF(MINUTE, [AswSch].[ASWGetInicioTurno]('+CAST (@pnClaUbicacion AS  varchar(10))+', FechaAdm, c.ClaTurno, ClaDepartamento), '''+CONVERT(VARCHAR(50), @tFechaFin, 120)+''')/60.0, 2) * Capacidad * 60 AS CapacidadRunHrs
--	INTO #Turno
--	FROM #Celda c
--	JOIN [AswSch].[AswCatTurno] t
--		ON c.ClaTurno = t.ClaTurno
		
--	--UPDATE #Turno
--	--SET RunHrs = CASE WHEN GETDATE()>InicioTurno THEN DATEDIFF(Minute, InicioTurno, GETDATE())/60.0 ELSE 0 END
--	--WHERE GETDATE()<FinTurno

--	IF (@pnDebug = 1)
--	BEGIN
--		select * from #Celda
--		select * from #Turno
--	END

--	/*
--	Availability= run hrs/Schedule hrs
--	TDT = Total downtimes
--	NADT = non-affecting downtimes

--	Run hrs = (duration of shift * #Arms) – (TDT Arm A + TDT Arm B)
--	Schedule hrs = (duration of shift * #Arms) – (NADT Arm A + NADT Arm B)


--	* non-affecting downtimes (EsNoAplicaAprovechamiento = 1)

--	*/
--	SELECT ClaCelda AS IdCelda,
--		ROUND(SUM(CASE WHEN FechaHoraFinal>''1900-01-01 00:00:00.000'' AND  FechaHoraFinal<'''+CONVERT(VARCHAR(50), @tFechaFin, 120)+''' THEN DuracionSegundos 
--			ELSE DATEDIFF(second, FechaHoraInicial, '''+CONVERT(VARCHAR(50), @tFechaFin, 120)+''') END
--			)/60.0/60.0, 2) AS TiempoParo,
--		ROUND(SUM(CASE bp.MicroParoSN WHEN 1 
--			THEN CASE WHEN FechaHoraFinal>''1900-01-01 00:00:00.000'' AND  FechaHoraFinal<'''+CONVERT(VARCHAR(50), @tFechaFin, 120)+''' 
--					THEN DuracionSegundos 
--					ELSE DATEDIFF(second, FechaHoraInicial, '''+CONVERT(VARCHAR(50), @tFechaFin, 120)+''') END 
--			ELSE 0 END
--			)/60.0, 2) AS TiempoMicroParo, --MINUTOS
--		ROUND(SUM(CASE rtg.EsNoAplicaAprovechamiento WHEN 1 
--			THEN CASE WHEN FechaHoraFinal>''1900-01-01 00:00:00.000'' AND  FechaHoraFinal<'''+CONVERT(VARCHAR(50), @tFechaFin, 120)+'''
--					THEN DuracionSegundos 
--					ELSE DATEDIFF(second, FechaHoraInicial, '''+CONVERT(VARCHAR(50), @tFechaFin, 120)+''') END 
--			ELSE 0 END
--			)/60.0/60.0, 2) AS TiempoParoNoAfecta
--	INTO #Paros
--	FROM #Celda c 
--	JOIN [AswSch].[AswCatMaquina] m
--		ON c.IdCelda = m.ClaCelda
--		AND m.ClaTipoMaquina = 3
--	JOIN [AswSch].[AswBitBitacoraParo] bp
--		ON m.ClaMaquina = bp.IdComponente
--		AND c.FechaAdm = bp.FechaAdmSCADA
--		AND c.ClaTurno = bp.ClaTurno
--	LEFT JOIN [AswSch].[AswCatSeccionParo] sp
--		ON bp.ClaSeccionParo = sp.ClaSeccionParo
--	LEFT JOIN [AswSch].[ASWRelTipoParoGpoParo] rtg
--		ON SP.IdTipoParoGpoParo = rtg.IdTipoParoGpoParo
--		AND SP.ClaSeccionParo   = rtg.ClaTipoParo
--	WHERE bp.ClaUbicacion = '+CAST (@pnClaUbicacion AS  varchar(10))+'
--		AND FechaHoraInicial<'''+CONVERT(VARCHAR(50), @tFechaFin, 120)+'''
--	GROUP BY ClaCelda

--	IF (@pnDebug = 1)
--	BEGIN
--		select * from #Paros
--		--select * 
--		--	FROM #Celda c 
--		--JOIN [AswSch].[AswCatMaquina] m
--		--	ON c.IdCelda = m.ClaCelda
--		--	AND m.ClaTipoMaquina = 3
--		--JOIN [AswSch].[AswBitBitacoraParo] bp
--		--	ON m.ClaMaquina = bp.IdComponente
--		--	AND c.FechaAdm = bp.FechaAdmSCADA
--		--	AND c.ClaTurno = bp.ClaTurno
--		--LEFT JOIN [AswSch].[AswCatSeccionParo] sp
--		--	ON bp.ClaSeccionParo = sp.ClaSeccionParo
--		--LEFT JOIN [AswSch].[ASWRelTipoParoGpoParo] rtg
--		--	ON SP.IdTipoParoGpoParo = rtg.IdTipoParoGpoParo
--		--	AND SP.ClaSeccionParo   = rtg.ClaTipoParo
--		--WHERE bp.ClaUbicacion = '+CAST (@pnClaUbicacion AS  varchar(10))+'
--		--ORDER BY FechaHoraInicial
--	END

--	/*
--	Performance = produced boxes/ expected boxes

--	Produced boxes = produced boxes Arm A + produced boxes Arm B
--	Capacity (boxes/hr) = 60 min * if supercell SUM(NPM); else NPM * Wafios 
--	Expected boxes = Capacity * RunHrs

--	Cell 1:
--	Capacity: 240,120 nails/hr
--	box: 9000 nails/box (acording to ítem description)
--	Capacity in boxes: 26.68 boxes/hr

--	*/

--	SELECT pd.IdCelda
--		--,COUNT(distinct IdCaja) AS CajasId --no cuento la caja ''abierta''
--		,SUM(CASE ClaveCorte WHEN ''FINCAJA'' THEN 1 ELSE 0 END) AS Cajas
--		,SUM(CASE WHEN ClavosFin-ClavosInicio< 0 THEN 0 ELSE ClavosFin-ClavosInicio END) AS Clavos
--		,SUM(CASE ClaveCorte WHEN ''FINCAJA'' THEN a.Peso ELSE 0 END) AS PesoProducido
--		--Esta informacion solo corresponde cuando es solo un producto por hora
--		--todo: resolver cuando hay cambio de producto
--		--warning: no usar estas columnas en calculos
--		,MAX(a.[ClaArticulo]) AS [ClaArticulo]
--		,MAX([ClaveArticulo]) AS [ClaveArticulo]
--		,MAX([NomArticulo]) AS [NomArticulo]
--		,MAX([NomArticuloIngles]) AS [NomArticuloIngles]
--		,MAX([CajasSkid]) AS [CajasSkid]
--		,MAX([Peso]) AS [PesoCaja]
--		--fin
--	INTO #Produccion
--	FROM #Celda ct
--	JOIN [AswSch].[AswBitBitacoraProduccion]  pd
--		ON ct.IdCelda = pd.IdCelda
--		AND ct.FechaAdm = pd.FechaAdm
--		AND ct.ClaTurno = pd.ClaTurno
--	JOIN [AswSch].[AswCatCeldas] c
--		ON pd.IdCelda = c.IdCelda
--	LEFT JOIN [AswSch].[AswCatArticuloGeneral] a
--		ON pd.ClaArticulo = a.ClaArticulo
--	WHERE pd.ClaUbicacion = '+CAST (@pnClaUbicacion AS  varchar(10))+'
--		AND pd.DuracionSegundos>=0
--		AND FechaHoraInicio<'''+CONVERT(VARCHAR(50), @tFechaFin, 120)+'''
--	--AND m.ClaCelda = 112
--	GROUP BY pd.IdCelda

	
--	IF (@pnDebug = 1)
--	BEGIN
--		select * from #Produccion
--	END
	

--	/*
--	Quality = 1 – (scrap/produced boxes * weigth per box)

--	Requires scrap entry per PO or comunication to visión system

--	*/
	
--	SELECT c.IdCelda,
--		SUM(peso) AS PesoScrap
--	INTO #Scrap
--	FROM #Celda c
--	JOIN [AswSch].[ASWTraScrap] s
--		ON c.IdCelda = s.IdCelda
--		AND c.FechaAdm = s.FechaAdmScada
--		AND c.ClaTurno = s.ClaTurno
--	WHERE BajaLogica = 0
--	GROUP BY c.IdCelda

--	--SELECT * FROM #Produccion
--	IF (@pnDebug = 1)
--	BEGIN
--		SELECT * FROM #Scrap
		
--		SELECT * 
--		FROM #Turno t 
--		JOIN #Celda c
--			ON t.IdCelda = c.IdCelda
--		LEFT JOIN #Paros p
--			ON t.IdCelda = p.IdCelda
--		LEFT JOIN #Produccion pd
--			ON t.IdCelda = pd.IdCelda
--		LEFT JOIN #Scrap s
--			ON t.IdCelda = s.IdCelda

--	END

--	SELECT t.IdCelda
--		,CASE WHEN COALESCE(RunHrs - TiempoParoNoAfecta,0) = 0 THEN 0 ELSE (RunHrs - TiempoParo)/(RunHrs - TiempoParoNoAfecta)*100.0 END AS Availability
--		,CASE WHEN COALESCE(Capacidad*60*(RunHrs-p.TiempoParo),0) = 0 THEN 0 ELSE COALESCE(Clavos,0)/(Capacidad*60*(RunHrs-p.TiempoParo))*100.0 END AS Performance
--		,CASE WHEN COALESCE(PesoProducido,0) = 0 THEN 100 ELSE 100 - (COALESCE(PesoScrap,0)/PesoProducido*100.0) END AS Quality
--	INTO #APQ
--	FROM #Turno t
--	JOIN #Celda c
--		ON t.IdCelda = c.IdCelda
--	LEFT JOIN #Paros p
--		ON t.IdCelda = p.IdCelda
--	LEFT JOIN #Produccion pd
--		ON t.IdCelda = pd.IdCelda
--	LEFT JOIN #Scrap s
--		ON t.IdCelda = s.IdCelda

--	IF (@pnDebug = 1)
--	BEGIN
--	    print ''ultimo''
--		SELECT * FROM #APQ
--	END

--	SELECT IdCelda
--		,Availability*Performance*Quality/10000 AS OEE
--		,ROUND(Availability, 2) AS Availability
--		,ROUND(Performance, 2) AS Performance
--		,ROUND(Quality, 2) AS Quality
--	INTO #OEE
--	FROM #APQ

--	IF (@pnDebug = 1)
--	BEGIN
--	    print ''ultimo 1''
		
--	END

--	--Actualizo los registros actuales
--	UPDATE est
--	SET est.[ClaDepartamento] = c.[ClaDepartamento]
--		,est.[NomDeapartamento] = c.[NomDeapartamento]
--		,est.[ClaArea] = c.[ClaArea]
--		,est.[NomArea] = c.[NomArea]
--		,est.[ClaveCelda] = c.[ClaveCelda]
--		,est.[NomCelda] = c.[NomCelda]
--		,est.[Capacidad] = c.[Capacidad]
		
--		,est.[ClaTurno] = c.[ClaTurno]
--		,est.[NomTurno] = t.[NomTurno]
--		,est.[Duracion] = t.[Duracion]
--		,est.[InicioTurno] = t.[InicioTurno]
--		,est.[FinTurno] = t.[FinTurno]
--		,est.[RunHrs] = t.[RunHrs]
		
--		,est.[TiempoParo] = COALESCE(p.[TiempoParo], 0)
--		,est.[TiempoMicroParo] = COALESCE(p.[TiempoMicroParo], 0)
--		,est.[TiempoParoNoAfecta] = COALESCE(p.[TiempoParoNoAfecta], 0)
		
--		,est.[Cajas] = COALESCE(pd.[Cajas], 0)
--		,est.[Clavos] = pd.[Clavos]
--		,est.[PesoProducido] = pd.[PesoProducido]
		
--			--warning: no usar estas columnas en calculos
--		,est.[ClaArticulo] = pd.[ClaArticulo]
--		,est.[ClaveArticulo] = pd.[ClaveArticulo]
--		,est.[NomArticulo] = pd.[NomArticulo]
--		,est.[NomArticuloIngles] = pd.[NomArticuloIngles]
--		,est.[CajasSkid] = pd.[CajasSkid]
--		,est.[PesoCaja] = pd.[PesoCaja]
--			--fin warning
		
--		,est.[PesoScrap] = s.[PesoScrap]
		
--		,est.[Disponibilidad] = oee.[Availability]
--		,est.[Eficiencia] = oee.[Performance]
--		,est.[Calidad] = oee.[Quality]
--		,est.[Oee] = oee.[Oee]
		
--		,est.[FechaUltimaMod] = GETDATE()
--	FROM [AswSch].[AswEstEgeHora] est 
--	JOIN #Celda c
--		ON est.IdCelda = c.IdCelda
--		AND est.FechaReporte = c.FechaReporte
--	JOIN #Turno t
--		ON c.IdCelda = t.IdCelda
--	LEFT JOIN #Paros p
--		ON c.IdCelda = p.IdCelda
--	LEFT JOIN #Produccion pd
--		ON c.IdCelda = pd.IdCelda
--	LEFT JOIN #Scrap s
--		ON c.IdCelda = s.IdCelda
--	LEFT JOIN #OEE oee
--		ON c.IdCelda = oee.IdCelda

--    IF (@pnDebug = 1)
--	BEGIN

--	    print ''ultimo 2''
--		 SELECT ''SELECT FINALm''
--		   ,c.[IdCelda]
--           ,c.[ClaDepartamento]
--           ,c.[NomDeapartamento]
--           ,c.[ClaArea]
--           ,c.[NomArea]
--           ,c.[ClaveCelda]
--           ,c.[NomCelda]
--		   ,t.[RunHrs]
--           ,COALESCE(p.[TiempoParo], 0) as [TiempoParo]
--           ,COALESCE(p.[TiempoMicroParo], 0) as [TiempoMicroParo]
--           ,COALESCE(p.[TiempoParoNoAfecta], 0) as 	[TiempoParoNoAfecta]
        
--           ,pd.[PesoProducido]
--           ,pd.[PesoCaja]
--           ,s.[PesoScrap]
--           ,oee.Availability
--           ,oee.Performance
--           ,oee.Quality
--           ,oee.[OEE]
     
--	FROM #Celda c 
--	LEFT JOIN [AswSch].[AswEstEgeHora] est
--		ON c.IdCelda = est.IdCelda
--		AND c.FechaReporte = est.FechaReporte
--	JOIN #Turno t
--		ON c.IdCelda = t.IdCelda
--	LEFT JOIN #Paros p
--		ON c.IdCelda = p.IdCelda
--	LEFT JOIN #Produccion pd
--		ON c.IdCelda = pd.IdCelda
--	LEFT JOIN #Scrap s
--		ON c.IdCelda = s.IdCelda
--	LEFT JOIN #OEE oee
--		ON c.IdCelda = oee.IdCelda
--	WHERE est.IdCelda IS NULL
		
--	END 
--	--Inserto los nuevos
--	INSERT INTO [AswSch].[AswEstEgeHora]
--           ([ClaUbicacion]
--           ,[IdCelda]
--           ,[ClaDepartamento]
--           ,[NomDeapartamento]
--           ,[ClaArea]
--           ,[NomArea]
--           ,[ClaveCelda]
--           ,[NomCelda]
--           ,[Capacidad]
--           ,[FechaAdmScada]
--           ,[FechaReporte]
--           ,[Hora]
--           ,[ClaTurno]
--           ,[NomTurno]
--           ,[Duracion]
--           ,[InicioTurno]
--           ,[FinTurno]
--           ,[RunHrs]
--           ,[TiempoParo]
--           ,[TiempoMicroParo]
--           ,[TiempoParoNoAfecta]
--           ,[Cajas]
--           ,[Clavos]
--           ,[PesoProducido]
--           ,[ClaArticulo]
--           ,[ClaveArticulo]
--           ,[NomArticulo]
--           ,[NomArticuloIngles]
--           ,[CajasSkid]
--           ,[PesoCaja]
--           ,[PesoScrap]
--           ,[Disponibilidad]
--           ,[Eficiencia]
--           ,[Calidad]
--           ,[Oee]
--           ,[FechaBajaLogica]
--           ,[BajaLogica]
--           ,[ClaUsuarioMod]
--           ,[NombrePCMod]
--           ,[FechaUltimaMod])
--     SELECT '+CAST (@pnClaUbicacion AS  varchar(10))+'
--           ,c.[IdCelda]
--           ,c.[ClaDepartamento]
--           ,c.[NomDeapartamento]
--           ,c.[ClaArea]
--           ,c.[NomArea]
--           ,c.[ClaveCelda]
--           ,c.[NomCelda]
--           ,c.[Capacidad]
--           ,c.[FechaAdm]
--           ,c.[FechaReporte]
--           ,c.[Hora]
--           ,c.[ClaTurno]
--           ,t.[NomTurno]
--           ,t.[Duracion]
--           ,t.[InicioTurno]
--           ,t.[FinTurno]
--           ,t.[RunHrs]
--           ,COALESCE(p.[TiempoParo], 0)
--           ,COALESCE(p.[TiempoMicroParo], 0)
--           ,COALESCE(p.[TiempoParoNoAfecta], 0)
--           ,COALESCE(pd.[Cajas], 0)
--           ,pd.[Clavos]
--           ,pd.[PesoProducido]
--           ,pd.[ClaArticulo]
--           ,pd.[ClaveArticulo]
--           ,pd.[NomArticulo]
--           ,pd.[NomArticuloIngles]
--           ,pd.[CajasSkid]
--           ,pd.[PesoCaja]
--           ,s.[PesoScrap]
--           ,oee.Availability
--           ,oee.Performance
--           ,oee.Quality
--           ,oee.[OEE]
--           ,NULL AS [FechaBajaLogica]
--           ,0 AS [BajaLogica]
--           ,0 AS [ClaUsuarioMod]
--           ,''CalculoHora'' AS [NombrePCMod]
--           ,GETDATE() AS [FechaUltimaMod]
--	FROM #Celda c 
--	LEFT JOIN [AswSch].[AswEstEgeHora] est
--		ON c.IdCelda = est.IdCelda
--		AND c.FechaReporte = est.FechaReporte
--	JOIN #Turno t
--		ON c.IdCelda = t.IdCelda
--	LEFT JOIN #Paros p
--		ON c.IdCelda = p.IdCelda
--	LEFT JOIN #Produccion pd
--		ON c.IdCelda = pd.IdCelda
--	LEFT JOIN #Scrap s
--		ON c.IdCelda = s.IdCelda
--	LEFT JOIN #OEE oee
--		ON c.IdCelda = oee.IdCelda
--	WHERE est.IdCelda IS NULL';


--	EXEC sp_executesql @sql
--END

