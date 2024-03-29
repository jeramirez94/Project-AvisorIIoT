--USE [ASW]
--GO
/****** Object:  StoredProcedure [AswSch].[ASW_CU305_Pag1_ObtenerEGE]    Script Date: 15/11/2022 02:42:35 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*========================================== 
* CU: 305.1 
* Objetivo: Obtener el OEE, Performance, Disponibilidad y Calidad para el turno de la fecha Hasta
* Autor: mrodriguezc 
* Fecha: 2023-02-17 
* EXEC  [AswSch].[ASW_CU305_Pag1_ObtenerEGE] 68, '2022-06-29T12:33:27.384Z', 34, 0, 1
* EXEC  [AswSch].[ASW_CU305_Pag1_ObtenerEGE] 65, '2023-02-15T21:59:59.000Z', 'FF-03', 1, 1
*========================================== */ 
ALTER PROC [AswSch].[ASW_CU305_Pag1_ObtenerEGE]
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
	
	IF (@pnDebug = 1)
	BEGIN
		SELECT @pnClaUbicacion AS ClaUbicacion
			,@tFechaAdm AS FechaAdm
			,@nClaTurno AS ClaTurno
			,@nClaAreaProduccion
			,@psIdCelda AS IdCelda
			,@tFechaFinTurno AS FechaReporte
	END

	SELECT TOP 1
		Oee AS OEE
		,Disponibilidad AS Availability
		,Eficiencia AS Performance
		,Calidad AS Quality
	FROM [AswSch].[AswEstEgeHora]
	WHERE IdCelda = @psIdCelda
		AND FechaAdmScada = @tFechaAdm
		AND ClaTurno = @nClaTurno
		AND FechaReporte < @tFechaFinTurno
	ORDER BY FechaReporte DESC
	
END

