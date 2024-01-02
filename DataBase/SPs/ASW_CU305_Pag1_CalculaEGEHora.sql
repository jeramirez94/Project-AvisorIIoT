--USE [ASW]
--GO
/****** Object:  StoredProcedure [AswSch].[ASW_CU305_Pag1_CalculaEGEHora]    Script Date: 17/01/2023 10:07:39 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*==========================================
* CU: 305.1
* Objetivo:Calcula el ege para la hora actual, considerando desde el inicio del turno correspondiente 
* Autor: mrodriguezc
* Fecha: 2023-02-21
* EXEC [AswSch].[ASW_CU305_Pag1_CalculaEGEHora] 68, '2022-06-29 16:01:00', 1
* EXEC [AswSch].[ASW_CU305_Pag1_CalculaEGEHora] 65, '2023-05-23 18:59:59', 1
* 15/01/2023 MRODRIGUEZC Se actualizo el tipo de variable de @pnIdCelda INT a * @psIdCelda VARCHAR(30) para soportar las claves de maquina del sistema MAN
* 22/05/2023 MRODRIGUEZC Se cambia el calculo de la calidad para tomar las piezas de PNC como la produccion mala
* 23/05/2023 MRDORIGUEZC Se cambia el concepto de Capacidad a CapacidadUnidad para la capacidad de la maquina de producir las unidades de medida del producto (clavos, bits) es decir la velocidad
*						 Se incorpora el concepto de Capacidad para la capacidad por maquina y producto, es decir cuantas piezas de producto X puede hacer una maquina Y por hora, se considera tambien el multiplo de produccion. 	
*========================================== */
ALTER PROC [AswSch].[ASW_CU305_Pag1_CalculaEGEHora]
	@pnClaUbicacion INT
	,@ptFecha DATETIME
	,@pnDebug INT = 0
