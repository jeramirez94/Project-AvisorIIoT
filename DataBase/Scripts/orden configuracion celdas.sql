
;WITH CteVision AS (
    SELECT 6 AS ClaTipoMaquina 
        ,1 AS TipoSeñal
        ,'VISION_1' AS NomSeñal
    UNION    
    SELECT 6 AS ClaTipoMaquina 
        ,2 AS TipoSeñal
        ,'VISION_2' AS NomSeñal
    UNION    
    SELECT 6 AS ClaTipoMaquina 
        ,3 AS TipoSeñal
        ,'BOXCOUNTER' AS NomSeñal
    UNION    
    SELECT 6 AS ClaTipoMaquina 
        ,0 AS TipoSeñal
        ,'ROBOT' AS NomSeñal
)

SELECT ROW_NUMBER() OVER (ORDER BY T.ClaTipoMaquina, M.ClaveMAquina) AS Posicion,
	Descripcion, ClaveMaquina, CASE M.ClaTipoMaquina
        WHEN 1 THEN 'HEADER'
        WHEN 2 THEN 'THREADER'
        WHEN 3 THEN 'COLLATOR'
        WHEN 4 THEN 'CLEANER'
        WHEN 6 THEN V.NomSeñal
        END AS NomTipoMaquina, NomMaquina
FROM [MSW_LNKSVR].[MCSW_ERP].[MSWSch].[MSWCatMaquinaASWVw] M
JOIN [MSW_LNKSVR].[MCSW_ERP].[MSWSch].[MSWCatTipoMaquinaVw] T
	ON M.ClaTipoMaquina = T.ClaTipoMaquina
JOIN [MSW_LNKSVR].[MCSW_ERP].[MSWSch].[MSWCatCeldasASWVw] C
	ON M.ClaCelda=C.IdCelda 
LEFT JOIN  CteVision V
    ON M.ClaTipoMaquina = V.ClaTipoMaquina
WHERE ClaAreaProduccion =  2
	AND M.BajaLogica = 0
	AND ClaveCelda = 17
ORDER BY T.ClaTipoMaquina, M.ClaveMAquina

8
9
10
11
12
13
14
15
16
17
18
19
68
71
73

--WITH CteVision AS (
--    SELECT 6 AS ClaTipoMaquina 
--        ,1 AS TipoSeñal
--        ,'VISION_1' AS NomSeñal
--    UNION    
--    SELECT 6 AS ClaTipoMaquina 
--        ,2 AS TipoSeñal
--        ,'VISION_2' AS NomSeñal
--    UNION    
--    SELECT 6 AS ClaTipoMaquina 
--        ,0 AS TipoSeñal
--        ,'ROBOT' AS NomSeñal
--)

--SELECT ClaMaquina AS IdComponente
--    ,ClaveMaquina
--    ,M.ClaTipoMaquina
--    ,CASE M.ClaTipoMaquina
--        WHEN 1 THEN 'HEADER'
--        WHEN 2 THEN 'THREADER'
--        WHEN 3 THEN 'COLLATOR'
--        WHEN 4 THEN 'CLEANER'
--        WHEN 6 THEN V.NomSeñal
--        END AS NomTipoMaquina
--    ,PullyArms
--	,PulleyRevs
--	,NailsPerRev
--FROM ASWLite_CatMaquina M
--LEFT JOIN CteVision V
--    ON M.ClaTipoMaquina = V.ClaTipoMaquina
--WHERE BajaLogica = 0
--ORDER BY M.ClaTipoMaquina, ClaveMaquina, V.TipoSeñal;