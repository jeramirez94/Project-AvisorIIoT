USE [ASW]
GO
/****** Object:  StoredProcedure [AswSch].[ASWTurnosAvisorCmb]    Script Date: 15/11/2022 04:38:47 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROC [AswSch].[ASWTurnosAvisorCmb]
@pnEsRegex INT = 0
AS
BEGIN
	SELECT NomTurno, ClaTurno
	INTO #Turnos
	FROM [AswSch].[AswCatTurno]
	WHERE ClaTurno IN(1,3)

	IF @pnEsRegex = 1
	BEGIN
		SELECT 'Desc='+NomTurno + ':value='+CAST(ClaTurno AS VARCHAR)+':' AS Turno
		FROM #Turnos
	END
	ELSE
	BEGIN
		SELECT ClaTurno, 
			NomTurno 
		FROM #Turnos
	END
END