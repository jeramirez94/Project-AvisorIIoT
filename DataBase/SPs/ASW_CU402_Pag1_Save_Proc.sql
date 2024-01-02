USE ASW
GO

DROP PROC AswSch.ASW_CU402_Pag1_Boton_btnSave_Proc
GO

CREATE PROC AswSch.ASW_CU402_Pag1_Boton_btnSave_Proc
	@PnClaArticuloSubir INT,
	@PsTxtDescripcionSubir VARCHAR(140),
	@PnClaUsuarioMod INT,
	@PsNombrePcMod VARCHAR(64),
	@PnChkItemName INT,
	@PbArchivo VARBINARY(MAX),
	@psArchivoWFileName VARCHAR(50),
	@psArchivoWFileExt VARCHAR(50),
	@psArchivoWFilePath VARCHAR(300)
AS 
BEGIN
	
	DECLARE @nIdBluePrint INT;

	DECLARE @tmpArticulo TABLE (ClaArticulo INT ,Descripcion VARCHAR(250))

	SELECT @nIdBluePrint = ISNULL(MAX(IdBluePrint),0) + 1
	FROM ASWSch.AswTraProductBluePrint


	IF @PnClaArticuloSubir IS NULL 
	BEGIN
		RAISERROR('Please select an Item',16,1);
		RETURN
	END
	IF @PnChkItemName <> 1 AND ISNULL(@PsTxtDescripcionSubir,'') = ''
	BEGIN
		RAISERROR('Enter a description or check "Use Item Name"',16,1);
		RETURN
	END
	IF @PbArchivo IS NULL
	BEGIN
		RAISERROR('Please select a file',16,1);
		RETURN
	END
	IF @psArchivoWFileExt <> 'pdf'
	BEGIN
		RAISERROR('The file must be a PDF',16,1);
		RETURN
	END

	--OBTENER NOMBRE DEL ARTICULO
	IF @PnChkItemName = 1
	BEGIN
		INSERT INTO @tmpArticulo
		EXEC [AswSch].[ASWArticuloCmb]  
			@psValor	= @PnClaArticuloSubir,
			@pnTipo		= 1,				
			@pnModoSel  = 0,			
			@pnBajasSn	 = 0 


		SELECT TOP 1 @PsTxtDescripcionSubir = Descripcion FROM @tmpArticulo
	END


	BEGIN TRY

		BEGIN TRAN
			INSERT INTO ASWSch.AswTraProductBluePrint(
			 idBluePrint
			,ClaArticulo
			,Descripcion
			,NombreArchivo
			,FechaIns
			,ClaUsuarioMod
			,NombrePcMod
			,FechaUltimaMod
			)
			SELECT   @nIdBluePrint
					,@PnClaArticuloSubir
					,@PsTxtDescripcionSubir
					,@psArchivoWFileName
					,GETDATE()
					,@PnClaUsuarioMod
					,@PsNombrePcMod
					,GETDATE()

			INSERT INTO ASWSch.AswTraProductBluePrintArchivo(IdBluePrint,Extension,Archivo)
			SELECT @nIdBluePrint,@psArchivoWFileExt,@PbArchivo

		COMMIT 
	END TRY
	BEGIN CATCH
		ROLLBACK
		RAISERROR('The file was not uploaded, contact the system administrator',16,1);
	END CATCH
END