USE [ASW]
GO

/****** Object:  Table [AswSch].[AswMtoTraReporteFalla]    Script Date: 05/01/2021 09:28:43 a. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO
--DROP TABLE [AswSch].[AswMtoTraReporteFalla]
CREATE TABLE [AswSch].[AswMtoTraReporteFalla](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ClaUbicacion] [int] NOT NULL,
	[IdReporteFalla] [int] NOT NULL,
	[IdCelda] [int] NOT NULL,
	[ClaEquipo] [int] NOT NULL,
	[ClaTurno] [int] NULL,
	[FechaAdmScada] [datetime] NULL,
	[FechaReporte] [datetime] NULL,
	[ClaSistema] [int] NOT NULL,
	[ClaSubSistema] [int] NOT NULL,
	[ClaRcmFuncion] [int] NULL,
	[ClaRcmFuncionFalla] [int] NULL,
	[ClaEstatusReplica] [int] NULL,
	[FechaProgramacion] datetime null,
	[ClaReporteFalla] int null,
	[IdOt] int null,
	[Error] VARCHAR(500) null,
	[FechaBajaLogica] [datetime] NULL,
	[BajaLogica] [int] NULL,
	[ClaUsuarioMod] [int] NOT NULL,
	[NombrePCMod] [varchar](64) NOT NULL,
	[FechaUltimaMod] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [AswSch].[AswMtoTraReporteFalla] ADD  DEFAULT ((0)) FOR [BajaLogica]
GO


