/****** Script for SelectTopNRows command from SSMS  ******/
SELECT [ClaveCelda] AS Clave
      ,[NomCelda] AS Celda
      ,[Capacidad] AS NPM
      ,[FechaAdmScada] AS Fecha
      ,[NomTurno] AS Turno
      ,[Duracion] AS Duracion
      ,[RunHrs] AS RunHrs
      ,[TiempoParo] AS Paro
      ,[TiempoMicroParo] AS Microparo
      ,[TiempoParoNoAfecta] AS [Paro no afecta]
      ,[Cajas]
      ,[Clavos]
      ,[PesoProducido] AS Peso
      ,[ClaveArticulo] AS Clave
      ,[NomArticulo] AS Producto
      ,[PesoCaja] AS [Peso x caja]
      ,COALESCE([PesoScrap], 0) AS Scrap
      ,[Disponibilidad] AS Disponibilidad
      ,[Eficiencia] AS Eficiencia
      ,[Calidad] AS Calidad
      ,[Oee] AS OEE
      ,[FechaUltimaMod] AS [Fecha Calculo]
  FROM [ASW].[AswSch].[AswEstEgeHora]
  WHERE RunHrs=10
  AND FechaAdmScada >= '2022-08-15'
  AND FechaAdmScada <= '2022-08-19'
  AND OEE > 0
  ORDER BY NomCelda, FechaAdmScada, NomTurno