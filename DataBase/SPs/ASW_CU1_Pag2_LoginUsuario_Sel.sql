USE [ASW]
GO
/****** Object:  StoredProcedure [AswSch].[ASW_CU1_Pag2_LoginUsuario_Sel]    Script Date: 07/08/2023 01:07:47 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--USE ASWH
--GO
/*========================================== 
* CU: 1.2 
* Objetivo: Validar usuario y contraseña, si es valido devuelve un registro por cada perfil asociado
* Autor: ngalaz 
* Fecha: 2023-06-20 
EXEC [AswSch].[ASW_CU1_Pag2_LoginUsuario_Sel] 65,'',2914482,'FF-01','USER_ONLY',0,'Estacion FF-01','English','','',0
*========================================== */ 
ALTER PROC [AswSch].[ASW_CU1_Pag2_LoginUsuario_Sel]
	@PnClaUbicacion INT,
	@PsPwd VARCHAR(140),
	@PnIdUsuario int,
	@psIdWorkCenter VARCHAR(200),
	@PsAutenticacion VARCHAR(100),
	@pnClaUsuarioMod INT,
	@psNombrePcMod VARCHAR(200),
	@psIdioma VARCHAR(200),
	@psErrorKey VARCHAR(150) OUT ,
	@psErrorMsg VARCHAR(500) OUT,
	@PnDebug INT = 0 

