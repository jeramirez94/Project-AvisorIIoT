--USE [ASWH]
--GO
/****** Object:  StoredProcedure [AswSch].[ASW_CU153_Pag1_IniciarOrden_Proc]    Script Date: 22/05/2023 12:51:45 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*==========================================
* CU: 153.1
* Objetivo: Iniciar una nueva orden de produccion terminando la actual.
* Autor: MRDORIGUEZC
* Fecha: 2023-04-14
* NGP: 2023-05-22 sustituir {{}} en mensajes de error 
*      validar si la orden no existe aunque este en otro workcenter 
* EXEC: 
*========================================== */

ALTER PROCEDURE [AswSch].[ASW_CU153_Pag1_IniciarOrden_Proc]	
	@pnClaUbicacion INT,
	@psIdWorkCenter VARCHAR(100),
	@pnIdMicroProg BIGINT,
	@psNombrePcMod VARCHAR(64),
	@pnClaUsuarioMod INT, 
	@psIdioma VARCHAR(20),
	@psErrorKey VARCHAR(50) OUT,
	@psErrorMsg VARCHAR(500) OUT
AS
BEGIN
	SET LANGUAGE @psIdioma;  

	SET @psErrorKey = 'SUCCESS'
	SET @psErrorMsg = NULL
	
	--validar que la orden exista
	IF NOT EXISTS(SELECT 1
					FROM [AswSch].[AswTraMicroPrograma] MP
					WHERE MP.ClaUbicacion = @pnClaUbicacion 
						AND MP.idMicroProg = @pnIdMicroProg
					)
	BEGIN
		SET @psErrorKey = 'ORDER_NOT_EXIST'
		SELECT @psErrorMsg = Mensaje
		FROM [AswSch].[AswCatMensajeError] ME
		WHERE ErrorKey = 'ORDER_NOT_EXIST'
			AND Idioma = @psIdioma

		RETURN
	END
	
	--validar que la orden pertenezca al workcenter
	IF NOT EXISTS(SELECT 1
					FROM [AswSch].[AswTraMicroPrograma] MP
					WHERE MP.ClaUbicacion = @pnClaUbicacion 
						AND MP.IdWorkCenter = @psIdWorkCenter 
						AND MP.idMicroProg = @pnIdMicroProg
					)
	BEGIN
		SET @psErrorKey = 'ORDER_NOT_FROM_WORKCENTER'
		SELECT @psErrorMsg = Mensaje
		FROM [AswSch].[AswCatMensajeError] ME
		WHERE ErrorKey = 'ORDER_NOT_FROM_WORKCENTER'
			AND Idioma = @psIdioma

		SET @psErrorMsg = replace(@psErrorMsg,'{{ClaveWorkCenter}}',@PsIdWorkCenter)

		SELECT @psErrorMsg = replace(@psErrorMsg,'{{ClaveArticulos}}',ClaveArticulo + '-'+NomArticulo) 
		FROM [AswSch].[AswTraMicroPrograma] MP
					WHERE MP.ClaUbicacion = @pnClaUbicacion 
						AND MP.idMicroProg = @pnIdMicroProg

		RETURN
	END

	--validar que la orden este en un estatus valido
	IF NOT EXISTS(SELECT 1
					FROM [AswSch].[AswTraMicroPrograma] MP
					WHERE MP.ClaUbicacion = @pnClaUbicacion 
						AND MP.idMicroProg = @pnIdMicroProg
						AND MP.ClaEstatus IN (1,5)
					)
	BEGIN
		SET @psErrorKey = 'ORDER_NOT_STARTABLE'
		SELECT @psErrorMsg = Mensaje
		FROM [AswSch].[AswCatMensajeError] ME
		WHERE ErrorKey = 'ORDER_NOT_STARTABLE'
			AND Idioma = @psIdioma

		SELECT @psErrorMsg = replace(@psErrorMsg,'{{ClaveArticulos}}',ClaveArticulo + '-'+NomArticulo) 
		FROM [AswSch].[AswTraMicroPrograma] MP
					WHERE MP.ClaUbicacion = @pnClaUbicacion 
						AND MP.idMicroProg = @pnIdMicroProg

		RETURN
	END


	--validar que la orden pertenezca al programa actual
	IF NOT EXISTS(SELECT 1
					FROM [AswSch].[AswTraMicroPrograma] MP
					JOIN [AswSch].[ASWCfgProgPeriodo] PP
						ON MP.ClaUbicacion = PP.ClaUbicacion
						AND MP.ClaPeriodo = PP.ClaPeriodo
						AND MP.Version = PP.VersionActual
					WHERE MP.ClaUbicacion = @pnClaUbicacion 
						AND MP.idMicroProg = @pnIdMicroProg
						AND PP.ClaEstatus = 2 --Plan de produccion vigente
					)
	BEGIN
		SET @psErrorKey = 'ORDER_NOT_FROM_CURRENT_PLAN'
		SELECT @psErrorMsg = Mensaje
		FROM [AswSch].[AswCatMensajeError] ME
		WHERE ErrorKey = 'ORDER_NOT_FROM_CURRENT_PLAN'
			AND Idioma = @psIdioma

		SELECT @psErrorMsg = replace(@psErrorMsg,'{{ClaveArticulos}}',ClaveArticulo + '-'+NomArticulo) 
		FROM [AswSch].[AswTraMicroPrograma] MP
					WHERE MP.ClaUbicacion = @pnClaUbicacion 
						AND MP.idMicroProg = @pnIdMicroProg

		RETURN
	END	


	BEGIN TRANSACTION;  
  
	BEGIN TRY  
		--obtener y actualizar la orden de produccion en progreso
		DECLARE
			@nCantidadProgramada INT
			,@nCantidadProducida INT
			,@nCantidadPNC INT 
			,@psIdMicroProgActual INT
			,@nEstatusOrdenActual INT
			,@nEstatusPlan INT
			,@tFechaFinOrden DATETIME
			,@tFechaInicioOrden DATETIME

		SET @tFechaFinOrden = GETDATE()

		SELECT @psIdMicroProgActual = IdMicroProg
			,@nCantidadProgramada = CantidadProgramadaUds
			,@nCantidadProducida = ISNULL(mp.CantidadProducida,0)
			,@nCantidadPNC = ISNULL(mp.CantidadPNC,0)
			,@nEstatusPlan = ISNULL(P.ClaEstatus, 4)--si no lo encuentra lo tomo como cancelado
		FROM [AswSch].[AswTraMicroPrograma] MP
		LEFT JOIN [AswSch].[ASWCfgProgPeriodo] P
			ON MP.ClaPeriodo = P.ClaPeriodo
			AND MP.Version = P.VersionActual
		WHERE MP.ClaUbicacion = @pnClaUbicacion 
			AND MP.IdWorkCenter = @psIdWorkCenter 
			AND MP.ClaEstatus = 2--En progreso 

		--Si tiene unidades por hacer la pongo en pausa, sino terminada
		SET @nEstatusOrdenActual = CASE WHEN @nCantidadProgramada > @nCantidadProducida - @nCantidadPNC 
									THEN CASE @nEstatusPlan
										WHEN 2 THEN 5 --Pausada
										ELSE 4 --se cancela si ya no pertenece al plan actual
										END
									ELSE 3 --Terminada
								END
		--actualizar la orden a terminar
		EXEC [AswSch].[Asw_CU151_Pag1_MicroProgramaUpd]
			@pnClaubicacion = @pnClaUbicacion,
			@psIdMicroProg = @psIdMicroProgActual,
			@pnClaEstatus = @nEstatusOrdenActual,
			@pdFechaFinReal = @tFechaFinOrden,
			@pnClaUsuarioMod = @pnClaUsuarioMod,
			@psNombrePcMod = @psNombrePcMod
			

		--obetner la fecha inicial de la orden, si ya estaba iniciada mantengo la misma fecha
		SELECT @tFechaInicioOrden = COALESCE(FechaInicioReal, GETDATE())
		FROM [AswSch].[AswTraMicroPrograma] MP
		WHERE MP.ClaUbicacion = @pnClaUbicacion 
			AND MP.IdMicroProg = @pnIdMicroProg

		--actualizar la orden de produccion nueva		
		EXEC [AswSch].[Asw_CU151_Pag1_MicroProgramaUpd]
			@pnClaubicacion = @pnClaUbicacion,
			@psIdMicroProg = @pnIdMicroProg,
			@pdFechaInicioReal = @tFechaInicioOrden,
			@pnClaEstatus = 2,--En progreso
			@pnClaUsuarioMod = @pnClaUsuarioMod,
			@psNombrePcMod = @psNombrePcMod

		SELECT @pnClaUbicacion AS ClaUbicacion
			,@psIdWorkCenter AS IdWorkCenter
			,@psIdMicroProgActual AS IdMicroProgActual
			,@pnIdMicroProg AS IdMicroProgIniciada

	END TRY  
	BEGIN CATCH    
		IF @@TRANCOUNT > 0  
		ROLLBACK TRANSACTION;  
		THROW;
	END CATCH;  
  
	IF @@TRANCOUNT > 0  
		COMMIT TRANSACTION;  

END
