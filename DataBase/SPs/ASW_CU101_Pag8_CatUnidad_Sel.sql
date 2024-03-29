USE [ASW]
GO
/****** Object:  StoredProcedure [AswSch].[ASW_CU101_Pag8_CatUnidad_Sel]    Script Date: 14/11/2022 01:03:55 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROC [AswSch].[ASW_CU101_Pag8_CatUnidad_Sel]
AS
BEGIN

	SELECT 
	  'ASWLite_CatUnidad' as nombretabla,
	  keys = 'ClaUnidad',
	  fuc = 'FechaUltimaMod',
	   ClaTipoInventario,
       ClaUnidad,
       NomUnidad,
       REPLACE(NomCortoUnidad,'''','''''') as NomCortoUnidad,
       BajaLogica,
       convert(varchar,FechaBajaLogica,121) as FechaBajaLogica,
       convert(varchar, GETDATE(),121) as FechaUltimaMod,
       NombrePcMod,
       ClaGpoUnidad,
       EsUniBase,
       EsUniProd,
       EsUniCaract,
       EsUniConversion,
       REPLACE(NomCortoUnidadIngles,'''','''''') as NomCortoUnidadIngles,
       NomCortoUnidadOtroIdioma
  FROM AswSch.AswArtCatUnidadVw


END
