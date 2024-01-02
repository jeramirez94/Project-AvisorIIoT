USE [ASW]
GO

/****** Object:  Table [AswSch].[ASWTraOrdenProduccion]    Script Date: 12/10/2022 09:11:40 p. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [AswSch].[ASWBitOrdenProduccion](
	[Id] [int] IDENTITY NOT NULL,
	[IdPO] [int]  NULL,	
	[Orden] [int] NULL,
	[UnidadesProducidas] [numeric](14, 6) NULL,
	[ClaEstatus] [int]  NULL,
	[ClaUsuarioMod] [int]  NULL,
	[NombrePcMod] [varchar](64)  NULL,
	[FechaUltimaMod] [datetime]  NULL,
	[IdPONuevo] [int]  NULL,	
	[OrdenNuevo] [int] NULL,
	[UnidadesProducidasNuevo] [numeric](14, 6) NULL,
	[ClaEstatusNuevo] [int]  NULL,
	[ClaUsuarioModNuevo] [int]  NULL,
	[NombrePcModNuevo] [varchar](64)  NULL,
	[FechaUltimaModNuevo] [datetime]  NULL,
 CONSTRAINT [pk_ASWBitOrdenProduccion] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [AswSch].[ASWBitOrdenProduccion] ADD  DEFAULT (getdate()) FOR [FechaUltimaMod]
GO