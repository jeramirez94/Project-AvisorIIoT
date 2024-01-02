USE [ASW]
GO

/****** Object:  Table [AswSch].[ASWCatTipoSeguimientoAlertaMCSW]    Script Date: 11/11/2022 05:11:05 p. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [AswSch].[ASWCatTipoSeguimientoAlertaMCSW](
	[ClaUbicacion] [int] NOT NULL,
	[ClaSistema] [int] NULL,
	[ClaTipoSeguimientoAlerta] [int] NOT NULL,
	[NomTipoSeguimientoAlerta] [varchar](50) NULL,
	[DescTipoSeguimientoAlerta] [varchar](255) NULL,
	[Color] [int] NULL,
	[EsContinuo] [tinyint] NULL,
	[EsSMS] [tinyint] NULL,
	[EsRequiereAcuse] [tinyint] NULL,
	[EsHabilitarAtencion] [tinyint] NULL,
	[MinutosAvisoN1] [int] NULL,
	[MinutosAvisoN2] [int] NULL,
	[MinutosAvisoN3] [int] NULL,
	[MinutosAvisoN4] [int] NULL,
	[MinutosReenvioN3] [int] NULL,
	[MinutosReenvioN4] [int] NULL,
	[BajaLogica] [int] NULL,
	[FechaBajaLogica] [datetime] NULL,
	[ClaUsuarioMod] [int] NULL,
	[FechaUltimaMod] [datetime] NULL,
	[NombrePcMod] [varchar](64) NULL,
 CONSTRAINT [PK_ASWCatTipoSeguimientoAlertaMCSW] PRIMARY KEY CLUSTERED 
(
	[ClaTipoSeguimientoAlerta] ASC,
	[ClaUbicacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

