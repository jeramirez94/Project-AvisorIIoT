USE [ASW]
GO

/****** Object:  Table [AswSch].[AswCatMaquina]    Script Date: 13/10/2021 02:26:11 p. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [AswSch].[AswCatMaquinaAux](
	[IdMaquinaAux] [int] identity,
	[ClaOrigen] [int] NOT NULL,--maquina o señal
	[PullyArms] [int]  NULL,
	[PulleyRevs] [numeric](7,4)  NULL,
	[NailsPerRev] [int] NULL,
	[RobotBrand] [varchar](15) NULL,
	[EsGralProduccion] bit,
	[EsGralParos] bit,
	[EsMaquina] bit, --1 catalogo assets, 0 catalogo señales
	[TipoSeñal] tinyint, --1 GPIO, 2 Robot, 3 Datablock/PLC, 4 DB Estandar
	[ClaMaquinaReporta] int --idComponente o 0
PRIMARY KEY CLUSTERED 
(
	[IdMaquinaAux] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


