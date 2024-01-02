
/*==========================================
* CU: 151.2
* Objetivo: Devolver Orden en estatus progreso de la estacion de trabajo
* Autor: ngalaz
* Fecha: 2023-04-21
* EXEC: ASWSch.ASW_CU151_Pag2_OrdenEnProgreso_Sel 65,'FF-02'

*========================================== */

CREATE PROC ASWSch.ASW_CU151_Pag2_OrdenEnProgreso_Sel
	@PnClaUbicacion INT,
	@PsIdWorkCenter VARCHAR(15),
	@psIdioma VARCHAR(20),
	@psErrorKey VARCHAR(15) OUT ,
	@psErrorMsg VARCHAR(500) OUT,
	@PnDebug INT = 0 
AS
BEGIN
	DECLARE @sErrorKey_Success VARCHAR(10) = 'SUCCESS',
		    @sErrorKey_IncorrectParams VARCHAR(50) = 'INCORRECT_PARAMETERS',
			@sErrorKey_No_Avtive_Order VARCHAR(50) = 'NO_ACTIVE_ORDER',
			@sErrorKey_Multiple_Active_Orders VARCHAR(50) = 'MULTIPLE_ACTIVE_ORDERS'
	

	SET @psErrorKey = @sErrorKey_Success
	SET @psErrorMsg = NULL

	IF(@pnClaUbicacion IS NULL OR @PsIdWorkCenter IS NULL)
	BEGIN
		
		SELECT   @psErrorMsg = Mensaje
				,@psErrorKey = ErrorKey
		FROM [AswSch].[AswCatMensajeError]
		WHERE ErrorKey = @sErrorKey_IncorrectParams
			AND Idioma = @psIdioma

		RETURN
	END

	DECLARE @nClaEstatusProgreso INT = 2

	DECLARE @MicroPrograma TABLE(
		IdMicroProg INT,
		ClaArea INT,
		ClaveArea VARCHAR(50),
		NomArea VARCHAR(250),
		ClaDepartamento INT,
		ClaveDepartamento VARCHAR(50),
		NomDepartamento VARCHAR(250),
		ClaGrupoMaquina INT,
		ClaveGrupoMaquina VARCHAR(50),
		NomGrupoMaquina VARCHAR(250),
		IdWorkCenter VARCHAR(100),
		ClaPeriodo INT,
		Version INT,
		ClaArticulo INT,
		ClaveArticulo VARCHAR(150),
		NomArticulo VARCHAR(1000),
		ClaUnidad INT,
		NomUnidad VARCHAR(250),
		IdOpm INT,
		Nomopm VARCHAR(250),
		CantidadProgramadaKgs DECIMAL(18,2),
		CantidadProgramadaUds DECIMAL(18,2),
		FechaInicioPlan DATE,
		FechaPromesaOPM DATE,
		ClaEstatus INT,
		NomEstatus VARCHAR(15),
		Comentarios VARCHAR(8000),
		ComentariosProduccion VARCHAR(8000),
		UnidadesPorPaquete DECIMAL(18,2),
		FechaInicioReal DATE,
		FechaFinReal DATE,
		CantidadProducida DECIMAL(18,2),
		CantidadPNC DECIMAL(18,2),
		Ege DECIMAL(18,2),
		CapacidadKgs DECIMAL(18,2),
		CapacidadUds DECIMAL(18,2),
		DuracionEge DECIMAL(18,2),
		CantidadPendiente DECIMAL(18,2)
	)

	INSERT INTO @MicroPrograma
	EXEC [AswSch].[Asw_CU151_Pag1_MicroProgramaSel]  @PnClaUbicacion,@PsIdWorkCenter

	IF @PnDebug = 1
	BEGIN
		
		SELECT 1 as Debug,*
		FROM @MicroPrograma

	END

	DELETE FROM @MicroPrograma
	WHERE ClaEstatus <> @nClaEstatusProgreso

	IF NOT EXISTS (SELECT 1 FROM @MicroPrograma)
	BEGIN 
	
		
		SELECT   @psErrorMsg = Mensaje
				,@psErrorKey = ErrorKey
		FROM [AswSch].[AswCatMensajeError]
		WHERE ErrorKey = @sErrorKey_No_Avtive_Order
			AND Idioma = @psIdioma

		RETURN
	
	END 

	IF (SELECT COUNT(1) FROM @MicroPrograma) > 1
	BEGIN
		SELECT   @psErrorMsg = Mensaje
			    ,@psErrorKey = ErrorKey
		FROM [AswSch].[AswCatMensajeError]
		WHERE ErrorKey = @sErrorKey_Multiple_Active_Orders
			AND Idioma = @psIdioma

		RETURN 
	END 

	SELECT IdMicroProg ,
		ClaArea ,
		ClaveArea ,
		NomArea,
		ClaDepartamento,
		ClaveDepartamento,
		NomDepartamento ,
		ClaGrupoMaquina ,
		ClaveGrupoMaquina,
		NomGrupoMaquina,
		IdWorkCenter,
		ClaPeriodo ,
		Version ,
		ClaArticulo ,
		ClaveArticulo ,
		NomArticulo,
		ClaUnidad ,
		NomUnidad ,
		IdOpm ,
		Nomopm ,
		CantidadProgramadaKgs,
		CantidadProgramadaUds,
		FechaInicioPlan ,
		FechaPromesaOPM ,
		ClaEstatus ,
		NomEstatus ,
		Comentarios ,
		ComentariosProduccion,
		UnidadesPorPaquete,
		FechaInicioReal,
		FechaFinReal ,
		CantidadProducida ,
		CantidadPNC ,
		Ege ,
		CapacidadKgs,
		CapacidadUds,
		DuracionEge,
		CantidadPendiente
	FROM @MicroPrograma


END 
GO


