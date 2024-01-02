USE [ASW]
GO

/****** Object:  View [AswSch].[AswCatAreaVw]    Script Date: 17/01/2023 12:29:23 p. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO











CREATE VIEW [AswSch].[AswCatAreaVw]
AS  

SELECT DISTINCT [ClaAreaProduccion] AS [ClaDepartamento]
      ,[ClaTipoCelda] AS [ClaArea]
      ,[NomTipoCelda] AS [NomArea]
      ,[BajaLogica]
      ,[FechaBajaLogica]
      ,[FechaUltimaMod]
  FROM [AswSch].[AswCatTipoCelda]
GO


