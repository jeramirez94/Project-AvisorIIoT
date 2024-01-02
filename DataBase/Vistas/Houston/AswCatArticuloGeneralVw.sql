--USE [ASWH]
--GO

/****** Object:  View [AswSch].[AswCatArticuloGeneralVw]    Script Date: 05/01/2023 10:12:55 a. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO







CREATE VIEW [AswSch].[AswCatArticuloGeneralVw]
AS  

SELECT DISTINCT A.ClaArticulo
	,A.ClaveArticulo
	,A.NomArticulo
	,A.NomArticuloIngles
	,NULL AS EspesorAltura
	,NULL AS EspesorAlturaIngles
	,E.Cantidad AS CajasSkid
	,A.PesoTeoricoKgs AS Peso
	,A.BajaLogica
	,A.FechaBajaLogica
	,A.FechaUltimaMod
FROM [TiCatalogo].[dbo].[ArtCatArticuloVw] A
LEFT JOIN [AswSch].[AswManCatEmpaqueAgrupadoVw] E
	ON A.ClaArticulo = E.ClaArticulo
WHERE A.ClaTipoInventario = 1
GO


