USE	ASW
GO

/****** Object:  Table [PALSch].[PALTraOPM]    Script Date: 8/23/2018 12:36:01 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO
--DROP TABLE [ASWSch].[ASWTraOrdenProduccionDet]
CREATE TABLE [ASWSch].[ASWTraOrdenProduccionDet](
	[ClaUbicacion] [int] NOT NULL,
	[IdPO] [int] NOT NULL,
	[IdUnidad] [int] NOT NULL,--consecutivo
	[IdComponente][int],
	[ABCMachine][Varchar](1),
	[EsTerminado] [int] NOT NULL DEFAULT(0),
	[EsAdicional] [int] NOT NULL DEFAULT(0),
	[FechaInicioReal] [datetime] NULL,
	[FechaInicioAdm] [datetime] NULL,
	[FechaFinReal] [datetime] NULL,
	[FechaFinAdm] [datetime] NULL,

	--TBD
	[IdTrazabilidad] [int] NULL,

	[BajaLogica] [tinyint] NOT NULL DEFAULT (0),
	[FechaBajaLogica] [datetime] NULL,
	[ClaUsuarioMod] [int] NOT NULL,
	[NombrePcMod] [varchar](64) NOT NULL,
	[FechaUltimaMod] [datetime] NOT NULL DEFAULT (getdate()),
 CONSTRAINT [pk_ASWTraOrdenProduccionDet] PRIMARY KEY CLUSTERED 
(
	[ClaUbicacion] ASC,
	[IdPO] ASC,
	[IdUnidad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [ASWSch].[ASWTraOrdenProduccionDet] ADD ClaTurno INT