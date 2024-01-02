--USE [ASW]
--GO
/****** Object:  StoredProcedure [AswSch].[ASW_CU102_Pag1_AgregarOrdenProduccionPPL_Proc]    Script Date: 14/11/2022 01:05:23 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
begin tran
EXEC ASWSch.ASW_CU102_Pag1_AgregarOrdenProduccionPPL_Proc	
	@pnClaUbicacion =68
	,@pnClavePO INT--
	,@pnWO INT--
	,@pnClaArticulo =606122
	,@pnClaDepartamentoOrden =2
	,@psIdCeldaOrden =1
	,@pnScheduledBoxes =200
	,@ptFechaProgramada DATETIME--
	,@ptFechaCaptura DATETIME--
	--,@psProductionNotes ='note'
	,@pnClaUsuarioMod =0
	,@psNombrePcMod ='mrc'
rollback tran
*/
ALTER PROCEDURE [AswSch].[ASW_CU102_Pag1_AgregarOrdenProduccionPPL_Proc]
	@pnClaUbicacion INT
	,@pnClavePO INT
	,@pnWO INT
	,@pnClaArticulo INT
	,@pnClaDepartamentoOrden INT
	,@psIdCeldaOrden VARCHAR(30)
	,@pnScheduledBoxes INT
	,@pnOrden INT
	,@ptFechaProgramada DATETIME
	,@ptFechaCaptura DATETIME
	--,@psProductionNotes VARCHAR(140)
	,@pnClaUsuarioMod INT
	,@psNombrePcMod VARCHAR(64)
