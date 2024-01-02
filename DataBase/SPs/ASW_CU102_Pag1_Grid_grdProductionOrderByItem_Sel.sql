--USE [ASW]
--GO
/****** Object:  StoredProcedure [AswSch].[ASW_CU102_Pag1_Grid_grdProductionOrderByItem_Sel]    Script Date: 17/01/2023 09:41:49 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--EXEC ASWSch.ASW_CU102_Pag1_Grid_grdProductionOrderByItem_Sel 68, '2020-03-08',1,1,1
ALTER PROCEDURE [AswSch].[ASW_CU102_Pag1_Grid_grdProductionOrderByItem_Sel]
	@pnClaUbicacion INT
	,@ptShowUntil DATETIME
	,@pnClaArticuloSel INT
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
		--AND LibrasPorSurtir > 0
		--AND NomLocalidad IN (SELECT Value FROM [ASWSch].[ASWSplitKeyFn]((SELECT SValor2 FROM [AswSch].[ASWCfgConfiguracion] WHERE ClaUbicacion = 68 AND ClaConfiguracion = 2),','))
		AND ClaArticulo = @pnClaArticuloSel
	--GROUP BY D.ClaArticulo, D.ClaveArticulo, Descripcion, D.Coll, D.[Bulk], D.Otro, E.FechaClienteDeseada
	ORDER BY E.ClaDepartamento, E.IdCelda, Orden

	
END