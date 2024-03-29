--USE [ASW]
--GO
/****** Object:  StoredProcedure [AswSch].[ASW_CU204_Pag1_ReplicaParos_Proc]    Script Date: 15/11/2022 02:21:46 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/*
* MRODRIGUEZC
* 2020/07/31
* envia la informacion de Andon a MCSW
*/
/*
begin tran

EXECUTE [AswSch].[ASW_CU204_Pag1_ReplicaParos_Proc]
select * from  [AswSch].[AswBitBitacoraParo] where claEstatusReplica=2
	AND [FechaAdmSCADA]> dateadd(day, -14, getdate())

SELECT * FROM [MSW_LNKSVR].[MCSW_ERP].MSWSch.MSWPAITraRegistraEventoAndonSrv where esParo=1

rollback tran
*/
ALTER  PROCEDURE [AswSch].[ASW_CU204_Pag1_ReplicaParos_Proc]
	@PnDebug int = 0
AS
BEGIN
SET NOCOUNT ON

	

	DECLARE
		 @nId INT
		,@nClaUbicacion INT
		,@sIdCelda VARCHAR(30)
		,@nIdNumDepto INT
		,@nClaveCelda VARCHAR(30)
		,@nClaMaquina INT
		,@nTipoAlerta INT
		,@nIdParo INT -- id unico en Avisor
		,@tFecha DATETIME -- FechaAdministrativa
		,@nClaTurno INT
		,@tFechaHoraInicial DATETIME
		,@tFechaHoraFinal DATETIME
		,@tFechaHoraJustificacion DATETIME
		,@tFechaHoraReasignacion DATETIME
		,@tFechaHoraAtencion DATETIME
		,@tFechaHoraSolucion DATETIME
		,@nEsMicroParo INT
		,@nDuracionSegundos INT
		,@nClaSeccionParo INT -- justificacion
		,@nClaEstatusReplica INT
		,@nClaEventoParo INT
		,@nClaEventoJustificacion INT
		,@nClaEventoReasignacion INT
		,@nClaEventoAtencion INT
		,@nClaEventoSolucionado INT
		,@nClaEventoCierre INT
		,@nClaArticulo INT
		,@nClaUsuarioMod INT -- idUsuario operador
		,@sNombrePcMod VARCHAR(64)
		,@tFechaUltimaMod DATETIME
	    ,@sError	VARCHAR(500)
		,@nClaTipoSeguimientoAlerta  INT
		,@nClaGpoParo INT
		,@sComentarios VARCHAR(400)
		,@sComentariosSolucion VARCHAR(400)
		,@sNombreEmpleado VARCHAR(300)
		,@nStatusError INT 
        ,@sMsgError    VARCHAR(500)
		,@nIdReporteAndon			INT
		,@nIdAgrupador  INT
		,@nEsDesactivaNotificacion TINYINT
		,@nCorreoEnviado		TINYINT
		,@sSub		VARCHAR(55) = 'Error Replica Paro '+CAST(CURRENT_TIMESTAMP AS varchar)
		,@sTitulo	VARCHAR(1000) = '<table width=100%><tr class="header" style="background-color:#304f60; font-family:Arial;color:#FFFFFF;font-size:18px;font-weight:bold;">'+    
										'<th style="width: 60%; ">Alerta de paros con errores en su replica al ERP</th>'+
									'</table>'
		,@sMensaje	VARCHAR(max) = '<table border="1" bordercolor="#eeeeee" width=100% style="table-layout: fixed; word-wrap: break-word; font-size:11px; padding:3px">'+
										'<tr style="background-color:#DBDBDB; font-family:Arial; border-collapse:collapse; font-weight:550;">'+
											'<th>IdAvisor</th>'+
											'<th>Celda</th>'+
											'<th>Máquina</th>'+
											'<th>ClaTurno</th>'+
											'<th>FechaHoraInicial</th>'+
											'<th>FechaHoraFinal</th>'+
											'<th>Micro Paro</th>'+
											'<th>Error</th></tr>'

	DECLARE @ParosCondicionador TABLE(
		Id					INT,
		IdParo				INT,
		ClaCelda			VARCHAR(30),
		ClaMaquina		INT,
		ClaTurno			SMALLINT,
		FechaHoraInicial	DATETIME,
		FechaHoraFinal		DATETIME,
		MicroParo			TINYINT,
		Error				VARCHAR(500))


	DECLARE @Paro TABLE(
		 Id INT
		,ClaUbicacion INT
		,IdCelda VARCHAR(30)
		,ClaMaquina INT
		,IdParo INT -- id unico en Avisor
		,Fecha DATETIME -- FechaAdministrativa
		,ClaTurno INT
		,FechaHoraInicial DATETIME
		,FechaHoraFinal DATETIME
		,FechaHoraJustificacion DATETIME
		,FechaHoraReasignacion DATETIME
		,FechaHoraAtencion DATETIME
		,FechaHoraSolucion DATETIME
		,EsMicroParo INT
		,DuracionSegundos INT
		,ClaSeccionParo INT -- justificacion
		,ClaEstatusReplica INT
		,ClaEventoParo INT
		,ClaEventoJustificacion INT
		,ClaEventoReasignacion INT
		,ClaEventoAtencion INT
		,ClaEventoSolucionado INT
		,ClaEventoCierre INT
		,ClaArticulo INT
		,ClaUsuarioMod INT -- idUsuario operador
		,NombrePcMod VARCHAR(64)
		,FechaUltimaMod DATETIME
		,ClaTipoSeguimientoAlerta  INT
		,ClaGpoParo INT
		,Comentarios VARCHAR(400)
		,ComentariosSolucion VARCHAR(400)
		,NombreEmpleado VARCHAR(300)
		,IdReporteAndon		INT
		,CorreoEnviado		TINYINT
		,IdAgrupador        INT
	)
	
	INSERT INTO @Paro(
		  Id							
		,ClaUbicacion 
		,IdCelda 
		,ClaMaquina 
		,IdParo 
		,Fecha 
		,ClaTurno 
		,FechaHoraInicial
		,FechaHoraFinal
		,FechaHoraJustificacion 
		,FechaHoraReasignacion 
		,FechaHoraAtencion 
		,FechaHoraSolucion 
		,EsMicroParo
		,DuracionSegundos 
		,ClaSeccionParo  
		,ClaEstatusReplica 
		,ClaEventoParo 
		,ClaEventoJustificacion 
		,ClaEventoReasignacion 
		,ClaEventoAtencion 
		,ClaEventoSolucionado 
		,ClaEventoCierre
		,ClaArticulo 
		,ClaUsuarioMod  
		,NombrePcMod
		,FechaUltimaMod 
		,ClaTipoSeguimientoAlerta  
		,ClaGpoParo 
		,Comentarios 
		,ComentariosSolucion 
		,NombreEmpleado 
		,IdReporteAndon
		,CorreoEnviado
		,IdAgrupador
	)
	SELECT P.Id
		,P.ClaUbicacion
		,M.IdWorkCenter
		,P.IdComponente
		,P.Id
		,P.FechaAdmScada
		,P.ClaTurno
		,P.FechaHoraInicial
		,P.FechaHoraFinal
		,P.FechaHoraJustificado
		,P.FechaHoraReasignado
		,P.FechaHoraAtencion
		,P.FechaHoraSolucion
		,P.MicroParoSN
		,P.DuracionSegundos
		,COALESCE(P.ClaSeccionParo, -1)
		,[ClaEstatusReplica]
		,P.ClaEventoParo
		,P.ClaEventoJustificacion
		,P.ClaEventoReasignacion
		,P.ClaEventoAtencion
		,P.ClaEventoSolucionado
		,P.ClaEventoCierre
		,PO.ClaArticulo
		,P.ClaUsuarioMod
		,P.NombrePcMod
		,P.FechaUltimaMod
		,CTSA.ClaTipoSeguimientoAlerta  
		,rtg.ClaGpoParo
		,Comentarios = ISNULL(NULLIF(P.Comentarios,''),'-')
		,ComentariosSolucion = ISNULL(NULLIF(P.ComentariosSolucion,''),'-')
		,NombreEmpleado = ISNULL(NULLIF(P.NombreEmpleado,''),'-')
		,P.IdErpMsw
		,CorreoEnviado = ISNULL(P.EnvioCorreoSN, 0)
		,IdAgrupador
	FROM [AswSch].[AswBitBitacoraParo] P
	JOIN [AswSch].[AswCatWorkUnitVw] M
		ON P.IdComponente = M.ClaMaquina
	LEFT JOIN [AswSch].[ASWTraOrdenProduccion] PO
		ON P.ClaUbicacion = PO.ClaUbicacion
		AND P.IdPOInicio = PO.IdPO
	LEFT JOIN AswSch.AswCatSeccionParo SP
		ON P.ClaSeccionParo = SP.ClaSeccionParo
		AND P.ClaUbicacion = SP.ClaUbicacion
	LEFT JOIN AswSch.AswRelAlertaSeccionParoMCSW RASP
		ON SP.ClaUbicacion = RASP.ClaUbicacion
		AND SP.ClaArea = RASP.ClaArea
		AND SP.ClaSeccionParo = RASP.ClaSeccionParo
	LEFT JOIN AswSch.AswRelAlertaTipoSeguimientoAlertaMCSW RATSA
		ON RASP.ClaUbicacion = RATSA.ClaUbicacion
		AND RASP.ClaAlerta = RATSA.ClaAlerta
	LEFT JOIN AswSch.ASWCatTipoSeguimientoAlertaMCSW CTSA
		ON RATSA.ClaUbicacion = CTSA.ClaUbicacion
		AND RATSA.ClaTipoSeguimientoAlerta = CTSA.ClaTipoSeguimientoAlerta
	LEFT JOIN AswSch.ASWRelTipoParoGpoParo rtg
       on sp.IdTipoParoGpoParo=rtg.IdTipoParoGpoParo
       AND SP.ClaSeccionParo   = rtg.ClaTipoParo
	WHERE (ClaEstatusReplica = 1
	AND  [FechaAdmSCADA]> dateadd(day, -14, getdate())
	AND ( @@SERVERNAME = 'DCSDTII02\SQL2012' OR (IdWorkCenter IN (112,33,34,35,37)))
	AND P.ClaTurno > 0 
	AND P.MicroParoSN = 0) 
	OR
	--a partir del turno 1, a 14 dias de la liberacion se puede mover a la condicion anterior
	(ClaEstatusReplica = 1
	AND  [FechaAdmSCADA]> dateadd(day, -14, getdate())
	AND ( @@SERVERNAME = 'DCSDTII02\SQL2012' OR (IdWorkCenter IN (28,29,30,31,38,110)))
	AND FechaHoraInicial>='2022-08-18 07:00:00' 
	AND P.ClaTurno > 0
	AND P.MicroParoSN = 0)
	
	

	
	
	--no evaluar columnas de baja logica de catalogos en 'reportes'
	--si es left no se pone en el where
	--AND  SP.BajaLogica=0
	--AND  RASP.BajaLogica=0
	--AND  RATSA.BajaLogica=0
	--AND  CTSA.BajaLogica=0
	--AND  P.BajaLogica = 0
	

	SELECT @nId = MIN(id)
	FROM @Paro

	WHILE @nId IS NOT NULL
	BEGIN
		SET @nIdReporteAndon = NULL;

		SELECT @nClaUbicacion = ClaUbicacion
			,@sIdCelda = IdCelda
			,@nClaMaquina = ClaMaquina
			,@nTipoAlerta = 1--1 - Nuevo Paro, 2 - Justificacion, 3 - Atencion, 4 - Solucion , 5.- Reasignacion 
			,@nIdParo = IdParo
			,@tFecha = Fecha
			,@nClaTurno = ClaTurno
			,@tFechaHoraInicial = FechaHoraInicial
			,@tFechaHoraFinal = FechaHoraFinal
			,@tFechaHoraJustificacion = FechaHoraJustificacion
			,@tFechaHoraReasignacion = FechaHoraReasignacion
			,@tFechaHoraAtencion = FechaHoraAtencion
			,@tFechaHoraFinal = FechaHoraFinal
			,@nEsMicroParo = EsMicroParo
			,@nDuracionSegundos = DuracionSegundos
			,@nClaSeccionParo = ClaSeccionParo
			,@nClaSeccionParo  = ClaSeccionParo 
			,@nClaEstatusReplica  = ClaEstatusReplica 
			,@nClaEventoParo  = ClaEventoParo
			,@nClaEventoJustificacion = ClaEventoJustificacion
			,@nClaEventoReasignacion  = ClaEventoReasignacion 
			,@nClaEventoAtencion  = ClaEventoAtencion 
			,@nClaEventoSolucionado  = ClaEventoSolucionado 
			,@nClaEventoCierre = ClaEventoCierre
			,@nClaArticulo = ClaArticulo
			,@nClaUsuarioMod = ClaUsuarioMod
			,@sNombrePcMod = NombrePcMod
			,@tFechaUltimaMod = FechaUltimaMod
			,@nClaTipoSeguimientoAlerta  = ClaTipoSeguimientoAlerta
			,@nClaGpoParo = ClaGpoParo
			,@sComentarios  = Comentarios
			,@sComentariosSolucion = ComentariosSolucion
			,@sNombreEmpleado = NombreEmpleado
			,@nStatusError = NULL
			,@sMsgError = NULL
			,@nIdReporteAndon = IdReporteAndon
			,@nCorreoEnviado  = CorreoEnviado
			,@nIdAgrupador = IdAgrupador
		FROM @Paro
		WHERE Id = @nId		

		IF(@tFechaHoraReasignacion = '1900-01-01')
		BEGIN
			SELECT @tFechaHoraReasignacion = @tFechaHoraInicial;
		END
		IF(@tFechaHoraAtencion = '1900-01-01')
		BEGIN
			SELECT @tFechaHoraAtencion = @tFechaHoraInicial;
		END
		IF(@tFechaHoraFinal = '1900-01-01')
		BEGIN
			SELECT @tFechaHoraFinal = @tFechaHoraInicial;
		END
		IF(@tFechaHoraJustificacion = '1900-01-01')
		BEGIN
			SELECT @tFechaHoraJustificacion = @tFechaHoraInicial;
		END
	
		SELECT @nIdNumDepto = ClaDepartamento
			,@nClaveCelda = ClaveWorkCenter
		FROM [AswSch].[AswCatWorkCenterVw]
		WHERE IdWorkCenter = @sIdCelda


			IF ISNULL(@nClaEventoCierre ,0) = 0 --SINO ES UN PARO CERRADO EN AUTOMATICO
			BEGIN
				print 'No es automatico'
				IF @nClaEventoParo = 1
				BEGIN 
					--RETURN 

					--NGP 2022-03-17 COMENTO LA LLAMADA AL SERVICIO YA QUE EN EL ERP NO CREAN PAROS HASTA QUE TIENEN LA JUSTIFICACION

					--EXEC [MSW_LNKSVR].[MCSW_ERP].[MSWSch].[MswPAIRegistraEventoAndonSCADASrv] 
					--	@pnClaUbicacion = @nClaUbicacion
					--	--,@psIdCelda = @sIdCelda
					--	,@pnIdNumDepto = @nIdNumDepto
					--	,@pnClaveCelda = @nClaveCelda 
					--	,@pnIdComponente = @nClaMaquina--(CatWorkUnitVw)
					--	,@pnIdEvento = @nId --Id SqlServer (Paro/IdAndon Avisor)
					--	,@pnTipoAlerta = 1 --1 - Nuevo Paro, 2 - Justificacion, 3 - Atencion, 4 - Solucion , 5.- Reasignacion 
					--	,@ptFechaAdm = @tFecha
					--	,@pnClaTurno = @nClaTurno
					--	,@ptFechaHoraInicial = @tFechaHoraInicial
					--	,@ptFechaHoraJustificacion = @tFechaHoraJustificacion
					--	--,@ptFechaHoraReasignacion = @tFechaHoraReasignacion
					--	,@ptFechaHoraAtencion = @tFechaHoraAtencion
					--	,@ptFechaHoraFinal = @tFechaHoraFinal
					--	,@pnEsparo = 1
					--	,@pnEsMicroparo = @nEsMicroParo
					--	,@pnDuracionSegundos = @nDuracionSegundos
					--	,@pnClaSeccionParo = @nClaSeccionParo
					--	,@pnClaArticulo = @nClaArticulo
					--	,@pnClaUsuarioMod = @nClaUsuarioMod
					--	,@psNombrePcMod = @sNombrePcMod
					--	,@ptFechaUltimaMod  = @tFechaUltimaMod 

					UPDATE [AswSch].[AswBitBitacoraParo] 
					SET ClaEventoParo = 2
					WHERE Id = @nId
				END

				IF @nClaEventoJustificacion = 1
				BEGIN 
					print 'justificacion' 
					print @sComentarios

					IF (@nIdAgrupador IS NOT NULL) 
							AND NOT EXISTS (SELECT 1 
											FROM [AswSch].[AswBitBitacoraParo] P
											JOIN [AswSch].[AswCatWorkUnitVw] M
												ON P.IdComponente = M.ClaMaquina
											WHERE P.IdAgrupador = @nIdAgrupador
												AND M.IdWorkCenter = @sIdCelda
												AND P.IdErpMsw IS NOT NULL)
					BEGIN
						SET @nEsDesactivaNotificacion = 0
					END
					ELSE 
					BEGIN
						SET @nEsDesactivaNotificacion = 1
					END

					--DEACTIVAR NOTIFICACION PARA PAROS CON RAZON "SHIFT STARTUP"
					IF @nClaSeccionParo = 185
					BEGIN
						SET @nEsDesactivaNotificacion = 1
					END
					
					IF @PnDebug = 1
					BEGIN 
						
						SELECT @nId as Id
						,@nIdParo as IdParo
						,@nIdAgrupador as IdAgrupador
						,@nEsDesactivaNotificacion as EsDesactivaNotificacion 

						print 'EXEC [MSW_LNKSVR].[MCSW_ERP].[MSWSch].[MswPAIRegistraEventoAndonSCADASrv]'
							+'@pnClaUbicacion = ' + ISNULL(CAST(@nClaUbicacion AS VARCHAR),'null')
							+'--,@psIdCelda = '   + ISNULL(CAST(@sIdCelda AS VARCHAR),'null')
							+',@pnIdNumDepto = '  + ISNULL(CAST(@nIdNumDepto AS VARCHAR),'null')
							+',@pnClaveCelda = '  + ISNULL(CAST(@nClaveCelda AS VARCHAR),'null')
							+',@pnIdComponente = '+ ISNULL(CAST(@nClaMaquina AS VARCHAR),'null')--(CatWorkUnitVw)
							+',@pnIdEvento = '    + ISNULL(CAST(@nId AS VARCHAR),'null') --Id SqlServer (Paro/IdAndon Avisor)
							+',@pnTipoAlerta = 2'--1 - Nuevo Paro, 2 - Justificacion, 3 - Atencion, 4 - Solucion , 5.- Reasignacion 
							+',@ptFechaAdm = '    + ISNULL(CAST(@tFecha AS VARCHAR),'null')
							+',@pnClaTurno = '    + ISNULL(CAST(@nClaTurno AS VARCHAR),'null')
							+',@ptFechaHoraInicial = '+ ISNULL(CAST(@tFechaHoraInicial AS VARCHAR),'null')
							+',@ptFechaHoraJustificacion = ' + ISNULL(CAST(@tFechaHoraJustificacion AS VARCHAR),'null')
							+'--,@ptFechaHoraReasignacion = '+ ISNULL(CAST(@tFechaHoraReasignacion AS VARCHAR),'null')
							+',@ptFechaHoraAtencion = null'--+ ISNULL(CAST(@tFechaHoraAtencion AS VARCHAR),'null')
							+',@ptFechaHoraFinal = null'   --+ ISNULL(CAST(@tFechaHoraFinal AS VARCHAR),'null')
							+',@pnEsparo = 1'
							+',@pnEsMicroparo = '+ISNULL(CAST(@nEsMicroParo AS VARCHAR),'null')
							+',@pnDuracionSegundos = '+ISNULL(CAST(@nDuracionSegundos AS VARCHAR),'null')
							+',@pnClaSeccionParo = '+ISNULL(CAST(@nClaSeccionParo AS VARCHAR),'null')
							+',@pnClaArticulo = '+ISNULL(CAST(@nClaArticulo AS VARCHAR),'null')
							+',@pnClaUsuarioMod = '+ISNULL(CAST(@nClaUsuarioMod AS VARCHAR),'null')
							+',@psNombrePcMod = '+ISNULL(CAST(@sNombrePcMod AS VARCHAR),'null')
							+',@ptFechaUltimaMod  = '+ISNULL(CAST(@tFechaUltimaMod  AS VARCHAR),'null')
							+',@pnClaTipoSeguimientoAlerta  = '+ISNULL(CAST(@nClaTipoSeguimientoAlerta AS VARCHAR),'null')
							+',@pnClaGpoParo          = '+ISNULL(CAST(@nClaGpoParo AS VARCHAR),'null')
							+',@psComentarios         = '+ISNULL(CAST(@sComentarios AS VARCHAR),'null')
							+',@psComentariosSolucion = '+ISNULL(CAST(@sComentariosSolucion AS VARCHAR),'null')
							+',@psNombreEmpleado      = '+ISNULL(CAST(@sNombreEmpleado AS VARCHAR),'null')
							+',@pnStatusError  = @nStatusError OUT'
							+',@psMsgError     = @sMsgError OUT'
							+',@pnIdReporteAndon		= @nIdReporteAndon OUT'
							+',@pnEsDesactivaNotificacion ='+ ISNULL(CAST(@nEsDesactivaNotificacion AS VARCHAR),'null')
						
					END 

					BEGIN TRAN
					BEGIN TRY
						EXEC [MSW_LNKSVR].[MCSW_ERP].[MSWSch].[MswPAIRegistraEventoAndonSCADASrv]
							@pnClaUbicacion = @nClaUbicacion
							--,@psIdCelda = @sIdCelda
							,@pnIdNumDepto = @nIdNumDepto
							,@pnClaveCelda = @nClaveCelda 
							,@pnIdComponente = @nClaMaquina--(CatWorkUnitVw)
							,@pnIdEvento = @nId --Id SqlServer (Paro/IdAndon Avisor)
							,@pnTipoAlerta = 2--1 - Nuevo Paro, 2 - Justificacion, 3 - Atencion, 4 - Solucion , 5.- Reasignacion 
							,@ptFechaAdm = @tFecha
							,@pnClaTurno = @nClaTurno
							,@ptFechaHoraInicial = @tFechaHoraInicial
							,@ptFechaHoraJustificacion = @tFechaHoraJustificacion
							--,@ptFechaHoraReasignacion = @tFechaHoraReasignacion
							,@ptFechaHoraAtencion = null --@tFechaHoraAtencion
							,@ptFechaHoraFinal    = null -- @tFechaHoraFinal
							,@pnEsparo = 1
							,@pnEsMicroparo = @nEsMicroParo
							,@pnDuracionSegundos = @nDuracionSegundos
							,@pnClaSeccionParo = @nClaSeccionParo
							,@pnClaArticulo = @nClaArticulo
							,@pnClaUsuarioMod = @nClaUsuarioMod
							,@psNombrePcMod = @sNombrePcMod
							,@ptFechaUltimaMod  = @tFechaUltimaMod 
							,@pnClaTipoSeguimientoAlerta  = @nClaTipoSeguimientoAlerta
							,@pnClaGpoParo          = @nClaGpoParo
							,@psComentarios         = @sComentarios
							,@psComentariosSolucion = @sComentariosSolucion
							,@psNombreEmpleado      = @sNombreEmpleado
							,@pnStatusError  = @nStatusError OUT
							,@psMsgError     = @sMsgError OUT
							,@pnIdReporteAndon				= @nIdReporteAndon OUT
							,@pnEsDesactivaNotificacion = 1--@nEsDesactivaNotificacion 
					
						UPDATE [AswSch].[AswBitBitacoraParo] 
						SET  ClaEventoJustificacion = 2
						    ,StatusError  = @nStatusError 
							,MsgErrorJustificacion     = 'Justificacion- '+@sMsgError 
							,IdErpMsw     = @nIdReporteAndon
						WHERE Id = @nId
					
					COMMIT
					END TRY
					BEGIN CATCH
						--	print @sError
						--	print @nStatusError
							ROLLBACK
							SELECT @sError = ERROR_MESSAGE()
							print @sError
							UPDATE [AswSch].[AswBitBitacoraParo] 
							SET  ClaEstatusReplica = 1
								,MsgErrorJustificacion = 'Justificacion- '+@sError
								,StatusError = -1
							WHERE Id = @nId

							IF(@nCorreoEnviado = 0)
							BEGIN
		
								INSERT INTO @ParosCondicionador(Id,
																IdParo,
																ClaCelda,
																ClaMaquina,
																ClaTurno,
																FechaHoraInicial,
																FechaHoraFinal,
																MicroParo,
																Error)
								SELECT @nId,
											@nIdParo,
											@nClaveCelda,
											@nClaMaquina,
											@nClaTurno,
											@tFechaHoraInicial,
											@tFechaHoraFinal,
											@nEsMicroParo,
											@sError

								UPDATE AswSch.AswBitBitacoraParo
									SET EnvioCorreoSN = 1
									WHERE Id = @nId

							END
					END CATCH
				END

				IF @nClaEventoReasignacion = 1
				BEGIN 

					IF (@nIdAgrupador IS NOT NULL) 
							AND NOT EXISTS (SELECT 1 
											FROM [AswSch].[AswBitBitacoraParo] P
											JOIN [AswSch].[AswCatWorkUnitVw] M
												ON P.IdComponente = M.ClaMaquina
											WHERE P.IdAgrupador = @nIdAgrupador
												AND M.IdWorkCenter = @sIdCelda
												AND P.ClaEventoReasignacion = 2)
					BEGIN
						SET @nEsDesactivaNotificacion = 0
					END
					ELSE 
					BEGIN
						SET @nEsDesactivaNotificacion = 1
					END

					--DEACTIVAR NOTIFICACION PARA PAROS CON RAZON "SHIFT STARTUP"
					IF @nClaSeccionParo = 185
					BEGIN
						SET @nEsDesactivaNotificacion = 1
					END
					
					IF @PnDebug = 1
					BEGIN 

						SELECT @nId as Id
							  ,@nIdParo as IdParo
							  ,@nIdAgrupador as IdAgrupador
							  ,@nEsDesactivaNotificacion as EsDesactivaNotificacion 

						print 'EXEC [MSW_LNKSVR].[MCSW_ERP].[MSWSch].[MswPAIRegistraEventoAndonSCADASrv]'
							+'@pnClaUbicacion = ' + ISNULL(CAST(@nClaUbicacion AS VARCHAR),'null')
							+'--,@psIdCelda = '   + ISNULL(CAST(@sIdCelda AS VARCHAR),'null')
							+',@pnIdNumDepto = '  + ISNULL(CAST(@nIdNumDepto AS VARCHAR),'null')
							+',@pnClaveCelda = '  + ISNULL(CAST(@nClaveCelda AS VARCHAR),'null')
							+',@pnIdComponente = '+ ISNULL(CAST(@nClaMaquina AS VARCHAR),'null')--(CatWorkUnitVw)
							+',@pnIdEvento = '    + ISNULL(CAST(@nId AS VARCHAR),'null') --Id SqlServer (Paro/IdAndon Avisor)
							+',@pnTipoAlerta = 5'--1 - Nuevo Paro, 2 - Justificacion, 3 - Atencion, 4 - Solucion , 5.- Reasignacion 
							+',@ptFechaAdm = '    + ISNULL(CAST(@tFecha AS VARCHAR),'null')
							+',@pnClaTurno = '    + ISNULL(CAST(@nClaTurno AS VARCHAR),'null')
							+',@ptFechaHoraInicial = '+ ISNULL(CAST(@tFechaHoraInicial AS VARCHAR),'null')
							+',@ptFechaHoraJustificacion = ' + ISNULL(CAST(@tFechaHoraJustificacion AS VARCHAR),'null')
							+'--,@ptFechaHoraReasignacion = '+ ISNULL(CAST(@tFechaHoraReasignacion AS VARCHAR),'null')
							+',@ptFechaHoraAtencion = null'--+ ISNULL(CAST(@tFechaHoraAtencion AS VARCHAR),'null')
							+',@ptFechaHoraFinal = null'   --+ ISNULL(CAST(@tFechaHoraFinal AS VARCHAR),'null')
							+',@pnEsparo = 1'
							+',@pnEsMicroparo = '+ISNULL(CAST(@nEsMicroParo AS VARCHAR),'null')
							+',@pnDuracionSegundos = '+ISNULL(CAST(@nDuracionSegundos AS VARCHAR),'null')
							+',@pnClaSeccionParo = '+ISNULL(CAST(@nClaSeccionParo AS VARCHAR),'null')
							+',@pnClaArticulo = '+ISNULL(CAST(@nClaArticulo AS VARCHAR),'null')
							+',@pnClaUsuarioMod = '+ISNULL(CAST(@nClaUsuarioMod AS VARCHAR),'null')
							+',@psNombrePcMod = '+ISNULL(CAST(@sNombrePcMod AS VARCHAR),'null')
							+',@ptFechaUltimaMod  = '+ISNULL(CAST(@tFechaUltimaMod  AS VARCHAR),'null')
							+',@pnClaTipoSeguimientoAlerta  = '+ISNULL(CAST(@nClaTipoSeguimientoAlerta AS VARCHAR),'null')
							+',@pnClaGpoParo          = '+ISNULL(CAST(@nClaGpoParo AS VARCHAR),'null')
							+',@psComentarios         = '+ISNULL(CAST(@sComentarios AS VARCHAR),'null')
							+',@psComentariosSolucion = '+ISNULL(CAST(@sComentariosSolucion AS VARCHAR),'null')
							+',@psNombreEmpleado      = '+ISNULL(CAST(@sNombreEmpleado AS VARCHAR),'null')
							+',@pnStatusError  = @nStatusError OUT'
							+',@psMsgError     = @sMsgError OUT'
							+',@pnIdReporteAndon		= @nIdReporteAndon OUT'
							+',@pnEsDesactivaNotificacion ='+ ISNULL(CAST(@nEsDesactivaNotificacion AS VARCHAR),'null')
					END 	

					BEGIN TRAN
					BEGIN TRY
						EXEC [MSW_LNKSVR].[MCSW_ERP].[MSWSch].[MswPAIRegistraEventoAndonSCADASrv]
							@pnClaUbicacion = @nClaUbicacion
							--,@psIdCelda = @sIdCelda
							,@pnIdNumDepto = @nIdNumDepto
							,@pnClaveCelda = @nClaveCelda 
							,@pnIdComponente = @nClaMaquina--(CatWorkUnitVw)
							,@pnIdEvento = @nId --Id SqlServer (Paro/IdAndon Avisor)
							,@pnTipoAlerta = 5 --1 - Nuevo Paro, 2 - Justificacion, 3 - Atencion, 4 - Solucion , 5.- Reasignacion 
							,@ptFechaAdm = @tFecha
							,@pnClaTurno = @nClaTurno
							,@ptFechaHoraInicial = @tFechaHoraInicial
							,@ptFechaHoraJustificacion = @tFechaHoraReasignacion--@tFechaHoraJustificacion
							--,@ptFechaHoraReasignacion = @tFechaHoraReasignacion
							,@ptFechaHoraAtencion = null --@tFechaHoraAtencion
							,@ptFechaHoraFinal    = null --@tFechaHoraFinal
							,@pnEsparo = 1
							,@pnEsMicroparo = @nEsMicroParo
							,@pnDuracionSegundos = @nDuracionSegundos
							,@pnClaSeccionParo = @nClaSeccionParo
							,@pnClaArticulo = @nClaArticulo
							,@pnClaUsuarioMod = @nClaUsuarioMod
							,@psNombrePcMod = @sNombrePcMod
							,@ptFechaUltimaMod  = @tFechaUltimaMod 
							,@pnClaTipoSeguimientoAlerta  = @nClaTipoSeguimientoAlerta
							,@pnClaGpoParo          = @nClaGpoParo
							,@psComentarios         = @sComentarios
							,@psComentariosSolucion = @sComentariosSolucion
							,@psNombreEmpleado      = @sNombreEmpleado
							,@pnStatusError  = @nStatusError OUT
							,@psMsgError     = @sMsgError OUT
							,@pnIdReporteAndon  = @nIdReporteAndon	OUT
							,@pnEsDesactivaNotificacion = 1 --@nEsDesactivaNotificacion

						UPDATE [AswSch].[AswBitBitacoraParo] 
						SET  ClaEventoReasignacion = 2
							,StatusError  = @nStatusError 
							,MsgErrorReasignacion     = 'Reasigna- '+@sMsgError
							,IdErpMsw	  = @nIdReporteAndon
						WHERE Id = @nId
					COMMIT
					END TRY
					BEGIN CATCH
						--	print @sError
						--	print @nStatusError
							ROLLBACK
							SELECT @sError = ERROR_MESSAGE()
							print @sError
							UPDATE [AswSch].[AswBitBitacoraParo] 
							SET  ClaEstatusReplica = 1
								,MsgErrorReasignacion = 'Reasigna- '+@sError
								,StatusError = -1
							WHERE Id = @nId

							IF(@nCorreoEnviado = 0)
							BEGIN
		
								INSERT INTO @ParosCondicionador(Id,
																IdParo,
																ClaCelda,
																ClaMaquina,
																ClaTurno,
																FechaHoraInicial,
																FechaHoraFinal,
																MicroParo,
																Error)
								SELECT @nId,
											@nIdParo,
											@nClaveCelda,
											@nClaMaquina,
											@nClaTurno,
											@tFechaHoraInicial,
											@tFechaHoraFinal,
											@nEsMicroParo,
											@sError

								UPDATE AswSch.AswBitBitacoraParo
									SET EnvioCorreoSN = 1
									WHERE Id = @nId
							END
					END CATCH
				END

				IF @nClaEventoAtencion = 1
				BEGIN 

					IF @PnDebug = 1
					BEGIN 
						print 'EXEC [MSW_LNKSVR].[MCSW_ERP].[MSWSch].[MswPAIRegistraEventoAndonSCADASrv]'
							+'@pnClaUbicacion = ' + ISNULL(CAST(@nClaUbicacion AS VARCHAR),'null')
							+'--,@psIdCelda = '   + ISNULL(CAST(@sIdCelda AS VARCHAR),'null')
							+',@pnIdNumDepto = '  + ISNULL(CAST(@nIdNumDepto AS VARCHAR),'null')
							+',@pnClaveCelda = '  + ISNULL(CAST(@nClaveCelda AS VARCHAR),'null')
							+',@pnIdComponente = '+ ISNULL(CAST(@nClaMaquina AS VARCHAR),'null')--(CatWorkUnitVw)
							+',@pnIdEvento = '    + ISNULL(CAST(@nId AS VARCHAR),'null') --Id SqlServer (Paro/IdAndon Avisor)
							+',@pnTipoAlerta = 3'--1 - Nuevo Paro, 2 - Justificacion, 3 - Atencion, 4 - Solucion , 5.- Reasignacion 
							+',@ptFechaAdm = '    + ISNULL(CAST(@tFecha AS VARCHAR),'null')
							+',@pnClaTurno = '    + ISNULL(CAST(@nClaTurno AS VARCHAR),'null')
							+',@ptFechaHoraInicial = '+ ISNULL(CAST(@tFechaHoraInicial AS VARCHAR),'null')
							+',@ptFechaHoraJustificacion = ' + ISNULL(CAST(@tFechaHoraJustificacion AS VARCHAR),'null')
							+'--,@ptFechaHoraReasignacion = '+ ISNULL(CAST(@tFechaHoraReasignacion AS VARCHAR),'null')
							+',@ptFechaHoraAtencion = '+ ISNULL(CAST(@tFechaHoraAtencion AS VARCHAR),'null')
							+',@ptFechaHoraFinal = null'   --+ ISNULL(CAST(@tFechaHoraFinal AS VARCHAR),'null')
							+',@pnEsparo = 1'
							+',@pnEsMicroparo = '+ISNULL(CAST(@nEsMicroParo AS VARCHAR),'null')
							+',@pnDuracionSegundos = '+ISNULL(CAST(@nDuracionSegundos AS VARCHAR),'null')
							+',@pnClaSeccionParo = '+ISNULL(CAST(@nClaSeccionParo AS VARCHAR),'null')
							+',@pnClaArticulo = '+ISNULL(CAST(@nClaArticulo AS VARCHAR),'null')
							+',@pnClaUsuarioMod = '+ISNULL(CAST(@nClaUsuarioMod AS VARCHAR),'null')
							+',@psNombrePcMod = '+ISNULL(CAST(@sNombrePcMod AS VARCHAR),'null')
							+',@ptFechaUltimaMod  = '+ISNULL(CAST(@tFechaUltimaMod  AS VARCHAR),'null')
							+',@pnClaTipoSeguimientoAlerta  = '+ISNULL(CAST(@nClaTipoSeguimientoAlerta AS VARCHAR),'null')
							+',@pnClaGpoParo          = '+ISNULL(CAST(@nClaGpoParo AS VARCHAR),'null')
							+',@psComentarios         = '+ISNULL(CAST(@sComentarios AS VARCHAR),'null')
							+',@psComentariosSolucion = '+ISNULL(CAST(@sComentariosSolucion AS VARCHAR),'null')
							+',@psNombreEmpleado      = '+ISNULL(CAST(@sNombreEmpleado AS VARCHAR),'null')
							+',@pnStatusError  = @nStatusError OUT'
							+',@psMsgError     = @sMsgError OUT'
							+',@pnIdReporteAndon		= @nIdReporteAndon OUT'
					END 

					BEGIN TRAN
					BEGIN TRY
						EXEC [MSW_LNKSVR].[MCSW_ERP].[MSWSch].[MswPAIRegistraEventoAndonSCADASrv] 
							@pnClaUbicacion = @nClaUbicacion
							--,@psIdCelda = @sIdCelda
							,@pnIdNumDepto = @nIdNumDepto
							,@pnClaveCelda = @nClaveCelda 
							,@pnIdComponente = @nClaMaquina--(CatWorkUnitVw)
							,@pnIdEvento = @nId --Id SqlServer (Paro/IdAndon Avisor)
							,@pnTipoAlerta = 3--1 - Nuevo Paro, 2 - Justificacion, 3 - Atencion, 4 - Solucion , 5.- Reasignacion 
							,@ptFechaAdm = @tFecha
							,@pnClaTurno = @nClaTurno
							,@ptFechaHoraInicial = @tFechaHoraInicial
							,@ptFechaHoraJustificacion = @tFechaHoraJustificacion
							--,@ptFechaHoraReasignacion = @tFechaHoraReasignacion
							,@ptFechaHoraAtencion = @tFechaHoraAtencion
							,@ptFechaHoraFinal = null --@tFechaHoraFinal
							,@pnEsparo = 1
							,@pnEsMicroparo = @nEsMicroParo
							,@pnDuracionSegundos = @nDuracionSegundos
							,@pnClaSeccionParo = @nClaSeccionParo
							,@pnClaArticulo = @nClaArticulo
							,@pnClaUsuarioMod = @nClaUsuarioMod
							,@psNombrePcMod = @sNombrePcMod
							,@ptFechaUltimaMod  = @tFechaUltimaMod 
							,@pnClaTipoSeguimientoAlerta  = @nClaTipoSeguimientoAlerta
							,@pnClaGpoParo          = @nClaGpoParo
							,@psComentarios         = @sComentarios
							,@psComentariosSolucion = @sComentariosSolucion
							,@psNombreEmpleado      = @sNombreEmpleado
							,@pnStatusError  = @nStatusError OUT
							,@psMsgError     = @sMsgError OUT
							,@pnIdReporteAndon = @nIdReporteAndon OUT

						UPDATE [AswSch].[AswBitBitacoraParo] 
						SET  ClaEventoAtencion = 2
							,StatusError  = @nStatusError 
							,MsgErrorAtencion     = 'Atencion- '+@sMsgError 
							,IdErpMsw	  = @nIdReporteAndon
						WHERE Id = @nId

					COMMIT
					END TRY
					BEGIN CATCH
						--	print @sError
						--	print @nStatusError
							ROLLBACK
							SELECT @sError = ERROR_MESSAGE()
							print @sError
							UPDATE [AswSch].[AswBitBitacoraParo] 
							SET  ClaEstatusReplica = 1
								,MsgErrorAtencion = 'Atencion- '+@sError
								,StatusError = -1
							WHERE Id = @nId

							IF(@nCorreoEnviado = 0)
							BEGIN
		
								INSERT INTO @ParosCondicionador(Id,
																IdParo,
																ClaCelda,
																ClaMaquina,
																ClaTurno,
																FechaHoraInicial,
																FechaHoraFinal,
																MicroParo,
																Error)
								SELECT @nId,
											@nIdParo,
											@nClaveCelda,
											@nClaMaquina,
											@nClaTurno,
											@tFechaHoraInicial,
											@tFechaHoraFinal,
											@nEsMicroParo,
											@sError

								UPDATE AswSch.AswBitBitacoraParo
									SET EnvioCorreoSN = 1
									WHERE Id = @nId

							END
					END CATCH
				END

				IF @nClaEventoSolucionado = 1
				BEGIN 
					
					IF @PnDebug = 1
					BEGIN 
						print 'EXEC [MSW_LNKSVR].[MCSW_ERP].[MSWSch].[MswPAIRegistraEventoAndonSCADASrv]'
							+'@pnClaUbicacion = ' + ISNULL(CAST(@nClaUbicacion AS VARCHAR),'null')
							+'--,@psIdCelda = '   + ISNULL(CAST(@sIdCelda AS VARCHAR),'null')
							+',@pnIdNumDepto = '  + ISNULL(CAST(@nIdNumDepto AS VARCHAR),'null')
							+',@pnClaveCelda = '  + ISNULL(CAST(@nClaveCelda AS VARCHAR),'null')
							+',@pnIdComponente = '+ ISNULL(CAST(@nClaMaquina AS VARCHAR),'null')--(CatWorkUnitVw)
							+',@pnIdEvento = '    + ISNULL(CAST(@nId AS VARCHAR),'null') --Id SqlServer (Paro/IdAndon Avisor)
							+',@pnTipoAlerta = 4'--1 - Nuevo Paro, 2 - Justificacion, 3 - Atencion, 4 - Solucion , 5.- Reasignacion 
							+',@ptFechaAdm = '    + ISNULL(CAST(@tFecha AS VARCHAR),'null')
							+',@pnClaTurno = '    + ISNULL(CAST(@nClaTurno AS VARCHAR),'null')
							+',@ptFechaHoraInicial = '+ ISNULL(CAST(@tFechaHoraInicial AS VARCHAR),'null')
							+',@ptFechaHoraJustificacion = ' + ISNULL(CAST(@tFechaHoraJustificacion AS VARCHAR),'null')
							+'--,@ptFechaHoraReasignacion = '+ ISNULL(CAST(@tFechaHoraReasignacion AS VARCHAR),'null')
							+',@ptFechaHoraAtencion = '+ ISNULL(CAST(@tFechaHoraAtencion AS VARCHAR),'null')
							+',@ptFechaHoraFinal = '   + ISNULL(CAST(@tFechaHoraFinal AS VARCHAR),'null')
							+',@pnEsparo = 1'
							+',@pnEsMicroparo = '+ISNULL(CAST(@nEsMicroParo AS VARCHAR),'null')
							+',@pnDuracionSegundos = '+ISNULL(CAST(@nDuracionSegundos AS VARCHAR),'null')
							+',@pnClaSeccionParo = '+ISNULL(CAST(@nClaSeccionParo AS VARCHAR),'null')
							+',@pnClaArticulo = '+ISNULL(CAST(@nClaArticulo AS VARCHAR),'null')
							+',@pnClaUsuarioMod = '+ISNULL(CAST(@nClaUsuarioMod AS VARCHAR),'null')
							+',@psNombrePcMod = '+ISNULL(CAST(@sNombrePcMod AS VARCHAR),'null')
							+',@ptFechaUltimaMod  = '+ISNULL(CAST(@tFechaUltimaMod  AS VARCHAR),'null')
							+',@pnClaTipoSeguimientoAlerta  = '+ISNULL(CAST(@nClaTipoSeguimientoAlerta AS VARCHAR),'null')
							+',@pnClaGpoParo          = '+ISNULL(CAST(@nClaGpoParo AS VARCHAR),'null')
							+',@psComentarios         = '+ISNULL(CAST(@sComentarios AS VARCHAR),'null')
							+',@psComentariosSolucion = '+ISNULL(CAST(@sComentariosSolucion AS VARCHAR),'null')
							+',@psNombreEmpleado      = '+ISNULL(CAST(@sNombreEmpleado AS VARCHAR),'null')
							+',@pnStatusError  = @nStatusError OUT'
							+',@psMsgError     = @sMsgError OUT'
							+',@pnIdReporteAndon		= @nIdReporteAndon OUT'
					END 

					BEGIN TRAN
					BEGIN TRY
						EXEC [MSW_LNKSVR].[MCSW_ERP].[MSWSch].[MswPAIRegistraEventoAndonSCADASrv]
							@pnClaUbicacion = @nClaUbicacion
							--,@psIdCelda = @sIdCelda
							,@pnIdNumDepto = @nIdNumDepto
							,@pnClaveCelda = @nClaveCelda 
							,@pnIdComponente = @nClaMaquina--(CatWorkUnitVw)
							,@pnIdEvento = @nId --Id SqlServer (Paro/IdAndon Avisor)
							,@pnTipoAlerta = 4--1 - Nuevo Paro, 2 - Justificacion, 3 - Atencion, 4 - Solucion , 5.- Reasignacion 
							,@ptFechaAdm = @tFecha
							,@pnClaTurno = @nClaTurno
							,@ptFechaHoraInicial = @tFechaHoraInicial
							,@ptFechaHoraJustificacion = @tFechaHoraJustificacion
							--,@ptFechaHoraReasignacion = @tFechaHoraReasignacion
							,@ptFechaHoraAtencion = @tFechaHoraAtencion
							,@ptFechaHoraFinal = @tFechaHoraFinal
							,@pnEsparo = 1
							,@pnEsMicroparo = @nEsMicroParo
							,@pnDuracionSegundos = @nDuracionSegundos
							,@pnClaSeccionParo = @nClaSeccionParo
							,@pnClaArticulo = @nClaArticulo
							,@pnClaUsuarioMod = @nClaUsuarioMod
							,@psNombrePcMod = @sNombrePcMod
							,@ptFechaUltimaMod  = @tFechaUltimaMod 
							,@pnClaTipoSeguimientoAlerta  = @nClaTipoSeguimientoAlerta
							,@pnClaGpoParo          = @nClaGpoParo
							,@psComentarios         = @sComentarios
							,@psComentariosSolucion = @sComentariosSolucion
							,@psNombreEmpleado      = @sNombreEmpleado
							,@pnStatusError  = @nStatusError OUT
							,@psMsgError     = @sMsgError OUT
							,@pnIdReporteAndon		= @nIdReporteAndon OUT

						UPDATE [AswSch].[AswBitBitacoraParo] 
						SET  ClaEventoSolucionado = 2
							,StatusError  = @nStatusError 
							,MsgErrorSolucion     = 'Solucion- '+@sMsgError 
							--,IdErpMsw	  = @nIdReporteAndon
						WHERE Id = @nId

					COMMIT
					END TRY
					BEGIN CATCH
						--	print @sError
						--	print @nStatusError
							ROLLBACK
							SELECT @sError = ERROR_MESSAGE()
							print @sError
							UPDATE [AswSch].[AswBitBitacoraParo] 
							SET  ClaEstatusReplica = 1
								,MsgErrorSolucion = 'Solucion- '+@sError
								,StatusError = -1
							WHERE Id = @nId

							IF(@nCorreoEnviado = 0)
							BEGIN
		
								INSERT INTO @ParosCondicionador(Id,
																IdParo,
																ClaCelda,
																ClaMaquina,
																ClaTurno,
																FechaHoraInicial,
																FechaHoraFinal,
																MicroParo,
																Error)
								SELECT @nId,
											@nIdParo,
											@nClaveCelda,
											@nClaMaquina,
											@nClaTurno,
											@tFechaHoraInicial,
											@tFechaHoraFinal,
											@nEsMicroParo,
											@sError

								UPDATE AswSch.AswBitBitacoraParo
									SET EnvioCorreoSN = 1
									WHERE Id = @nId

							END
					END CATCH
				END
			END
			ELSE --PARO CERRADO EN AUTOMATICO
			BEGIN
				print 'EsCerradoAuto'

				IF @nClaEventoJustificacion = 1
				BEGIN 
					print 'justificacion Atm' 
					print @sComentarios
					
					IF @PnDebug = 1
					BEGIN 
						print 'EXEC [MSW_LNKSVR].[MCSW_ERP].[MSWSch].[MswPAIRegistraEventoAndonSCADASrv]'
							+'@pnClaUbicacion = ' + ISNULL(CAST(@nClaUbicacion AS VARCHAR),'null')
							+'--,@psIdCelda = '   + ISNULL(CAST(@sIdCelda AS VARCHAR),'null')
							+',@pnIdNumDepto = '  + ISNULL(CAST(@nIdNumDepto AS VARCHAR),'null')
							+',@pnClaveCelda = '  + ISNULL(CAST(@nClaveCelda AS VARCHAR),'null')
							+',@pnIdComponente = '+ ISNULL(CAST(@nClaMaquina AS VARCHAR),'null')--(CatWorkUnitVw)
							+',@pnIdEvento = '    + ISNULL(CAST(@nId AS VARCHAR),'null') --Id SqlServer (Paro/IdAndon Avisor)
							+',@pnTipoAlerta = 2'--1 - Nuevo Paro, 2 - Justificacion, 3 - Atencion, 4 - Solucion , 5.- Reasignacion 
							+',@ptFechaAdm = '    + ISNULL(CAST(@tFecha AS VARCHAR),'null')
							+',@pnClaTurno = '    + ISNULL(CAST(@nClaTurno AS VARCHAR),'null')
							+',@ptFechaHoraInicial = '+ ISNULL(CAST(@tFechaHoraInicial AS VARCHAR),'null')
							+',@ptFechaHoraJustificacion = ' + ISNULL(CAST(@tFechaHoraJustificacion AS VARCHAR),'null')
							+'--,@ptFechaHoraReasignacion = '+ ISNULL(CAST(@tFechaHoraReasignacion AS VARCHAR),'null')
							+',@ptFechaHoraAtencion = null' --+ ISNULL(CAST(@tFechaHoraAtencion AS VARCHAR),'null')
							+',@ptFechaHoraFinal = null'   --+ ISNULL(CAST(@tFechaHoraFinal AS VARCHAR),'null')
							+',@pnEsparo = 1'
							+',@pnEsMicroparo = '+ISNULL(CAST(@nEsMicroParo AS VARCHAR),'null')
							+',@pnDuracionSegundos = '+ISNULL(CAST(@nDuracionSegundos AS VARCHAR),'null')
							+',@pnClaSeccionParo = '+ISNULL(CAST(@nClaSeccionParo AS VARCHAR),'null')
							+',@pnClaArticulo = '+ISNULL(CAST(@nClaArticulo AS VARCHAR),'null')
							+',@pnClaUsuarioMod = '+ISNULL(CAST(@nClaUsuarioMod AS VARCHAR),'null')
							+',@psNombrePcMod = '+ISNULL(CAST(@sNombrePcMod AS VARCHAR),'null')
							+',@ptFechaUltimaMod  = '+ISNULL(CAST(@tFechaUltimaMod  AS VARCHAR),'null')
							+',@pnClaTipoSeguimientoAlerta  = '+ISNULL(CAST(@nClaTipoSeguimientoAlerta AS VARCHAR),'null')
							+',@pnClaGpoParo          = '+ISNULL(CAST(@nClaGpoParo AS VARCHAR),'null')
							+',@psComentarios         = '+ISNULL(CAST(@sComentarios AS VARCHAR),'null')
							+',@psComentariosSolucion = '+ISNULL(CAST(@sComentariosSolucion AS VARCHAR),'null')
							+',@psNombreEmpleado      = '+ISNULL(CAST(@sNombreEmpleado AS VARCHAR),'null')
							+',@pnStatusError  = @nStatusError OUT'
							+',@psMsgError     = @sMsgError OUT'
							+',@pnIdReporteAndon		= @nIdReporteAndon OUT'
							+',@pnEsDesactivaNotificacion = 1'
					END 

					BEGIN TRAN
					BEGIN TRY
						EXEC [MSW_LNKSVR].[MCSW_ERP].[MSWSch].[MswPAIRegistraEventoAndonSCADASrv]
							@pnClaUbicacion = @nClaUbicacion
							--,@psIdCelda = @sIdCelda
							,@pnIdNumDepto = @nIdNumDepto
							,@pnClaveCelda = @nClaveCelda 
							,@pnIdComponente = @nClaMaquina--(CatWorkUnitVw)
							,@pnIdEvento = @nId --Id SqlServer (Paro/IdAndon Avisor)
							,@pnTipoAlerta = 2--1 - Nuevo Paro, 2 - Justificacion, 3 - Atencion, 4 - Solucion , 5.- Reasignacion 
							,@ptFechaAdm = @tFecha
							,@pnClaTurno = @nClaTurno
							,@ptFechaHoraInicial = @tFechaHoraInicial
							,@ptFechaHoraJustificacion = @tFechaHoraJustificacion
							--,@ptFechaHoraReasignacion = @tFechaHoraReasignacion
							,@ptFechaHoraAtencion = null --@tFechaHoraAtencion
							,@ptFechaHoraFinal    = null --@tFechaHoraFinal
							,@pnEsparo = 1
							,@pnEsMicroparo = @nEsMicroParo
							,@pnDuracionSegundos = @nDuracionSegundos
							,@pnClaSeccionParo = @nClaSeccionParo
							,@pnClaArticulo = @nClaArticulo
							,@pnClaUsuarioMod = @nClaUsuarioMod
							,@psNombrePcMod = @sNombrePcMod
							,@ptFechaUltimaMod  = @tFechaUltimaMod 
							,@pnClaTipoSeguimientoAlerta  = @nClaTipoSeguimientoAlerta
							,@pnClaGpoParo          = @nClaGpoParo
							,@psComentarios         = @sComentarios
							,@psComentariosSolucion = @sComentariosSolucion
							,@psNombreEmpleado      = @sNombreEmpleado
							,@pnStatusError  = @nStatusError OUT
							,@psMsgError     = @sMsgError OUT
							,@pnIdReporteAndon				= @nIdReporteAndon OUT
							,@pnEsDesactivaNotificacion     = 1 --Estos nunca envian notificacion ya que ya se encuentran cerrados
					
						UPDATE [AswSch].[AswBitBitacoraParo] 
						SET  ClaEventoJustificacion = 2
						    ,StatusError  = @nStatusError 
							,MsgErrorJustificacion     = 'Justificacion Atm- '+@sMsgError 
							,IdErpMsw     = @nIdReporteAndon
						WHERE Id = @nId
					
					COMMIT
					END TRY
					BEGIN CATCH
						--	print @sError
						--	print @nStatusError
							ROLLBACK
							SELECT @sError = ERROR_MESSAGE()
							print @sError
							UPDATE [AswSch].[AswBitBitacoraParo] 
							SET  ClaEstatusReplica = 1
								,MsgErrorJustificacion = 'Justificacion Atm- '+@sError
								,StatusError = -1
							WHERE Id = @nId

							IF(@nCorreoEnviado = 0)
							BEGIN
		
								INSERT INTO @ParosCondicionador(Id,
																IdParo,
																ClaCelda,
																ClaMaquina,
																ClaTurno,
																FechaHoraInicial,
																FechaHoraFinal,
																MicroParo,
																Error)
								SELECT @nId,
											@nIdParo,
											@nClaveCelda,
											@nClaMaquina,
											@nClaTurno,
											@tFechaHoraInicial,
											@tFechaHoraFinal,
											@nEsMicroParo,
											@sError

								UPDATE AswSch.AswBitBitacoraParo
									SET EnvioCorreoSN = 1
									WHERE Id = @nId

							END
					END CATCH
				END

				IF  ISNULL(@nClaEventoCierre,0) = 1
				BEGIN
					print 'Solucionar'
					IF @PnDebug = 1
					BEGIN 
					print 'EXEC [MSW_LNKSVR].[MCSW_ERP].[MSWSch].[MswPAIRegistraEventoAndonSCADASrv]'
							+'@pnClaUbicacion = ' + ISNULL(CAST(@nClaUbicacion AS VARCHAR),'null')
							+'--,@psIdCelda = '   + ISNULL(CAST(@sIdCelda AS VARCHAR),'null')
							+',@pnIdNumDepto = '  + ISNULL(CAST(@nIdNumDepto AS VARCHAR),'null')
							+',@pnClaveCelda = '  + ISNULL(CAST(@nClaveCelda AS VARCHAR),'null')
							+',@pnIdComponente = '+ ISNULL(CAST(@nClaMaquina AS VARCHAR),'null')--(CatWorkUnitVw)
							+',@pnIdEvento = '    + ISNULL(CAST(@nId AS VARCHAR),'null') --Id SqlServer (Paro/IdAndon Avisor)
							+',@pnTipoAlerta = 4'--1 - Nuevo Paro, 2 - Justificacion, 3 - Atencion, 4 - Solucion , 5.- Reasignacion 
							+',@ptFechaAdm = '    + ISNULL(CAST(@tFecha AS VARCHAR),'null')
							+',@pnClaTurno = '    + ISNULL(CAST(@nClaTurno AS VARCHAR),'null')
							+',@ptFechaHoraInicial = '+ ISNULL(CAST(@tFechaHoraInicial AS VARCHAR),'null')
							+',@ptFechaHoraJustificacion = ' + ISNULL(CAST(@tFechaHoraJustificacion AS VARCHAR),'null')
							+'--,@ptFechaHoraReasignacion = '+ ISNULL(CAST(@tFechaHoraReasignacion AS VARCHAR),'null')
							+',@ptFechaHoraAtencion = '+ ISNULL(CAST(@tFechaHoraAtencion AS VARCHAR),'null')
							+',@ptFechaHoraFinal = '   + ISNULL(CAST(@tFechaHoraFinal AS VARCHAR),'null')
							+',@pnEsparo = 1'
							+',@pnEsMicroparo = '+ISNULL(CAST(@nEsMicroParo AS VARCHAR),'null')
							+',@pnDuracionSegundos = '+ISNULL(CAST(@nDuracionSegundos AS VARCHAR),'null')
							+',@pnClaSeccionParo = '+ISNULL(CAST(@nClaSeccionParo AS VARCHAR),'null')
							+',@pnClaArticulo = '+ISNULL(CAST(@nClaArticulo AS VARCHAR),'null')
							+',@pnClaUsuarioMod = '+ISNULL(CAST(@nClaUsuarioMod AS VARCHAR),'null')
							+',@psNombrePcMod = '+ISNULL(CAST(@sNombrePcMod AS VARCHAR),'null')
							+',@ptFechaUltimaMod  = '+ISNULL(CAST(@tFechaUltimaMod  AS VARCHAR),'null')
							+',@pnClaTipoSeguimientoAlerta  = '+ISNULL(CAST(@nClaTipoSeguimientoAlerta AS VARCHAR),'null')
							+',@pnClaGpoParo          = '+ISNULL(CAST(@nClaGpoParo AS VARCHAR),'null')
							+',@psComentarios         = '+ISNULL(CAST(@sComentarios AS VARCHAR),'null')
							+',@psComentariosSolucion = '+ISNULL(CAST(@sComentariosSolucion AS VARCHAR),'null')
							+',@psNombreEmpleado      = '+ISNULL(CAST(@sNombreEmpleado AS VARCHAR),'null')
							+',@pnStatusError  = @nStatusError OUT'
							+',@psMsgError     = @sMsgError OUT'
							+',@pnIdReporteAndon		= @nIdReporteAndon OUT'
					END 

					BEGIN TRAN
					BEGIN TRY
						EXEC [MSW_LNKSVR].[MCSW_ERP].[MSWSch].[MswPAIRegistraEventoAndonSCADASrv]
							@pnClaUbicacion = @nClaUbicacion
							--,@psIdCelda = @sIdCelda
							,@pnIdNumDepto = @nIdNumDepto
							,@pnClaveCelda = @nClaveCelda 
							,@pnIdComponente = @nClaMaquina--(CatWorkUnitVw)
							,@pnIdEvento = @nId --Id SqlServer (Paro/IdAndon Avisor)
							,@pnTipoAlerta = 4--1 - Nuevo Paro, 2 - Justificacion, 3 - Atencion, 4 - Solucion , 5.- Reasignacion 
							,@ptFechaAdm = @tFecha
							,@pnClaTurno = @nClaTurno
							,@ptFechaHoraInicial = @tFechaHoraInicial
							,@ptFechaHoraJustificacion = @tFechaHoraJustificacion
							--,@ptFechaHoraReasignacion = @tFechaHoraReasignacion
							,@ptFechaHoraAtencion = @tFechaHoraAtencion
							,@ptFechaHoraFinal = @tFechaHoraFinal
							,@pnEsparo = 1
							,@pnEsMicroparo = @nEsMicroParo
							,@pnDuracionSegundos = @nDuracionSegundos
							,@pnClaSeccionParo = @nClaSeccionParo
							,@pnClaArticulo = @nClaArticulo
							,@pnClaUsuarioMod = @nClaUsuarioMod
							,@psNombrePcMod = @sNombrePcMod
							,@ptFechaUltimaMod  = @tFechaUltimaMod 
							,@pnClaTipoSeguimientoAlerta  = @nClaTipoSeguimientoAlerta
							,@pnClaGpoParo          = @nClaGpoParo
							,@psComentarios         = @sComentarios
							,@psComentariosSolucion = 'AVISOR DETECTED THAT THE MACHINE IS ON' 
							,@psNombreEmpleado      = @sNombreEmpleado
							,@pnStatusError  = @nStatusError OUT
							,@psMsgError     = @sMsgError OUT
							,@pnIdReporteAndon	= @nIdReporteAndon OUT

							UPDATE [AswSch].[AswBitBitacoraParo] 
							SET  ClaEventoCierre = 2
								,StatusError  = @nStatusError 
								,MsgErrorSolucionAtm     = 'Solucion Atm- '+@sMsgError 
								--,IdErpMsw	  = @nIdReporteAndon
							WHERE Id = @nId
					COMMIT
					END TRY
					BEGIN CATCH
						--	print @sError
						--	print @nStatusError
							ROLLBACK
							SELECT @sError = ERROR_MESSAGE()
							print @sError
							UPDATE [AswSch].[AswBitBitacoraParo] 
							SET  ClaEstatusReplica = 1
								,MsgErrorSolucionAtm = 'Solucion Atm- '+@sError
								,StatusError = -1
							WHERE Id = @nId

							IF(@nCorreoEnviado = 0)
							BEGIN
		
								INSERT INTO @ParosCondicionador(Id,
																IdParo,
																ClaCelda,
																ClaMaquina,
																ClaTurno,
																FechaHoraInicial,
																FechaHoraFinal,
																MicroParo,
																Error)
								SELECT @nId,
											@nIdParo,
											@nClaveCelda,
											@nClaMaquina,
											@nClaTurno,
											@tFechaHoraInicial,
											@tFechaHoraFinal,
											@nEsMicroParo,
											@sError

								UPDATE AswSch.AswBitBitacoraParo
									SET EnvioCorreoSN = 1
									WHERE Id = @nId

							END
					END CATCH
				END
				ELSE
				BEGIN
					
					IF @PnDebug = 1
					BEGIN 
					print 'EXEC [MSW_LNKSVR].[MCSW_ERP].[MSWSch].[MswPAIRegistraEventoAndonSCADASrv]'
							+'@pnClaUbicacion = ' + ISNULL(CAST(@nClaUbicacion AS VARCHAR),'null')
							+'--,@psIdCelda = '   + ISNULL(CAST(@sIdCelda AS VARCHAR),'null')
							+',@pnIdNumDepto = '  + ISNULL(CAST(@nIdNumDepto AS VARCHAR),'null')
							+',@pnClaveCelda = '  + ISNULL(CAST(@nClaveCelda AS VARCHAR),'null')
							+',@pnIdComponente = '+ ISNULL(CAST(@nClaMaquina AS VARCHAR),'null')--(CatWorkUnitVw)
							+',@pnIdEvento = '    + ISNULL(CAST(@nId AS VARCHAR),'null') --Id SqlServer (Paro/IdAndon Avisor)
							+',@pnTipoAlerta = 6'--1 - Nuevo Paro, 2 - Justificacion, 3 - Atencion, 4 - Solucion , 5.- Reasignacion 
							+',@ptFechaAdm = '    + ISNULL(CAST(@tFecha AS VARCHAR),'null')
							+',@pnClaTurno = '    + ISNULL(CAST(@nClaTurno AS VARCHAR),'null')
							+',@ptFechaHoraInicial = '+ ISNULL(CAST(@tFechaHoraInicial AS VARCHAR),'null')
							+',@ptFechaHoraJustificacion = ' + ISNULL(CAST(@tFechaHoraJustificacion AS VARCHAR),'null')
							+'--,@ptFechaHoraReasignacion = '+ ISNULL(CAST(@tFechaHoraReasignacion AS VARCHAR),'null')
							+',@ptFechaHoraAtencion = '+ ISNULL(CAST(@tFechaHoraAtencion AS VARCHAR),'null')
							+',@ptFechaHoraFinal = '   + ISNULL(CAST(@tFechaHoraFinal AS VARCHAR),'null')
							+',@pnEsparo = 1'
							+',@pnEsMicroparo = '+ISNULL(CAST(@nEsMicroParo AS VARCHAR),'null')
							+',@pnDuracionSegundos = '+ISNULL(CAST(@nDuracionSegundos AS VARCHAR),'null')
							+',@pnClaSeccionParo = '+ISNULL(CAST(@nClaSeccionParo AS VARCHAR),'null')
							+',@pnClaArticulo = '+ISNULL(CAST(@nClaArticulo AS VARCHAR),'null')
							+',@pnClaUsuarioMod = '+ISNULL(CAST(@nClaUsuarioMod AS VARCHAR),'null')
							+',@psNombrePcMod = '+ISNULL(CAST(@sNombrePcMod AS VARCHAR),'null')
							+',@ptFechaUltimaMod  = '+ISNULL(CAST(@tFechaUltimaMod  AS VARCHAR),'null')
							+',@pnClaTipoSeguimientoAlerta  = '+ISNULL(CAST(@nClaTipoSeguimientoAlerta AS VARCHAR),'null')
							+',@pnClaGpoParo          = '+ISNULL(CAST(@nClaGpoParo AS VARCHAR),'null')
							+',@psComentarios         = '+ISNULL(CAST(@sComentarios AS VARCHAR),'null')
							+',@psComentariosSolucion = '+ISNULL(CAST(@sComentariosSolucion AS VARCHAR),'null')
							+',@psNombreEmpleado      = '+ISNULL(CAST(@sNombreEmpleado AS VARCHAR),'null')
							+',@pnStatusError  = @nStatusError OUT'
							+',@psMsgError     = @sMsgError OUT'
							+',@pnIdReporteAndon = @nIdReporteAndon OUT '
					END 

					BEGIN TRAN
					BEGIN TRY
						EXEC [MSW_LNKSVR].[MCSW_ERP].[MSWSch].[MswPAIRegistraEventoAndonSCADASrv]
							@pnClaUbicacion = @nClaUbicacion
							--,@psIdCelda = @sIdCelda
							,@pnIdNumDepto = @nIdNumDepto
							,@pnClaveCelda = @nClaveCelda 
							,@pnIdComponente = @nClaMaquina--(CatWorkUnitVw)
							,@pnIdEvento = @nId --Id SqlServer (Paro/IdAndon Avisor)
							,@pnTipoAlerta = 6 --1 - Nuevo Paro, 2 - Justificacion, 3 - Atencion, 4 - Solucion , 5.- Reasignacion 
							,@ptFechaAdm = @tFecha
							,@pnClaTurno = @nClaTurno
							,@ptFechaHoraInicial = @tFechaHoraInicial
							,@ptFechaHoraJustificacion = @tFechaHoraJustificacion
							--,@ptFechaHoraReasignacion = @tFechaHoraReasignacion
							,@ptFechaHoraAtencion = @tFechaHoraAtencion
							,@ptFechaHoraFinal = @tFechaHoraFinal
							,@pnEsparo = 1
							,@pnEsMicroparo = @nEsMicroParo
							,@pnDuracionSegundos = @nDuracionSegundos
							,@pnClaSeccionParo = @nClaSeccionParo
							,@pnClaArticulo = @nClaArticulo
							,@pnClaUsuarioMod = @nClaUsuarioMod
							,@psNombrePcMod = @sNombrePcMod
							,@ptFechaUltimaMod  = @tFechaUltimaMod 
							,@pnClaTipoSeguimientoAlerta  = @nClaTipoSeguimientoAlerta
							,@pnClaGpoParo          = @nClaGpoParo
							,@psComentarios         = @sComentarios
							,@psComentariosSolucion = @sComentariosSolucion 
							,@psNombreEmpleado      = @sNombreEmpleado
							,@pnStatusError  = @nStatusError OUT
							,@psMsgError     = @sMsgError OUT
							,@pnIdReporteAndon		= @nIdReporteAndon OUT

							UPDATE [AswSch].[AswBitBitacoraParo] 
							SET ClaEventoAtencion      =  CASE WHEN @nClaEventoAtencion      = 1 THEN 2 ELSE @nClaEventoAtencion      END
							,   ClaEventoJustificacion =  CASE WHEN @nClaEventoJustificacion = 1 THEN 2 ELSE @nClaEventoJustificacion END
							,   ClaEventoReasignacion  =  CASE WHEN @nClaEventoReasignacion  = 1 THEN 2 ELSE @nClaEventoReasignacion  END
							,   ClaEventoSolucionado   =  CASE WHEN @nClaEventoSolucionado   = 1 THEN 2 ELSE @nClaEventoSolucionado   END 
							,StatusError  = @nStatusError 
							,MsgError     = 'Tipo 6 - '+@sMsgError 
							,IdErpMsw	  = @nIdReporteAndon
							WHERE Id = @nId
					COMMIT
					END TRY
					BEGIN CATCH
						--	print @sError
						--	print @nStatusError
							ROLLBACK
							SELECT @sError = ERROR_MESSAGE()
							print @sError
							UPDATE [AswSch].[AswBitBitacoraParo] 
							SET  ClaEstatusReplica = 1
								,MsgError = 'Tipo 6 - '+@sError
								,StatusError = -1
							WHERE Id = @nId

							IF(@nCorreoEnviado = 0)
							BEGIN
		
								INSERT INTO @ParosCondicionador(Id,
																IdParo,
																ClaCelda,
																ClaMaquina,
																ClaTurno,
																FechaHoraInicial,
																FechaHoraFinal,
																MicroParo,
																Error)
								SELECT @nId,
											@nIdParo,
											@nClaveCelda,
											@nClaMaquina,
											@nClaTurno,
											@tFechaHoraInicial,
											@tFechaHoraFinal,
											@nEsMicroParo,
											@sError

								UPDATE AswSch.AswBitBitacoraParo
									SET EnvioCorreoSN = 1
									WHERE Id = @nId

							END
					END CATCH


				END
			END 

			IF EXISTS (SELECT 1 FROM [AswSch].[AswBitBitacoraParo] 
						WHERE ISNULL(ClaEventoJustificacion,0) <> 1 
						AND   ISNULL(ClaEventoReasignacion,0)  <> 1
						AND   ISNULL(ClaEventoAtencion,0)      <> 1
						AND   ISNULL(ClaEventoSolucionado,0)   <> 1 
						AND	  ISNULL(ClaEventoCierre,0)		   <> 1
						AND   Id = @nId )
			BEGIN 
				UPDATE [AswSch].[AswBitBitacoraParo] 
				SET  ClaEstatusReplica = 2
				WHERE Id = @nId
			END

		SELECT @nId = MIN(id)
		FROM @Paro
		WHERE Id>@nId
	END

	SELECT @nId = MIN(id)
	FROM @Paro

	IF EXISTS(SELECT 1 FROM @ParosCondicionador)
	BEGIN
		BEGIN TRY
			DECLARE @sPara VARCHAR(100);
			SELECT @sPara = Svalor1
				FROM AswSch.ASWCfgConfiguracion
				where ClaConfiguracion = 15

			SELECT @sMensaje = @sMensaje +
				'<tr>'+
					'<td align="center" style="width:60px;">'+CAST(P.IdParo AS VARCHAR)+'</td>'+
					'<td align="center" style="width:60px;">'+C.NomWorkCenter+'</td>'+
					'<td align="center" style="width:60px;">'+M.NomMaquina+'</td>'+
					'<td align="center" style="width:60px;">'+CAST(P.ClaTurno AS VARCHAR)+'</td>'+
					'<td align="center" style="width:60px;">'+CONVERT(VARCHAR, CONVERT(DATETIME,P.FechaHoraInicial),113)+'</td>'+
					'<td align="center" style="width:60px;">'+CONVERT(VARCHAR, CONVERT(DATETIME,P.FechaHoraFinal),113)+'</td>'+
					'<td align="center" style="width:60px;">'+CAST(P.MicroParo AS VARCHAR)+'</td>'+
					'<td align="center" style="width:60px;">'+P.Error+'</td></tr>'
				FROM @ParosCondicionador P 
				JOIN AswSch.AswCatWorkUnitVw M
					ON P.ClaMaquina = M.ClaMaquina
					AND M.BajaLogica = 0
				JOIN AswSch.AswCatWorkCenterVw C
					ON M.IdWorkCenter = C.IdWorkCenter
					AND C.BajaLogica = 0

			SELECT @sMensaje = @sTitulo + @sMensaje

			EXEC msdb.dbo.sp_send_dbmail
				@profile_name = 'Avisor'
				,@recipients = @sPara
				,@subject = @sSub
				,@body = @sMensaje
				,@body_format = 'html'
				,@importance = 'HIGH'
		END TRY
		BEGIN CATCH
			SELECT @sError = ERROR_MESSAGE()
			
			EXEC msdb.dbo.sp_send_dbmail
				@profile_name = 'Avisor'
				,@recipients = 'josari@deacero.com'
				,@subject = @sSub
				,@body = @sError
				,@body_format = 'html'
				,@importance = 'HIGH'
		END CATCH

	END

END 