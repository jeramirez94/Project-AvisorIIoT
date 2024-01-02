 CREATE PROC ASWSch.ASW_CU402_Pag1_LnkBoton_colDownload_Descarga
 @PncolIdBluePrint INT
 AS
 BEGIN

	SELECT BP.NombreArchivo as FileName
	,BPA.Archivo as FileData
	,'pdf' as FileExt
	FROM ASWSch.AswTraProductBluePrint BP
	JOIN ASWSch.AswTraProductBluePrintArchivo BPA
	ON BP.idBluePrint = BPA.IdBluePrint
	WHERE BP.idBluePrint = @PncolIdBluePrint


 END