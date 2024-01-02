SELECT ClaveCelda, ClaMaquina
FROM [AswSch].[AswCatCeldas] C
JOIN [AswSch].[AswCatMaquina] M
	ON C.IdCelda = M.ClaCelda
WHERE C.ClaAreaProduccion = 2 
	and C.clavecelda in (8,10,11,12,13,14,15,16,17,18,68,71,73)
	and M.bajalogica=0
	AND ClaTipoMaquina = 1 --HEADER
ORDER BY CAST(ClaveCelda AS INT)

SELECT ClaveCelda, ClaMaquina, NULL as RobotBrand
FROM [AswSch].[AswCatCeldas] C
JOIN [AswSch].[AswCatMaquina] M
	ON C.IdCelda = M.ClaCelda
WHERE C.ClaAreaProduccion = 2 
	and C.clavecelda in (8,10,11,12,13,14,15,16,17,18,68,71,73)
	and M.bajalogica=0
	AND ClaTipoMaquina = 6 --ROBOT
ORDER BY CAST(ClaveCelda AS INT)