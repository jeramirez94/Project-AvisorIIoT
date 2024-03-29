--USE [ASW]
--GO
/****** Object:  StoredProcedure [AswSch].[ASW_CU523_Pag1_ReplicaAndon_Proc]    Script Date: 15/11/2022 03:27:30 p. m. ******/
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

EXECUTE [AswSch].[ASW_CU523_Pag1_ReplicaAndon_Proc]	
select * from  [AswSch].[ASWBitAndon] where claEstatusReplica=2
	AND [FechaAdmSCADA]> dateadd(day, -14, getdate())
SELECT * FROM [MSW_LNKSVR].[MCSW_ERP].MSWSch.MSWPAITraRegistraEventoAndonSrv where esParo=0

rollback tran
*/
ALTER PROCEDURE [AswSch].[ASW_CU523_Pag1_ReplicaAndon_Proc]	
	@PnDebug INT = 0
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
		,@nIdAndon INT -- id unico en Avisor
		,@tFecha DATETIME -- FechaAdministrativa
		,@nClaTurno INT
		,@tFechaHoraInicial DATETIME
		,@tFechaHoraReasignacion DATETIME
		,@tFechaHoraAtencion DATETIME
		,@tFechaHoraFinal DATETIME
		,@nDuracionSegundos INT
		,@nClaSeccionParo INT -- justificacion
		,@nClaEstatusReplica INT
		,@nClaEventoNuevo INT
		,@nClaEventoReasignacion INT
		,@nClaEventoAtencion INT
		,@nClaEventoSolucionado INT
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
		,@nIdReporteAndon	INT
		,@nCorreoEnviado	TINYINT
		,@sSub				VARCHAR(55) = 'Error Replica ANDON '+CAST(CURRENT_TIMESTAMP AS varchar)
		,@sTitulo			VARCHAR(1000) = '<table width=100%><tr class="header" style="background-color:#304f60; font-family:Arial;color:#FFFFFF;font-size:18px;font-weight:bold;">'+    
												'<th style="width: 60%; ">Alerta de Andon con errores en su replica al ERP</th>'+
											'</table>'
		,@sMensaje			VARCHAR(MAX) = '<table border="1" bordercolor="#eeeeee" width=100% style="table-layout: fixed; word-wrap: break-word; font-size:11px; padding:3px">'+
												'<tr style="background-color:#DBDBDB; font-family:Arial; border-collapse:collapse; font-weight:550;">'+
													'<th>IdAvisorAndon</th>'+
													'<th>Celda</th>'+
													'<th>Máquina</th>'+
													'<th>ClaTurno</th>'+
													'<th>FechaHoraInicial</th>'+
													'<th>FechaHoraFinal</th>'+
													'<th>Error</th></tr>'

	DECLARE @AndonCondicionador TABLE(
		Id			INT,
		IdAndon		INT,
		ClaCelda	VARCHAR(30),
		ClaMaquina	INT,
		ClaTurno	SMALLINT,
		FechaHoraInicial DATETIME,
		FechaHoraFinal	DATETIME,
		Error		VARCHAR(500))

	DECLARE @Andon TABLE(
		Id INT
		,ClaUbicacion INT
		,IdCelda VARCHAR(30)
		,ClaMaquina VARCHAR(30)
		,IdAndon INT -- id unico en Avisor
		,Fecha DATETIME -- FechaAdministrativa
		,ClaTurno INT
		,FechaHoraInicial DATETIME
		,FechaHoraReasignacion DATETIME
		,FechaHoraAtencion DATETIME
		,FechaHoraFinal DATETIME
		,DuracionSegundos INT
		,ClaSeccionParo INT -- justificacion
		,ClaEstatusReplica INT
		,ClaEventoNuevo INT
		,ClaEventoReasignacion INT
		,ClaEventoAtencion INT
		,ClaEventoSolucionado INT
		,ClaArticulo INT
		,ClaUsuarioMod INT -- idUsuario operador
		,NombrePcMod VARCHAR(64)
		,FechaUltimaMod DATETIME
		,ClaTipoSeguimientoAlerta  INT
		,ClaGpoParo INT
		,Comentarios VARCHAR(400)
		,ComentariosSolucion VARCHAR(400)
		,NombreEmpleado VARCHAR(300)
		,IdReporteAndon			INT
		,CorreoEnviado			TINYINT
	)
	
	INSERT INTO @Andon(
		Id
		,ClaUbicacion
		,IdCelda 
		,ClaMaquina 
		,IdAndon 
		,Fecha 
		,ClaTurno 
		,FechaHoraInicial
		,FechaHoraReasignacion
		,FechaHoraAtencion
		,FechaHoraFinal 
		,DuracionSegundos 
		,ClaSeccionParo 
		,[ClaEstatusReplica]
		,[ClaEventoNuevo]
		,[ClaEventoReasignacion]
		,[ClaEventoAtencion]
		,[ClaEventoSolucionado]
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
	)
	SELECT P.Id
		,P.ClaUbicacion
		,M.IdWorkCenter
		,P.IdComponente
		,P.Id
		,P.FechaAdmScada
		,P.ClaTurno
		,P.FechaHoraInicial
		,COALESCE(P.FechaHoraReasignado,'1900-01-01 00:00:00.000')
		,COALESCE(P.FechaHoraAtencion,'1900-01-01 00:00:00.000')
		,COALESCE(P.FechaHoraFinal,'1900-01-01 00:00:00.000')
		,COALESCE(P.DuracionSegundos, 0)
		,P.ClaSeccionParo
		,[ClaEstatusReplica]
		,[ClaEventoNuevo]
		,[ClaEventoReasignacion]
		,[ClaEventoAtencion]
		,[ClaEventoSolucionado]
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
	FROM [AswSch].[AswBitAndon] P
	JOIN [AswSch].[AswCatWorkUnitVw] M
		ON P.IdComponente = M.ClaMaquina
	JOIN [AswSch].[ASWTraOrdenProduccion] PO
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
	WHERE ClaEstatusReplica = 1
	AND [FechaAdmSCADA]> dateadd(day, -14, getdate())
	AND ( @@SERVERNAME = 'DCSDTII02\SQL2012' OR (IdWorkCenter IN (26,28,29,30,31,33,34,35,37,38,106,110)))
	AND P.ClaTurno > 0

	SELECT @nId = MIN(id)
	FROM @Andon

	--SELECT * FROM @Andon

	WHILE @nId IS NOT NULL
	BEGIN

		SELECT @nClaUbicacion = ClaUbicacion
			,@sIdCelda = IdCelda
			,@nClaMaquina = ClaMaquina
			,@nTipoAlerta = 1--1 - Nuevo Paro, 2 - Justificacion, 3 - Atencion, 4 - Solucion, 5 - Reasignacion 
			,@nIdAndon = IdAndon
			,@tFecha = Fecha
			,@nClaTurno = ClaTurno
			,@tFechaHoraInicial = FechaHoraInicial
			,@tFechaHoraReasignacion = FechaHoraReasignacion
			,@tFechaHoraAtencion = FechaHoraAtencion
			,@tFechaHoraFinal = FechaHoraFinal
			,@nDuracionSegundos = DuracionSegundos
			,@nClaSeccionParo = ClaSeccionParo
			,@nClaSeccionParo  = ClaSeccionParo 
			,@nClaEstatusReplica  = ClaEstatusReplica 
			,@nClaEventoNuevo  = ClaEventoNuevo 
			,@nClaEventoReasignacion  = ClaEventoReasignacion 
			,@nClaEventoAtencion  = ClaEventoAtencion 
			,@nClaEventoSolucionado  = ClaEventoSolucionado 
			,@nClaArticulo = ClaArticulo
			,@nClaUsuarioMod = ClaUsuarioMod
			,@sNombrePcMod = NombrePcMod
			,@tFechaUltimaMod = FechaUltimaMod
			,@nClaTipoSeguimientoAlerta  = ClaTipoSeguimientoAlerta
			,@nClaGpoParo = ClaGpoParo
			,@sComentarios  = Comentarios
			,@sComentariosSolucion = ComentariosSolucion
			,@sNombreEmpleado = NombreEmpleado
			,@nIdReporteAndon	= IdReporteAndon
			,@nCorreoEnviado	= CorreoEnviado
		FROM @Andon
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
		
		SELECT @nIdNumDepto = ClaDepartamento
			,@nClaveCelda = ClaveWorkCenter
		FROM [AswSch].[AswCatWorkCenterVw]
		WHERE IdWorkCenter = @sIdCelda

			IF @nClaEventoNuevo = 1
			BEGIN 
				IF @PnDebug = 1 
				BEGIN
					print '[MSW_LNKSVR].[MCSW_ERP].[MSWSch].[MswPAIRegistraEventoAndonSCADASrv] '
					+'@pnClaUbicacion = '+  CAST(@nClaUbicacion AS VARCHAR)
					+',@pnIdNumDepto = '+   CAST(@nIdNumDepto AS VARCHAR)
					+',@pnClaveCelda = '+   CAST(@nClaveCelda  AS VARCHAR)
					+',@pnIdComponente = '+ CAST(@nClaMaquina AS VARCHAR)
					+',@pnIdEvento = '+     CAST(@nId  AS VARCHAR)
					+',@pnTipoAlerta = 2' 
					+',@ptFechaAdm = '+     CAST(@tFecha AS VARCHAR)
					+',@pnClaTurno = '+     CAST(@nClaTurno AS VARCHAR)
					+',@ptFechaHoraInicial = '+ CAST(@tFechaHoraInicial AS VARCHAR)
					--+',@ptFechaHoraJustificacion = '+ CAST(@tFechaHoraReasignacion AS VARCHAR)
					+',@ptFechaHoraAtencion = '+ CAST(@tFechaHoraAtencion AS VARCHAR)
					+',@ptFechaHoraFinal = '+ CAST(@tFechaHoraFinal AS VARCHAR)
					+',@pnEsparo = 0' 
					+',@pnEsMicroparo = 0' 
					+',@pnDuracionSegundos = '+ CAST(@nDuracionSegundos AS VARCHAR)
					+',@pnClaSeccionParo = '+   CAST(@nClaSeccionParo AS VARCHAR)
					+',@pnClaArticulo = '+      CAST(@nClaArticulo AS VARCHAR)
					+',@pnClaUsuarioMod = ' +   CAST(@nClaUsuarioMod AS VARCHAR)
					+',@psNombrePcMod = ' +     CAST(@sNombrePcMod AS VARCHAR)
					+',@ptFechaUltimaMod  = ' + CAST(@tFechaUltimaMod  AS VARCHAR)
					+',@pnClaTipoSeguimientoAlerta  = '+ CAST(@nClaTipoSeguimientoAlerta AS VARCHAR)
					+',@pnClaGpoParo          = '+ CAST(@nClaGpoParo AS VARCHAR)
					+',@psComentarios         = '+ CAST(@sComentarios AS VARCHAR)
					+',@psComentariosSolucion = '+ CAST(@sComentariosSolucion AS VARCHAR)
					+',@psNombreEmpleado      = '+ CAST(@sNombreEmpleado AS VARCHAR)
					+',@pnStatusError  = @nStatusError OUT'
					+',@psMsgError     = @sMsgError OUT'
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
						,@pnTipoAlerta = 2--1 - Nuevo Paro, 2 - Justificacion, 3 - Atencion, 4 - Solucion,  5 - Reasignacion 
						,@ptFechaAdm = @tFecha
						,@pnClaTurno = @nClaTurno
						,@ptFechaHoraInicial = @tFechaHoraInicial
						,@ptFechaHoraJustificacion = @tFechaHoraInicial
						,@ptFechaHoraAtencion = @tFechaHoraAtencion
						,@ptFechaHoraFinal = @tFechaHoraFinal
						,@pnEsparo = 0
						,@pnEsMicroparo = 0
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

						UPDATE [AswSch].[AswBitAndon] 
						SET  ClaEventoNuevo = 2
							,StatusError  = @nStatusError 
							,MsgErrorJustificacion     = 'Justificacion- '+@sMsgError 
							,IdErpMsw			= @nIdReporteAndon
						WHERE Id = @nId

				COMMIT
				END TRY
				BEGIN CATCH
					
						ROLLBACK
						SELECT @sError = ERROR_MESSAGE()
						print @sError
						UPDATE [AswSch].[AswBitAndon] 
						SET  ClaEstatusReplica = 1
							,MsgErrorJustificacion = 'Justificacion- '+@sError
							,StatusError = -1
						WHERE Id = @nId

						IF(@nCorreoEnviado = 0)
							BEGIN
		
								INSERT INTO @AndonCondicionador(Id,
																IdAndon,
																ClaCelda,
																ClaMaquina,
																ClaTurno,
																FechaHoraInicial,
																FechaHoraFinal,
																Error)
								SELECT @nId,
											@nIdAndon,
											@nClaveCelda,
											@nClaMaquina,
											@nClaTurno,
											@tFechaHoraInicial,
											@tFechaHoraFinal,
											@sError

								UPDATE AswSch.AswBitAndon
									SET EnvioCorreoSN = 1
									WHERE Id = @nId

							END
				END CATCH

				
			END

			IF @nClaEventoReasignacion = 1
			BEGIN 

				IF @PnDebug = 1 
				BEGIN
					print '[MSW_LNKSVR].[MCSW_ERP].[MSWSch].[MswPAIRegistraEventoAndonSCADASrv] '
					+'@pnClaUbicacion = '+  CAST(@nClaUbicacion AS VARCHAR)
					+',@pnIdNumDepto = '+   CAST(@nIdNumDepto AS VARCHAR)
					+',@pnClaveCelda = '+   CAST(@nClaveCelda  AS VARCHAR)
					+',@pnIdComponente = '+ CAST(@nClaMaquina AS VARCHAR)
					+',@pnIdEvento = '+     CAST(@nId  AS VARCHAR)
					+',@pnTipoAlerta = 5' 
					+',@ptFechaAdm = '+     CAST(@tFecha AS VARCHAR)
					+',@pnClaTurno = '+     CAST(@nClaTurno AS VARCHAR)
					+',@ptFechaHoraInicial = '+ CAST(@tFechaHoraInicial AS VARCHAR)
					--+',@ptFechaHoraJustificacion = '+ CAST(@tFechaHoraReasignacion AS VARCHAR)
					+',@ptFechaHoraAtencion = '+ CAST(@tFechaHoraAtencion AS VARCHAR)
					+',@ptFechaHoraFinal = '+ CAST(@tFechaHoraFinal AS VARCHAR)
					+',@pnEsparo = 0' 
					+',@pnEsMicroparo = 0' 
					+',@pnDuracionSegundos = '+ CAST(@nDuracionSegundos AS VARCHAR)
					+',@pnClaSeccionParo = '+   CAST(@nClaSeccionParo AS VARCHAR)
					+',@pnClaArticulo = '+      CAST(@nClaArticulo AS VARCHAR)
					+',@pnClaUsuarioMod = ' +   CAST(@nClaUsuarioMod AS VARCHAR)
					+',@psNombrePcMod = ' +     CAST(@sNombrePcMod AS VARCHAR)
					+',@ptFechaUltimaMod  = ' + CAST(@tFechaUltimaMod  AS VARCHAR)
					+',@pnClaTipoSeguimientoAlerta  = '+ CAST(@nClaTipoSeguimientoAlerta AS VARCHAR)
					+',@pnClaGpoParo          = '+ CAST(@nClaGpoParo AS VARCHAR)
					+',@psComentarios         = '+ CAST(@sComentarios AS VARCHAR)
					+',@psComentariosSolucion = '+ CAST(@sComentariosSolucion AS VARCHAR)
					+',@psNombreEmpleado      = '+ CAST(@sNombreEmpleado AS VARCHAR)
					+',@pnStatusError  = @nStatusError OUT'
					+',@psMsgError     = @sMsgError OUT'
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
						,@pnTipoAlerta = 5--1 - Nuevo Paro, 2 - Justificacion, 3 - Atencion, 4 - Solucion , 5 - Reasignacion 
						,@ptFechaAdm = @tFecha
						,@pnClaTurno = @nClaTurno
						,@ptFechaHoraInicial = @tFechaHoraInicial
						,@ptFechaHoraJustificacion = @tFechaHoraInicial
						,@ptFechaHoraAtencion = @tFechaHoraAtencion
						,@ptFechaHoraFinal = @tFechaHoraFinal
						,@pnEsparo = 0
						,@pnEsMicroparo = 0
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

					UPDATE [AswSch].[AswBitAndon] 
							SET  ClaEventoReasignacion = 2
								,StatusError  = @nStatusError 
								,MsgErrorReasignacion     = 'Reasignacion- '+@sMsgError 
								,IdErpMsw			= @nIdReporteAndon
							WHERE Id = @nId

				COMMIT
				END TRY
				BEGIN CATCH
					
						ROLLBACK
						SELECT @sError = ERROR_MESSAGE()
						print @sError
						UPDATE [AswSch].[AswBitAndon] 
						SET  ClaEstatusReplica = 1
							,MsgErrorReasignacion = 'Reasignacion- '+@sError
							,StatusError = -1
						WHERE Id = @nId

						IF(@nCorreoEnviado = 0)
							BEGIN
		
								INSERT INTO @AndonCondicionador(Id,
																IdAndon,
																ClaCelda,
																ClaMaquina,
																ClaTurno,
																FechaHoraInicial,
																FechaHoraFinal,
																Error)
								SELECT @nId,
											@nIdAndon,
											@nClaveCelda,
											@nClaMaquina,
											@nClaTurno,
											@tFechaHoraInicial,
											@tFechaHoraFinal,
											@sError

								UPDATE AswSch.AswBitAndon
									SET EnvioCorreoSN = 1
									WHERE Id = @nId

							END
				END CATCH

			END

			IF @nClaEventoAtencion = 1
			BEGIN 

				IF @PnDebug = 1 
				BEGIN
					print '[MSW_LNKSVR].[MCSW_ERP].[MSWSch].[MswPAIRegistraEventoAndonSCADASrv] '
					+'@pnClaUbicacion = '+  CAST(@nClaUbicacion AS VARCHAR)
					+',@pnIdNumDepto = '+   CAST(@nIdNumDepto AS VARCHAR)
					+',@pnClaveCelda = '+   CAST(@nClaveCelda  AS VARCHAR)
					+',@pnIdComponente = '+ CAST(@nClaMaquina AS VARCHAR)
					+',@pnIdEvento = '+     CAST(@nId  AS VARCHAR)
					+',@pnTipoAlerta = 3' 
					+',@ptFechaAdm = '+     CAST(@tFecha AS VARCHAR)
					+',@pnClaTurno = '+     CAST(@nClaTurno AS VARCHAR)
					+',@ptFechaHoraInicial = '+ CAST(@tFechaHoraInicial AS VARCHAR)
					--+',@ptFechaHoraJustificacion = '+ CAST(@tFechaHoraReasignacion AS VARCHAR)
					+',@ptFechaHoraAtencion = '+ CAST(@tFechaHoraAtencion AS VARCHAR)
					+',@ptFechaHoraFinal = '+ CAST(@tFechaHoraFinal AS VARCHAR)
					+',@pnEsparo = 0' 
					+',@pnEsMicroparo = 0' 
					+',@pnDuracionSegundos = '+ CAST(@nDuracionSegundos AS VARCHAR)
					+',@pnClaSeccionParo = '+   CAST(@nClaSeccionParo AS VARCHAR)
					+',@pnClaArticulo = '+      CAST(@nClaArticulo AS VARCHAR)
					+',@pnClaUsuarioMod = ' +   CAST(@nClaUsuarioMod AS VARCHAR)
					+',@psNombrePcMod = ' +     CAST(@sNombrePcMod AS VARCHAR)
					+',@ptFechaUltimaMod  = ' + CAST(@tFechaUltimaMod  AS VARCHAR)
					+',@pnClaTipoSeguimientoAlerta  = '+ CAST(@nClaTipoSeguimientoAlerta AS VARCHAR)
					+',@pnClaGpoParo          = '+ CAST(@nClaGpoParo AS VARCHAR)
					+',@psComentarios         = '+ CAST(@sComentarios AS VARCHAR)
					+',@psComentariosSolucion = '+ CAST(@sComentariosSolucion AS VARCHAR)
					+',@psNombreEmpleado      = '+ CAST(@sNombreEmpleado AS VARCHAR)
					+',@pnStatusError  = @nStatusError OUT'
					+',@psMsgError     = @sMsgError OUT'
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
						,@pnTipoAlerta = 3--1 - Nuevo Paro, 2 - Justificacion, 3 - Atencion, 4 - Solucion,  5 - Reasignacion 
						,@ptFechaAdm = @tFecha
						,@pnClaTurno = @nClaTurno
						,@ptFechaHoraInicial = @tFechaHoraInicial
						,@ptFechaHoraJustificacion = @tFechaHoraInicial
						,@ptFechaHoraAtencion = @tFechaHoraAtencion
						,@ptFechaHoraFinal = @tFechaHoraFinal
						,@pnEsparo = 0
						,@pnEsMicroparo = 0
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

					UPDATE [AswSch].[AswBitAndon] 
					SET  ClaEventoAtencion = 2
						,StatusError  = @nStatusError 
						,MsgErrorAtencion     = 'Atencion- '+@sMsgError 
						,IdErpMsw			= @nIdReporteAndon
					WHERE Id = @nId

				COMMIT
				END TRY
				BEGIN CATCH
					
						ROLLBACK
						SELECT @sError = ERROR_MESSAGE()
						print @sError
						UPDATE [AswSch].[AswBitAndon] 
						SET  ClaEstatusReplica = 1
							,MsgErrorAtencion = 'Atencion- '+@sError
							,StatusError = -1
						WHERE Id = @nId

						IF(@nCorreoEnviado = 0)
							BEGIN
		
								INSERT INTO @AndonCondicionador(Id,
																IdAndon,
																ClaCelda,
																ClaMaquina,
																ClaTurno,
																FechaHoraInicial,
																FechaHoraFinal,
																Error)
								SELECT @nId,
											@nIdAndon,
											@nClaveCelda,
											@nClaMaquina,
											@nClaTurno,
											@tFechaHoraInicial,
											@tFechaHoraFinal,
											@sError

								UPDATE AswSch.AswBitAndon
									SET EnvioCorreoSN = 1
									WHERE Id = @nId

							END
				END CATCH

			
			END

			IF @nClaEventoSolucionado = 1
			BEGIN 
				IF @PnDebug = 1 
				BEGIN
					print '[MSW_LNKSVR].[MCSW_ERP].[MSWSch].[MswPAIRegistraEventoAndonSCADASrv] '
					+'@pnClaUbicacion = '+  CAST(@nClaUbicacion AS VARCHAR)
					+',@pnIdNumDepto = '+   CAST(@nIdNumDepto AS VARCHAR)
					+',@pnClaveCelda = '+   CAST(@nClaveCelda  AS VARCHAR)
					+',@pnIdComponente = '+ CAST(@nClaMaquina AS VARCHAR)
					+',@pnIdEvento = '+     CAST(@nId  AS VARCHAR)
					+',@pnTipoAlerta = 4' 
					+',@ptFechaAdm = '+     CAST(@tFecha AS VARCHAR)
					+',@pnClaTurno = '+     CAST(@nClaTurno AS VARCHAR)
					+',@ptFechaHoraInicial = '+ CAST(@tFechaHoraInicial AS VARCHAR)
					--+',@ptFechaHoraJustificacion = '+ CAST(@tFechaHoraReasignacion AS VARCHAR)
					+',@ptFechaHoraAtencion = '+ CAST(@tFechaHoraAtencion AS VARCHAR)
					+',@ptFechaHoraFinal = '+ CAST(@tFechaHoraFinal AS VARCHAR)
					+',@pnEsparo = 0' 
					+',@pnEsMicroparo = 0' 
					+',@pnDuracionSegundos = '+ CAST(@nDuracionSegundos AS VARCHAR)
					+',@pnClaSeccionParo = '+   CAST(@nClaSeccionParo AS VARCHAR)
					+',@pnClaArticulo = '+      CAST(@nClaArticulo AS VARCHAR)
					+',@pnClaUsuarioMod = ' +   CAST(@nClaUsuarioMod AS VARCHAR)
					+',@psNombrePcMod = ' +     CAST(@sNombrePcMod AS VARCHAR)
					+',@ptFechaUltimaMod  = ' + CAST(@tFechaUltimaMod  AS VARCHAR)
					+',@pnClaTipoSeguimientoAlerta  = '+ CAST(@nClaTipoSeguimientoAlerta AS VARCHAR)
					+',@pnClaGpoParo          = '+ CAST(@nClaGpoParo AS VARCHAR)
					+',@psComentarios         = '+ CAST(@sComentarios AS VARCHAR)
					+',@psComentariosSolucion = '+ CAST(@sComentariosSolucion AS VARCHAR)
					+',@psNombreEmpleado      = '+ CAST(@sNombreEmpleado AS VARCHAR)
					+',@pnStatusError  = @nStatusError OUT'
					+',@psMsgError     = @sMsgError OUT'
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
						,@pnTipoAlerta = 4--1 - Nuevo Paro, 2 - Justificacion, 3 - Atencion, 4 - Solucion , 5 - Reasignacion 
						,@ptFechaAdm = @tFecha
						,@pnClaTurno = @nClaTurno
						,@ptFechaHoraInicial = @tFechaHoraInicial
						,@ptFechaHoraJustificacion = @tFechaHoraInicial
						,@ptFechaHoraAtencion = @tFechaHoraAtencion
						,@ptFechaHoraFinal = @tFechaHoraFinal
						,@pnEsparo = 0
						,@pnEsMicroparo = 0
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
						,@pnStatusError         = @nStatusError OUT
						,@psMsgError            = @sMsgError    OUT
						,@pnIdReporteAndon = @nIdReporteAndon OUT
					
					UPDATE [AswSch].[AswBitAndon] 
					SET   ClaEventoSolucionado = 2
						 ,StatusError  = @nStatusError 
						 ,MsgErrorSolucion     = 'Solucion- '+@sMsgError 
						 ,IdErpMsw		= @nIdReporteAndon
						WHERE Id = @nId

				COMMIT
				END TRY
				BEGIN CATCH
					
						ROLLBACK
						SELECT @sError = ERROR_MESSAGE()
						print @sError
						UPDATE [AswSch].[AswBitAndon] 
						SET  ClaEstatusReplica = 1
							,MsgErrorSolucion = 'Solucion- '+@sError
							,StatusError = -1
						WHERE Id = @nId

						IF(@nCorreoEnviado = 0)
							BEGIN
		
								INSERT INTO @AndonCondicionador(Id,
																IdAndon,
																ClaCelda,
																ClaMaquina,
																ClaTurno,
																FechaHoraInicial,
																FechaHoraFinal,
																Error)
								SELECT @nId,
											@nIdAndon,
											@nClaveCelda,
											@nClaMaquina,
											@nClaTurno,
											@tFechaHoraInicial,
											@tFechaHoraFinal,
											@sError

								UPDATE AswSch.AswBitAndon
									SET EnvioCorreoSN = 1
									WHERE Id = @nId

							END
				END CATCH
			END

			IF EXISTS (SELECT 1 FROM [AswSch].[AswBitAndon] 
						WHERE ISNULL(ClaEventoNuevo,0) <> 1 
						AND   ISNULL(ClaEventoAtencion,0)  <> 1
						AND   ISNULL(ClaEventoReasignacion,0)      <> 1
						AND   ISNULL(ClaEventoSolucionado,0)   <> 1 
						AND   Id = @nId )
			BEGIN 
				UPDATE  [AswSch].[AswBitAndon] 
				SET  ClaEstatusReplica = 2
				WHERE Id = @nId
			END

		SELECT @nId = MIN(id)
		FROM @Andon
		WHERE Id>@nId
	END

	IF EXISTS(SELECT 1 FROM @AndonCondicionador)
	BEGIN
		BEGIN TRY
			DECLARE @sPara VARCHAR(100);
			SELECT @sPara = Svalor1
				FROM AswSch.ASWCfgConfiguracion
				where ClaConfiguracion = 15

			SELECT @sMensaje = @sMensaje +
				'<tr>'+
					'<td align="center" style="width:60px;">'+CAST(P.IdAndon AS VARCHAR)+'</td>'+
					'<td align="center" style="width:60px;">'+C.NomWorkCenter+'</td>'+
					'<td align="center" style="width:60px;">'+M.NomMaquina+'</td>'+
					'<td align="center" style="width:60px;">'+CAST(P.ClaTurno AS VARCHAR)+'</td>'+
					'<td align="center" style="width:60px;">'+CONVERT(VARCHAR, CONVERT(DATETIME,P.FechaHoraInicial),113)+'</td>'+
					'<td align="center" style="width:60px;">'+CONVERT(VARCHAR, CONVERT(DATETIME,P.FechaHoraFinal),113)+'</td>'+
					'<td align="center" style="width:60px;">'+P.Error+'</td></tr>'
				FROM @AndonCondicionador P 
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
				,@recipients = @sPara
				,@subject = @sSub
				,@body = @sError
				,@body_format = 'html'
				,@importance = 'HIGH'
		END CATCH
	END
END


