USE [ASW]
GO
/****** Object:  StoredProcedure [AswSch].[ASW_CU12_Pag1_Grid_AdmTurnos_CambioValor_ClaTurno_Sel]    Script Date: 14/11/2022 12:32:03 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


--EXEC ASWSch.ASW_CU12_Pag1_Grid_AdmTurnos_CambioValor_Turno_Sel 68,1

ALTER PROC [AswSch].[ASW_CU12_Pag1_Grid_AdmTurnos_CambioValor_ClaTurno_Sel] 
    @pnClaUbicacion INT,
    @PnClaTurno INT

AS
BEGIN
    SELECT DISTINCT Duracion AS Duracion 
	FROM AswSch.AswCatTurno
    WHERE 
		ClaUbicacion = @pnClaUbicacion
		AND ClaTurno = @PnClaTurno 
	   
    END




