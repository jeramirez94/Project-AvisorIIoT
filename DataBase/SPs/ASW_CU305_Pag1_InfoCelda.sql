--USE [ASW]
--GO
/****** Object:  StoredProcedure [AswSch].[ASW_CU305_Pag1_InfoCelda]    Script Date: 15/11/2022 02:39:24 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- EXEC [AswSch].[ASW_CU305_Pag1_InfoCelda] 68, '2022-06-21 11:50:00', 34, 1
ALTER PROC [AswSch].[ASW_CU305_Pag1_InfoCelda]
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
		,'Shift '+NomTurno AS NomTurno
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

	SELECT pd.IdCelda
		,COUNT(distinct IdCaja) AS Cajas
		--,SUM(CASE WHEN ClavosFin-ClavosInicio< 0 THEN 0 ELSE ClavosFin-ClavosInicio END) AS Clavos
		--,MAX((COALESCE(NPM,0)+COALESCE(NPM2,0)+COALESCE(NPM3,0))*CantWafios*60.0) AS Capacidad
		--,SUM(CASE ClaveCorte WHEN 'FINCAJA' THEN a.Peso ELSE 0 END) AS Peso
	INTO #Produccion
	FROM #Celda ct
	JOIN [AswSch].[AswBitBitacoraProduccion]  pd
		ON ct.IdCelda = pd.IdCelda
		AND ct.FechaAdm = pd.FechaAdm
		AND ct.ClaTurno = pd.ClaTurno
	LEFT JOIN [AswSch].[AswCatArticuloGeneral] a
		ON pd.ClaArticulo = a.ClaArticulo
	WHERE pd.ClaUbicacion = @pnClaUbicacion
		AND pd.DuracionSegundos>=0
	GROUP BY pd.IdCelda
	
		IF (@pnDebug = 1)
	BEGIN
		select * from #Produccion
	END

	SELECT NomTurno
		,Cajas
	FROM #Turno t
	--LEFT JOIN #Paros p
	--	ON t.IdCelda = p.IdCelda
	LEFT JOIN #Produccion c
		ON t.IdCelda = c.IdCelda
END
