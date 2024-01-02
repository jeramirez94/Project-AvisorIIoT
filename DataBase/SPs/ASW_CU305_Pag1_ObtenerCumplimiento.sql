--USE [ASW]
--GO

/****** Object:  StoredProcedure [AswSch].[ASW_CU305_Pag1_ObtenerCumplimiento]    Script Date: 19/02/2023 09:29:52 p. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO
/*========================================== 
* CU305.1 
* Objetivo: Obtener el cumplimiento a la produccion en el turno actual
* Autor: mrodriguezc
* Fecha: 2023-02-17 
-- EXEC [AswSch].[ASW_CU305_Pag1_ObtenerCumplimiento] 68, '2022-06-27T12:00:00Z', '2022-06-27T21:59:21Z' , 34, 1, 0
-- EXEC [AswSch].[ASW_CU305_Pag1_ObtenerCumplimiento] 65, '2023-02-16T06:00:00Z', '2023-02-16T23:59:59.000Z', 'FF-04', 1, 1
-- EXEC  [AswSch].[ASW_CU305_Pag1_ObtenerCumplimiento] $ClaUbicacion, '${__from:date}', '${__to:date}', $Cell, 1
*========================================== */ 
ALTER PROC [AswSch].[ASW_CU305_Pag1_ObtenerCumplimiento]
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
		,@nClaDepartamento INT
		,@nClaTurno INT
		,@tFechaAdm DATETIME
		,@tFechaInicioTurno DATETIME

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


	SELECT @nClaDepartamento = ClaDepartamento 
	FROM [AswSch].[AswCatWorkCenterVw]
	WHERE IdWorkCenter = @psIdCelda	

	--obtengo el turno y fecha
	SET @nClaTurno = [AswSch].[ASWGetTurno] (@pnClaUbicacion, @nClaDepartamento, @ptFechaHasta)
	SET @tFechaAdm = [AswSch].[ASWGetFechaAdm] (@pnClaUbicacion, @nClaDepartamento, @ptFechaHasta)
	SET @tFechaInicioTurno = [AswSch].[ASWGetInicioTurno](@pnClaUbicacion, @tFechaAdm, @nClaTurno, @nClaDepartamento)

	SELECT DATEADD(hh, -@nOffSet, @tFechaInicioTurno) AS time
		,0 AS Real
		,0 AS Expected
	UNION
	SELECT DATEADD(minute, +59, DATEADD(hh, -@nOffSet, FechaReporte)) AS time
		--,Hora
		,Cajas AS Real
		--,RunHrs*2 AS Expected
		,CASE
		--en base a tiempo y capacidad
		WHEN Cajas = 0 THEN Capacidad*RunHrs
		--cuando el cumplimiento es 0
		WHEN Cumplimiento = 0 THEN 0
		--Default
		ELSE Cajas/Cumplimiento*100 END AS Expected
	FROM [AswSch].[AswEstEgeHora]
	WHERE IdCelda = @psIdCelda
		AND FechaAdmScada = @tFechaAdm
		AND ClaTurno = @nClaTurno
	ORDER BY 1 

END

GO


