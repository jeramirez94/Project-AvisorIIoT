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

Equivalencia MAN - AswSch.AswCatArticuloComposicion
	
	
	SELECT RAC.ClaArticulo
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
	FROM [dbo].[ManRelArticuloComposicion] RAC
	JOIN  [dbo].[ArtCatArticuloVw] CA
		ON RAC.ClaArticuloComp = CA.ClaArticulo
		AND RAC.ClaTipoInventarioComp = CA.ClaTipoInventario
	WHERE RAC.ClaArticulo=606122 
	
	
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