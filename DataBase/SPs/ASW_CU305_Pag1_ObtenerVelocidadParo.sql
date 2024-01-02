--USE [ASW]
--GO

/****** Object:  StoredProcedure [AswSch].[ASW_CU305_Pag1_ObtenerVelocidad]    Script Date: 17/02/2023 04:30:53 p. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

/*========================================== 
* CU305.1 
* Objetivo: Obtener la mediana de la velocidad o el tiempo de paro  
* Autor: mrodriguezc
* Fecha: 2023-02-28 
-- EXEC [AswSch].[ASW_CU305_Pag1_ObtenerVelocidadParo] 68, '2022-06-27T12:00:00Z', '2022-06-27T21:59:21Z' , 34, 1, 0
-- EXEC  [AswSch].[ASW_CU305_Pag1_ObtenerVelocidadParo] 65, '2023-02-28T12:00:00.000Z', '2023-02-28T17:44:05.137Z', 'FF-02', 1, 1
-- EXEC  [AswSch].[ASW_CU305_Pag1_ObtenerVelocidadParo] $ClaUbicacion, '${__from:date}', '${__to:date}', $Cell, 1
* 2023-02-28 MRODRIGUEZC - Si la maquina esta encendida devuelve la velocidad, si esta apagada devuelve el tiempo de paro
*========================================== */ 
ALTER PROC [AswSch].[ASW_CU305_Pag1_ObtenerVelocidadParo]
	@pnClaUbicacion INT
	,@ptFechaDesde DATETIME
	,@ptFechaHasta DATETIME
	,@psIdCelda VARCHAR(30)
	,@pnTiempoUTC INT = 0

	,@pnDebug INT = 0
AS
BEGIN

	DECLARE 
		@nOffSet INT
	   ,@nPulleyRevs NUMERIC(7,4)
	   ,@nPulleyArms INT
	   ,@nNailsPerRev INT

	IF @pnTiempoUTC = 1
	BEGIN
		SET @nOffSet = datediff(hh, getutcdate(), getdate())
	END
	ELSE
	BEGIN
		SET @nOffSet=0
	END

	SET @ptFechaDesde = dateadd(hh, @nOffSet, @ptFechaDesde)
	SET @ptFechaHasta = dateadd(hh, @nOffSet, @ptFechaHasta)

	IF (@pnClaUbicacion = 68)
	BEGIN
		SELECT @nNailsPerRev=aux.NailsPerRev, @nPulleyArms = aux.PullyArms, @nPulleyRevs = aux.PulleyRevs 
		FROM [AswSch].[AswCatMaquinaAux] aux INNER JOIN [AswSch].[AswCatWorkUnitVw] maq
		ON aux.ClaOrigen = maq.ClaMaquina 
		WHERE maq.IdWorkCenter = @psIdCelda AND maq.ClaTipoMaquina = 1 AND maq.BajaLogica = 0 AND aux.EsMaquina = 1

		SELECT DISTINCT PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY Robot_Speed) OVER () AS [Average speed robot]
			,PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY (Header_Speed*(@nNailsPerRev/(@nPulleyRevs*@nPulleyArms)))) OVER () AS [Average speed header]
		FROM [AswSch].[AswBitSeñal] aswbs
		JOIN [AswSch].[AswCatWorkCenterVw] aswcc
			ON aswcc.IdWorkCenter = aswbs.IdCelda
		WHERE
			FechaHoraAvisor >= @ptFechaDesde
			AND FechaHoraAvisor <= @ptFechaHasta
			AND aswbs.IdCelda = @psIdCelda
	END
	IF (@pnClaUbicacion = 65)
	BEGIN
		IF EXISTS (SELECT 1 FROM [AswSch].[AswRecBitParos] WHERE ClaMaquina = @psIdCelda AND FechaHoraFin IS NULL)
		BEGIN
			;WITH cteParo AS(
				SELECT DATEDIFF(SECOND, FechaHoraInicio, GETDATE()) AS TiempoParo
				FROM [AswSch].[AswRecBitParos] 
				WHERE ClaMaquina = @psIdCelda 
				AND FechaHoraFin IS NULL
			)
			SELECT CASE 
				WHEN TiempoParo < 60 THEN CAST(TiempoParo AS VARCHAR)+' sec STOPPED'--segundos
				WHEN TiempoParo < 60*60  THEN CAST(TiempoParo/60 AS VARCHAR)+' min STOPPED'--minutos
				ELSE  [AswSch].[ASWFormatNumber](TiempoParo/60.0/60.0,1,'t') + ' hr STOPPED'--horas
				END AS [On downtime]
			FROM cteParo
		END
		ELSE
		BEGIN
			SELECT DISTINCT PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY valor) OVER (PARTITION BY V.ClaMaquina) AS [Average speed]
			FROM [AswSch].[AswRecBitVariable] V
			JOIN [AswSch].[AswCatWorkUnitVw] WU
				ON V.ClaMaquina = WU.IdWorkCenter
			WHERE V.ClaVariable = 4 --Velocidad
				AND V.FechaHoraMaquina >= @ptFechaDesde
				AND V.FechaHoraMaquina <= @ptFechaHasta
				AND WU.IdWorkCenter = @psIdCelda
				AND ROUND(Valor,0)>0 --descarto los 0s pues solo interesa la velocidad mientras produce
		END
	END

END

GO

