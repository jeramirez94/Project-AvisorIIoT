USE [ASW]
GO

/****** Object:  Table [AswSch].[AswRelAlertaSeccionParoMCSW]    Script Date: 11/11/2022 05:50:42 p. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [AswSch].[AswRelAlertaSeccionParoMCSW](
	[ClaUbicacion] [int] NOT NULL,
	[IdRelAlertaSeccionParo] [int] NOT NULL,
	[ClaAlerta] [int] NULL,
	[ClaSeccionParo] [int] NOT NULL,
	[ClaArea] [int] NULL,
	[ClaUsuarioMod] [int] NULL,
	[FechaUltimaMod] [datetime] NULL,
	[NombrePcMod] [varchar](64) NULL,
	[BajaLogica] [int] NULL,
	[FechaBajaLogica] [datetime] NULL,
	[EsParo] [tinyint] NULL,
	[EsAlerta] [tinyint] NULL,
 CONSTRAINT [PK_AswRelAlertaSeccionParoMCSW] PRIMARY KEY CLUSTERED 
(
	[IdRelAlertaSeccionParo] ASC,
	[ClaUbicacion] ASC,
	[ClaSeccionParo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
