--USE [ASW]
--GO
/****** Object:  StoredProcedure [AswSch].[ASW_CU601_Pag1_ObtenerDowntimes]    Script Date: 15/11/2022 03:38:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROC [AswSch].[ASW_CU601_Pag1_ObtenerDowntimes]
	@pnClaUbicacion INT
	,@ptFechaDesde DATETIME
	,@ptFechaHasta DATETIME
	,@psIdCelda VARCHAR(30)
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
		,@nTotalDowntimes INT
		,@nJustifiedDowntimes INT
		

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

	
	SET @nTotalDowntimes = (SELECT COUNT(*)
		FROM [AswSch].[AswBitBitacoraParo] p
		JOIN [AswSch].[AswCatWorkUnitVw] m
			ON p.IdComponente = m.ClaMaquina
				AND ClaTipoMaquina = 3
		WHERE IdWorkCenter = @psIdCelda
			AND p.FechaHoraInicial BETWEEN @tFechaInicioTurno AND @tFechaFinTurno
			AND p.ClaTurno = @pnClaTurno
			AND p.ClaEventoJustificacion = 0)

	


	SET @nJustifiedDowntimes = (SELECT COUNT(*)
		FROM [AswSch].[AswBitBitacoraParo] p
		JOIN [AswSch].[AswCatWorkUnitVw] m
			ON p.IdComponente = m.ClaMaquina
				AND ClaTipoMaquina = 3
		WHERE IdWorkCenter = @psIdCelda
			AND p.FechaHoraInicial BETWEEN @tFechaInicioTurno AND @tFechaFinTurno
			AND p.ClaTurno = @pnClaTurno
			AND (p.ClaEventoJustificacion = 2 OR p.ClaEventoJustificacion = 1))
	
	
	

	

	

	SELECT @nTotalDowntimes AS 'Unjustified Downtimes', @nJustifiedDowntimes AS 'Justified Downtimes'

END

