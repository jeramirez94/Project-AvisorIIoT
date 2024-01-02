USE [ASW]
GO

/****** Object:  View [AswSch].[AswCatArticuloGeneralVw]    Script Date: 05/01/2023 10:10:50 a. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO








CREATE VIEW [AswSch].[AswCatArticuloGeneralVw]
AS  

SELECT DISTINCT ClaArticulo
	,ClaveArticulo
	,NomArticulo
	,NomArticuloIngles
	,EspesorAltura
	,EspesorAlturaIngles
	,CajasSkid
	,Peso
	,BajaLogica
	,FechaBajaLogica
	,FechaUltimaMod
FROM [AswSch].[AswCatArticuloGeneral]
GO


