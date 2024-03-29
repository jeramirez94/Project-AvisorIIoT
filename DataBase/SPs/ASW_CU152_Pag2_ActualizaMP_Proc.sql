USE [ASW]
GO
/****** Object:  StoredProcedure [AswSch].[ASW_CU152_Pag2_ActualizaMP_Proc]    Script Date: 14/11/2022 11:55:06 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
begin tran

EXECUTE AswSch.ASW_CU152_Pag2_ActualizaMP_Proc @xml = '<?xml version="1.0" encoding="UTF-8" standalone="yes"?><ActualizaMP><Barcode><IdBarcode>1</IdBarcode><IdPO>2</IdPO><IdCelda>4</IdCelda><Barcode>113577TIIWQ</Barcode><Codigo>113577TIIWQ</Codigo><Referencia>1749719</Referencia><NomAlambre>W129LC06 .129 LC 1012 WIRE </NomAlambre><NomProvedor/><Colada>-</Colada><PesoInicial>4985</PesoInicial><PesoFinal/><Peso/><EsEnUso>1</EsEnUso><EsConsumido>1</EsConsumido><EsRemovido>0</EsRemovido><ClaEventoAdd>2</ClaEventoAdd><ClaEventoUse>2</ClaEventoUse><ClaEventoConsume>1</ClaEventoConsume><ClaEventoRemove/><ClaEstatusReplica>1</ClaEstatusReplica><ClaEstatusMCSW/><NomEstatusMCSW/><BajaLogica/><FechaBajaLogica/><FechaUltimaMod>2020-07-02 09:12:16</FechaUltimaMod><NombrePcMod>302MRODRIGUEZC</NombrePcMod><ClaUsuarioMod>7599</ClaUsuarioMod></Barcode></ActualizaMP>'
select * from  [AswSch].[AswTraMateriaPrima]

rollback tran
*/

/*XML
<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<ActualizaMP>
		<Barcode>
			<IdBarcode>3</IdBarcode>
			<IdPO>2</IdPO>
			<Barcode>113577TIIWQ</Barcode>
			<Codigo>113577TIIWQ</Codigo>
			<Referencia>1749719</Referencia>
			<NomAlambre>W129LC06 .129 LC 1012 WIRE </NomAlambre>
			<NomProvedor/>
			<PesoInicial>4985</PesoInicial>
			<PesoFinal/>
			<Peso/>
			<EsEnUso>1</EsEnUso>
			<EsConsumido>0</EsConsumido>
			<EsRemovido>0</EsRemovido>
			<ClaEventoAdd>2</ClaEventoAdd>
			<ClaEventoUse>2</ClaEventoUse>
			<ClaEventoConsume>1</ClaEventoConsume>
			<ClaEventoRemove/>
			<ClaEstatusReplica>2</ClaEstatusReplica>
			<ClaEstatusMCSW/>
			<NomEstatusMCSW/>
			<BajaLogica/>
			<FechaBajaLogica/>
			<FechaUltimaMod>2020-07-01 06:47:44</FechaUltimaMod>
			<NombrePcMod>302MRODRIGUEZC</NombrePcMod>
			<ClaUsuarioMod>7599</ClaUsuarioMod>
		</Barcode>
</ActualizaMP>
*/
ALTER PROCEDURE [AswSch].[ASW_CU152_Pag2_ActualizaMP_Proc]
	@xml XML
