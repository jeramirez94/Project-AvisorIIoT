USE [ASW]
GO

/****** Object:  View [AswSch].[AswEstEgeHoraVw]    Script Date: 14/11/2022 10:15:11 a. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [AswSch].[AswEstEgeHoraVw]
AS
SELECT [Id]
      ,[ClaUbicacion]
      ,[IdCelda]
      ,[ClaDepartamento]
      ,[NomDeapartamento]
      ,[ClaArea]
      ,[NomArea]
      ,[ClaveCelda]
      ,[NomCelda]
      ,[Capacidad]
      ,[FechaAdmScada]
      ,[FechaReporte]
      ,[Hora]
      ,[ClaTurno]
      ,[NomTurno]
      ,[Duracion]
      ,[InicioTurno]
      ,[FinTurno]
      ,[RunHrs]
      ,[TiempoParo]
      ,[TiempoMicroParo]
      ,[TiempoParoNoAfecta]
      ,[Cajas]
      ,[Clavos]
      ,[PesoProducido]
      ,[ClaArticulo]
      ,[ClaveArticulo]
      ,[NomArticulo]
      ,[NomArticuloIngles]
      ,[CajasSkid]
      ,[PesoCaja]
      ,[PesoScrap]
      ,[Disponibilidad]
      ,[Eficiencia]
      ,[Calidad]
      ,[Oee]
      ,[FechaBajaLogica]
      ,[BajaLogica]
      ,[ClaUsuarioMod]
      ,[NombrePCMod]
      ,[FechaUltimaMod]
  FROM [AswSch].[AswEstEgeHora]

GO


