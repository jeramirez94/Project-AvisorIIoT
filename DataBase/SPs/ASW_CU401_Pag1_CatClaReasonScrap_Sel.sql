USE [ASW]
GO
/****** Object:  StoredProcedure [AswSch].[ASW_CU401_Pag1_CatClaReasonScrap_Sel]    Script Date: 15/11/2022 03:05:43 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROC [AswSch].[ASW_CU401_Pag1_CatClaReasonScrap_Sel]
AS
BEGIN
	SELECT 'ASWLite_CatClaReasonScrap' AS nombretabla,
		ClaRazonScrapCelda,	
		NomRazonScrapCelda, 
		BajaLogica,			
		convert(varchar,FechaUltimaMod,121) as FechaUltimaMod,	
		ClaUsuarioMod,	
		NombrePcMod			
		FROM [AswSch].[AswCatRazonScrapCelda]
END