--USE [ASW]
--GO
/****** Object:  StoredProcedure [AswSch].[ASW_CU522_Pag1_CatSeccionParoDatos_Sel]    Script Date: 15/11/2022 03:19:55 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


ALTER PROC [AswSch].[ASW_CU522_Pag1_CatSeccionParoDatos_Sel]
	@PsIdCelda VARCHAR(30) 
AS
BEGIN

	-- TODO: Validar que el campo ClaveArea sea el mismo que ClaTipoCelda 
	DECLARE @nClaArea INT

	SELECT @nClaArea = ClaArea
	FROM [AswSch].[AswCatWorkCenterVw]
	WHERE IdWorkCenter = @PsIdCelda

	IF @PsIdCelda IS NOT NULL 
	BEGIN

		SELECT 
			   'ASWLite_CatSeccionParoDatos' as nombretabla
			   ,keys = 'ClaUbicacion,IdRelAlertaSeccionParo'
			   ,fuc = 'FechaUltimaMod'
			  ,[ClaUbicacion]
			  ,[IdRelAlertaSeccionParo]
			  ,[ClaGpoParo]
			  ,[NomGpoParo]
			  ,[ClaTipoParo]
			  ,[IdTipoParoGpoParo]
			  ,[NomTipoParo]
			  ,[ClaSeccionParo]
			  ,[ClaveSeccion]
			  ,[NomSeccionParo]
			  ,[ClaAlerta]
			  ,[NomAlerta]
			  ,[ClaArea]
			  ,[ClaveArea]
			  ,[NomArea]
			  ,[ClaveDepartamento]
			  ,[NomDepartamento]
			  ,[EsParo]
			  ,[EsAlerta]
			  ,[ClaRubroParo]
			  ,[NomRubroParo]
			  ,[BajaLogica]
			  ,convert(varchar,FechaBajaLogica,121) as FechaBajaLogica
			  ,convert(varchar, GETDATE() ,121) as FechaUltimaMod
			  ,[ClaUsuarioMod]
			  ,[NombrePcMod]
			  ,[MinutosAvisoN1]
			  ,[MinutosAvisoN2]
			  ,[MinutosAvisoN3]
			  ,[MinutosAvisoN4]
		  FROM [AswSch].[AswCatSeccionParoDatosMCSW]
		  WHERE ClaArea = @nClaArea 

	END

END