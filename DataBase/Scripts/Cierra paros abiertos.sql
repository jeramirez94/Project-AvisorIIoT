
DECLARE
	@nEsReplicaERP INT = 0--parametro para marcar los registros para replica
	,@nEsRecalculaIndicador INT=0--todo:parametro para ejecutar el reclaculo de los indicadores

SELECT Id
INTO #tmpParoSospechoso
FROM [ASW].[AswSch].[AswBitBitacoraParoCeldaVw]
WHERE FechaHoraFinal = '1900-01-01 00:00:00.000'
	AND FechaHoraInicial>'2022-06-01'
	AND FechaHoraInicial<'2022-09-20'
ORDER BY FechaHoraFinal

SELECT * 
FROM [AswSch].[AswBitBitacoraParoCeldaVw]
WHERE Id IN (SELECT Id FROM #tmpParoSospechoso)
ORDER BY Id


DECLARE 
	@nIdParo INT
	,@nIdCelda INT
	,@nClaTipoMaquina INT
	,@tFechaHoraInicial DATETIME
	,@tFechaHoraFinal DATETIME
	,@tFinTurno DATETIME
	,@tFechaAdm DATE
    ,@nClaTurno INT
	,@nClaDepartamento INT

SELECT @nIdParo = MIN(Id)
FROM #tmpParoSospechoso

WHILE @nIdParo IS NOT NULL
BEGIN
	SELECT @nIdCelda=IdCelda
		,@nClaTipoMaquina=ClaTipoMaquina
		,@tFechaHoraInicial = FechaHoraInicial
		,@tFechaAdm = FechaAdmSCADA
		,@nClaTurno = ClaTurno
		,@nClaDepartamento = 2--TODO:obtenerlo de la celda
	FROM [AswSch].[AswBitBitacoraParoCeldaVw]
	WHERE Id=@nIdParo

	SELECT @tFinTurno = [AswSch].[ASWGetFinTurno](68, @tFechaAdm, @nClaTurno, @nClaDepartamento)

	IF @nClaTipoMaquina = 1 --HEADER
	BEGIN
		SELECT @tFechaHoraFinal=MIN(FechaHoraAvisor)
		FROM [AswSch].[AswBitSeñal]
		WHERE Header_Status = 1
		AND FechaHoraAvisor>@tFechaHoraInicial
	END

	IF @nClaTipoMaquina = 2 --THREADER
	BEGIN
		SELECT @tFechaHoraFinal=MIN(FechaHoraAvisor)
		FROM [AswSch].[AswBitSeñal]
		WHERE Threader_Status = 1
		AND FechaHoraAvisor>@tFechaHoraInicial
	END

	IF @nClaTipoMaquina = 3 --COLLATOR
	BEGIN
		SELECT @tFechaHoraFinal=MIN(FechaHoraAvisor)
		FROM [AswSch].[AswBitSeñal]
		WHERE Collator_Status = 1
		AND FechaHoraAvisor>@tFechaHoraInicial
	END

	IF @nClaTipoMaquina = 6 --ROBOT
	BEGIN
		SELECT @tFechaHoraFinal=MIN(FechaHoraAvisor)
		FROM [AswSch].[AswBitSeñal]
		WHERE Robot_Status = 1
		AND FechaHoraAvisor>@tFechaHoraInicial
	END

	--si el paro excedio el tiempo del turno, lo corto en el fin de turno
	IF @tFinTurno>@tFechaHoraInicial AND @tFinTurno<@tFechaHoraFinal OR @tFechaHoraFinal IS NULL
	BEGIN
		SET @tFechaHoraFinal = @tFinTurno
	END
	
	--todo: se puede mejorar esta condicion
	--si se encuentra la fecha y la duracion es menor a la duracion del turno se considera correcta 
	IF @tFechaHoraFinal IS NOT NULL AND DATEDIFF(HOUR, @tFechaHoraInicial, @tFechaHoraFinal)<=10 
	BEGIN
		UPDATE [AswSch].[AswBitBitacoraParo]
		SET FechaHoraFinal = @tFechaHoraFinal
			,DuracionSegundos = DATEDIFF(SECOND, @tFechaHoraInicial, @tFechaHoraFinal)
			,MicroParoSN = CASE WHEN DATEDIFF(SECOND, @tFechaHoraInicial, @tFechaHoraFinal) >= 60*3 THEN 0 ELSE 1 END
			,ClaSeccionParo = CASE WHEN DATEDIFF(SECOND, @tFechaHoraInicial, @tFechaHoraFinal) >= 60*3 AND ClaSeccionParo IS NOT NULL THEN 184 ELSE ClaSeccionParo END
			,ClaEventoJustificacion = CASE @nEsReplicaERP 
										WHEN 1 THEN 
											CASE WHEN ClaEventoJustificacion IS NULL THEN 1 END 
										ELSE 
											ClaEventoJustificacion 
										END
			,ClaEventoCierre = CASE @nEsReplicaERP 
								WHEN 1 THEN 
									1 
								ELSE 
									ClaEventoCierre 
								END
			,ClaEstatusReplica = CASE @nEsReplicaERP 
								WHEN 1 THEN 
									1 
								ELSE 
									ClaEstatusReplica 
								END
		WHERE Id = @nIdParo 

		SELECT *
		FROM [AswSch].[AswBitBitacoraParoCeldaVw]
		WHERE Id=@nIdParo
	END

	SET @tFechaHoraFinal = NULL
	SET @tFinTurno = NULL

	SELECT @nIdParo = MIN(Id)
	FROM #tmpParoSospechoso
	WHERE Id>@nIdParo
END

--SELECT TOP(10)* 
--FROM [AswSch].[AswBitBitacoraParoCeldaVw]
--SELECT TOP(10)* FROM [AswSch].[AswBitSeñal]


DROP TABLE #tmpParoSospechoso
