--USE [ASW]
--GO
/****** Object:  StoredProcedure [AswSch].[ASW_CU523_Pag1_BitAndon_IU]    Script Date: 15/11/2022 03:26:24 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*
* MRODRIGUEZC
* 2020/07/01
* guarda la informacion de andon
*/
ALTER PROCEDURE [AswSch].[ASW_CU523_Pag1_BitAndon_IU]		
		@pnClaUbicacion INT,
		@pnIdComponente VARCHAR(30),
		@pnIdAndon INT,
		@pnIdPOInicio INT,
		@pnIdPOFin INT,
		@pnIdUnidad INT,
		@pnIdUsuario INT,
		@ptFechaHoraInicial DATETIME,
		@ptFechaHoraReasignado DATETIME,
		@ptFechaHoraAtencion DATETIME,
		@ptFechaHoraFinal DATETIME,
		@pnDuracionSegundos INT,
		@ptFechaAdmSCADA DATETIME,
		@pnClaTurno INT,
		@pnClaGrupoParo INT,
		@pnClaTipoParo INT,
		@pnClaSeccionParo INT,
		@pnClaEstatusReplica INT,
		@pnClaEventoNuevo INT,
		@pnClaEventoReasignacion INT,
		@pnClaEventoAtencion INT,
		@pnClaEventoSolucionado INT,
		@pnClaUsuarioMod INT,
		@psNombrePCMod VARCHAR(64),
		@ptFechaUltimaMod DATETIME,
		@pnBajaLogica INT,
		@pnNombreEmpleado VARCHAR(400),
		@pnComentarios VARCHAR(400),
		@pnComentariosSolucion VARCHAR(400),
		@PnIdTipoSeguimientoAlerta TINYINT
AS
BEGIN

	IF EXISTS (SELECT 1 FROM [AswSch].[AswBitAndon] WHERE ClaUbicacion = @pnClaUbicacion AND IdComponente = @pnIdComponente AND IdAndon = @pnIdAndon)
	BEGIN
		
		UPDATE [AswSch].[AswBitAndon]
		SET [ClaUbicacion] = @pnClaUbicacion
			,[IdComponente] = @pnIdComponente
			,[IdAndon] = @pnIdAndon
			,[IdPOInicio] = @pnIdPOInicio
			,[IdPOFin] = @pnIdPOFin
			,[IdUnidad] = @pnIdUnidad
			,[IdUsuario] = @pnIdUsuario
			,[FechaHoraInicial] = @ptFechaHoraInicial
			,[FechaHoraReasignado] = @ptFechaHoraReasignado
			,[FechaHoraAtencion] = @ptFechaHoraAtencion
			,[FechaHoraFinal] = @ptFechaHoraFinal
			,[DuracionSegundos] = @pnDuracionSegundos
			,[ClaTurno] = @pnClaTurno
			,[FechaAdmSCADA] = @ptFechaAdmSCADA
			,[ClaGrupoParo] = @pnClaGrupoParo
			,[ClaTipoParo] = @pnClaTipoParo
			,[ClaSeccionParo] = @pnClaSeccionParo
		    ,[ClaEstatusReplica] = @pnClaEstatusReplica
			,[ClaEventoNuevo] = CASE WHEN @pnClaEventoNuevo = 1 THEN 1 ELSE [ClaEventoNuevo] END
			,[ClaEventoReasignacion] = CASE WHEN @pnClaEventoReasignacion = 1 THEN 1 ELSE [ClaEventoReasignacion] END
			,[ClaEventoAtencion] = CASE WHEN @pnClaEventoAtencion = 1 THEN 1 ELSE [ClaEventoAtencion] END 
			,[ClaEventoSolucionado] = CASE WHEN @pnClaEventoSolucionado = 1 THEN 1 ELSE [ClaEventoSolucionado] END
			,[ClaUsuarioMod] = @pnClaUsuarioMod
			,[NombrePCMod] = @psNombrePCMod
			,[FechaUltimaMod] = @ptFechaUltimaMod
			,[BajaLogica] = @pnBajaLogica
			,[NombreEmpleado] = @pnNombreEmpleado
			,[Comentarios] = @pnComentarios
			,[ComentariosSolucion] = @pnComentariosSolucion
			,[IdTipoSeguimientoAlerta] = @PnIdTipoSeguimientoAlerta
		WHERE ClaUbicacion = @pnClaUbicacion 
			AND IdComponente = @pnIdComponente 
			AND IdAndon = @pnIdAndon

	END
	ELSE
	BEGIN	

		INSERT INTO [AswSch].[AswBitAndon]
			([ClaUbicacion]
			,[IdComponente]
			,[IdAndon]
			,[IdPOInicio]
			,[IdPOFin]
			,[IdUnidad]
			,[IdUsuario]
			,[FechaHoraInicial]
			,[FechaHoraReasignado]
			,[FechaHoraAtencion]
			,[FechaHoraFinal]
			,[DuracionSegundos]
			,[ClaTurno]
			,[FechaAdmSCADA]
			,[ClaGrupoParo]
			,[ClaTipoParo]
			,[ClaSeccionParo]
			,[ClaEstatusReplica]
			,[ClaEventoNuevo]
			,[ClaEventoReasignacion]
			,[ClaEventoAtencion]
			,[ClaEventoSolucionado]
			,[ClaUsuarioMod]
			,[NombrePCMod]
			,[FechaUltimaMod]
			,[BajaLogica]
			,[NombreEmpleado]
			,[Comentarios]
			,[ComentariosSolucion]
			,[IdTipoSeguimientoAlerta])
		VALUES
			(@pnClaUbicacion
			,@pnIdComponente
			,@pnIdAndon
			,@pnIdPOInicio
			,@pnIdPOFin
			,@pnIdUnidad
			,@pnIdUsuario
			,@ptFechaHoraInicial
			,@ptFechaHoraReasignado
			,@ptFechaHoraAtencion
			,@ptFechaHoraFinal
			,@pnDuracionSegundos
			,@pnClaTurno
			,@ptFechaAdmSCADA
			,@pnClaGrupoParo
			,@pnClaTipoParo
			,@pnClaSeccionParo
			,@pnClaEstatusReplica
			,@pnClaEventoNuevo
			,@pnClaEventoReasignacion
			,@pnClaEventoAtencion
			,@pnClaEventoSolucionado
			,@pnClaUsuarioMod
			,@psNombrePCMod
			,@ptFechaUltimaMod
			,@pnBajaLogica
			,@pnNombreEmpleado
			,@pnComentarios
			,@pnComentariosSolucion
			,@PnIdTipoSeguimientoAlerta)

	END
END
