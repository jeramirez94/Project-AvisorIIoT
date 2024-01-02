--USE [ASW]
--GO

/****** Object:  View [AswSch].[AswBitAndonCeldaVw]    Script Date: 14/11/2022 10:01:02 a. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER VIEW [AswSch].[AswBitAndonCeldaVw]
AS
SELECT BA.[Id]
      ,BA.[ClaUbicacion]
      ,BA.[IdComponente]
      ,M.NomMaquina
	  ,M.ClaTipoMaquina
	  ,M.IdWorkCenter AS IdCelda
	  ,C.ClaveWorkCenter AS ClaveCelda
	  ,BA.[IdAndon]
      ,BA.[IdPOInicio]
      ,BA.[IdPOFin]
      ,BA.[IdUnidad]
      ,BA.[IdUsuario]
      ,BA.[FechaHoraInicial]
      ,BA.[FechaHoraReasignado]
      ,BA.[FechaHoraAtencion]
      ,BA.[FechaHoraFinal]
      ,BA.[DuracionSegundos]
      ,BA.[ClaTurno]
      ,BA.[FechaAdmSCADA]
      ,BA.[ClaGrupoParo]
      ,BA.[ClaTipoParo]
      ,BA.[ClaSeccionParo]
      ,BA.[ClaEventoNuevo]
      ,BA.[ClaEventoReasignacion]
      ,BA.[ClaEventoAtencion]
      ,BA.[ClaEventoSolucionado]
      ,BA.[ClaEstatusReplica]
      ,BA.[ClaUsuarioMod]
      ,BA.[NombrePCMod]
      ,BA.[FechaUltimaMod]
      ,BA.[BajaLogica]
      ,BA.[Comentarios]
      ,BA.[ComentariosSolucion]
      ,BA.[NombreEmpleado]
      ,BA.[StatusError]
      ,BA.[MsgError]
      ,BA.[IdErpMsw]
      ,BA.[MsgErrorJustificacion]
      ,BA.[MsgErrorReasignacion]
      ,BA.[MsgErrorAtencion]
      ,BA.[MsgErrorSolucion]
      ,BA.[EnvioCorreoSN]
  FROM [ASW].[AswSch].[AswBitAndon] BA
  JOIN [AswSch].[AswCatWorkUnitVw] M
		ON BA.IdComponente = M.ClaMaquina
	  JOIN [AswSch].[AswCatWorkCenterVw] C
		ON M.IdWorkCenter = C.IdWorkCenter

GO






