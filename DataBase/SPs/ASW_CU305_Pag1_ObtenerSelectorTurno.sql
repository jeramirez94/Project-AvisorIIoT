--USE [ASW]
--GO
/****** Object:  StoredProcedure [AswSch].[ASW_CU305_Pag1_ObtenerTurno]    Script Date: 16/02/2023 01:37:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*========================================== 
* CU: 305.1 
* Objetivo: Obtener la informacion de turnos disponibles para el selector de turnos de Grafana
* Autor: mrodriguezc 
* Fecha: 2023-02-17 
* EXEC [AswSch].[ASW_CU305_Pag1_ObtenerSelectorTurno] 65, '2022-06-27T21:59:21Z' , 'FF-02', 1, 1
* EXEC  [AswSch].[ASW_CU305_Pag1_ObtenerSelectorTurno] 65, '2023-02-17T06:00:00.000Z', 'FF-05', 1, 1
* EXEC  [AswSch].[ASW_CU305_Pag1_ObtenerSelectorTurno] $ClaUbicacion, '${__to:date}', '$Cell', 1
*========================================== */ 
ALTER PROC [AswSch].[ASW_CU305_Pag1_ObtenerSelectorTurno]
	@pnClaUbicacion INT
	--,@ptFechaDesde DATETIME
	,@ptFechaHasta DATETIME
	,@psIdCelda VARCHAR(30)
	,@pnTiempoUTC INT = 0
	,@pnDebug INT = 0
AS
BEGIN

	DECLARE 
		@nClaDepartamento INT
		,@nOffSet INT
		,@nClaTurno INT
		,@tFechaAdm DATETIME

	IF @pnTiempoUTC = 1
	BEGIN
		SET @nOffSet = datediff(hh, getutcdate(), getdate())
	END
	ELSE
	BEGIN
		SET @nOffSet=0
	END

	
	--SET @ptFechaDesde = dateadd(hh, @nOffSet, @ptFechaDesde)
	SET @ptFechaHasta = dateadd(hh, @nOffSet, @ptFechaHasta)	

	SELECT @nClaDepartamento = ClaDepartamento 
	FROM [AswSch].[AswCatWorkCenterVw]
	WHERE IdWorkCenter = @psIdCelda

	--obtengo el turno y fecha
	SET @nClaTurno = [AswSch].[ASWGetTurno] (@pnClaUbicacion, @nClaDepartamento, @ptFechaHasta)
	SET @tFechaAdm = [AswSch].[ASWGetFechaAdm] (@pnClaUbicacion, @nClaDepartamento, @ptFechaHasta)

	IF(@pnDebug = 1)
	BEGIN
		SELECT @nClaTurno AS ClaTurno
			,@tFechaAdm AS FechaAdm
			,@ptFechaHasta AS FechaHasta
			,@nClaDepartamento AS ClaDepartamento
		SELECT [AswSch].[ASWGetInicioTurno](@pnClaUbicacion, @tFechaAdm, @nClaTurno, @nClaDepartamento) AS 'time_from'
			,[AswSch].[ASWGetFinTurno](@pnClaUbicacion, @tFechaAdm, @nClaTurno, @nClaDepartamento) AS 'time_to'
	END

	SELECT DATEADD(hh, -@nOffSet,[AswSch].[ASWGetInicioTurno](@pnClaUbicacion, @tFechaAdm, T.ClaTurno, @nClaDepartamento)) AS 'time_from',
		DATEADD(hh, -@nOffSet, DATEADD(SECOND, -1, [AswSch].[ASWGetFinTurno](@pnClaUbicacion, @tFechaAdm, T.ClaTurno, @nClaDepartamento))) AS 'time_to',
		'Shift: '+T.NomTurno AS 'button_text'
	FROM AswSch.AswCatTurno T
	JOIN AswSch.AswRelTurnoDepartamentoHorario RelTurno
		ON T.ClaUbicacion = RelTurno.ClaUbicacion
		AND T.ClaTurno = RelTurno.ClaTurno
	JOIN AswSch.AswCatWorkCenterVw Cel
		ON RelTurno.ClaDepartamento = Cel.ClaDepartamento
	WHERE Cel.IdWorkCenter = @psIdCelda
		AND T.BajaLogica = 0
		AND T.ClaTurno > 0

END