AS
BEGIN
SET NOCOUNT ON

	DECLARE
		@tFechaFin DATETIME

	CREATE TABLE #Turno (
		IdCelda VARCHAR(30),
		NomTurno VARCHAR(10),
		Duracion INT,
		InicioTurno DATETIME,
		FinTurno DATETIME,
		RunHrs FLOAT,
		CapacidadUnidadRunHrs FLOAT
	);


	SET @ptFecha = COALESCE(@ptFecha, DATEADD(HOUR, -1, GETDATE()))
	
	--solo hora
	SET @ptFecha = DATEADD(HOUR, DATEDIFF(HOUR, '2000-01-01', @ptFecha), '2000-01-01')
	SET @tFechaFin = DATEADD(HOUR, 1, @ptFecha)

	--si aun no termina el periodo que se esta calculando
	IF @tFechaFin > GETDATE()
	BEGIN
		SET @tFechaFin = GETDATE()
	END

	IF @pnDebug = 1
	BEGIN
		SELECT @ptFecha AS FechaInicial, @tFechaFin AS FechaFinal
	END	

	SELECT CWC.IdWorkCenter AS IdCelda
		,CWC.ClaDepartamento AS ClaDepartamento
		,CD.NomDepartamento AS [NomDeapartamento]
		,CWC.ClaArea AS ClaArea
		,CA.NomArea AS [NomArea]
		,ClaveWorkCenter AS [ClaveCelda]
		,NomWorkCenter AS [NomCelda]
		--TODO: estandarizar capacidad
		--,CASE EsSuperCelda WHEN 1 THEN COALESCE(NPM,0) + COALESCE(NPM2,0) + COALESCE(NPM3,0) ELSE COALESCE(CantWafios,1)*COALESCE(NPM,0) END AS [Capacidad]
		,CASE ClaveWorkCenter WHEN 'FF-05' THEN 35 ELSE 40 END AS CapacidadUnidad
		--si sale de turno o TraTurno seria igual ya que se descarta lo que no tenga un TraTurno
		,[AswSch].[ASWGetFechaAdm] (@pnClaUbicacion, CWC.ClaDepartamento, @ptFecha) AS FechaAdm
		,@ptFecha AS FechaReporte 
		,DATEPART(HOUR, @ptFecha) AS Hora
		--TraTurno
		,[AswSch].[ASWGetTurno] (@pnClaUbicacion, CWC.ClaDepartamento, @ptFecha) AS ClaTurno
		,CM.Capacidad
	INTO #Celda
	FROM [AswSch].[AswCatWorkCenterVw] CWC
	JOIN AswSch.AswCatDepartamentoVw CD
		ON CWC.ClaDepartamento = CD.ClaDepartamento
	JOIN AswSch.AswCatAreaVw CA
		ON CWC.ClaArea = CA.ClaArea
	LEFT JOIN [AswSch].[AswTraMicroPrograma] MP
		ON CWC.IdWorkCenter = MP.IdWorkCenter
		AND MP.ClaEstatus = 2 --EnProgreso
	LEFT JOIN [AswSch].[AswCatCapacidadMaquinaVw] CM
		ON MP.ClaArticulo = CM.ClaArticulo
		AND MP.IdWorkCenter = CM.ClaMaquina

	--Quito celdas que no tienen turno en ese periodo
	DELETE #Celda WHERE ClaTurno IS NULL OR ClaTurno = -1
	
	/*
	--MRODRIGUEZC 2023-02-22 se mueve bloque completo a caso donde los horarios son fijos
	SELECT IdCelda 
		,[NomTurno]
		,Duracion
		,[AswSch].[ASWGetInicioTurno](@pnClaUbicacion, FechaAdm, c.ClaTurno, ClaDepartamento) AS InicioTurno
		,[AswSch].[ASWGetFinTurno](@pnClaUbicacion, FechaAdm, c.ClaTurno, ClaDepartamento) AS FinTurno
		,ROUND(DATEDIFF(MINUTE, [AswSch].[ASWGetInicioTurno](@pnClaUbicacion, FechaAdm, c.ClaTurno, ClaDepartamento), @tFechaFin)/60.0, 2) AS RunHrs
		,ROUND(DATEDIFF(MINUTE, [AswSch].[ASWGetInicioTurno](@pnClaUbicacion, FechaAdm, c.ClaTurno, ClaDepartamento), @tFechaFin)/60.0, 2) * Capacidad * 60 AS CapacidadRunHrs
	INTO #Turno
	FROM #Celda c
	JOIN [AswSch].[AswCatTurno] t
		ON c.ClaTurno = t.ClaTurno
	*/
	--MRODRIGUEZC 2023-02-22
	--if CatTurno.fechafin-CatTurno.fechaini>CatTurno.duracion calcular TraTurno real, sino, cargarlo de catalogo para hacer una diferencia entre Houston y poplar
	IF EXISTS (SELECT 1
				FROM [AswSch].[AswCatTurno] T
				JOIN [AswSch].[AswRelTurnoDepartamentoHorario] TD
					ON T.ClaUbicacion = TD.ClaUbicacion
					AND T.ClaTurno = TD.ClaTurno
				WHERE (HoraFinTurno>HoraInicioTurno
						AND DATEDIFF(HH, HoraInicioTurno, HoraFinTurno) <> Duracion
					OR HoraFinTurno<HoraInicioTurno
						AND DATEDIFF(HH, HoraInicioTurno, HoraFinTurno)+24 <> Duracion
					)
				)
	BEGIN --Caso Houston horarios variables
		--obtengo el rango de operacion del work center dentro del turno
		;WITH cteTurno AS (
			SELECT IdCelda 
				,[NomTurno]
				,Duracion
				,CapacidadUnidad --capacidad de la celda
				,[AswSch].[ASWGetInicioTurno](@pnClaUbicacion, FechaAdm, c.ClaTurno, ClaDepartamento) AS InicioTurno
				,[AswSch].[ASWGetFinTurno](@pnClaUbicacion, FechaAdm, c.ClaTurno, ClaDepartamento) AS FinTurno
			FROM #Celda c
			JOIN [AswSch].[AswCatTurno] t
				ON c.ClaTurno = t.ClaTurno
		) 
		,cteRangoOperacion AS (
			SELECT WU.IdWorkCenter
				,DATEADD(HOUR, DATEDIFF(HOUR, 0, MIN(FechaHoraMaquina)), 0)  AS FechaHoraInicio
				,DATEADD(HOUR, DATEDIFF(HOUR, 0, MAX(FechaHoraMaquina))+1, 0)  AS FechaHoraFin
			FROM [AswSch].[AswRecBitVariable] V
			JOIN [AswSch].[AswCatWorkUnitVw] WU
				ON V.ClaMaquina = WU.ClaMaquina
			JOIN cteTurno T 
				ON WU.IdWorkCenter = T.IdCelda
			WHERE FechaHoraMaquina> = InicioTurno --catTurno
				AND FechaHoraMaquina < FinTurno --catTurno
				AND ClaVariable = 1
				AND Valor = 1
			GROUP BY WU.IdWorkCenter
		)
		--El turno inicia en la primera hora en la que hay señal o en la hora en la que hora + duracion = fin de turno (faltan menos de 10 hrs para que termine el turno)
		,cteInicioTurno AS (
			SELECT IdWorkCenter
			,CASE WHEN DATEDIFF(HOUR,FechaHoraInicio, FinTurno) < Duracion
				THEN DATEADD(HOUR, -Duracion, FinTurno) 
				ELSE FechaHoraInicio
				END AS FechaHoraInicio
			FROM cteRangoOperacion RO
			JOIN cteTurno T
				ON RO.IdWorkCenter = T.IdCelda
		)
		--El turno termina en la ultima hora en la que hay señal o la hora en la que inicio de turno + duracion = hora si es mayor a la ultima presencia de señal (el turno debe cumplir al menos 10 hrs)
		,cteFinTurno AS (
			SELECT IT.IdWorkCenter
				,CASE WHEN DATEADD(HH, T.Duracion, IT.FechaHoraInicio) > RO.FechaHoraFin
					THEN DATEADD(HH, T.Duracion, IT.FechaHoraInicio)
					ELSE RO.FechaHoraFin
					END AS FechaHoraFin
			FROM cteRangoOperacion RO
			JOIN cteTurno T
				ON RO.IdWorkCenter = T.IdCelda
			JOIN cteInicioTurno IT
				ON RO.IdWorkCenter = IT.IdWorkCenter
		)
	
		INSERT INTO #Turno
		SELECT RO.IdWorkCenter AS IdCelda 
			,T.[NomTurno]
			,DATEDIFF(HOUR, IT.FechaHoraInicio, FT.FechaHoraFin) AS Duracion
			,IT.FechaHoraInicio AS InicioTurno
			,FT.FechaHoraFin AS FinTurno
			,ROUND(DATEDIFF(MINUTE, IT.FechaHoraInicio, @tFechaFin)/60.0, 2) AS RunHrs
			,ROUND(DATEDIFF(MINUTE, IT.FechaHoraInicio, @tFechaFin)/60.0, 2) * CapacidadUnidad * 60 AS CapacidadUnidadRunHrs
		FROM cteRangoOperacion RO
		JOIN cteTurno T
			ON RO.IdWorkCenter = T.IdCelda
		JOIN cteInicioTurno IT
			ON RO.IdWorkCenter = IT.IdWorkCenter
		JOIN cteFinTurno FT
			ON RO.IdWorkCenter = FT.IdWorkCenter

		--descarto la celdas que quedan fuera de horario ya sea al inicio o al final
		DELETE C
		FROM #Celda C
		JOIN #Turno T
			ON C.IdCelda = T.IdCelda
		WHERE RunHrs > Duracion
			OR RunHrs <= 0

	END
	ELSE
	BEGIN--Caso poplar horarios fijos
		INSERT INTO #Turno
		SELECT IdCelda 
			,[NomTurno]
			,Duracion
			,[AswSch].[ASWGetInicioTurno](@pnClaUbicacion, FechaAdm, c.ClaTurno, ClaDepartamento) AS InicioTurno
			,[AswSch].[ASWGetFinTurno](@pnClaUbicacion, FechaAdm, c.ClaTurno, ClaDepartamento) AS FinTurno
			,ROUND(DATEDIFF(MINUTE, [AswSch].[ASWGetInicioTurno](@pnClaUbicacion, FechaAdm, c.ClaTurno, ClaDepartamento), @tFechaFin)/60.0, 2) AS RunHrs
			,ROUND(DATEDIFF(MINUTE, [AswSch].[ASWGetInicioTurno](@pnClaUbicacion, FechaAdm, c.ClaTurno, ClaDepartamento), @tFechaFin)/60.0, 2) * CapacidadUnidad * 60 AS CapacidadUnidadRunHrs
		FROM #Celda c
		JOIN [AswSch].[AswCatTurno] t
			ON c.ClaTurno = t.ClaTurno
		
	END
		

	IF (@pnDebug = 1)
	BEGIN
		select * from #Celda
		select * from #Turno

		SELECT ClaMaquina
			,DATEADD(HOUR, DATEDIFF(HOUR, 0, MIN(FechaHoraMaquina)), 0)  AS FechaHoraInicioTurno
			,DATEADD(HOUR, DATEDIFF(HOUR, 0, MAX(FechaHoraMaquina))+1, 0)  AS FechaHoraFin
		FROM [AswSch].[AswRecBitVariable] V
		JOIN #Turno T
			ON FechaHoraMaquina> = InicioTurno
			AND FechaHoraMaquina < FinTurno
			AND ClaVariable = 1
			AND Valor = 1
		GROUP BY ClaMaquina
	END
	--return

	/*
	Availability= run hrs/Schedule hrs
	TDT = Total downtimes
	NADT = non-affecting downtimes

	Run hrs = (duration of shift * #Arms) – (TDT Arm A + TDT Arm B)
	Schedule hrs = (duration of shift * #Arms) – (NADT Arm A + NADT Arm B)


	* non-affecting downtimes (EsNoAplicaAprovechamiento = 1)

	*/
	--MRODRIGUEZC 2023-02-22 Tomar solo el tiempo de paro entre los rangos de #Turno
	SELECT IdWorkCenter AS IdCelda,
		ROUND(SUM(DATEDIFF(second,
				CASE WHEN t.InicioTurno > bp.FechaHoraInicial AND ISNULL(bp.FechaHoraFinal, GETDATE()) > t.InicioTurno 
						THEN t.InicioTurno
					WHEN t.InicioTurno < bp.FechaHoraInicial AND ISNULL(bp.FechaHoraFinal, GETDATE()) > t.InicioTurno
						THEN bp.FechaHoraInicial
					ELSE
						NULL --generara un datediff null y no se contara
					END,
				CASE WHEN @tFechaFin > ISNULL(bp.FechaHoraFinal, GETDATE()) AND bp.FechaHoraInicial < @tFechaFin
						THEN ISNULL(bp.FechaHoraFinal, GETDATE())
					WHEN @tFechaFin < ISNULL(bp.FechaHoraFinal, GETDATE()) AND bp.FechaHoraInicial < @tFechaFin
						THEN @tFechaFin
					ELSE
						NULL
					END		
				)		
			)/60.0/60.0, 2) AS TiempoParo,
		ROUND(SUM(CASE bp.MicroParoSN WHEN 1 
			THEN 
				DATEDIFF(second,
					CASE WHEN t.InicioTurno > bp.FechaHoraInicial AND ISNULL(bp.FechaHoraFinal, GETDATE()) > t.InicioTurno 
							THEN t.InicioTurno
						WHEN t.InicioTurno < bp.FechaHoraInicial AND ISNULL(bp.FechaHoraFinal, GETDATE()) > t.InicioTurno
							THEN bp.FechaHoraInicial
						ELSE
							NULL --generara un datediff null y no se contara
						END,
					CASE WHEN @tFechaFin > ISNULL(bp.FechaHoraFinal, GETDATE()) AND bp.FechaHoraInicial < @tFechaFin
							THEN ISNULL(bp.FechaHoraFinal, GETDATE())
						WHEN @tFechaFin < ISNULL(bp.FechaHoraFinal, GETDATE()) AND bp.FechaHoraInicial < @tFechaFin
							THEN @tFechaFin
						ELSE
							NULL
						END		
					) 
			ELSE 0 END
			)/60.0, 2) AS TiempoMicroParo, --MINUTOS
		ROUND(SUM(CASE rtg.EsNoAplicaAprovechamiento WHEN 1 
			THEN 
				DATEDIFF(second,
					CASE WHEN t.InicioTurno > bp.FechaHoraInicial AND ISNULL(bp.FechaHoraFinal, GETDATE()) > t.InicioTurno 
							THEN t.InicioTurno
						WHEN t.InicioTurno < bp.FechaHoraInicial AND ISNULL(bp.FechaHoraFinal, GETDATE()) > t.InicioTurno
							THEN bp.FechaHoraInicial
						ELSE
							NULL --generara un datediff null y no se contara
						END,
					CASE WHEN @tFechaFin > ISNULL(bp.FechaHoraFinal, GETDATE()) AND bp.FechaHoraInicial < @tFechaFin
							THEN ISNULL(bp.FechaHoraFinal, GETDATE())
						WHEN @tFechaFin < ISNULL(bp.FechaHoraFinal, GETDATE()) AND bp.FechaHoraInicial < @tFechaFin
							THEN @tFechaFin
						ELSE
							NULL
						END		
				) 
			ELSE 0 END
			)/60.0/60.0, 2) AS TiempoParoNoAfecta
	INTO #Paros
	FROM #Celda c 
	JOIN #Turno t
		ON c.IdCelda = t.IdCelda
	JOIN [AswSch].[AswCatWorkUnitVw] m
		ON c.IdCelda = m.IdWorkCenter
		AND m.EsGralParos = 1
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
		AND FechaHoraInicial<@tFechaFin
		AND bp.BajaLogica = 0
	GROUP BY IdWorkCenter

	IF (@pnDebug = 1)
	BEGIN
		select * from #Paros

		select *  
		FROM #Celda c 
		JOIN #Turno t
			ON c.IdCelda = t.IdCelda
		JOIN [AswSch].[AswCatWorkUnitVw] m
			ON c.IdCelda = m.IdWorkCenter
			AND m.EsGralParos = 1
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
			AND FechaHoraInicial<@tFechaFin
			AND bp.BajaLogica = 0
		ORDER BY IdWorkCenter, bp.FechaHoraInicial
		
	END

	/*
	--Performance = produced boxes/ expected boxes

	--Produced boxes = produced boxes Arm A + produced boxes Arm B
	--Capacity (boxes/hr) = 60 min * if supercell SUM(NPM); else NPM * Wafios 
	--Expected boxes = Capacity * RunHrs

	--Cell 1:
	--Capacity: 240,120 nails/hr
	--box: 9000 nails/box (acording to ítem description)
	--Capacity in boxes: 26.68 boxes/hr

	Performance = E(produccionN/capacidadN) / RunHrs
	produccionN = 1
	CapacidadN = piezas/hora | capacidad por maquina y producto
	RunHrs = tiempo total de operacion de la maquina

	*/

	SELECT pd.IdCelda
		--,COUNT(distinct IdCaja) AS CajasId --no cuento la caja 'abierta'
		,SUM(CASE ClaveCorte WHEN 'FINCAJA' --THEN 1 ELSE 0 END) AS Cajas
				THEN --2023-03-14 MRODRIGUEZC Se toma la diferencia de cajas para el conteo en lugar de la existencia del corte FINCAJA
					CASE WHEN pd.CajasInicio > pd.CajasFin --DETECTAR RESETEO DEL CONTADOR DE CAJAS
						 THEN pd.CajasFin --SI SE RESETO EL CONTADOR SE TOMA COMO PRODUCCION LAS CAJASFIN 
						 ELSE pd.CajasFin - CajasInicio --SINO LA PRODUCCION ES LA DIFERENCIA 
				    END
				 ELSE 0 END) AS Cajas
		--TODO:estandarizar clavos inicio y fin... kinda..
		,SUM(CASE ClaveCorte WHEN 'FINCAJA' 
				  THEN 
					CASE WHEN pd.ClavosInicio > pd.ClavosFin --DETECTAR RESETEO DEL CONTADOR DE CLAVOS
						 THEN pd.ClavosFin --SI SE RESETO EL CONTADOR SE TOMA COMO PRODUCCION LOS CLAVOSFIN 
						 ELSE pd.ClavosFin - ClavosInicio --SINO LA PRODUCCION ES LA DIFERENCIA 
				    END
				  ELSE 0 END) AS Clavos
		--Tiempo de ciclo std para la produccion en hrs
		,SUM(1/c.Capacidad/Multiplo) AS CicloProduccion
		--TODO: estandarizar calculo de calidad. esta en terminos de peso en poplar, no definido en houston
		,SUM(CASE ClaveCorte WHEN 'FINCAJA' THEN a.Peso ELSE 0 END) AS PesoProducido
		--Esta informacion solo corresponde cuando es solo un producto por hora
		--todo: resolver cuando hay cambio de producto
		--warning: no usar estas columnas en calculos
		,MAX(a.[ClaArticulo]) AS [ClaArticulo]
		,MAX([ClaveArticulo]) AS [ClaveArticulo]
		,MAX([NomArticulo]) AS [NomArticulo]
		,MAX([NomArticuloIngles]) AS [NomArticuloIngles]
		,MAX([CajasSkid]) AS [CajasSkid]
		,MAX([Peso]) AS [PesoCaja]
		,MAX(c.[Capacidad]) AS Capacidad
		--fin
	INTO #Produccion
	FROM #Celda ct
	JOIN [AswSch].[AswBitBitacoraProduccion]  pd
		ON ct.IdCelda = pd.IdCelda
		AND ct.FechaAdm = pd.FechaAdm
		AND ct.ClaTurno = pd.ClaTurno
	LEFT JOIN [AswSch].[AswCatArticuloGeneralVw] a
		ON pd.ClaArticulo = a.ClaArticulo
	LEFT JOIN [AswSch].[AswCatCapacidadMaquinaVw] c
		ON pd.ClaArticulo = c.ClaArticulo
		AND pd.IdCelda = c.ClaMaquina
	WHERE pd.ClaUbicacion = @pnClaUbicacion
		AND pd.DuracionSegundos>=0
		AND EsPNC = 0 --quitar cuando se controle el PNC con una columna diferente de CajasInicio y CajasFin
		AND FechaHoraInicio<@tFechaFin
		AND pd.BajaLogica = 0
	--AND m.ClaCelda = 112
	GROUP BY pd.IdCelda

	
	IF (@pnDebug = 1)
	BEGIN
		select * from #Produccion
	END
	

	/*
	Quality = 1 – (scrap + PNC/produced boxes * weigth per box)

	Requires scrap entry per PO or comunication to visión system

	*/
	
	

	SELECT pd.IdCelda
		--,COUNT(distinct IdCaja) AS CajasId --no cuento la caja 'abierta'
		,SUM(CASE ClaveCorte WHEN 'FINCAJA' --THEN 1 ELSE 0 END) AS Cajas
				THEN --2023-03-14 MRODRIGUEZC Se toma la diferencia de cajas para el conteo en lugar de la existencia del corte FINCAJA
					CASE WHEN pd.CajasInicio > pd.CajasFin --DETECTAR RESETEO DEL CONTADOR DE CAJAS
						 THEN pd.CajasFin --SI SE RESETO EL CONTADOR SE TOMA COMO PRODUCCION LAS CAJASFIN 
						 ELSE pd.CajasFin - CajasInicio --SINO LA PRODUCCION ES LA DIFERENCIA 
				    END
				 ELSE 0 END) AS Cajas
		--TODO:estandarizar clavos inicio y fin... kinda..
		,SUM(CASE ClaveCorte WHEN 'FINCAJA' 
				  THEN 
					CASE WHEN pd.ClavosInicio > pd.ClavosFin --DETECTAR RESETEO DEL CONTADOR DE CLAVOS
						 THEN pd.ClavosFin --SI SE RESETO EL CONTADOR SE TOMA COMO PRODUCCION LOS CLAVOSFIN 
						 ELSE pd.ClavosFin - ClavosInicio --SINO LA PRODUCCION ES LA DIFERENCIA 
				    END
				  ELSE 0 END) AS Clavos
		--Tiempo de ciclo std para la produccion en hrs
		,SUM(1/c.Capacidad/Multiplo) AS CicloProduccion
		--TODO: estandarizar calculo de calidad. esta en terminos de peso en poplar, no definido en houston
		,SUM(CASE ClaveCorte WHEN 'FINCAJA' THEN a.Peso ELSE 0 END) AS PesoProducido
		--Esta informacion solo corresponde cuando es solo un producto por hora
		--todo: resolver cuando hay cambio de producto
		--warning: no usar estas columnas en calculos
		,MAX(a.[ClaArticulo]) AS [ClaArticulo]
		,MAX([ClaveArticulo]) AS [ClaveArticulo]
		,MAX([NomArticulo]) AS [NomArticulo]
		,MAX([NomArticuloIngles]) AS [NomArticuloIngles]
		,MAX([CajasSkid]) AS [CajasSkid]
		,MAX([Peso]) AS [PesoCaja]
		,MAX(c.[Capacidad]) AS Capacidad
		--fin
	INTO #PNC
	FROM #Celda ct
	JOIN [AswSch].[AswBitBitacoraProduccion]  pd
		ON ct.IdCelda = pd.IdCelda
		AND ct.FechaAdm = pd.FechaAdm
		AND ct.ClaTurno = pd.ClaTurno
	LEFT JOIN [AswSch].[AswCatArticuloGeneralVw] a
		ON pd.ClaArticulo = a.ClaArticulo
	LEFT JOIN [AswSch].[AswCatCapacidadMaquinaVw] c
		ON pd.ClaArticulo = c.ClaArticulo
		AND pd.IdCelda = c.ClaMaquina
	WHERE pd.ClaUbicacion = @pnClaUbicacion
		AND pd.DuracionSegundos>=0
		AND EsPNC = 1 --quitar cuando se controle el PNC con una columna diferente de CajasInicio y CajasFin
		AND FechaHoraInicio<@tFechaFin
		AND pd.BajaLogica = 0
	--AND m.ClaCelda = 112
	GROUP BY pd.IdCelda


	SELECT IdCelda,
		SUM(PesoScrap) AS PesoScrap,
		SUM(UnidadesScrap) AS UnidadesScrap
	INTO #Scrap
	FROM (
		SELECT c.IdCelda,
			SUM(peso) AS PesoScrap,
			0 AS UnidadesScrap
		FROM #Celda c
		JOIN [AswSch].[ASWTraScrap] s
			ON c.IdCelda = s.IdCelda
			AND c.FechaAdm = s.FechaAdmScada
			AND c.ClaTurno = s.ClaTurno
		WHERE BajaLogica = 0
		GROUP BY c.IdCelda
		UNION ALL
		SELECT IdCelda
			,SUM(PesoProducido) AS PesoScrap
			,SUM(Cajas) AS UnidadesScrap
		FROM #PNC
		GROUP BY IdCelda
	) AS PesoScrap
	GROUP BY IdCelda
	

	--SELECT * FROM #Produccion
	IF (@pnDebug = 1)
	BEGIN
		SELECT * FROM #PNC
		SELECT * FROM #Scrap
		
		SELECT * 
		FROM #Turno t 
		JOIN #Celda c
			ON t.IdCelda = c.IdCelda
		LEFT JOIN #Paros p
			ON t.IdCelda = p.IdCelda
		LEFT JOIN #Produccion pd
			ON t.IdCelda = pd.IdCelda
		LEFT JOIN #Scrap s
			ON t.IdCelda = s.IdCelda

	END

	SELECT t.IdCelda
		,CASE WHEN COALESCE(RunHrs - TiempoParoNoAfecta,0) = 0 THEN 0 ELSE (RunHrs - TiempoParo)/(RunHrs - TiempoParoNoAfecta)*100.0 END AS Availability
		--,CASE WHEN COALESCE(CapacidadUnidad*60*(RunHrs-p.TiempoParo),0) = 0 THEN 0 ELSE COALESCE(Clavos,0)/(CapacidadUnidad*60*(RunHrs-p.TiempoParo))*100.0 END AS PerformanceUnidad --(basado en velocidad)
		,CASE WHEN COALESCE(RunHrs-p.TiempoParo, 0) = 0 THEN 100 ELSE (COALESCE(pd.CicloProduccion,0) + COALESCE(pnc.CicloProduccion,0)) / (RunHrs-p.TiempoParo) * 100 END AS Performance
		,CASE WHEN COALESCE(RunHrs, 0) = 0 THEN 100 ELSE (COALESCE(pd.CicloProduccion,0) + COALESCE(pnc.CicloProduccion,0)) / (RunHrs) * 100 END AS Cumplimiento
		,CASE WHEN COALESCE(pd.Cajas,0) = 0 THEN 100 ELSE 100 - (COALESCE(UnidadesScrap,0.0)/pd.Cajas*100.0) END AS Quality
	INTO #APQ
	FROM #Turno t
	JOIN #Celda c
		ON t.IdCelda = c.IdCelda
	LEFT JOIN #Paros p
		ON t.IdCelda = p.IdCelda
	LEFT JOIN #Produccion pd
		ON t.IdCelda = pd.IdCelda
	LEFT JOIN #PNC pnc
		ON t.IdCelda = pnc.IdCelda
	LEFT JOIN #Scrap s
		ON t.IdCelda = s.IdCelda

	IF (@pnDebug = 1)
	BEGIN
	    print 'ultimo'
		SELECT * FROM #APQ
	END

	SELECT IdCelda
		,Availability*Performance*Quality/10000 AS OEE
		,ROUND(Availability, 2) AS Availability
		,ROUND(Performance, 2) AS Performance
		,ROUND(Cumplimiento, 2) AS Cumplimiento
		,ROUND(Quality, 2) AS Quality
	INTO #OEE
	FROM #APQ

	IF (@pnDebug = 1)
	BEGIN
	    print 'ultimo 1'
		
	END

	--Actualizo los registros actuales
	UPDATE est
	SET est.[ClaDepartamento] = c.[ClaDepartamento]
		,est.[NomDeapartamento] = c.[NomDeapartamento]
		,est.[ClaArea] = c.[ClaArea]
		,est.[NomArea] = c.[NomArea]
		,est.[ClaveCelda] = c.[ClaveCelda]
		,est.[NomCelda] = c.[NomCelda]
		,est.[Capacidad] = COALESCE(pd.[Capacidad], c.[Capacidad])
		,est.[CapacidadUnidad] = c.[CapacidadUnidad]
		
		,est.[ClaTurno] = c.[ClaTurno]
		,est.[NomTurno] = t.[NomTurno]
		,est.[Duracion] = t.[Duracion]
		,est.[InicioTurno] = t.[InicioTurno]
		,est.[FinTurno] = t.[FinTurno]
		,est.[RunHrs] = t.[RunHrs]
		
		,est.[TiempoParo] = COALESCE(p.[TiempoParo], 0)
		,est.[TiempoMicroParo] = COALESCE(p.[TiempoMicroParo], 0)
		,est.[TiempoParoNoAfecta] = COALESCE(p.[TiempoParoNoAfecta], 0)
		
		,est.[Cajas] = COALESCE(pd.[Cajas], 0)
		,est.[Clavos] = pd.[Clavos]
		,est.[PesoProducido] = pd.[PesoProducido]
		
			--warning: no usar estas columnas en calculos
		,est.[ClaArticulo] = pd.[ClaArticulo]
		,est.[ClaveArticulo] = pd.[ClaveArticulo]
		,est.[NomArticulo] = pd.[NomArticulo]
		,est.[NomArticuloIngles] = pd.[NomArticuloIngles]
		,est.[CajasSkid] = pd.[CajasSkid]
		,est.[PesoCaja] = pd.[PesoCaja]
			--fin warning		
		
		,est.[CajasPNC] = COALESCE(pnc.[Cajas], 0)
		,est.[ClavosPNC] = pnc.[Clavos]
		,est.[PesoProducidoPNC] = pnc.[PesoProducido]
		
		,est.[PesoScrap] = s.[PesoScrap]
		
		,est.[Disponibilidad] = oee.[Availability]
		,est.[Eficiencia] = oee.[Performance]
		,est.[Cumplimiento] = oee.[Cumplimiento]
		,est.[Calidad] = oee.[Quality]
		,est.[Oee] = oee.[Oee]
		
		,est.[FechaUltimaMod] = GETDATE()
	FROM [AswSch].[AswEstEgeHora] est 
	JOIN #Celda c
		ON est.IdCelda = c.IdCelda
		AND est.FechaReporte = c.FechaReporte
	JOIN #Turno t
		ON c.IdCelda = t.IdCelda
	LEFT JOIN #Paros p
		ON c.IdCelda = p.IdCelda
	LEFT JOIN #Produccion pd
		ON c.IdCelda = pd.IdCelda
	LEFT JOIN #PNC pnc
		ON c.IdCelda = pnc.IdCelda
	LEFT JOIN #Scrap s
		ON c.IdCelda = s.IdCelda
	LEFT JOIN #OEE oee
		ON c.IdCelda = oee.IdCelda

    IF (@pnDebug = 1)
	BEGIN

	    print 'ultimo 2'
		SELECT 'SELECT FINALm'
			,c.[IdCelda]
			,c.[ClaDepartamento]
			,c.[NomDeapartamento]
			,c.[ClaArea]
			,c.[NomArea]
			,c.[ClaveCelda]
			,c.[NomCelda]
			,t.[RunHrs]
			,COALESCE(p.[TiempoParo], 0) as [TiempoParo]
			,COALESCE(p.[TiempoMicroParo], 0) as [TiempoMicroParo]
			,COALESCE(p.[TiempoParoNoAfecta], 0) as 	[TiempoParoNoAfecta]
        
			,pd.[PesoProducido]
			,pd.[PesoCaja]		
		
			,pnc.[Cajas] AS CajasPNC
			,pnc.[Clavos] AS ClavosPNC
			,pnc.[PesoProducido] AS PesoProducidoPNC
			,s.[PesoScrap]
			,oee.Availability
			,oee.Performance
			,oee.Cumplimiento
			,oee.Quality
			,oee.[OEE]
     
		FROM #Celda c 
		LEFT JOIN [AswSch].[AswEstEgeHora] est
			ON c.IdCelda = est.IdCelda
			AND c.FechaReporte = est.FechaReporte
		JOIN #Turno t
			ON c.IdCelda = t.IdCelda
		LEFT JOIN #Paros p
			ON c.IdCelda = p.IdCelda
		LEFT JOIN #Produccion pd
			ON c.IdCelda = pd.IdCelda
		LEFT JOIN #PNC pnc
			ON c.IdCelda = pnc.IdCelda
		LEFT JOIN #Scrap s
			ON c.IdCelda = s.IdCelda
		LEFT JOIN #OEE oee
			ON c.IdCelda = oee.IdCelda
		WHERE est.IdCelda IS NOT NULL
		
	END 
	
	--Inserto los nuevos
	INSERT INTO [AswSch].[AswEstEgeHora]
           ([ClaUbicacion]
           ,[IdCelda]
           ,[ClaDepartamento]
           ,[NomDeapartamento]
           ,[ClaArea]
           ,[NomArea]
           ,[ClaveCelda]
           ,[NomCelda]
           ,[Capacidad]
           ,[CapacidadUnidad]
           ,[FechaAdmScada]
           ,[FechaReporte]
           ,[Hora]
           ,[ClaTurno]
           ,[NomTurno]
           ,[Duracion]
           ,[InicioTurno]
           ,[FinTurno]
           ,[RunHrs]
           ,[TiempoParo]
           ,[TiempoMicroParo]
           ,[TiempoParoNoAfecta]
           ,[Cajas]
           ,[Clavos]
           ,[PesoProducido]
           ,[ClaArticulo]
           ,[ClaveArticulo]
           ,[NomArticulo]
           ,[NomArticuloIngles]
           ,[CajasSkid]
           ,[PesoCaja]
		   ,[CajasPNC]
		   ,[ClavosPNC]
		   ,[PesoProducidoPNC]
           ,[PesoScrap]
           ,[Disponibilidad]
           ,[Eficiencia]
           ,[Cumplimiento]
           ,[Calidad]
           ,[Oee]
           ,[FechaBajaLogica]
           ,[BajaLogica]
           ,[ClaUsuarioMod]
           ,[NombrePCMod]
           ,[FechaUltimaMod])
     SELECT @pnClaUbicacion
           ,c.[IdCelda]
           ,c.[ClaDepartamento]
           ,c.[NomDeapartamento]
           ,c.[ClaArea]
           ,c.[NomArea]
           ,c.[ClaveCelda]
           ,c.[NomCelda]
           ,COALESCE(pd.[Capacidad], c.[Capacidad])
           ,c.[CapacidadUnidad]
           ,c.[FechaAdm]
           ,c.[FechaReporte]
           ,c.[Hora]
           ,c.[ClaTurno]
           ,t.[NomTurno]
           ,t.[Duracion]
           ,t.[InicioTurno]
           ,t.[FinTurno]
           ,t.[RunHrs]
           ,COALESCE(p.[TiempoParo], 0)
           ,COALESCE(p.[TiempoMicroParo], 0)
           ,COALESCE(p.[TiempoParoNoAfecta], 0)
           ,COALESCE(pd.[Cajas], 0)
           ,pd.[Clavos]
           ,pd.[PesoProducido]
           ,pd.[ClaArticulo]
           ,pd.[ClaveArticulo]
           ,pd.[NomArticulo]
           ,pd.[NomArticuloIngles]
           ,pd.[CajasSkid]
           ,pd.[PesoCaja]
		   ,COALESCE(pnc.[Cajas], 0)
		   ,pnc.[Clavos]
		   ,pnc.[PesoProducido]
           ,s.[PesoScrap]
           ,oee.Availability
           ,oee.Performance
           ,oee.Cumplimiento
           ,oee.Quality
           ,oee.[OEE]
           ,NULL AS [FechaBajaLogica]
           ,0 AS [BajaLogica]
           ,0 AS [ClaUsuarioMod]
           ,'CalculoHora' AS [NombrePCMod]
           ,GETDATE() AS [FechaUltimaMod]
	FROM #Celda c 
	LEFT JOIN [AswSch].[AswEstEgeHora] est
		ON c.IdCelda = est.IdCelda
		AND c.FechaReporte = est.FechaReporte
	JOIN #Turno t
		ON c.IdCelda = t.IdCelda
	LEFT JOIN #Paros p
		ON c.IdCelda = p.IdCelda
	LEFT JOIN #Produccion pd
		ON c.IdCelda = pd.IdCelda
	LEFT JOIN #PNC pnc
		ON c.IdCelda = pnc.IdCelda
	LEFT JOIN #Scrap s
		ON c.IdCelda = s.IdCelda
	LEFT JOIN #OEE oee
		ON c.IdCelda = oee.IdCelda
	WHERE est.IdCelda IS NULL



END

