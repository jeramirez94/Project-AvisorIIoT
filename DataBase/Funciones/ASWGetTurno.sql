USE [ASW]
GO
/****** Object:  UserDefinedFunction [AswSch].[ASWGetTurno]    Script Date: 14/11/2022 10:31:07 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



/****** Object:  UserDefinedFunction [ASWSch].[ASWGetFechaAdm]    Script Date: 23/03/2018 10:32:50 a.m. ******/
--*==============================================================
--*Objeto:        EXEC [ASWSch].[ASWGetFechaAdm]
--*Autor:         Martha Rodriguez Chavez
--*Fecha:         19 Agosto 2020
--*Objetivo:      Obtener la FechaHoraInicio  en base a la fecha administrativa y el turno
--*Entrada:
--*Salida:        FechaHoraInicioReal del turno 
--*Precondiciones:
--*Revisiones: 
/*
SELECT [AswSch].[ASWGetFechaAdm] (68, 2, '2020-09-08 23:00:00')
SELECT [AswSch].[ASWGetFechaAdm] (68, 2, '2020-09-08 07:00:00')
SELECT [AswSch].[ASWGetFechaAdm] (68, 2, NULL)
*/
--*==============================================================
ALTER FUNCTION [AswSch].[ASWGetTurno] (
	@pnClaUbicacion INT, 
	@pnClaDepartamento INT,
    @ptFechaHora DATETIME
)   RETURNS INT
AS  BEGIN

	DECLARE
		@nTurno INT
		--,@tHoraInicioTurno TIME
		--,@tHoraFinTurno TIME
		--,@nDiaInicio INT

		,@tFecha DATE
		,@tHora TIME

	IF @ptFechaHora IS NULL
	BEGIN
		SET @ptFechaHora = GETDATE()
	END
	
	SET @tFecha = CONVERT(DATE, @ptFechaHora)
	SET @tHora = CONVERT(TIME, @ptFechaHora)

	/*
	ProduccionDiaInicio
	1 - la produccion corresponde a la fecha de inicio del turno
	0 - la produccion corresponde a la fecha de fin del turno
	*/

	--obtener turno segun la fecha
	;WITH cteTurnoActual AS(
		select ClaUbicacion, ClaTurno, 0 AS EsCambioDia, ProduccionDiaInicio, HoraInicioTurno, HoraFinTurno 
		FROM [AswSch].[AswRelTurnoDepartamentoHorario]
		where convert(time, @ptFechaHora) >= HoraInicioTurno
			AND convert(time, @ptFechaHora) < HoraFinTurno
			AND HoraFinTurno > HoraInicioTurno
			AND ClaDepartamento = @pnClaDepartamento
		UNION ALL	
		select ClaUbicacion, ClaTurno, 1 AS EsCambioDia, ProduccionDiaInicio, HoraInicioTurno, HoraFinTurno 
		FROM  [AswSch].[AswRelTurnoDepartamentoHorario]
		where (convert(time, @ptFechaHora) >= HoraInicioTurno
			OR convert(time, @ptFechaHora) < HoraFinTurno)
			AND HoraFinTurno < HoraInicioTurno
			AND ClaDepartamento = @pnClaDepartamento
	)
	----obtener fecha segun el turno
	--SELECT @tFechaAdm=CASE EsCambioDia WHEN 0 THEN @tFecha 
	--			WHEN 1 THEN
	--				CASE ProduccionDiaInicio WHEN 1	THEN
	--					CASE WHEN @tHora > HoraInicioTurno
	--					THEN @tFecha
	--					ELSE DATEADD(DAY, -1, @tFecha) END
	--				WHEN 0 THEN
	--					CASE WHEN @tHora < HoraInicioTurno
	--					THEN @tFecha
	--					ELSE DATEADD(DAY, 1, @tFecha) END
	--				END
	--			END
	--			--,ClaTurno			
	--FROM cteTurnoActual
	SELECT @nTurno = ClaTurno
	FROM cteTurnoActual

	RETURN @nTurno
END




