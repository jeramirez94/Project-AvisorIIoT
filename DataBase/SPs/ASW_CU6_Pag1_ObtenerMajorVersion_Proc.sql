USE [ASW]
GO
/****** Object:  StoredProcedure [AswSch].[ASW_CU6_Pag1_ObtenerMajorVersion_Proc]    Script Date: 14/11/2022 11:23:44 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/*
* MRODRIGUEZC
* 2022/08/18
* Obtiene la ultima Major version de la base de datos de sqlite
*/
ALTER  PROCEDURE [AswSch].[ASW_CU6_Pag1_ObtenerMajorVersion_Proc]
	@PnDebug int = 0
AS
BEGIN
SET NOCOUNT ON

	SELECT TOP(1) IdVersion
		,Version
		,Major
		,Minor
		,MajorScript
	FROM AswSch.AswCatVersionBD
	WHERE Minor = 0
		AND BajaLogica=0
	ORDER BY Major DESC

END