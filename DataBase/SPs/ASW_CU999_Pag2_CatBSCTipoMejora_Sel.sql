USE [ASW]
GO
/****** Object:  StoredProcedure [AswSch].[ASW_CU999_Pag2_CatBSCTipoMejora_Sel]    Script Date: 15/11/2022 04:17:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROC [AswSch].[ASW_CU999_Pag2_CatBSCTipoMejora_Sel]
AS
BEGIN

	SELECT 
	    'ASWLite_CatBSCTipoMejora' as nombretabla,
		keys = 'ClaTipoMejora',
		fuc = 'FechaUltimaMod',
		ClaTipoMejora,
		NomTipoMejora,
		BajaLogica,
		convert(varchar,FechaBajaLogica,121) as FechaBajaLogica,
		convert(varchar,GETDATE(),121) as  FechaUltimaMod, 
		ClaUsuarioMod,
		NombrePcMod
	FROM [AswSch].[ASWCatBSCTipoMejora]
	WHERE ISNULL(BajaLogica,0) = 0

END
