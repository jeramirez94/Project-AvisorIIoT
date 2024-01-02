USE ASW
GO

DROP PROC ASWSch.ASW_CU402_Pag1_Grid_grdProductBluePrint_IU
GO

CREATE PROC ASWSch.ASW_CU402_Pag1_Grid_grdProductBluePrint_IU
	@PncolIdBluePrint INT
AS
BEGIN

	UPDATE ASWSch.AswTraProductBluePrint
	SET BajaLogica = 1
	,FechaBajaLogica = GETDATE()
	WHERE idBluePrint = 	@PncolIdBluePrint 


END