USE [ASWH]
GO
/****** Object:  StoredProcedure [AswSch].[ASW_CU170_Pag1_ObtenerTurno]    Script Date: 10/03/2023 03:38:24 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*==========================================
* CU: 170.1
* Objetivo: SP auxiliar para obtener turno
* Autor: José Carlos Arias Rodríguez
* Fecha: 2022-03-10
* EXEC: [AswSch].[ASW_CU170_Pag1_ObtenerTurno]
*========================================== */
ALTER PROC [AswSch].[ASW_CU170_Pag1_ObtenerTurno] 
	@pnClaUbicacion INT, 
	@pnClaDepartamento INT,
	@ptFechaHora DATETIME
AS  BEGIN

	DECLARE
		@nTurno INT
		,@tFecha DATE
		,@tHora TIME



	IF @ptFechaHora IS NULL
	BEGIN
		SET @ptFechaHora = GETDATE()
	END
	
	SET @tFecha = CONVERT(DATE, @ptFechaHora)
	SET @tHora = CONVERT(TIME, @ptFechaHora)

	;WITH cteTurnoActual AS(
		select ClaUbicacion, ClaTurno, 0 AS EsCambioDia, ProduccionDiaInicio, HoraInicioTurno, HoraFinTurno 
		FROM [AswSch].[AswRelTurnoDepartamentoHorario]
		where convert(time, @ptFechaHora) >= HoraInicioTurno
			AND convert(time, @ptFechaHora) < HoraFinTurno
			AND HoraFinTurno > HoraInicioTurno
			AND ClaDepartamento = @pnClaDepartamento
		UNION ALL	
		select ClaUbicacion, ClaTurno, 1 AS EsCambioDia, ProduccionDiaInicio, HoraInicioTurno, HoraFinTurno 
		FROM  [AswSch].[AswRelTurnoDepartamentoHorario]
		where (convert(time, @ptFechaHora) >= HoraInicioTurno
			OR convert(time, @ptFechaHora) < HoraFinTurno)
			AND HoraFinTurno < HoraInicioTurno
			AND ClaDepartamento = @pnClaDepartamento
	)
	
	SELECT @nTurno = ClaTurno
	FROM cteTurnoActual
	
	
	SELECT @nTurno AS ClaTurno
END
