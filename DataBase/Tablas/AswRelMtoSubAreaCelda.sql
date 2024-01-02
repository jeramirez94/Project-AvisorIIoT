USE [ASW]
GO

/****** Object:  Table [MtoSch].[MtoCatSubArea]    Script Date: 25/11/2020 01:18:26 p. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [AswSch].[AswRelMtoSubAreaCelda](
	[ClaUbicacion] [int] NOT NULL,
	[ClaDepartamento] [int] NOT NULL,
	[ClaArea] [int] NOT NULL,
	[ClaSubArea] [int] NOT NULL,
	[IdCelda] [varchar](30) NOT NULL,
	[BajaLogica] [tinyint] NOT NULL DEFAULT ((0)),
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL DEFAULT (getdate()),
	[NombrePcMod] [varchar](64) NOT NULL DEFAULT (host_name()),
	[ClaUsuarioMod] [int] NOT NULL,
 CONSTRAINT [PK_AswRelMtoSubAreaCelda] PRIMARY KEY CLUSTERED 
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
