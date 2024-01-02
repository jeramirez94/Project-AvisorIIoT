USE [ASW]
GO

/****** Object:  Table [AswSch].[AswCatAutorizaPedidoProduccionEnc]    Script Date: 11/11/2022 01:41:45 p. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [AswSch].[AswCatAutorizaPedidoProduccionEnc](
	[IdPedido] [int] NULL,
	[ClaveCSR] [varchar](20) NULL,
	[FechaPedido] [datetime] NULL,
	[ClaveCliente] [varchar](10) NULL,
	[NomCliente] [varchar](250) NULL,
	[ClaveConsignado] [int] NULL,
	[NomConsignado] [varchar](140) NULL,
	[LibrasPorSurtir] [numeric](22, 2) NULL,
	[Coll] [int] NULL,
	[Bulk] [int] NULL,
	[Otro] [int] NULL,
	[EmbarqueParcial] [int] NULL,
	[FechaProbableColl] [datetime] NULL,
	[FechaProbableBulk] [datetime] NULL,
	[FechaEmbarqueProgramado] [datetime] NULL,
	[Comentario] [varchar](100) NULL,
	[AutorizadoProduccion] [int] NULL,
	[AutorizadoVentas] [int] NULL,
	[FechaClienteDeseada] [datetime] NULL,
	[Dias] [int] NULL,
	[NomLocalidad] [varchar](20) NULL
) ON [PRIMARY]
GO


