USE [ASW]
GO
/****** Object:  StoredProcedure [AswSch].[ASW_CU1_Pag2_Usuario_Sel]    Script Date: 17/07/2023 12:03:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*==========================================
* CU: 1.2
* Objetivo: Obtener la lista de usuarios por perfiles para la app. 
* Autor: mrodriguezc
* Fecha: 2023-06-21
* DECLARE @psErrorKey VARCHAR(50) EXEC [AswSch].[ASW_CU1_Pag2_Usuario_Sel] 65, 'English', @psErrorKey OUT, null select @psErrorKey
*========================================== */
CREATE PROC [AswSch].[ASW_CU1_Pag2_Usuario_Sel]
	@pnClaUbicacion INT,
	@psIdioma VARCHAR(20),
	@psErrorKey VARCHAR(50) OUT ,
	@psErrorMsg VARCHAR(500) OUT
AS
BEGIN

	
	SET @psErrorKey = 'SUCCESS'
	SET @psErrorMsg = ''

	SELECT [Value] AS IdPerfil
	INTO #Perfiles
	FROM [AswSch].[ASWSplitKeyFn]((SELECT Svalor1 FROM [AswSch].[ASWCfgConfiguracion] WHERE ClaveConfiguracion = 'PERFIL_APP'), ',')

	IF COALESCE(@pnClaUbicacion, @psIdioma) IS NULL
	BEGIN
		SELECT @psErrorKey = ErrorKey
			,@psErrorMsg = Mensaje
		FROM [AswSch].[AswCatMensajeError]
		WHERE ErrorKey = 'INCORRECT_PARAMETERS'
			AND Idioma = COALESCE(@psIdioma, 'English')
		RETURN
	END

	IF NOT EXISTS (SELECT 1 FROM #Perfiles)
	BEGIN
		SELECT @psErrorKey = ErrorKey
			,@psErrorMsg = Mensaje
		FROM [AswSch].[AswCatMensajeError]
		WHERE ErrorKey = 'APP_PROFILE_NOT_SET'
			AND Idioma = COALESCE(@psIdioma, 'English')
		RETURN
	END
	
	SELECT DISTINCT 
	    U.IdUsuario
		,NombreUsuario + ' ' +ApellidoPaterno AS NombreUsuario
		,ApellidoPaterno
		,LoginUserName
	FROM [AswSch].[AswTiCatUsuarioVw] U
	JOIN [AswSch].[AswTiRelUsuarioPerfilVw] UP
		ON U.ClaUbicacion = UP.ClaUbicacion
		AND U.IdUsuario = UP.IdUsuario
	JOIN #Perfiles P
		ON UP.IdPerfil = P.IdPerfil
	WHERE UP.ClaUbicacion = @pnClaUbicacion 
		AND U.BajaLogica = 0
		AND UP.BajaLogica = 0
	ORDER BY NombreUsuario, ApellidoPaterno
	
	
END

