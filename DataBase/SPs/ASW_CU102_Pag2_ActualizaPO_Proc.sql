--USE [ASW]
--GO
/****** Object:  StoredProcedure [AswSch].[ASW_CU102_Pag2_ActualizaPO_Proc]    Script Date: 14/11/2022 11:46:42 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
beginEXECUTE AswSch.ASW_CU102_Pag2_ActualizaPO_Proc @xml = '<?xml version="1.0" encoding="UTF-8" standalone="yes"?><ActualizaPo><Enc><PO><ClaUbicacion>68</ClaUbicacion><IdPO>12</IdPO><Orden>4</Orden><ClaEstatus>2</ClaEstatus><UnidadesProducidas>344</UnidadesProducidas><ClaUsuarioMod>2914553</ClaUsuarioMod><NombrePcMod>302MRODRIGUEZC</NombrePcMod><FechaUltimaMod>2020-04-17T09:01:10.263</FechaUltimaMod></PO></Enc><Det><POD><ClaUbicacion>68</ClaUbicacion><IdPO>12</IdPO><IdUnidad>1</IdUnidad><EsTerminado>1</EsTerminado><EsAdicional>0</EsAdicional><FechaInicioReal/><FechaInicioAdm/><FechaFinReal/><FechaFinAdm/><IdTrazabilidad/><ClaUsuarioMod>902707</ClaUsuarioMod><NombrePcMod>mrc</NombrePcMod><FechaUltimaMod>2020-05-10</FechaUltimaMod></POD></Det></ActualizaPo>'
rollback tran
*/

/*XML
<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<ActualizaPO>
	<ENC>
		<PO>
			<ClaUbicacion>68</ClaUbicacion>
			<IdPO>12</IdPO>
			<Orden>4</Orden>
			<ClaEstatus>2</ClaEstatus>
			<UnidadesProducidas>344</UnidadesProducidas>
			<ClaUsuarioMod>2914553</ClaUsuarioMod>
			<NombrePcMod>302MRODRIGUEZC</NombrePcMod>
			<FechaUltimaMod>2020-04-17T09:01:10.263</FechaUltimaMod>
		</PO>
	</ENC>
	<DET>
		<POD>
			<ClaUbicacion>68</ClaUbicacion>
			<IdPO>12</IdPO>
			<IdUnidad>1</IdUnidad>
			<EsTerminado>1</EsTerminado>
			<EsAdicional>0</EsAdicional>
			<FechaInicioReal/>
			<FechaInicioAdm/>
			<FechaFinReal/>
			<FechaFinAdm/>
			<IdTrazabilidad/>
			<ClaUsuarioMod>902707</ClaUsuarioMod>
			<NombrePcMod>mrc</NombrePcMod>
			<FechaUltimaMod>2020-05-10</FechaUltimaMod>
		</POD>
	</DET>
</ActualizaPO>
*/
ALTER PROCEDURE [AswSch].[ASW_CU102_Pag2_ActualizaPO_Proc]
	@xml XML
