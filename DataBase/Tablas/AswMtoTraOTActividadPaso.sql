USE [ASW]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [AswSch].[AswMtoTraOTActividadPaso](
	[ClaUbicacion] [int] NOT NULL,
	[IdOt] [int] NOT NULL,
	[ClaActividad] [int] NOT NULL,
	[ClaActividadPaso] [int] NOT NULL,
	[Paso] [varchar](max) NOT NULL,
	[Descripcion] [varchar](max) NOT NULL,
	[EsRealizada] [int] NOT NULL,
	[TiempoEstimado] [numeric](19, 2) NOT NULL,
	[TiempoReal] [numeric](19, 2) NULL,
	[ClaEstatusReplica] [tinyint] NULL,
	[BajaLogica] [int] NULL,
	[FechaBajaLogica] [datetime] NULL,
	[ClaUsuarioMod] [int] NOT NULL,
	[NombrePcMod] [varchar](64) NOT NULL,
	[FechaUltimaMod] [datetime] NOT NULL CONSTRAINT [DF1_AswMtoTraOTActividadPaso]  DEFAULT (getdate()),
 CONSTRAINT [pk_AswMtoTraOTActividadPaso] PRIMARY KEY CLUSTERED 
(
	[ClaUbicacion] ASC,
	[IdOt] ASC,
	[ClaActividad] ASC,
	[ClaActividadPaso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


