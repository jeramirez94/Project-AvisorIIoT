--USE [ASW]
--GO
/****** Object:  StoredProcedure [AswSch].[ASW_CU601_Pag1_ObtenerScrap]    Script Date: 15/11/2022 03:50:01 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- EXEC [AswSch].[ASW_CU305_Pag1_ObtenerTiempo] 68, '2022-06-27T12:00:00Z', '2022-06-27T21:59:21Z' , 34, 1, 0
-- EXEC  [AswSch].[ASW_CU305_Pag1_ObtenerTiempo] $ClaUbicacion, '${__from:date}', '${__to:date}', $Cell, 1
ALTER PROC [AswSch].[ASW_CU601_Pag1_ObtenerScrap]
	@pnClaUbicacion INT
	,@ptFechaDesde DATETIME
	,@ptFechaHasta DATETIME
	,@psIdCelda VARCHAR(30)
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
		,@nTotalScrap VARCHAR(100)
		
		

	IF @pnTiempoUTC = 1
	BEGIN
		SET @ptFechaHasta = dateadd(hh, datediff(hh, getutcdate(), getdate()), @ptFechaHasta)
	END

	SELECT @nClaAreaProduccion = ClaDepartamento 
	FROM [AswSch].[AswCatWorkCenterVw]
	WHERE IdWorkCenter = @psIdCelda

	--obtengo fecha
	SET @tFechaAdm = [AswSch].[ASWGetFechaAdm] (@pnClaUbicacion, @nClaAreaProduccion, @ptFechaHasta)

	--obtengo el inicio y fin de turno para la fecha consultada
	SET @tFechaInicioTurno = [AswSch].[ASWGetInicioTurno](@pnClaUbicacion, @tFechaAdm, @pnClaTurno, @nClaAreaProduccion)
	SET @tFechaFinTurno = [AswSch].[ASWGetFinTurno](@pnClaUbicacion, @tFechaAdm, @pnClaTurno, @nClaAreaProduccion)

	
	SET @nTotalScrap = (SELECT SUM(Peso)
	FROM [AswSch].[ASWTraScrap]
	WHERE IdCelda = @psIdCelda
	AND ClaTurno = @pnClaTurno  AND FechaAdmScada = @tFechaAdm)

	IF @nTotalScrap IS NULL 
		SET @nTotalScrap = 0

	SET @nTotalScrap = 'Scrap: '+CONVERT(VARCHAR,@nTotalScrap)+' lbs'

	SELECT @nTotalScrap AS 'Scrap'

END

