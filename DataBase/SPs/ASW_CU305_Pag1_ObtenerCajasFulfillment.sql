--USE [ASW]
--GO
/****** Object:  StoredProcedure [AswSch].[ASW_CU305_Pag1_ObtenerCajasFulfillment]    Script Date: 15/11/2022 02:41:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*==========================================
* CU: 305.1
* Objetivo: Obtiene las cajas producidas en el turno correspondiente a la fecha Hasta, el resultado lo regresa formateado de acuerdo al 
*			cumplimiento en unidades
* Autor: mrodriguezc
* Fecha: 2023-02-28
* EXEC [AswSch].[ASW_CU305_Pag1_ObtenerCajasFulfillment] 68, '2022-06-27T12:00:00Z', '2022-06-27T21:59:21Z' , 34, 1, 0
* EXEC  [AswSch].[ASW_CU305_Pag1_ObtenerCajasFulfillment] 65, '2023-02-17T13:00:00.000Z', '2023-02-28T18:19:58.083Z', 'FF-05', 1, 1, 1
* EXEC  [AswSch].[ASW_CU305_Pag1_ObtenerCajasFulfillment] 65, '2023-02-17T13:00:00.000Z', '2023-02-28T18:19:58.083Z', 'FF-05', 0, 1, 1
* EXEC  [AswSch].[ASW_CU305_Pag1_ObtenerCajasFulfillment] $ClaUbicacion, '${__from:date}', '${__to:date}', $Cell, 1
* 15/01/2023 MRODRIGUEZC Se actualizo el tipo de variable de @pnIdCelda INT a * @psIdCelda VARCHAR(30) para soportar las claves de maquina del sistema MAN
*========================================== */
ALTER PROC [AswSch].[ASW_CU305_Pag1_ObtenerCajasFulfillment]
	@pnClaUbicacion INT
	,@ptFechaDesde DATETIME
	,@ptFechaHasta DATETIME
	,@psIdCelda VARCHAR(30)
	,@pnPerformance INT = 0
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

		,@nCajas INT
		,@nObjetivo FLOAT
		

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
		SELECT @nClaTurno AS ClaTurno
			,@tFechaAdm AS FechaAdm
			,@tFechaInicioTurno AS FechaInicioTurno
			,@tFechaFinTurno AS FechaFinTurno

		SELECT *
		FROM [AswSch].[AswEstEgeHora]
		WHERE IdCelda = @psIdCelda
			AND FechaAdmScada = @tFechaAdm
			AND ClaTurno = @nClaTurno
			AND FechaReporte < @tFechaFinTurno
		ORDER BY FechaReporte DESC

	END
	
	SELECT TOP 1 @nCajas = Cajas
		,@nObjetivo = CASE
						--en base a tiempo y capacidad
						WHEN Cajas = 0 THEN Capacidad*RunHrs
						--cuando el cumplimiento es 0
						WHEN Cumplimiento = 0 THEN 0
						--Default
						ELSE Cajas/Cumplimiento*100 END 
	FROM [AswSch].[AswEstEgeHora]
	WHERE IdCelda = @psIdCelda
		AND FechaAdmScada = @tFechaAdm
		AND ClaTurno = @nClaTurno
		AND FechaReporte < @tFechaFinTurno
	ORDER BY FechaReporte DESC

	IF @nCajas IS NULL
	BEGIN
		SELECT 'not started' AS [not started]
	END
	ELSE
	BEGIN--cajas no nulas
		IF (@pnPerformance = 0)
		BEGIN--no se usa performance
			IF @nCajas>=@nObjetivo
			BEGIN
				SELECT [AswSch].[ASWFormatNumber](@nCajas,0,'') + ' Units' AS [green units]
			END
			ELSE
			BEGIN
				SELECT [AswSch].[ASWFormatNumber](@nCajas,0,'') + ' Units' AS [red units]
			END
		END
		ELSE
		BEGIN--se usa performance
			IF @nCajas>=@nObjetivo
			BEGIN
				SELECT [AswSch].[ASWFormatNumber](@nCajas,0,'') + '/' + [AswSch].[ASWFormatNumber](@nObjetivo,0,'') + ' Units' AS [green fulfillment]
			END
			ELSE
			BEGIN
				SELECT [AswSch].[ASWFormatNumber](@nCajas,0,'') + '/' + [AswSch].[ASWFormatNumber](@nObjetivo,0,'') + ' Units' AS [red fulfillment]
			END
		END
	END

	IF @pnDebug = 1
	BEGIN
		SELECT 'not started' AS [not started]
			,[AswSch].[ASWFormatNumber](@nCajas,0,'') + ' Units' AS [green units]
			,[AswSch].[ASWFormatNumber](@nCajas,0,'') + ' Units' AS [red units]
			,[AswSch].[ASWFormatNumber](@nCajas,0,'') + '/' + [AswSch].[ASWFormatNumber](@nObjetivo,0,'') + ' Units' AS [green fulfillment]
			,[AswSch].[ASWFormatNumber](@nCajas,0,'') + '/' + [AswSch].[ASWFormatNumber](@nObjetivo,0,'') + ' Units' AS [red fulfillment]
	END
	
END

