USE [ASW]
GO

/****** Object:  Table [AswSch].[ASWCfgProgPeriodo]    Script Date: 11/04/2023 09:23:10 a. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [AswSch].[ASWCfgProgPeriodo](
	[ClaUbicacion] [int] NOT NULL,
	[ClaPeriodo] [int] NOT NULL,
	[Anio] [int] NOT NULL,
	[ClavePeriodo] [int] NOT NULL,
	[VersionActual] [int] NOT NULL,
	[FechaInicial] [datetime] NULL,
	[FechaFinal] [datetime] NULL,
	[ClaEstatus] [tinyint] NOT NULL,
	[FechaPublicacion] [datetime] NULL,
	[FechaEnvio] [datetime] NULL,
	[EnvioMail] [tinyint] NULL,
	[FechaUltimaMod] [datetime] NULL,
	[ClaUsuarioMod] [int] NULL,
	[NombrePcMod] [varchar](150) NULL,
	[idFolioCarga] [int] NULL,
 CONSTRAINT [PK_ASWCfgProgPeriodo] PRIMARY KEY CLUSTERED 
(
	[ClaUbicacion] ASC,
	[ClaPeriodo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO


