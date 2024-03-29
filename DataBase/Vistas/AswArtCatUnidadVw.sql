USE [ASW]
GO

/****** Object:  View [AswSch].[AswArtCatUnidadVw]    Script Date: 14/11/2022 09:59:34 a. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [AswSch].[AswArtCatUnidadVw]
AS 
	SELECT [ClaTipoInventario]
		  ,[ClaUnidad]
		  ,[NomUnidad]
		  ,[NomCortoUnidad]
		  ,[BajaLogica]
		  ,[FechaBajaLogica]
		  ,[FechaUltimaMod]
		  ,[NombrePcMod]
		  ,[ClaUsuarioMod]
		  ,[ClaGpoUnidad]
		  ,[EsUniBase]
		  ,[EsUniProd]
		  ,[EsUniCaract]
		  ,[EsUniConversion]
		  ,[NomCortoUnidadIngles]
		  ,[NomCortoUnidadOtroIdioma]
	  FROM [TiCatalogo].[dbo].[ArtCatUnidad]
	  WHERE ClaTipoInventario = 1
GO