AS
BEGIN
	DECLARE
		 @nIdPO int
		,@nClaAreaProduccion int
		,@nClaveArticulo VARCHAR(20)
		,@nClaGpoCosteo int
		,@nClaGrupoProceso int
		,@nClaUnidadProd int
		,@nUnidadesPorSkid numeric(14,6)
		,@sDiametro varchar(250)
		,@sDiametroMin varchar(250)
		,@sDiametroMax varchar(250)
		,@sLongitud varchar(250)
		,@sLongitudMin varchar(250)
		,@sLongitudMax varchar(250)
		,@sLength varchar(250)
		,@sDiameter varchar(250)
		,@sPoint varchar(250)
		,@sShank varchar(250)
		,@nClaEstatus int
		,@sNotasProduccion varchar(100)
		,@tFechaIns datetime
		,@tFechaUltimaMod datetime

	SELECT @nIdPO = COALESCE( MAX(IdPO), 0 ) + 1
	FROM [AswSch].[ASWTraOrdenProduccion]
	WHERE ClaUbicacion = @pnClaUbicacion

	SELECT @nClaAreaProduccion = ClaDepartamento
	FROM [AswSch].[AswCatWorkCenterVw]
	WHERE IdWorkCenter=@psIdCeldaOrden

	SELECT @nClaveArticulo = [ClaveArticulo]
		,@nUnidadesPorSkid = CajasSkid
		,@sDiametro = EspesorAltura
		,@sDiametroMin = EspesorAltura
		,@sDiametroMax = EspesorAltura
		,@sLongitud = Longitud
		,@sLongitudMin = Longitud
		,@sLongitudMax = Longitud
	FROM [AswSch].[AswCatArticuloGeneral] 
	WHERE ClaArticulo = @pnClaArticulo

	SELECT @nClaUnidadProd = ClaUnidadProd
		,@nClaGpoCosteo = ClaGpoCosteo
		,@nClaGrupoProceso = ClaGpoProcesoProd
	FROM [AswSch].[AswArtCatArticuloVw] 
	WHERE ClaArticulo = @pnClaArticulo
		AND ClaTipoInventario = 1

	SELECT @sLength = NomValorCaract
	FROM [AswSch].[AswCatArticuloCaracteristicas] 
	WHERE ClaArticulo = @pnClaArticulo
	AND ClaCaracteristica = 1405

	SELECT @sDiameter = NomValorCaract
	FROM [AswSch].[AswCatArticuloCaracteristicas]
	WHERE ClaArticulo = @pnClaArticulo
	AND ClaCaracteristica = 1407

	SELECT @sPoint = NomValorCaract
	FROM [AswSch].[AswCatArticuloCaracteristicas] 
	WHERE ClaArticulo = @pnClaArticulo
	AND ClaCaracteristica = 1408

	SELECT @sShank = NomValorCaract
	FROM [AswSch].[AswCatArticuloCaracteristicas] 
	WHERE ClaArticulo = @pnClaArticulo
	AND ClaCaracteristica = 1409

	SET @nClaEstatus = 1--Programada
	SET @tFechaIns = GETDATE()
	SET @tFechaUltimaMod = GETDATE()

	IF NOT EXISTS (SELECT 1 FROM [AswSch].[ASWTraOrdenProduccion] WHERE ClavePO = @pnClavePO)
	BEGIN
		INSERT INTO [AswSch].[ASWTraOrdenProduccion]
			([ClaUbicacion]
			,[IdPO]
			,[ClavePO]
			,[WO]
			,[IdCelda]
			,[ClaAreaProduccion]
			,[ClaDepartamento]
			,[ClaArticulo]
			,[ClaveArticulo]
			,[ClaGpoCosteo]
			,[ClaGrupoProceso]
			,[Orden]
			,[ClaUnidadProd]
			,[UnidadesProgramadas]
			--,[UnidadesProducidas]
			--,[PaquetesPorUnidad]
			--,[PiezasPorUnidad]
			,[UnidadesPorSkid]
			,[Diametro]
			,[DiametroMin]
			,[DiametroMax]
			,[Longitud]
			,[LongitudMin]
			,[LongitudMax]
			,[Length]
			,[Diameter]
			,[Point]
			,[Shank]
			,[ClaEstatus]
			--,[NotasProduccion]
			,[FechaProgramada]
			,[FechaCaptura]
			--,[FechaInicioReal]
			--,[FechaInicioAdm]
			--,[FechaFinReal]
			--,[FechaFinAdm]
			--,[BajaLogica]
			--,[FechaBajaLogica]
			,[ClaUsuarioMod]
			,[NombrePcMod]
			,[FechaIns]
			,[FechaUltimaMod])
		VALUES
			(@pnClaUbicacion
			,@nIdPO
			,@pnClavePO
			,@pnWO
			,@psIdCeldaOrden
			,@nClaAreaProduccion
			,@pnClaDepartamentoOrden
			,@pnClaArticulo
			,@nClaveArticulo
			,@nClaGpoCosteo 
			,@nClaGrupoProceso 
			,@pnOrden
			,@nClaUnidadProd
			,@pnScheduledBoxes
			--,<UnidadesProducidas, numeric(14,6)
			--,<PaquetesPorUnidad, numeric(14,6)
			--,<PiezasPorUnidad, numeric(14,6)
			,@nUnidadesPorSkid
			,@sDiametro
			,@sDiametroMin
			,@sDiametroMax 
			,@sLongitud
			,@sLongitudMin 
			,@sLongitudMax
			,@sLength 
			,@sDiameter 
			,@sPoint 
			,@sShank
			,@nClaEstatus
			,@ptFechaProgramada
			,@tFechaIns
			--,<FechaInicioReal, datetime,>
			--,<FechaInicioAdm, datetime,>
			--,<FechaFinReal, datetime,>
			--,<FechaFinAdm, datetime,>
			--,<BajaLogica, tinyint
			--,<FechaBajaLogica, datetime,>
			,@pnClaUsuarioMod
			,@psNombrePcMod
			,@tFechaIns
			,@tFechaUltimaMod)
		END	
		ELSE
		BEGIN
			SELECT @nIdPO = IdPO 
				,@nClaEstatus = ClaEstatus
			FROM [AswSch].[ASWTraOrdenProduccion]
			WHERE ClavePO = @pnClavePO

			IF @nClaEstatus = 1 --solo actualizar opms programadas	
			BEGIN		
				UPDATE [AswSch].[ASWTraOrdenProduccion]
				SET Orden = @pnOrden
					,UnidadesProgramadas = @pnScheduledBoxes
					,FechaUltimaMod = @tFechaUltimaMod
				WHERE ClavePO = @pnClavePO
			END
			ELSE
			BEGIN
				RAISERROR('The WO cannot be updated because is in progress or finished.', 16,1)
			END
		END
END