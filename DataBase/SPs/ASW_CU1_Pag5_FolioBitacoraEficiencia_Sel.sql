--USE [ASW]
--GO
/****** Object:  StoredProcedure [AswSch].[ASW_CU1_Pag5_FolioBitacoraEficiencia_Sel]    Script Date: 14/11/2022 11:08:13 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROC [AswSch].[ASW_CU1_Pag5_FolioBitacoraEficiencia_Sel]
	@PnClaUbicacion INT,
	@PsIdCelda VARCHAR(30)
AS
BEGIN

	BEGIN TRY

		EXEC ASWSch.ASW_CU1_Pag5_FolioBitacora_UPD
			@PsIdCelda = @PsIdCelda,
			@PsClaveFolioBitacora  = 'FolBitEficiencia'

	END TRY
	BEGIN CATCH

		DECLARE @err VARCHAR(500)= ERROR_MESSAGE();
		Print @err

	END CATCH

	SELECT 'AswLite_CatFolioBitacora' as nombretabla
		   ,'ClaveFolioBitacora,IdCelda' as keys 
		   ,ISNULL(MAX(IdLocal),0)+1 as Folio
		   ,@PsIdCelda as IdCelda
		   ,'FolBitEficiencia' as ClaveFolioBitacora 
		   ,'replica' as  NombrePcMod
		   ,convert(varchar,GETDATE(),121) as fechaultimamod
	FROM AswSch.AswBitBitacoraBajaEficiencia
	WHERE IdCelda = @PsIdCelda
	AND ClaUbicacion = @PnClaUbicacion


END