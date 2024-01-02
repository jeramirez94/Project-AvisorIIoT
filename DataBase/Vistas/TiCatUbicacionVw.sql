USE [ASW]
GO

/****** Object:  View [AswSch].[TiCatUbicacionVw]    Script Date: 11/11/2022 01:30:22 p. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [AswSch].[TiCatUbicacionVw] AS (
	SELECT [ClaUbicacion]
      ,[NombreUbicacion]
      ,[ClaTipoUbicacion]
      ,[ClaEmpresa]
      ,[ClaCliente]
      ,[NombreCorto]
      ,[ClaCiudadBase]
      ,[ClaPais]
      ,[ClaEstado]
      ,[AplicaFactorCubicaje]
      ,[ClaUbicacionVentas]
      ,[Direccion]
      ,[Colonia]
      ,[Poblacion]
      ,[CodigoPostal]
      ,[Telefonos]
      ,[Fax]
      ,[ClaTipoUbicacionVentas]
      ,[EmpresaFacturar]
      ,[PctToleranciaEmb]
      ,[BajaLogica]
      ,[FechaBajaLogica]
      ,[FechaUltimaMod]
      ,[FechaIns]
	FROM [TiCatalogo].[dbo].[TiCatUbicacion]
)
GO


