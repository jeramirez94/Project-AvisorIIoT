--USE ASW 
--GO 

ALTER PROC ASWSch.ASW_CU1_Pag5_FolioBitacora_Sel
	@PnClaUbicacion INT = null,
	@PsIdCelda VARCHAR(30),
	@PsClaveFolioBitacora VARCHAR(25) = NULL
AS
BEGIN


	
	EXEC  ASWSch.ASW_CU1_Pag5_FolioBitacora_UPD
	@PnIdCelda = @PsIdCelda,
	@PsClaveFolioBitacora = @PsClaveFolioBitacora

	SELECT ' AswLite_CatFolioBitacora'  as nombretabla
	       ,ClaveFolioBitacora
		   ,IdCelda           
		   ,TablaOrigen
		   ,NombreCampo       
		   ,Folio             
		   ,BajaLogica        
		   ,convert(varchar,FechaBajaLogica,121) as FechaBajaLogica
		   ,NombrePcMod       
		   ,convert(varchar,FechaUltimaMod,121) as FechaUltimaMod
	FROM AswSch.AswCatFolioBitacora
	WHERE IdCelda = @PsIdCelda
	AND (@PsClaveFolioBitacora IS NULL OR ClaveFolioBitacora = @PsClaveFolioBitacora)

	
END
GO 

