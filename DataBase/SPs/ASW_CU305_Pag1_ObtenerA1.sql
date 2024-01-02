--USE [ASW]
--GO
/****** Object:  StoredProcedure [AswSch].[ASW_CU305_Pag1_ObtenerA1]    Script Date: 15/11/2022 02:40:32 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- EXEC [AswSch].[ASW_CU305_Pag1_ObtenerA1] 68, '2022-06-27T12:00:00Z', '2022-06-27T21:59:21Z' , 34, 1, 0
-- EXEC  [AswSch].[ASW_CU305_Pag1_ObtenerA1] $ClaUbicacion, '${__from:date}', '${__to:date}', $Cell, 1
ALTER PROC [AswSch].[ASW_CU305_Pag1_ObtenerA1]
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
	
	SELECT 
      CONVERT(VARCHAR, DATEPART(HOUR, [FechaReporte]), 103)+':00' AS [From]
      ,CONVERT(VARCHAR, DATEPART(HOUR, DATEADD(HOUR, 1, [FechaReporte])), 103)+':00' AS [To]
	  ,[Clavos] - LAG([Clavos], 1, 0) OVER (ORDER BY FechaReporte) AS 'Nails/Hr'
	  ,[Capacidad]*60 AS 'Target Nails/Hr'
	  ,[Cajas] - LAG([Cajas], 1, 0) OVER (ORDER BY FechaReporte) AS 'Production/Hr'
	  ,[TiempoParo] - LAG(TiempoParo, 1, 0) OVER (ORDER BY FechaReporte) AS 'Downtime Time'
	  --,[TiempoMicroParo] - LAG([TiempoMicroParo], 1, 0) OVER (ORDER BY FechaReporte) AS [TiempoMicroParoDelta]
      ,[PesoScrap] - LAG([PesoScrap], 1, 0) OVER (ORDER BY FechaReporte) AS 'Lbs. Scrap'
      ,ROUND([Disponibilidad],0) AS Availability
      ,ROUND([Eficiencia],0) AS Performance
      ,ROUND([Calidad],0) AS Quality
      ,ROUND([Oee],2) AS Oee
	FROM [AswSch].[AswEstEgeHora]
	WHERE FechaAdmScada = @tFechaAdm
		AND ClaTurno = @nClaTurno
		AND IdCelda IN (@psIdCelda)
	ORDER BY FechaReporte




END

