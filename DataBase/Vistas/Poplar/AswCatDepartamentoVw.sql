USE [ASW]
GO

/****** Object:  View [AswSch].[AswCatDepartamentoVw]    Script Date: 05/01/2023 10:05:17 a. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO








CREATE VIEW [AswSch].[AswCatDepartamentoVw]
AS  

SELECT DISTINCT [ClaDepartamento]
      ,[NomDepartamento]
      ,[BajaLogica]
  FROM [AswSch].[AswCatDepartamento]
GO


