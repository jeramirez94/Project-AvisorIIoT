--USE [ASW]
--GO
/****** Object:  StoredProcedure [AswSch].[ASW_CU165_Pag1_ReplicaProduccion_Proc]    Script Date: 15/11/2022 12:10:00 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
* MRODRIGUEZC
* 2020/07/31
* envia la informacion de produccion a MCSW
* exec [AswSch].[ASW_CU165_Pag1_ReplicaProduccion_Proc]	68, 1
*/
ALTER PROCEDURE [AswSch].[ASW_CU165_Pag1_ReplicaProduccion_Proc]	
 @pnClaUbicacion INT,
 @PnDebug INT = 0  
AS
BEGIN
SET NOCOUNT ON

	DECLARE 
		@nClaMensaje SMALLINT
		,@sMensaje VARCHAR(500)

	DECLARE
		@nId INT
		,@nIdProduccion INT
		,@nIdLocal INT
		,@sIdCelda VARCHAR(30)
		,@nClaveCelda SMALLINT
		,@nClaAreaProduccion SMALLINT
		,@tFechaAdmScada DATE
		,@nClaTurno TINYINT
		,@nTiempoTurno NUMERIC(4,2)
		,@nOrdenesTurno SMALLINT
		,@tFechaHoraInicioProd DATETIME
		,@tFechaHoraFinProd DATETIME
		,@nIdComponente1 SMALLINT
		,@nTiempoParo1 NUMERIC(12,2)
		,@nIdComponente2 SMALLINT
		,@nTiempoParo2 NUMERIC(12,2)
		,@nIdComponente3 SMALLINT
		,@nTiempoParo3 NUMERIC(12,2)
		,@nIdComponente4 SMALLINT
		,@nTiempoParo4 NUMERIC(12,2)
		,@nIdComponente5 SMALLINT
		,@nTiempoParo5 NUMERIC(12,2)
		,@nIdComponente6 SMALLINT
		,@nTiempoParo6 NUMERIC(12,2)
		,@nIdComponente7 SMALLINT
		,@nTiempoParo7 NUMERIC(12,2)
		,@nIdComponente8 SMALLINT
		,@nTiempoParo8 NUMERIC(12,2)
		,@nIdComponente9 SMALLINT
		,@nTiempoParo9 NUMERIC(12,2)
		,@nIdComponente10 SMALLINT
		,@nTiempoParo10 NUMERIC(12,2)
		,@nCajasProducidas SMALLINT
		,@nCajasSkid SMALLINT
		,@nClaArticulo INT
		,@nPesoScrap NUMERIC(5,2)
		--control
		,@nClaTipoRegistro TINYINT --1 check in, 3 checkout
		,@nClaEstatusReplica TINYINT  --1 nuevo, 2 replicado
		,@sEvento VARCHAR(15)
		,@tFechaUltimaMod DATETIME
		,@sNombrePcMod VARCHAR(64)
		,@nClaUsuarioMod INT
		,@nError INT
		,@sErrorMsg VARCHAR(500)

		,@nNoComponentes TINYINT
		,@nClaMaquinaA1 SMALLINT
		,@nClaMaquinaA2 SMALLINT
		,@nClaMaquinaB1 SMALLINT
		,@nClaMaquinaB2 SMALLINT
		,@nClaMaquinaA3 SMALLINT
		,@nClaMaquinaB3 SMALLINT
		,@nClaMaquinaA4 SMALLINT
		,@nClaMaquinaB4 SMALLINT
		,@nClaMaquinaA5 SMALLINT
		,@nClaMaquinaB5	SMALLINT
		
		,@nRunHrsA1 INT
		,@nRunHrsA2 INT
		,@nRunHrsB1 INT
		,@nRunHrsB2 INT
		,@nRunHrsA3 INT
		,@nRunHrsB3 INT
		,@nRunHrsA4 INT
		,@nRunHrsB4 INT
		,@nRunHrsA5 INT
		,@nRunHrsB5	INT

	DECLARE @Produccion TABLE(
		Id INT IDENTITY
		,IdProduccion INT --idUnico avisor
		,IdLocal INT --id unico en celda
		,IdCelda SMALLINT
		,ClaveCelda SMALLINT
		,ClaAreaProduccion SMALLINT
		,FechaAdmScada DATE
		,ClaTurno TINYINT
		,TiempoTurno NUMERIC(4,2)
		,OrdenesTurno SMALLINT
		,FechaHoraInicioProd DATETIME
		,FechaHoraFinProd DATETIME
		,IdComponente1 SMALLINT
		,TiempoParo1 NUMERIC(12,2)
		,IdComponente2 SMALLINT
		,TiempoParo2 NUMERIC(12,2)
		,IdComponente3 SMALLINT
		,TiempoParo3 NUMERIC(12,2)
		,IdComponente4 SMALLINT
		,TiempoParo4 NUMERIC(12,2)
		,IdComponente5 SMALLINT
		,TiempoParo5 NUMERIC(12,2)
		,IdComponente6 SMALLINT
		,TiempoParo6 NUMERIC(12,2)
		,IdComponente7 SMALLINT
		,TiempoParo7 NUMERIC(12,2)
		,IdComponente8 SMALLINT
		,TiempoParo8 NUMERIC(12,2)
		,IdComponente9 SMALLINT
		,TiempoParo9 NUMERIC(12,2)
		,IdComponente10 SMALLINT
		,TiempoParo10 NUMERIC(12,2)
		,CajasProducidas SMALLINT
		,CajasSkid SMALLINT
		,ClaArticulo INT
		,PesoScrap NUMERIC(5,2)
		--control
		,ClaTipoRegistro TINYINT --1 check in, 3 checkout
		,ClaEstatusReplica TINYINT  --1 nuevo, 2 replicado
		,Evento VARCHAR(15)
		,FechaUltimaMod DATETIME
		,NombrePcMod VARCHAR(64)
		,ClaUsuarioMod INT
		,EsManual INT 
	)
	
	INSERT INTO @Produccion(
		IdProduccion
		,IdLocal
		,IdCelda
		,ClaveCelda
		,ClaAreaProduccion
		,FechaAdmScada 
		,ClaTurno 
		,TiempoTurno 
		,OrdenesTurno 
		,FechaHoraInicioProd 
		,FechaHoraFinProd 
		,IdComponente1 
		,TiempoParo1 
		,IdComponente2 
		,TiempoParo2 
		,IdComponente3 
		,TiempoParo3 
		,IdComponente4 
		,TiempoParo4 
		,IdComponente5 
		,TiempoParo5 
		,IdComponente6 
		,TiempoParo6 
		,IdComponente7 
		,TiempoParo7 
		,IdComponente8 
		,TiempoParo8 
		,IdComponente9 
		,TiempoParo9 
		,IdComponente10 
		,TiempoParo10 
		,CajasProducidas 
		,CajasSkid 
		,ClaArticulo 
		,PesoScrap 
		--control
		,ClaTipoRegistro  --1 check in, 3 checkout
		,ClaEstatusReplica --1 nuevo, 2 replicado
		,Evento
		,FechaUltimaMod 
		,NombrePcMod 
		,ClaUsuarioMod
		,EsManual
	)
	SELECT RP.Id
		,RP.IdLocal
		,RP.IdCelda
		,C.ClaveWorkCenter
		,C.ClaDepartamento
		,RP.FechaAdmScada 
		,RP.ClaTurno 
		,RP.TiempoTurno 
		,RP.OrdenesTurno 
		,RP.FechaHoraInicioProd 
		,RP.FechaHoraFinProd 
		,ISNULL(RP.IdComponente1,0)   
		,ISNULL(RP.TiempoParo1  ,0) 
		,ISNULL(RP.IdComponente2 ,0)  
		,ISNULL(RP.TiempoParo2 ,0)  
		,ISNULL(RP.IdComponente3 ,0)  
		,ISNULL(RP.TiempoParo3  ,0) 
		,ISNULL(RP.IdComponente4 ,0)  
		,ISNULL(RP.TiempoParo4 ,0)  
		,ISNULL(RP.IdComponente5,0)   
		,ISNULL(RP.TiempoParo5  ,0) 
		,ISNULL(RP.IdComponente6,0)   
		,ISNULL(RP.TiempoParo6  ,0) 
		,ISNULL(RP.IdComponente7,0)   
		,ISNULL(RP.TiempoParo7  ,0) 
		,ISNULL(RP.IdComponente8,0)   
		,ISNULL(RP.TiempoParo8 ,0)  
		,ISNULL(RP.IdComponente9,0)   
		,ISNULL(RP.TiempoParo9   ,0)
		,ISNULL(RP.IdComponente10 ,0)  
		,ISNULL(RP.TiempoParo10  ,0) 
		,RP.CajasProducidas 
		,RP.CajasSkid 
		,RP.ClaArticulo 
		,RP.PesoScrap 
		--control
		,RP.ClaTipoRegistro  --1 check in, 3 checkout
		,RP.ClaEstatusReplica --1 nuevo, 2 replicado
		,RP.Evento
		,RP.FechaUltimaMod 
		,RP.NombrePcMod 
		,RP.ClaUsuarioMod
		,RP.EsManual
	FROM [AswSch].[TraReporteProduccionMCSW] RP
	JOIN [AswSch].[AswCatWorkCenterVw] C
		ON RP.IdCelda = C.IdWorkCenter
	WHERE ClaEstatusReplica = 1
		AND isnull(RP.BajaLogica,0) = 0
		AND EsManual = 1 --solo manuales mientras no pasemos al modo automatico (falta tener la produccion del gantry)
		AND RP.IdCelda IN (26,28,29,30,31,33,34,35,37,38,106,110,112) --  por si las flies solo replicamos las celdas piloto
		AND ClaTurno>0
	ORDER BY IdLocal

	SELECT @nId = MIN(id)
	FROM @Produccion

	--SELECT * FROM @Produccion

	WHILE @nId IS NOT NULL
	BEGIN

		SELECT @nIdProduccion = IdProduccion
			,@nIdLocal  = IdLocal 
			,@sIdCelda  = IdCelda
			,@nClaveCelda = ClaveCelda
			,@nClaAreaProduccion = ClaAreaProduccion
			,@tFechaAdmScada  = FechaAdmScada 
			,@nClaTurno  = ClaTurno 
			,@nTiempoTurno = TiempoTurno
			,@nOrdenesTurno = OrdenesTurno 
			,@tFechaHoraInicioProd = FechaHoraInicioProd 
			,@tFechaHoraFinProd = FechaHoraFinProd 
			,@nIdComponente1 = IdComponente1 
			,@nTiempoParo1 = TiempoParo1 
			,@nIdComponente2 = IdComponente2 
			,@nTiempoParo2 = TiempoParo2 
			,@nIdComponente3 = IdComponente3 
			,@nTiempoParo3 = TiempoParo3 
			,@nIdComponente4 = IdComponente4 
			,@nTiempoParo4 = TiempoParo4 
			,@nIdComponente5 = IdComponente5 
			,@nTiempoParo5 = TiempoParo5 
			,@nIdComponente6 = IdComponente6 
			,@nTiempoParo6 = TiempoParo6 
			,@nIdComponente7 = IdComponente7 
			,@nTiempoParo7 = TiempoParo7 
			,@nIdComponente8 = IdComponente8 
			,@nTiempoParo8 = TiempoParo8 
			,@nIdComponente9 = IdComponente9 
			,@nTiempoParo9 = TiempoParo9 
			,@nIdComponente10 = IdComponente10 
			,@nTiempoParo10 = TiempoParo10 
			,@nCajasProducidas  = CASE WHEN EsManual = 1 THEN  CajasProducidas WHEN EsManual = 0 THEN CajasProducidas%CajasSkid  END
			,@nCajasSkid  = CajasSkid 
			,@nClaArticulo  = ClaArticulo 
			,@nPesoScrap  = PesoScrap 
			--control
			,@nClaTipoRegistro   = ClaTipoRegistro  --1 check in, 3 checkout
			,@nClaEstatusReplica = ClaEstatusReplica   --1 nuevo, 2 replicado
			,@sEvento = Evento
			,@tFechaUltimaMod  = FechaUltimaMod 
			,@sNombrePcMod  = NombrePcMod 
			,@nClaUsuarioMod  = ClaUsuarioMod 
		FROM @Produccion
		WHERE Id = @nId
		SET @nClaMaquinaA1 = @nIdComponente1 --HEADER
		SET @nClaMaquinaA2 = @nIdComponente2 --THREADER
		SET @nClaMaquinaA3 = @nIdComponente3 --COLLATOR
		SET @nClaMaquinaA4 = @nIdComponente4 --ROBOT

		SET @nClaMaquinaB1 = @nIdComponente5 --HEADER
		SET @nClaMaquinaB2 = @nIdComponente6 --THREADER
		SET @nClaMaquinaB3 = @nIdComponente7 --COLLATOR
		SET @nClaMaquinaB4 = @nIdComponente8 --ROBOT
  
    
		--SET @nClaMaquinaA1 = @nIdComponente1  
		--SET @nClaMaquinaA2 = @nIdComponente2  
		--SET @nClaMaquinaB1 = (SELECT ClaMaquina FROM [AswSch].[AswCatWorkUnitVw] WHERE ClaCelda = @sIdCelda AND ClaTipoMaquina = 3 AND BajaLogica = 0 AND ABCMachine = 'A')  
		--SET @nClaMaquinaB2 = (SELECT ClaMaquina FROM [AswSch].[AswCatWorkUnitVw] WHERE ClaCelda = @sIdCelda AND ClaTipoMaquina = 3 AND BajaLogica = 0 AND ABCMachine = 'B')  
  
		SELECT @nRunHrsA1 = CASE WHEN EXISTS (SELECT ClaMaquina FROM [AswSch].[AswCatWorkUnitVw] WHERE IdWorkCenter = @sIdCelda AND ClaTipoMaquina = 1 AND BajaLogica = 0 AND ABCMachine = 'A') THEN @nTiempoParo1 END --HEADER 
		SELECT @nRunHrsA2 = CASE WHEN EXISTS (SELECT ClaMaquina FROM [AswSch].[AswCatWorkUnitVw] WHERE IdWorkCenter = @sIdCelda AND ClaTipoMaquina = 2 AND BajaLogica = 0 AND ABCMachine = 'A') THEN @nTiempoParo2 END --THREADER
		SELECT @nRunHrsA3 = CASE WHEN EXISTS (SELECT ClaMaquina FROM [AswSch].[AswCatWorkUnitVw] WHERE IdWorkCenter = @sIdCelda AND ClaTipoMaquina = 3 AND BajaLogica = 0 AND ABCMachine = 'A') THEN @nTiempoParo3 END --COLLATOR
		SELECT @nRunHrsA4 = CASE WHEN EXISTS (SELECT ClaMaquina FROM [AswSch].[AswCatWorkUnitVw] WHERE IdWorkCenter = @sIdCelda AND ClaTipoMaquina = 6 AND BajaLogica = 0 AND ABCMachine = 'A') THEN @nTiempoParo4 END --ROBOT

		SELECT @nRunHrsB1 = CASE WHEN EXISTS (SELECT ClaMaquina FROM [AswSch].[AswCatWorkUnitVw] WHERE IdWorkCenter = @sIdCelda AND ClaTipoMaquina = 1 AND BajaLogica = 0 AND ABCMachine = 'B') THEN @nTiempoParo5 END --HEADER 
		SELECT @nRunHrsB2 = CASE WHEN EXISTS (SELECT ClaMaquina FROM [AswSch].[AswCatWorkUnitVw] WHERE IdWorkCenter = @sIdCelda AND ClaTipoMaquina = 2 AND BajaLogica = 0 AND ABCMachine = 'B') THEN @nTiempoParo6 END --THREADER
		SELECT @nRunHrsB3 = CASE WHEN EXISTS (SELECT ClaMaquina FROM [AswSch].[AswCatWorkUnitVw] WHERE IdWorkCenter = @sIdCelda AND ClaTipoMaquina = 3 AND BajaLogica = 0 AND ABCMachine = 'B') THEN @nTiempoParo7 END --COLLATOR
		SELECT @nRunHrsB4 = CASE WHEN EXISTS (SELECT ClaMaquina FROM [AswSch].[AswCatWorkUnitVw] WHERE IdWorkCenter = @sIdCelda AND ClaTipoMaquina = 6 AND BajaLogica = 0 AND ABCMachine = 'B') THEN @nTiempoParo8 END --ROBOT
    
		
		
		IF @nClaTipoRegistro = 1 --check in
		BEGIN

    IF(@PnDebug = 1)
	 BEGIN
		DECLARE @sMsgDebug varchar(1000) ;
		 SELECT @sMsgDebug =  'EXEC [MSW_LNKSVR].[MCSW_ERP].[MSWSch].[MSW_GenerarCheckIn_Proc]  '
		+'\n @pnClaveCelda =' +  CAST(@nClaveCelda as varchar)
		+'\n,@pnIdNumDepto   ='+ ISNULL(CAST(@nClaAreaProduccion  AS VARCHAR),'null')      
		+'\n,@pnTurno        ='+ ISNULL(CAST(@nClaTurno           AS VARCHAR),'null')  
		+'\n,@pnClaMaquinaA1 ='+ ISNULL(CAST(@nClaMaquinaA1       AS VARCHAR),'null')  
		+'\n,@pnClaMaquinaA2 ='+ ISNULL(CAST(@nClaMaquinaA2       AS VARCHAR),'null')  
		+'\n,@pnClaMaquinaB1 ='+ ISNULL(CAST(@nClaMaquinaB1       AS VARCHAR),'null')  
		+'\n,@pnClaMaquinaB2 ='+ ISNULL(CAST(@nClaMaquinaB2       AS VARCHAR),'null')  
		+'\n,@pnClaMaquinaA3 ='+ ISNULL(CAST(@nClaMaquinaA3       AS VARCHAR),'null')  
		+'\n,@pnClaMaquinaB3 ='+ ISNULL(CAST(@nClaMaquinaB3       AS VARCHAR),'null')  
		+'\n,@pnClaMaquinaA4 ='+ ISNULL(CAST(@nClaMaquinaA4       AS VARCHAR),'null')  
		+'\n,@pnClaMaquinaB4 ='+ ISNULL(CAST(@nClaMaquinaB4       AS VARCHAR),'null')  
		+'\n,@pnClaMaquinaA5 ='+ ISNULL(CAST(@nClaMaquinaA5       AS VARCHAR),'null')  
		+'\n,@pnClaMaquinaB5 ='+ ISNULL(CAST(@nClaMaquinaB5       AS VARCHAR),'null')  
		+'\n,@pnnpMaqA1Med   ='+ ISNULL(CAST(@nRunHrsA1 AS VARCHAR),'null')  --checkin 0, checkout/changeover=cell run hrs/#components tipo (header,collator)  
		+'\n,@pnnpMaqA2Med   ='+ ISNULL(CAST(@nRunHrsA2    AS VARCHAR),'null') 
		+'\n,@pnnpMaqB1Med   ='+ ISNULL(CAST(@nRunHrsB1    AS VARCHAR),'null') 
		+'\n,@pnnpMaqB2Med   ='+ ISNULL(CAST(@nRunHrsB2    AS VARCHAR),'null') 
		+'\n,@pnnpMaqA3Med   ='+ ISNULL(CAST(@nRunHrsA3    AS VARCHAR),'null') 
		+'\n,@pnnpMaqB3Med   ='+ ISNULL(CAST(@nRunHrsB3    AS VARCHAR),'null') 
		+'\n,@pnnpMaqA4Med   ='+ ISNULL(CAST(@nRunHrsA4    AS VARCHAR),'null') 
		+'\n,@pnnpMaqB4Med   ='+ ISNULL(CAST(@nRunHrsB4    AS VARCHAR),'null') 
		+'\n,@pnnpMaqA5Med   ='+ ISNULL(CAST(@nRunHrsA5    AS VARCHAR),'null') 
		+'\n,@pnnpMaqB5Med   ='+ ISNULL(CAST(@nRunHrsB5    AS VARCHAR),'null') 
		+'\n,@pnnpCantInicio ='+   ISNULL(CAST(@nCajasProducidas AS VARCHAR),'null')  --checkin 0, checkout=cajas totales%Cant.CajasSkid --las cajas skid se cuentan del inventario por eso se quitan de este reporte  
		+'\n,@pnClaArticuloAnt ='+ ISNULL(CAST(@nClaArticulo AS VARCHAR),'null')   --checkin/checkout = artIdPo, changeover = ArtIpPo anterior  
		+'\n,@pnClaArticulo ='  +  ISNULL(CAST(@nClaArticulo AS VARCHAR),'null')    --checkin/checkout = artIdPo, changeover = ArtIpPo nuevo        
		+'\n,@pnClaUsuarioMod =' + ISNULL(CAST(@nClaUsuarioMod AS VARCHAR),'null')    
		+'\n,@psNombrePCMod = ' +  ISNULL(CAST(@sNombrePcMod   AS VARCHAR) ,'null')  
		+'\n,@pdCheckInDate = ' +  ISNULL(''''+CAST(@tFechaAdmScada AS VARCHAR)+'''','null')  
		
		select @sMsgDebug = REPLACE(@sMsgDebug, '\n', CHAR(10));
		print @sMsgDebug
	 END
			BEGIN TRAN
			BEGIN TRY
			SET @nError = NULL
			SET @sErrorMsg = NULL

			

				EXEC [MSW_LNKSVR].[MCSW_ERP].[MSWSch].[MSW_GenerarCheckIn_Proc]  
					@pnClaveCelda = @nClaveCelda          
					,@pnIdNumDepto = @nClaAreaProduccion						
					,@pnTurno = @nClaTurno 										
					,@pnClaMaquinaA1 = @nClaMaquinaA1							
					,@pnClaMaquinaA2 = @nClaMaquinaA2							
					,@pnClaMaquinaB1 = @nClaMaquinaB1							
					,@pnClaMaquinaB2 = @nClaMaquinaB2							
					,@pnClaMaquinaA3 = @nClaMaquinaA3							
					,@pnClaMaquinaB3 = @nClaMaquinaB3							
					,@pnClaMaquinaA4 = @nClaMaquinaA4							
					,@pnClaMaquinaB4 = @nClaMaquinaB4							
					,@pnClaMaquinaA5 = @nClaMaquinaA5							
					,@pnClaMaquinaB5 = @nClaMaquinaB5							
					,@pnnpMaqA1Med = @nRunHrsA1		--checkin 0, checkout/changeover=cell run hrs/#components tipo (header,collator)
					,@pnnpMaqA2Med = @nRunHrsA2			
					,@pnnpMaqB1Med = @nRunHrsB1			
					,@pnnpMaqB2Med = @nRunHrsB2			
					,@pnnpMaqA3Med = @nRunHrsA3			
					,@pnnpMaqB3Med = @nRunHrsB3			
					,@pnnpMaqA4Med = @nRunHrsA4			
					,@pnnpMaqB4Med = @nRunHrsB4			
					,@pnnpMaqA5Med = @nRunHrsA5			
					,@pnnpMaqB5Med = @nRunHrsB5			
					,@pnnpCantInicio = @nCajasProducidas	--checkin 0, checkout=cajas totales%Cant.CajasSkid --las cajas skid se cuentan del inventario por eso se quitan de este reporte
					,@pnClaArticuloAnt = @nClaArticulo		--checkin/checkout = artIdPo, changeover = ArtIpPo anterior
					,@pnClaArticulo = @nClaArticulo			--checkin/checkout = artIdPo, changeover = ArtIpPo nuevo
	 												
					,@pnClaUsuarioMod = @nClaUsuarioMod		
					,@psNombrePCMod = @sNombrePcMod			
					,@pdCheckInDate = @tFechaAdmScada			--fecha adm
					,@pnStatusError = @nError OUTPUT 
				    ,@psMsgError = @sErrorMsg OUTPUT   


				IF @nError = 0
				BEGIN
				UPDATE [AswSch].[TraReporteProduccionMCSW] 
				SET ClaEstatusReplica = 2
				     	,Error = @nError
					    ,ErrorMsg = @sErrorMsg
					WHERE Id = @nIdProduccion
				END
				ELSE
				BEGIN
					UPDATE [AswSch].[TraReporteProduccionMCSW] 
					SET Error = @nError
					,ErrorMsg = @sErrorMsg
				WHERE Id = @nIdProduccion

				END


			COMMIT
			
			END TRY
			BEGIN CATCH

				SELECT @nClaMensaje = ERROR_NUMBER() 
					,@sMensaje = ERROR_MESSAGE() + COALESCE(' ERP:' + CAST(@nError AS varchar)+ @sErrorMsg, '')
					
				--cachar error y registrarlo
				print 'there was an unexpected error!'
				print @sMensaje
				print @sErrorMsg


				ROLLBACK 

			
				UPDATE [AswSch].[TraReporteProduccionMCSW] 
				SET ClaEstatusReplica = 1
					,ClaMensaje = @nClaMensaje
					,Mensaje = @sMensaje
				WHERE Id = @nIdProduccion

			END CATCH

		END

		IF @nClaTipoRegistro = 3 --check out
		BEGIN
			
			BEGIN TRAN
			BEGIN TRY
			SET @nError = NULL
			SET @sErrorMsg = NULL

				EXEC [MSW_LNKSVR].[MCSW_ERP].[MSWSch].[MSW_GenerarCheckOut_Proc] 
					@pnClaveCelda = @nClaveCelda          
					,@pnIdNumDepto = @nClaAreaProduccion						
					,@pnTurno = @nClaTurno 										
					,@pnClaMaquinaA1 = @nClaMaquinaA1							
					,@pnClaMaquinaA2 = @nClaMaquinaA2							
					,@pnClaMaquinaB1 = @nClaMaquinaB1							
					,@pnClaMaquinaB2 = @nClaMaquinaB2							
					,@pnClaMaquinaA3 = @nClaMaquinaA3							
					,@pnClaMaquinaB3 = @nClaMaquinaB3							
					,@pnClaMaquinaA4 = @nClaMaquinaA4							
					,@pnClaMaquinaB4 = @nClaMaquinaB4							
					,@pnClaMaquinaA5 = @nClaMaquinaA5							
					,@pnClaMaquinaB5 = @nClaMaquinaB5							
					,@pnnpMaqA1Med = @nRunHrsA1		--checkin 0, checkout/changeover=cell run hrs/#components tipo (header,collator)
					,@pnnpMaqA2Med = @nRunHrsA2			
					,@pnnpMaqB1Med = @nRunHrsB1			
					,@pnnpMaqB2Med = @nRunHrsB2			
					,@pnnpMaqA3Med = @nRunHrsA3			
					,@pnnpMaqB3Med = @nRunHrsB3			
					,@pnnpMaqA4Med = @nRunHrsA4			
					,@pnnpMaqB4Med = @nRunHrsB4			
					,@pnnpMaqA5Med = @nRunHrsA5			
					,@pnnpMaqB5Med = @nRunHrsB5			
					,@pnnpCantFin = @nCajasProducidas	--checkin 0, checkout=cajas totales%Cant.CajasSkid --las cajas skid se cuentan del inventario por eso se quitan de este reporte
					,@pnnpScrap = @nPesoScrap
					,@psmlcommentsClose = 'AVISOR S&W'
					,@pnClaArticuloAnt = @nClaArticulo		--checkin/checkout = artIdPo, changeover = ArtIpPo anterior
					,@pnClaArticulo = @nClaArticulo			--checkin/checkout = artIdPo, changeover = ArtIpPo nuevo
	 												
					,@pnClaUsuarioMod = @nClaUsuarioMod		
					,@psNombrePCMod = @sNombrePcMod			
					,@pnStatusError = @nError OUTPUT 
				    ,@psMsgError = @sErrorMsg OUTPUT  
					--,@pdCheckInDate = @tFechaAdmScada			--fecha adm

				IF @nError = 0
				BEGIN
				UPDATE [AswSch].[TraReporteProduccionMCSW] 
				SET ClaEstatusReplica = 2
					,Error = @nError
					,ErrorMsg = @sErrorMsg
					WHERE Id = @nIdProduccion
				END
				ELSE
				BEGIN
					UPDATE [AswSch].[TraReporteProduccionMCSW] 
					SET Error = @nError
					,ErrorMsg = @sErrorMsg
				WHERE Id = @nIdProduccion
				END
			
			COMMIT
			
			END TRY
			BEGIN CATCH

				SELECT @nClaMensaje = ERROR_NUMBER() 
					,@sMensaje = ERROR_MESSAGE() + COALESCE(' ERP:' + CAST(@nError AS varchar)+ @sErrorMsg, '')
					
				--cachar error y registrarlo
				print 'there was an unexpected error!'
				print @sMensaje
				print @sErrorMsg

				ROLLBACK 

				
				UPDATE [AswSch].[TraReporteProduccionMCSW] 
				SET ClaEstatusReplica = 1
					,ClaMensaje = @nClaMensaje
					,Mensaje = @sMensaje
				WHERE Id = @nIdProduccion
				
			END CATCH
		END

		SELECT @nId = MIN(id)
		FROM @Produccion
		WHERE Id>@nId
	END
END



