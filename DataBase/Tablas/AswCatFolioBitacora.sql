USE [ASW]
GO

/****** Object:  Table [AswSch].[AswCatFolioBitacora]    Script Date: 16/01/2023 04:05:13 p. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [AswSch].[AswCatFolioBitacora](
	[ClaveFolioBitacora] [varchar](25) NOT NULL,
	[IdCelda] [varchar](30) NOT NULL,
	[TablaOrigen] [varchar](50) NOT NULL,
	[NombreCampo] [varchar](20) NOT NULL,
	[Folio] [int] NULL,
	[BajaLogica] [tinyint] NULL,
	[FechaBajaLogica] [datetime] NULL,
	[NombrePcMod] [varchar](64) NULL,
	[FechaUltimaMod] [datetime] NULL)
GO
ALTER TABLE [AswSch].[AswCatFolioBitacora] 
ADD CONSTRAINT PK__AswCatFolioBitacora__IdCelda_ClaveFolioBitacora PRIMARY KEY (IdCelda,ClaveFolioBitacora)
GO



