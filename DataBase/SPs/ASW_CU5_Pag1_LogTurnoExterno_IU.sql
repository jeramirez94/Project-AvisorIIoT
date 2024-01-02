/*==========================================
* CU: 1.2
* Objetivo: Obtener la lista de turnos externos correspondientes a una fecha-hora o a la fecha-hora actual. 
* Autor: mrodriguezc
* Fecha: 2023-06-22

 DECLARE @psErrorKey VARCHAR(50) 
 DECLARE @psErrorMsg VARCHAR(500) 
 EXEC [AswSch].[ASW_CU5_Pag1_LogTurnoExterno_IU] 
	@pnClaUbicacion=65, 
	@psIdWorkcenter = 'FF-01',
	@ptFechaAdm = '2023-06-23',
	@pnClaTurno = 8,
	@pnClaTurnoExterno = 3,
	@psNombrePcMod = 'MRC',
	@pnClaUsuarioMod = 0,
	@psIdioma = 'English', 
	@psErrorKey = @psErrorKey OUT, 
	@psErrorMsg = @psErrorMsg OUT 
 SELECT @psErrorKey, @psErrorMsg

*========================================== */
CREATE PROC [AswSch].[ASW_CU5_Pag1_LogTurnoExterno_IU]
	@pnClaUbicacion INT,
    @psIdWorkcenter VARCHAR(30),
	@ptFechaAdm DATETIME=NULL,
	@pnClaTurno INT=NULL,
	@pnClaTurnoExterno INT,
	@psNombrePcMod VARCHAR(64),
	@pnClaUsuarioMod INT,
	@psIdioma VARCHAR(20),
	@psErrorKey VARCHAR(50) OUT ,
	@psErrorMsg VARCHAR(500) OUT,
	@pnDebug INT = 0
