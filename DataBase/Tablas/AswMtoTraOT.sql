USE [ASW]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO
--DROP TABLE [AswSch].[AswMtoTraOT]
CREATE TABLE [AswSch].[AswMtoTraOT](
	[ClaUbicacion] [int] NOT NULL,
	[IdOt] [int] NOT NULL,
	[NomGuia] [varchar](max) NOT NULL,
	[ClaEstatusOt] [int] NOT NULL,
	[NomEstatus] [varchar](250) NOT NULL,
	[ClaEquipo] [int] NOT NULL,
	[IdCelda] [varchar](30) NOT NULL,
	[ClaGuia] [int] NOT NULL,
	[FechaProgInicio] [datetime] NOT NULL,
	[ClaTurno] [int] NOT NULL,
	[TiempoEstimado] [numeric](19, 2) NOT NULL,
	[EsTerminada] BIT NOT NULL DEFAULT(0),
	[ClaEstatusReplica] [tinyint] NULL,
	[BajaLogica] [int] NULL,
	[FechaBajaLogica] [datetime] NULL,
	[ClaUsuarioMod] [int] NOT NULL,
	[NombrePcMod] [varchar](64) NOT NULL,
	[FechaUltimaMod] [datetime] NOT NULL CONSTRAINT [DF1_AswMtoTraOT]  DEFAULT (getdate()),
 CONSTRAINT [pk_AswMtoTraOT] PRIMARY KEY CLUSTERED 
(
	[ClaUbicacion] ASC,
	[IdOt] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