AS
BEGIN

	DECLARE @handle INT  
	DECLARE @PrepareXmlStatus INT	

	DECLARE 
		@ErrorMessage  NVARCHAR(4000)
		,@ErrorSeverity INT
		,@ErrorState    INT	

	DECLARE @psCodigo VARCHAR(50)	
		,@pnReferencia INT
		,@psNomAlambre VARCHAR(100)	
		,@psNomProvedor VARCHAR(100)	
		,@psPesoInicial VARCHAR(100)	
		,@psColada VARCHAR(15)

	DECLARE @tConsultaAlambron TABLE(
		Orden INT	
		,Codigo VARCHAR(50)	
		,Referencia INT
		,NomAlambre VARCHAR(100)	
		,NomProvedor VARCHAR(100)	
		,PesoInicial VARCHAR(100)	
		,Colada VARCHAR(15)
	)

	DECLARE @tResultado TABLE(
		IdBarcode INT,
		IdPO INT,
		Codigo VARCHAR(50),
		Referencia VARCHAR(30),
		NomAlambre VARCHAR(270),
		NomProvedor VARCHAR(100),
		PesoInicial NUMERIC(22, 4),
		PesoFinal NUMERIC(22, 4),
		ClaEventoAdd INT,--control para interfaz con MCSW (1 capturado ASW, 2 Capturado MCSW)
		ClaEventoUse INT,--control para interfaz con MCSW (1 capturado ASW, 2 Capturado MCSW)
		ClaEventoConsume INT,--control para interfaz con MCSW (1 capturado ASW, 2 Capturado MCSW)
		ClaEventoRemove INT,--control para interfaz con MCSW (1 capturado ASW, 2 Capturado MCSW)
		ClaEstatusReplica INT,--control para interfaz con MCSW (1 cambio, 2 replicado)
		ClaEstatusMCSW INT,--errores y mensajes de MCSW
		NomEstatusMCSW VARCHAR(500)--errores y mensajes de MCSW
	)
	
	DECLARE @nId INT, 	
		@nIdBarcode INT,
		@nIdPO INT,
		@nIdCelda INT,
		@sBarcode VARCHAR(50),
		@sCodigo VARCHAR(50),
		@sReferencia VARCHAR(30),
		@sNomAlambre VARCHAR(270),
		@sNomProvedor VARCHAR(100),
		@sColada VARCHAR(50),
		@nPesoInicial NUMERIC(22, 4),
		@nPesoFinal NUMERIC(22, 4),
		@nPeso NUMERIC(22, 4),
		@nEsEnUso INT,
		@nEsConsumido INT,
		@nEsRemovido INT,
		@nClaEventoAdd INT,--control para interfaz con MCSW (1 capturado ASW, 2 Capturado MCSW)
		@nClaEventoUse INT,--control para interfaz con MCSW (1 capturado ASW, 2 Capturado MCSW)
		@nClaEventoConsume INT,--control para interfaz con MCSW (1 capturado ASW, 2 Capturado MCSW)
		@nClaEventoRemove INT,--control para interfaz con MCSW (1 capturado ASW, 2 Capturado MCSW)
		@nClaEstatusReplica INT,--control para interfaz con MCSW (1 cambio, 2 replicado)
		@nClaEstatusMCSW INT,--errores y mensajes de MCSW
		@sNomEstatusMCSW VARCHAR(500),--errores y mensajes de MCSW
		@nBajaLogica INT,
		@tFechaBajaLogica DATETIME,
		@tFechaUltimaMod DATETIME,
		@sNombrePcMod VARCHAR(64),
		@nClaUsuarioMod INT 

	DECLARE @MateriaPrima TABLE(
		Id INT IDENTITY,
		IdBarcode INT,
		IdPO INT,
		IdCelda INT,
		Barcode VARCHAR(50),
		Codigo VARCHAR(50),
		Referencia VARCHAR(30),
		NomAlambre VARCHAR(270),
		NomProvedor VARCHAR(100),
		Colada VARCHAR(50),
		PesoInicial NUMERIC(22, 4),
		PesoFinal NUMERIC(22, 4),
		Peso NUMERIC(22, 4),
		EsEnUso INT,
		EsConsumido INT,
		EsRemovido INT,
		ClaEventoAdd INT,--control para interfaz con MCSW (1 capturado ASW, 2 Capturado MCSW)
		ClaEventoUse INT,--control para interfaz con MCSW (1 capturado ASW, 2 Capturado MCSW)
		ClaEventoConsume INT,--control para interfaz con MCSW (1 capturado ASW, 2 Capturado MCSW)
		ClaEventoRemove INT,--control para interfaz con MCSW (1 capturado ASW, 2 Capturado MCSW)
		ClaEstatusReplica INT,--control para interfaz con MCSW (1 cambio, 2 replicado)
		ClaEstatusMCSW INT,--errores y mensajes de MCSW
		NomEstatusMCSW VARCHAR(500),--errores y mensajes de MCSW
		BajaLogica INT,
		FechaBajaLogica DATETIME,
		FechaUltimaMod DATETIME,
		NombrePcMod VARCHAR(64),
		ClaUsuarioMod INT
	)

	EXEC @PrepareXmlStatus= sp_xml_preparedocument @handle OUTPUT, @xml  

	INSERT INTO @MateriaPrima(IdBarcode
		,IdPO
		,IdCelda
		,Barcode
		,Codigo
		,Referencia
		,NomAlambre
		,NomProvedor
		,Colada
		,PesoInicial
		,PesoFinal
		,Peso
		,EsEnUso
		,EsConsumido
		,EsRemovido
		,ClaEventoAdd--control para interfaz con MCSW (1 capturado ASW, 2 Capturado MCSW)
		,ClaEventoUse--control para interfaz con MCSW (1 capturado ASW, 2 Capturado MCSW)
		,ClaEventoConsume--control para interfaz con MCSW (1 capturado ASW, 2 Capturado MCSW)
		,ClaEventoRemove--control para interfaz con MCSW (1 capturado ASW, 2 Capturado MCSW)
		,ClaEstatusReplica--control para interfaz con MCSW (1 cambio, 2 replicado)
		,ClaEstatusMCSW--errores y mensajes de MCSW
		,NomEstatusMCSW--errores y mensajes de MCSW
		,BajaLogica
		,FechaBajaLogica
		,FechaUltimaMod
		,NombrePcMod
		,ClaUsuarioMod
	)
	SELECT IdBarcode
		,IdPO
		,IdCelda
		,Barcode
		,Codigo
		,Referencia
		,NomAlambre
		,NomProvedor
		,Colada
		,PesoInicial
		,NULLIF(PesoFinal, '')
		,NULLIF(Peso, '')
		,NULLIF(EsEnUso, '')
		,NULLIF(EsConsumido, '')
		,NULLIF(EsRemovido, '')
		,NULLIF(ClaEventoAdd, '')--control para interfaz con MCSW (1 capturado ASW, 2 Capturado MCSW)
		,NULLIF(ClaEventoUse, '')--control para interfaz con MCSW (1 capturado ASW, 2 Capturado MCSW)
		,NULLIF(ClaEventoConsume, '')--control para interfaz con MCSW (1 capturado ASW, 2 Capturado MCSW)
		,NULLIF(ClaEventoRemove, '')--control para interfaz con MCSW (1 capturado ASW, 2 Capturado MCSW)
		,NULLIF(ClaEstatusReplica, '')--control para interfaz con MCSW (1 cambio, 2 replicado)
		,NULLIF(ClaEstatusMCSW, '')--errores y mensajes de MCSW
		,NomEstatusMCSW--errores y mensajes de MCSW
		,BajaLogica
		,FechaBajaLogica
		,FechaUltimaMod
		,NombrePcMod+'_rep' AS NombrePcMod
		,ClaUsuarioMod
	FROM    OPENXML(@handle, '/ActualizaMP/Barcode', 2)  
		WITH (
		IdBarcode INT,
		IdPO INT,
		IdCelda INT,
		Barcode VARCHAR(50),
		Codigo VARCHAR(50),
		Referencia VARCHAR(30),
		NomAlambre VARCHAR(270),
		NomProvedor VARCHAR(100),
		Colada VARCHAR(50),
		PesoInicial VARCHAR(10),
		PesoFinal VARCHAR(10),
		Peso VARCHAR(10),
		EsEnUso VARCHAR(10),
		EsConsumido VARCHAR(10),
		EsRemovido VARCHAR(10),
		ClaEventoAdd VARCHAR(10),--control para interfaz con MCSW (1 capturado ASW, 2 Capturado MCSW)
		ClaEventoUse VARCHAR(10),--control para interfaz con MCSW (1 capturado ASW, 2 Capturado MCSW)
		ClaEventoConsume VARCHAR(10),--control para interfaz con MCSW (1 capturado ASW, 2 Capturado MCSW)
		ClaEventoRemove VARCHAR(10),--control para interfaz con MCSW (1 capturado ASW, 2 Capturado MCSW)
		ClaEstatusReplica VARCHAR(10),--control para interfaz con MCSW (1 cambio, 2 replicado)
		ClaEstatusMCSW VARCHAR(10),--errores y mensajes de MCSW
		NomEstatusMCSW VARCHAR(500),--errores y mensajes de MCSW
		BajaLogica INT,
		FechaBajaLogica DATETIME,
		FechaUltimaMod DATETIME,
		NombrePcMod VARCHAR(64),
		ClaUsuarioMod INT
		)  

	EXEC sp_xml_removedocument @handle 

	--inicializo la tabla de respuestas
	--la bd local solo actualizara los campos no nulos
	INSERT INTO @tResultado (IdBarcode,IdPO,ClaEstatusReplica)
	SELECT IdBarcode
		,IdPO
		,2 --replicado
	FROM @MateriaPrima

	
	SELECT @nId = MIN (Id)
	FROM @MateriaPrima
	
	WHILE @nId IS NOT NULL
	BEGIN
		SELECT 
			@nIdBarcode	= IdBarcode 
			,@nIdPO = IdPO 
			,@nIdCelda = IdCelda
			,@sBarcode = Barcode 
			,@sCodigo = Codigo 
			,@sReferencia = Referencia 
			,@sNomAlambre = NomAlambre 
			,@sNomProvedor = NomProvedor 
			,@sColada = Colada
			,@nPesoInicial = PesoInicial 
			,@nPesoFinal = PesoFinal
			,@nPeso = Peso
			,@nEsEnUso = EsEnUso 
			,@nEsConsumido = EsConsumido 
			,@nEsRemovido = EsRemovido 
			,@nClaEventoAdd = ClaEventoAdd 
			,@nClaEventoUse = ClaEventoUse 
			,@nClaEventoConsume	= ClaEventoConsume
			,@nClaEventoRemove = ClaEventoRemove
			,@nClaEstatusReplica = ClaEstatusReplica
			,@nClaEstatusMCSW = ClaEstatusMCSW
			,@sNomEstatusMCSW = NomEstatusMCSW
			,@nBajaLogica = BajaLogica
			,@tFechaBajaLogica = FechaBajaLogica
			,@tFechaUltimaMod = FechaUltimaMod 
			,@sNombrePcMod = NombrePcMod 
			,@nClaUsuarioMod = ClaUsuarioMod
		FROM @MateriaPrima
		WHERE Id = @nId

		--Inserto el registro en la tabla con la informacion original
		EXEC [AswSch].[ASW_CU152_Pag2_TraMateriaPrima_IU]
			@nIdBarcode
			,@nIdPO 
			,@nIdCelda
			,@sBarcode 
			,@sCodigo 
			,@sReferencia
			,@sNomAlambre 
			,@sNomProvedor
			,@sColada
			,@nPesoInicial
			,@nPesoFinal 
			,@nPeso
			,@nEsEnUso
			,@nEsConsumido 
			,@nEsRemovido
			,@nClaEventoAdd
			,@nClaEventoUse 
			,@nClaEventoConsume	
			,@nClaEventoRemove
			,2--@nClaEstatusReplica - replicado
			,@nClaEstatusMCSW 
			,@sNomEstatusMCSW
			,@nBajaLogica
			,@tFechaBajaLogica
			,@tFechaUltimaMod
			,@sNombrePcMod
			,@nClaUsuarioMod 

		IF @nClaEventoAdd = 1
		BEGIN
			BEGIN TRY
				--limpio tabla respuesta
				DELETE @tConsultaAlambron
			
				INSERT INTO @tConsultaAlambron
				EXEC  [AswSch].[ASW_CU152_Pag3_AgregarMateriaPrima_Proc]
					@pnIdCelda = @nIdCelda
					,@pnTurnoActual = 1
					,@psBarcode = @sBarcode
					,@psNombrePcMod = @sNombrePcMod
					,@pnClausuarioMod = @nClaUsuarioMod

				SELECT @psCodigo = Codigo 
					,@pnReferencia =  Referencia 
					,@psNomAlambre = NomAlambre 
					,@psNomProvedor = NomProvedor 
					,@psPesoInicial = PesoInicial
				FROM @tConsultaAlambron

				--si no hay error
				SET @nClaEventoAdd = 2

				--sql server
				UPDATE [AswSch].[AswTraMateriaPrima]
				SET Codigo = @psCodigo 
					,Referencia =  @pnReferencia 
					,NomAlambre = @psNomAlambre 
					,NomProvedor = @psNomProvedor 
					,PesoInicial = @psPesoInicial
					,PesoFinal = @psPesoInicial - COALESCE(@nPeso, 0)
					,ClaEventoAdd = @nClaEventoAdd --replicado
					,ClaEstatusMCSW = 0
					,NomEstatusMCSW = ''
				WHERE IdPO = @nIdPO 
					AND IdBarcode = @nIdBarcode
				
				--datos a replicar
				UPDATE @MateriaPrima
				SET Codigo = @psCodigo 
					,Referencia =  @pnReferencia 
					,NomAlambre = @psNomAlambre 
					,NomProvedor = @psNomProvedor 
					,PesoInicial = @psPesoInicial
					,PesoFinal = @psPesoInicial - COALESCE(@nPeso, 0)
				WHERE Id = @nId

				--resultado replica
				UPDATE @tResultado
				SET Codigo = @psCodigo 
					,Referencia =  @pnReferencia 
					,NomAlambre = @psNomAlambre 
					,NomProvedor = @psNomProvedor 
					,PesoInicial = @psPesoInicial
					,PesoFinal = @psPesoInicial - COALESCE(@nPeso, 0)
					,ClaEventoAdd = @nClaEventoAdd --replicado
					,ClaEstatusMCSW = 0
					,NomEstatusMCSW = ''
				WHERE IdPO = @nIdPO 
					AND IdBarcode = @nIdBarcode

			END TRY
			BEGIN CATCH	
				SELECT 
					@ErrorMessage = ERROR_MESSAGE(), 
					@ErrorSeverity = ERROR_SEVERITY(), 
					@ErrorState = ERROR_STATE();

				UPDATE [AswSch].[AswTraMateriaPrima]
				SET ClaEventoAdd = @nClaEventoAdd --no replicado
					,ClaEstatusMCSW = 1 -- error
					,NomEstatusMCSW = 'Add: '+@ErrorMessage
				WHERE IdPO = @nIdPO 
					AND IdBarcode = @nIdBarcode

				UPDATE @tResultado
				SET ClaEventoAdd = @nClaEventoAdd --no replicado
					,ClaEstatusMCSW = 1 -- error
					,NomEstatusMCSW = 'Add: '+@ErrorMessage
				WHERE IdPO = @nIdPO 
					AND IdBarcode = @nIdBarcode
			END CATCH

		END

		IF @nClaEventoAdd = 2 AND @nClaEventoUse = 1
		BEGIN
			SELECT @sReferencia = Referencia 
			FROM @MateriaPrima
			WHERE Id = @nId

			BEGIN TRY
				EXEC  [AswSch].[ASW_CU152_Pag4_UsarMateriaPrima_Proc]
					@pnIdCelda = @nIdCelda
					,@pnIdReferencia = @sReferencia
					,@pnResultado = 0
					,@psNombrePcMod = @sNombrePcMod
					,@pnClausuarioMod = @nClaUsuarioMod

				--si no hay error
				SET @nClaEventoUse = 2

				UPDATE [AswSch].[AswTraMateriaPrima]
				SET ClaEventoUse = @nClaEventoUse --replicado
					,ClaEstatusMCSW = 0
					,NomEstatusMCSW = ''
				WHERE IdPO = @nIdPO 
					AND IdBarcode = @nIdBarcode

				UPDATE @tResultado
				SET ClaEventoUse = @nClaEventoUse --replicado
					,ClaEstatusMCSW = 0
					,NomEstatusMCSW = ''
				WHERE IdPO = @nIdPO 
					AND IdBarcode = @nIdBarcode
			END TRY
			BEGIN CATCH
				SELECT 
					@ErrorMessage = ERROR_MESSAGE(), 
					@ErrorSeverity = ERROR_SEVERITY(), 
					@ErrorState = ERROR_STATE();

				UPDATE [AswSch].[AswTraMateriaPrima]
				SET ClaEventoUse = @nClaEventoUse --no replicado
					,ClaEstatusMCSW = 1 -- error
					,NomEstatusMCSW = 'Use: '+@ErrorMessage
				WHERE IdPO = @nIdPO 
					AND IdBarcode = @nIdBarcode

				UPDATE @tResultado
				SET ClaEventoUse = @nClaEventoUse --no replicado
					,ClaEstatusMCSW = 1 -- error
					,NomEstatusMCSW = 'Use: '+@ErrorMessage
				WHERE IdPO = @nIdPO 
					AND IdBarcode = @nIdBarcode
			END CATCH
		END

		IF @nClaEventoAdd = 2 AND @nClaEventoUse = 2 AND @nClaEventoConsume = 1
		BEGIN
			BEGIN TRY
				EXEC  [AswSch].[ASW_CU152_Pag6_ConsumirMateriaPrima_Proc]
					@pnIdCelda = @nIdCelda
					,@pnTurnoActual = 1
					,@psBarcode = @sBarcode
					,@pnResultado = 0
					,@psNombrePcMod = @sNombrePcMod
					,@pnClausuarioMod = @nClaUsuarioMod

				--si no hay error
				SET @nClaEventoConsume = 2

				UPDATE [AswSch].[AswTraMateriaPrima]
				SET ClaEventoConsume = @nClaEventoConsume --replicado
					,ClaEstatusMCSW = 0
					,NomEstatusMCSW = ''
				WHERE IdPO = @nIdPO 
					AND IdBarcode = @nIdBarcode

				UPDATE @tResultado
				SET ClaEventoConsume = @nClaEventoConsume --replicado
					,ClaEstatusMCSW = 0
					,NomEstatusMCSW = ''
				WHERE IdPO = @nIdPO 
					AND IdBarcode = @nIdBarcode
			END TRY
			BEGIN CATCH
				SELECT 
					@ErrorMessage = ERROR_MESSAGE(), 
					@ErrorSeverity = ERROR_SEVERITY(), 
					@ErrorState = ERROR_STATE();

				UPDATE [AswSch].[AswTraMateriaPrima]
				SET ClaEventoConsume = @nClaEventoConsume --no replicado
					,ClaEstatusMCSW = 1 -- error
					,NomEstatusMCSW = 'Consume: '+@ErrorMessage
				WHERE IdPO = @nIdPO 
					AND IdBarcode = @nIdBarcode

				UPDATE @tResultado
				SET ClaEventoConsume = @nClaEventoConsume --no replicado
					,ClaEstatusMCSW = 1 -- error
					,NomEstatusMCSW = 'Consume: '+@ErrorMessage
				WHERE IdPO = @nIdPO 
					AND IdBarcode = @nIdBarcode
			END CATCH
		END
		
		IF @nClaEventoAdd = 2 AND @nClaEventoUse = 2 AND @nClaEventoRemove = 1
		BEGIN
			BEGIN TRY
				EXEC  [AswSch].[ASW_CU152_Pag5_RemoverMateriaPrima_Proc]
					@pnIdCelda = @nIdCelda
					,@pnTurnoActual = 1
					,@psBarcode = @sBarcode
					,@pnResultado = 0
					,@psNombrePcMod = @sNombrePcMod
					,@pnClausuarioMod = @nClaUsuarioMod

				--si no hay error
				SET @nClaEventoRemove = 2

				UPDATE [AswSch].[AswTraMateriaPrima]
				SET ClaEventoRemove = @nClaEventoRemove --replicado
					,ClaEstatusMCSW = 0
					,NomEstatusMCSW = ''
				WHERE IdPO = @nIdPO 
					AND IdBarcode = @nIdBarcode

				UPDATE @tResultado
				SET ClaEventoRemove = @nClaEventoRemove --replicado
					,ClaEstatusMCSW = 0
					,NomEstatusMCSW = ''
				WHERE IdPO = @nIdPO 
					AND IdBarcode = @nIdBarcode
			END TRY
			BEGIN CATCH
				SELECT 
					@ErrorMessage = ERROR_MESSAGE(), 
					@ErrorSeverity = ERROR_SEVERITY(), 
					@ErrorState = ERROR_STATE();

				UPDATE [AswSch].[AswTraMateriaPrima]
				SET ClaEventoRemove = @nClaEventoRemove --no replicado
					,ClaEstatusMCSW = 1 -- error
					,NomEstatusMCSW = 'Remove: '+@ErrorMessage
				WHERE IdPO = @nIdPO 
					AND IdBarcode = @nIdBarcode

				UPDATE @tResultado
				SET ClaEventoRemove = @nClaEventoRemove --no replicado
					,ClaEstatusMCSW = 1 -- error
					,NomEstatusMCSW = 'Remove: '+@ErrorMessage
				WHERE IdPO = @nIdPO 
					AND IdBarcode = @nIdBarcode
			END CATCH
		END		

		----------------------------------------------------------
		SELECT @nId = MIN (Id)
		FROM @MateriaPrima
		WHERE Id>@nId
	END

	select * from @tResultado

	/*
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
		,[FechaUltimaMod])
	SELECT POTD.ClaUbicacion 
		,POTD.IdPO 
		,POTD.IdUnidad 
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
	*/

END

