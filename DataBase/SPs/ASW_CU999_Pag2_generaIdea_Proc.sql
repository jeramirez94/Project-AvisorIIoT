--USE [ASW]
--GO
/****** Object:  StoredProcedure [AswSch].[ASW_CU999_Pag2_generaIdea_Proc]    Script Date: 15/11/2022 04:18:00 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROC [AswSch].[ASW_CU999_Pag2_generaIdea_Proc]
		  @pnTurno			int
		, @pnClaTipoMejora  int
		, @psIdeaDescripcion varchar(max)
		, @pnClaUsuarioMod	int
		, @psNombrePcMod	varchar(64)
AS
BEGIN

Declare @nIdNumDepto INT,
	    @nClaveCelda INT,
		@ResultSatus INT

SELECT @nIdNumDepto = ClaDepartamento,
	   @nClaveCelda = ClaveWorkCenter
FROM [AswSch].[AswCatWorkCenterVw] CEL

EXEC @ResultSatus = [MSW_LNKSVR].MCSW_ERP.[MSWSch].[MSW_GenerarIdea_Proc]
	 @nIdNumDepto
	,@pnTurno
	,@nClaveCelda
	,@pnClaTipoMejora
	,@psIdeaDescripcion
	,@pnClaUsuarioMod
	,@psNombrePcMod 

SELECT @ResultSatus

END