--USE [ASW]
--GO
/****** Object:  StoredProcedure [AswSch].[ASW_CU305_Pag1_ObtenerOrdenProduccion]    Script Date: 15/11/2022 02:51:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- EXEC [AswSch].[ASW_CU305_Pag1_ObtenerOrdenProduccion] 68, '2022-06-27T12:00:00Z', '2022-06-27T21:59:21Z' , 34, 1, 0
-- EXEC  [AswSch].[ASW_CU305_Pag1_ObtenerOrdenProduccion] $ClaUbicacion, '${__from:date}', '${__to:date}', $Cell, 1
ALTER PROC [AswSch].[ASW_CU305_Pag1_ObtenerOrdenProduccion]
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

	SELECT TOP 1 'WO #'+ CAST(WO AS VARCHAR(6)) AS WO
	  ,ClaveArticulo
	FROM [AswSch].[AswTraOrdenProduccion]
	WHERE IdCelda = @psIdCelda
	  AND ClaEstatus=2
	ORDER BY FechaFinReal DESC


END

