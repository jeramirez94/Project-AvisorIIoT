USE [ASW]
GO
/****** Object:  StoredProcedure [AswSch].[ASW_CU12_Pag1_Grid_NAdmTurnos_CambioValor_ClaTurno_Sel]    Script Date: 14/11/2022 12:47:31 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



--EXEC ASWSch.ASW_CU12_Pag1_Grid_NAdmTurnos_CambioValor_ClaTurno_Sel 68,2
ALTER PROCEDURE  [AswSch].[ASW_CU12_Pag1_Grid_NAdmTurnos_CambioValor_ClaTurno_Sel] 
    @pnClaUbicacion INT,
    @PnClaTurno INT
AS
BEGIN
    SELECT DISTINCT Duracion AS DuracionN FROM AswSch.AswCatTurno
    WHERE
	    ClaTurno = @PnClaTurno AND 
	    ClaUbicacion =@pnClaUbicacion
    END



