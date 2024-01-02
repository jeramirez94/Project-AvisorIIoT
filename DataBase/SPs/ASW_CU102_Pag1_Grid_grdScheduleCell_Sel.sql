--USE [ASW]
--GO
/****** Object:  StoredProcedure [AswSch].[ASW_CU102_Pag1_Grid_grdScheduleCell_Sel]    Script Date: 14/11/2022 11:41:29 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--EXEC ASWSch.ASW_CU102_Pag1_Grid_grdScheduleCell_Sel 68, NULL, NULL
ALTER PROCEDURE [AswSch].[ASW_CU102_Pag1_Grid_grdScheduleCell_Sel]
	@pnClaUbicacion INT
	,@pnClaDepartamento INT
	,@psIdCelda VARCHAR(30)
AS
BEGIN
	SELECT 0 ClaDepartamento
		,'' NomDepartamento
		,0 claCelda
		,'' NomCelda
		,0 ScheduledBoxes
		,'' ProductionNotes
	WHERE 1=0

	
END