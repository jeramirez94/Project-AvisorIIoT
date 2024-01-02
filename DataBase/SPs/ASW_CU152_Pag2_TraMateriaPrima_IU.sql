USE [ASW]
GO
/****** Object:  StoredProcedure [AswSch].[ASW_CU152_Pag2_TraMateriaPrima_IU]    Script Date: 14/11/2022 11:57:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
* MRODRIGUEZC
* 2020/07/01
* guarda la informacion de MP
*/
ALTER PROCEDURE [AswSch].[ASW_CU152_Pag2_TraMateriaPrima_IU]	
		@pnIdBarcode INT,
		@pnIdPO INT,
		@pnIdCelda INT,
		@psBarcode VARCHAR(50),
		@psCodigo VARCHAR(50),
		@psReferencia VARCHAR(30),
		@psNomAlambre VARCHAR(270),
		@psNomProvedor VARCHAR(100),
		@psColada VARCHAR(50),
		@pnPesoInicial NUMERIC(22, 4),
		@pnPesoFinal NUMERIC(22, 4),
		@pnPeso NUMERIC(22, 4),
		@pnEsEnUso INT,
		@pnEsConsumido INT,
		@pnEsRemovido INT,
		@pnClaEventoAdd INT,--control para interfaz con MCSW (1 capturado ASW, 2 Capturado MCSW)
		@pnClaEventoUse INT,--control para interfaz con MCSW (1 capturado ASW, 2 Capturado MCSW)
		@pnClaEventoConsume INT,--control para interfaz con MCSW (1 capturado ASW, 2 Capturado MCSW)
		@pnClaEventoRemove INT,--control para interfaz con MCSW (1 capturado ASW, 2 Capturado MCSW)
		@pnClaEstatusReplica INT,--control para interfaz con MCSW (1 cambio, 2 replicado)
		@pnClaEstatusMCSW INT,--errores y mensajes de MCSW
		@psNomEstatusMCSW VARCHAR(500),--errores y mensajes de MCSW
		@pnBajaLogica INT,
		@ptFechaBajaLogica DATETIME,
		@ptFechaUltimaMod DATETIME,
		@psNombrePcMod VARCHAR(64),
		@pnClaUsuarioMod INT 
AS
BEGIN
	IF EXISTS (SELECT 1 FROM [AswSch].[AswTraMateriaPrima] WHERE IdPO = @pnIdPO AND IdBarcode = @pnIdBarcode)
	BEGIN
		UPDATE [AswSch].[AswTraMateriaPrima]
		SET IdCelda = @pnIdCelda
			,Barcode = @psBarcode 
			,Codigo = @psCodigo 
			,Referencia = @psReferencia
			,NomAlambre = @psNomAlambre 
			,NomProvedor = @psNomProvedor
			,Colada = @psColada
			,PesoInicial = @pnPesoInicial
			,PesoFinal = @pnPesoFinal 
			,Peso = @pnPeso
			,EsEnUso = @pnEsEnUso
			,EsConsumido = @pnEsConsumido 
			,EsRemovido = @pnEsRemovido
			,ClaEventoAdd = @pnClaEventoAdd
			,ClaEventoUse = @pnClaEventoUse 
			,ClaEventoConsume = @pnClaEventoConsume	
			,ClaEventoRemove = @pnClaEventoRemove
			,ClaEstatusReplica = @pnClaEstatusReplica
			,ClaEstatusMCSW = @pnClaEstatusMCSW 
			,NomEstatusMCSW = @psNomEstatusMCSW
			,BajaLogica = @pnBajaLogica
			,FechaBajaLogica = @ptFechaBajaLogica
			,FechaUltimaMod = @ptFechaUltimaMod
			,NombrePcMod = @psNombrePcMod
			,ClaUsuarioMod = @pnClaUsuarioMod 
		WHERE IdPO = @pnIdPO 
			AND IdBarcode = @pnIdBarcode
	END
	ELSE
	BEGIN
		INSERT INTO [AswSch].[AswTraMateriaPrima]
           ([IdBarcode]
           ,[IdPO]
		   ,[IdCelda]
           ,[Barcode]
           ,[Codigo]
           ,[Referencia]
           ,[NomAlambre]
           ,[NomProvedor]
		   ,[Colada]
           ,[PesoInicial]
           ,[PesoFinal]
           ,[Peso]
           ,[EsEnUso]
           ,[EsConsumido]
           ,[EsRemovido]
           ,[ClaEventoAdd]
           ,[ClaEventoUse]
           ,[ClaEventoConsume]
           ,[ClaEventoRemove]
           ,[ClaEstatusReplica]
           ,[ClaEstatusMCSW]
           ,[NomEstatusMCSW]
           ,[BajaLogica]
           ,[FechaBajaLogica]
           ,[FechaUltimaMod]
           ,[NombrePcMod]
           ,[ClaUsuarioMod])
		VALUES
           (@pnIdBarcode
			,@pnIdPO 
			,@pnIdCelda
			,@psBarcode 
			,@psCodigo 
			,@psReferencia
			,@psNomAlambre 
			,@psNomProvedor
			,@psColada
			,@pnPesoInicial
			,@pnPesoFinal 
			,@pnPeso
			,@pnEsEnUso
			,@pnEsConsumido 
			,@pnEsRemovido
			,@pnClaEventoAdd
			,@pnClaEventoUse 
			,@pnClaEventoConsume	
			,@pnClaEventoRemove
			,@pnClaEstatusReplica
			,@pnClaEstatusMCSW 
			,@psNomEstatusMCSW
			,@pnBajaLogica
			,@ptFechaBajaLogica
			,@ptFechaUltimaMod
			,@psNombrePcMod
			,@pnClaUsuarioMod )
	END
END