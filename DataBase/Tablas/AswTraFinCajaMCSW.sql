USE [ASW]
GO

/****** Object:  Table [AswSch].[AswTraFinCajaMCSW]    Script Date: 23/07/2021 07:11:55 a. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO
--DROP TABLE [AswSch].[AswTraFinCajaMCSW]
CREATE TABLE [AswSch].[AswTraFinCajaMCSW](
	[ClaUbicacion] [int] NULL,
	[ClaCelda] [int] NULL,
	[ClaMaquina] [int] NULL,
	[ClaTurno] [int] NULL,
	[IdUsuario] [int] NULL,
	[IdPO] [int] NULL,
	[ClavePO] [int] NULL,
	[ClaEstatus] [int] NULL,
	[IdUnidadCaja] [int] NULL,
	[ClaArticulo] [int] NULL,
	[FechaInicioReal] [datetime] NULL,
	[FechaFinReal] [datetime] NULL,
	[IdMateriaPrimaInicio] [int] NULL,
	[IdMateriaPrimaFin] [int] NULL,
	[ClaEstatusReplica] [int] NULL,
	[FechaUltimaMod] [datetime] NULL,
	[ClaUsuarioMod] [int] NULL,
	[NombrePcMod] [varchar](64) NULL,
	[EsCajaManual] [int] NULL,
	[Error] [int] NULL,
	[ErrorMsg] varchar(500) NULL
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


