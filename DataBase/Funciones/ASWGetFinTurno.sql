USE [ASW]
GO
/****** Object:  UserDefinedFunction [AswSch].[ASWGetFinTurno]    Script Date: 14/11/2022 10:29:44 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



/****** Object:  UserDefinedFunction [ASWSch].[ASWGetFinTurno]    Script Date: 23/03/2018 10:32:50 a.m. ******/
--*==============================================================
--*Objeto:        EXEC [ASWSch].[ASWGetFinTurno]
--*Autor:         Martha Rodriguez Chavez
--*Fecha:         19 Agosto 2020
--*Objetivo:      Obtener la FechaHoraFin  en base a la fecha administrativa y el turno
--*Entrada:
--*Salida:        FechaHoraFinReal del turno 
--*Precondiciones:
--*Revisiones: 
/*
SELECT [AswSch].[ASWGetFinTurno] (68,'2020-09-08',2,1)--0
SELECT [AswSch].[ASWGetFinTurno] (68,'2020-09-08',3,2)--1
*/
--*==============================================================
ALTER FUNCTION [AswSch].[ASWGetFinTurno] (
	@pnClaUbicacion INT,
    @ptFechaAdm DATE, 
    @pnClaTurno INT,
	@pnClaDepartamento INT
)   RETURNS DATETIME
AS  BEGIN

	DECLARE
		@tFechaHoraFinReal DATETIME
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

	IF @tHoraInicioTurno > @tHoraFinTurno AND @nDiaInicio = 1
	BEGIN
		SET @tFechaHoraFinReal = CAST(@ptFechaAdm AS DATETIME) + 1 + CAST(@tHoraFinTurno AS DATETIME)
	END
	ELSE
	BEGIN
		SET @tFechaHoraFinReal = CAST(@ptFechaAdm AS DATETIME) + CAST(@tHoraFinTurno AS DATETIME)
	END

	RETURN @tFechaHoraFinReal
END




