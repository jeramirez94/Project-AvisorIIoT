/*==========================================
* CU: 1.2
* Objetivo: Obtener la lista de turnos externos correspondientes a una fecha-hora o a la fecha-hora actual. 
* Autor: mrodriguezc
* Fecha: 2023-06-22

 DECLARE @psErrorKey VARCHAR(50) 
 EXEC [AswSch].[ASW_CU5_Pag1_TurnoExterno_Sel] @pnClaUbicacion=65, @psIdioma = 'English', @psErrorKey = @psErrorKey OUT, @psErrorMsg = null 
 select @psErrorKey

*========================================== */
CREATE PROC [AswSch].[ASW_CU5_Pag1_TurnoExterno_Sel]
	@pnClaUbicacion INT,
    @ptFechaHora DATETIME=NULL,
	@psIdioma VARCHAR(20),
	@psErrorKey VARCHAR(50) OUT ,
	@psErrorMsg VARCHAR(500) OUT
AS
BEGIN
	DECLARE
		@tFechaHoraInicio DATETIME,
		@tFechaHoraFin DATETIME,
		@nTolerancia INT
	
	SET @psErrorKey = 'SUCCESS'
	SET @psErrorMsg = ''

	 
	IF @pnClaUbicacion  IS NULL OR  @psIdioma IS NULL
	BEGIN
		SELECT @psErrorKey = ErrorKey
			,@psErrorMsg = Mensaje
		FROM [AswSch].[AswCatMensajeError]
		WHERE ErrorKey = 'INCORRECT_PARAMETERS'
			AND Idioma = COALESCE(@psIdioma, 'English')
		RETURN
	END
	
	--Tolerancia de 15 minutos
	SET @nTolerancia = 15
	SET @tFechaHoraInicio = DATEADD(MINUTE, @nTolerancia ,COALESCE(@ptFechaHora, GETDATE()))
	SET @tFechaHoraFin = DATEADD(MINUTE, -@nTolerancia ,COALESCE(@ptFechaHora, GETDATE()))

	SELECT ClaTurno
		,NomTurno
	FROM [AswSch].[AswCatTurnoExternoVw]
	WHERE CAST(HoraInicio as TIME)<=CAST(@tFechaHoraInicio AS TIME)
		AND CAST(HoraFin as time) > CAST(@tFechaHoraFin AS TIME)
		AND HoraFin > HoraInicio
		AND BajaLogica = 0
	UNION ALL
	SELECT ClaTurno
		,NomTurno
	FROM [AswSch].[AswCatTurnoExternoVw]
	WHERE (CAST(HoraInicio as time) <=CAST(@tFechaHoraInicio AS TIME)
		OR CAST(HoraFin as time) > CAST(@tFechaHoraFin AS TIME))
		AND HoraFin < HoraInicio
		AND BajaLogica = 0

END