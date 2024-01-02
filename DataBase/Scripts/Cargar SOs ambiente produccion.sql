DELETE [AswSch].[MSWAutorizaPedidoProduccionEncASWVw]
INSERT INTO [AswSch].[MSWAutorizaPedidoProduccionEncASWVw]
SELECT	 p.IdPedido
		,AG.ClaveAgente AS ClaveCSR
		,FechaPedido				= p.FechaCaptura 
		,ClaveCliente				= ClaveCliente
		,NomCliente					= NomCliente
		,ClaveConsignado			= ClaveConsignado
		,NomConsignado				= NomConsignado
		,LibrasPorSurtir
		,'Coll'						= Case when EsCollated	= 1					then 1 else 0 end
		,'Bulk'						= Case when EsBulk		= 1					then 1 else 0 end
		,'Otro'						= Case when EsTools		= 1	or EsOutsourced = 1	then 1 else 0 end
		,EmbarqueParcial
		,FechaProbableColl			= Case when EsCollated	= 1 or EsTools = 1	then FechaProbableColl else null end
		,FechaProbableBulk			= Case when EsBulk		= 1					then FechaProbableBulk else null end 
		,FechaEmbarqueProgramado	= FechaEmbarqueProgramado
		,Comentario					= ComentarioProduccion
		,AutorizadoProduccion	
		,AutorizadoVentas
		,FechaClienteDeseada		= FechaClienteDeseada
		,Dias						= datediff(dd,FechaClienteDeseada,isnull(FechaEmbarqueProgramado,FechaClienteDeseada))
		,NomLocalidad				= NomLocalidadCorto						
FROM	[MSW_LNKSVR].[MCSW_ERP].MSWSch.MSWTraPedido4Vw p (NoLock)
LEFT JOIN [MSW_LNKSVR].[MCSW_ERP].MSWSch.MSWTraPedidoAutoriza4 x (NoLock) on x.IdPedido = p.IdPedido and x.TipoAutoriza = 2
LEFT JOIN [MSW_LNKSVR].[MCSW_ERP].MSWSch.MSWCatAgenteVw Ag (NoLock) ON P.ClaAgenteCSR = AG.ClaAgente 
LEFT JOIN [MSW_LNKSVR].[MCSW_ERP].MSWSch.MSWTraViajePedido4VW ViajePed WITH(NOLOCK) ON p.Idpedido = ViajePed.IdPedido
LEFT JOIN [MSW_LNKSVR].[MCSW_ERP].MSWSch.MSWTraViaje4Vw Viaje WITH(NOLOCK) ON ViajePed.IdViaje = Viaje.IdViaje
LEFT JOIN [MSW_LNKSVR].[MCSW_ERP].MSWSch.MSWCatTransportista4 Transp WITH(NOLOCK) ON  Viaje.ClaTransportista = Transp.ClaTransportista
WHERE p.AutorizadoProduccion = 1
AND FechaClienteDeseada between GETDATE()-14 and GETDATE()+21




GO


DELETE [AswSch].[MSWAutorizaPedidoProduccionDetASWVw]
INSERT INTO [AswSch].[MSWAutorizaPedidoProduccionDetASWVw]
Select	 d.IdPedido				
		, d.ClaArticulo  				
		, d.ClaveArticulo  
		,Descripcion				= NomArticulo
		,'Coll'						= Case when EsCollated	= 1					then 1 else 0 end
		,'Bulk'						= Case when EsBulk		= 1					then 1 else 0 end
		,'Otro'						= Case when EsTools		= 1					then 1 else 0 end
		,CantidadEmbarcar			= case	when	d.CantPorSurtir = 0	then 0
											when	isnull(b.CantidadTemporal,isnull(b.CantidadParcial,d.CantPorSurtir)) < d.CantPorSurtir
																	Then isnull(b.CantidadTemporal,isnull(b.CantidadParcial,d.CantPorSurtir)) 
											else	d.CantPorSurtir 
										end
														  
		,LibrasEmbarcar					= case	when	d.CantPorSurtir = 0	then 0
											when	isnull(b.CantidadTemporal,isnull(b.CantidadParcial,d.CantPorSurtir)) < d.CantPorSurtir 
																	Then isnull(b.CantidadTemporal,isnull(b.CantidadParcial,d.CantPorSurtir)) * d.LibrasPorSurtir / d.CantPorSurtir
											else	d.LibrasPorSurtir
										end
		,PalletsEmbarcar					= case	when	d.CantPorSurtir = 0	then 0
											when	isnull(b.CantidadTemporal,isnull(b.CantidadParcial,d.CantPorSurtir)) < d.CantPorSurtir 
																	Then isnull(b.CantidadTemporal,isnull(b.CantidadParcial,d.CantPorSurtir)) * d.PalletsPorSurtir / d.CantPorSurtir
											else	d.PalletsPorSurtir
										end
											  
		,Cantidad					= d.CantPorSurtir
		,Libras						= d.LibrasPorSurtir
		,Pallets					= d.PalletsPorSurtir				
FROM	[MSW_LNKSVR].[MCSW_ERP].MSWSch.MSWTraPedidoDet4Vw d
LEFT	JOIN [MSW_LNKSVR].[MCSW_ERP].MSWSch.MSWTraPedidoAutorizaDet4 b on b.IdPedido = d.IdPedido and b.IdRenglon = d.IdRenglon and b.TipoAutoriza = 2  
WHERE	d.CantPorSurtir > 0
	AND d.IdPedido IN (select idPedido from [AswSch].[MSWAutorizaPedidoProduccionEncASWVw])


GO


