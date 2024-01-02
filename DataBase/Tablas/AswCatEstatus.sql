USE [ASW]
GO

/****** Object:  Table [AswSch].[AswCatEstatus]    Script Date: 13/03/2020 09:44:12 a. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [AswSch].[AswCatEstatus](
	[ClaEstatus] [int] NOT NULL,
	[NomEstatus] [varchar](15) NULL,
	[BajaLogica] [int] NULL,
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


/****** Object:  Index [UC_ClaEstatus]    Script Date: 24/08/2020 06:21:18 a. m. ******/
CREATE UNIQUE CLUSTERED INDEX [UC_ClaEstatus] ON [AswSch].[AswCatEstatus]
(
	[ClaEstatus] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO

