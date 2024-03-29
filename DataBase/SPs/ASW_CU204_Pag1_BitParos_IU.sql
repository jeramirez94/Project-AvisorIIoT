--USE [ASW]
--GO
/****** Object:  StoredProcedure [AswSch].[ASW_CU204_Pag1_BitParos_IU]    Script Date: 15/11/2022 02:19:59 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*
* MRODRIGUEZC
* 2020/07/01
* guarda la informacion de paros
*/
ALTER PROCEDURE [AswSch].[ASW_CU204_Pag1_BitParos_IU]	
		@pnClaUbicacion INT,
		@pnIdComponente VARCHAR(30),
		@pnIdParo INT,
		@psClaPuntoMedicion VARCHAR(30) = NULL,
		@pnAnio INT = NULL,
		@pnIdPOInicio INT,
		@pnIdPOFin INT,
		@pnIdUnidad INT,
		@pnIdUsuario INT,
		@ptFechaHoraInicial DATETIME,
		@ptFechaHoraFinal DATETIME,
		@pnMicroParoSN INT,
		@pnDuracionSegundos INT,
		@ptFechaAdmSCADA DATETIME,
		@pnClaTurno INT,
		@pnClaGrupoParo INT,
		@pnClaParo INT,
		@pnClaSeccionParo INT,
		@pnClaEstatusReplica INT,
		@pnClaEventoParo INT,
		@pnClaEventoJustificacion INT,
		@pnClaEventoReasignacion INT,
		@pnClaEventoAtencion INT,
		@pnClaEventoSolucionado INT,
		@pnClaEventoCierre      INT,
		@pnIdParoProgramado     INTEGER,
        @ptFechaHoraJustificado DATETIME,
        @ptFechaHoraReasignado  DATETIME,
        @ptFechaHoraAtencion    DATETIME,
        @ptFechaHoraSolucion    DATETIME,
		@pnIdAgrupador INT,
		@pnClaUsuarioMod INT,
		@psNombrePCMod VARCHAR(64),
		@ptFechaUltimaMod DATETIME,
		@pnBajaLogica INT,
		@psComentarios VARCHAR(400),
		@psComentariosSolucion VARCHAR(400),
		@psNombreEmpleado VARCHAR(300)
AS
BEGIN

----evento justificacion misterioso----------------------------------------------------------------------
INSERT INTO [AswSch].[ASWBitBitBitacoraParo]
			([ClaUbicacion]
			,[IdComponente]
			,[IdParo]
			,[IdPOInicio]
			,[IdPOFin]
			,[IdUnidad]
			,[IdUsuario]
			,[FechaHoraInicial]
			,[FechaHoraFinal]
			,[MicroParoSN]
			,[DuracionSegundos]
			,[ClaTurno]
			,[FechaAdmSCADA]
			,[ClaGrupoParo]
			,[ClaParo]
			,[ClaSeccionParo]
			,[ClaEventoParo]
			,[ClaEventoJustificacion]
			,ClaEventoReasignacion
			,ClaEventoAtencion
			,ClaEventoSolucionado
			,ClaEventoCierre
			,ClaEstatusReplica
			,[IdParoProgramado]
			,[FechaHoraJustificado]
			,[FechaHoraReasignado]
			,[FechaHoraAtencion]
			,[FechaHoraSolucion]
			,IdAgrupador
			,[ClaUsuarioMod]
			,[NombrePCMod]
			,[FechaUltimaMod]
			,[BajaLogica]
			,[Comentarios] 
			,[ComentariosSolucion] 
			,[NombreEmpleado] 
			)
		VALUES
			(@pnClaUbicacion
			,@pnIdComponente
			,@pnIdParo
			,@pnIdPOInicio
			,@pnIdPOFin
			,@pnIdUnidad
			,@pnIdUsuario
			,@ptFechaHoraInicial
			,@ptFechaHoraFinal
			,@pnMicroParoSN
			,@pnDuracionSegundos
			,@pnClaTurno
			,@ptFechaAdmSCADA
			,@pnClaGrupoParo
			,@pnClaParo
			,@pnClaSeccionParo
			,@pnClaEventoParo
			,@pnClaEventoJustificacion--CASE WHEN @pnClaSeccionParo IS NOT NULL THEN 1 END
			,@pnClaEventoReasignacion
			,@pnClaEventoAtencion
			,@pnClaEventoSolucionado
			,@pnClaEventoCierre
			,@pnClaEstatusReplica
			,@pnIdParoProgramado     
			,@ptFechaHoraJustificado
			,@ptFechaHoraReasignado
			,@ptFechaHoraAtencion
			,@ptFechaHoraSolucion 
			,@pnIdAgrupador
			,@pnClaUsuarioMod
			,RIGHT(@psNombrePCMod+host_name(),64)
			,GETDATE()--@ptFechaUltimaMod
			,@pnBajaLogica
			,@psComentarios
			,@psComentariosSolucion
			,@psNombreEmpleado)

