USE [ASW]
GO

/****** Object:  Table [dbo].[AswSch.AswCatIndicador]    Script Date: 25/09/2020 01:43:30 p. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [AswSch].[AswCatIndicador](
	[ClaIndicador] [tinyint] NOT NULL,
	[NomIndicador] [varchar](50) NOT NULL,
	[Unidad] [varchar](15) NULL,
	[Tipo] [tinyint] NOT NULL,
	[BajaLogica] [bit] NOT NULL,
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL,
	[ClaUsuarioMod] [int] NOT NULL,
	[NombrePcMod] [varchar](64) NOT NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

/****** Object:  Index [CI_ClaIndicador]    Script Date: 25/09/2020 01:46:04 p. m. ******/
CREATE UNIQUE CLUSTERED INDEX [CI_ClaIndicador] ON [AswSch].[AswCatIndicador]
(
	[ClaIndicador] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO




