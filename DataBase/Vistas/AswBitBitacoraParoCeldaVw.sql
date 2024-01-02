--USE [ASW]
--GO

/****** Object:  View [AswSch].[AswBitBitacoraParoCeldaVw]    Script Date: 14/11/2022 10:02:43 a. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER VIEW [AswSch].[AswBitBitacoraParoCeldaVw]
AS
	SELECT BP.[Id]
		  ,BP.[ClaUbicacion]
		  ,BP.[IdComponente]
		  ,M.NomMaquina
		  ,M.ClaTipoMaquina
		  ,M.IdWorkCenter AS IdCelda
		  ,C.ClaveWorkCenter AS ClaveCelda
		  ,BP.[IdParo]
		  ,BP.[IdPOInicio]
		  ,BP.[IdPOFin]
		  ,BP.[IdUnidad]
		  ,BP.[IdUsuario]
		  ,BP.[FechaHoraInicial]
		  ,BP.[FechaHoraFinal]
		  ,BP.[MicroParoSN]
		  ,BP.[DuracionSegundos]
		  ,BP.[ClaTurno]
		  ,BP.[FechaAdmSCADA]
		  ,BP.[ClaGrupoParo]
		  ,BP.[ClaParo]
		  ,BP.[ClaSeccionParo]
		  ,BP.[IdParoProgramado]
		  ,BP.[ClaEventoParo]
		  ,BP.[ClaEventoJustificacion]
		  ,BP.[ClaEventoReasignacion]
		  ,BP.[ClaEventoAtencion]
		  ,BP.[ClaEventoSolucionado]
		  ,BP.[FechaHoraJustificado]
		  ,BP.[FechaHoraReasignado]
		  ,BP.[FechaHoraAtencion]
		  ,BP.[FechaHoraSolucion]
		  ,BP.[ClaEstatusReplica]
		  ,BP.[ClaUsuarioMod]
		  ,BP.[NombrePCMod]
		  ,BP.[FechaUltimaMod]
		  ,BP.[BajaLogica]
		  ,BP.[Comentarios]
		  ,BP.[ComentariosSolucion]
		  ,BP.[NombreEmpleado]
		  ,BP.[ClaEventoCierre]
		  ,BP.[StatusError]
		  ,BP.[MsgError]
		  ,BP.[IdErpMsw]
		  ,BP.[MsgErrorJustificacion]
		  ,BP.[MsgErrorReasignacion]
		  ,BP.[MsgErrorAtencion]
		  ,BP.[MsgErrorSolucion]
		  ,BP.[MsgErrorSolucionAtm]
		  ,BP.[EnvioCorreoSN]
		  ,BP.[IdAgrupador]
	  FROM [AswSch].[AswBitBitacoraParo] BP
	  JOIN [AswSch].[AswCatWorkUnitVw] M
		ON BP.IdComponente = M.ClaMaquina
	  JOIN [AswSch].[AswCatWorkCenterVw] C
		ON M.IdWorkCenter = C.IdWorkCenter
GO





