/*==========================================
* CU: 169.1
* Objetivo: Obtener los datos requeridos en el header de la aplicacion
*           Producto,velocidad,estado cumplimiento
* Autor: ngalaz
* Fecha: 2023-05-15
* EXEC ASWSch.ASW_CU169_Pag1_DatosHeader_Sel
	 @pnClaUbicacion  = 65 ,
	 @psIdWorkCenter  = 'FF-01',
	 @ptFechaHora     = @fecha ,
	 @psIdioma        = 'English',
	 @psErrorKey  = @psErrorKey OUT  , 
	 @psErrorMsg  = @psErrorMsg OUT, 
	 @PnDebug     = 1
*========================================== */


ALTER PROC ASWSch.ASW_CU169_Pag1_DatosHeader_Sel
	 @pnClaUbicacion  INT ,
	 @psIdWorkCenter VARCHAR(20),
	 @ptFechaHora DATETIME = null,
	 @psIdioma VARCHAR(20) ,
	 @psErrorKey VARCHAR(15) OUT  , 
	 @psErrorMsg VARCHAR(500) OUT, 
	 @PnDebug INT = 0 
AS
BEGIN 
	
	DECLARE @sErrorKey_Success VARCHAR(10) = 'SUCCESS',
		    @sErrorKey_IncorrectParams VARCHAR(50) = 'INCORRECT_PARAMETERS'
			
	SET @psErrorKey = @sErrorKey_Success

	IF @pnClaUbicacion IS NULL OR @psIdWorkCenter IS NULL
	BEGIN
	
		SELECT   @psErrorMsg = Mensaje
				,@psErrorKey = ErrorKey
		FROM [AswSch].[AswCatMensajeError]
		WHERE ErrorKey = @sErrorKey_IncorrectParams
			AND Idioma = @psIdioma

	END


	DECLARE @Var_Velocidad INT = 4, --ClaVariable que corresponde a la velocidad
			@Var_Estado    INT = 1  --ClaVariable que corresponde al estatus de la maquina (on/off)
	
	IF @ptFechaHora is null 
	BEGIN
		SET @ptFechaHora = GETDATE()
	END
	
	DECLARE @Resultado TABLE (
		Estado         INT,
		ProductoActual VARCHAR(250),
		Velocidad      NUMERIC(6,2),
		Cumplimiento   VARCHAR(20)
	)

	--INSERT SOLO PARA TENER UN REGISTRO EN LA TABLA Y LUEGO SOLO HACER UPDATES
	INSERT INTO @Resultado
	SELECT null,null,null,null

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
		NomArticulo VARCHAR(100),
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

	--OBTENER LA ORDEN ACTIVA PARA SACAR EL PRODUCTO ACTUAL 
	
	INSERT INTO @MicroPrograma
	EXEC [AswSch].[Asw_CU151_Pag1_MicroProgramaSel]  
		@pnClaUbicacion = @pnClaUbicacion
		,@psIdWorkCenter = @psIdWorkCenter
		--,@psIdioma = @psIdioma
		--,@psErrorKey = @psErrorKey
		--,@psErrorMsg = @psErrorMsg

	DELETE FROM @MicroPrograma
	WHERE ClaEstatus <> 2 --En Progreso


	--SACAMOS EL PRODUCTO ACTUAL
	UPDATE @Resultado 
	SET ProductoActual = (SELECT ClaveArticulo + ' - ' + NomArticulo
						  FROM @MicroPrograma)

	--OBTENER VELOCIDAD
	UPDATE @Resultado
	SET Velocidad =  (SELECT top 1 Valor 
					 FROM AswSch.AswRecBitVariable V
					 JOIN AswSch.AswCatWorkUnitVw WU
						ON V.ClaMaquina = WU.ClaMaquina
					WHERE ClaVariable = @Var_Velocidad
						AND WU.IdWorkCenter = @psIdWorkCenter
						AND WU.EsGralProduccion = 1
					ORDER BY FechaHoraMaquina DESC)
					
	--OBTENER EL ESTADO DE LA MAQUINA 
	UPDATE @Resultado
	SET Estado =  (SELECT top 1 Valor --1 CORRIENDO/ 0 APAGADO
					 FROM AswSch.AswRecBitVariable V
					 JOIN AswSch.AswCatWorkUnitVw WU
						ON V.ClaMaquina = WU.ClaMaquina
					WHERE ClaVariable   = @Var_Estado
						AND WU.IdWorkCenter = @psIdWorkCenter
						AND WU.EsGralProduccion = 1
					ORDER BY FechaHoraMaquina DESC)
	
	--PARA CALCULO DE CUMPLIMIENTO 
	DECLARE  @nTiempoTranscurrido numeric(5,2)
			,@nTiempoRestante numeric(5,2)
			,@tFechaAdm date
			,@nTurno INT
			,@nClaDepartamento INT
	

	SELECT @nClaDepartamento = ClaDepartamento
	FROM AswSch.AswCatWorkCenterVw
	WHERE IdWorkCenter = @psIdWorkCenter

	SELECT @tFechaAdm = [AswSch].[ASWGetFechaAdm](@PnClaUbicacion,@nClaDepartamento,@ptFechaHora)
	SELECT @nTurno = [AswSch].[ASWGetTurno](@PnClaUbicacion,@nClaDepartamento,@ptFechaHora)
	SELECT @nTiempoTranscurrido = DATEDIFF(MINUTE
										  ,[AswSch].[ASWGetInicioTurno](@PnClaUbicacion,@tFechaAdm,@nTurno,@nClaDepartamento)
										  ,@ptFechaHora)/60.0
	IF @PnDebug =1
	BEGIN
		SELECT 'Transcurrido' as debug
		,@nTiempoTranscurrido as TiempoTranscurrido
	END

	DECLARE @tmpDatosProd TABLE (
		Id INT identity(1,1),
		Produccion INT,
		ClaArticulo INT,
		Capacidad numeric(5,2),
		TiempoProduccion numeric(5,2),
		ClaTurno INT

	)

	INSERT INTO @tmpDatosProd (Produccion,ClaArticulo,Capacidad,TiempoProduccion,ClaTurno)
	SELECT  count(1) as produccion
		   ,BP.ClaArticulo
		   ,CM.Capacidad
		   ,COUNT(1)/CM.Capacidad as TiempoProduccion
		   ,ClaTurno
	FROM aswsch.AswBitBitacoraProduccion BP
	JOIN AswSch.AswCatCapacidadMaquinaVw CM
	ON BP.ClaUbicacion = CM.ClaPlanta
	AND BP.IdComponente = CM.ClaMaquina
	AND BP.ClaArticulo = CM.ClaArticulo
	WHERE BP.ClaUbicacion = @pnClaUbicacion 
	AND BP.IdComponente = @psIdWorkCenter
	AND BP.ClaArticulo IS NOT NULL
	AND BP.FechaAdm = @tFechaAdm
	AND BP.ClaTurno = @nTurno
	AND ISNULL(BP.EsPNC,0) = 0
	AND BP.FechaHoraFin <= @ptFechaHora
	group by BP.ClaArticulo,CM.Capacidad,ClaTurno,Multiplo
	order by MAX(FechaHoraFin) 

	IF @PnDebug = 1
	BEGIN
		SELECT 1 AS DEBUG, 
			   @pnClaUbicacion as ClaUbicacion,
			   @psIdWorkCenter as IdWorkCenter,
			   @tFechaAdm as FechaAdm,
			   @nTurno as Turno


		SELECT 2 AS Debug, * 
		FROM aswsch.AswBitBitacoraProduccion BP
		WHERE BP.ClaUbicacion = @pnClaUbicacion 
		AND BP.IdComponente = @psIdWorkCenter
		AND BP.ClaArticulo IS NOT NULL
		AND BP.FechaAdm = @tFechaAdm
		AND BP.ClaTurno = @nTurno
		AND BP.FechaHoraFin <= @ptFechaHora
		AND ISNULL(BP.EsPNC,0) = 0 

		select * from @tmpDatosProd
	END
	 
	
	DECLARE @nId INT = NULL

	Select @nId = MIN(id) from @tmpDatosProd

	DECLARE @nProduccion INT,
		    @nClaArticulo INT,
		    @nCapacidad numeric(5,2),
		    @nTiempoProduccion numeric(5,2),
		    @nClaTurno INT,
			@nProduccionEsperada numeric(5,2) = 0,
			@nProduccionReal numeric(5,2)

	SELECT @nProduccionReal = ISNULL(SUM(Produccion),0)
	FROM @tmpDatosProd
	

	IF NOT EXISTS (SELECT 1 FROM @MicroPrograma)
	BEGIN
		--SI NO HAY PROGRAMA REGRESAR 0
		SET @nProduccionEsperada = 0

		GOTO SALTA_CICLO 
	END
	
	IF NOT EXISTS (SELECT 1 FROM @tmpDatosProd)
	BEGIN
	--SI NO HAY PRODUCCION SE OMITE EL CICLO Y LA PRODUCCION ESPERADA SERA LA CAPACIDAD DEL PRODUCTO ACTUAL POR EL TIEMPO TRANSCURRIDO
		SELECT @nProduccionEsperada = @nTiempoTranscurrido * CM.Capacidad  
		FROM AswSch.AswCatCapacidadMaquinaVw CM
		JOIN @MicroPrograma MP 
			ON CM.ClaPlanta = @pnClaUbicacion
			AND MP.IdWorkCenter = CM.ClaMaquina
			AND MP.ClaArticulo = CM.ClaArticulo

		GOTO SALTA_CICLO
	END

	WHILE @nId IS NOT NULL
	BEGIN
		
		SELECT @nProduccion = Produccion
			  ,@nCapacidad = Capacidad
			  ,@nTiempoProduccion = TiempoProduccion
			  ,@nClaArticulo = ClaArticulo
		FROM @tmpDatosProd 
		where Id = @nId
		
		IF @nTiempoTranscurrido > @nTiempoProduccion
		BEGIN
			
			SET @nTiempoTranscurrido = @nTiempoTranscurrido - @nTiempoProduccion

			SET @nProduccionEsperada = @nProduccionEsperada + @nProduccion

			IF @nClaArticulo = (SELECT ClaArticulo FROM @MicroPrograma)
			BEGIN
				SET @nProduccionEsperada = @nProduccionEsperada + (@nTiempoTranscurrido * @nCapacidad)
			END

			

		END
		ELSE
		BEGIN
			SET @nProduccionEsperada = @nProduccionEsperada + (@nTiempoTranscurrido * @nCapacidad)

			print 'time is over'
			SET @nId = null

		END

		IF @PnDebug = 1
		BEGIN
			SELECT @nProduccion as produccion
			,@nCapacidad as capacidad
			,@nTiempoProduccion as TProduccion
			,@nTiempoTranscurrido as TTranscurrido
			,@nProduccionEsperada as prodEsperada
		END

		SELECT @nId = MIN(id) 
		FROM @tmpDatosProd
		WHERE Id > @nId

	END

	SALTA_CICLO:

	UPDATE @Resultado
	SET Cumplimiento = CAST(CAST(@nProduccionReal AS int) AS VARCHAR) +' / '+ CAST(CAST(@nProduccionEsperada AS INT) AS VARCHAR)

	SELECT   Estado         
			,ProductoActual
			,Velocidad     
			,Cumplimiento  
	FROM @Resultado

END 
GO
