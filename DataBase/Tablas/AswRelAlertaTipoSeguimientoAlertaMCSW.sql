USE [ASW]
GO

/****** Object:  Table [AswSch].[AswRelAlertaTipoSeguimientoAlertaMCSW]    Script Date: 11/11/2022 05:53:27 p. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [AswSch].[AswRelAlertaTipoSeguimientoAlertaMCSW](
	[ClaUbicacion] [int] NOT NULL,
	[ClaSistema] [int] NULL,
	[ClaAlerta] [int] NOT NULL,
	[ClaTipoSeguimientoAlerta] [int] NULL,
	[BajaLogica] [int] NULL,
	[FechaBajaLogica] [datetime] NULL,
	[ClaUsuarioMod] [int] NULL,
	[FechaUltimaMod] [datetime] NULL,
	[NombrePcMod] [varchar](64) NULL,
 CONSTRAINT [PK_AswRelAlertaTipoSeguimientoAlertaMCSW] PRIMARY KEY CLUSTERED 
(
	[ClaUbicacion] ASC,
	[ClaAlerta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
