USE [ASW]
GO
/****** Object:  UserDefinedFunction [AswSch].[ASWGetInicioTurno]    Script Date: 14/11/2022 10:30:36 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



/****** Object:  UserDefinedFunction [ASWSch].[ASWGetInicioTurno]    Script Date: 23/03/2018 10:32:50 a.m. ******/
--*==============================================================
--*Objeto:        EXEC [ASWSch].[ASWGetInicioTurno]
--*Autor:         Martha Rodriguez Chavez
--*Fecha:         19 Agosto 2020
--*Objetivo:      Obtener la FechaHoraInicio  en base a la fecha administrativa y el turno
--*Entrada:
--*Salida:        FechaHoraInicioReal del turno 
--*Precondiciones:
--*Revisiones: 
/*
SELECT [AswSch].[ASWGetInicioTurno] (68,'2020-09-08',2,1)--0
SELECT [AswSch].[ASWGetInicioTurno] (68,'2020-09-08',3,2)--1
*/
--*==============================================================
ALTER FUNCTION [AswSch].[ASWGetInicioTurno] (
	@pnClaUbicacion INT,
    @ptFechaAdm DATE, 
    @pnClaTurno INT,
	@pnClaDepartamento INT
)   RETURNS DATETIME
AS  BEGIN

	DECLARE
		@tFechaHoraInicioReal DATETIME
		,@tHoraInicioTurno TIME
		,@tHoraFinTurno TIME
		,@nDiaInicio INT

	SELECT @tHoraInicioTurno = [HoraInicioTurno]
		,@tHoraFinTurno = [HoraFinTurno]
		,@nDiaInicio = [ProduccionDiaInicio]
	FROM [AswSch].[AswRelTurnoDepartamentoHorario]
	WHERE ClaUbicacion = @pnClaUbicacion
		AND ClaTurno = @pnClaTurno
		AND ClaDepartamento = @pnClaDepartamento

	IF @tHoraInicioTurno > @tHoraFinTurno AND @nDiaInicio = 0
	BEGIN
		SET @tFechaHoraInicioReal = CAST(@ptFechaAdm AS DATETIME) - 1 + CAST(@tHoraInicioTurno AS DATETIME)
	END
	ELSE
	BEGIN
		SET @tFechaHoraInicioReal = CAST(@ptFechaAdm AS DATETIME) + CAST(@tHoraInicioTurno AS DATETIME)
	END

	RETURN @tFechaHoraInicioReal
END



