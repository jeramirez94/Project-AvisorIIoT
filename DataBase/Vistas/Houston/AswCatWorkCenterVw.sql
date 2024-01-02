USE [ASW]
GO

/****** Object:  View [AswSch].[AswCatWorkCenterVw]    Script Date: 05/01/2023 10:04:06 a. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



ALTER VIEW [AswSch].[AswCatWorkCenterVw]
AS  

SELECT DISTINCT [ClaMaquina] AS [IdWorkCenter]
      ,[NomMaquina] AS [NomWorkCenter]
	  ,ClaMaquina AS DisplayName
	  ,[ClaDepartamento]
	  ,[ClaArea]
	  ,[ClaMaquina] AS [ClaveWorkCenter]
	  ,NULL AS [EsSuperCelda]
      ,NULL AS [NPM]
      ,NULL AS [NPM2]
      ,NULL AS [NPM3]
      ,NULL AS [CantWafios]
      ,[MaqBajaLogica] AS [BajaLogica]
	  ,NULL AS [FechaBajaLogica]
      ,NULL AS [FechaUltimaMod]
	  FROM [AswSch].[AswManCatMasterVw]
GO

