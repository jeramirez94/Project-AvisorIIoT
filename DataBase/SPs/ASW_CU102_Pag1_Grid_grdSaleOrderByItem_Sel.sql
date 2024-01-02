USE [ASW]
GO
/****** Object:  StoredProcedure [AswSch].[ASW_CU102_Pag1_Grid_grdSaleOrderByItem_Sel]    Script Date: 14/11/2022 01:26:20 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--EXEC ASWSch.ASW_CU102_Pag1_Grid_grdSaleOrderByItem_Sel 68, '2020-03-08',1,1,1
ALTER PROCEDURE [AswSch].[ASW_CU102_Pag1_Grid_grdSaleOrderByItem_Sel]
	@pnClaUbicacion INT
	,@ptShowUntil DATETIME
	,@pnisCollated INT
	,@pnisBulk INT
	,@pnisOther INT

AS
BEGIN

/*
Status:
1 Programmed
2 In Process
3 Paused
4 Finished
*/
	DECLARE
		@sSelColumnas VARCHAR(1500)
		,@sColumnas VARCHAR(1500) 
		,@sQuery VARCHAR(5000)

	IF @ptShowUntil>GETDATE()+30
	BEGIN
		RAISERROR('You can not search more than 30 days ahead.', 16, 1)
		RETURN
	END

	SELECT	D.ClaArticulo  
		,D.ClaveArticulo AS ItemCode
		,Descripcion AS ItemDescription
		,COUNT(E.IdPedido) AS TotSaleOrders
		--,0 AS TotProdOrders
		,D.Coll AS isColl
		,D.[Bulk] AS isBlk
		,D.Otro AS isOth
		,SUM(D.CantidadEmbarcar) AS OpenQty
		,E.FechaClienteDeseada AS FechaDeseada
	INTO #TotOrders
	FROM [AswSch].[MSWAutorizaPedidoProduccionEncASWVw] E with (nolock)
	JOIN [AswSch].[MSWAutorizaPedidoProduccionDetASWVw] D with (nolock)
		ON E.IdPedido = D.IdPedido
	WHERE E.FechaClienteDeseada <= @ptShowUntil
		AND LibrasPorSurtir > 0
		AND NomLocalidad IN (SELECT Value FROM [ASWSch].[ASWSplitKeyFn]((SELECT SValor2 FROM [AswSch].[ASWCfgConfiguracion] WHERE ClaUbicacion = 68 AND ClaConfiguracion = 2),','))
		AND (@pnisCollated = 1 AND D.Coll=1 OR @pnisBulk = 1 AND D.[Bulk]=1 OR @pnisOther = 1 AND D.Otro=1)
	GROUP BY D.ClaArticulo, D.ClaveArticulo, Descripcion, D.Coll, D.[Bulk], D.Otro, E.FechaClienteDeseada

	SELECT ClaArticulo
		,COUNT(IdPO) AS NoOrders
	INTO #ProductionOrder
	FROM [AswSch].[ASWTraOrdenProduccion]
	WHERE ClaUbicacion=@pnClaUbicacion
		AND ClaEstatus IN (1,2,3)
		AND UnidadesProgramadas-COALESCE(UnidadesProducidas,0)>0
		AND BajaLogica = 0
	GROUP BY ClaArticulo


	SELECT ClaArticulo 
		,ItemCode
		,ItemDescription
		,SUM(TotSaleOrders) AS TotSaleOrders
		,0 AS TotProdOrders
		,isColl
		,isBlk
		,isOth
		,SUM(OpenQty) AS OpenQty
	INTO #GroupOrders
	FROM #TotOrders 
	--WHERE ClaArticulo='611645'
	GROUP BY ClaArticulo, ItemCode,ItemDescription,isColl,isBlk,isOth

	UPDATE SO
	SET SO.TotProdOrders = PO.NoOrders
	FROM #GroupOrders SO
	JOIN #ProductionOrder PO
		ON SO.ClaArticulo = PO.ClaArticulo

	--SELECT * FROM #ProductionOrder
	--SELECT * FROM #GroupOrders

	;WITH cteCalendario AS (
		SELECT GETDATE() AS Fecha
		UNION ALL
		SELECT Fecha+1
		FROM cteCalendario
		WHERE Fecha<@ptShowUntil
	)
		
	SELECT Fecha 
	INTO #Calendario 
	FROM cteCalendario

	SELECT @sSelColumnas = COALESCE (@sSelColumnas+',','')+ 'SUM(['+CONVERT(VARCHAR(10), Fecha, 110)+']) AS ['+CONVERT(VARCHAR(10), Fecha, 110)+';w=60;d=0]'
	FROM #Calendario

	PRINT @sSelColumnas

	SELECT @sColumnas = COALESCE (@sColumnas+',','')+ '['+CONVERT(VARCHAR(10), Fecha, 110)+']'
	FROM #Calendario

	PRINT @sColumnas

	SET @sQuery='
		SELECT SO.ClaArticulo 
			,ItemCode
			,ItemDescription
			,TotSaleOrders
			,TotProdOrders
			,isColl
			,isBlk
			,isOth
			,SUM(OpenQty) AS OpenQty 
			--,COALESCE(SUM([Before Today]),0) 
			--+COALESCE(SUM([2020-02-25]),0) 
			--+COALESCE(SUM([2020-02-26]),0) 
			--+COALESCE(SUM([2020-02-27]),0) 
			--+COALESCE(SUM([2020-02-28]),0) 
			--+COALESCE(SUM([2020-03-02]),0) 
			--+COALESCE(SUM([2020-03-03]),0) 
			--+COALESCE(SUM([2020-03-04]),0) 
			--+COALESCE(SUM([2020-03-05]),0) 
			--+COALESCE(SUM([2020-03-06]),0) AS TotalQty --para validar cantidad

			,SUM([Before Today]) AS [Before Today;w=60;d=0]
			,'+@sSelColumnas+'
		FROM #GroupOrders SO
		JOIN
			(SELECT ClaArticulo
				,OpenQty
				,CASE WHEN FechaDeseada < GETDATE()-1 THEN ''Before Today'' ELSE CONVERT(VARCHAR(10),FechaDeseada,110) END AS FechaDeseada
			FROM #TotOrders ) AS SRC
			PIVOT
			(
				SUM(OpenQty)
				FOR FechaDeseada IN ([Before Today],
				'+@sColumnas+')
			) AS PVT
		ON SO.ClaArticulo=PVT.ClaArticulo
		--WHERE SO.ClaArticulo=''611645''
		GROUP BY SO.ClaArticulo 
			,ItemCode
			,ItemDescription
			,TotSaleOrders
			,TotProdOrders
			,isColl
			,isBlk
			,isOth
		'
	EXEC (@sQuery)

END
