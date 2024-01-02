USE ASW 
GO

INSERT INTO [ASW].[AswSch].[AswCatTurno] ([ClaUbicacion]
      ,[ClaTurno]
      ,[NomTurno]
      ,[Duracion]
      ,[BajaLogica]
      ,[FechaBajaLogica]
      ,[FechaUltimaMod])
SELECT [ClaUbicacion]
      ,[ClaTurno]
      ,[NomTurno]
      ,[Duracion]
      ,[BajaLogica]
      ,[FechaBajaLogica]
      ,[FechaUltimaMod]
  FROM [MSW_LNKSVR].[MCSW_ERP].[MSWSch].[MSWCatTurnoASWVw]