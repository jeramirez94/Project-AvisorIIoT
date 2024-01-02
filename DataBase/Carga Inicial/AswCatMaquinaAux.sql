SELECT *
--INTO #AswCatMaquinaAux
FROM [AswSch].[AswCatMaquinaAux]

INSERT INTO [AswSch].[AswCatMaquinaAux] ([ClaOrigen],[PullyArms],[PulleyRevs],[NailsPerRev],[RobotBrand],EsGralParos,EsMaquina,TipoSe�al) 
SELECT ClaMaquina	
	,PullyArms	
	,PulleyRevs	
	,NailsPerRev	
	,RobotBrand
	,CASE WHEN RobotBrand IS NOT NULL THEN 1 END AS EsGralParos
	,1 EsMaquina
	,CASE WHEN RobotBrand IS NOT NULL THEN 2 ELSE 1 END AS TipoSe�al
--INTO 
FROM #AswCatMaquinaAux