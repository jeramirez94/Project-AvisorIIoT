--USE [ASW]
--GO

/****** Object:  StoredProcedure [AswSch].[ASW_CU305_Pag1_ObtenerRealExpectedProduction]    Script Date: 19/02/2023 09:05:37 p. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO
/*========================================== 
* CU305.1 
* Objetivo: Obtener las unidades y paquetes esperados vs reales
* Autor: mrodriguezc
* Fecha: 2023-02-17 
-- EXEC [AswSch].[ASW_CU305_Pag1_ObtenerRealExpectedProduction] 68, '2022-06-27T21:59:21Z' , 34, 1, 0
-- EXEC  [AswSch].[ASW_CU305_Pag1_ObtenerRealExpectedProduction] 65, '2023-02-16T23:59:59.000Z', 'FF-04', 1, 1
-- EXEC  [AswSch].[ASW_CU305_Pag1_ObtenerRealExpectedProduction] $ClaUbicacion, '${__to:date}', $Cell, 1
*========================================== */ 
ALTER PROC [AswSch].[ASW_CU305_Pag1_ObtenerRealExpectedProduction]
	@pnClaUbicacion INT
	--,@ptFechaDesde DATETIME
	,@ptFechaHasta DATETIME
	,@psIdCelda VARCHAR(30)
	,@pnTiempoUTC INT = 0
	,@pnDebug INT = 0
AS
BEGIN
	
	DECLARE
		@nClaAreaProduccion INT
		,@nClaTurno INT
		,@tFechaAdm DATETIME
		--,@tFechaInicioTurno DATETIME
		,@tFechaFinTurno DATETIME
		

	IF @pnTiempoUTC = 1
	BEGIN
		SET @ptFechaHasta = dateadd(hh, datediff(hh, getutcdate(), getdate()), @ptFechaHasta)
	END

	SELECT @nClaAreaProduccion = ClaDepartamento 
	FROM [AswSch].[AswCatWorkCenterVw]
	WHERE IdWorkCenter = @psIdCelda

	--obtengo el turno y fecha
	SET @nClaTurno = [AswSch].[ASWGetTurno] (@pnClaUbicacion, @nClaAreaProduccion, @ptFechaHasta)
	SET @tFechaAdm = [AswSch].[ASWGetFechaAdm] (@pnClaUbicacion, @nClaAreaProduccion, @ptFechaHasta)

	--obtengo el inicio y fin de turno para la fecha consultada
	--SET @tFechaInicioTurno = [AswSch].[ASWGetInicioTurno](@pnClaUbicacion, @tFechaAdm, @nClaTurno, @nClaAreaProduccion)
	SET @tFechaFinTurno = [AswSch].[ASWGetFinTurno](@pnClaUbicacion, @tFechaAdm, @nClaTurno, @nClaAreaProduccion)

	IF (@pnDebug = 1)
	BEGIN
		SELECT @nClaTurno AS ClaTurno
			,@tFechaAdm AS FechaAdm
			--,@tFechaInicioTurno AS FechaInicioTurno
			,@tFechaFinTurno AS FechaFinTurno

		SELECT *
		FROM [AswSch].[AswEstEgeHora]
		WHERE IdCelda = @psIdCelda
			AND FechaReporte < @tFechaFinTurno
		ORDER BY FechaReporte DESC

	END
	
	SELECT TOP 1 CapacidadUnidad*60*RunHrs AS UnitExpected
	,Clavos UnitsReal
	--,2*RunHrs AS PackagesExpected 
	,CASE
		--en base a tiempo y capacidad
		WHEN Cajas = 0 THEN Capacidad*RunHrs
		--cuando el cumplimiento es 0
		WHEN Cumplimiento = 0 THEN 0
		--Default
		ELSE Cajas/Cumplimiento*100 END AS PackagesExpected
	,Cajas AS PackagesReal
	FROM [AswSch].[AswEstEgeHora]
	WHERE IdCelda = @psIdCelda
		AND FechaAdmScada = @tFechaAdm
		AND ClaTurno = @nClaTurno
		AND FechaReporte < @tFechaFinTurno
	ORDER BY FechaReporte DESC
	
END

GO


