SELECT COUNT(1) AS CheckOut
FROM [AswSch].[TraReporteProduccionMCSW]
WHERE FechaAdmScada>='2022-09-26'
	AND EsManual = 1
	AND ClaTipoRegistro = 3

SELECT COUNT(1) AS CheckIn
FROM [AswSch].[TraReporteProduccionMCSW]
WHERE FechaAdmScada>='2022-09-26'
	AND EsManual = 1
	AND ClaTipoRegistro = 1

SELECT SUM(peso) AS LbsScrap
FROM [AswSch].[ASWTraScrap]
WHERE FechaAdmScada>='2022-09-26'

SELECT COUNT(Id) AS Andons
FROM [AswSch].[AswBitAndon]
WHERE FechaAdmScada>='2022-09-26'

SELECT COUNT(1) AS Cajas
FROM [AswSch].[AswTraFinCajaMCSW]
WHERE FechaFinReal>='2022-09-26'



SELECT SUM(DuracionSegundos)/60.0/60.0 AS Paros
FROM [AswSch].[AswBitBitacoraParoCeldaVw]
WHERE FechaAdmScada>='2022-09-26'
	AND ClaTipoMaquina = 3
	AND MicroParoSN = 0

SELECT SUM(DuracionSegundos)/60.0/60.0 AS MicroParos
FROM [AswSch].[AswBitBitacoraParoCeldaVw]
WHERE FechaAdmScada>='2022-09-26'
	AND ClaTipoMaquina = 3
	AND MicroParoSN = 1