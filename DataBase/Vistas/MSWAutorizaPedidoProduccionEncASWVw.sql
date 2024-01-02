USE [ASW]
GO

/****** Object:  View [AswSch].[MSWAutorizaPedidoProduccionEncASWVw]    Script Date: 14/11/2022 10:19:56 a. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




CREATE VIEW [AswSch].[MSWAutorizaPedidoProduccionEncASWVw]
AS
SELECT [IdPedido]
      ,[ClaveCSR]
      ,[FechaPedido]
      ,[ClaveCliente]
      ,[NomCliente]
      ,[ClaveConsignado]
      ,[NomConsignado]
      ,[LibrasPorSurtir]
      ,[Coll]
      ,[Bulk]
      ,[Otro]
      ,[EmbarqueParcial]
      ,[FechaProbableColl]
      ,[FechaProbableBulk]
      ,[FechaEmbarqueProgramado]
      ,[Comentario]
      ,[AutorizadoProduccion]
      ,[AutorizadoVentas]
      ,[FechaClienteDeseada]
      ,[Dias]
      ,[NomLocalidad]
  FROM [MSW_LNKSVR].[MCSW_ERP].[MSWSch].[MSWAutorizaPedidoProduccionEncASWVw]
  --FROM [AswSch].[AswCatAutorizaPedidoProduccionEnc]


GO



