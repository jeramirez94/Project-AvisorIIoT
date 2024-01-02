USE [ASW]
GO

/****** Object:  View [AswSch].[AswCatArticuloCaracteristicasVw]    Script Date: 05/01/2023 10:12:07 a. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO







CREATE VIEW [AswSch].[AswCatArticuloCaracteristicasVw]
AS  

SELECT DISTINCT CA.ClaArticulo	
	,CP.ClaPlantilla	
	,NomPlantilla	
	,NomPlantillaIngles	
	,CC.ClaCaracteristica	
	,NomCaracteristica	
	,NomCaracteristicaIngles	
	,NomValor NomValorCaract	
	,EtiquetaDescIngles NomValorCaractIngles
	--,NumValor --no esta disponible en MCSW
	,CA.BajaLogica	
	,CA.FechaBajaLogica	
	,CA.FechaUltimaMod
FROM [TiCatalogo].[dbo].[ArtCatArticuloVw] CA
JOIN [TiCatalogo].[dbo].[ArtCatPlantilla] CP
	ON CA.ClaTipoInventario = CP.ClaTipoInventario
	AND CA.ClaPlantilla = CP.ClaPlantilla
JOIN [TiCatalogo].[dbo].[ArtRelArticuloCarValor] RACV
	ON CA.ClaTipoInventario = RACV.ClaTipoInventario
	AND CA.ClaArticulo = RACV.ClaArticulo
JOIN [TiCatalogo].[dbo].[ArtCatCaracteristica] CC
	ON RACV.ClaTipoInventario = CC.ClaTipoInventario
	AND RACV.ClaCaracteristica = CC.ClaCaracteristica
JOIN [TiCatalogo].[dbo].[ArtCatValor] CV
	ON RACV.ClaTipoInventario = CV.ClaTipoInventario
	AND RACV.ClaCaracteristica = CV.ClaCaracteristica
	AND RACV.ClaValor = CV.ClaValor
WHERE CA.ClaTipoInventario = 1
GO


