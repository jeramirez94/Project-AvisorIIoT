--USE [ASW]
--GO
/****** Object:  StoredProcedure [AswSch].[ASW_CU305_Pag1_TiempoParo]    Script Date: 15/11/2022 02:58:49 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [AswSch].[ASW_CU305_Pag1_TiempoParo]
	@PnClaCelda INT,
	@PdFecha	DATETIME
AS
BEGIN
	DECLARE @dFechaAdm	DATETIME,
			@nClaTurno		 INT = 1
	
	SET @dFechaAdm = CONVERT(VARCHAR(10), @PdFecha, 120)


	DECLARE @UltimoParo TABLE (
		IdComponente VARCHAR(30),
		FechaHoraInicial DATETIME,
		FechaHoraFinal DATETIME)

	DECLARE @ParoActual TABLE (
		IdComponente		VARCHAR(30),
		FechaHoraInicial DATETIME)

	DECLARE @UniversoMicroParo TABLE (
		IdComponente		VARCHAR(30),
		DuracionSegundosMicro	FLOAT)

	DECLARE @UniversoParo	TABLE (
		IdComponente	VARCHAR(30),
		DuracionParo	FLOAT)


		
	
	--Tabla del último, si esta registrado aquí es porque esta online
	;WITH CTEUltimoParo(IdComponente, FechaHoraInicial, FechaHoraFinal)
			as (SELECT PARO.IdComponente,
						PARO.FechaHoraInicial,
						PARO.FechaHoraFinal
					FROM AswSch.AswBitBitacoraParo PARO
					JOIN AswSch.AswCatWorkUnitVw Maq
						ON PARO.IdComponente = Maq.ClaMaquina
					JOIN (SELECT IdComponente, MAX(id) as Id
							FROM AswSch.AswBitBitacoraParo
							WHERE FechaAdmSCADA = @dFechaAdm
							GROUP BY IdComponente) b
						ON PARO.IdComponente = b.IdComponente
						AND PARO.Id = b.Id
					WHERE PARO.FechaAdmScada = @dFechaAdm 
						AND PARO.ClaTurno = @nClaTurno
						AND Maq.IdWorkCenter = @PnClaCelda
						AND PARO.FechaHoraFinal <> '1900-01-01')
	--Tabla del paro actual, si esta registrado es porque esta offline
	, CteParoActual(IdComponente, FechaHoraInicial) 
		as ( 
			SELECT PARO.IdComponente, 
					PARO.FechaHoraInicial 
				FROM AswSch.AswBitBitacoraParo PARO
				JOIN AswSch.AswCatWorkUnitVw Maq
					ON PARO.IdComponente = Maq.ClaMaquina
				WHERE PARO.FechaAdmScada = @dFechaAdm
					AND PARO.ClaTurno = @nClaTurno
					AND (PARO.FechaHoraFinal IS NULL OR PARO.FechaHoraFinal = '1900-01-01') 
					AND Maq.IdWorkCenter = @PnClaCelda)
	--Universo MicroParos
	, CteUniversoMicroParo (IdComponente, DuracionSegundosMicro)
		AS	(SELECT Paro.IdComponente,
					Paro.DuracionSegundos
				FROM AswSch.AswBitBitacoraParo Paro
				JOIN AswSch.AswCatWorkUnitVw Maq
					ON PARO.IdComponente = Maq.ClaMaquina
				WHERE Paro.ClaTurno = @nClaTurno
					AND Paro.MicroParoSN = 1
					AND Paro.FechaAdmSCADA = @dFechaAdm
					AND Maq.IdWorkCenter = @PnClaCelda)
	--Universo Paros
	, CteUniversoParo(IdComponente, DuracionParo)
		AS (SELECT Maq.ClaMaquina,
					SUM(Paro.DuracionSegundos)
				FROM AswSch.AswBitBitacoraParo Paro
				JOIN AswSch.AswCatWorkUnitVw Maq
					ON PARO.IdComponente = Maq.ClaMaquina
				WHERE Paro.FechaAdmSCADA = @dFechaAdm
					AND Paro.ClaTurno = @nClaTurno
					AND Maq.IdWorkCenter = @PnClaCelda
					AND Paro.MicroParoSN = 0
					AND (Paro.FechaHoraFinal IS NOT NULL OR Paro.FechaHoraFinal <> '1900-01-01')
				GROUP BY Maq.ClaMaquina)
	--Inicia el query
	SELECT MAQ.NomMaquina AS 'Machine', --Nombre del componente
	CASE WHEN CTEACTUAL.IdComponente IS NOT NULL  --Estado del componente 
			THEN CASE WHEN DATEDIFF(SECOND, CTEACTUAL.FechaHoraInicial, GETDATE()) < 180
					THEN 2 --microstop
					ELSE 0 --Offline
				END 
			ELSE 1	--Online
		END as 'Status',
	CASE WHEN CTEACTUAL.IdComponente IS NOT NULL  --Tiempo del evento actual
		 THEN --Offline tiempo desde que inicio el paro
			CASE WHEN DATEDIFF(SECOND, CTEACTUAL.FechaHoraInicial, GETDATE()) < 3600 
				 THEN CONVERT(VARCHAR(10),ROUND(CAST((DATEDIFF(SECOND, CTEACTUAL.FechaHoraInicial, GETDATE()))/60.0 as FLOAT),1))+' Minutes offline' 
				 ELSE CONVERT(VARCHAR(10),ROUND(CAST((DATEDIFF(SECOND, CTEACTUAL.FechaHoraInicial, GETDATE())) / 3600.0 as FLOAT),1))+' Hours offline'
			 END
		 ELSE --Online tiempo desde que termino el ultimo paro
			CASE WHEN DATEDIFF(SECOND, CTEUltimo.FechaHoraFinal, GETDATE()) < 3600 
				THEN CONVERT(VARCHAR(10),ROUND(CAST((DATEDIFF(SECOND, CTEUltimo.FechaHoraFinal , GETDATE()))/60.0 as FLOAT),1))+' Minutes Online' 
				 ELSE CONVERT(VARCHAR(10),ROUND(CAST((DATEDIFF(SECOND, CTEUltimo.FechaHoraFinal, GETDATE())) / 3600.0 as FLOAT),1))+' Hours Online'
			END
		END as 'Ongoing Event',
	CASE WHEN SUM(CTEMicro.DuracionSegundosMicro) > 0 --Tiempo total de microparos
		THEN CASE WHEN SUM(CTEMicro.DuracionSegundosMicro) < 3600
				THEN CONVERT(VARCHAR(10),ROUND(CAST(SUM(CTEMicro.DuracionSegundosMicro)/60.0 AS FLOAT),1))+' Minutes'
				ELSE CONVERT(VARCHAR(10),ROUND(CAST(SUM(CTEMicro.DuracionSegundosMicro)/3600.0 AS FLOAT),1))+' Hours'
			END
		ELSE 
			'0 min'
		END AS 'Total MicroStop',
	CASE WHEN SumParo.DuracionParo > 0 --Tiempo total de Paros en seg
		THEN CASE WHEN SumParo.DuracionParo < 3600
				THEN CONVERT(VARCHAR(10),ROUND(CAST(SumParo.DuracionParo/60.0 AS FLOAT),1))+' Minutes'
				ELSE CONVERT(VARCHAR(10),ROUND(CAST(SumParo.DuracionParo/3600.0 AS FLOAT),1))+' Hours'
			END
		ELSE 
			'0 min'
		END AS 'Total Stop',
	CASE wHEN CONVERT(VARCHAR(10), @dFechaAdm, 120) <> CONVERT(VARCHAR(10), GETDATE(), 120)
		THEN CASE WHEN	(SUM(CTEMicro.DuracionSegundosMicro) + SumParo.DuracionParo) > 0
					THEN CASE WHEN	(SUM(CTEMicro.DuracionSegundosMicro) + SumParo.DuracionParo) < 3600
							THEN CONVERT(VARCHAR(10), ROUND(CAST((36000.0 - SUM(CTEMicro.DuracionSegundosMicro) - SumParo.DuracionParo)/60.0 AS FLOAT),1))+' Minutes'
							ELSE CONVERT(VARCHAR(10), ROUND(CAST((36000.0 - SUM(CTEMicro.DuracionSegundosMicro) - SumParo.DuracionParo)/3600.0 AS FLOAT),1))+' Hours'
						END
					ELSE 
						'0 Min'
				END
		ELSE 
			CASE WHEN (SUM(CTEMicro.DuracionSegundosMicro)+SumParo.DuracionParo) IS NULL
				THEN '0 Min'
				ELSE CASE WHEN DATEDIFF(SECOND, DATEADD(HOUR,7,@dFechaAdm), GETDATE()) < 3600 
						THEN CONVERT(VARCHAR(10),ROUND(CAST((DATEDIFF(SECOND, DATEADD(SECOND,SUM(CTEMicro.DuracionSegundosMicro)+SumParo.DuracionParo,@dFechaAdm), DATEADD(HOUR, 7, @dFechaAdm)))/60.0 as FLOAT),1))+' Minutes Online' 
						 ELSE CONVERT(VARCHAR(10),ROUND(CAST((DATEDIFF(SECOND, DATEADD(SECOND,SUM(CTEMicro.DuracionSegundosMicro)+SumParo.DuracionParo,@dFechaAdm), DATEADD(HOUR, 7, @dFechaAdm))) / 3600.0 as FLOAT),1))+' Hours Online'
				END
			END
		END AS 'Total Online'
	FROM AswSch.AswCatWorkUnitVw MAQ
	LEFT JOIN CteParoActual CTEACTUAL 
		ON CTEACTUAL.IdComponente = MAQ.ClaMaquina 
	LEFT JOIN CTEUltimoParo CTEUltimo
		ON CTEUltimo.IdComponente = MAQ.ClaMaquina
	LEFT JOIN CteUniversoMicroParo CTEMicro
		ON CTEMicro.IdComponente = MAQ.ClaMaquina
	JOIN CteUniversoParo SumParo
		ON SumParo.IdComponente = MAQ.ClaMaquina
	WHERE MAQ.BajaLogica=0 
		AND MAQ.IdWorkCenter = @PnClaCelda
	GROUP BY MAQ.NomMaquina, CTEACTUAL.IdComponente, CTEACTUAL.FechaHoraInicial, CTEUltimo.FechaHoraFinal, SumParo.DuracionParo
	ORDER BY CTEACTUAL.IdComponente
	
END