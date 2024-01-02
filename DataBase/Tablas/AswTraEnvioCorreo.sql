USE [ASW]
GO

/****** Object:  Table [AswSch].[AswTraEnvioCorreo]    Script Date: 11/11/2022 06:02:36 p. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [AswSch].[AswTraEnvioCorreo](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[SpOrigen] [varchar](100) NOT NULL,
	[ClaveSp] [varchar](100) NOT NULL,
	[Mensaje] [varchar](max) NOT NULL,
	[EnvioCorreo] [int] NOT NULL,
	[ErrorMsg] [varchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
