--/****** Script for SelectTopNRows command from SSMS  ******/
--SELECT * FROM [dbo].[ArtCatCaracteristica] WHERE   ClaCaracteristica in (614,1541)--1405
--SELECT * FROM [dbo].[ArtCatValor]
--SELECT * FROM [dbo].[ArtCatPlantilla] where claPlantilla = 342 and clatipoinventario = 1
--SELECT * FROM [dbo].[ArtCatCaracteristica] WHERE   ClaCaracteristica in (614,1541)--1405
--SELECT * FROM [dbo].[ArtRelPlantillaCar] where claPlantilla = 342 and clatipoinventario = 1 --and ClaCaracteristica in (614,1541)
--SELECT * FROM [dbo].[ArtRelPlantillaCarValor] where claPlantilla = 342 and clatipoinventario = 1 --and ClaCaracteristica in (614,1541)
--SELECT * FROM [dbo].[ArtCatPlantilla] where claPlantilla = 342 and clatipoinventario = 1
--SELECT * FROM [dbo].[ArtRelArticuloCarValor] WHERE ClaArticulo=600004 and  ClaTipoInventario=1
--SELECT * FROM [dbo].[ArtRelPlantillaFamSubfam] where ClaFamilia = 347 and claPlantilla = 342 and clatipoinventario = 1
--SELECT * FROM [dbo].[ArtCatArticuloVw] WHERE ClaArticulo=600004 and  ClaTipoInventario=1

[AswSch].[AswCatArticuloCaracteristicas]

SELECT CA.ClaArticulo	
	,CP.ClaPlantilla	
	,NomPlantilla	
	,NomPlantillaIngles	
	,CC.ClaCaracteristica	
	,NomCaracteristica	
	,NomCaracteristicaIngles	
	,NomValor NomValorCaract	
	,EtiquetaDescIngles NomValorCaractIngles
	,NumValor --no esta disponible en MCSW
	,CA.BajaLogica	
	,CA.FechaBajaLogica	
	,CA.FechaUltimaMod
FROM [dbo].[ArtCatArticuloVw] CA
JOIN [dbo].[ArtCatPlantilla] CP
	ON CA.ClaTipoInventario = CP.ClaTipoInventario
	AND CA.ClaPlantilla = CP.ClaPlantilla
JOIN [dbo].[ArtRelArticuloCarValor] RACV
	ON CA.ClaTipoInventario = RACV.ClaTipoInventario
	AND CA.ClaArticulo = RACV.ClaArticulo
JOIN [dbo].[ArtCatCaracteristica] CC
	ON RACV.ClaTipoInventario = CC.ClaTipoInventario
	AND RACV.ClaCaracteristica = CC.ClaCaracteristica
JOIN [dbo].[ArtCatValor] CV
	ON RACV.ClaTipoInventario = CV.ClaTipoInventario
	AND RACV.ClaCaracteristica = CV.ClaCaracteristica
	AND RACV.ClaValor = CV.ClaValor
where CA.ClaTipoInventario = 1
	AND CA.ClaArticulo=600004 