USE [ASW]
GO
/****** Object:  StoredProcedure [AswSch].[ASW_CU6_Pag1_ObtenerSiguienteVersion_Proc]    Script Date: 14/11/2022 11:26:12 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/*
* MRODRIGUEZC
* 2022/08/18
* Obtiene la ultima Major version de la base de datos de sqlite
*/
/*
EXECUTE AswSch.ASW_CU6_Pag1_ObtenerSiguienteVersion_Proc '0.0', 1
*/
ALTER  PROCEDURE [AswSch].[ASW_CU6_Pag1_ObtenerSiguienteVersion_Proc]
	@pnVersion VARCHAR(15),
	@pnDebug INT = 0
AS
BEGIN
SET NOCOUNT ON
	DECLARE 
		@nMajor INT
		,@nMinor INT

	--obtengo los valores de la version mayor y menor
	SELECT @nMajor = Major
		,@nMinor = Minor
	FROM AswSch.AswCatVersionBD
	WHERE [Version] = @pnVersion
		AND BajaLogica = 0

	IF @pnDebug=1
	BEGIN
		SELECT @nMajor, @nMinor
	END

	--obtengo la siguiente version
	SELECT IdVersion
		,Version
		,Major
		,Minor
		,IncrementalScript
	FROM AswSch.AswCatVersionBD 
	WHERE BajaLogica = 0
		AND (Major = @nMajor AND Minor > @nMinor
			OR Major>@nMajor)
	ORDER BY Major, Minor

END