AS
BEGIN

	DECLARE @handle INT  
	DECLARE @PrepareXmlStatus INT  

	DECLARE @psIdPOs VARCHAR(MAX)
		,@ptMinFechaUltimaMod DATETIME
		,@psIdPODets VARCHAR(MAX)
		,@ptMinFechaUltimaModDet DATETIME

	DECLARE @ProductionOrder TABLE(
		ClaUbicacion INT
		,IdPO INT
		,Orden INT
		,ClaEstatus INT
		,UnidadesProducidas INT
		,ClaUsuarioMod INT
		,NombrePcMod VARCHAR(64)
		,FechaUltimaMod DATETIME
	)

	DECLARE @ProductionOrderDet TABLE(
		ClaUbicacion INT
		,IdComponente VARCHAR(30)
		,IdPO INT
		,IdUnidad INT
		,EsTerminado INT
		,EsAdicional INT
		,FechaInicioReal DATETIME
		,FechaInicioAdm DATETIME
		,FechaFinReal DATETIME
		,FechaFinAdm DATETIME
		,IdTrazabilidad INT
		,ClaUsuarioMod INT
		,NombrePcMod VARCHAR(64)
		,FechaUltimaMod DATETIME
		,ClaTurno INT
	)

	EXEC @PrepareXmlStatus= sp_xml_preparedocument @handle OUTPUT, @xml  

	INSERT INTO @ProductionOrder(ClaUbicacion 
		,IdPO 
		,Orden 
		,ClaEstatus 
		,UnidadesProducidas 
		,ClaUsuarioMod 
		,NombrePcMod 
		,FechaUltimaMod
	)
	SELECT ClaUbicacion 
		,IdPO 
		,Orden 
		,ClaEstatus 
		,UnidadesProducidas 
		,ClaUsuarioMod 
		,NombrePcMod 
		,FechaUltimaMod
	FROM    OPENXML(@handle, '/ActualizaPo/Enc/PO', 2)  
		WITH (
		ClaUbicacion INT
		,IdPO INT
		,Orden INT
		,ClaEstatus INT
		,UnidadesProducidas INT
		,ClaUsuarioMod INT
		,NombrePcMod VARCHAR(64)
		,FechaUltimaMod DATETIME
		)  

	INSERT INTO @ProductionOrderDet(ClaUbicacion 
		,IdComponente
		,IdPO 
		,IdUnidad 
		,EsTerminado 
		,EsAdicional 
		,FechaInicioReal 
		,FechaInicioAdm 
		,FechaFinReal 
		,FechaFinAdm 
		,IdTrazabilidad 
		,ClaUsuarioMod 
		,NombrePcMod 
		,FechaUltimaMod
		,ClaTurno
	)
	SELECT ClaUbicacion 
		,IdComponente
		,IdPO 
		,IdUnidad 
		,EsTerminado 
		,EsAdicional 
		,FechaInicioReal 
		,FechaInicioAdm 
		,FechaFinReal 
		,FechaFinAdm 
		,IdTrazabilidad 
		,ClaUsuarioMod 
		,NombrePcMod 
		,FechaUltimaMod
		,ClaTurno
	FROM    OPENXML(@handle, '/ActualizaPo/Det/POD', 2)  
		WITH (
		ClaUbicacion INT
		,IdComponente VARCHAR(30)
		,IdPO INT
		,IdUnidad INT
		,EsTerminado INT
		,EsAdicional INT
		,FechaInicioReal DATETIME
		,FechaInicioAdm DATETIME
		,FechaFinReal DATETIME
		,FechaFinAdm DATETIME
		,IdTrazabilidad INT
		,ClaUsuarioMod INT
		,NombrePcMod VARCHAR(64)
		,FechaUltimaMod DATETIME
		,ClaTurno INT
		)  
	EXEC sp_xml_removedocument @handle 

	--SELECT * FROM @ProductionOrder
	--SELECT * FROM @ProductionOrderDet

	

	--log cuando existen datos nuevos
	IF EXISTS (SELECT 1 FROM @ProductionOrder) OR EXISTS (SELECT 1 FROM @ProductionOrderDet)
	BEGIN
		INSERT INTO [AswSch].[AswBitActualizaPO]([XmlVar])
		VALUES(@xml)

		INSERT INTO [AswSch].[ASWBitOrdenProduccion](
			[IdPO]						
			,[Orden]						
			,[UnidadesProducidas]		
			,[ClaEstatus]				
			,[ClaUsuarioMod]				
			,[NombrePcMod]				
			,[FechaUltimaMod]			
			,[IdPONuevo]					
			,[OrdenNuevo]				
			,[UnidadesProducidasNuevo]	
			,[ClaEstatusNuevo]			
			,[ClaUsuarioModNuevo]		
			,[NombrePcModNuevo]			
			,[FechaUltimaModNuevo] 
		)
		SELECT OP.IdPO
			,OP.Orden				
			,OP.ClaEstatus			
			,OP.UnidadesProducidas	
			,OP.ClaUsuarioMod		
			,OP.NombrePcMod			
			,OP.FechaUltimaMod		
			,POT.IdPO
			,POT.Orden AS OrdenNuevo
			,POT.ClaEstatus AS ClaEstatusNuevo
			,POT.UnidadesProducidas AS UnidadesProducidasNuevo
			,POT.ClaUsuarioMod AS ClaUsuarioModNuevo
			,POT.NombrePcMod AS NombrePcModNuevo
			,POT.FechaUltimaMod AS FechaUltimaModNuevo
		FROM [AswSch].[ASWTraOrdenProduccion] OP
		JOIN @ProductionOrder POT
			ON OP.ClaUbicacion = POT.ClaUbicacion
			AND OP.IdPO = POT.IdPO
		WHERE OP.ClaEstatus <> POT.ClaEstatus
	
	END

	--TODO: considerar supercelda :S
	UPDATE OP
	SET OP.Orden = POT.Orden 
		,OP.ClaEstatus = POT.ClaEstatus
		,OP.UnidadesProducidas = POT.UnidadesProducidas
		,OP.ClaUsuarioMod = POT.ClaUsuarioMod
		,OP.NombrePcMod = POT.NombrePcMod
		,OP.FechaUltimaMod = POT.FechaUltimaMod
	--SELECT *
	FROM [AswSch].[ASWTraOrdenProduccion] OP
	JOIN @ProductionOrder POT
		ON OP.ClaUbicacion = POT.ClaUbicacion
		AND OP.IdPO = POT.IdPO

	--INSERT OP Det
	INSERT INTO [AswSch].[ASWTraOrdenProduccionDet]
		([ClaUbicacion]
		,[IdPO]
		,[IdUnidad]
		,[IdComponente]
		,[EsTerminado]
		,[EsAdicional]
		,[FechaInicioReal]
		,[FechaInicioAdm]
		,[FechaFinReal]
		,[FechaFinAdm]
		,[IdTrazabilidad]
		,[BajaLogica]
		,[FechaBajaLogica]
		,[ClaUsuarioMod]
		,[NombrePcMod]
		,[FechaUltimaMod]
		,ClaTurno)
	SELECT POTD.ClaUbicacion 
		,POTD.IdPO 
		,POTD.IdUnidad 
		,POTD.IdComponente
		,POTD.EsTerminado 
		,POTD.EsAdicional 
		,POTD.FechaInicioReal 
		,POTD.FechaInicioAdm 
		,POTD.FechaFinReal 
		,POTD.FechaFinAdm 
		,POTD.IdTrazabilidad
		,0
		,NULL 
		,POTD.ClaUsuarioMod 
		,POTD.NombrePcMod 
		,POTD.FechaUltimaMod
		,POTD.ClaTurno
	FROM @ProductionOrderDet POTD
	LEFT JOIN [AswSch].[ASWTraOrdenProduccionDet] OPD
		ON POTD.ClaUbicacion = OPD.ClaUbicacion
		AND POTD.IdPO = OPD.IdPO
		AND POTD.IdUnidad = OPD.IdUnidad
	WHERE OPD.ClaUbicacion IS NULL--solo existen en tablet


	UPDATE OPD
	SET OPD.EsTerminado = POTD.EsTerminado			 
		,OPD.EsAdicional = POTD.EsAdicional 
		,OPD.FechaInicioReal = POTD.FechaInicioReal 
		,OPD.FechaInicioAdm = POTD.FechaInicioAdm 
		,OPD.FechaFinReal = POTD.FechaFinReal 
		,OPD.FechaFinAdm = POTD.FechaFinAdm 
		,OPD.IdTrazabilidad = POTD.IdTrazabilidad 
		,OPD.ClaUsuarioMod = POTD.ClaUsuarioMod 
		,OPD.NombrePcMod = POTD.NombrePcMod 
		,OPD.FechaUltimaMod = POTD.FechaUltimaMod
	--SELECT *
	FROM [AswSch].[ASWTraOrdenProduccionDet] OPD
	JOIN @ProductionOrderDet POTD
		ON OPD.ClaUbicacion = POTD.ClaUbicacion
		AND OPD.IdPO = POTD.IdPO
		AND OPD.IdUnidad = POTD.IdUnidad

	;WITH cteProductionOrder AS(
		SELECT DISTINCT ClaUbicacion
			,IdPO
		FROM  @ProductionOrderDet
	)
	,cteProductionOrderDet AS(
		SELECT PO.ClaUbicacion
			,PO.IdPO 
			--,SUM([IdUnidad]) AS UnidadesProducidas
			,MIN([FechaInicioReal]) AS FechaInicioReal
			,MIN([FechaInicioAdm]) AS FechaInicioAdm
			,MAX([FechaFinReal]) AS FechaFinReal
			,MAX([FechaFinAdm]) AS FechaFinAdm
		FROM [AswSch].[ASWTraOrdenProduccionDet] OPD
		JOIN cteProductionOrder PO
			ON OPD.ClaUbicacion = PO.ClaUbicacion
			AND OPD.IdPO = PO.IdPO
		GROUP BY PO.ClaUbicacion
			,PO.IdPO 
	)
	
	
	UPDATE OP
	SET OP.FechaInicioReal = POT.FechaInicioReal 
		,OP.FechaInicioAdm = POT.FechaInicioAdm
		,OP.FechaFinReal = POT.FechaFinReal
		,OP.FechaFinAdm = POT.FechaFinAdm
	--SELECT *
	FROM [AswSch].[ASWTraOrdenProduccion] OP
	JOIN cteProductionOrderDet POT
		ON OP.ClaUbicacion = POT.ClaUbicacion
		AND OP.IdPO = POT.IdPO


	--Genero los querys de upd para sqlite
	

	--SELECT * FROM @ProductionOrder
	--SELECT * FROM @ProductionOrderDet

	SELECT @psIdPOs = COALESCE(@psIdPOs+',','') + CAST(IdPO AS VARCHAR)
	FROM @ProductionOrder

	SELECT @ptMinFechaUltimaMod = MAX(FechaUltimaMod)
	FROM @ProductionOrder

	SELECT @psIdPODets = COALESCE(@psIdPODets+',','') + '''' + CAST(IdPO AS VARCHAR)+'_'+CAST(IdUnidad AS VARCHAR) + '''' 
	FROM @ProductionOrderDet

	SELECT @ptMinFechaUltimaModDet = MAX(FechaUltimaMod)
	FROM @ProductionOrderDet

	IF EXISTS (SELECT 1 FROM @ProductionOrder)
	BEGIN 
		SELECT 'UPDATE ASWLite_TraOrdenProduccion
			SET ClaEstatusReplica = 2
			WHERE IdPO IN ('+@psIdPOs+')
				AND STRFTIME(''%s'',FechaUltimaMod)<=STRFTIME(''%s'','''+ CONVERT(VARCHAR(23), @ptMinFechaUltimaMod, 121)+''');' AS QueryUpdPO
	END

	IF EXISTS (SELECT 1 FROM @ProductionOrderDet)
	BEGIN
		SELECT 'UPDATE ASWLite_TraOrdenProduccionDet
			SET ClaEstatusReplica = 2
			WHERE CAST(IdPO AS TEXT) || ''_'' || CAST(IdUnidad AS TEXT) IN ('+@psIdPODets+')
				AND STRFTIME(''%s'',FechaUltimaMod)<=STRFTIME(''%s'','''+ CONVERT(VARCHAR(23), @ptMinFechaUltimaModDet, 121)+''');' AS QueryUpdPODet
	END

END

