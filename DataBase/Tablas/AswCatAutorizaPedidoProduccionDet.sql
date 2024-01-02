USE [ASW]
GO

/****** Object:  Table [AswSch].[AswCatAutorizaPedidoProduccionDet]    Script Date: 11/11/2022 01:37:56 p. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [AswSch].[AswCatAutorizaPedidoProduccionDet](
	[IdPedido] [int] NULL,
	[ClaArticulo] [int] NULL,
	[ClaveArticulo] [varchar](50) NULL,
	[Descripcion] [varchar](250) NULL,
	[Coll] [int] NULL,
	[Bulk] [int] NULL,
	[Otro] [int] NULL,
	[CantidadEmbarcar] [numeric](24, 4) NULL,
	[LibrasEmbarcar] [numeric](38, 6) NULL,
	[PalletsEmbarcar] [numeric](38, 6) NULL,
	[Cantidad] [numeric](22, 4) NULL,
	[Libras] [numeric](38, 6) NULL,
	[Pallets] [numeric](22, 2) NULL
) ON [PRIMARY]
GO


