--USE [ASW]
--GO
/****** Object:  StoredProcedure [AswSch].[ASW_CU1_Pag5_FolioBitacora_UPD]    Script Date: 14/11/2022 11:03:44 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROC [AswSch].[ASW_CU1_Pag5_FolioBitacora_UPD]
	@PsIdCelda VARCHAR(30),
	@PsClaveFolioBitacora VARCHAR(25) = NULL
AS
BEGIN
	DECLARE @SQL VARCHAR(500);

	--CREAR REGISTROS DE FOLIADORES SI NO EXISTEN
	IF NOT EXISTS ( SELECT 1 
					FROM AswSch.AswCatFolioBitacora
					WHERE IdCelda = @PsIdCelda
					AND ClaveFolioBitacora = 'FolBitParos')
	BEGIN 
		INSERT INTO AswSch.AswCatFolioBitacora (ClaveFolioBitacora,IdCelda,TablaOrigen,NombreCampo,BajaLogica,NombrePcMod,FechaUltimaMod)
		VALUES ('FolBitParos',@PsIdCelda,'AswSch.AswBitBitacoraParoCeldaVw','IdParo',0,HOST_NAME(),GETDATE())
	END
	IF NOT EXISTS ( SELECT 1 
					FROM AswSch.AswCatFolioBitacora
					WHERE IdCelda = @PsIdCelda
					AND ClaveFolioBitacora = 'FolBitAndon')
	BEGIN 
		INSERT INTO AswSch.AswCatFolioBitacora (ClaveFolioBitacora,IdCelda,TablaOrigen,NombreCampo,BajaLogica,NombrePcMod,FechaUltimaMod)
		VALUES ('FolBitAndon',@PsIdCelda,'AswSch.AswBitAndonCeldaVw','IdAndon',0,HOST_NAME(),GETDATE())
	END
	IF NOT EXISTS ( SELECT 1 
					FROM AswSch.AswCatFolioBitacora
					WHERE IdCelda = @PsIdCelda
					AND ClaveFolioBitacora = 'FolBitProd')
	BEGIN 
		INSERT INTO AswSch.AswCatFolioBitacora (ClaveFolioBitacora,IdCelda,TablaOrigen,NombreCampo,BajaLogica,NombrePcMod,FechaUltimaMod)
		VALUES ('FolBitProd',@PsIdCelda,'AswSch.AswBitBitacoraProduccion','IdBitProduccion',0,HOST_NAME(),GETDATE())
	END
	IF NOT EXISTS ( SELECT 1 
					FROM AswSch.AswCatFolioBitacora
					WHERE IdCelda = @PsIdCelda
					AND ClaveFolioBitacora = 'FolBitEficiencia')
	BEGIN 
		INSERT INTO AswSch.AswCatFolioBitacora (ClaveFolioBitacora,IdCelda,TablaOrigen,NombreCampo,BajaLogica,NombrePcMod,FechaUltimaMod)
		VALUES ('FolBitEficiencia',@PsIdCelda,'AswSch.AswBitBitacoraBajaEficiencia','IdBajaEficiencia',0,HOST_NAME(),GETDATE())
	END
	
	DECLARE @FolioBitacoraTmp TABLE (
		Id                  INT,
		ClaveFolioBitacora VARCHAR(25) NOT NULL,
		IdCelda            VARCHAR(30) NOT NULL,
		TablaOrigen        VARCHAR(50) NOT NULL,
		NombreCampo        VARCHAR(20) NOT NULL,
		Folio              INT,
		BajaLogica         TINYINT,
		FechaBajaLogica    DATETIME,
		NombrePcMod        VARCHAR(64),
		FechaUltimaMod     DATETIME

	)

	INSERT INTO @FolioBitacoraTmp (
		 Id
		,ClaveFolioBitacora
		,IdCelda           
		,TablaOrigen       
		,NombreCampo       
		,Folio             
		,BajaLogica        
		,FechaBajaLogica   
		,NombrePcMod       
		,FechaUltimaMod    
	)
	SELECT ROW_NUMBER() OVER (ORDER BY  IdCelda)
		  ,ClaveFolioBitacora
		  ,IdCelda           
		  ,TablaOrigen       
		  ,NombreCampo       
		  ,Folio             
		  ,BajaLogica        
		  ,FechaBajaLogica   
		  ,NombrePcMod       
		  ,FechaUltimaMod  
	FROM AswSch.AswCatFolioBitacora
	WHERE IdCelda = @PsIdCelda
	AND (@PsClaveFolioBitacora IS NULL OR ClaveFolioBitacora = @PsClaveFolioBitacora)

	

	DECLARE @nId INT,
			@nCampo VARCHAR(20),
			@nTablaOrigen VARCHAR(50),
			@nClaveFolioBitacora VARCHAR(25)

	SELECT @nId = MIN(Id)
	FROM @FolioBitacoraTmp

	--ACTUALIZAR FOLIADOR 
	WHILE @nId is not null
	BEGIN 
		
		SET @SQL = 'UPDATE AswSch.AswCatFolioBitacora
				SET Folio = ISNULL((SELECT ISNULL(MAX(Campo),1) FROM TablaOrigen TblO WHERE TblO.IdCelda = @IdCelda),1)
				   ,FechaUltimamod = GETDATE()
				WHERE ClaveFolioBitacora = ''@ClaveFolioBitacora''
				AND IdCelda = @IdCelda'
		
		SELECT @nCampo               = NombreCampo,
			   @nTablaOrigen         = TablaOrigen,
			   @nClaveFolioBitacora  = ClaveFolioBitacora
		FROM @FolioBitacoraTmp
		WHERE Id = @nId


		SELECT @SQL = REPLACE(@SQL,'TablaOrigen',@nTablaOrigen)
		SELECT @SQL = REPLACE(@SQL,'@IdCelda'   ,@PsIdCelda)
		SELECT @SQL = REPLACE(@SQL,'Campo'      ,@nCampo)
		SELECT @SQL = REPLACE(@SQL,'@ClaveFolioBitacora'      ,@nClaveFolioBitacora)

		PRINT @SQL

		print @nId
		
		begin try
			EXEC (@SQL)
		end try
		begin catch
		end catch

		SELECT @nId = MIN(Id)
		FROM @FolioBitacoraTmp
		WHERE Id > @nId
	END
    
END





