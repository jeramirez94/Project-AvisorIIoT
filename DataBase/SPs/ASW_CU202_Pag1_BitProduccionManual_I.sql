--USE [ASWH]
--GO
/****** Object:  StoredProcedure [AswSch].[ASW_CU202_Pag1_BitProduccionManual_I]    Script Date: 28/05/2023 06:37:57 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*==========================================
* CU: 202.1
* Objetivo: para actualizar la pantalla de la aplicación al hacer la inserción manual de producción.
* Autor: ngalaz
* Fecha: 2023-05-23
* EXEC: EXEC  ASWSch.ASW_CU171_Pag1_EliminarUnidad_Del
	@PnClaUbicacion = 65,
	@PsIdWorkCenter = 'FF-01',
	@PsIdUnidades = '17041,16750,1,2,4',
	@psErrorKey  = @psErrorKey OUT ,
	@psErrorMsg  = @psErrorMsg OUT,
	@psIdioma = 'English',
	@PsNombrePCMod = '-',
	@PnClaUsuarioMod = 0,
	@PnDebug  =0 
*========================================== */
ALTER PROC [AswSch].[ASW_CU202_Pag1_BitProduccionManual_I] 
	@PnClaUbicacion INT,
	@PsIdWorkCenter VARCHAR(100),
	@PnCantidad INT,
	@PnIdOrden BIGINT, 
	@PnClaTurno INT,
	@PtFechaAdm DATE,
	@PnEsPNC TINYINT,
	@psErrorKey VARCHAR(50) OUT ,
	@psErrorMsg VARCHAR(500) OUT,
	@psIdioma VARCHAR(20),
	@PsNombrePCMod VARCHAR(64),
	@PnClaUsuarioMod INT,
	@PnDebug INT = 0 
