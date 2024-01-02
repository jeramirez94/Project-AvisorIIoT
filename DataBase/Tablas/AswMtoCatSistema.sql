USE [ASW]
GO

/****** Object:  Table [MtoSch].[MtoCatSistema]    Script Date: 26/11/2020 10:43:26 p. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [AswSch].[AswMtoCatSistema](
	[ClaUbicacion] [int] NOT NULL,
	[ClaSistema] [int] NOT NULL,
	[ClaveSistema] [varchar](15) NOT NULL,
	[NomSistema] [varchar](100) NOT NULL,
	[ClaGrupoEquipo] [int] NOT NULL,
	[ClaTipoMantenimiento] [int] NULL,
	[BajaLogica] [int] NOT NULL DEFAULT ((0)),
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL DEFAULT (getdate()),
	[NombrePcMod] [varchar](64) NOT NULL DEFAULT (host_name()),
	[ClaUsuarioMod] [int] NOT NULL,
	[ClaGenerico] [int] NULL,
 CONSTRAINT [PK_AswMtoCatSistema] PRIMARY KEY CLUSTERED 
(
	[ClaUbicacion] ASC,
	[ClaSistema] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO