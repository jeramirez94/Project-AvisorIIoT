--USE [ASW]
--GO
/****** Object:  StoredProcedure [AswSch].[ASW_CU602_Pag1_JustificacionesParos]    Script Date: 15/11/2022 03:52:47 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROC [AswSch].[ASW_CU602_Pag1_JustificacionesParos]
	@pnClaUbicacion INT
	,@ptFechaDesde DATETIME
	,@ptFechaHasta DATETIME
	,@psIdCelda VARCHAR(30)
	,@pnAsset VARCHAR
	,@pnFlag INT
	,@pnClaTurno INT 
	,@pnTiempoUTC INT = 0
	,@pnDebug INT = 0
AS
BEGIN

	--SET @ptFechaHasta = COALESCE(@ptFechaHasta, GETDATE())
	--si no hay turno devolver ultimo turno o 0s?
	
	DECLARE
		@nClaAreaProduccion INT
		,@tFechaAdm DATETIME
		,@tFechaInicioTurno DATETIME
		,@tFechaFinTurno DATETIME
		,@sql  NVARCHAR(max)
		,@ExcludedList VARCHAR(100)
	
	
	
	
	IF @pnAsset = 0
		SET @ExcludedList = 'AND ClaTipoMaquina IN(1,2,3,6)'
		
	ELSE
		SET @ExcludedList = 'AND ClaTipoMaquina IN(' +CAST (@pnAsset AS varchar(10))+')'
	
		
		
	IF @pnTiempoUTC = 1
		
	BEGIN
		SET @ptFechaHasta = dateadd(hh, datediff(hh, getutcdate(), getdate()), @ptFechaHasta)
	END

	SELECT @nClaAreaProduccion = ClaDepartamento 
	FROM [AswSch].[AswCatWorkCenterVw]
	WHERE IdWorkCenter = @psIdCelda

	--obtengo fecha
	SET @tFechaAdm = [AswSch].[ASWGetFechaAdm] (@pnClaUbicacion, @nClaAreaProduccion, @ptFechaHasta)

	--obtengo el inicio y fin de turno para la fecha consultada
	SET @tFechaInicioTurno = [AswSch].[ASWGetInicioTurno](@pnClaUbicacion, @tFechaAdm, @pnClaTurno, @nClaAreaProduccion)
	SET @tFechaFinTurno = [AswSch].[ASWGetFinTurno](@pnClaUbicacion, @tFechaAdm, @pnClaTurno, @nClaAreaProduccion)
	
	
	
	IF @pnFlag = 1
	BEGIN
	DECLARE @JustificacionesParos TABLE (Asset VARCHAR(100),Fecha DATETIME,Duracion VARCHAR(100),Justificacion VARCHAR(100))
	
	SET @sql = 'SELECT m.NomMaquina AS ''Asset'',DATEADD(second, DATEDIFF(second, GETDATE(), GETUTCDATE()), p.FechaHoraInicial) AS ''Starting time'',
	CASE WHEN (p.DuracionSegundos) < 3600
									THEN CONVERT(VARCHAR(10),ROUND(CAST( (p.DuracionSegundos) / 60.0 as FLOAT),1))+'' Minutes'' 
									ELSE CONVERT(VARCHAR(10),ROUND(CAST( (p.DuracionSegundos) / 3600.0 as FLOAT),1))+'' Hours''
	END AS Duracion, s.NomSeccionParo AS ''Justification''
		INTO #JustificacionesParos
		FROM [AswSch].[AswBitBitacoraParo] p
		JOIN [AswSch].[AswCatWorkUnitVw] m
			ON p.IdComponente = m.ClaMaquina
				'+@ExcludedList+'
		LEFT JOIN [AswSch].[AswCatSeccionParo] s 
		    ON p.ClaSeccionParo = s.ClaSeccionParo
		    WHERE IdWorkCenter = ' +CAST (@psIdCelda AS varchar(10))+ '
			AND FechaHoraInicial BETWEEN '''+CONVERT(VARCHAR(50), @tFechaInicioTurno, 120)+''' AND '''+CONVERT(VARCHAR(50), @tFechaFinTurno, 120)+'''
			AND ClaTurno = ' +CAST (@pnClaTurno AS varchar(10))+ '

	SELECT * FROM #JustificacionesParos'
	EXEC sp_executesql @sql
	END
	ELSE  
	BEGIN
	DECLARE @TotalParos TABLE (Total VARCHAR(100))
	SET @sql= 'SELECT 
	CASE WHEN (SUM(p.DuracionSegundos)) < 3600
									THEN CONVERT(VARCHAR(10),ROUND(CAST( (SUM(p.DuracionSegundos)) / 60.0 as FLOAT),1))+'' Minutes'' 
									ELSE CONVERT(VARCHAR(10),ROUND(CAST( (SUM(p.DuracionSegundos)) / 3600.0 as FLOAT),1))+'' Hours''
	END AS Total
		INTO #TotalParos
		FROM [AswSch].[AswBitBitacoraParo] p
		JOIN [AswSch].[AswCatWorkUnitVw] m
			ON p.IdComponente = m.ClaMaquina
				'+@ExcludedList+'
		LEFT JOIN [AswSch].[AswCatSeccionParo] s 
		    ON p.ClaSeccionParo = s.ClaSeccionParo
		    WHERE IdWorkCenter = ' +CAST (@psIdCelda AS varchar(10))+ '
			AND FechaHoraInicial BETWEEN '''+CONVERT(VARCHAR(50), @tFechaInicioTurno, 120)+''' AND '''+CONVERT(VARCHAR(50), @tFechaFinTurno, 120)+'''
			AND ClaTurno = ' +CAST (@pnClaTurno AS varchar(10))+ '

	SELECT * FROM #TotalParos';
	EXEC sp_executesql @sql

	END

END