AS
BEGIN
	
	--CLAVES DE ERRORES
	DECLARE @sErrorKey_Success VARCHAR(10) = 'SUCCESS',
		    @sErrorKey_IncorrectParams VARCHAR(50) = 'INCORRECT_PARAMETERS',
			@sErrorKey_PO_NotExists VARCHAR(20) = 'ORDER_NOT_EXIST',
			@sErrorKey_PO_WrongWorkCenter VARCHAR(50) = 'ORDER_NOT_FROM_WORKCENTER',
			@sErrorKey_PO_NotCurrentPlan VARCHAR(50) = 'ORDER_NOT_FROM_CURRENT_PLAN'

	SET @psErrorKey = @sErrorKey_Success

    --Validar: COMO OBTENGO EL PLAN ACTUAL?
	DECLARE @nPeriodoActual INT
		   ,@nVersionPlanActual INT
		   ,@nClaDepartamento INT
		   ,@tFechaAdmActual date
		   ,@nTurnoActual INT
		   ,@tFinTurnoActual datetime
		   ,@sIdComponenteProd VARCHAR(100) --MAQUINA QUE MARCA LA PRODUCCION
		   ,@sClaveArticulo VARCHAR(150)

   SELECT @sIdComponenteProd = ClaMaquina 
   FROM AswSch.AswCatWorkUnitVw
   WHERE IdWorkCenter = @PsIdWorkCenter

	SELECT @nClaDepartamento = ClaDepartamento
	FROM AswSch.AswCatWorkCenterVw
	WHERE IdWorkCenter = @psIdWorkCenter

	--TURNO ACTUAL 

	SELECT @tFechaAdmActual = [AswSch].[ASWGetFechaAdm] (
	   @PnClaUbicacion
	  ,@nClaDepartamento
	  ,GETDATE()
	  )
	
	SELECT @nTurnoActual    = [AswSch].[ASWGetTurno](@PnClaUbicacion,@nClaDepartamento,GETDATE()) 

	SELECT @tFinTurnoActual   = DATEADD(SECOND, -1,  [AswSch].[ASWGetFinTurno] (@PnClaUbicacion,@tFechaAdmActual,@nTurnoActual,@nClaDepartamento))


	--SE OBTIENE LA VERSION DEL PLAN ACTUAL 
	SELECT	 @nVersionPlanActual = VersionActual 
			,@nPeriodoActual = ClaPeriodo
	FROM [AswSch].[ASWCfgProgPeriodo]
	WHERE ClaEstatus = 2  --Plan activo 

	IF @PnDebug = 1
	BEGIN
		SELECT 'DEBUG' as debug
		   ,nPeriodoActual       = @nPeriodoActual 
		   ,nVersionPlanActual   = @nVersionPlanActual 
		   ,nClaDepartamento     = @nClaDepartamento 
		   ,tFechaAdmActual      = @tFechaAdmActual 
		   ,nTurnoActual         = @nTurnoActual 
		   ,tFinTurnoActual      = @tFinTurnoActual 
		   ,sIdComponenteProd    = @sIdComponenteProd 
	END

	
	
	IF(@PnClaUbicacion IS NULL OR @PsIdWorkCenter IS NULL OR ISNULL(@PnCantidad,0) <= 0 OR @psIdioma IS NULL
		OR @PnIdOrden is null OR @PnClaTurno is null OR @PtFechaAdm IS NULL OR @PnEsPNC IS NULL)
	BEGIN
		
		SELECT   @psErrorMsg = Mensaje
				,@psErrorKey = ErrorKey
		FROM [AswSch].[AswCatMensajeError]
		WHERE ErrorKey = @sErrorKey_IncorrectParams
			AND Idioma = ISNULL(@psIdioma,'English')

		RETURN
	END

	DECLARE @nValidaWorkCenter INT = 0,
		    @nValidaPlanActual INT = 0,
			@nValidaExistePO INT   = 0

	--VALIDAR ORDEN SEA DEL PLAN ACTUAL
	SELECT  @nValidaWorkCenter = CASE WHEN IdWorkCenter = @PsIdWorkCenter THEN 1 ELSE 0 END,
		    @nValidaPlanActual = CASE WHEN (ClaPeriodo = @nPeriodoActual AND [Version] = @nVersionPlanActual) 
									  THEN 1 
									  ELSE 0 
								 END,
	       @nValidaExistePO    = CASE WHEN idMicroProg is not null
									  THEN 1 
									  ELSE 0 
								 END,
		   @sClaveArticulo = ClaveArticulo
	FROM AswSch.AswTraMicroPrograma 
	WHERE ClaUbicacion = @PnClaUbicacion
	 AND idMicroProg    = @PnIdOrden

	IF(@nValidaExistePO = 0)
	BEGIN
		
		SELECT   @psErrorMsg = REPLACE(Mensaje, '{{ClaveArticulo}}', @sClaveArticulo)
				,@psErrorKey = ErrorKey
		FROM [AswSch].[AswCatMensajeError]
		WHERE ErrorKey = @sErrorKey_PO_NotExists
			AND Idioma = @psIdioma

		RETURN
	END

	IF(@nValidaWorkCenter = 0) 
	BEGIN
		SELECT   @psErrorMsg = REPLACE(Mensaje, '{{ClaveArticulo}}', @sClaveArticulo)
				,@psErrorKey = ErrorKey
		FROM [AswSch].[AswCatMensajeError]
		WHERE ErrorKey = @sErrorKey_PO_WrongWorkCenter
			AND Idioma = @psIdioma

		RETURN
	END

	IF(@nValidaPlanActual = 0) 
	BEGIN
		SELECT   @psErrorMsg = REPLACE(Mensaje, '{{ClaveArticulo}}', @sClaveArticulo)
				,@psErrorKey = ErrorKey
		FROM [AswSch].[AswCatMensajeError]
		WHERE ErrorKey = @sErrorKey_PO_NotCurrentPlan
			AND Idioma = @psIdioma

		RETURN
	END

	DECLARE @nIdBitProduccion INT,
			@nIdCaja INT	

	DECLARE @nCantidadCiclo INT = 1

	BEGIN TRAN
	BEGIN TRY
		WHILE @nCantidadCiclo <= @PnCantidad
		BEGIN
	
			SELECT @nIdBitProduccion = ISNULL(MAX(IdBitProduccion),0) + 1
			FROM AswSch.AswBitBitacoraProduccion
			WHERE ClaUbicacion = @PnClaUbicacion
			AND IdCelda = @PsIdWorkCenter --WORKCENTER
			AND IdComponente = @sIdComponenteProd --WORK UNIT 

			SELECT @nIdCaja = ISNULL(MAX(IdCaja),0) + 1
			FROM AswSch.AswBitBitacoraProduccion
			WHERE ClaUbicacion = @PnClaUbicacion
			AND IdCelda        = @PsIdWorkCenter --WORKCENTER
			AND IdComponente   = @sIdComponenteProd --WORK UNIT 
			AND IdPO = @PnIdOrden

			

			INSERT INTO [AswSch].[AswBitBitacoraProduccion]
					   ([ClaUbicacion]
					   ,[IdBitProduccion]
					   ,[IdCelda]
					   ,[IdComponente]
					   ,[IdPO]
					   ,[IdCaja]
					   ,[ClaArticulo]
					   ,[ClaveCorte]
					   ,[FechaHoraInicio]
					   ,[FechaHoraFin]
					   ,[DuracionSegundos]
					   ,[ClavosInicio]
					   ,[ClavosFin]
					   ,[CajasInicio]
					   ,[CajasFin]
					   ,[CajasXHora]
					   ,[ClaTurno]
					   ,[FechaAdm]
					   ,[Hora]
					   ,[ClaEstatusReplica]
					   ,[BajaLogica]
					   ,[FechaBajaLogica]
					   ,[ClaUsuarioMod]
					   ,[NombrePCMod]
					   ,[FechaUltimaMod]
					   ,[IdMultiplo]
					   ,[Multiplo]
					   ,[ClaPuntoMedicion]
					   ,[Anio]
					   ,[EsPNC]
					   ,[EsManual])
    
			SELECT 
				 @PnClaUbicacion AS ClaUbicacion
				,@nIdBitProduccion AS IdBitProduccion -- generar consecutivo por ubicación, workcenter, workunit y ¿esManual=0?
				,@PsIdWorkCenter AS IdCelda -- workcenter
				,@sIdComponenteProd AS IdComponente -- workunit asociado al workcenter que EsGralProduccion = 1
				,@PnIdOrden AS IdPO --  -- id de la orden 
				,@nIdCaja AS IdCaja -- generar consecutivo por idPO (IdMicroProg)
				,MP.ClaArticulo AS ClaArticulo -- obtenerlo de la orden
				,'FINCAJA' AS ClaveCorte -- “FINCAJA”
				,CASE WHEN @PnClaTurno = @nTurnoActual AND @PtFechaAdm = @tFechaAdmActual
					THEN  GETDATE()
					ELSE @tFinTurnoActual
				 END AS FechaHoraInicio -- getdate() o fecha fin turno si no esta dentro del turno actual
				,CASE WHEN @PnClaTurno = @nTurnoActual AND @PtFechaAdm = @tFechaAdmActual
					THEN  GETDATE()
					ELSE @tFinTurnoActual
				 END AS FechaHoraFin -- getdate() o fecha fin turno si no esta dentro del turno actual
				,0 AS DuracionSegundos -- 0
				,0 AS ClavosInicio -- 0
				,NULL AS ClavosFin -- pendiente…
				,0 AS CajasInicio -- 0
				,1 AS CajasFin -- 1
				,CM.Capacidad AS CajasXHora -- obtener de la capacidad por producto y maquina
				,@PnClaTurno AS ClaTurno -- turno seleccionado
				,@PtFechaAdm AS FechaAdm -- fecha adm seleccionada
				,DATEPART(HOUR,
							CASE WHEN @PnClaTurno = @nTurnoActual AND @PtFechaAdm = @tFechaAdmActual
								 THEN  GETDATE()
								 ELSE @tFinTurnoActual
							END) AS Hora -- entero que representa la hora actual o fecha fin turno si no esta dentro del turno actual
				,0 AS ClaEstatusReplica -- 0
				,0 AS BajaLogica -- 0
				,NULL AS FechaBajaLogica -- NULL
				,@PnClaUsuarioMod AS ClaUsuarioMod -- usuario que agrega las unidades
				,@PsNombrePCMod AS NombrePCMod -- “Estacion “+IdWorkCenter
				,GETDATE() AS FechaUltimaMod -- getdate()
				,1 AS IdMultiplo -- 1
				,1 AS Multiplo --1
				,@PsIdWorkCenter AS ClaPuntoMedicion -- IdWorkCenter
				,DATEPART(YEAR,
							CASE WHEN @PnClaTurno = @nTurnoActual AND @PtFechaAdm = @tFechaAdmActual
								 THEN  GETDATE()
								 ELSE @tFinTurnoActual
							END) AS Anio -- anio de getdate() o fecha fin turno si no esta dentro del turno actual
				,@PnEsPNC AS EsPNC --parametro dado
				,1 as EsManual
			FROM AswSch.AswTraMicroPrograma  MP
			LEFT JOIN AswSch.AswCatCapacidadMaquinaVw CM
				ON MP.ClaUbicacion = CM.ClaPlanta
				AND MP.ClaArticulo = CM.ClaArticulo
				AND MP.IdWorkCenter = CM.ClaMaquina
			WHERE ClaUbicacion  = @PnClaUbicacion
			 AND idMicroProg    = @PnIdOrden 
			 AND ClaPeriodo     = @nPeriodoActual
			 AND [Version]      = @nVersionPlanActual

			 IF @PnDebug =1
			 BEGIN
				 SELECT 'SE INSERTO' as debug,* FROM AswSch.AswBitBitacoraProduccion
				 WHERE IdBitProduccion = @nIdBitProduccion
			 END
	
			SET @nCantidadCiclo = @nCantidadCiclo + 1
		END

		EXEC [AswSch].[ASW_CU151_Pag1_ActualizaProduccion_Proc] 
				@pnClaubicacion =  @PnClaUbicacion,
				@psIdMicroProg  =  @PnIdOrden,
				@pnClaUsuarioMod = @PnClaUsuarioMod,
				@psNombrePcMod  =  @PsNombrePCMod

		SELECT B.Id as 'IdRegistro',
			  B.IdCaja as 'Unit#',	
			  B.IdPO as 'IdOrder',
			  P.Nomopm AS 'NomOrder',
			  P.NomArticulo AS 'Item',
			  FORMAT(B.FechaHoraFin, 'yyyy/MM/dd HH:mm:ss') AS 'Date',
			  CONCAT(
					CASE WHEN DATEPART(HOUR, DATEADD(ss, DuracionSegundos, 0)) >= 1 THEN CONCAT(DATEPART(HOUR, DATEADD(ss, DuracionSegundos, 0)), 'h ') else '' end
					,
					CASE WHEN DATEPART(MINUTE, DATEADD(ss, DuracionSegundos, 0)) >= 1 THEN CONCAT(DATEPART(MINUTE, DATEADD(ss, DuracionSegundos, 0)), 'm ') else '' end
					,
					CASE WHEN DATEPART(SECOND, DATEADD(ss, DuracionSegundos, 0)) >= 1 THEN CONCAT(DATEPART(SECOND, DATEADD(ss, DuracionSegundos, 0)), 's ') else '' end
			  ) AS 'Duration',
			  CASE ISNULL(B.EsPNC,0)
				   WHEN 0
				   THEN 'Good'
				   ELSE 'Rejected'
			  END as 'Status'
		FROM [AswSch].[AswTraMicroPrograma] P WITH(NOLOCK)
		LEFT JOIN [Aswsch].[AswBitBitacoraProduccion] B WITH(NOLOCK)  
			ON P.idMicroProg = B.IdPO 
			AND B.FechaAdm = CONVERT(DATE,@PtFechaAdm) 
			AND B.IdCelda = @PsIdWorkCenter
			AND B.ClaTurno = @PnClaTurno
		WHERE B.ClaUbicacion = @PnClaUbicacion
			AND B.BajaLogica = 0
		GROUP BY	B.Id,
					P.idMicroProg,
					B.IdPO,
					P.NomOPM,
					P.NomArticulo,
					B.IdCaja,
					B.FechaHoraFin,
					B.FechaHoraInicio,
					B.DuracionSegundos,
					B.EsPNC
		ORDER BY B.FechaHoraInicio DESC

	END TRY  
	BEGIN CATCH    
		IF @@TRANCOUNT > 0  
		ROLLBACK TRANSACTION;  
		THROW;
	END CATCH;  
  
	IF @@TRANCOUNT > 0  
		COMMIT TRANSACTION;  

	
 		
END



