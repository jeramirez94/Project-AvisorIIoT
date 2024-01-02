USE [ASW]
GO

/****** Object:  Table [PaiSch].[PAICatTipoSeguimientoAlerta]    Script Date: 04/10/2020 10:07:16 p. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [AswSch].[AswCatTipoSeguimientoAlerta](
	[ClaUbicacion] [int] NOT NULL,
	[ClaSistema] [int] NOT NULL,
	[ClaTipoSeguimientoAlerta] [int] NOT NULL,
	[NomTipoSeguimientoAlerta] [varchar](50) NOT NULL,
	[DescTipoSeguimientoAlerta] [varchar](255) NOT NULL,
	[Color] [int] NOT NULL,
	[EsContinuo] [tinyint] NOT NULL,
	[EsSMS] [tinyint] NOT NULL,
	[EsRequiereAcuse] [tinyint] NOT NULL,
	[EsHabilitarAtencion] [tinyint] NOT NULL,
	[MinutosAvisoN1] [int] NULL,
	[MinutosAvisoN2] [int] NULL,
	[MinutosAvisoN3] [int] NULL,
	[MinutosReenvioN3] [int] NULL,
	[BajaLogica] [int] NOT NULL DEFAULT ((0)),
	[FechaBajaLogica] [datetime] NULL,
	[ClaUsuarioMod] [int] NOT NULL,
	[FechaUltimaMod] [datetime] NOT NULL DEFAULT (getdate()),
	[NombrePcMod] [varchar](64) NOT NULL DEFAULT (host_name()),
 CONSTRAINT [PK_TipoSeguimientoAlerta] PRIMARY KEY CLUSTERED 
(
	[ClaUbicacion] ASC,
	[ClaSistema] ASC,
	[ClaTipoSeguimientoAlerta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

