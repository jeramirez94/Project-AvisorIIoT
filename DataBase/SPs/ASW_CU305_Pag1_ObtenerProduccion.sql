--USE [ASW]
--GO
/****** Object:  StoredProcedure [AswSch].[ASW_CU305_Pag1_ObtenerProduccion]    Script Date: 15/11/2022 02:53:43 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- EXEC [AswSch].[ASW_CU305_Pag1_ObtenerProduccion] 68, '2022-06-27T12:00:00Z', '2022-06-27T21:59:21Z' , 34, 1, 0
-- EXEC  [AswSch].[ASW_CU305_Pag1_ObtenerProduccion] $ClaUbicacion, '${__from:date}', '${__to:date}', $Cell, 1
ALTER PROC [AswSch].[ASW_CU305_Pag1_ObtenerProduccion]
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

	--SELECT 
	--	CASE WHEN @pnTiempoUTC=1 THEN dateadd(hh, -datediff(hh, getutcdate(), getdate()), FechaHoraAvisor) ELSE FechaHoraAvisor END AS time
	--	,[Header_Status]
	--	,[Threader_Status]
	--	,[Collator_Status]
	--	,[Robot_Status]
	--FROM [AswSch].[AswBitSeñal]
	--WHERE 
	--	FechaHoraAvisor >= @ptFechaDesde
	--	AND FechaHoraAvisor <= @ptFechaHasta
	--	and IdCelda = @psIdCelda
	--ORDER BY 1

	SELECT
		DATEADD(HOUR, DATEDIFF(HOUR, '2000-01-01', dateadd(hh, -@nOffSet, FechaHoraAvisor)), '2000-01-01') as time,
		MAX(aswbs.Robot_Nail_Production) - MIN(aswbs.Robot_Nail_Production) as 'Nails/Hr',
		MAX(aswbs.Robot_Box_Production) - MIN(aswbs.Robot_Box_Production) as 'Box/Hr',
		((CASE WHEN MAX(aswcc.NPM) IS NULL THEN 0 ELSE MAX(aswcc.NPM) END +
		CASE WHEN MAX(aswcc.NPM2) IS NULL THEN 0 ELSE MAX(aswcc.NPM2) END +
		CASE WHEN MAX(aswcc.NPM3) IS NULL THEN 0 ELSE MAX(aswcc.NPM3) END)* MAX(CantWafios)) * 60 as 'Capacity'
	FROM [AswSch].[AswBitSeñal] aswbs
	JOIN [AswSch].[AswCatWorkCenterVw] aswcc
		ON aswcc.IdWorkCenter = aswbs.IdCelda
	WHERE
		FechaHoraAvisor >= @ptFechaDesde
		AND FechaHoraAvisor <= @ptFechaHasta
		and aswbs.IdCelda = @psIdCelda

	GROUP BY DATEADD(HOUR, DATEDIFF(HOUR, '2000-01-01', dateadd(hh, -@nOffSet, FechaHoraAvisor)), '2000-01-01')
	ORDER BY 1

END

