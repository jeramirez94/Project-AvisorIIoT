USE [ASW]
GO
/****** Object:  StoredProcedure [AswSch].[ASW_CU102_Pag1_Grid_grdSaleOrder_Sel]    Script Date: 14/11/2022 01:24:04 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--EXEC ASWSch.ASW_CU102_Pag1_Grid_grdSaleOrder_Sel 68, '2020-03-08',1,1,1
ALTER PROCEDURE [AswSch].[ASW_CU102_Pag1_Grid_grdSaleOrder_Sel]
	@pnClaUbicacion INT
	,@ptShowUntil DATETIME
	,@pnClaArticuloSel INT
AS
BEGIN
	SELECT E.IdPedido AS SaleOrder
		,NomConsignado AS ShipTo
		,CantidadEmbarcar AS ItemQty
		,LibrasEmbarcar AS ItemLbs
		,LibrasPorSurtir AS OrderLbs
		,FechaEmbarqueProgramado AS EstimatedShipDate
		,FechaClienteDeseada AS RequestedShipDate
		,Comentario AuthorizationComment
	FROM [AswSch].[MSWAutorizaPedidoProduccionEncASWVw] E 
	JOIN [AswSch].[MSWAutorizaPedidoProduccionDetASWVw] D
		ON E.IdPedido = D.IdPedido
	WHERE  E.FechaClienteDeseada <= @ptShowUntil
		AND LibrasPorSurtir > 0
		AND NomLocalidad IN (SELECT Value FROM [ASWSch].[ASWSplitKeyFn]((SELECT SValor2 FROM [AswSch].[ASWCfgConfiguracion] WHERE ClaUbicacion = 68 AND ClaConfiguracion = 2),','))
		AND ClaArticulo = @pnClaArticuloSel
	--GROUP BY D.ClaArticulo, D.ClaveArticulo, Descripcion, D.Coll, D.[Bulk], D.Otro, E.FechaClienteDeseada

	
END