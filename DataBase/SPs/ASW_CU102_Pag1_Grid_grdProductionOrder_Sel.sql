--USE [ASW]
--GO
/****** Object:  StoredProcedure [AswSch].[ASW_CU102_Pag1_Grid_grdProductionOrder_Sel]    Script Date: 14/11/2022 01:18:41 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--EXEC ASWSch.ASW_CU102_Pag1_Grid_grdProductionOrder_Sel 68, '2020-03-08',1,1,null,null
ALTER PROCEDURE [AswSch].[ASW_CU102_Pag1_Grid_grdProductionOrder_Sel]
	@pnClaUbicacion INT
	,@ptShowUntil DATETIME
	,@pnClaArticuloSel INT
	,@pnViewLocation INT
	,@pnClaDepartamento INT
	,@psIdCelda VARCHAR(30)
AS
BEGIN
	
	IF @pnViewLocation = 1
	BEGIN
		EXEC ASWSch.ASW_CU102_Pag1_Grid_grdProductionOrderByLocation_Sel
			@pnClaUbicacion 
			,@pnClaDepartamento 
			,@psIdCelda 
	END
	ELSE
	BEGIN
		EXEC ASWSch.ASW_CU102_Pag1_Grid_grdProductionOrderByItem_Sel
			@pnClaUbicacion 
			,@ptShowUntil 
			,@pnClaArticuloSel 
	END
	
END