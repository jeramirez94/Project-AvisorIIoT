USE [ASW]
GO

/****** Object:  Table [AswSch].[ASWRelTipoParoGpoParo]    Script Date: 11/11/2022 05:58:00 p. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [AswSch].[ASWRelTipoParoGpoParo](
	[ClaUbicacion] [int] NOT NULL,
	[IdTipoParoGpoParo] [int] NOT NULL,
	[ClaGpoParo] [int] NULL,
	[ClaTipoParo] [int] NOT NULL,
	[NomTipoParo] [varchar](255) NULL,
	[EsNoAplicaEficiencia] [tinyint] NULL,
	[EsNoAplicaAprovechamiento] [tinyint] NULL,
	[EsProgramado] [tinyint] NULL,
	[EsAplicaEficiencia] [tinyint] NULL,
	[EsAplicaAprovechamiento] [int] NULL,
	[BajaLogica] [tinyint] NULL,
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NULL,
	[NombrePcMod] [varchar](64) NULL,
	[ClaUsuarioMod] [int] NULL,
	[ClaRubroParo] [int] NULL,
 CONSTRAINT [PK_ASWRelTipoParoGpoParo] PRIMARY KEY CLUSTERED 
(
	[IdTipoParoGpoParo] ASC,
	[ClaTipoParo] ASC,
	[ClaUbicacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO