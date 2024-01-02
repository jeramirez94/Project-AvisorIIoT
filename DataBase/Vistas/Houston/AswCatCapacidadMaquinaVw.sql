USE [ASW]
GO

/****** Object:  View [AswSch].[AswCatCapacidadMaquinaVw]    Script Date: 26/01/2023 04:11:57 p. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [AswSch].[AswCatCapacidadMaquinaVw]
AS  

SELECT [ClaPlanta]
      ,[ClaMaquina]
      ,[ClaArticulo]
      ,[Capacidad]
      ,[BajaLogica]
      ,[FechaBajaLogica]
      ,[FechaUltimaMod]
      ,[ClaUsuarioMod]
      ,[NombrePcMod] 
FROM [MAN_LNKSVR].[Operacion].[ManSch].[ManCatCapacidadMaquinaVw]
GO