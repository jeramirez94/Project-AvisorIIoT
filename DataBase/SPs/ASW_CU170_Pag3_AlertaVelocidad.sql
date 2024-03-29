USE [ASW]
GO
/****** Object:  StoredProcedure [AswSch].[ASW_CU170_Pag3_AlertaVelocidad]    Script Date: 10/03/2023 03:41:59 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*==========================================
* CU: 170.3
* Objetivo: SP para alertar baja velocidad de las máquinas
* Autor: José Carlos Arias Rodríguez
* Fecha: 2022-03-10
* EXEC: [AswSch].[ASW_CU170_Pag3_AlertaVelocidad]
*========================================== */
ALTER PROC [AswSch].[ASW_CU170_Pag3_AlertaVelocidad]
@PnClaTurno INT
,@PnClaUbicacion INT
,@PnClaDepartamento INT
,@PsIdWorkCenter VARCHAR(30)
,@PdFechaAdm DATE
,@PtFechaVelocidadBaja DATETIME
,@PtFechaHoraActual DATETIME
,@PnBPM REAL

AS
BEGIN
DECLARE 
	 @nMayorVelocidad REAL
	,@nMedianaVelocidad REAL
	,@sClaMaquina VARCHAR(30)
	,@tFechaHoraMaquina DATETIME
	,@tFechaRangoEvaluacion DATETIME
	,@nCantidadRegistro INT
	,@total INT 
	,@central1 INT
	,@central2 INT
	,@medianpos INT
	,@valorCentral1 REAL
	,@valorCentral2 REAL
	
	
	SET @tFechaRangoEvaluacion = (SELECT dateadd(minute, -4, @PtFechaHoraActual))
	
	SET @nCantidadRegistro = (SELECT COUNT (Valor)
    FROM [AswSch].[AswRecBitVariable]
	WHERE ClaMaquina = @PsIdWorkCenter AND ClaVariable = 4 AND FechaHoraMaquina <= @PtFechaHoraActual AND FechaHoraMaquina >= @tFechaRangoEvaluacion)

	SELECT FechaHoraMaquina,ClaMaquina,Valor
		INTO #TempBitVariable FROM [AswSch].[AswRecBitVariable]
	WHERE ClaMaquina = @PsIdWorkCenter AND ClaVariable = 4 AND FechaHoraMaquina <= @PtFechaHoraActual AND FechaHoraMaquina >= @tFechaRangoEvaluacion
	ORDER BY FechaHoraMaquina DESC

	SET @tFechaHoraMaquina = (SELECT TOP 1 FechaHoraMaquina FROM #TempBitVariable ORDER BY FechaHoraMaquina)

	SELECT FechaHoraMaquina, ClaMaquina, Valor
		INTO #TempMedianSpeed 
	FROM #TempBitVariable
	ORDER BY Valor DESC

	SET @nMayorVelocidad = (SELECT TOP 1 Valor	 
	FROM #TempBitVariable
	ORDER BY Valor DESC)

	
	SET @total = @nCantidadRegistro /2

	IF @nCantidadRegistro % 2 > 0 SET @medianpos = @total + 1;
	IF @nCantidadRegistro % 2 = 0 SET @central1 = @total  

	IF @medianpos IS NOT NULL
		BEGIN
		SET @nMedianaVelocidad = (SELECT Valor FROM 
			(
			SELECT  valor, FechaHoraMaquina,ClaMaquina, ROW_NUMBER() OVER (ORDER BY [Valor]) AS Rownumber
			FROM #TempMedianSpeed
			) #TempMedianSpeed
		WHERE #TempMedianSpeed.Rownumber = @medianpos)
		END
		IF @medianpos IS NULL
		BEGIN
		SET @central1 = @central1
		SET @central2 = @central1+1
		SET @valorCentral1 = (SELECT Valor FROM 
			(
			SELECT  valor, FechaHoraMaquina,ClaMaquina, ROW_NUMBER() OVER (ORDER BY [Valor]) AS Rownumber
			FROM #TempMedianSpeed
			) #TempMedianSpeed
		WHERE #TempMedianSpeed.Rownumber = @central1)
		SET @valorCentral2 = (SELECT Valor FROM 
			(
			SELECT  valor, FechaHoraMaquina,ClaMaquina, ROW_NUMBER() OVER (ORDER BY [Valor]) AS Rownumber
			FROM #TempMedianSpeed
			) #TempMedianSpeed
		WHERE #TempMedianSpeed.Rownumber = @central2)
		SET @nMedianaVelocidad = (@valorCentral1+@valorCentral2)/2;
		--SELECT (@central1+@central2)/2
		END
		
		IF @PnBPM > @nMayorVelocidad
		BEGIN
		SELECT @nMedianaVelocidad AS VelocidadMediana ,@tFechaHoraMaquina AS FechaHoraMaquina, @PsIdWorkCenter AS ClaMaquina, 1 AS VelocidadBaja
		END
	--SELECT FechaHoraMaquina,Valor,ClaMaquina FROM #TempBitVariable
		IF @PnBPM < @nMayorVelocidad
		BEGIN
		SELECT NULL AS VelocidadMediana ,GETDATE() AS FechaHoraMaquina, NULL AS ClaMaquina, 0 AS VelocidadBaja
		END

	
END
