USE [ASW]
GO
/****** Object:  StoredProcedure [AswSch].[ASW_CU204_Pag1_ReplicaParos_Proc]    Script Date: 25/05/2022 09:12:47 a. m. ******/
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
		,@nIdCelda INT
		,@nIdNumDepto INT
		,@nClaveCelda INT
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

	DECLARE @Paro TABLE(
		 Id INT
		,ClaUbicacion INT
		,IdCelda INT
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
	)
	SELECT P.Id
		,P.ClaUbicacion
		,M.ClaCelda
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
	FROM [AswSch].[AswBitBitacoraParo] P
	JOIN [AswSch].[AswCatMaquina] M
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
	WHERE ClaEstatusReplica = 1
	AND  [FechaAdmSCADA]> dateadd(day, -14, getdate())
	AND ( @@SERVERNAME = 'DCSDTII02\SQL2012' OR (ClaCelda IN (112,34)))
	
	
	--no evaluar columnas de baja logica de catalogos en 'reportes'
	--si es left no se pone en el where
	--AND  SP.BajaLogica=0
	--AND  RASP.BajaLogica=0
	--AND  RATSA.BajaLogica=0
	--AND  CTSA.BajaLogica=0
	--AND  P.BajaLogica = 0
	
	
	--CERRAR PAROS QUE SE QUEDARON ABIERTOS PERO YA HAY UNO MAS RECIENTE

	SELECT @nId = MIN(id)
	FROM @Paro

	WHILE @nId IS NOT NULL
	BEGIN

		SELECT @nClaUbicacion = ClaUbicacion
			,@nIdCelda = IdCelda
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
		FROM @Paro
		WHERE Id = @nId		

	
		SELECT @nIdNumDepto = ClaAreaProduccion
			,@nClaveCelda = ClaveCelda
		FROM [AswSch].[AswCatCeldas]
		WHERE IdCelda = @nIdCelda


			IF ISNULL(@nClaEventoCierre ,0) = 0 --SINO ES UN PARO CERRADO EN AUTOMATICO
			BEGIN
				print 'No es automatico'
				IF @nClaEventoParo = 1
				BEGIN 
					--RETURN 

					--NGP 2022-03-17 COMENTO LA LLAMADA AL SERVICIO YA QUE EN EL ERP NO CREAN PAROS HASTA QUE TIENEN LA JUSTIFICACION

					--EXEC [MSW_LNKSVR].[MCSW_ERP].[MSWSch].[MswPAIRegistraEventoAndonSCADASrv] 
					--	@pnClaUbicacion = @nClaUbicacion
					--	--,@pnIdCelda = @nIdCelda
					--	,@pnIdNumDepto = @nIdNumDepto
					--	,@pnClaveCelda = @nClaveCelda 
					--	,@pnIdComponente = @nClaMaquina--(CatMAquina)
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
					
					IF @PnDebug = 1
					BEGIN 
						print 'EXEC [MSW_LNKSVR].[MCSW_ERP].[MSWSch].[MswPAIRegistraEventoAndonSCADASrv]'
							+'@pnClaUbicacion = ' + ISNULL(CAST(@nClaUbicacion AS VARCHAR),'null')
							+'--,@pnIdCelda = '   + ISNULL(CAST(@nIdCelda AS VARCHAR),'null')
							+',@pnIdNumDepto = '  + ISNULL(CAST(@nIdNumDepto AS VARCHAR),'null')
							+',@pnClaveCelda = '  + ISNULL(CAST(@nClaveCelda AS VARCHAR),'null')
							+',@pnIdComponente = '+ ISNULL(CAST(@nClaMaquina AS VARCHAR),'null')--(CatMAquina)
							+',@pnIdEvento = '    + ISNULL(CAST(@nId AS VARCHAR),'null') --Id SqlServer (Paro/IdAndon Avisor)
							+',@pnTipoAlerta = 2'--1 - Nuevo Paro, 2 - Justificacion, 3 - Atencion, 4 - Solucion , 5.- Reasignacion 
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
					END 

					BEGIN TRAN
					BEGIN TRY
						EXEC [MSW_LNKSVR].[MCSW_ERP].[MSWSch].[MswPAIRegistraEventoAndonSCADASrv]
							@pnClaUbicacion = @nClaUbicacion
							--,@pnIdCelda = @nIdCelda
							,@pnIdNumDepto = @nIdNumDepto
							,@pnClaveCelda = @nClaveCelda 
							,@pnIdComponente = @nClaMaquina--(CatMAquina)
							,@pnIdEvento = @nId --Id SqlServer (Paro/IdAndon Avisor)
							,@pnTipoAlerta = 2--1 - Nuevo Paro, 2 - Justificacion, 3 - Atencion, 4 - Solucion , 5.- Reasignacion 
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
					
						UPDATE [AswSch].[AswBitBitacoraParo] 
						SET  ClaEventoJustificacion = 2
						    ,StatusError  = @nStatusError 
							,MsgError     = 'Justificacion- '+@sMsgError 
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
								,MsgError = 'Justificacion- '+@sError
								,StatusError = -1
							WHERE Id = @nId

					END CATCH
				END

				IF @nClaEventoReasignacion = 1
				BEGIN 
					
					IF @PnDebug = 1
					BEGIN 
						print 'EXEC [MSW_LNKSVR].[MCSW_ERP].[MSWSch].[MswPAIRegistraEventoAndonSCADASrv]'
							+'@pnClaUbicacion = ' + ISNULL(CAST(@nClaUbicacion AS VARCHAR),'null')
							+'--,@pnIdCelda = '   + ISNULL(CAST(@nIdCelda AS VARCHAR),'null')
							+',@pnIdNumDepto = '  + ISNULL(CAST(@nIdNumDepto AS VARCHAR),'null')
							+',@pnClaveCelda = '  + ISNULL(CAST(@nClaveCelda AS VARCHAR),'null')
							+',@pnIdComponente = '+ ISNULL(CAST(@nClaMaquina AS VARCHAR),'null')--(CatMAquina)
							+',@pnIdEvento = '    + ISNULL(CAST(@nId AS VARCHAR),'null') --Id SqlServer (Paro/IdAndon Avisor)
							+',@pnTipoAlerta = 5'--1 - Nuevo Paro, 2 - Justificacion, 3 - Atencion, 4 - Solucion , 5.- Reasignacion 
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
					END 	

					BEGIN TRAN
					BEGIN TRY
						EXEC [MSW_LNKSVR].[MCSW_ERP].[MSWSch].[MswPAIRegistraEventoAndonSCADASrv]
							@pnClaUbicacion = @nClaUbicacion
							--,@pnIdCelda = @nIdCelda
							,@pnIdNumDepto = @nIdNumDepto
							,@pnClaveCelda = @nClaveCelda 
							,@pnIdComponente = @nClaMaquina--(CatMAquina)
							,@pnIdEvento = @nId --Id SqlServer (Paro/IdAndon Avisor)
							,@pnTipoAlerta = 5 --1 - Nuevo Paro, 2 - Justificacion, 3 - Atencion, 4 - Solucion , 5.- Reasignacion 
							,@ptFechaAdm = @tFecha
							,@pnClaTurno = @nClaTurno
							,@ptFechaHoraInicial = @tFechaHoraInicial
							,@ptFechaHoraJustificacion = @tFechaHoraReasignacion--@tFechaHoraJustificacion
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

						UPDATE [AswSch].[AswBitBitacoraParo] 
						SET  ClaEventoReasignacion = 2
							,StatusError  = @nStatusError 
							,MsgError     = 'Reasigna- '+@sMsgError 
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
								,MsgError = 'Reasigna- '+@sError
								,StatusError = -1
							WHERE Id = @nId

					END CATCH
				END

				IF @nClaEventoAtencion = 1
				BEGIN 

					IF @PnDebug = 1
					BEGIN 
						print 'EXEC [MSW_LNKSVR].[MCSW_ERP].[MSWSch].[MswPAIRegistraEventoAndonSCADASrv]'
							+'@pnClaUbicacion = ' + ISNULL(CAST(@nClaUbicacion AS VARCHAR),'null')
							+'--,@pnIdCelda = '   + ISNULL(CAST(@nIdCelda AS VARCHAR),'null')
							+',@pnIdNumDepto = '  + ISNULL(CAST(@nIdNumDepto AS VARCHAR),'null')
							+',@pnClaveCelda = '  + ISNULL(CAST(@nClaveCelda AS VARCHAR),'null')
							+',@pnIdComponente = '+ ISNULL(CAST(@nClaMaquina AS VARCHAR),'null')--(CatMAquina)
							+',@pnIdEvento = '    + ISNULL(CAST(@nId AS VARCHAR),'null') --Id SqlServer (Paro/IdAndon Avisor)
							+',@pnTipoAlerta = 3'--1 - Nuevo Paro, 2 - Justificacion, 3 - Atencion, 4 - Solucion , 5.- Reasignacion 
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
					END 

					BEGIN TRAN
					BEGIN TRY
						EXEC [MSW_LNKSVR].[MCSW_ERP].[MSWSch].[MswPAIRegistraEventoAndonSCADASrv] 
							@pnClaUbicacion = @nClaUbicacion
							--,@pnIdCelda = @nIdCelda
							,@pnIdNumDepto = @nIdNumDepto
							,@pnClaveCelda = @nClaveCelda 
							,@pnIdComponente = @nClaMaquina--(CatMAquina)
							,@pnIdEvento = @nId --Id SqlServer (Paro/IdAndon Avisor)
							,@pnTipoAlerta = 3--1 - Nuevo Paro, 2 - Justificacion, 3 - Atencion, 4 - Solucion , 5.- Reasignacion 
							,@ptFechaAdm = @tFecha
							,@pnClaTurno = @nClaTurno
							,@ptFechaHoraInicial = @tFechaHoraInicial
							,@ptFechaHoraJustificacion = @tFechaHoraJustificacion
							,@ptFechaHoraReasignacion = @tFechaHoraReasignacion
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

						UPDATE [AswSch].[AswBitBitacoraParo] 
						SET  ClaEventoAtencion = 2
							,StatusError  = @nStatusError 
							,MsgError     = 'Atencion- '+@sMsgError 
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
								,MsgError = 'Atencion- '+@sError
								,StatusError = -1
							WHERE Id = @nId

					END CATCH
				END

				IF @nClaEventoSolucionado = 1
				BEGIN 
					
					IF @PnDebug = 1
					BEGIN 
						print 'EXEC [MSW_LNKSVR].[MCSW_ERP].[MSWSch].[MswPAIRegistraEventoAndonSCADASrv]'
							+'@pnClaUbicacion = ' + ISNULL(CAST(@nClaUbicacion AS VARCHAR),'null')
							+'--,@pnIdCelda = '   + ISNULL(CAST(@nIdCelda AS VARCHAR),'null')
							+',@pnIdNumDepto = '  + ISNULL(CAST(@nIdNumDepto AS VARCHAR),'null')
							+',@pnClaveCelda = '  + ISNULL(CAST(@nClaveCelda AS VARCHAR),'null')
							+',@pnIdComponente = '+ ISNULL(CAST(@nClaMaquina AS VARCHAR),'null')--(CatMAquina)
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
					END 

					BEGIN TRAN
					BEGIN TRY
						EXEC [MSW_LNKSVR].[MCSW_ERP].[MSWSch].[MswPAIRegistraEventoAndonSCADASrv]
							@pnClaUbicacion = @nClaUbicacion
							--,@pnIdCelda = @nIdCelda
							,@pnIdNumDepto = @nIdNumDepto
							,@pnClaveCelda = @nClaveCelda 
							,@pnIdComponente = @nClaMaquina--(CatMAquina)
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

						UPDATE [AswSch].[AswBitBitacoraParo] 
						SET  ClaEventoSolucionado = 2
							,StatusError  = @nStatusError 
							,MsgError     = 'Solucion- '+@sMsgError 
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
								,MsgError = 'Solucion- '+@sError
								,StatusError = -1
							WHERE Id = @nId

					END CATCH
				END
			END
			ELSE --PARO CERRADO EN AUTOMATICO
			BEGIN
				print 'EsCerradoAuto'

				IF  ISNULL(@nClaEventoCierre,0) = 1
				BEGIN
					print 'Solucionar'
					IF @PnDebug = 1
					BEGIN 
					print 'EXEC [MSW_LNKSVR].[MCSW_ERP].[MSWSch].[MswPAIRegistraEventoAndonSCADASrv]'
							+'@pnClaUbicacion = ' + ISNULL(CAST(@nClaUbicacion AS VARCHAR),'null')
							+'--,@pnIdCelda = '   + ISNULL(CAST(@nIdCelda AS VARCHAR),'null')
							+',@pnIdNumDepto = '  + ISNULL(CAST(@nIdNumDepto AS VARCHAR),'null')
							+',@pnClaveCelda = '  + ISNULL(CAST(@nClaveCelda AS VARCHAR),'null')
							+',@pnIdComponente = '+ ISNULL(CAST(@nClaMaquina AS VARCHAR),'null')--(CatMAquina)
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
					END 

					BEGIN TRAN
					BEGIN TRY
						EXEC [MSW_LNKSVR].[MCSW_ERP].[MSWSch].[MswPAIRegistraEventoAndonSCADASrv]
							@pnClaUbicacion = @nClaUbicacion
							--,@pnIdCelda = @nIdCelda
							,@pnIdNumDepto = @nIdNumDepto
							,@pnClaveCelda = @nClaveCelda 
							,@pnIdComponente = @nClaMaquina--(CatMAquina)
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

							UPDATE [AswSch].[AswBitBitacoraParo] 
							SET  ClaEventoCierre = 2
								,StatusError  = @nStatusError 
								,MsgError     = 'Solucion Atm- '+@sMsgError 
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
								,MsgError = 'Solucion Atm- '+@sError
								,StatusError = -1
							WHERE Id = @nId

					END CATCH
				END
				ELSE
				BEGIN
					
					IF @PnDebug = 1
					BEGIN 
					print 'EXEC [MSW_LNKSVR].[MCSW_ERP].[MSWSch].[MswPAIRegistraEventoAndonSCADASrv]'
							+'@pnClaUbicacion = ' + ISNULL(CAST(@nClaUbicacion AS VARCHAR),'null')
							+'--,@pnIdCelda = '   + ISNULL(CAST(@nIdCelda AS VARCHAR),'null')
							+',@pnIdNumDepto = '  + ISNULL(CAST(@nIdNumDepto AS VARCHAR),'null')
							+',@pnClaveCelda = '  + ISNULL(CAST(@nClaveCelda AS VARCHAR),'null')
							+',@pnIdComponente = '+ ISNULL(CAST(@nClaMaquina AS VARCHAR),'null')--(CatMAquina)
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
					END 

					BEGIN TRAN
					BEGIN TRY
						EXEC [MSW_LNKSVR].[MCSW_ERP].[MSWSch].[MswPAIRegistraEventoAndonSCADASrv]
							@pnClaUbicacion = @nClaUbicacion
							--,@pnIdCelda = @nIdCelda
							,@pnIdNumDepto = @nIdNumDepto
							,@pnClaveCelda = @nClaveCelda 
							,@pnIdComponente = @nClaMaquina--(CatMAquina)
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

							UPDATE [AswSch].[AswBitBitacoraParo] 
							SET ClaEventoAtencion      =  CASE WHEN @nClaEventoAtencion      = 1 THEN 2 ELSE @nClaEventoAtencion      END
							,   ClaEventoJustificacion =  CASE WHEN @nClaEventoJustificacion = 1 THEN 2 ELSE @nClaEventoJustificacion END
							,   ClaEventoReasignacion  =  CASE WHEN @nClaEventoReasignacion  = 1 THEN 2 ELSE @nClaEventoReasignacion  END
							,   ClaEventoSolucionado   =  CASE WHEN @nClaEventoSolucionado   = 1 THEN 2 ELSE @nClaEventoSolucionado   END 
							,StatusError  = @nStatusError 
							,MsgError     = 'Tipo 6 - '+@sMsgError 
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

					END CATCH


				END
			END 

			IF EXISTS (SELECT 1 FROM [AswSch].[AswBitBitacoraParo] 
						WHERE ISNULL(ClaEventoJustificacion,0) <> 1 
						AND   ISNULL(ClaEventoReasignacion,0)  <> 1
						AND   ISNULL(ClaEventoAtencion,0)      <> 1
						AND   ISNULL(ClaEventoSolucionado,0)   <> 1 
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

END

