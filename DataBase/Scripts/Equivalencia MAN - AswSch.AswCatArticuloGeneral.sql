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

Equivalencia MAN - AswSch.AswCatArticuloGeneral
	
	
	SELECT ClaArticulo
		,ClaveArticulo
		,NomArticulo
		,NomArticuloIngles
		,NULL AS EspesorAltura
		,NULL AS EspesorAlturaIngles
		,NULL AS CajasSkid
		,NULL AS Peso
		,BajaLogica
		,FechaBajaLogica
		,FechaUltimaMod
	FROM [dbo].[ArtCatArticuloVw] 
	WHERE ClaTipoInventario = 1 
	AND ClaArticulo=606122 
	
	
	--SELECT *
	--FROM [dbo].[ManRelArticuloComposicion] RAC
	--JOIN  [dbo].[ArtCatArticuloVw] CA
	--	ON RAC.ClaArticuloComp = CA.ClaArticulo
	--	AND RAC.ClaTipoInventarioComp = CA.ClaTipoInventario
	--WHERE RAC.ClaArticulo=606422 
	
	
	--SELECT *
	--FROM [dbo].[ManRelArticuloComposicion] RAC
	--JOIN  [dbo].[ArtCatArticuloVw] CA
	--	ON RAC.ClaArticuloComp = CA.ClaArticulo
	--	AND RAC.ClaTipoInventarioComp = CA.ClaTipoInventario
	--WHERE RAC.ClaArticulo=604381 