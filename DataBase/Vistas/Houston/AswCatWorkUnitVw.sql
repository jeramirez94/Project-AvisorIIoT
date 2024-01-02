USE [ASWH]
GO

/****** Object:  View [AswSch].[AswCatWorkUnitVw]    Script Date: 26/01/2023 03:10:00 p. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE VIEW [AswSch].[AswCatWorkUnitVw]
AS  

SELECT DISTINCT [ClaMaquina]
      ,[ClaMaquina] AS [ClaveMaquina] 
	  ,[ClaMaquina] AS [IdWorkCenter]
      ,[NomMaquina]
	  ,NULL AS [ABCMachine]
	  ,NULL AS [ClaTipoMaquina]
	  ,1 AS [EsGralProduccion]
	  ,1 AS [EsGralParos]
      ,[MaqBajaLogica] AS [BajaLogica]
	  ,NULL AS [FechaBajaLogica]
      ,NULL AS [FechaUltimaMod]
  FROM [AswSch].[AswManCatMasterVw]
GO


