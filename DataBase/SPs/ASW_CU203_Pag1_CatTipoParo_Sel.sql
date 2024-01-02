USE [ASW]
GO
/****** Object:  StoredProcedure [AswSch].[ASW_CU203_Pag1_CatTipoParo_Sel]    Script Date: 15/11/2022 02:16:19 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROC [AswSch].[ASW_CU203_Pag1_CatTipoParo_Sel]
AS
BEGIN

	SELECT 'ASWLite_CatTipoParo' as nombretabla
	,ClaUbicacion
	,ClaTipoParo
	,NomTipoParo
	,BajaLogica
	,CAST (FechaBajaLogica as VARCHAR) as FechaBajaLogica
	,CAST (FechaUltimaMod as varchar) as FechaUltimaMod
	,NombrePcMod
	,ClaUsuarioMod
	FROM [AswSch].[ASWCatTipoParo]

END





