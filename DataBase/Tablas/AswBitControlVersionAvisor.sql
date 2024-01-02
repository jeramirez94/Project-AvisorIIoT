USE [ASW]
GO

/****** Object:  Table [AswSch].[AswCatGpio]    Script Date: 18/08/2022 11:04:12 a. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO
--DROP TABLE [AswSch].[AswBitControlVersionAvisor]
CREATE TABLE [AswSch].[AswBitControlVersionAvisor](
	[Id] INT IDENTITY PRIMARY KEY,
	[IdCelda] VARCHAR(30),
	[Origen] VARCHAR(15),--[NodeRed, Sqlite, App]
	[Version] VARCHAR(15),
	[NombrePcMod] [varchar](64) NULL,
	[FechaUltimaMod] [datetime] NULL
)
GO
