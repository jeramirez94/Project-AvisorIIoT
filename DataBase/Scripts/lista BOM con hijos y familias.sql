
DECLARE @Articulos TABLE (
	ClaArticulo INT
)

INSERT INTO @Articulos
SELECT 618876
UNION
SELECT 614923
UNION
SELECT 618876
UNION
SELECT 606122

declare 
	@nNivel INT
	,@nClaArticulo INT



SELECT @nClaArticulo = Min(ClaArticulo)
FROM @Articulos

WHILE @nClaArticulo IS NOT NULL
BEGIN

	SET @nNivel = 1

	CREATE TABLE #Composicion(
		Nivel INT
		,ClaArticuloOri INT
		,ClaTipoInventario INT
		,ClaArticulo INT
	)


	INSERT INTO #Composicion
	SELECT  @nNivel
		,@nClaArticulo AS [ClaArticuloOri]
		,[ClaTipoInventarioComp]
		,[ClaArticuloComp]
	FROM TiCentral.Ticatalogo.[dbo].[ManRelArticuloComposicion]
	where claarticulo = @nClaArticulo

	WHILE EXISTS (SELECT 1 
					FROM TiCentral.Ticatalogo.[dbo].[ManRelArticuloComposicion] 
					WHERE ClaArticulo IN (SELECT ClaArticulo 
											FROM #Composicion
											WHERE Nivel = @nNivel))
	BEGIN
	SET @nNivel = @nNivel + 1

	INSERT INTO #Composicion
	SELECT @nNivel
		,ClaArticulo AS [ClaArticuloOri]
		,[ClaTipoInventarioComp]
		,[ClaArticuloComp]
	FROM TiCentral.Ticatalogo.[dbo].[ManRelArticuloComposicion]
	where claarticulo  IN (SELECT ClaArticulo 
											FROM #Composicion
											WHERE Nivel = @nNivel-1)

	END

	SELECT ClaArticulo, ClaveArticulo, NomArticulo 
	FROM TICentral.TiCatalogo.[dbo].[ArtCatArticuloVw] art
	WHERE ClaTipoInventario = 1
		AND ClaArticulo = @nClaArticulo
 
	SELECT Nivel, ClaArticuloOri,art.ClaArticulo, ClaveArticulo,NomArticulo,nomTipoArticulo, NomMarca, NomPlantilla, NomFamilia, NomSubFamilia, NomClasifGeneral
	FROM #Composicion comp
	join TICentral.TiCatalogo.[dbo].[ArtCatArticuloVw] art
		on comp.claTipoInventario = art.ClaTipoInventario
		and comp.claarticulo = art.ClaArticulo
	left join  TICentral.TiCatalogo.[dbo].[ArtCatTipoArticulo] ta
		on art.clatipoarticulo = ta.clatipoarticulo
	left join TICentral.TiCatalogo.dbo.ArtCatMarca m
		on art.clamarca = m.ClaMarca
	left join TICentral.TiCatalogo.dbo.ArtCatPlantilla p
		on art.ClaPlantilla=p.ClaPlantilla
	left join TICentral.TiCatalogo.dbo.ArtCatFamilia F
		on art.ClaFamilia=F.ClaFamilia
	left join TICentral.TiCatalogo.dbo.ArtCatSubfamilia SF
		on art.ClaSubFamilia=SF.ClaSubFamilia	
		and art.clafamilia=SF.clafamilia
	left join TICentral.TiCatalogo.dbo.ArtCatClasifGeneral CG
		on art.ClaClasifGeneral=CG.ClaClasifGeneral
		and art.clatipoinventario =CG.clatipoinventario
	order by nivel, ClaArticuloOri
	--where art.claarticulo = 609514
	--and art.clatipoinventario =1



	DROP TABLE #Composicion



SELECT @nClaArticulo = Min(ClaArticulo)
FROM @Articulos
WHERE ClaArticulo>@nClaArticulo
END