AS
BEGIN
	DECLARE 
		@nClaDepartamento INT,
		@nMode INT,
		@tFechaHora DATETIME,
		@tFechaAdm DATETIME,
		@nClaTurno INT,
		@sNomTurno VARCHAR(10),
		@sNomTurnoExterno VARCHAR(255)

	DECLARE @sErrorKey_Success VARCHAR(10) = 'SUCCESS',
		    @sErrorKey_IncorrectParams VARCHAR(50) = 'INCORRECT_PARAMETERS',
			@sErrorKey_AuthFailed VARCHAR(20) = 'AUTH_FAILED',
			@sErrorKey_InvalidProfile VARCHAR(20) = 'INVALID_PROFILE'

    DECLARE @sAut_On VARCHAR(2) = 'ON'
		   ,@sAut_Off VARCHAR(3) = 'OFF'
	       ,@sAut_UserOnly VARCHAR(10) = 'USER_ONLY'

	SELECT [Value] AS IdPerfil
	INTO #Perfiles
	FROM [AswSch].[ASWSplitKeyFn]((SELECT Svalor1 FROM [AswSch].[ASWCfgConfiguracion] WHERE ClaveConfiguracion = 'PERFIL_APP'), ',')

	SET @psErrorKey = @sErrorKey_Success
	SET @psErrorMsg = NULL
	SET @tFechaHora = GETDATE()
	SELECT @nClaDepartamento = ClaDepartamento
	FROM AswSch.AswCatWorkCenterVw
	WHERE IdWorkCenter = @psIdWorkCenter

	DECLARE @nMatch INT,
			@sNomUsuario VARCHAR(100),
			@PwdRecibidaEncriptada nvarchar(4000),
			@nIdPerfil INT

	SET @tFechaAdm = (SELECT [AswSch].[ASWGetFechaAdm] (@PnClaUbicacion, @nClaDepartamento, @tFechaHora))
	SET @nClaTurno = (SELECT [AswSch].[ASWGetTurno] (@PnClaUbicacion, @nClaDepartamento, @tFechaHora))

	IF(@PnClaUbicacion IS NULL 
		OR ISNULL(@PsAutenticacion,'') = '' 
		OR (@PsAutenticacion <> @sAut_Off AND @PnIdUsuario IS NULL) )
	BEGIN
		
		SELECT   @psErrorMsg = Mensaje
				,@psErrorKey = ErrorKey
		FROM [AswSch].[AswCatMensajeError]
		WHERE ErrorKey = @sErrorKey_IncorrectParams
			AND Idioma = isnull(@psIdioma,'English')

		RETURN
	END

	--SE ENCRIPTA EL PASS RECIBIDO PARA VALIDAR CONTRA EL ALMACENADO
	SELECT @PwdRecibidaEncriptada = TiSeguridad.dbo.FnEncriptaPassword(@PsPwd) 


	SELECT   @nMatch = 
		CASE WHEN @PsAutenticacion = @sAut_On
			THEN 
				CASE WHEN ISNULL(TiPass.Contrasena,CAST('' AS varbinary)) = CAST(@PsPwd as varbinary)  
									THEN 1 
								WHEN TiPass.Contrasena  = @PwdRecibidaEncriptada 
									THEN 1 
								ELSE 0 
				END 
		WHEN @PsAutenticacion = @sAut_UserOnly
			THEN 1
		ELSE 0
		END 
	,@sNomUsuario = NombreUsuario+' '+ApellidoPaterno
	,@nIdPerfil = ref.IdPerfil
	FROM AswSch.AswTiCatUsuarioVw  Usr
	JOIN AswSch.AswTiRelUsuarioPerfilVw ref
		ON Usr.idUsuario = ref.idUsuario
	LEFT JOIN TiSeguridad.dbo.TiTraUsuarioContrasena TiPass
		ON TiPass.IdUsuario = Usr.IdUsuario
	WHERE  ref.IdPerfil IN (SELECT IdPerfil FROM #Perfiles)
		AND ref.ClaUbicacion = @PnClaUbicacion
		AND Usr.IdUsuario = @PnIdUsuario

	
	IF( @PsAutenticacion = @sAut_Off )
	BEGIN

		SET @nMatch = 1

	END


	IF(@nMatch = 0 OR @sNomUsuario IS NULL)
	BEGIN
		
		SELECT   @psErrorMsg = Mensaje
				,@psErrorKey = ErrorKey
		FROM [AswSch].[AswCatMensajeError]
		WHERE ErrorKey = @sErrorKey_AuthFailed
			AND Idioma = isnull(@psIdioma,'English')

	END


	--GUARDAR REGISTRO EN BITACORA
	INSERT INTO [AswSch].[AswBitOperador]
			   ([ClaUbicacion]
			   ,[IdWorkCenter]
			   ,[IdUsuario]
			   ,[FechaAdm]
			   ,[ClaTurno]
			   ,[BajaLogica]
			   ,[FechaBajaLogica]
			   ,[ClaUsuarioMod]
			   ,[NombrePCMod]
			   ,[FechaUltimaMod])
	VALUES (@PnClaUbicacion
		   ,@psIdWorkCenter
		   ,@PnIdUsuario
		   ,@tFechaAdm
		   ,@nClaTurno
		   ,0
		   ,NULL
		   ,@pnClaUsuarioMod
		   ,@psNombrePcMod
		   ,GETDATE()
	);
	
	--SI EXISTE REGISTRO SE ACTUALIZA SINO SE INSERTA
    IF EXISTS (SELECT 1 
				FROM [AswSch].[AswTraOperador]
				WHERE ClaUbicacion = @PnClaUbicacion
				AND IdWorkCenter = @psIdWorkCenter
				AND FechaAdm = @tFechaAdm 
				AND ClaTurno = @nClaTurno)
	BEGIN
		UPDATE [AswSch].[AswTraOperador]
		SET IdUsuario   = @PnIdUsuario
		,FechaUltimaMod = GETDATE()
		,ClaUsuarioMod  =  @pnClaUsuarioMod
		,NombrePCMod    = @psNombrePcMod
		WHERE ClaUbicacion = @PnClaUbicacion
			AND IdWorkCenter = @psIdWorkCenter
			AND FechaAdm     = @tFechaAdm 
			AND ClaTurno     = @nClaTurno
	END
	ELSE
	BEGIN
		INSERT INTO [AswSch].[AswTraOperador]
		([ClaUbicacion]
		,[IdWorkCenter]
		,IdUsuario
		,[FechaAdm]
		,[ClaTurno]
		,[BajaLogica]
		,[FechaBajaLogica]
		,[ClaUsuarioMod]
		,[NombrePCMod]
		,[FechaUltimaMod])
		VALUES
			(@PnClaUbicacion
			,@psIdWorkCenter
			,@PnIdUsuario
			,@tFechaAdm
			,@nClaTurno
			,0
			,NULL
			,@pnClaUsuarioMod
			,@psNombrePcMod
			,GETDATE());
	END


	
	--RESULTADO
	SELECT  @nMatch         as Autenticado
		   ,@sNomUsuario    as NomUsuario
		   ,@PnIdUsuario    as IdUsuario
		   ,@nIdPerfil      as IdPerfil;

END

