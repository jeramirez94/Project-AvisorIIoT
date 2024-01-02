--USE [ASW]
--GO
/****** Object:  StoredProcedure [AswSch].[ASW_CU305_Pag1_ObtenerEvaluacionStrips]    Script Date: 15/11/2022 02:50:08 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- EXEC [AswSch].[ASW_CU305_Pag1_ObtenerEvaluacionStrips] 68, '2022-06-27T12:00:00Z', '2022-06-27T21:59:21Z' , 34, 1, 0
-- EXEC  [AswSch].[ASW_CU305_Pag1_ObtenerEvaluacionStrips] $ClaUbicacion, '${__from:date}', '${__to:date}', $Cell, 1
ALTER PROC [AswSch].[ASW_CU305_Pag1_ObtenerEvaluacionStrips]
	@pnClaUbicacion INT
	,@ptFechaDesde DATETIME
	,@ptFechaHasta DATETIME
	,@psIdCelda VARCHAR(30)
	,@pnTiempoUTC INT = 0
	,@pnDebug INT = 0
AS
BEGIN

	DECLARE 
		@nOffSet INT

	IF @pnTiempoUTC = 1
	BEGIN
		SET @nOffSet = datediff(hh, getutcdate(), getdate())
	END
	ELSE
	BEGIN
		SET @nOffSet=0
	END

	
	SET @ptFechaDesde = dateadd(hh, @nOffSet, @ptFechaDesde)
	SET @ptFechaHasta = dateadd(hh, @nOffSet, @ptFechaHasta)

	SELECT
		DATEADD(HOUR, DATEDIFF(HOUR, '2000-01-01', DATEADD(hh, -@nOffSet, FechaHoraAvisor)), '2000-01-01') as time,
		MAX(Vision_Strip_Count)-MIN(Vision_Strip_Count) as 'Quantity',
		MAX(Vision_Strip_Rejectad)-MIN(Vision_Strip_Rejectad) as 'Reject'
	FROM [ASW].[AswSch].[AswBitSeñal]
	WHERE
		FechaHoraAvisor >= @ptFechaDesde
		AND FechaHoraAvisor <= @ptFechaHasta
		AND IdCelda = @psIdCelda
	GROUP BY DATEADD(HOUR, DATEDIFF(HOUR, '2000-01-01', DATEADD(hh, -@nOffSet, FechaHoraAvisor)), '2000-01-01')
	ORDER BY 1

END

