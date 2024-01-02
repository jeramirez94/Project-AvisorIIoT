USE [ASW]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [AswSch].[AswTraControlVersionAvisor](
	[IdCelda] [varchar](30) PRIMARY KEY,
	[VersionSqlite] VARCHAR(15),
	[VersionNodeRed] VARCHAR(15),
	[VersionApp] VARCHAR(15),
	[NombrePcMod] [varchar](64) NULL,
	[FechaUltimaMod] [datetime] NULL)
GO
ALTER TABLE [AswSch].[AswTraControlVersionAvisor] ADD CONSTRAINT PK__AswTraControlVersionAvisor__IdCelda PRIMARY KEY (IdCelda)


