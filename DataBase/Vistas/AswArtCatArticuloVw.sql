USE [ASW]
GO

/****** Object:  View [AswSch].[AswArtCatArticuloVw]    Script Date: 14/11/2022 09:57:26 a. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO




CREATE VIEW [AswSch].[AswArtCatArticuloVw]
AS  

SELECT [ClaTipoInventario]
      ,[ClaArticulo]
      ,[ClaveArticulo]
      ,[CodigoArticulo]
      ,[NomArticulo]
      ,[NomArticuloIngles]
      ,[NomArticuloOtroIdioma]
      ,[ClaClasifGeneral]
      ,[ClaFamilia]
      ,[ClaSubfamilia]
      ,[ClaPlantilla]
      ,[ClaMarca]
      ,[ClaTipoArticulo]
      ,[ClaGpoProcesoProd]
      ,[ClaGpoCosteo]
      ,[ClaGpoEstadistico]
      ,[ClaUNSPC1]
      ,[ClaUNSPC2]
      ,[ClaUNSPC3]
      ,[ClaUNSPC4]
      ,[ClaUnidadBase]
      ,[ClaUnidadProd]
      ,[FactorConversion]
      ,[PesoTeoricoKgs]
      ,[Comentarios]
      ,[FechaIns]
      ,[ClaUsuarioIns]
      ,[ClaEstatusVobo]
      ,[BajaLogica]
      ,[FechaBajaLogica]
      ,[FechaUltimaMod]
      ,[NombrePcMod]
      ,[ClaUsuarioMod]
      ,[ClaPrefijoClave]
      ,[ClaClaveCruda]
      ,[ClaArticuloInsumo]
      ,[Referencia]
      ,[ClaEmpaqueInd]
      ,[ClaEmpaqueAgrup]
      ,[ClaUbicacionIns]
      ,[ClaGpoEmpaque]
      ,[EsObsoleto]
      ,[EsExcentoIVA]
      ,[VolumenAlto]
      ,[VolumenAncho]
      ,[VolumenLargo]
      ,[ClaUnidadVolumen]
      ,[ClaComplejidad]
      ,[EsHomologado]
      ,[PesoTeoricoKgsMin]
      ,[PesoTeoricoKgsMax]
      ,[ClaEmpresaCodigoBar]
      ,[ClaProteccionEmpaque]
      ,[FactorCubicaje]
      ,[EsDisponibleCopia]
      ,[EsDisponibleUso]
      ,[EsCambioHistorial]
      ,[ClaAgrupador]
  FROM TiCatalogo.[dbo].[ArtCatArticulo]
GO



