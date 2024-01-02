USE [ASW]
GO
/****** Object:  StoredProcedure [AswSch].[ASW_CU203_Pag1_CatSeccionParo_Sel]    Script Date: 15/11/2022 02:15:10 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROC [AswSch].[ASW_CU203_Pag1_CatSeccionParo_Sel]
AS
BEGIN

	SELECT 'ASWLite_CatSeccionParo' as nombretabla
	,ClaUbicacion
	,ClaArea
	,ClaSeccionParo
	,NomSeccionParo
	,IdTipoParoGpoParo
	,BajaLogica
	,CAST(FechaBajaLogica AS VARCHAR) as FechaBajaLogica
	,CAST(FechaUltimaMod AS VARCHAR) as FechaUltimaMod
	,NombrePcMod
	,ClaUsuarioMod
	FROM [AswSch].[ASWCatSeccionParo]
	

END





