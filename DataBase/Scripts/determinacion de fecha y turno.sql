

DECLARE @tFechaHora DATETIME = '2021-08-12 05:00:00'
	,@tFecha DATE 
	,@tHora TIME 
	
SET @tFecha = CONVERT(DATE, @tFechaHora)
SET @tHora = CONVERT(TIME, @tFechaHora)


select ClaUbicacion, ClaTurno, 0 AS EsCambioDia, ProduccionDiaInicio, HoraInicioTurno, HoraFinTurno 
	FROM [AswSch].[AswRelTurnoDepartamentoHorario]
	where convert(time, @tFechaHora) >= HoraInicioTurno
		AND convert(time, @tFechaHora) < HoraFinTurno
		AND HoraFinTurno > HoraInicioTurno
		AND ClaDepartamento = 2
	UNION ALL	
	select ClaUbicacion, ClaTurno, 1 AS EsCambioDia, ProduccionDiaInicio, HoraInicioTurno, HoraFinTurno 
	FROM  [AswSch].[AswRelTurnoDepartamentoHorario]
	where (convert(time, @tFechaHora) >= HoraInicioTurno
		OR convert(time, @tFechaHora) < HoraFinTurno)
		AND HoraFinTurno < HoraInicioTurno
		AND ClaDepartamento = 2



/*
ProduccionDiaInicio
1 - la produccion corresponde a la fecha de inicio del turno
0 - la produccion corresponde a la fecha de fin del turno
*/

--obtener turno segun la fecha
;WITH cteTurnoActual AS(
	select ClaUbicacion, ClaTurno, 0 AS EsCambioDia, ProduccionDiaInicio, HoraInicioTurno, HoraFinTurno 
	FROM [AswSch].[AswRelTurnoDepartamentoHorario]
	where convert(time, @tFechaHora) >= HoraInicioTurno
		AND convert(time, @tFechaHora) < HoraFinTurno
		AND HoraFinTurno > HoraInicioTurno
		AND ClaDepartamento = 2
	UNION ALL	
	select ClaUbicacion, ClaTurno, 1 AS EsCambioDia, ProduccionDiaInicio, HoraInicioTurno, HoraFinTurno 
	FROM  [AswSch].[AswRelTurnoDepartamentoHorario]
	where (convert(time, @tFechaHora) >= HoraInicioTurno
		OR convert(time, @tFechaHora) < HoraFinTurno)
		AND HoraFinTurno < HoraInicioTurno
		AND ClaDepartamento = 2
)
--obtener fecha segun el turno
SELECT CASE EsCambioDia WHEN 0 THEN @tFecha 
			WHEN 1 THEN
				CASE ProduccionDiaInicio WHEN 1	THEN
					CASE WHEN @tHora > HoraInicioTurno
					THEN @tFecha
					ELSE DATEADD(DAY, -1, @tFecha) END
				WHEN 0 THEN
					CASE WHEN @tHora < HoraInicioTurno
					THEN @tFecha
					ELSE DATEADD(DAY, 1, @tFecha) END
				END
			END AS FechaAdm
			,ClaTurno			
FROM cteTurnoActual


/*
--turno default
SELECT TOP 1 WITH TIES *
FROM [AswSch].[AswRelTurnoDepartamentoHorario]
ORDER BY ROW_NUMBER() OVER(PARTITION BY ClaDepartamento ORDER BY HoraInicioTurno)
*/