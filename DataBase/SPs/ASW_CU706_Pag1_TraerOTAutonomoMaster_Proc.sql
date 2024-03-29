--USE [ASW]
--GO
/****** Object:  StoredProcedure [AswSch].[ASW_CU706_Pag1_TraerOTAutonomoMaster_Proc]    Script Date: 15/11/2022 04:15:57 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
	EXEC [AswSch].[ASW_CU706_Pag1_TraerOTAutonomoMaster_Proc] 68, 0, 'AVISOR'
*/
ALTER	PROCEDURE [AswSch].[ASW_CU706_Pag1_TraerOTAutonomoMaster_Proc]
(
	@PnClaUbicacion		int,
	@PnClaUsuarioMod	int,
	@psNombrePcMod		varchar(64)
)
AS
DECLARE @nRow				int
DECLARE @sIdCelda	varchar(30)
BEGIN
SET NOCOUNT ON
	IF OBJECT_ID('tempdb..#tbCelda') IS NOT NULL
		DROP TABLE #tbCelda
	CREATE TABLE #tbCelda
	(
		Renglon				int identity(1,1),
		IdCelda	int
	)

	INSERT #tbCelda(IdCelda)
	SELECT	distinct IdCelda
	FROM	[AswSch].[AswRelMtoSubAreaCelda]
	WHERE	BajaLogica = 0
	ORDER BY IdCelda

	SELECT	@nRow = MIN(Renglon)
	FROM	#tbCelda

	WHILE @nRow IS NOT NULL
	BEGIN
		SELECT	@sIdCelda = IdCelda
		FROM	#tbCelda
		WHERE	Renglon = @nRow

		BEGIN TRY
			EXEC	[AswSch].[ASW_CU706_Pag1_TraerOTAutonomo_Proc]
					@PnClaUbicacion		= @PnClaUbicacion,
					@pnIdCelda			= @sIdCelda,
					@PnClaUsuarioMod	= @PnClaUsuarioMod,
					@psNombrePcMod		= @psNombrePcMod,
					@PdFechaInicio		= NULL,
					@PdFechaFin			= NULL
		END TRY
		BEGIN CATCH
			PRINT ERROR_MESSAGE()
		END	CATCH

		SELECT	@nRow = MIN(Renglon)
		FROM	#tbCelda
		WHERE	Renglon > @nRow
	END
SET NOCOUNT OFF
END

