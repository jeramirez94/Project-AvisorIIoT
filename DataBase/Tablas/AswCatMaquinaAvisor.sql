USE [ASW]
GO

/****** Object:  Table [AswSch].[AswCatMaquina]    Script Date: 17/01/2022 11:37:40 p. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [AswSch].[AswCatMaquinaAvisor](
	[ClaSeñal] [int] identity NOT NULL,
	--[ClaMaquina] [int] NOT NULL,
	--[ClaveMaquina] [varchar](20) NOT NULL,
	--[NomMaquina] [varchar](200) NOT NULL,
	[NomSeñal] [varchar](200) NOT NULL,
	--[NumeroSerie] [varchar](50) NULL,
	--[ClaCuentaReparacion] [int] NULL,
	--[ClaCuentaHerramienta] [int] NULL,
	[ClaCelda] [varchar](30) NULL,
	[Orden] [int] NOT NULL,
	[BajaLogica] [int] NOT NULL,
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL,
	[ClaUsuarioMod] [int] NULL,
	[NombrePcMod] [varchar](64) NOT NULL--,
	--[ClaCuentaOtra] [int] NULL,
	--[ClaTipoMaquina] [int] NULL,
	--[ABCMachine] [varchar](1) NULL,
PRIMARY KEY CLUSTERED 
(
	[ClaSeñal] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO