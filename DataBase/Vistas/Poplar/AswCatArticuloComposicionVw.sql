USE [ASW]
GO

/****** Object:  View [AswSch].[AswCatArticuloComposicionVw]    Script Date: 05/01/2023 10:10:23 a. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO








CREATE VIEW [AswSch].[AswCatArticuloComposicionVw]
AS  

SELECT DISTINCT ClaArticulo
    ,ArtComposicion1
	,ClaveArtComposicion
	,NomArtComposicion
	,NomArtComposicionIngles
    ,CantComposicion
	,Nivel
	,UnidadMedida
	,UnidadMedidaIngles
	,EsParaVenta
	,EsAlambre
	,BajaLogica
	,FechaBajaLogica
FROM [AswSch].[AswCatArticuloComposicion]
GO


