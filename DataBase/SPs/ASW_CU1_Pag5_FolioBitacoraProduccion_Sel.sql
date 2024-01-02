--USE [ASW]
--GO
/****** Object:  StoredProcedure [AswSch].[ASW_CU1_Pag5_FolioBitacoraProduccion_Sel]    Script Date: 14/11/2022 11:11:38 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROC [AswSch].[ASW_CU1_Pag5_FolioBitacoraProduccion_Sel]
	@PnClaUbicacion INT,
	@PsIdCelda VARCHAR(30)
AS
BEGIN

	BEGIN TRY

		EXEC ASWSch.ASW_CU1_Pag5_FolioBitacora_UPD
			@PsIdCelda = @PsIdCelda,
			@PsClaveFolioBitacora  = 'FolBitProd'

	END TRY
	BEGIN CATCH

		DECLARE @err VARCHAR(500)= ERROR_MESSAGE();
		Print @err

	END CATCH

	SELECT 'AswLite_CatFolioBitacora' as nombretabla
			,'ClaveFolioBitacora,IdCelda' as keys 
		   ,ISNULL(MAX(IdBitProduccion),0)+1 as Folio
		   ,@PsIdCelda as IdCelda
		   ,'FolBitProd' as ClaveFolioBitacora 
		   ,'replica' as  NombrePcMod
		   ,convert(varchar,GETDATE(),121) as fechaultimamod
	FROM AswSch.AswBitBitacoraProduccion
	WHERE IdCelda = @PsIdCelda
	AND ClaUbicacion = @PnClaUbicacion


END