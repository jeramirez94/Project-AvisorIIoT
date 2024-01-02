USE [ASW]
GO

/****** Object:  Table [AswSch].[AswCatRazonScrapCelda]    Script Date: 11/11/2022 04:54:28 p. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [AswSch].[AswCatRazonScrapCelda](
	[ClaRazonScrapCelda] [int] NULL,
	[NomRazonScrapCelda] [varchar](100) NULL,
	[BajaLogica] [tinyint] NULL,
	[FechaUltimaMod] [datetime] NULL,
	[ClaUsuarioMod] [int] NULL,
	[NombrePcMod] [varchar](50) NULL
) ON [PRIMARY]
GO