AS
BEGIN
	DECLARE 
		@nClaDepartamento INT,
		@nMode INT,
		@tFechaHora DATETIME,
		@sNomTurno VARCHAR(10),
		@sNomTurnoExterno VARCHAR(255)

	SELECT @nClaDepartamento = ClaDepartamento
	FROM AswSch.AswCatWorkCenterVw
	WHERE IdWorkCenter = @psIdWorkcenter
	
	SET @psErrorKey = 'SUCCESS'
	SET @psErrorMsg = ''
	
	IF @pnClaUbicacion IS NULL OR @psIdioma IS NULL
	BEGIN
		SELECT @psErrorKey = ErrorKey
			,@psErrorMsg = Mensaje
		FROM [AswSch].[AswCatMensajeError]
		WHERE ErrorKey = 'INCORRECT_PARAMETERS'
			AND Idioma = COALESCE(@psIdioma, 'English')
		RETURN
	END

	SET @tFechaHora = GETDATE()
	
	--validar el turno correspondiente considerando la tolerancia de 15 min
	--turno corresponde
	IF EXISTS (SELECT 1  
				FROM [AswSch].[AswCatTurnoExternoVw]
				WHERE ClaTurno = @pnClaTurnoExterno
					AND CAST(HoraInicio AS TIME)<=CAST(GETDATE() AS TIME)
					AND CAST(HoraFin AS TIME) > CAST(GETDATE() AS TIME)
					AND HoraFin  > HoraInicio
					AND BajaLogica = 0
				UNION ALL
				SELECT 1
				FROM [AswSch].[AswCatTurnoExternoVw]
				WHERE ClaTurno = @pnClaTurnoExterno
					AND (CAST(HoraInicio AS time)<=CAST(GETDATE() AS TIME)
					OR CAST(HoraFin AS time) > CAST(GETDATE() AS TIME))
					AND HoraFin < HoraInicio
					AND BajaLogica = 0)
	BEGIN
		SET @nMode = 1		
		SET @tFechaHora = DATEADD(MINUTE, 0, @tFechaHora)
	END
	--turno corresponde a hora final con tolerancia
	IF EXISTS (SELECT 1  
				FROM [AswSch].[AswCatTurnoExternoVw]
				WHERE ClaTurno = @pnClaTurnoExterno
					AND CAST(HoraInicio AS time)<=CAST(DATEADD(MINUTE, -15, GETDATE()) AS TIME)
					AND CAST(HoraFin AS time) > CAST(DATEADD(MINUTE, -15, GETDATE()) AS TIME)
					AND HoraFin > HoraInicio
					AND BajaLogica = 0
				UNION ALL
				SELECT 1
				FROM [AswSch].[AswCatTurnoExternoVw]
				WHERE ClaTurno = @pnClaTurnoExterno
					AND (CAST(HoraInicio AS time) <=CAST(DATEADD(MINUTE, -15, GETDATE()) AS TIME)
					OR CAST(HoraFin AS time) > CAST(DATEADD(MINUTE, -15, GETDATE()) AS TIME))
					AND HoraFin < HoraInicio
					AND BajaLogica = 0)
	BEGIN
		SET @nMode = 2	
		SET @tFechaHora = DATEADD(MINUTE, -15, @tFechaHora)
	END
	--turno corresponde a hora inicial con tolerancia
	IF EXISTS (SELECT 1  
				FROM [AswSch].[AswCatTurnoExternoVw]
				WHERE ClaTurno = @pnClaTurnoExterno
					AND CAST( HoraInicio AS time) <=CAST(DATEADD(MINUTE, 15, GETDATE()) AS TIME)
					AND CAST(HoraFin AS time) > CAST(DATEADD(MINUTE, 15, GETDATE()) AS TIME)
					AND HoraFin > HoraInicio
					AND BajaLogica = 0
				UNION ALL
				SELECT 1
				FROM [AswSch].[AswCatTurnoExternoVw]
				WHERE ClaTurno = @pnClaTurnoExterno
					AND (CAST (HoraInicio AS time)<=CAST(DATEADD(MINUTE, 15, GETDATE()) AS TIME)
					OR CAST (HoraFin AS time) > CAST(DATEADD(MINUTE, 15, GETDATE()) AS TIME))
					AND HoraFin < HoraInicio
					AND BajaLogica = 0)
	BEGIN
		SET @nMode = 2
		SET @tFechaHora = DATEADD(MINUTE, 15, @tFechaHora)
	END

	IF @pnDebug = 1
	BEGIN
		SELECT @nMode AS Mode
			,@tFechaHora AS FechaHora
	END
	
	--si no se da el turno es el actual
	IF @ptFechaAdm IS NULL OR @pnClaTurno IS NULL
	BEGIN

		SET @ptFechaAdm = [AswSch].[ASWGetFechaAdm] (@pnClaUbicacion, @nClaDepartamento, @tFechaHora)
		SET @pnClaTurno = [AswSch].[ASWGetTurno] (@pnClaUbicacion, @nClaDepartamento, @tFechaHora)
		
		SELECT @sNomTurno = NomTurno
		FROM AswSch.AswCatTurno
		WHERE ClaTurno = @pnClaTurno
		
		SELECT @sNomTurnoExterno = NomTurno
		FROM AswSch.AswCatTurnoExternoVw
		WHERE ClaTurno = @pnClaTurnoExterno

		--si no se dio el turno se valida que coincida con el actual
		IF @nMode IS NULL
		BEGIN			
			SELECT @psErrorKey = ErrorKey
				,@psErrorMsg = REPLACE(REPLACE(Mensaje, '{{TurnoExterno}}', @sNomTurnoExterno), '{{Turno}}', @sNomTurno)
			FROM [AswSch].[AswCatMensajeError]
			WHERE ErrorKey = 'INVALID_SHIFT'
				AND Idioma = COALESCE(@psIdioma, 'English')
			RETURN
		END
	END
	ELSE --si se da el turno se valida que corresponda a la fecha-hora del turno externo
	BEGIN
		IF NOT EXISTS (
			SELECT T.ClaTurno, TE.ClaTurno AS ClaTurnoExterno
			FROM AswSch.AswRelTurnoDepartamentoHorario T
			JOIN AswSch.AswCatTurnoExternoVw TE
				ON T.HoraInicioTurno >= CAST (TE.HoraInicio as time)
						AND T.HoraInicioTurno < CAST(TE.HoraFin as time)
					OR T.HoraFinTurno > CAST(TE.HoraInicio as time)
						AND T.HoraFinTurno <= CAST (TE.HoraFin as time)
			WHERE ClaDepartamento = @nClaDepartamento
				AND T.ClaTurno = @pnClaTurno
				AND TE.ClaTurno = @pnClaTurnoExterno
				AND T.HoraFinTurno > T.HoraInicioTurno
				AND TE.HoraFin > TE.HoraInicio
				AND T.BajaLogica = 0
				AND TE.BajaLogica = 0
			UNION
			SELECT T.ClaTurno, TE.ClaTurno AS ClaTurnoExterno
			FROM AswSch.AswRelTurnoDepartamentoHorario T
			JOIN AswSch.AswCatTurnoExternoVw TE
				ON (T.HoraInicioTurno >= CAST(TE.HoraInicio  as time)
						OR T.HoraInicioTurno < CAST(TE.HoraFin as time) )
					OR (T.HoraFinTurno > CAST(TE.HoraInicio as time)
						OR T.HoraFinTurno <= CAST(TE.HoraFin as time))
			WHERE ClaDepartamento = @nClaDepartamento
				AND T.ClaTurno = @pnClaTurno
				AND TE.ClaTurno = @pnClaTurnoExterno
				AND T.HoraFinTurno < T.HoraInicioTurno
				AND TE.HoraFin < TE.HoraInicio
				AND T.BajaLogica = 0
				AND TE.BajaLogica = 0
			)
		BEGIN
		
			SELECT @sNomTurno = NomTurno
			FROM AswSch.AswCatTurno
			WHERE ClaTurno = @pnClaTurno
		
			SELECT @sNomTurnoExterno = NomTurno
			FROM AswSch.AswCatTurnoExternoVw
			WHERE ClaTurno = @pnClaTurnoExterno

			SELECT @psErrorKey = ErrorKey
				,@psErrorMsg = REPLACE(REPLACE(Mensaje, '{{TurnoExterno}}', @sNomTurnoExterno), '{{Turno}}', @sNomTurno)
			FROM [AswSch].[AswCatMensajeError]
			WHERE ErrorKey = 'INVALID_SHIFT'
				AND Idioma = COALESCE(@psIdioma, 'English')
			RETURN
		END
		
	END
	
	INSERT INTO [AswSch].[AswBitTurnoExterno]
		([ClaUbicacion]
		,[IdWorkCenter]
		,[FechaAdm]
		,[ClaTurno]
		,[ClaTurnoExterno]
		,[BajaLogica]
		,[FechaBajaLogica]
		,[ClaUsuarioMod]
		,[NombrePCMod]
		,[FechaUltimaMod])
	VALUES
		(@pnClaUbicacion
		,@psIdWorkcenter
		,@ptFechaAdm
		,@pnClaTurno
		,@pnClaTurnoExterno
		,0
		,NULL
		,@pnClaUsuarioMod
		,@psNombrePcMod
		,GETDATE())

	IF EXISTS (SELECT 1 
				FROM [AswSch].[AswTraTurnoExterno] 
				WHERE ClaUbicacion = @pnClaUbicacion 
					AND IdWorkCenter = @psIdWorkcenter
					AND FechaAdm = @ptFechaAdm
					AND ClaTurno = @pnClaTurno)
	BEGIN
		UPDATE [AswSch].[AswTraTurnoExterno]
		SET ClaTurnoExterno = @pnClaTurnoExterno
			,ClaUsuarioMod = @pnClaUsuarioMod
			,NombrePcMod = @psNombrePcMod
			,FechaUltimaMod = GETDATE()
		WHERE ClaUbicacion = @pnClaUbicacion 
			AND IdWorkCenter = @psIdWorkcenter
			AND FechaAdm = @ptFechaAdm
			AND ClaTurno = @pnClaTurno
	END
	ELSE
	BEGIN
		INSERT INTO [AswSch].[AswTraTurnoExterno]
			([ClaUbicacion]
			,[IdWorkCenter]
			,[FechaAdm]
			,[ClaTurno]
			,[ClaTurnoExterno]
			,[BajaLogica]
			,[FechaBajaLogica]
			,[ClaUsuarioMod]
			,[NombrePCMod]
			,[FechaUltimaMod])
		VALUES
			(@pnClaUbicacion
			,@psIdWorkcenter
			,@ptFechaAdm
			,@pnClaTurno
			,@pnClaTurnoExterno
			,0
			,NULL
			,@pnClaUsuarioMod
			,@psNombrePcMod
			,GETDATE())
	END

	SELECT @pnClaTurno AS ClaTurno
		,@sNomTurno AS NomTurno
		,@pnClaTurnoExterno AS ClaTurnoExterno
		,@sNomTurnoExterno AS NomTurnoExterno

END