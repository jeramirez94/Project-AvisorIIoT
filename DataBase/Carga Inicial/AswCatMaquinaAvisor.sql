USE [ASW]
GO

;with CteSe�ales AS(
	SELECT 'VISION_STRIP' AS NomSe�al
		,1 AS Orden
	UNION ALL
	SELECT 'VISION_REJECTED' AS NomSe�al		
		,2 AS Orden
	UNION ALL
	SELECT 'BOXCOUNTER' AS NomSe�al		
		,3 AS Orden
)
INSERT INTO [AswSch].[AswCatMaquinaAvisor]
           ([NomSe�al]
           ,[ClaCelda]
           ,[Orden]
           ,[BajaLogica]
           ,[FechaBajaLogica]
           ,[FechaUltimaMod]
           ,[ClaUsuarioMod]
           ,[NombrePcMod])
SELECT [NomSe�al]
           ,[IdCelda]
           ,[Orden]
           ,0 [BajaLogica]
           ,NULL [FechaBajaLogica]
           ,GETDATE() [FechaUltimaMod]
           ,0 [ClaUsuarioMod]
           ,'carga inicial'[NombrePcMod]
FROM AswSch.AswCatCeldas C
JOIN CteSe�ales S
	ON 1=1
WHERE ClaAreaProduccion=2
	AND ClaveCelda in (8,9,10,11,12,13,14,15,16,17,18,19,68,71,73)

GO;

SELECT  * FROM [AswSch].[AswCatMaquinaAvisor]
SELECT  * FROM [AswSch].[AswCatMaquinaAux]

INSERT INTO [AswSch].[AswCatMaquinaAux]
([ClaOrigen],EsGralProduccion,EsMaquina,TipoSe�al,ClaMaquinaReporta) 
SELECT  ClaSe�al
	,CASE NomSe�al WHEN 'BOXCOUNTER' THEN 1 END AS EsGralProduccion
	,0 EsMaquina
	,1 TipoSe�al
	,(SELECT ClaMaquina FROM [AswSch].[AswCatMaquina] M WHERE M.BajaLogica=0 AND M.ClaTipoMaquina=6 AND M.ClaCelda=MA.ClaCelda)	AS ClaMaquinaReporta
FROM [AswSch].[AswCatMaquinaAvisor] MA

GO

INSERT INTO [AswSch].[AswCatMaquinaAux] (ClaOrigen, EsMaquina, TipoSe�al)
SELECT ClaMaquina,1,1 FROM [AswSch].[AswCatMaquina]
WHERE ClaCelda IN (26,27,28,29,30,31,33,34,35,37,38,39,106,110,112)
AND  ClaTipoMaquina IN (2,3,4,5)
AND BajaLogica=0