USE [ASW]
GO

/****** Object:  Table [AswSch].[AswCatRecursoAvisor]    Script Date: 11/11/2022 04:55:32 p. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [AswSch].[AswCatRecursoAvisor](
	[IdRecurso] [int] NOT NULL,
	[Descripcion] [varchar](40) NULL,
	[Origen] [varchar](250) NULL,
	[Destino] [varchar](250) NULL,
	[TipoRecurso] [varchar](10) NULL,
PRIMARY KEY CLUSTERED 
(
	[IdRecurso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO