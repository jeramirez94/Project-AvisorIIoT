USE [ASW]
GO

/****** Object:  View [AswSch].[AswCatAreaVw]    Script Date: 17/01/2023 12:24:04 p. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO








CREATE VIEW [AswSch].[AswCatAreaVw]
AS  

SELECT DISTINCT [ClaDepartamento]
      ,[ClaArea]
      ,[NomArea]
      ,[AreaBajaLogica] AS [BajaLogica]
	  ,NULL AS [FechaBajaLogica]
	  ,NULL AS [FechaUltimaMod]
  FROM [AswSch].[AswManCatMasterVw]
GO