--Fin---------------------------------------------------------------------

	IF EXISTS (SELECT 1 FROM [AswSch].[ASWBitBitacoraParo] WHERE ClaUbicacion = @pnClaUbicacion AND IdComponente = @pnIdComponente AND IdParo = @pnIdParo AND ClaTurno = @pnClaTurno AND FechaAdmSCADA = @ptFechaAdmSCADA)
	BEGIN

		SET @psNombrePCMod = @psNombrePCMod + ' - UDP'

			
	----evento justificacion misterioso----------------------------------------------------------------------
	INSERT INTO [AswSch].[ASWBitBitBitacoraParo]
				([ClaUbicacion]
				,[IdComponente]
				,[IdParo]
				,[IdPOInicio]
				,[IdPOFin]
				,[IdUnidad]
				,[IdUsuario]
				,[FechaHoraInicial]
				,[FechaHoraFinal]
				,[MicroParoSN]
				,[DuracionSegundos]
				,[ClaTurno]
				,[FechaAdmSCADA]
				,[ClaGrupoParo]
				,[ClaParo]
				,[ClaSeccionParo]
				,[ClaEventoParo]
				,[ClaEventoJustificacion]
				,ClaEventoReasignacion
				,ClaEventoAtencion
				,ClaEventoSolucionado
				,ClaEventoCierre
				,ClaEstatusReplica
				,[IdParoProgramado]
				,[FechaHoraJustificado]
				,[FechaHoraReasignado]
				,[FechaHoraAtencion]
				,[FechaHoraSolucion]
				,IdAgrupador
				,[ClaUsuarioMod]
				,[NombrePCMod]
				,[FechaUltimaMod]
				,[BajaLogica]
				,[Comentarios] 
				,[ComentariosSolucion] 
				,[NombreEmpleado] 
				)			
			SELECT [ClaUbicacion]
			,[IdComponente]
			,[IdParo]
			,[IdPOInicio]
			,[IdPOFin]
			,[IdUnidad]
			,[IdUsuario]
			,[FechaHoraInicial]
			,[FechaHoraFinal]
			,[MicroParoSN]
			,[DuracionSegundos]
			,[ClaTurno]
			,[FechaAdmSCADA]
			,[ClaGrupoParo]
			,[ClaParo]
			,[ClaSeccionParo]
			,[ClaEventoParo]
			,[ClaEventoJustificacion]
			,ClaEventoReasignacion
			,ClaEventoAtencion
			,ClaEventoSolucionado
			,ClaEventoCierre
			,ClaEstatusReplica
			,[IdParoProgramado]
			,[FechaHoraJustificado]
			,[FechaHoraReasignado]
			,[FechaHoraAtencion]
			,[FechaHoraSolucion]
			,IdAgrupador
			,[ClaUsuarioMod]
			,[NombrePCMod] + '_before_udp'
			,[FechaUltimaMod]
			,[BajaLogica]
			,[Comentarios] 
			,[ComentariosSolucion] 
			,[NombreEmpleado] 
			FROM [AswSch].[ASWBitBitacoraParo] 
			WHERE ClaUbicacion = @pnClaUbicacion 
				AND IdComponente = @pnIdComponente 
				AND IdParo = @pnIdParo

	--Fin---------------------------------------------------------------------
		
		UPDATE [AswSch].[ASWBitBitacoraParo]
		SET [ClaPuntoMedicion] = @psClaPuntoMedicion
		    ,[Anio] = @pnAnio
		    ,[IdPOInicio] = @pnIdPOInicio
			,[IdPOFin] = @pnIdPOFin
			,[IdUnidad] = @pnIdUnidad
			,[IdUsuario] = @pnIdUsuario
			,[FechaHoraInicial] = @ptFechaHoraInicial
			,[FechaHoraFinal] = @ptFechaHoraFinal
			,[MicroParoSN] = @pnMicroParoSN
			,[DuracionSegundos] = @pnDuracionSegundos
			,[ClaTurno] = @pnClaTurno
			,[FechaAdmSCADA] = @ptFechaAdmSCADA
			,[ClaGrupoParo] = @pnClaGrupoParo
			,[ClaParo] = @pnClaParo
			,[ClaSeccionParo] = @pnClaSeccionParo
			,ClaEstatusReplica = @pnClaEstatusReplica
			,[ClaEventoParo] = @pnClaEventoParo--1 --actualizacion al registro de paro
			,[ClaEventoJustificacion] = CASE WHEN ClaEventoJustificacion in(1, 2 )
											 THEN ClaEventoJustificacion 
											 ELSE @pnClaEventoJustificacion--CASE WHEN COALESCE([ClaSeccionParo],0) <> COALESCE(@pnClaSeccionParo,0) THEN 1 ELSE [ClaEventoJustificacion] END --actualizacion en la justificacion
									    END 
			,ClaEventoReasignacion = CASE WHEN ClaEventoJustificacion = 2  AND @pnClaEventoJustificacion = 1
										  THEN 1 
										  ELSE @pnClaEventoReasignacion
									 END 
			,ClaEventoAtencion = CASE WHEN ClaEventoAtencion = 1 THEN  ClaEventoAtencion ELSE  @pnClaEventoAtencion END
			,ClaEventoSolucionado = CASE WHEN ClaEventoSolucionado = 1 THEN ClaEventoSolucionado ELSE @pnClaEventoSolucionado END 
			,ClaEventoCierre      = CASE WHEN ClaEventoCierre = 1 THEN ClaEventoCierre ELSE @pnClaEventoCierre END 
			,[FechaHoraJustificado] = @ptFechaHoraJustificado
			,[FechaHoraReasignado] = @ptFechaHoraReasignado
			,[FechaHoraAtencion] = @ptFechaHoraAtencion
			,[FechaHoraSolucion] = @ptFechaHoraSolucion
			,IdAgrupador = @pnIdAgrupador
			,[ClaUsuarioMod] = @pnClaUsuarioMod
			,[NombrePCMod] = @psNombrePCMod
			,[FechaUltimaMod] = @ptFechaUltimaMod
			,[BajaLogica] = @pnBajaLogica
			,[Comentarios] = @psComentarios
			,[ComentariosSolucion] =@psComentariosSolucion
			,[NombreEmpleado] = @psNombreEmpleado
		WHERE ClaUbicacion = @pnClaUbicacion 
			AND IdComponente = @pnIdComponente 
			AND IdParo = @pnIdParo
			AND ClaTurno = @pnClaTurno
			AND FechaAdmSCADA = @ptFechaAdmSCADA

			
	----evento justificacion misterioso----------------------------------------------------------------------
	INSERT INTO [AswSch].[ASWBitBitBitacoraParo]
				([ClaUbicacion]
				,[IdComponente]
				,[IdParo]
				,[IdPOInicio]
				,[IdPOFin]
				,[IdUnidad]
				,[IdUsuario]
				,[FechaHoraInicial]
				,[FechaHoraFinal]
				,[MicroParoSN]
				,[DuracionSegundos]
				,[ClaTurno]
				,[FechaAdmSCADA]
				,[ClaGrupoParo]
				,[ClaParo]
				,[ClaSeccionParo]
				,[ClaEventoParo]
				,[ClaEventoJustificacion]
				,ClaEventoReasignacion
				,ClaEventoAtencion
				,ClaEventoSolucionado
				,ClaEventoCierre
				,ClaEstatusReplica
				,[IdParoProgramado]
				,[FechaHoraJustificado]
				,[FechaHoraReasignado]
				,[FechaHoraAtencion]
				,[FechaHoraSolucion]
				,IdAgrupador
				,[ClaUsuarioMod]
				,[NombrePCMod]
				,[FechaUltimaMod]
				,[BajaLogica]
				,[Comentarios] 
				,[ComentariosSolucion] 
				,[NombreEmpleado] 
				)			
			SELECT [ClaUbicacion]
			,[IdComponente]
			,[IdParo]
			,[IdPOInicio]
			,[IdPOFin]
			,[IdUnidad]
			,[IdUsuario]
			,[FechaHoraInicial]
			,[FechaHoraFinal]
			,[MicroParoSN]
			,[DuracionSegundos]
			,[ClaTurno]
			,[FechaAdmSCADA]
			,[ClaGrupoParo]
			,[ClaParo]
			,[ClaSeccionParo]
			,[ClaEventoParo]
			,[ClaEventoJustificacion]
			,ClaEventoReasignacion
			,ClaEventoAtencion
			,ClaEventoSolucionado
			,ClaEventoCierre
			,ClaEstatusReplica
			,[IdParoProgramado]
			,[FechaHoraJustificado]
			,[FechaHoraReasignado]
			,[FechaHoraAtencion]
			,[FechaHoraSolucion]
			,IdAgrupador
			,[ClaUsuarioMod]
			,[NombrePCMod] + '_after_udp'
			,[FechaUltimaMod]
			,[BajaLogica]
			,[Comentarios] 
			,[ComentariosSolucion] 
			,[NombreEmpleado] 
			FROM [AswSch].[ASWBitBitacoraParo] 
			WHERE ClaUbicacion = @pnClaUbicacion 
				AND IdComponente = @pnIdComponente 
				AND IdParo = @pnIdParo

	--Fin---------------------------------------------------------------------

	END
	ELSE
	BEGIN	

		SET @psNombrePCMod = @psNombrePCMod + ' - INS'
		

			
	----evento justificacion misterioso----------------------------------------------------------------------
	INSERT INTO [AswSch].[ASWBitBitBitacoraParo]
				([ClaUbicacion]
				,[IdComponente]
				,[IdParo]
				,[IdPOInicio]
				,[IdPOFin]
				,[IdUnidad]
				,[IdUsuario]
				,[FechaHoraInicial]
				,[FechaHoraFinal]
				,[MicroParoSN]
				,[DuracionSegundos]
				,[ClaTurno]
				,[FechaAdmSCADA]
				,[ClaGrupoParo]
				,[ClaParo]
				,[ClaSeccionParo]
				,[ClaEventoParo]
				,[ClaEventoJustificacion]
				,ClaEventoReasignacion
				,ClaEventoAtencion
				,ClaEventoSolucionado
				,ClaEventoCierre
				,ClaEstatusReplica
				,[IdParoProgramado]
				,[FechaHoraJustificado]
				,[FechaHoraReasignado]
				,[FechaHoraAtencion]
				,[FechaHoraSolucion]
				,IdAgrupador
				,[ClaUsuarioMod]
				,[NombrePCMod]
				,[FechaUltimaMod]
				,[BajaLogica]
				,[Comentarios] 
				,[ComentariosSolucion] 
				,[NombreEmpleado] 
				)
			SELECT [ClaUbicacion]
			,[IdComponente]
			,[IdParo]
			,[IdPOInicio]
			,[IdPOFin]
			,[IdUnidad]
			,[IdUsuario]
			,[FechaHoraInicial]
			,[FechaHoraFinal]
			,[MicroParoSN]
			,[DuracionSegundos]
			,[ClaTurno]
			,[FechaAdmSCADA]
			,[ClaGrupoParo]
			,[ClaParo]
			,[ClaSeccionParo]
			,[ClaEventoParo]
			,[ClaEventoJustificacion]
			,ClaEventoReasignacion
			,ClaEventoAtencion
			,ClaEventoSolucionado
			,ClaEventoCierre
			,ClaEstatusReplica
			,[IdParoProgramado]
			,[FechaHoraJustificado]
			,[FechaHoraReasignado]
			,[FechaHoraAtencion]
			,[FechaHoraSolucion]
			,IdAgrupador
			,[ClaUsuarioMod]
			,[NombrePCMod] + '_before_ins'
			,[FechaUltimaMod]
			,[BajaLogica]
			,[Comentarios] 
			,[ComentariosSolucion] 
			,[NombreEmpleado] 
			FROM [AswSch].[ASWBitBitacoraParo] 
			WHERE ClaUbicacion = @pnClaUbicacion 
				AND IdComponente = @pnIdComponente 
				AND IdParo = @pnIdParo

	--Fin---------------------------------------------------------------------

		INSERT INTO [AswSch].[ASWBitBitacoraParo]
			([ClaUbicacion]
			,[IdComponente]
			,[IdParo]
			,[ClaPuntoMedicion]
			,[Anio]
			,[IdPOInicio]
			,[IdPOFin]
			,[IdUnidad]
			,[IdUsuario]
			,[FechaHoraInicial]
			,[FechaHoraFinal]
			,[MicroParoSN]
			,[DuracionSegundos]
			,[ClaTurno]
			,[FechaAdmSCADA]
			,[ClaGrupoParo]
			,[ClaParo]
			,[ClaSeccionParo]
			,[ClaEventoParo]
			,[ClaEventoJustificacion]
			,ClaEventoReasignacion
			,ClaEventoAtencion
			,ClaEventoSolucionado
			,ClaEventoCierre
			,ClaEstatusReplica
			,[IdParoProgramado]
			,[FechaHoraJustificado]
			,[FechaHoraReasignado]
			,[FechaHoraAtencion]
			,[FechaHoraSolucion]
			,IdAgrupador
			,[ClaUsuarioMod]
			,[NombrePCMod]
			,[FechaUltimaMod]
			,[BajaLogica]
			,[Comentarios] 
			,[ComentariosSolucion] 
			,[NombreEmpleado] 
			)
		VALUES
			(@pnClaUbicacion
			,@pnIdComponente
			,@pnIdParo
			,@psClaPuntoMedicion
			,@pnAnio
			,@pnIdPOInicio
			,@pnIdPOFin
			,@pnIdUnidad
			,@pnIdUsuario
			,@ptFechaHoraInicial
			,@ptFechaHoraFinal
			,@pnMicroParoSN
			,@pnDuracionSegundos
			,@pnClaTurno
			,@ptFechaAdmSCADA
			,@pnClaGrupoParo
			,@pnClaParo
			,@pnClaSeccionParo
			,@pnClaEventoParo
			,@pnClaEventoJustificacion--CASE WHEN @pnClaSeccionParo IS NOT NULL THEN 1 END
			,@pnClaEventoReasignacion
			,@pnClaEventoAtencion
			,@pnClaEventoSolucionado
			,@pnClaEventoCierre
			,@pnClaEstatusReplica
			,@pnIdParoProgramado     
			,@ptFechaHoraJustificado
			,@ptFechaHoraReasignado
			,@ptFechaHoraAtencion
			,@ptFechaHoraSolucion 
			,@pnIdAgrupador
			,@pnClaUsuarioMod
			,@psNombrePCMod
			,@ptFechaUltimaMod
			,@pnBajaLogica
			,@psComentarios
			,@psComentariosSolucion
			,@psNombreEmpleado)

			
	----evento justificacion misterioso----------------------------------------------------------------------
	INSERT INTO [AswSch].[ASWBitBitBitacoraParo]
				([ClaUbicacion]
				,[IdComponente]
				,[IdParo]
				,[IdPOInicio]
				,[IdPOFin]
				,[IdUnidad]
				,[IdUsuario]
				,[FechaHoraInicial]
				,[FechaHoraFinal]
				,[MicroParoSN]
				,[DuracionSegundos]
				,[ClaTurno]
				,[FechaAdmSCADA]
				,[ClaGrupoParo]
				,[ClaParo]
				,[ClaSeccionParo]
				,[ClaEventoParo]
				,[ClaEventoJustificacion]
				,ClaEventoReasignacion
				,ClaEventoAtencion
				,ClaEventoSolucionado
				,ClaEventoCierre
				,ClaEstatusReplica
				,[IdParoProgramado]
				,[FechaHoraJustificado]
				,[FechaHoraReasignado]
				,[FechaHoraAtencion]
				,[FechaHoraSolucion]
				,IdAgrupador
				,[ClaUsuarioMod]
				,[NombrePCMod]
				,[FechaUltimaMod]
				,[BajaLogica]
				,[Comentarios] 
				,[ComentariosSolucion] 
				,[NombreEmpleado] 
				)
			SELECT [ClaUbicacion]
			,[IdComponente]
			,[IdParo]
			,[IdPOInicio]
			,[IdPOFin]
			,[IdUnidad]
			,[IdUsuario]
			,[FechaHoraInicial]
			,[FechaHoraFinal]
			,[MicroParoSN]
			,[DuracionSegundos]
			,[ClaTurno]
			,[FechaAdmSCADA]
			,[ClaGrupoParo]
			,[ClaParo]
			,[ClaSeccionParo]
			,[ClaEventoParo]
			,[ClaEventoJustificacion]
			,ClaEventoReasignacion
			,ClaEventoAtencion
			,ClaEventoSolucionado
			,ClaEventoCierre
			,ClaEstatusReplica
			,[IdParoProgramado]
			,[FechaHoraJustificado]
			,[FechaHoraReasignado]
			,[FechaHoraAtencion]
			,[FechaHoraSolucion]
			,IdAgrupador
			,[ClaUsuarioMod]
			,[NombrePCMod] + '_after_ins'
			,[FechaUltimaMod]
			,[BajaLogica]
			,[Comentarios] 
			,[ComentariosSolucion] 
			,[NombreEmpleado] 
			FROM [AswSch].[ASWBitBitacoraParo] 
			WHERE ClaUbicacion = @pnClaUbicacion 
				AND IdComponente = @pnIdComponente 
				AND IdParo = @pnIdParo

	--Fin---------------------------------------------------------------------

	END
END

