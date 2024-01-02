USE [ASW]
GO
/****** Object:  StoredProcedure [AswSch].[ASW_CU402_Pag1_Grid_grdProductBluePrint_Sel]    Script Date: 15/11/2022 03:10:26 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROC [AswSch].[ASW_CU402_Pag1_Grid_grdProductBluePrint_Sel]
@PnClaArticulo INT
AS
BEGIN
	SELECT idBluePrint as colIdBluePrint
	,Descripcion as colDescripcion
	,NombreArchivo as colFileName
	,FechaIns as colUploadDate
	,'Download' as colDownload
	FROM ASWSch.AswTraProductBluePrint
	WHERE (@PnClaArticulo is null OR ClaArticulo = @PnClaArticulo)
	AND BajaLogica = 0
END