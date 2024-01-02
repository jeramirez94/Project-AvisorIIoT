--USE [ASW]
--GO
/****** Object:  StoredProcedure [AswSch].[ASW_CU102_Pag1_Grid_grdProductionOrderByLocation_Sel]    Script Date: 17/01/2023 09:51:56 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--EXEC ASWSch.ASW_CU102_Pag1_Grid_grdProductionOrderByLocation_Sel 68, NULL, NULL
ALTER PROCEDURE [AswSch].[ASW_CU102_Pag1_Grid_grdProductionOrderByLocation_Sel]
	@pnClaUbicacion INT
	,@pnClaDepartamento INT
	,@psIdCelda VARCHAR(30)
AS
BEGIN
	DECLARE
		@tFechaActual DATETIME

	SET @tFechaActual = CONVERT(VARCHAR(10), GETDATE(), 120)

	SELECT E.IdPO AS ProductionOrder
		,E.ClavePO AS ClavePO
		,E.WO AS WO
		,D.NomDepartamento AS Department
		,ClaveWorkCenter AS Cell
		,ClaveArticulo AS Item
		,UnidadesProgramadas AS ScheduledBox
		,UnidadesProducidas AS ProducedBox
		,UnidadesProgramadas-UnidadesProducidas AS BoxesTBP
		,NomEstatus AS OrderStatus
		,NotasProduccion AS ProductionNotes
	FROM [AswSch].[ASWTraOrdenProduccion] E 
	--LEFT JOIN [AswSch].[ASWTraOrdenProduccionDet] D
	--	ON E.ClaUbicacion = D.ClaUbicacion
	--	AND E.IdPO = D.IdPO
	LEFT JOIN [AswSch].[AswCatDepartamentoVw] D
		ON E.ClaDepartamento = D.ClaDepartamento
	LEFT JOIN [AswSch].[AswCatEstatus] S
		ON E.ClaEstatus = S.ClaEstatus
	LEFT JOIN [AswSch].[AswCatWorkCenterVw] C
		ON E.IdCelda = C.IdWorkCenter
	WHERE  (E.ClaEstatus IN (1,2,5) OR FechaCaptura>= @tFechaActual)
		AND (@pnClaDepartamento IS NULL OR E.ClaDepartamento=@pnClaDepartamento)
		AND (@psIdCelda IS NULL OR E.IdCelda = @psIdCelda)
	ORDER BY E.ClaDepartamento, E.IdCelda, Orden

	
END