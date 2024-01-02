USE [ASW]
GO

/****** Object:  Table [AswSch].[ASWCfgBSCProductionChart]    Script Date: 29/07/2021 11:27:34 p. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [AswSch].[ASWCfgBSCProductionChart](
	[ClaProductionChart] [int] NOT NULL,
	[NomProductionChart] [varchar](100) NULL,
	[RedValue] [numeric](19, 2) NOT NULL,
	[YellowValue] [numeric](19, 2) NOT NULL,
	[GreenValue] [numeric](19, 2) NOT NULL,
	[FechaUltimaMod] [datetime] NULL,
	[NombrePcMod] [varchar](64) NULL,
	[ClaUsuarioMod] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ClaProductionChart] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


