--USE [ASW]
--GO
/****** Object:  StoredProcedure [AswSch].[ASW_CU505_Pag1_CatBajaEficiencia_Sel]    Script Date: 15/11/2022 03:18:46 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [AswSch].[ASW_CU505_Pag1_CatBajaEficiencia_Sel]
	@PsIdCelda VARCHAR(30) 
AS
BEGIN

	DECLARE 
		@nClaArea INT

	SELECT @nClaArea = ClaArea
	FROM [AswSch].[AswCatWorkCenterVw]
	WHERE IdWorkCenter = @PsIdCelda

	IF @PsIdCelda IS NOT NULL 
	BEGIN
		SELECT 'ASWLite_CatBajaEficiencia' as nombretabla
			,keys = 'ClaUbicacion,ClaArea,ClaBajaEficiencia'
			,fuc = 'FechaUltimaMod'
			,[ClaUbicacion]
			,[ClaArea]
			,[ClaBajaEficiencia]
			,[ClaveBajaEficiencia]
			,[NomBajaEficiencia]
			,[ClaRubroParo]
			,[BajaLogica]
			,CONVERT(VARCHAR,[FechaBajaLogica],121) AS FechaBajaLogica
			,CONVERT(VARCHAR, GETDATE(),121) AS FechaUltimaMod
			,[NombrePcMod]
			,[ClaUsuarioMod]
		FROM [AswSch].[AswCatBajaEficiencia]
		WHERE ClaArea = @nClaArea

	END

END