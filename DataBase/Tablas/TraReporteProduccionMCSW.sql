USE [ASW]
GO

/****** Object:  Table [AswSch].[TraReporteProduccionMCSW]    Script Date: 11/11/2022 06:11:57 p. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [AswSch].[TraReporteProduccionMCSW](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdLocal] [int] NOT NULL,
	[IdCelda] [varchar](30) NOT NULL,
	[FechaAdmScada] [date] NOT NULL,
	[ClaTurno] [smallint] NOT NULL,
	[TiempoTurno] [numeric](4, 2) NOT NULL,
	[OrdenesTurno] [smallint] NULL,
	[FechaHoraInicioProd] [datetime] NULL,
	[FechaHoraFinProd] [datetime] NULL,
	[IdComponente1] [smallint] NULL,
	[TiempoParo1] [numeric](12, 2) NULL,
	[IdComponente2] [smallint] NULL,
	[TiempoParo2] [numeric](12, 2) NULL,
	[IdComponente3] [smallint] NULL,
	[TiempoParo3] [numeric](12, 2) NULL,
	[IdComponente4] [smallint] NULL,
	[TiempoParo4] [numeric](12, 2) NULL,
	[IdComponente5] [smallint] NULL,
	[TiempoParo5] [numeric](12, 2) NULL,
	[IdComponente6] [smallint] NULL,
	[TiempoParo6] [numeric](12, 2) NULL,
	[IdComponente7] [smallint] NULL,
	[TiempoParo7] [numeric](12, 2) NULL,
	[IdComponente8] [smallint] NULL,
	[TiempoParo8] [numeric](12, 2) NULL,
	[IdComponente9] [smallint] NULL,
	[TiempoParo9] [numeric](12, 2) NULL,
	[IdComponente10] [smallint] NULL,
	[TiempoParo10] [numeric](12, 2) NULL,
	[CajasProducidas] [smallint] NOT NULL,
	[CajasSkid] [smallint] NULL,
	[ClaArticulo] [int] NULL,
	[PesoScrap] [numeric](5, 2) NOT NULL,
	[ClaTipoRegistro] [tinyint] NOT NULL,
	[ClaEstatusReplica] [tinyint] NOT NULL,
	[Evento] [varchar](15) NOT NULL,
	[ClaMensaje] [smallint] NULL,
	[Mensaje] [varchar](500) NULL,
	[FechaUltimaMod] [datetime] NOT NULL,
	[NombrePcMod] [varchar](64) NOT NULL,
	[ClaUsuarioMod] [int] NOT NULL,
	[BajaLogica] [int] NULL,
	[EsManual] [int] NULL,
	[Comentario] [varchar](400) NULL,
	[Error] [int] NULL,
	[ErrorMsg] [varchar](500) NULL,
	[EnvioCorreoSN] [int] NULL,
    CONSTRAINT [PK_TraReporteProduccionMCSW] PRIMARY KEY CLUSTERED ([Id] ASC))
GO
CREATE UNIQUE INDEX UI_IdLocal_IdCelda ON [AswSch].[TraReporteProduccionMCSW] (IdLocal,IdCelda)
GO


