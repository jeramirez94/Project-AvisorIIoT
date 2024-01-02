--USE [ASW]
--GO
/****** Object:  StoredProcedure [AswSch].[ASW_CU102_Pag1_Grid_grdScheduleCell_IU]    Script Date: 14/11/2022 11:39:47 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--EXEC ASWSch.ASW_CU102_Pag1_Grid_grdScheduleCell_IU 68, NULL, NULL
ALTER PROCEDURE [AswSch].[ASW_CU102_Pag1_Grid_grdScheduleCell_IU]
	@pnClaUbicacion INT
	,@pnClaArticulo INT
	,@pnClaDepartamento INT
	,@psClaCelda VARCHAR(30)
	,@pnScheduledBoxes INT
	,@psProductionNotes VARCHAR(140)
	,@pnClaUsuarioMod INT
	,@psNombrePcMod VARCHAR(64)
AS
BEGIN
	
	EXEC ASWSch.ASW_CU102_Pag1_Boton_AgregarOrdenProduccion_Proc	
		@pnClaUbicacion =@pnClaUbicacion
		,@pnClaArticulo =@pnClaArticulo
		,@pnClaDepartamentoOrden =@pnClaDepartamento
		,@psIdCeldaOrden =@psClaCelda
		,@pnScheduledBoxes =@pnScheduledBoxes
		,@psProductionNotes =@psProductionNotes
		,@pnClaUsuarioMod = @pnClaUsuarioMod
		,@psNombrePcMod = @psNombrePcMod

	
END