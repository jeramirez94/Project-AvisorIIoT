USE [ASW]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [AswSch].[AswMtoTraOTActividadDerivada](
	[ClaUbicacion] [int] NOT NULL,
	[IdOt] [int] NOT NULL,
	[ClaActividad] [int] NOT NULL,
	[ClaActividadD] [int] NOT NULL,
	[DescripcionActividadD] [varchar](max) NOT NULL,
	[TiempoEstimadoD] [numeric](19, 2) NOT NULL,
	[RequiereParo] [int] NULL,
	[ClaEstatusReplica] [tinyint] NULL,
	[FechaUltimaMod] [datetime] NOT NULL,
 CONSTRAINT [pk_AswMtoTraOTActividadDerivada] PRIMARY KEY CLUSTERED 
(
	[ClaUbicacion] ASC,
	[IdOt] ASC,
	[ClaActividad] ASC,
	[ClaActividadD] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


