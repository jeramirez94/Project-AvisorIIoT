USE [ASW]
GO

/****** Object:  View [AswSch].[AswCatWorkCenterVw]    Script Date: 05/01/2023 10:05:42 a. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [AswSch].[AswCatWorkCenterVw]
AS  

SELECT DISTINCT [IdCelda] AS [IdWorkCenter]
      ,[Descripcion] AS [NomWorkCenter]
	  ,LTRIM(RTRIM(NomAreaProduccion))+' #'+LTRIM(RTRIM(ClaveCelda)) AS DisplayName
      ,[ClaAreaProduccion] AS [ClaDepartamento]
      ,[ClaTipoCelda] AS [ClaArea]
	  ,[ClaveCelda] AS [ClaveWorkCenter]
      ,[EsSuperCelda]
      ,[NPM]
      ,[NPM2]
      ,[NPM3]
      ,[CantWafios]
      ,[BajaLogica]
      ,[FechaBajaLogica]
      ,[FechaUltimaMod]
  FROM [AswSch].[AswCatCeldas]
GO


