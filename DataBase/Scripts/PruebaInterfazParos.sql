BEGIN TRAN

-->Paro solucionado sin arranque de maquina
--1.-Se crea un nuevo paro
--no se envia al ERP

--2.-se justifica un paro con razon default (justificacion)
--EXEC [MSW_LNKSVR].[MCSW_Integra].[MSWSch].[MswPAIRegistraEventoAndonSCADASrv]	@pnClaUbicacion = 68,	@pnIdNumDepto = 2,	@pnClaveCelda = 73,	@pnIdComponente = 660,	@pnIdEvento = 29411,	@pnTipoAlerta = 2,	@ptFechaAdm = '2022-05-14 00:00:00.000',	@pnClaTurno = 3,	@ptFechaHoraInicial = '2022-05-14 21:00:50.000',	@ptFechaHoraJustificacion = '1900-01-01 00:00:00.000',	@ptFechaHoraAtencion = '1900-01-01 00:00:00.000',	@ptFechaHoraFinal = '1900-01-01 00:00:00.000',	@pnEsparo = 1,	@pnEsMicroparo = 0,	@pnDuracionSegundos = 0,	@pnClaSeccionParo = 44,	@pnClaArticulo = 606122,	@pnClaUsuarioMod = 0,	@psNombrePcMod = 'PB COLLATED CELL #73_rep',	@ptFechaUltimaMod = '2022-05-14 21:03:51.000',	@pnClaTipoSeguimientoAlerta = 1,	@pnClaGpoParo = 3,	@psComentarios =' -',	@psComentariosSolucion = '-',	@psNombreEmpleado = '-'

--3.-se ingresa la justificacion "real" (justificacion)
--ERP: 'An active downtime was found for this component. Please close the active downtime to continue.'
--nota para DEVAVISOR: ClaTipoSeguimientoAlerta se requiere pero no esta disponible
--EXEC [MSW_LNKSVR].[MCSW_Integra].[MSWSch].[MswPAIRegistraEventoAndonSCADASrv]	@pnClaUbicacion = 68,	@pnIdNumDepto = 2,	@pnClaveCelda = 73,	@pnIdComponente = 660,	@pnIdEvento = 29411,	@pnTipoAlerta = 2,	@ptFechaAdm = '2022-05-14 00:00:00.000',	@pnClaTurno = 3,	@ptFechaHoraInicial = '2022-05-14 21:00:50.000',	@ptFechaHoraJustificacion = '2022-05-15 00:01:10.000',	@ptFechaHoraAtencion = '1900-01-01 00:00:00.000',	@ptFechaHoraFinal = '1900-01-01 00:00:00.000',	@pnEsparo = 1,	@pnEsMicroparo = 0,	@pnDuracionSegundos = 0,	@pnClaSeccionParo = 166,	@pnClaArticulo = 606122,	@pnClaUsuarioMod = 3502001,	@psNombrePcMod = 'MRODRIGUEZC2_rep',	@ptFechaUltimaMod = '2022-05-15 00:01:10.000',	@pnClaTipoSeguimientoAlerta = 1,	@pnClaGpoParo = 7,	@psComentarios = 'pan',	@psComentariosSolucion = '-',	@psNombreEmpleado = 'peter,'

--4.-se reasigna (reasignacion)
--Cerro el paro con fecha solucion @ptFechaHoraJustificacion y solucion "RE-ASSIGNED | {IdReporteAndonNuevo}" y creo un nuevo paro con fecha creado @ptFechaHoraJustificacion
--EXEC [MSW_LNKSVR].[MCSW_Integra].[MSWSch].[MswPAIRegistraEventoAndonSCADASrv]	@pnClaUbicacion = 68,	@pnIdNumDepto = 2,	@pnClaveCelda = 73,	@pnIdComponente = 660,	@pnIdEvento = 29411,	@pnTipoAlerta = 5,	@ptFechaAdm = '2022-05-14 00:00:00.000',	@pnClaTurno = 3,	@ptFechaHoraInicial = '2022-05-14 21:00:50.000',	@ptFechaHoraJustificacion = '2022-05-15 00:09:18.000',	@ptFechaHoraAtencion = '1900-01-01 00:00:00.000',	@ptFechaHoraFinal = '1900-01-01 00:00:00.000',	@pnEsparo = 1,	@pnEsMicroparo = 0,	@pnDuracionSegundos = 0,	@pnClaSeccionParo = 30,	@pnClaArticulo = 606122,	@pnClaUsuarioMod = 3502001,	@psNombrePcMod = 'MRODRIGUEZC2_rep',	@ptFechaUltimaMod = '2022-05-15 00:09:18.000',	@pnClaTipoSeguimientoAlerta = 1,	@pnClaGpoParo = 2,	@psComentarios = 'pan',	@psComentariosSolucion = '-',	@psNombreEmpleado = 'peter,'

