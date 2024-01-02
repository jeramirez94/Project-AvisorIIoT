USE [ASW]
GO

/****** Object:  Table [AswSch].[AswTraPPLSrvSecuenciaMicroprogramaSemanalCarga]    Script Date: 11/04/2023 09:28:25 a. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [AswSch].[AswTraPPLSrvSecuenciaMicroprogramaSemanalCarga](
	[ClaUbicacion] [int] NULL,
	[ClaAreaProduccion] [int] NULL,
	[ClaveAreaProduccion] [int] NULL,
	[NomAreaProduccion] [varchar](250) NULL,
	[ClaGrupoMaquina] [int] NULL,
	[ClaveGrupoMaquina] [int] NULL,
	[NomGrupoMaquina] [varchar](250) NULL,
	[ClaMaquina] [varchar](100) NULL,
	[ClaPeriodo] [int] NULL,
	[ClaArticulo] [int] NULL,
	[ClaveArticulo] [varchar](150) NULL,
	[NomArticulo] [varchar](1000) NULL,
	[ClaUnidad] [int] NULL,
	[NomUnidad] [varchar](250) NULL,
	[IdOPM] [int] NULL,
	[CantOPMKgs] [float] NULL,
	[CantOpmUds] [float] NULL,
	[PlannedStartTime] [datetime] NULL,
	[FechaPromesaOpm] [datetime] NULL,
	[CapacidadKgs] [float] NULL,
	[CapacidadUds] [float] NULL,
	[EgeColaborado] [float] NULL,
	[Ege] [float] NULL,
	[DuracionEgeColaborado] [float] NULL,
	[DuracionEge] [float] NULL,
	[FechaIns] [datetime] NULL,
	[FechaUltimaMod] [datetime] NULL,
	[ClaUsuarioMod] [int] NULL,
	[NombrePcMod] [varchar](250) NULL,
	[idFolioCarga] [int] NULL
) ON [PRIMARY]
GO


/****** Object:  Index [IX_AswTraPPLSrvSecuenciaMicroprogramaSemanalCarga_NC]    Script Date: 11/04/2023 09:28:48 a. m. ******/
CREATE NONCLUSTERED INDEX [IX_AswTraPPLSrvSecuenciaMicroprogramaSemanalCarga_NC] ON [AswSch].[AswTraPPLSrvSecuenciaMicroprogramaSemanalCarga]
(
	[ClaUbicacion] ASC,
	[ClaAreaProduccion] ASC,
	[ClaGrupoMaquina] ASC,
	[ClaMaquina] ASC,
	[ClaPeriodo] ASC,
	[ClaArticulo] ASC,
	[IdOPM] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO


