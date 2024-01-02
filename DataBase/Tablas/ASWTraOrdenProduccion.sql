USE	ASW
GO

/****** Object:  Table [PALSch].[PALTraOPM]    Script Date: 8/23/2018 12:36:01 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO
--DROP TABLE [ASWSch].[ASWTraOrdenProduccion]
CREATE TABLE [ASWSch].[ASWTraOrdenProduccion](
	[ClaUbicacion] [int] NOT NULL,
	[IdPO] [int] NOT NULL,
	[ClavePO] [int] NOT NULL,

	/*Paln de produccion PPL*/
	[WO] [int] NULL,
	
	[IdCelda] [varchar](30) NOT NULL,
	
	[ClaAreaProduccion] [int] NOT NULL,
	[ClaDepartamento] [int] NOT NULL,

	[ClaArticulo] [int] NOT NULL,--Item
	[ClaveArticulo] VARCHAR(20) NOT NULL,--Clave Item
	[ClaGpoCosteo] [int] NULL,--NULL by now
	[ClaGrupoProceso] [int] NULL,--NULL by now
	--[Secuencia] [int] NULL,--?
	[Orden] [int] NULL,--incremental x IdCelda

	[ClaUnidadProd] [int] NULL,--11 box --buscar tabla
	[UnidadesProgramadas] [numeric](14, 6) NULL, --cajas
	[UnidadesProducidas] [numeric](14, 6) NULL, --cajas
	[PaquetesPorUnidad] [numeric](14, 6) NULL, --strips, coils, nails?(en bulk)--no existe 
	[PiezasPorUnidad] [numeric](14, 6) NULL, --clavos--no existe
	[UnidadesPorSkid] [numeric](14, 6) NULL,--si esta

	[Diametro] VARCHAR(250) NULL,--[AswSch].[AswCatArticuloGeneral]
	[DiametroMin] VARCHAR(250) NULL,--[AswSch].[AswCatArticuloGeneral]
	[DiametroMax] VARCHAR(250) NULL,--[AswSch].[AswCatArticuloGeneral]
	[Longitud] VARCHAR(250) NULL,--[AswSch].[AswCatArticuloGeneral]
	[LongitudMin] VARCHAR(250) NULL,--[AswSch].[AswCatArticuloGeneral]
	[LongitudMax] VARCHAR(250) NULL,--[AswSch].[AswCatArticuloGeneral]

	/*FEATURES*/
	[Length] VARCHAR(250) NULL,--[AswSch].[AswCatArticuloCaracteristicas]
	[Diameter] VARCHAR(250) NULL,--[AswSch].[AswCatArticuloCaracteristicas]
	[Point] VARCHAR(250) NULL,--[AswSch].[AswCatArticuloCaracteristicas]
	[Shank] VARCHAR(250) NULL,--[AswSch].[AswCatArticuloCaracteristicas]


	/*
	Status:
	1 Programmed
	2 In Process
	3 Paused
	4 Finished
	*/
	[ClaEstatus] [int] NOT NULL,
	[NotasProduccion] varchar (100),

	/*Paln de produccion PPL*/
	[FechaProgramada] [datetime] NULL,
	[FechaCaptura] [datetime] NULL,

	[FechaInicioReal] [datetime] NULL,
	[FechaInicioAdm] [datetime] NULL,
	[FechaFinReal] [datetime] NULL,
	[FechaFinAdm] [datetime] NULL,
	[BajaLogica] [tinyint] NOT NULL,
	[FechaBajaLogica] [datetime] NULL,
	[ClaUsuarioMod] [int] NOT NULL,
	[NombrePcMod] [varchar](64) NOT NULL,
	[FechaIns] [datetime] NOT NULL,
	[FechaUltimaMod] [datetime] NOT NULL,
 CONSTRAINT [pk_ASWTraOrdenProduccion] PRIMARY KEY CLUSTERED 
(
	[ClaUbicacion] ASC,
	[IdPO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
    CONSTRAINT [FK_ASWTraOrdenProduccion_AswCatEstatus] FOREIGN KEY ([ClaEstatus]) REFERENCES [AswSch].[AswCatEstatus] ([ClaEstatus])
) ON [PRIMARY]
GO

ALTER TABLE [ASWSch].[ASWTraOrdenProduccion] ADD  DEFAULT (getdate()) FOR [FechaUltimaMod]
GO

ALTER TABLE [ASWSch].[ASWTraOrdenProduccion] ADD  DEFAULT (0) FOR [BajaLogica]
GO