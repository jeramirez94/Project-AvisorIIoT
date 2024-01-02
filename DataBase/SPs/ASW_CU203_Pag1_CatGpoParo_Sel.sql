USE [ASW]
GO
/****** Object:  StoredProcedure [AswSch].[ASW_CU203_Pag1_CatGpoParo_Sel]    Script Date: 15/11/2022 02:14:09 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROC [AswSch].[ASW_CU203_Pag1_CatGpoParo_Sel]
AS
BEGIN

	SELECT 'ASWLite_CatGpoParo' as nombretabla
	,ClaUbicacion
	,ClaGpoParo
	,NomGpoParo
	,BajaLogica
	,CAST(FechaBajaLogica AS VARCHAR) AS FechaBajaLogica
	,CAST(FechaUltimaMod AS VARCHAR) as FechaUltimaMod
	,NombrePcMod
	,ClaUsuarioMod
	FROM [AswSch].[ASWCatGpoParo]
	

END

