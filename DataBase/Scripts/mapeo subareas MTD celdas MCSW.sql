INSERT INTO [AswSch].[AswRelMtoSubAreaCeldaTmp]
SELECT SA.[ClaUbicacion]
      ,SA.[ClaDepartamento]
      ,SA.[ClaArea]
      ,SA.[ClaSubArea]
     -- ,SA.[ClaveSubArea]
	  ,NomDepartamento
	  ,NomArea
      ,[NomSubArea]
	  ,NULL
FROM [MTO_LNKSRV].Operacion.[MtoSch].[MtoCatSubArea] SA
JOIN [MTO_LNKSRV].Operacion.[MtoSch].[MtoCatArea] A
	ON SA.ClaUbicacion = A.ClaUbicacion
	AND SA.ClaDepartamento = A.ClaDepartamento
	AND SA.ClaArea = A.ClaArea
JOIN [MTO_LNKSRV].Operacion.[MtoSch].[MtoCatDepartamento] D
	ON A.ClaUbicacion = D.ClaUbicacion
	AND A.ClaDepartamento = D.ClaDepartamento
ORDER BY NomDepartamento
	  ,NomArea
	  ,[NomSubArea]



SELECT        TOP (200) ClaUbicacion, ClaDepartamento, ClaArea, ClaSubArea, NomDepartamento, NomArea, NomSubArea, IdCelda
FROM            AswSch.AswRelMtoSubAreaCeldaTmp
WHERE        (ClaDepartamento = 2) AND (ClaArea in (2))

SELECT * 
FROM [AswSch].[AswCatCeldas]
where claAreaproduccion = 2 and clatipocelda=3


UPDATE RC
SET RC.IdCelda = C.IdCelda
FROM  AswSch.AswRelMtoSubAreaCeldaTmp RC
JOIN [AswSch].[AswCatCeldas] C
	ON NomSubArea= ClaveCelda+''''
	OR NomSubArea= ClaveCelda+'A'
	OR NomSubArea= ClaveCelda+'B'
	OR NomSubArea= ClaveCelda+'C'
WHERE         (RC.ClaDepartamento = 2) AND (RC.ClaArea in (2)) 
AND  C.claAreaproduccion = 2 and C.clatipocelda = 3
----------------------------------------------------------------
SELECT        TOP (200) ClaUbicacion, ClaDepartamento, ClaArea, ClaSubArea, NomDepartamento, NomArea, NomSubArea, IdCelda
FROM            AswSch.AswRelMtoSubAreaCeldaTmp
WHERE        (ClaDepartamento = 1) AND (ClaArea in (3))

SELECT * 
FROM [AswSch].[AswCatCeldas]
where claAreaproduccion = 1 and clatipocelda=1


UPDATE RC
SET RC.IdCelda = C.IdCelda
FROM  AswSch.AswRelMtoSubAreaCeldaTmp RC
JOIN [AswSch].[AswCatCeldas] C
	ON NomSubArea= ClaveCelda+'.'
WHERE         (RC.ClaDepartamento = 1) AND (RC.ClaArea in (3))
AND  C.claAreaproduccion = 1 and C.clatipocelda = 1

----------------------------------------------------------------------------------
SELECT RC.*, C.ClaveCelda, C.Descripcion
FROM  AswSch.AswRelMtoSubAreaCeldaTmp RC
JOIN [AswSch].[AswCatCeldas] C
	ON RC.IdCelda = C.IdCelda

	
	SELECT * FROM  AswSch.AswRelMtoSubAreaCeldaTmp
	SELECT * FROM  AswSch.AswRelMtoSubAreaCelda

	INSERT INTO AswSch.AswRelMtoSubAreaCelda
	SELECT [ClaUbicacion]
      ,[ClaDepartamento]
      ,[ClaArea]
      ,[ClaSubArea]
      ,[IdCelda]
	  ,0
	  ,NULL
	  ,GETDATE()
	  ,'carga inicial'
	  ,0
  FROM [AswSch].[AswRelMtoSubAreaCeldaTmp]
  WHERE IdCelda IS NOT NULL



