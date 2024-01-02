/*==========================================
* CU: 1.7
* Objetivo: Obtener los valores que se despliegan en el footer: Usuario loggeado, turno externo o actual
* Autor: mrodriguezc
* Fecha: 2023-06-27

 DECLARE @psErrorKey VARCHAR(50) 
 EXEC [AswSch].[ASW_CU1_Pag7_DatosFooter_Sel] @pnClaUbicacion=65, @psIdWorkCenter='FF-01', @psIdioma = 'English', @psErrorKey = @psErrorKey OUT, @psErrorMsg = null 
 select @psErrorKey

*========================================== */
CREATE PROC [AswSch].[ASW_CU1_Pag7_DatosFooter_Sel]
	@pnClaUbicacion INT,
	@psIdWorkCenter VARCHAR(30),
	@psIdioma VARCHAR(20),
	@psErrorKey VARCHAR(50) OUT ,
	@psErrorMsg VARCHAR(500) OUT
AS
BEGIN
	DECLARE 
		@nClaDepartamento INT,
		@tFechaAdm DATE,
		@nClaTurno INT,
		@sNombreUsuario VARCHAR(100),
		@sTurno VARCHAR(255)


	SELECT @nClaDepartamento = ClaDepartamento
	FROM AswSch.AswCatWorkCenterVw
	WHERE IdWorkCenter = @psIdWorkcenter
	
	SET @psErrorKey = 'SUCCESS'
	SET @psErrorMsg = ''

	SET @tFechaAdm = [AswSch].[ASWGetFechaAdm] (@pnClaUbicacion, @nClaDepartamento, GETDATE())
	SET @nClaTurno = [AswSch].[ASWGetTurno] (@pnClaUbicacion, @nClaDepartamento, GETDATE())

	 
	IF @pnClaUbicacion  IS NULL OR  @psIdioma IS NULL OR COALESCE(@psIdWorkCenter,'') = ''
	BEGIN
		SELECT @psErrorKey = ErrorKey
			,@psErrorMsg = Mensaje
		FROM [AswSch].[AswCatMensajeError]
		WHERE ErrorKey = 'INCORRECT_PARAMETERS'
			AND Idioma = COALESCE(@psIdioma, 'English')
		RETURN
	END
	
	SELECT @sNombreUsuario = NombreUsuario + ' ' +  ApellidoPaterno
	FROM AswSch.AswTraOperador O
	JOIN [AswSch].[AswTiCatUsuarioVw] U
		ON O.ClaUbicacion = U.ClaUbicacion
		AND  O.IdUsuario = U.IdUsuario
	WHERE O.ClaUbicacion = @pnClaUbicacion
		AND IdWorkCenter = @psIdWorkCenter
		AND FechaAdm = @tFechaAdm
		AND ClaTurno = @nClaTurno

	SELECT @sTurno = NomTurno
	FROM AswSch.AswTraTurnoExterno T
	JOIN AswSch.AswCatTurnoExternoVw TE
		ON T.ClaUbicacion = TE.ClaUbicacion
		AND T.ClaTurnoExterno = TE.ClaTurno
	WHERE T.ClaUbicacion = @pnClaUbicacion
		AND IdWorkCenter = @psIdWorkCenter
		AND FechaAdm = @tFechaAdm
		AND T.ClaTurno = @nClaTurno

	IF @sTurno IS NULL
	BEGIN
		SELECT @sTurno = NomTurno
		FROM AswSch.AswCatTurno
		WHERE ClaUbicacion = @pnClaUbicacion
		AND ClaTurno = @nClaTurno
	END

	SELECT COALESCE(@sNombreUsuario, '') AS NombreUsuario
		,COALESCE(@sTurno, '') AS Turno 

END