--5.-se atiende el paro (atencion)
--El paro abierto se marco como atendido
--EXEC [MSW_LNKSVR].[MCSW_Integra].[MSWSch].[MswPAIRegistraEventoAndonSCADASrv]	@pnClaUbicacion = 68,	@pnIdNumDepto = 2,	@pnClaveCelda = 73,	@pnIdComponente = 660,	@pnIdEvento = 29411,	@pnTipoAlerta = 3,	@ptFechaAdm = '2022-05-14 00:00:00.000',	@pnClaTurno = 3,	@ptFechaHoraInicial = '2022-05-14 21:00:50.000',	@ptFechaHoraJustificacion = '2022-05-15 00:01:10.000',	@ptFechaHoraAtencion = '2022-05-15 00:20:11.000',	@ptFechaHoraFinal = '1900-01-01 00:00:00.000',	@pnEsparo = 1,	@pnEsMicroparo = 0,	@pnDuracionSegundos = 0,	@pnClaSeccionParo = 30,	@pnClaArticulo = 606122,	@pnClaUsuarioMod = 3502001,	@psNombrePcMod = 'MRODRIGUEZC2_rep',	@ptFechaUltimaMod = '2022-05-15 00:20:11.000',	@pnClaTipoSeguimientoAlerta = 1,	@pnClaGpoParo = 2,	@psComentarios = 'pan',	@psComentariosSolucion = '-',	@psNombreEmpleado = 'peter,'

--6.-se soluciona el paro (solucionado)
--la maquina sigue parada, se debe crear un nuevo paro en Avisor y reportarse con la autojustificacion
--nota para DEVAVISOR no se creo el microparo o no se refresco correctamente la app...
--EXEC [MSW_LNKSVR].[MCSW_Integra].[MSWSch].[MswPAIRegistraEventoAndonSCADASrv]	@pnClaUbicacion = 68,	@pnIdNumDepto = 2,	@pnClaveCelda = 73,	@pnIdComponente = 660,	@pnIdEvento = 29411,	@pnTipoAlerta = 4,	@ptFechaAdm = '2022-05-14 00:00:00.000',	@pnClaTurno = 3,	@ptFechaHoraInicial = '2022-05-14 21:00:50.000',	@ptFechaHoraJustificacion = '2022-05-15 00:01:10.000',	@ptFechaHoraAtencion = '2022-05-15 00:20:11.000',	@ptFechaHoraFinal = '2022-05-15 00:30:07.000',	@pnEsparo = 1,	@pnEsMicroparo = 0,	@pnDuracionSegundos = 12557,	@pnClaSeccionParo = 30,	@pnClaArticulo = 606122,	@pnClaUsuarioMod = 0,	@psNombrePcMod = 'PB COLLATED CELL #73_rep',	@ptFechaUltimaMod = '2022-05-15 00:30:07.000',	@pnClaTipoSeguimientoAlerta = 1,	@pnClaGpoParo = 2,	@psComentarios = 'pan',	@psComentariosSolucion = 'it was fixed',	@psNombreEmpleado = 'peter,'
--termina este flujo porque no se pueden hacer mas acciones sobre un paro solucionado


-->paro justificado con arranque de maquina
--inicia con la solucion real
--1.-se ingresa la justificacion "real" (justificacion)
--EXEC [MSW_LNKSVR].[MCSW_Integra].[MSWSch].[MswPAIRegistraEventoAndonSCADASrv]	@pnClaUbicacion = 68,	@pnIdNumDepto = 2,	@pnClaveCelda = 73,	@pnIdComponente = 660,	@pnIdEvento = 29416,	@pnTipoAlerta = 2,	@ptFechaAdm = '2022-05-14 00:00:00.000',	@pnClaTurno = 3,	@ptFechaHoraInicial = '2022-05-15 00:39:21.000',	@ptFechaHoraJustificacion = '2022-05-15 00:49:13.000',	@ptFechaHoraAtencion = '1900-01-01 00:00:00.000',	@ptFechaHoraFinal = '1900-01-01 00:00:00.000',	@pnEsparo = 1,	@pnEsMicroparo = 0,	@pnDuracionSegundos = 0,	@pnClaSeccionParo = 30,	@pnClaArticulo = 606122,	@pnClaUsuarioMod = 3502001,	@psNombrePcMod = 'MRODRIGUEZC2_rep',	@ptFechaUltimaMod = '2022-05-15 00:49:13.000',	@pnClaTipoSeguimientoAlerta = 1,	@pnClaGpoParo = 2,	@psComentarios = 'it is broken',	@psComentariosSolucion = '-',	@psNombreEmpleado = 'kevin,'

