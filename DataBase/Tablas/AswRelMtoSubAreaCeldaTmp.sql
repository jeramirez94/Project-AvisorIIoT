USE [ASW]
GO

/****** Object:  Table [MtoSch].[MtoCatSubArea]    Script Date: 25/11/2020 01:18:26 p. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [AswSch].[AswRelMtoSubAreaCeldaTmp](
	[ClaUbicacion] [int] NOT NULL,
	[ClaDepartamento] [int] NOT NULL,
	[ClaArea] [int] NOT NULL,
	[ClaSubArea] [int] NOT NULL,
	[NomDepartamento] varchar(100),
	[NomArea] varchar(100),
	[NomSubArea] varchar(100),
	[IdCelda] [int] NULL,
 CONSTRAINT [PK_AswRelMtoSubAreaCeldaTmp] PRIMARY KEY CLUSTERED 
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
