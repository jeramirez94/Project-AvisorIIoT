USE [ASW]
GO

/****** Object:  Table [AswSch].[AswEstEgeHora]    Script Date: 11/11/2022 05:24:01 p. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [AswSch].[AswEstEgeHora](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ClaUbicacion] [int] NOT NULL,
	[IdCelda] [varchar](30) NOT NULL,
	[ClaDepartamento] [int] NULL,
	[NomDeapartamento] [varchar](50) NULL,
	[ClaArea] [int] NULL,
	[NomArea] [varchar](30) NULL,
	[ClaveCelda] [varchar](15) NULL,
	[NomCelda] [varchar](100) NULL,
	[CapacidadUnidad] [int] NULL,
	[Capacidad] [numeric](18,4) NULL,
	[FechaAdmScada] [datetime] NULL,
	[FechaReporte] [datetime] NULL,
	[Hora] [int] NULL,
	[ClaTurno] [int] NULL,
	[NomTurno] [varchar](10) NULL,
	[Duracion] [int] NULL,
	[InicioTurno] [datetime] NULL,
	[FinTurno] [datetime] NULL,
	[RunHrs] [numeric](4, 2) NULL,
	[TiempoParo] [numeric](4, 2) NULL,
	[TiempoMicroParo] [numeric](5, 2) NULL,
	[TiempoParoNoAfecta] [numeric](4, 2) NULL,
	[Cajas] [int] NULL,
	[Clavos] [int] NULL,
	[PesoProducido] [numeric](8, 2) NULL,
	[ClaArticulo] [int] NULL,
	[ClaveArticulo] [varchar](20) NULL,
	[NomArticulo] [varchar](250) NULL,
	[NomArticuloIngles] [varchar](250) NULL,
	[CajasSkid] [int] NULL,
	[PesoCaja] [numeric](8, 2) NULL,
	[CajasPNC] [int] NULL,
	[ClavosPNC] [int] NULL,
	[PesoProducidoPNC] [numeric](8, 2) NULL,
	[PesoScrap] [numeric](8, 2) NULL,
	[Disponibilidad] [numeric](5, 2) NULL,
	[Eficiencia] [numeric](8, 2) NULL,
	[Cumplimiento] [numeric](8, 2) NULL,
	[Calidad] [numeric](5, 2) NULL,
	[Oee] [numeric](8, 2) NULL,
	[FechaBajaLogica] [datetime] NULL,
	[BajaLogica] [int] NULL,
	[ClaUsuarioMod] [int] NOT NULL,
	[NombrePCMod] [varchar](64) NOT NULL,
	[FechaUltimaMod] [datetime] NOT NULL,
 CONSTRAINT [PK_AswEstEge] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UQ_AswEstEgeHora_IdCeldaFechaReporte] UNIQUE NONCLUSTERED 
(
	[IdCelda] ASC,
	[FechaReporte] DESC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [AswSch].[AswEstEgeHora] ADD  DEFAULT ((0)) FOR [BajaLogica]
GO



