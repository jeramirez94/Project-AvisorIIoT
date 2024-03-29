USE [ASW]
GO
/****** Object:  StoredProcedure [AswSch].[ASW_CU11_Pag1_Grid_grdcatalogoOperadores_IU]    Script Date: 14/11/2022 12:25:42 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROC [AswSch].[ASW_CU11_Pag1_Grid_grdcatalogoOperadores_IU]
@PnIdUsuario INT = NULL,
@PsNombreUsuario VARCHAR(50),
@PsApPaterno VARCHAR(50),
@PdFechaNacimiento DATE = NULL,
@PsEmail VARCHAR(50) = NULL,
@PnClaPerfil INT,
@PsLoginUsername VARCHAR(15),
@PsTelefonoCelular VARCHAR(20) = NULL,
@PnBajaLogica INT,
@PnClaUsuarioMod INT,
@PsNombrePcMod VARCHAR(64),
@PsRFC VARCHAR(13),
@pnAccionSp   INT = 0

AS
BEGIN

DECLARE  @nClaUbicacionDefault INT,
		 @nIdUsuario INT,
		 @sLoginUserName VARCHAR(15),
		 @msgMensajeErr VARCHAR(300),
		 @sPasswd NVARCHAR(13),
		 @sEncriptedPass  varbinary (8000),
		 @sNumeroEmpleado varchar(50)



SELECT @nClaUbicacionDefault = Valor1 
FROM [AswSch].[ASWCfgConfiguracion]
WHERE ClaConfiguracion = 1


IF(@PsNombreUsuario IS NULL OR @PsNombreUsuario = '')
BEGIN
	RAISERROR('First Name is Mandatory',16,1);
	RETURN
END
IF(@PsApPaterno IS NULL OR @PsApPaterno = '')
BEGIN
	RAISERROR('Last Name is Mandatory',16,1)
	RETURN
END

IF(@PnClaPerfil IS NULL)
BEGIN
	RAISERROR('Position is Mandatory',16,1)
	RETURN
END
IF(@PsRFC IS NULL OR @PsRFC = '')
BEGIN
	RAISERROR('Employee Number is Mandatory',16,1)
	RETURN
END


-- EL NUMERO DE EMPLEADO (QUE SE RECIBE EN EL PARAMETRO @PsRFC) SE GUARDA COMO APELLIDO MATERNO
SET @sNumeroEmpleado = @PsRFC

--CREAR CONTRASEÑA DEFAULT DEL USUARIO
SELECT @sPasswd = SUBSTRING(@PsNombreUsuario,1,1) + SUBSTRING(@PsApPaterno,1,1) + @PsRFC

--LA CADENA GENERADA SE GUARDA COMO RFC
SET @PsRFC = @sPasswd

SET @PdFechaNacimiento = '1900-01-01'

--GENERAR LOGIN USER NAME

	DECLARE @nOffSet INT ;

	SELECT @sLoginUserName = SUBSTRING(@PsNombreUsuario,1,1)+REPLACE(@PsApPaterno,' ','')
	
	--PARA ACTULIZAR, SI EL LOGIN USERNAME CORRESPONDE AL MISMO IDUSUARIO NO SE CAMBIA
	IF @PnIdUsuario IS NOT NULL
	BEGIN 
		
		IF EXISTS (SELECT 1 FROM [AswSch].[TiTraUsuarioCentralVw] WHERE IdUsuario = @PnIdUsuario
		AND NombreUsuario = @PsNombreUsuario AND ApellidoPaterno = @PsApPaterno)
		BEGIN
		--MANTENER EL LOGINUSERNAME		
			SELECT @sLoginUserName = LoginUserName 
			FROM [AswSch].[TiTraUsuarioCentralVw] 
			WHERE IdUsuario = @PnIdUsuario
		END
		ELSE
		BEGIN
		--CAMBIO EN EL NOMBRE ENTONCES HAY QUE GENERAR OTRO LOGINUSERNAME
			SET @nOffSet = 1;

			WHILE EXISTS ( SELECT 1 FROM [AswSch].[TiTraUsuarioCentralVw] WHERE LoginUserName = @sLoginUserName ) 
				  AND @nOffSet < LEN(@PsNombreUsuario)
			BEGIN
				SET @nOffSet = @nOffSet + 1;
				SET @sLoginUserName = SUBSTRING(@PsNombreUsuario,1,@nOffSet)+REPLACE(@PsApPaterno,' ','');
			END

			IF EXISTS(SELECT 1 FROM [AswSch].[TiTraUsuarioCentralVw] WHERE LoginUserName = @sLoginUserName)
				AND @nOffSet >= LEN(@PsNombreUsuario)
			BEGIN
				RAISERROR('Unable to create an unique the user login name, contact the system administrator',16,1)
				RETURN
			END

		END

		
	END
	
	--GENERAR LOGINUSERNAME PARA USAURIOS NUEVOS
	IF @PnIdUsuario IS NULL
	BEGIN
		SET @nOffSet = 1;

		WHILE EXISTS ( SELECT 1 FROM [AswSch].[TiTraUsuarioCentralVw] WHERE LoginUserName = @sLoginUserName ) 
			  AND @nOffSet < LEN(@PsNombreUsuario)
		BEGIN
			SET @nOffSet = @nOffSet + 1;
			SET @sLoginUserName = SUBSTRING(@PsNombreUsuario,1,@nOffSet)+REPLACE(@PsApPaterno,' ','');
		END

		IF EXISTS(SELECT 1 FROM [AswSch].[TiTraUsuarioCentralVw] WHERE LoginUserName = @sLoginUserName)
			AND @nOffSet >= LEN(@PsNombreUsuario)
		BEGIN
			RAISERROR('Unable to create an unique the user login name, contact the system administrator',16,1)
			RETURN
		END
	
	END




IF @PnAccionSP <> 1 
BEGIN
	--REVISAR QUE NO EXISTA UN USUARIO CON EL MISMO NUMERO DE EMPLEADO
	IF EXISTS ( SELECT 1 FROM [AswSch].[TiTraUsuarioCentralVw] WHERE ApellidoMaterno = @sNumeroEmpleado AND IdUsuario <> @PnIdUsuario)
	BEGIN

		SELECT @msgMensajeErr =  CASE WHEN BajaLogica = 1 
										THEN 'Employee Number: '+ @sNumeroEmpleado + ' already registered as '+ NombreUsuario+ ' ' + ApellidoPaterno + ' Check Inactive employees'
									  WHEN ISNULL(BajaLogica,0) = 0
										THEN 'Employee Number: '+ @sNumeroEmpleado + ' already registered as '+ NombreUsuario+ ' ' + ApellidoPaterno
								 END
		FROM [AswSch].[TiTraUsuarioCentralVw] WHERE ApellidoMaterno = @sNumeroEmpleado

		RAISERROR(@msgMensajeErr,16,1);

		RETURN
	END

	DECLARE @nPerfilAnt INT
	
	SELECT @nPerfilAnt = IdPerfilReferenciado
	FROM [AswSch].[TiTraReferenciaCentralVw] 
	WHERE IdUsuario = @PnIdUsuario  
		AND IdPerfilReferenciado BETWEEN 3500000 AND 3500001

	UPDATE [AswSch].[TiTraUsuarioCentralVw]
	SET		
			NombreUsuario = @PsNombreUsuario ,
			ApellidoPaterno = @PsApPaterno ,
			ApellidoMaterno = @sNumeroEmpleado,
			FechaNacimiento = @PdFechaNacimiento,
			Email = @PsEmail,
			LoginUserName = @sLoginUserName,
			TelefonoCelular =  @PsTelefonoCelular,
			ClaUbicacionDefault = @nClaUbicacionDefault,
			Perfil = 0 ,
			FechaUltimaMod = GETDATE() ,
			ClaUsuarioMod = @PnClaUsuarioMod ,
			NombrePcMod = @PsNombrePcMod,
			RFC = @PsRFC,
			BajaLogica = @PnBajaLogica,
			FechaBajaLogica = CASE WHEN @PnBajaLogica = 1 THEN GETDATE() ELSE NULL END
	WHERE IdUsuario = @PnIdUsuario 
	

	--Revisar si cambio de puesto
	IF EXISTS (SELECT 1 FROM [AswSch].[TiTraReferenciaCentralVw] WHERE IdUsuario = @PnIdUsuario  AND IdPerfilReferenciado = @nPerfilAnt )
	BEGIN 
		UPDATE [AswSch].[TiTraReferenciaCentralVw]
		SET IdPerfilReferenciado = @PnClaPerfil,
			BajaLogica = @PnBajaLogica
		WHERE IdUsuario = @PnIdUsuario 
		AND IdPerfilReferenciado = @nPerfilAnt
	END

	--CAMBIAR CONTRASEÑA

	SELECT @sEncriptedPass = TiSeguridad.dbo.[FnEncriptaPassword](@sPasswd)

	UPDATE [AswSch].[TiTraUsuarioContrasenaCentralVW]
	SET Contrasena = @sEncriptedPass
	WHERE IdUsuario = @PnIdUsuario

	----BAJA LOGICA PERFIL
	--IF @PnBajaLogica = 1
	--BEGIN
	--	UPDATE [AswSch].[TiTraReferenciaCentralVw]
	--	SET BajaLogica = 1
	--	WHERE IdUsuario = @PnIdUsuario 
	--	AND IdPerfilReferenciado = @nPerfilAnt
	--END


END

IF @PnAccionSP = 1 
BEGIN
	
	IF EXISTS ( SELECT 1 FROM [AswSch].[TiTraUsuarioCentralVw] WHERE ApellidoMaterno = @sNumeroEmpleado)
	BEGIN

		SELECT @msgMensajeErr =  CASE WHEN BajaLogica = 1 
										THEN 'Employee Number: '+ @sNumeroEmpleado + ' already registered as '+ NombreUsuario+ ' ' + ApellidoPaterno + ' Check Inactive employees'
									  WHEN ISNULL(BajaLogica,0) = 0
										THEN 'Employee Number: '+ @sNumeroEmpleado + ' already registered as '+ NombreUsuario+ ' ' + ApellidoPaterno
								 END
		FROM [AswSch].[TiTraUsuarioCentralVw] WHERE ApellidoMaterno = @sNumeroEmpleado

		RAISERROR(@msgMensajeErr,16,1);

		RETURN
	END

	SELECT @nIdUsuario = MAX(IdUsuario) + 1
	FROM AswSch.TiTraUsuarioCentralVw 

	INSERT INTO [AswSch].[TiTraUsuarioCentralVw]
			   ([IdUsuario]
			   ,[NombreUsuario]
			   ,[ApellidoPaterno]
			   ,[ApellidoMaterno]
			   ,[FechaNacimiento]
			   ,[Email]
			   ,[LoginUserName]
			   ,[TelefonoCelular]
			   ,[ClaUbicacionDefault]
			   ,[Perfil]
			   ,[FechaIns]
			   ,[ClaUsuarioIns]
			   ,[FechaUltimaMod]
			   ,[ClaUsuarioMod]
			   ,[NombrePcMod]
			   ,[Rfc]
			   ,[ClaIdiomaDefault])
	SELECT  @nIdUsuario AS IdUsuario,
			@PsNombreUsuario AS NombreUsuario,
			@PsApPaterno AS ApPaterno,
			@sNumeroEmpleado, 
			@PdFechaNacimiento AS FechaNacimiento,
			@PsEmail AS EMAIL,
			@sLoginUserName AS LoginUsername,
			@PsTelefonoCelular AS TelefonoCelular,
			@nClaUbicacionDefault AS ClaUbicacionDefault,
			0 AS Perfil, 
			GETDATE() AS FechaIns,
			@PnClaUsuarioMod AS ClaUsuarioIns, 
			GETDATE() AS FechaUltimaMod,
			@PnClaUsuarioMod AS ClUsuarioMod,
			@PsNombrePcMod AS NombrePcMod,
			@PsRFC AS RFC,
			0 AS ClaIdiomaDefault

	--AGREGAR REFERENCIA PERFIL
			
	INSERT INTO [AswSch].[TiTraReferenciaCentralVw] (IdUsuario,IdPerfilReferenciado,ClaUbicacion,Orden,FechaUltimaMod,ClaUsuarioMod,NombrePcMod,BajaLogica)
	SELECT @nIdUsuario,@PnClaPerfil,@nClaUbicacionDefault,1,GETDATE(),@PnClaUsuarioMod,@PsNombrePcMod,0

	--ENCRIPTAR PASSWORD
	SELECT @sEncriptedPass = TiSeguridad.dbo.[FnEncriptaPassword](@sPasswd)
	
	INSERT INTO [AswSch].[TiTraUsuarioContrasenaCentralVW]
	(IdUsuario,Contrasena,BajaLogica,FechaUltimaMod,ClaUsuarioMod,NombrePcMod)
	SELECT @nIdUsuario as IdUsuario
	,@sEncriptedPass
	,0 as BajaLogica
	,GETDATE() AS FechaUltimaMod 
	,@PnClaUsuarioMod
	,@PsNombrePcMod
			
END


END






