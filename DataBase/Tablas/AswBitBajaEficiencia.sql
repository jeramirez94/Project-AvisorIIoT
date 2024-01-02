USE [ASW]
GO

/****** Object:  Table [AswSch].[AswBitBitacoraBajaEficiencia]    Script Date: 12/10/2020 11:38:31 p. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [AswSch].[AswBitBitacoraBajaEficiencia](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ClaUbicacion] [int] NOT NULL,
	[IdCelda] [varchar](30) NOT NULL,
	[IdLocal] [int] NOT NULL,
	[FechaAdmSCADA] [datetime] NULL,
	[ClaTurno] [int] NULL,
	[Hora] [tinyint] NULL,
	[FechaHoraInicial] [datetime] NULL,
	[FechaHoraFinal] [datetime] NULL,
	[IdUsuario] [int] NULL,
	[VelocidaObjetivo] [smallint] NULL,
	[VelocidadReal] [smallint] NULL,
	[PorcentajeTolerancia] [numeric](5,2) NULL,
	[ClaBajaEfciencia] [smallint] NULL,
	[ClaEstatusReplica] [tinyint] NOT NULL,
	[BajaLogica] [int] NULL DEFAULT ((0)),
	[FechaBajaLogica] [datetime] NOT NULL,
	[ClaUsuarioMod] [int] NOT NULL,
	[NombrePCMod] [varchar](64) NOT NULL,
	[FechaUltimaMod] [datetime] NOT NULL
 CONSTRAINT [PK_AswBitBitacoraBajaEficiencia] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [Bitacora]
) ON [Bitacora]

GO

SET ANSI_PADDING OFF
GO


