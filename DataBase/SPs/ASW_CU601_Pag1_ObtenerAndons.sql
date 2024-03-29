--USE [ASW]
--GO
/****** Object:  StoredProcedure [AswSch].[ASW_CU601_Pag1_ObtenerAndons]    Script Date: 15/11/2022 03:35:58 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROC [AswSch].[ASW_CU601_Pag1_ObtenerAndons]
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
		,@nAndonRegistrado INT
		,@nAndonAtendido INT
		,@nAndonSolucionado INT
		

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

	
	SET @nAndonRegistrado = (SELECT COUNT(*)
		FROM [AswSch].[AswBitAndon] p
		JOIN [AswSch].[AswCatWorkUnitVw] m
			ON p.IdComponente = m.ClaMaquina
				AND (ClaTipoMaquina = 1 OR ClaTipoMaquina = 2 OR ClaTipoMaquina = 3 OR ClaTipoMaquina = 6)
		WHERE IdWorkCenter = @psIdCelda
			AND FechaAdmSCADA = @tFechaAdm
			AND ClaTurno = @pnClaTurno
			AND ClaEventoAtencion IS NULL AND ClaEventoSolucionado IS NULL)

	SET @nAndonAtendido = (SELECT COUNT(*)
		FROM [AswSch].[AswBitAndon] p
		JOIN [AswSch].[AswCatWorkUnitVw] m
			ON p.IdComponente = m.ClaMaquina
				AND (ClaTipoMaquina = 1 OR ClaTipoMaquina = 2 OR ClaTipoMaquina = 3 OR ClaTipoMaquina = 6)
		WHERE IdWorkCenter = @psIdCelda
			AND FechaAdmSCADA = @tFechaAdm
			AND ClaTurno = @pnClaTurno
			AND ClaEventoAtencion = 1 AND ClaEventoSolucionado IS NULL)

	SET @nAndonSolucionado = (SELECT COUNT(*)
		FROM [AswSch].[AswBitAndon] p
		JOIN [AswSch].[AswCatWorkUnitVw] m
			ON p.IdComponente = m.ClaMaquina
				AND (ClaTipoMaquina = 1 OR ClaTipoMaquina = 2 OR ClaTipoMaquina = 3 OR ClaTipoMaquina = 6)
		WHERE IdWorkCenter = @psIdCelda
			AND FechaAdmSCADA = @tFechaAdm
			AND ClaTurno = @pnClaTurno
			AND ClaEventoAtencion = 1 AND ClaEventoSolucionado = 1)
	
	
	

	

	

	SELECT @nAndonRegistrado AS 'Registered Andons', @nAndonAtendido AS 'Checked Andon', @nAndonSolucionado AS 'Solved Andon'

END