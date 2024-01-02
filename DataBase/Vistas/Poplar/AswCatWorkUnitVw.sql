USE [ASW]
GO

/****** Object:  View [AswSch].[AswCatWorkUnitVw]    Script Date: 26/01/2023 03:08:41 p. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [AswSch].[AswCatWorkUnitVw]
AS  

SELECT DISTINCT  [ClaMaquina]
       ,[ClaveMaquina]
	  ,[ClaCelda] AS [IdWorkCenter]
      ,[NomMaquina]
      ,[ABCMachine]
	  ,[ClaTipoMaquina]
	  ,CASE WHEN ClaTipoMaquina = 6 THEN 1 ELSE 0 END AS EsGralProduccion
	  ,CASE WHEN ClaTipoMaquina = 3 THEN 1 ELSE 0 END AS EsGralParos
	  ,[BajaLogica]
      ,[FechaBajaLogica]
      ,[FechaUltimaMod]
FROM [AswSch].[AswCatMaquina]
GO