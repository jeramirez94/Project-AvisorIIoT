ALTER TABLE [AswSch].[AswEstEgeHora]
ADD [Cumplimiento]  [numeric](8, 2) NULL
GO

ALTER TABLE [AswSch].[AswEstEgeHora]
ADD [CapacidadUnidad] [int] NULL
GO

UPDATE [AswSch].[AswEstEgeHora]
SET [CapacidadUnidad] = Capacidad