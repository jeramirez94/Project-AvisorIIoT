USE [ASW]
GO

/****** Object:  Table [MtoSch].[MTOCatSubSistema]    Script Date: 26/11/2020 10:44:06 p. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [AswSch].[AswMtoCatSubSistema](
	[ClaUbicacion] [int] NOT NULL,
	[ClaSistema] [int] NOT NULL,
	[ClaSubSistema] [int] NOT NULL,
	[ClaveSubSistema] [varchar](20) NOT NULL,
	[NomSubSistema] [varchar](100) NOT NULL,
	[BajaLogica] [int] NOT NULL DEFAULT ((0)),
	[FechaBajaLogica] [datetime] NULL,
	[NombrePcMod] [varchar](64) NOT NULL DEFAULT (host_name()),
	[ClaUsuarioMod] [int] NOT NULL,
	[FechaUltimaMod] [datetime] NOT NULL DEFAULT (getdate()),
	[ClaGenerico] [int] NULL,
 CONSTRAINT [PK_AswMtoCatSubSistema] PRIMARY KEY CLUSTERED 
(
	[ClaUbicacion] ASC,
	[ClaSistema] ASC,
	[ClaSubSistema] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO