USE [ASW]
GO

/****** Object:  Table [AswSch].[AswCatMaquinaAux]    Script Date: 15/02/2022 06:30:56 p. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [AswSch].[AswCatGpio](
	[IdGpio] [int] IDENTITY(1,1) NOT NULL,
	[GPIO] [tinyint] NOT NULL,
	[Pin] [tinyint] NOT NULL,
	[Entrada] [varchar](20) NOT NULL,
	[Dispositivo] [varchar](20) NOT NULL,
	[Origen] [varchar](20) NOT NULL,
	[Posicion] [tinyint] NULL,
	[BajaLogica] [int] NULL,
	[FechaBajaLogica] [datetime] NULL,
	[ClaUsuarioMod] [int] NULL,
	[NombrePcMod] [varchar](64) NULL,
	[FechaUltimaMod] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdGpio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
