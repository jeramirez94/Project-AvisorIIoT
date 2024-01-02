USE [ASW]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [AswSch].[AswMtoTraOTActividad](
	[ClaUbicacion] [int] NOT NULL,
	[IdOt] [int] NOT NULL,
	[ClaActividad] [int] NOT NULL,
	[NomSistema] [varchar](max) NOT NULL,
	[NomSubSistema] [varchar](max) NOT NULL,
	[NomActividad] [varchar](max) NOT NULL,
	[EsRealizada] [int] NOT NULL,
	[TiempoEstimado] [numeric](19, 2) NOT NULL,
	[GeneraDerivadaSN] [bit] DEFAULT(0),
	[IdOtDerivada] [int] NULL,
	[ClaEstatusReplica] [tinyint] NULL,
	[BajaLogica] [int] NULL,
	[FechaBajaLogica] [datetime] NULL,
	[ClaUsuarioMod] [int] NOT NULL,
	[NombrePcMod] [varchar](64) NOT NULL,
	[FechaUltimaMod] [datetime] NOT NULL CONSTRAINT [DF1_AswMtoTraOTActividad]  DEFAULT (getdate()),
 CONSTRAINT [pk_AswMtoTraOTActividad] PRIMARY KEY CLUSTERED 
(
	[ClaUbicacion] ASC,
	[IdOt] ASC,
	[ClaActividad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


