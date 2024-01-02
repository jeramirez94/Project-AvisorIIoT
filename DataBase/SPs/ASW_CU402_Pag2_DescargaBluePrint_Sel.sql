USE ASW
GO

DROP PROC ASWSch.ASW_CU402_Pag2_DescargaBluePrint_Sel
GO

/*
EXECUTE ASWSch.ASW_CU402_Pag2_DescargaBluePrint_Sel
	@PsListaArticulos = '606363,-1|606459,1|606122,-1|607131,-1' 
*/
CREATE PROC ASWSch.ASW_CU402_Pag2_DescargaBluePrint_Sel
	@PsListaArticulos VARCHAR(MAX) = NULL
AS
BEGIN
	/*@PnClaArticulo -> Solo un articulo
	  @PsListaArticulos -> Lista separada por comas
	*/

	IF ISNULL(@PsListaArticulos,'') = ''
	BEGIN
		RAISERROR('Debe proporcionar al menos un valor',16,1)
		RETURN
	END


	DECLARE @tmpListaArticulo TABLE (Clave VARCHAR(25))
	DECLARE @tmpArticuloBP TABLE (ClaArticulo INT,IdBluePrint INT)

	INSERT INTO @tmpListaArticulo (Clave)
	SELECT [Value] FROM AswSch.ASWSplitKeyFn(@PsListaArticulos,'|')

	INSERT INTO @tmpArticuloBP (ClaArticulo,IdBluePrint)
	SELECT  SUBSTRING(Clave, 0, CHARINDEX(',',Clave) ) as ClaArticulo
		   ,CAST (SUBSTRING(Clave,CHARINDEX(',',Clave)+1,LEN(Clave)) as INT)as IdBluePrint
	FROM @tmpListaArticulo

	SELECT 'ASWLite_TraProductBluePrint' as nombretabla
	,BP.idBluePrint
	,BP.ClaArticulo
	,BP.Descripcion
	,CAST(BP.idBluePrint AS VARCHAR)+'-'+BP.NombreArchivo+'.'+ISNULL(BPA.Extension,'') as NombreArchivo
	,BP.FechaUltimaMod
	,BPA.Archivo as [binary]
	FROM [AswSch].[AswTraProductBluePrint] BP
	JOIN [AswSch].[AswTraProductBluePrintArchivo] BPA
		ON BP.idBluePrint = BPA.IdBluePrint
	JOIN @tmpArticuloBP tmp
	ON tmp.ClaArticulo = BP.ClaArticulo
	AND BP.IdBluePrint <> tmp.IdBluePrint ---REGRESA LOS QUE NO EXISTEN EN TABLET


END