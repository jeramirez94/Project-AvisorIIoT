/****** Object:  View [AswSch].[AswManCatMasterVw]    Script Date: 22/06/2023 12:46:05 p. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [AswSch].[AswManCatMasterVw]
AS  

SELECT [ClaUbicacion]
      ,[NomUbicacion]
      ,[ClaMaquina]
      ,[NomMaquina]
      ,[MaqBajaLogica]
      ,[ClaGpoMaquina]
      ,[NomGpoMaquina]
      ,[GpoMAquinaBajaLogica]
      ,[ClaDepartamento]
      ,[NomDepartamento]
      ,[DptoBajaLogica]
      ,[ClaArea]
      ,[NomArea]
      ,[AreaBajaLogica]
      ,[ClaTipoReporteProd]
      ,[NomTipoReporteProd]
      ,[EficMax]
      ,[NumLinInst]
      ,[ChckGEntAut]
      ,[Inc]
      ,[Error]
      ,[BajaGrupo]
  FROM [MAN_LNKSVR].[Operacion].[dbo].[MasterCatManVW]
GO


