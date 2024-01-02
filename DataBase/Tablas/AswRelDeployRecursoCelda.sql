USE [ASW]
GO

/****** Object:  Table [AswSch].[AswRelDeployRecursoCelda]    Script Date: 11/11/2022 05:55:38 p. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [AswSch].[AswRelDeployRecursoCelda](
	[IdRecurso] [int] NULL,
	[IdCelda] [varchar](30) NULL,
	[ClaEstatus] [int] NULL,
	[VersionInstalada] [varchar](10) NULL,
	[BajaLogica] [tinyint] NULL,
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NULL,
	[ClaUsuarioMod] [int] NULL,
	[NombrePcMod] [varchar](64) NULL
) ON [PRIMARY]
GO

ALTER TABLE [AswSch].[AswRelDeployRecursoCelda] ADD  DEFAULT ((0)) FOR [BajaLogica]
GO