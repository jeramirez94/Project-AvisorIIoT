--USE [MCSW_Integra]
--GO

--SELECT [IdComposicion]
--      ,[ArtComposicion1]
--      ,[ClaveArtComposicion]
--      ,[NomArtComposicion]
--      ,[NomArtComposicionIngles]
--      ,[CantComposicion]
--      ,[Nivel]
--      ,[UnidadMedida]
--      ,[UnidadMedidaIngles]
--      ,[EsParaVenta]
--  FROM [MSWSch].[MSWArticuloComposicionASWVw]
--GO

SET NOCOUNT ON

DECLARE 
	@nId int
	,@sNomTabla varchar(50)
	,@sColumnas varchar(2000)
	,@sScript varchar(2000)

DECLARE
	@tVistas TABLE (
		id  int IDENTITY
		,nomVista VARCHAR(50)
	)

INSERT INTO @tVistas
SELECT 'MSWArticuloComposicionASWVw'  
UNION ALL
SELECT 'MSWCatArticuloCaracteristicasASWVw'
UNION ALL
SELECT 'MSWCatArticuloConfiguracionASWVw'
UNION ALL
SELECT 'MSWCatArticuloGeneralASWVw'
UNION ALL
SELECT 'MSWCatCeldasASWVw'
UNION ALL
SELECT 'MSWCatTipoCeldaASWVw'
UNION ALL
SELECT 'MSWCatTurnoASWVw'


SELECT @nId = MIN(id)
FROM @tVistas

WHILE @nId IS NOT NULL
BEGIN
	SELECT @sNomTabla = nomVista
	FROM @tVistas 
	WHERE id=@nId

	
	SET @sColumnas = NULL 

	SELECT @sColumnas = COALESCE ( @sColumnas + ',', '') + 
		COLUMN_NAME
		+ ' '+DATA_TYPE
		+ CASE 
			WHEN DATA_TYPE like '%char%' THEN '('+CAST(CHARACTER_MAXIMUM_LENGTH AS VARCHAR)+')' 
			WHEN DATA_TYPE = 'NUMERIC' THEN '('+CAST(NUMERIC_PRECISION AS VARCHAR)+','+CAST(NUMERIC_SCALE AS VARCHAR)+')' 
			ELSE '' END + char(13)
	FROM INFORMATION_SCHEMA.COLUMNS
	WHERE 
		 TABLE_NAME = @sNomTabla
	order by ORDINAL_POSITION

	select @sScript = 'CREATE TABLE AswSch.AswCat'+REPLACE(REPLACE(REPLACE(@sNomTabla,'MSWCat',''),'MSW',''),'ASWVw','') +'('+char(13)+ @sColumnas + ')'+char(13)+'GO'+char(13)
	print @sScript

	SELECT @nId = MIN(id)
	FROM @tVistas
	WHERE id>@nId
END