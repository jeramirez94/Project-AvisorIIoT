USE [ASW]
GO

/****** Object:  View [AswSch].[AswBitSeñalVw]    Script Date: 14/11/2022 10:06:01 a. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [AswSch].[AswBitSeñalVw]
AS
SELECT [id]
      ,[IdCelda]
      ,[Header_Status]
      ,[Header_Speed]
      ,[Header_Count]
      ,[Threader_Status]
      ,[Collator_Status]
      ,[Vision_Strip_Status]
      ,[Vision_Strip_Count]
      ,[Vision_Strip_Rejectad]
      ,[Robot_Status]
      ,[Robot_Speed]
      ,[Robot_Nail_Production]
      ,[Robot_Box_Production]
      ,[Robot_Box_Completed_Count]
      ,[FechaHoraAvisor]
      ,[FechaServidorBD]
  FROM [AswSch].[AswBitSeñal]

GO


