USE [ASW]
GO

/****** Object:  Table [AswSch].[AswCatSeccionParo]    Script Date: 11/11/2022 04:57:50 p. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [AswSch].[AswCatSeccionParo](
	[ClaUbicacion] [int] NOT NULL,
	[ClaArea] [int] NOT NULL,
	[ClaSeccionParo] [int] NOT NULL,
	[NomSeccionParo] [varchar](255) NOT NULL,
	[IdTipoParoGpoParo] [int] NOT NULL,
	[BajaLogica] [tinyint] NOT NULL,
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL,
	[NombrePcMod] [varchar](64) NOT NULL,
	[ClaUsuarioMod] [int] NOT NULL,
	[ClaveSeccionParo] [int] NULL,
 CONSTRAINT [PK_AswCatSeccionParo] PRIMARY KEY CLUSTERED 
(
	[ClaSeccionParo] ASC,
	[ClaUbicacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO