USE [ASW]
GO

;with CteSeñales AS(
	SELECT 'VISION_STRIP' AS NomSeñal
		,1 AS Orden
	UNION ALL
	SELECT 'VISION_REJECTED' AS NomSeñal		
		,2 AS Orden
	UNION ALL
	SELECT 'BOXCOUNTER' AS NomSeñal		
		,3 AS Orden
)
INSERT INTO [AswSch].[AswCatMaquinaAvisor]
           ([NomSeñal]
           ,[ClaCelda]
           ,[Orden]
           ,[BajaLogica]
           ,[FechaBajaLogica]
           ,[FechaUltimaMod]
           ,[ClaUsuarioMod]
           ,[NombrePcMod])
SELECT [NomSeñal]
           ,[IdCelda]
           ,[Orden]
           ,0 [BajaLogica]
           ,NULL [FechaBajaLogica]
           ,GETDATE() [FechaUltimaMod]
           ,0 [ClaUsuarioMod]
           ,'carga inicial'[NombrePcMod]
FROM AswSch.AswCatCeldas C
JOIN CteSeñales S
	ON 1=1
WHERE ClaAreaProduccion=2
	AND ClaveCelda in (8,9,10,11,12,13,14,15,16,17,18,19,68,71,73)

GO;

SELECT  * FROM [AswSch].[AswCatMaquinaAvisor]
SELECT  * FROM [AswSch].[AswCatMaquinaAux]

INSERT INTO [AswSch].[AswCatMaquinaAux]
([ClaOrigen],EsGralProduccion,EsMaquina,TipoSeñal,ClaMaquinaReporta) 
SELECT  ClaSeñal
	,CASE NomSeñal WHEN 'BOXCOUNTER' THEN 1 END AS EsGralProduccion
	,0 EsMaquina
	,1 TipoSeñal
	,(SELECT ClaMaquina FROM [AswSch].[AswCatMaquina] M WHERE M.BajaLogica=0 AND M.ClaTipoMaquina=6 AND M.ClaCelda=MA.ClaCelda)	AS ClaMaquinaReporta
FROM [AswSch].[AswCatMaquinaAvisor] MA

GO

INSERT INTO [AswSch].[AswCatMaquinaAux] (ClaOrigen, EsMaquina, TipoSeñal)
SELECT ClaMaquina,1,1 FROM [AswSch].[AswCatMaquina]
WHERE ClaCelda IN (26,27,28,29,30,31,33,34,35,37,38,39,106,110,112)
AND  ClaTipoMaquina IN (2,3,4,5)
AND BajaLogica=0