USE [ASWH]
GO
/****** Object:  StoredProcedure [AswSch].[ASW_CU170_Pag3_AlertaVelocidadReminder]    Script Date: 10/03/2023 03:45:33 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*==========================================
* CU: 170.3
* Objetivo: SP auxiliar para repetir alerta de velocidad tras haber sido notificada previamente
* Autor: José Carlos Arias Rodríguez
* Fecha: 2022-03-10
* EXEC: [AswSch].[ASW_CU170_Pag3_AlertaVelocidad]
*========================================== */
ALTER PROC [AswSch].[ASW_CU170_Pag3_AlertaVelocidadReminder]
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
	,@nCantidadRegistro INT
	,@total INT 
	,@central1 INT
	,@central2 INT
	,@medianpos INT
	,@valorCentral1 REAL
	,@valorCentral2 REAL
	

	SET @nCantidadRegistro = (SELECT COUNT (Valor)
    FROM [AswSch].[AswRecBitVariable]
	WHERE ClaMaquina = @PsIdWorkCenter AND ClaVariable = 4 AND FechaHoraMaquina <= @PtFechaHoraActual AND FechaHoraMaquina >= @PtFechaVelocidadBaja)

	SELECT TOP 3 FechaHoraMaquina,ClaMaquina,Valor
		INTO #TempBitVariable FROM [AswSch].[AswRecBitVariable]
	WHERE ClaMaquina = @PsIdWorkCenter AND ClaVariable = 4 AND FechaHoraMaquina <= @PtFechaHoraActual AND FechaHoraMaquina >= @PtFechaVelocidadBaja
	ORDER BY FechaHoraMaquina DESC

	SELECT FechaHoraMaquina, ClaMaquina, Valor
		INTO #TempMedianSpeed 
	FROM #TempBitVariable
	ORDER BY Valor DESC

	
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

		SELECT @nMedianaVelocidad AS VelocidadMediana ,@PtFechaVelocidadBaja AS FechaHoraMaquina, @PsIdWorkCenter AS ClaMaquina
	--SELECT FechaHoraMaquina,Valor,ClaMaquina FROM #TempBitVariable
	


	
END
