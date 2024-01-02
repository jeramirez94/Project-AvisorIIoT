USE [ASW]
GO

/****** Object:  View [AswSch].[AswCatArticuloComposicionVw]    Script Date: 05/01/2023 10:12:38 a. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO







CREATE VIEW [AswSch].[AswCatArticuloComposicionVw]
AS  

SELECT DISTINCT RAC.ClaArticulo
,RAC.ClaArticuloComp AS ArtComposicion1
	,CA.ClaveArticulo AS ClaveArtComposicion
	,CA.NomArticulo AS NomArtComposicion
	,CA.NomArticuloIngles AS NomArtComposicionIngles
,NULL AS CantComposicion
	,NULL AS Nivel
	,NULL AS UnidadMedida
	,NULL AS UnidadMedidaIngles
	,NULL AS EsParaVenta
	,NULL AS EsAlambre
	,RAC.BajaLogica
	,RAC.FechaBajaLogica
FROM [TiCatalogo].[dbo].[ManRelArticuloComposicion] RAC
JOIN [TiCatalogo].[dbo].[ArtCatArticuloVw] CA
	ON RAC.ClaArticuloComp = CA.ClaArticulo
	AND RAC.ClaTipoInventarioComp = CA.ClaTipoInventario
GO


