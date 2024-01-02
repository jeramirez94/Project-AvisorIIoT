--USE [ASW]
--GO
/****** Object:  StoredProcedure [AswSch].[ASW_CU305_Pag1_ObtenerTurno]    Script Date: 15/11/2022 02:55:41 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*========================================== 
* CU: 305.1 
* Objetivo: Obtener el turno correspondiente a la fecha Hasta
* Autor: mrodriguezc 
* Fecha: 2023-02-17 
* EXEC [AswSch].[ASW_CU305_Pag1_ObtenerTurno] 68, '2022-06-27T12:00:00Z', '2022-06-27T21:59:21Z' , 34, 1, 0
* EXEC  [AswSch].[ASW_CU305_Pag1_ObtenerTurno] $ClaUbicacion, '${__from:date}', '${__to:date}', $Cell, 1
*========================================== */ 
ALTER PROC [AswSch].[ASW_CU305_Pag1_ObtenerTurno]
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

	;WITH cteTurno AS (
	SELECT IdWorkCenter AS IdCelda
		,ClaDepartamento AS ClaDepartamento
		,ClaArea AS ClaArea
		,[AswSch].[ASWGetTurno] (@pnClaUbicacion, ClaDepartamento, @ptFechaHasta) AS ClaTurno
		,[AswSch].[ASWGetFechaAdm] (@pnClaUbicacion, ClaDepartamento, @ptFechaHasta) AS FechaAdm
	FROM [AswSch].[AswCatWorkCenterVw]
	WHERE IdWorkCenter = @psIdCelda
	)

	SELECT CASE T.ClaTurno WHEN -1 THEN NomTurno ELSE 'Shift: '+NomTurno END AS NomTurno
	FROM cteTurno C
		JOIN [AswSch].[AswCatTurno] T
		ON C.ClaTurno = T.ClaTurno 

END

