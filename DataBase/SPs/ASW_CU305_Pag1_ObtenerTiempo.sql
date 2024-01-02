--USE [ASW]
--GO
/****** Object:  StoredProcedure [AswSch].[ASW_CU305_Pag1_ObtenerTiempo]    Script Date: 15/11/2022 02:54:38 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- EXEC [AswSch].[ASW_CU305_Pag1_ObtenerTiempo] 68, '2022-06-27T12:00:00Z', '2022-06-27T21:59:21Z' , 34, 1, 0
-- EXEC  [AswSch].[ASW_CU305_Pag1_ObtenerTiempo] $ClaUbicacion, '${__from:date}', '${__to:date}', $Cell, 1
ALTER PROC [AswSch].[ASW_CU305_Pag1_ObtenerTiempo]
	@pnClaUbicacion INT
	,@ptFechaDesde DATETIME
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
		,@nClaTurno INT
		,@tFechaAdm DATETIME
		,@tFechaInicioTurno DATETIME
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
	SET @tFechaInicioTurno = [AswSch].[ASWGetInicioTurno](@pnClaUbicacion, @tFechaAdm, @nClaTurno, @nClaAreaProduccion)
	SET @tFechaFinTurno = [AswSch].[ASWGetFinTurno](@pnClaUbicacion, @tFechaAdm, @nClaTurno, @nClaAreaProduccion)
	
	SELECT TOP 1 
		TiempoParo-(TiempoMicroParo/60.0) AS Downtime
		,RunHrs - TiempoParo AS Uptime
		,TiempoMicroParo AS [Micro Stop]
	FROM [AswSch].[AswEstEgeHora]
	WHERE IdCelda = @psIdCelda
		AND FechaAdmScada = @tFechaAdm
		AND ClaTurno = @nClaTurno
		AND FechaReporte < @tFechaFinTurno
	ORDER BY FechaReporte DESC
END