--2.-se arranca la maquina
--nota para DEVAVISOR genero el EstatusReplica=1 pero no EventoCierre


-->paro reasignado con arranque de maquina
--inicia con la solucion real
--1.-se ingresa la justificacion "real" (justificacion)
--EXEC [MSW_LNKSVR].[MCSW_Integra].[MSWSch].[MswPAIRegistraEventoAndonSCADASrv]	@pnClaUbicacion = 68,	@pnIdNumDepto = 2,	@pnClaveCelda = 73,	@pnIdComponente = 660,	@pnIdEvento = 29417,	@pnTipoAlerta = 2,	@ptFechaAdm = '2022-05-14 00:00:00.000',	@pnClaTurno = 3,	@ptFechaHoraInicial = '2022-05-15 00:55:58.000',	@ptFechaHoraJustificacion = '1900-01-01 00:00:00.000',	@ptFechaHoraAtencion = '1900-01-01 00:00:00.000',	@ptFechaHoraFinal = '1900-01-01 00:00:00.000',	@pnEsparo = 1,	@pnEsMicroparo = 0,	@pnDuracionSegundos = 0,	@pnClaSeccionParo = 44,	@pnClaArticulo = 606122,	@pnClaUsuarioMod = 0,	@psNombrePcMod = 'PB COLLATED CELL #73_rep',	@ptFechaUltimaMod = '2022-05-15 01:00:19.000',	@pnClaTipoSeguimientoAlerta = 1,	@pnClaGpoParo = 3,	@psComentarios = '-',	@psComentariosSolucion = '-',	@psNombreEmpleado = '-,'

--2.-se reasigna
--EXEC [MSW_LNKSVR].[MCSW_Integra].[MSWSch].[MswPAIRegistraEventoAndonSCADASrv]	@pnClaUbicacion = 68,	@pnIdNumDepto = 2,	@pnClaveCelda = 73,	@pnIdComponente = 660,	@pnIdEvento = 29417,	@pnTipoAlerta = 5,	@ptFechaAdm = '2022-05-14 00:00:00.000',	@pnClaTurno = 3,	@ptFechaHoraInicial = '2022-05-15 00:55:58.000',	@ptFechaHoraJustificacion = '2022-05-15 01:12:57.000',	@ptFechaHoraAtencion = '1900-01-01 00:00:00.000',	@ptFechaHoraFinal = '1900-01-01 00:00:00.000',	@pnEsparo = 1,	@pnEsMicroparo = 0,	@pnDuracionSegundos = 0,	@pnClaSeccionParo = 165,	@pnClaArticulo = 606122,	@pnClaUsuarioMod = 3502001,	@psNombrePcMod = 'MRODRIGUEZC2_rep',	@ptFechaUltimaMod = '2022-05-15 01:12:57.000',	@pnClaTipoSeguimientoAlerta = 1,	@pnClaGpoParo = 7,	@psComentarios = 'it is not working',	@psComentariosSolucion = '-',	@psNombreEmpleado = 'billy R,'

--3.-se arranca la maquina
--nota para DEVAVISOR genero el EstatusReplica=1 pero no EventoCierre


-->paro atendido con arranque de maquina (simulado... no se hizo la secuencia con la tablet)
--inicia con la solucion real
--1.-se ingresa la justificacion "real" (justificacion)
EXEC [MSW_LNKSVR].[MCSW_Integra].[MSWSch].[MswPAIRegistraEventoAndonSCADASrv]	@pnClaUbicacion = 68,	@pnIdNumDepto = 2,	@pnClaveCelda = 73,	@pnIdComponente = 660,	@pnIdEvento = 29418,	@pnTipoAlerta = 2,	@ptFechaAdm = '2022-05-14 00:00:00.000',	@pnClaTurno = 3,	@ptFechaHoraInicial = '2022-05-15 00:55:58.000',	@ptFechaHoraJustificacion = '1900-01-01 00:00:00.000',	@ptFechaHoraAtencion = '1900-01-01 00:00:00.000',	@ptFechaHoraFinal = '1900-01-01 00:00:00.000',	@pnEsparo = 1,	@pnEsMicroparo = 0,	@pnDuracionSegundos = 0,	@pnClaSeccionParo = 44,	@pnClaArticulo = 606122,	@pnClaUsuarioMod = 0,	@psNombrePcMod = 'PB COLLATED CELL #73_rep',	@ptFechaUltimaMod = '2022-05-15 01:00:19.000',	@pnClaTipoSeguimientoAlerta = 1,	@pnClaGpoParo = 3,	@psComentarios = '-',	@psComentariosSolucion = '-',	@psNombreEmpleado = '-,'

