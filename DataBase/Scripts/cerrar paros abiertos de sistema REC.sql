--Ultimo paro
  SELECT MAX([FechaHoraInicio]) AS [FechaHoraInicio]
      ,[ClaMaquina]
  FROM [ASW].[AswSch].[AswRecBitParos]
  GROUP BY [ClaMaquina]

--paros abiertos
SELECT *
  FROM [ASW].[AswSch].[AswRecBitParos]
  WHERE FechaHoraFin IS NULL 
  ORDER BY [ClaMaquina], [FechaHoraInicio]


--sp para cerrar paros
EXEC [AswSch].[ASW_CU204_Pag2_BitParos_IU] 
   @pnEventoOrigen = 39705
  ,@ptFechaHoraInicio = '2023-06-09 15:56:38.000'
  ,@ptFechaHoraFin = '2023-06-09 15:56:38.000'--igual que fecha inicio
  ,@psClaMaquina = 'FF-06'
  ,@psClaPuntoMedicion = 'FF-06'
  --defaults
  ,@pnClaProducto = NULL
  ,@pnDuracion = 0
  ,@pnClaParo = NULL
  ,@pnClaUbicacion = 65
  ,@pnClaArea = 4229
  ,@pnClaDepartamento = 201
  ,@pnAnio = 2023
  

--paros abiertos
SELECT *
  FROM [ASW].[AswSch].[AswRecBitParos]
  WHERE FechaHoraFin IS NULL 
  ORDER BY [ClaMaquina], [FechaHoraInicio]