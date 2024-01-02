USE [ASW]
GO

/****** Object:  Table [AswSch].[AswBitActualizaPO]    Script Date: 12/10/2022 09:24:33 p. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [AswSch].[AswBitActualizaPO](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[XmlVar] [xml] NULL,
	[FechaUltimaMod] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO

ALTER TABLE [AswSch].[AswBitActualizaPO] ADD  DEFAULT (getdate()) FOR [FechaUltimaMod]
GO

