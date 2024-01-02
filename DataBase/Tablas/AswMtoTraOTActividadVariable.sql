USE [ASW]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [AswSch].[AswMtoTraOTActividadVariable](
	[ClaUbicacion] [int] NOT NULL,
	[IdOt] [int] NOT NULL,
	[ClaActividad] [int] NOT NULL,
	[ClaActividadPaso] [int] NOT NULL,
	[NomDescripcionPaso] [varchar](max) NOT NULL,
	[ClaVariable] [int] NOT NULL,
	[NomVariable] [varchar](max) NOT NULL,
	[NomUnidadVariable] [varchar](250) NOT NULL,
	[ValorEstandar] [numeric](19, 2) NULL,
	[ValorMinimo] [numeric](19, 2) NULL,
	[ValorMaximo] [numeric](19, 2) NULL,
	[ValorReal] [numeric](19, 2) NULL,
	[ClaReferenciaCumple] [numeric](19, 2) NULL,
	[NomReferenciaCumple] [varchar](250) NULL,
	[ClaOpcionFija] [real] NULL,
	[NomOpcionFija] [varchar](250) NULL,
	[ClaTipoVariable] [int] NOT NULL,
	[Referencia] [int] NULL,
	[idOTDerivada] [int] NULL,
	[generarOTDerivada] [int] NULL,
	[ClaEstatusReplica] [tinyint] NULL,
	[BajaLogica] [int] NULL,
	[FechaBajaLogica] [datetime] NULL,
	[ClaUsuarioMod] [int] NOT NULL,
	[NombrePcMod] [varchar](64) NOT NULL,
	[FechaUltimaMod] [datetime] NOT NULL CONSTRAINT [DF1_AswMtoTraOTActividadVariable]  DEFAULT (getdate()),
 CONSTRAINT [pk_AswMtoTraOTActividadVariable] PRIMARY KEY CLUSTERED 
(
	[ClaUbicacion] ASC,
	[IdOt] ASC,
	[ClaActividad] ASC,
	[ClaActividadPaso] ASC,
	[ClaVariable] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


