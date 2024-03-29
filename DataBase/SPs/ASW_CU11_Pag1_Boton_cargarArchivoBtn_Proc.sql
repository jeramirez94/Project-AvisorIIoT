USE [ASW]
GO
/****** Object:  StoredProcedure [AswSch].[ASW_CU11_Pag1_Boton_cargarArchivoBtn_Proc]    Script Date: 14/11/2022 11:49:48 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROC [AswSch].[ASW_CU11_Pag1_Boton_cargarArchivoBtn_Proc]
@PnClaUbicacion INT,
@PnClaUsuarioMod INT,
@PsNombrePcMod VARCHAR(64),
@pbArchivoArchWFileData        VARBINARY(MAX),
@psArchivoArchWFileName  VARCHAR(50),
@psArchivoArchWFileExt   VARCHAR(20),
@psArchivoArchWFilePath  VARCHAR(255)
AS
BEGIN

	DELETE FROM [AswSch].[AswTempOperadores]
	WHERE NombrePcMod = @PsNombrePcMod

	DECLARE @sRuta VARCHAR(250),
			@sPath VARCHAR(500),
			@nIdObject    INT,
			@File_Exists  INT,
			@SQL   NVARCHAR(MAX),
			@shoja VARCHAR(50) = 'grdCargaCatalogoOperadores',
			@nClaUbicacionDefault INT

	DECLARE @ERRMSG VARCHAR(500)

	SELECT @nClaUbicacionDefault = valor1
	FROM [AswSch].[ASWCfgConfiguracion]
	WHERE ClaConfiguracion = 1
		
	DECLARE  @tmpOperadores TABLE (
		 [Firts Name] VARCHAR(50)
		,[Last Name] VARCHAR(50)
		--,[DOB] DATE
		--,[Email] VARCHAR(50)
		,[Position] VARCHAR(15)
		--,[LoginUserName] VARCHAR(15)
		--,[Cell Phone] VARCHAR(20)
		,[SSN] VARCHAR(13)
		,[FechaIns] DATE
		,FechaUltimaMod DATE
		,ClaUsuarioMod INT
		,NombrePcMod VARCHAR(64)
	)

	SELECT  @sRuta = SVALOR1
	FROM [AswSch].[ASWCfgConfiguracion]
	WHERE ClaConfiguracion = 12

	SET TRANSACTION ISOLATION LEVEL READ COMMITTED  

	

	IF @psArchivoArchWFileExt NOT IN('XLS', 'XLSX')  
	BEGIN  
		RAISERROR('The file must be a XLS or XLSX',16,1)  
		RETURN  
	END  

	SET @sPath = @sRuta + @psArchivoArchWFileName + '-' + @psNombrePcMod + '.' + @psArchivoArchWFileExt  
	EXEC sp_OACreate 'ADODB.Stream', @nIdObject OUTPUT  
	EXEC sp_OASetProperty @nIdObject, 'Type', 1  
	EXEC sp_OAMethod @nIdObject, 'Open'  
	EXEC sp_OAMethod @nIdObject, 'Write', NULL, @pbArchivoArchWFileData  
	EXEC sp_OAMethod @nIdObject, 'SaveToFile', NULL, @sPath, 2  
	EXEC sp_OAMethod @nIdObject, 'Close'  
	EXEC sp_OADestroy @nIdObject
	
	
	--EXECUTE AS LOGIN = 'sa'; 
	EXEC Master.dbo.xp_fileexist @sPath, @File_Exists OUT  

	IF @File_Exists = 1   
	BEGIN 

		SET @SQL = 'SELECT [Firts Name],[Last Name],[Position],[Employee Number],'
		+'GETDATE() AS FechaIns, GETDATE() AS FechaUltimaMod,'+CAST(@PnClaUsuarioMod AS VARCHAR)+' AS ClaUsuarioMod,'''+@PsNombrePcMod+''' AS NombrePcMod'
		+' FROM OPENROWSET (''Microsoft.ACE.OLEDB.12.0'',''Excel 12.0;OLE DB Services=-4;Database=' + @sPath + ';HDR=YES;IMEX=1'',''SELECT * FROM ['+@shoja+'$]'')';  

		BEGIN TRY 
			INSERT INTO @tmpOperadores
			EXEC sp_executesql @SQL  
		END TRY
		BEGIN CATCH
			
			IF ERROR_NUMBER() = 207
			BEGIN
				RAISERROR('Template format is wrong, use a valid template',16,1)
			END
			ELSE
			BEGIN
				
				SET @ERRMSG = 'Something went wrong, contact the systema administrator - Details: '
				SELECT @ERRMSG = @ERRMSG + ERROR_MESSAGE();
				print @SQL
				RAISERROR( @ERRMSG,16,1)
			END
		
		END CATCH

		INSERT INTO [AswSch].[AswTempOperadores]
				   ([NombreUsuario]
				   ,[ApellidoPaterno]
				   --,[FechaNacimiento]
				   --,[Email]
				  -- ,[LoginUserName]
				   --,[TelefonoCelular]
				   ,[ClaUbicacionDefault]
				   ,[Perfil]
				   ,[FechaIns]
				   ,[ClaUsuarioIns]
				   ,[FechaUltimaMod]
				   ,[ClaUsuarioMod]
				   ,[NombrePcMod]
				   ,[Rfc]
				   ,[IdPerfilReferenciado])
		SELECT   TMP.[Firts Name]
				,TMP.[Last Name]
				--,TMP.DOB
				--,TMP.Email
				--,SUBSTRING(tmp.[Firts Name],1,1)+TMP.[Last Name]
				--,TMP.[Cell Phone]
				,@nClaUbicacionDefault AS ClaUbicacionDefault
				,0 AS Perfil
				,GETDATE() AS FechaIns
				,@PnClaUsuarioMod AS ClaUsuarioIns
				,GETDATE() AS FechaUltimaMod
				,@PnClaUsuarioMod AS ClaUsuarioMod
				,@PsNombrePcMod
				,TMP.SSN 
				,Usr.IdUsuario AS IdPerfilReferenciado
		FROM @tmpOperadores tmp
		JOIN [AswSch].[TiTraUsuarioVw] Usr
		ON Usr.NombrePerfil like '%'+tmp.Position+'%'
		AND usr.Perfil = 1
		AND ISNULL(usr.BajaLogica,0) = 0
		ANd Usr.IdUsuario BETWEEN 3500000 AND 3500100

	
	END
	ELSE
	BEGIN
		RAISERROR('Error tying to read file',16,0) 
	END

END





















