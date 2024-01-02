USE [ASW]
GO

/****** Object:  Table [AswSch].[ASWCatTipoParo]    Script Date: 11/11/2022 05:04:40 p. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [AswSch].[ASWCatTipoParo](
	[ClaUbicacion] [int] NOT NULL,
	[ClaTipoParo] [int] NOT NULL,
	[NomTipoParo] [varchar](255) NOT NULL,
	[BajaLogica] [tinyint] NOT NULL,
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL,
	[NombrePcMod] [varchar](64) NOT NULL,
	[ClaUsuarioMod] [int] NULL,
 CONSTRAINT [PK_ASWCatTipoParo] PRIMARY KEY CLUSTERED 
(
	[ClaTipoParo] ASC,
	[ClaUbicacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [AswSch].[ASWCatTipoParo] ADD  DEFAULT ((0)) FOR [BajaLogica]
GO

ALTER TABLE [AswSch].[ASWCatTipoParo] ADD  DEFAULT (getdate()) FOR [FechaUltimaMod]
GO

ALTER TABLE [AswSch].[ASWCatTipoParo] ADD  DEFAULT (host_name()) FOR [NombrePcMod]
GO
