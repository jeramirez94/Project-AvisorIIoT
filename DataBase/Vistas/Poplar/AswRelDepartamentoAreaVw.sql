USE [ASW]
GO

/****** Object:  View [AswSch].[AswRelDepartamentoAreaVw]    Script Date: 17/01/2023 06:12:36 p. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO











CREATE VIEW [AswSch].[AswRelDepartamentoAreaVw]
AS  

SELECT DISTINCT ClaArea
      ,ClaDepartamento
	  ,NULL AS BajaLogica
      ,FechaUltimaMod
FROM [AswSch].[AswCatRelDepartamentoArea] 


GO


