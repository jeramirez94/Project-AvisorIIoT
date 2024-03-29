USE [ASW]
GO
/****** Object:  StoredProcedure [AswSch].[ASW_CU170_Pag1_AlertaEncendido]    Script Date: 10/03/2023 03:25:19 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*==========================================
* CU: 170.1
* Objetivo: Emitir alerta de encendido en base a los datos de la recolección
* Autor: José Carlos Arias Rodríguez
* Fecha: 2022-03-10
* EXEC: [AswSch].[ASW_CU170_Pag1_AlertaEncendido]
*========================================== */
ALTER PROC [AswSch].[ASW_CU170_Pag1_AlertaEncendido]
@PnClaTurno INT
,@PnClaUbicacion INT
,@PnClaDepartamento INT
,@PsIdWorkCenter VARCHAR(30)
,@PdFechaAdm DATE
,@PnArranque INT
,@PtFechaParoPrevio DATETIME


AS
BEGIN
DECLARE 
	@tFechaHoraInicioTurno DATETIME
	,@tFechaHoraFinTurno DATETIME
	,@tFechaUltimoOn DATETIME
	,@sClaMaquina VARCHAR(30)
	,@tFechaHoraMaquina DATETIME
	,@tFechaUltimoEncendido DATETIME

	
	
	SET @tFechaHoraInicioTurno = (SELECT [AswSch].[ASWGetInicioTurno] (@PnClaUbicacion,@PdFechaAdm,@PnClaTurno,@PnClaDepartamento))
	SET @tFechaHoraFinTurno = (SELECT [AswSch].[ASWGetFinTurno] (@PnClaUbicacion,@PdFechaAdm,@PnClaTurno,@PnClaDepartamento))
	SET @tFechaUltimoOn = (SELECT TOP (1) [FechaHoraMaquina] FROM [AswSch].[AswRecBitVariable] WHERE ClaMaquina = @PsIdWorkCenter AND ClaVariable = 1 AND Valor = 1 AND FechaHoraMaquina >= @PtFechaParoPrevio AND FechaHoraMaquina <= @tFechaHoraFinTurno ORDER BY FechaHoraMaquina DESC)
    
IF @PnArranque = 0
	SELECT TOP (1) 
      [FechaHoraMaquina]
      ,[ClaMaquina]
	  ,NULL AS FechaUltimoEncendido
  FROM [AswSch].[AswRecBitVariable]
  WHERE ClaMaquina = @PsIdWorkCenter AND ClaVariable = 1 AND Valor = 1 
  AND FechaHoraMaquina >= @tFechaHoraInicioTurno
  AND FechaHoraMaquina <= @tFechaHoraFinTurno
  ORDER BY FechaHoraMaquina
  IF @PnArranque = 1 AND (@tFechaUltimoOn > @PtFechaParoPrevio)
  BEGIN
  SELECT TOP (1) [Evento]
      ,[EventoOrigen]
      ,[FechaHoraMaquina]
      ,[ClaVariable]
      ,[ClaMaquina]
      ,[Valor]
      ,[ClaProducto]
      ,[ClaUbicacion]
      ,[ClaArea]
      ,[ClaSubarea]
      ,[FechaUltimaMod]
  INTO #TempTablaEncendido
  FROM [AswSch].[AswRecBitVariable]
  WHERE ClaMaquina = @PsIdWorkCenter AND ClaVariable = 1 AND Valor = 1 
  AND FechaHoraMaquina > @PtFechaParoPrevio
  AND FechaHoraMaquina <= @tFechaHoraFinTurno
  ORDER BY FechaHoraMaquina

  SET @sClaMaquina = (SELECT ClaMaquina FROM #TempTablaEncendido)

  SET @tFechaHoraMaquina = (SELECT FechaHoraMaquina FROM #TempTablaEncendido)

  SET @tFechaUltimoEncendido = (SELECT TOP (1) [FechaHoraMaquina] 
  FROM [AswSch].[AswRecBitVariable]
  WHERE ClaMaquina = @PsIdWorkCenter AND ClaVariable = 1 AND Valor = 1 
  AND FechaHoraMaquina < @PtFechaParoPrevio
  ORDER BY FechaHoraMaquina DESC)

  SELECT @sClaMaquina AS ClaMaquina, @tFechaHoraMaquina AS FechaHoraMaquina, @tFechaUltimoEncendido AS FechaUltimoEncendido
  END
END
