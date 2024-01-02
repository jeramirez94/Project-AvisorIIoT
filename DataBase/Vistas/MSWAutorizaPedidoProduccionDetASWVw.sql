USE [ASW]
GO

/****** Object:  View [AswSch].[MSWAutorizaPedidoProduccionDetASWVw]    Script Date: 14/11/2022 10:18:32 a. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




CREATE VIEW [AswSch].[MSWAutorizaPedidoProduccionDetASWVw]
AS
SELECT [IdPedido]
      ,[ClaArticulo]
      ,[ClaveArticulo]
      ,[Descripcion]
      ,[Coll]
      ,[Bulk]
      ,[Otro]
      ,[CantidadEmbarcar]
      ,[LibrasEmbarcar]
      ,[PalletsEmbarcar]
      ,[Cantidad]
      ,[Libras]
      ,[Pallets]
  FROM [MSW_LNKSVR].[MCSW_ERP].[MSWSch].[MSWAutorizaPedidoProduccionDetASWVw]
  --FROM [AswSch].[AswCatAutorizaPedidoProduccionDet]


GO



