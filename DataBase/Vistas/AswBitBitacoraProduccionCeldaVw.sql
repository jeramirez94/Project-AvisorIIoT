USE [ASW]
GO

SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [AswSch].[AswBitBitacoraProduccionCeldaVw]
AS
	SELECT BP.[Id]
          ,BP.[ClaUbicacion]
          ,BP.[IdBitProduccion]
		  ,BP.[IdComponente]
		  ,M.NomMaquina
		  ,M.ClaTipoMaquina
		  ,BP.IdCelda AS IdCelda
		  ,C.ClaveWorkCenter AS ClaveCelda
		  ,BP.[IdPO]
		  ,BP.[IdCaja]
		  ,BP.[ClaArticulo]
		  ,BP.[ClaveCorte]
		  ,BP.[FechaHoraInicio]
		  ,BP.[FechaHoraFin]
		  ,BP.[DuracionSegundos]
		  ,BP.[ClavosInicio]
		  ,BP.[ClavosFin]
		  ,BP.[CajasInicio]
		  ,BP.[CajasFin]
		  ,BP.[CajasXHora]
		  ,BP.[ClaTurno]
		  ,BP.[FechaAdm]
		  ,BP.[Hora]
		  ,BP.[ClaEstatusReplica]
		  ,BP.[BajaLogica]
		  ,BP.[FechaBajaLogica]
		  ,BP.[ClaUsuarioMod]
		  ,BP.[NombrePCMod]
		  ,BP.[FechaUltimaMod]
	  FROM [AswSch].[AswBitBitacoraProduccion] BP
	  JOIN [AswSch].[AswCatWorkUnitVw] M
		ON BP.IdComponente = M.ClaMaquina
	  JOIN [AswSch].[AswCatWorkCenterVw] C
		ON M.IdWorkCenter = C.IdWorkCenter

GO


