--USE [ASW]
--GO
/****** Object:  StoredProcedure [AswSch].[ASW_CU305_Pag1_TiemposMaquinas]    Script Date: 15/11/2022 02:59:50 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [AswSch].[ASW_CU305_Pag1_TiemposMaquinas]
	@PnClaUbicacion		INT,
	@PdFechaDesde		DATETIME,
	@PdFechaHasta		DATETIME,
	@PsClaCelda			VARCHAR(30),
	@PnTiempoUTC		INT = 0,
	@PnDebug			INT = 0
AS
BEGIN
	DECLARE @nClaAreaProduccion	INT,
			@dFechaAdm			DATETIME,
			@nClaTurno			INT,
			@dFechaInicioTurno	DATETIME,
			@dFechaFinTurno		DATETIME

	IF @pnTiempoUTC = 1
	BEGIN
		SET @PdFechaHasta = dateadd(hh, datediff(hh, getutcdate(), getdate()), @pdFechaHasta)
	END
	
	SELECT @nClaAreaProduccion = ClaDepartamento
		FROM AswSch.AswCatWorkCenterVw
		WHERE IdWorkCenter = @PsClaCelda

	--obtengo el turno y fecha
	SET @nClaTurno = [AswSch].[ASWGetTurno] (@pnClaUbicacion, @nClaAreaProduccion, @PdFechaHasta)
	SET @dFechaAdm = [AswSch].[ASWGetFechaAdm] (@pnClaUbicacion, @nClaAreaProduccion, @PdFechaHasta)

	--obtengo el inicio y fin de turno para la fecha consultada
	SET @dFechaInicioTurno = [AswSch].[ASWGetInicioTurno](@pnClaUbicacion, @dFechaAdm, @nClaTurno, @nClaAreaProduccion)
	SET @dFechaFinTurno = [AswSch].[ASWGetFinTurno](@pnClaUbicacion, @dFechaAdm, @nClaTurno, @nClaAreaProduccion)

	IF(@PnDebug = 1)
	BEGIN
		SELECT @nClaTurno, @dFechaAdm, @dFechaInicioTurno, @dFechaFinTurno
	END
	
	DECLARE @Maquinas TABLE(
		IdComponente	VARCHAR(30), --ClaMaquina
		NomMaquina		VARCHAR(30),
		ClaTipoMaquina	TINYINT)
	
	DECLARE @UltimoParo TABLE(
		IdComponente	VARCHAR(30),
		FechaHoraInical DATETIME,
		FechaHoraFinal	DATETIME)
	
	DECLARE @ParosActivos TABLE(
		IdComponente		VARCHAR(30),
		FechaHoraInicial	DATETIME,
		DuracionSegundos	INT)
	
	DECLARE @MicroParos	TABLE(
		IdComponente		VARCHAR(30),
		DuracionSegundos	INT)
	
	DECLARE @Paros TABLE(
		IdComponente		VARCHAR(30),
		DuracionSegundosPa	INT)
	
	--Maquinas pertenecientes a la celda
	INSERT INTO @Maquinas
		(IdComponente,
			NomMaquina,
			ClaTipoMaquina)
	SELECT ClaMaquina,
			NomMaquina,
			ClaTipoMaquina
		FROM AswSch.AswCatWorkUnitVw
		WHERE IdWorkCenter = @PsClaCelda
		AND BajaLogica = 0
		ORDER BY ClaTipoMaquina
	
	--Ultimo Paro cerrado de las Maquinas de la Celda
	INSERT INTO @UltimoParo(
			IdComponente,
			FechaHoraInical,
			FechaHoraFinal)
	SELECT PARO.IdComponente,
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
			AND Maq.IdWorkCenter = @PsClaCelda
			AND PARO.FechaHoraFinal <> '1900-01-01'
	
	--Tabla de Paros Activos
	INSERT INTO @ParosActivos(
			IdComponente,
			FechaHoraInicial,
			DuracionSegundos)
	SELECT PARO.IdComponente, 
			PARO.FechaHoraInicial,
			DATEDIFF(SECOND,PARO.FechaHoraInicial,GETDATE())
		FROM AswSch.AswBitBitacoraParo PARO
		JOIN AswSch.AswCatWorkUnitVw Maq
			ON PARO.IdComponente = Maq.ClaMaquina
		WHERE PARO.FechaAdmScada = @dFechaAdm
			AND PARO.ClaTurno = @nClaTurno
			AND (PARO.FechaHoraFinal IS NULL OR PARO.FechaHoraFinal = '1900-01-01') 
			AND Maq.IdWorkCenter = @PsClaCelda
	
	--Tabla Duracion MicroParos
	INSERT INTO @MicroParos(
			IdComponente,
			DuracionSegundos)
	SELECT Paro.IdComponente,
			SUM(Paro.DuracionSegundos)
		FROM AswSch.AswBitBitacoraParo Paro
		JOIN AswSch.AswCatWorkUnitVw Maq
			ON PARO.IdComponente = Maq.ClaMaquina
		WHERE Paro.ClaTurno = @nClaTurno
			AND Paro.MicroParoSN = 1
			AND Paro.FechaAdmSCADA = @dFechaAdm
			AND Maq.IdWorkCenter = @PsClaCelda
		GROUP BY Paro.IdComponente
	
	--Tabla de Paros y duracion
	INSERT INTO @Paros(
			IdComponente,
			DuracionSegundosPa)
	SELECT Paro.IdComponente,
			SUM(Paro.DuracionSegundos)
		FROM AswSch.AswBitBitacoraParo Paro
		JOIN AswSch.AswCatWorkUnitVw Maq
			ON Paro.IdComponente = Maq.ClaMaquina
		WHERE Paro.ClaTurno = @nClaTurno
			AND Paro.MicroParoSN = 0
			AND Paro.FechaAdmSCADA = @dFechaAdm
			AND Maq.IdWorkCenter = @PsClaCelda
			AND Paro.FechaHoraFinal <> '1900-01-01'
		GROUP BY Paro.IdComponente

	IF(@PnDebug = 1)
	BEGIN
		SELECT 'Maquinas', * FROM @Maquinas
		SELECT 'Paros', * FROM @Paros
		SELECT 'MicroParos', * FROM @MicroParos
		SELECT 'Ultimo Paro',* FROM @UltimoParo
		SELECT 'Paro Activo', * FROM @ParosActivos
	END
	
	--Si es el mismo día en el que se consulta
	IF(@dFechaAdm = CONVERT(VARCHAR(10), GETDATE(), 120))
	BEGIN
		SELECT Maq.NomMaquina AS 'Machine',
				@nClaTurno AS 'Shift',
				@dFechaAdm AS FechaAdm,
				CASE WHEN ParoActivo.IdComponente IS NULL  --Status
					THEN 0 --ONLINE
					ELSE CASE WHEN DATEDIFF(SECOND, ParoActivo.FechaHoraInicial, GETDATE()) < 180
						THEN 2 --MICROSTOP
						ELSE 1 --OFFLINE
						END
					END AS 'Status',
				CASE WHEN ParoActivo.IdComponente IS NULL --OnGoing Event
					THEN
						CASE WHEN UltimoParo.IdComponente IS NULL --Si no existe un paro previo
							THEN --Tiempo online desde que arrancó
								CASE WHEN DATEDIFF(SECOND, @dFechaInicioTurno, GETDATE()) < 3600
									THEN CONVERT(VARCHAR(10),ROUND(CAST((DATEDIFF(SECOND, @dFechaInicioTurno, GETDATE()))/60.0 as FLOAT),1))+' Minutes online' 
									ELSE CONVERT(VARCHAR(10),ROUND(CAST((DATEDIFF(SECOND, @dFechaInicioTurno, GETDATE())) / 3600.0 as FLOAT),1))+' Hours online'
								END
							ELSE -- Online desde la ultimo paro
								CASE WHEN DATEDIFF(SECOND, UltimoParo.FechaHoraFinal, GETDATE()) < 3600
									THEN CONVERT(VARCHAR(10),ROUND(CAST((DATEDIFF(SECOND, UltimoParo.FechaHoraFinal, GETDATE()))/60.0 as FLOAT),1))+' Minutes online' 
									ELSE CONVERT(VARCHAR(10),ROUND(CAST((DATEDIFF(SECOND, UltimoParo.FechaHoraFinal, GETDATE())) / 3600.0 as FLOAT),1))+' Hours online'
								END
							END
					ELSE --Tiempo offline desde el paro activo
						CASE WHEN DATEDIFF(SECOND, ParoActivo.FechaHoraInicial, GETDATE()) < 3600
									THEN CONVERT(VARCHAR(10),ROUND(CAST((DATEDIFF(SECOND, ParoActivo.FechaHoraInicial, GETDATE()))/60.0 as FLOAT),1))+' Minutes offline' 
									ELSE CONVERT(VARCHAR(10),ROUND(CAST((DATEDIFF(SECOND, ParoActivo.FechaHoraInicial, GETDATE())) / 3600.0 as FLOAT),1))+' Hours offline'
								END
					END AS 'Ongoing Event',
				CASE WHEN MicroParo.IdComponente IS NULL --Total MicroParos
					THEN --No existen microparos
						'0 minutes'
					ELSE --Si existen microparos
						CASE WHEN MicroParo.DuracionSegundos < 3600
									THEN CONVERT(VARCHAR(10),ROUND(CAST( MicroParo.DuracionSegundos / 60.0 as FLOAT),1))+' Minutes' 
									ELSE CONVERT(VARCHAR(10),ROUND(CAST( MicroParo.DuracionSegundos / 3600.0 as FLOAT),1))+' Hours'
								END
					END AS 'Total MicroStop',
				CASE WHEN Paros.IdComponente IS NULL --Total Paros
					THEN CASE WHEN ParoActivo.IdComponente IS NOT NULL--No existen Paros pero hay uno activo
							THEN CASE WHEN DATEDIFF(SECOND, ParoActivo.FechaHoraInicial, GETDATE()) < 3600
									THEN CONVERT(VARCHAR(10),ROUND(CAST((DATEDIFF(SECOND, ParoActivo.FechaHoraInicial, GETDATE())) / 60.0 as FLOAT),1))+' Minutes' 
									ELSE CONVERT(VARCHAR(10),ROUND(CAST((DATEDIFF(SECOND, ParoActivo.FechaHoraInicial, GETDATE())) / 3600.0 as FLOAT),1))+' Hours'
								END
							ELSE '0 minutes'
						END
					ELSE --Si existen paros
						CASE WHEN ParoActivo.IdComponente IS NOT NULL
							THEN CASE WHEN (Paros.DuracionSegundosPa + DATEDIFF(SECOND, ParoActivo.FechaHoraInicial, GETDATE())) < 3600
									THEN CONVERT(VARCHAR(10),ROUND(CAST( (Paros.DuracionSegundosPa + (DATEDIFF(SECOND, ParoActivo.FechaHoraInicial, GETDATE()))) / 60.0 as FLOAT),1))+' Minutes' 
									ELSE CONVERT(VARCHAR(10),ROUND(CAST( (Paros.DuracionSegundosPa + (DATEDIFF(SECOND, ParoActivo.FechaHoraInicial, GETDATE()))) / 3600.0 as FLOAT),1))+' Hours'
								END
							ELSE CASE WHEN Paros.DuracionSegundosPa < 3600
										THEN CONVERT(VARCHAR(10),ROUND(CAST( Paros.DuracionSegundosPa / 60.0 as FLOAT),1))+' Minutes' 
										ELSE CONVERT(VARCHAR(10),ROUND(CAST( Paros.DuracionSegundosPa / 3600.0 as FLOAT),1))+' Hours'
									END
							END
					END AS 'Total Offline',
				CASE WHEN MicroParo.DuracionSegundos IS NULL AND Paros.DuracionSegundosPa IS NULL
					THEN --No existen paros
						CASE WHEN DATEDIFF(SECOND, DATEADD(SECOND, COALESCE(ParoActivo.DuracionSegundos, 0) ,@dFechaInicioTurno) , GETDATE()) < 3600
									THEN CONVERT(VARCHAR(10),ROUND(CAST((DATEDIFF(SECOND, DATEADD(SECOND, COALESCE(ParoActivo.DuracionSegundos, 0) ,@dFechaInicioTurno), GETDATE()))/60.0 as FLOAT),1))+' Minutes' 
									ELSE CONVERT(VARCHAR(10),ROUND(CAST((DATEDIFF(SECOND, DATEADD(SECOND, COALESCE(ParoActivo.DuracionSegundos, 0) ,@dFechaInicioTurno), GETDATE())) / 3600.0 as FLOAT),1))+' Hours'
								END
					ELSE 
						CASE WHEN COALESCE(MicroParo.DuracionSegundos,0) > 0 AND Paros.DuracionSegundosPa IS NULL
							THEN
								CASE WHEN DATEDIFF(SECOND, DATEADD(SECOND,MicroParo.DuracionSegundos + COALESCE(ParoActivo.DuracionSegundos,0),@dFechaInicioTurno), GETDATE()) < 3600
									THEN CONVERT(VARCHAR(10),ROUND(CAST( DATEDIFF(SECOND, DATEADD(SECOND,MicroParo.DuracionSegundos + COALESCE(ParoActivo.DuracionSegundos,0) ,@dFechaInicioTurno),GETDATE()) / 60.0 as FLOAT),1))+' Minutes' 
									ELSE CONVERT(VARCHAR(10),ROUND(CAST( DATEDIFF(SECOND, DATEADD(SECOND,MicroParo.DuracionSegundos + COALESCE(ParoActivo.DuracionSegundos,0),@dFechaInicioTurno),GETDATE()) / 3600.0 as FLOAT),1))+' Hours'
								END
							ELSE
								CASE WHEN MicroParo.DuracionSegundos IS NULL AND COALESCE(Paros.DuracionSegundosPa,0) > 0
									THEN CASE WHEN DATEDIFF(SECOND, DATEADD(SECOND,Paros.DuracionSegundosPa + COALESCE(ParoActivo.DuracionSegundos,0) ,@dFechaInicioTurno),GETDATE()) < 3600
											THEN CONVERT(VARCHAR(10),ROUND(CAST( DATEDIFF(SECOND, DATEADD(SECOND,Paros.DuracionSegundosPa + COALESCE(ParoActivo.DuracionSegundos,0),@dFechaInicioTurno),GETDATE()) / 60.0 as FLOAT),1))+' Minutes' 
											ELSE CONVERT(VARCHAR(10),ROUND(CAST( DATEDIFF(SECOND, DATEADD(SECOND,Paros.DuracionSegundosPa + COALESCE(ParoActivo.DuracionSegundos,0),@dFechaInicioTurno),GETDATE()) / 3600.0 as FLOAT),1))+' Hours'
											END
									ELSE
										CASE WHEN DATEDIFF(SECOND, DATEADD(SECOND,MicroParo.DuracionSegundos + Paros.DuracionSegundosPa + COALESCE(ParoActivo.DuracionSegundos,0) ,@dFechaInicioTurno),GETDATE()) < 3600
											THEN CONVERT(VARCHAR(10),ROUND(CAST( DATEDIFF(SECOND, DATEADD(SECOND,(MicroParo.DuracionSegundos + Paros.DuracionSegundosPa + COALESCE(ParoActivo.DuracionSegundos,0)),@dFechaInicioTurno),GETDATE()) / 60.0 as FLOAT),1))+' Minutes' 
											ELSE CONVERT(VARCHAR(10),ROUND(CAST( DATEDIFF(SECOND, DATEADD(SECOND,(MicroParo.DuracionSegundos + Paros.DuracionSegundosPa + COALESCE(ParoActivo.DuracionSegundos,0)),@dFechaInicioTurno),GETDATE()) / 3600.0 as FLOAT),1))+' Hours'
											END
									END
							END
					END AS 'Total Online'
			FROM @Maquinas Maq
			LEFT JOIN @ParosActivos ParoActivo
				ON Maq.IdComponente = ParoActivo.IdComponente
			LEFT JOIN @UltimoParo UltimoParo
				ON Maq.IdComponente = UltimoParo.IdComponente
			LEFT JOIN @MicroParos MicroParo
				ON Maq.IdComponente = MicroParo.IdComponente
			LEFT JOIN @Paros Paros
				ON Maq.IdComponente = Paros.IdComponente
			ORDER BY Maq.ClaTipoMaquina
	END
	ELSE
	BEGIN
		SELECT Maq.NomMaquina,
				@nClaTurno AS Turno,
				@dFechaAdm AS FechaAdm,
				'N/A' AS 'Status',
				'N/A' AS 'Ongoing Event',
				CASE WHEN MicroParo.IdComponente IS NULL --Total MicroParos
					THEN --No existen microparos
						'0 minutes'
					ELSE --Si existen microparos
						CASE WHEN MicroParo.DuracionSegundos < 3600
									THEN CONVERT(VARCHAR(10),ROUND(CAST( MicroParo.DuracionSegundos / 60.0 as FLOAT),1))+' Minutes' 
									ELSE CONVERT(VARCHAR(10),ROUND(CAST( MicroParo.DuracionSegundos / 3600.0 as FLOAT),1))+' Hours'
								END
					END AS 'Total MicroStop',
				CASE WHEN Paros.IdComponente IS NULL --Total Paros
					THEN --No existen Paros
						'0 minutes'
					ELSE --Si existen paros
						CASE WHEN Paros.DuracionSegundosPa < 3600
									THEN CONVERT(VARCHAR(10),ROUND(CAST( Paros.DuracionSegundosPa / 60.0 as FLOAT),1))+' Minutes' 
									ELSE CONVERT(VARCHAR(10),ROUND(CAST( Paros.DuracionSegundosPa / 3600.0 as FLOAT),1))+' Hours'
								END
					END AS 'Total Offline',
				CASE WHEN (COALESCE(MicroParo.DuracionSegundos,0) + COALESCE(Paros.DuracionSegundosPa,0)) = 0
					THEN --No existen paros
						'0 min'
					ELSE 
						CASE WHEN COALESCE(MicroParo.DuracionSegundos,0) > 0 AND Paros.DuracionSegundosPa IS NULL
							THEN
								CASE WHEN DATEDIFF(SECOND, DATEADD(SECOND,MicroParo.DuracionSegundos,@dFechaInicioTurno),@dFechaFinTurno) < 3600
									THEN CONVERT(VARCHAR(10),ROUND(CAST( DATEDIFF(SECOND, DATEADD(SECOND,MicroParo.DuracionSegundos,@dFechaInicioTurno),@dFechaFinTurno) / 60.0 as FLOAT),1))+' Minutes' 
									ELSE CONVERT(VARCHAR(10),ROUND(CAST( DATEDIFF(SECOND, DATEADD(SECOND,MicroParo.DuracionSegundos,@dFechaInicioTurno),@dFechaFinTurno) / 3600.0 as FLOAT),1))+' Hours'
								END
							ELSE
								CASE WHEN MicroParo.DuracionSegundos IS NULL AND COALESCE(Paros.DuracionSegundosPa,0) > 0
									THEN CASE WHEN DATEDIFF(SECOND, DATEADD(SECOND,Paros.DuracionSegundosPa,@dFechaInicioTurno),@dFechaFinTurno) < 3600
											THEN CONVERT(VARCHAR(10),ROUND(CAST( DATEDIFF(SECOND, DATEADD(SECOND,Paros.DuracionSegundosPa,@dFechaInicioTurno),@dFechaFinTurno) / 60.0 as FLOAT),1))+' Minutes' 
											ELSE CONVERT(VARCHAR(10),ROUND(CAST( DATEDIFF(SECOND, DATEADD(SECOND,Paros.DuracionSegundosPa,@dFechaInicioTurno),@dFechaFinTurno) / 3600.0 as FLOAT),1))+' Hours'
											END
									ELSE
										CASE WHEN (MicroParo.DuracionSegundos + Paros.DuracionSegundosPa) < 3600
											THEN CONVERT(VARCHAR(10),ROUND(CAST( DATEDIFF(SECOND, DATEADD(SECOND,(MicroParo.DuracionSegundos + Paros.DuracionSegundosPa),@dFechaInicioTurno),@dFechaFinTurno) / 60.0 as FLOAT),1))+' Minutes' 
											ELSE CONVERT(VARCHAR(10),ROUND(CAST( DATEDIFF(SECOND, DATEADD(SECOND,(MicroParo.DuracionSegundos + Paros.DuracionSegundosPa),@dFechaInicioTurno),@dFechaFinTurno) / 3600.0 as FLOAT),1))+' Hours'
											END
									END
							END
					END AS 'Total Online'
			FROM @Maquinas Maq
			LEFT JOIN @ParosActivos ParoActivo
				ON Maq.IdComponente = ParoActivo.IdComponente
			LEFT JOIN @UltimoParo UltimoParo
				ON Maq.IdComponente = UltimoParo.IdComponente
			LEFT JOIN @MicroParos MicroParo
				ON Maq.IdComponente = MicroParo.IdComponente
			LEFT JOIN @Paros Paros
				ON Maq.IdComponente = Paros.IdComponente
			ORDER BY Maq.ClaTipoMaquina
	END
END