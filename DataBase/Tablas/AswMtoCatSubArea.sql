USE [ASW]
GO

/****** Object:  Table [AswSch].[AswMtoCatSubArea]    Script Date: 25/08/2021 02:39:23 p. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO
--DROP TABLE [AswSch].[AswMtoCatSubArea]
CREATE TABLE [AswSch].[AswMtoCatSubArea](
	[ClaUbicacion] [int] NOT NULL,
	[ClaDepartamento] [int] NOT NULL,
	[ClaArea] [int] NOT NULL,
	[ClaSubArea] [int] NOT NULL,
	[ClaveSubArea] [varchar](5) NOT NULL,
	[NomSubArea] [varchar](100) NOT NULL,
	[BajaLogica] [tinyint] NOT NULL DEFAULT ((0)),
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL DEFAULT (getdate()),
	[NombrePcMod] [varchar](64) NOT NULL DEFAULT (host_name()),
	[ClaUsuarioMod] [int] NOT NULL,
	[ActivosEstimados] [int] NULL,
	[Orden] [int] NULL DEFAULT ((0)),
 CONSTRAINT [PK_MtoCatSubArea] PRIMARY KEY CLUSTERED 
(
	[ClaUbicacion] ASC,
	[ClaDepartamento] ASC,
	[ClaArea] ASC,
	[ClaSubArea] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


