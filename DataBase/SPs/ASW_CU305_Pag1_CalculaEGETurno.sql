USE [ASW]
GO
/****** Object:  StoredProcedure [AswSch].[ASW_CU305_Pag1_CalculaEGETurno]    Script Date: 15/11/2022 02:38:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- EXEC [AswSch].[ASW_CU305_Pag1_CalculaEGETurno] 68,1
ALTER PROC [AswSch].[ASW_CU305_Pag1_CalculaEGETurno]
	@pnClaUbicacion INT
	,@pnDebug INT = 0
AS
BEGIN
 DECLARE @date DATETIME;
 SET @date = DATEADD(HOUR, -10, GETDATE());
 WHILE @date < GETDATE()
 BEGIN
    EXEC [AswSch].[ASW_CU305_Pag1_CalculaEGEHora] @pnClaUbicacion,@date,@pnDebug
	SET @date = DATEADD(HOUR, 1, @date) 
 END
END