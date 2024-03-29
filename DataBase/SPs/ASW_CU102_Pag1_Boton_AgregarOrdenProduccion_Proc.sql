--USE [ASW]
--GO
/****** Object:  StoredProcedure [AswSch].[ASW_CU102_Pag1_Boton_AgregarOrdenProduccion_Proc]    Script Date: 14/11/2022 01:07:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [AswSch].[ASW_CU102_Pag1_Boton_AgregarOrdenProduccion_Proc]
	@pnClaUbicacion INT
	,@pnClaArticulo INT
	,@pnClaDepartamentoOrden INT
	,@psIdCeldaOrden VARCHAR(30)
	,@pnScheduledBoxes INT
	,@psProductionNotes VARCHAR(140)
	,@pnClaUsuarioMod INT
	,@psNombrePcMod VARCHAR(64)
AS
BEGIN
	DECLARE
		 @nIdPO int
        ,@nClavePO int
		,@nClaAreaProduccion int
		,@nClaveArticulo VARCHAR(20)
		,@nClaGpoCosteo int
		,@nClaGrupoProceso int
		,@nOrden int
		,@nClaUnidadProd int
		--,@nUnidadesProducidas numeric(14,6)
		--,@nPaquetesPorUnidad numeric(14,6)
		--,@nPiezasPorUnidad numeric(14,6)
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
		,@tFechaCaptura datetime
		--,@tFechaInicioReal datetime
		--,@tFechaInicioAdm datetime
		--,@tFechaFinReal datetime
		--,@tFechaFinAdm datetime
		--,@nBajaLogica tinyint
		--,@tFechaBajaLogica datetime
		,@tFechaUltimaMod datetime

	SELECT @nIdPO = COALESCE( MAX(IdPO), 0 ) + 1
		,@nClavePO = COALESCE( MAX(ClavePO), 0 ) + 1
	FROM [AswSch].[ASWTraOrdenProduccion]
	WHERE ClaUbicacion = @pnClaUbicacion

	SELECT @nOrden = COALESCE( MAX(Orden), 0 ) + 1
	FROM [AswSch].[ASWTraOrdenProduccion]
	WHERE ClaUbicacion = @pnClaUbicacion
		AND IdCelda = @psIdCeldaOrden

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
	SET @tFechaCaptura = GETDATE()
	SET @tFechaUltimaMod = GETDATE()

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
		,[NotasProduccion]
		,[FechaCaptura]
		--,[FechaInicioReal]
		--,[FechaInicioAdm]
		--,[FechaFinReal]
		--,[FechaFinAdm]
		--,[BajaLogica]
		--,[FechaBajaLogica]
		,[ClaUsuarioMod]
		,[NombrePcMod]
		,[FechaUltimaMod]
		,FechaIns)
	VALUES
		(@pnClaUbicacion
		,@nIdPO
		,@nClavePO
		,@nClavePO
		,@psIdCeldaOrden
		,@nClaAreaProduccion
		,@pnClaDepartamentoOrden
		,@pnClaArticulo
		,@nClaveArticulo
		,@nClaGpoCosteo 
		,@nClaGrupoProceso 
		,@nOrden
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
		,@psProductionNotes
		,@tFechaCaptura
		--,<FechaInicioReal, datetime,>
		--,<FechaInicioAdm, datetime,>
		--,<FechaFinReal, datetime,>
		--,<FechaFinAdm, datetime,>
		--,<BajaLogica, tinyint
		--,<FechaBajaLogica, datetime,>
		,@pnClaUsuarioMod
		,@psNombrePcMod
		,@tFechaUltimaMod
		,GETDATE())


	
END