--2.-se reasigna
EXEC [MSW_LNKSVR].[MCSW_Integra].[MSWSch].[MswPAIRegistraEventoAndonSCADASrv]	@pnClaUbicacion = 68,	@pnIdNumDepto = 2,	@pnClaveCelda = 73,	@pnIdComponente = 660,	@pnIdEvento = 29418,	@pnTipoAlerta = 5,	@ptFechaAdm = '2022-05-14 00:00:00.000',	@pnClaTurno = 3,	@ptFechaHoraInicial = '2022-05-15 00:55:58.000',	@ptFechaHoraJustificacion = '2022-05-15 01:12:57.000',	@ptFechaHoraAtencion = '1900-01-01 00:00:00.000',	@ptFechaHoraFinal = '1900-01-01 00:00:00.000',	@pnEsparo = 1,	@pnEsMicroparo = 0,	@pnDuracionSegundos = 0,	@pnClaSeccionParo = 165,	@pnClaArticulo = 606122,	@pnClaUsuarioMod = 3502001,	@psNombrePcMod = 'MRODRIGUEZC2_rep',	@ptFechaUltimaMod = '2022-05-15 01:12:57.000',	@pnClaTipoSeguimientoAlerta = 1,	@pnClaGpoParo = 7,	@psComentarios = 'it is not working',	@psComentariosSolucion = '-',	@psNombreEmpleado = 'billy R,'

--3.-se arranca la maquina
--manda tipo alerta 4

--4.-se soluciona en avisor
--manda alerta 6
EXEC [MSW_LNKSVR].[MCSW_Integra].[MSWSch].[MswPAIRegistraEventoAndonSCADASrv]	@pnClaUbicacion = 68,	@pnIdNumDepto = 2,	@pnClaveCelda = 73,	@pnIdComponente = 660,	@pnIdEvento = 29418,	@pnTipoAlerta = 6,	@ptFechaAdm = '2022-05-14 00:00:00.000',	@pnClaTurno = 3,	@ptFechaHoraInicial = '2022-05-15 01:19:54.000',	@ptFechaHoraJustificacion = '2022-05-15 01:01:08.000',	@ptFechaHoraAtencion = '1900-01-02 00:00:00.000',	@ptFechaHoraFinal = '2022-05-15 01:18:53.000',	@pnEsparo = 1,	@pnEsMicroparo = 0,	@pnDuracionSegundos = 1375,	@pnClaSeccionParo = 44,	@pnClaArticulo = 606122,	@pnClaUsuarioMod = 0,	@psNombrePcMod = 'PB COLLATED CELL #73_rep',	@ptFechaUltimaMod = '2022-05-15 01:22:55.000',	@pnClaTipoSeguimientoAlerta = 1,	@pnClaGpoParo = 3,	@psComentarios = 'noooooooooo',	@psComentariosSolucion = 'noooooooo',	@psNombreEmpleado = 'nooooooooo'
--ok


SELECT *
FROM [MSW_LNKSVR].[MCSW_Integra].[MSWSch].[MSWTraBSCReporteAndonSeguimiento] T1
LEFT JOIN [MSW_LNKSVR].[MCSW_Integra].[MSWSch].[MSWTraBSCReporteAndon] RA
ON RA.IdReporteAndon = T1.IdReporteAndon
WHERE IdEventoAvisor= 29418
Order By IdReporteAndonSeguimiento


ROLLBACK TRAN







--SELECT *
--FROM [MSW_LNKSVR].[MCSW_Integra].[MSWSch].[MSWTraBSCReporteAndonSeguimiento] T1
--LEFT JOIN [MSW_LNKSVR].[MCSW_Integra].[MSWSch].[MSWTraBSCReporteAndon] RA
--ON RA.IdReporteAndon = T1.IdReporteAndon
--WHERE IdEventoAvisor= 29411
--Order By IdReporteAndonSeguimiento
