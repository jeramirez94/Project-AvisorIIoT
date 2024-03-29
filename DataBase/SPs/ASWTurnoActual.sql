USE [ASW]
GO
/****** Object:  StoredProcedure [AswSch].[ASWTurnoActual]    Script Date: 15/11/2022 04:29:19 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROC [AswSch].[ASWTurnoActual]
AS
BEGIN
DECLARE @nClaTurno INT
	;WITH cteTurnoActual AS(
		select ClaUbicacion, ClaTurno, 0 AS EsCambioDia, ProduccionDiaInicio, HoraInicioTurno, HoraFinTurno 
		FROM [AswSch].[AswRelTurnoDepartamentoHorario]
		where convert(time, (SELECT convert(varchar, getdate(), 120))) >= HoraInicioTurno
			AND convert(time, (SELECT convert(varchar, getdate(), 120))) < HoraFinTurno
			AND HoraFinTurno > HoraInicioTurno
			AND ClaDepartamento = 2
			
		UNION ALL	
		select ClaUbicacion, ClaTurno, 1 AS EsCambioDia, ProduccionDiaInicio, HoraInicioTurno, HoraFinTurno 
		FROM  [AswSch].[AswRelTurnoDepartamentoHorario]
		where (convert(time,(SELECT convert(varchar, getdate(), 120))) >= HoraInicioTurno
			OR convert(time, (SELECT convert(varchar, getdate(), 120))) < HoraFinTurno)
			AND HoraFinTurno < HoraInicioTurno
			AND ClaDepartamento = 2
			
	)
	
	SELECT @nClaTurno = ClaTurno FROM cteTurnoActual

	IF @nClaTurno IS NULL
		SET @nClaTurno = 1

	SELECT @nClaTurno as ClaTurno

END
