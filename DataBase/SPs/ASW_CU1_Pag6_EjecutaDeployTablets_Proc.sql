CREATE PROC [AswSch].[ASW_CU1_Pag6_EjecutaDeployTablets_Proc]
	@PsClaveCelda VARCHAR(30),
	@PsVersion varchar(10)
AS
BEGIN

	IF @PsClaveCelda IS NULL
	BEGIN
		RAISERROR('Especifica la clave de la celda o usa -1 para todas', 16,1)
		RETURN 
	END

	DECLARE @CeldasDeploy TABLE (
		Id INT,
		IdCelda INT,
		ClaveCelda INT,
		DirIP  VARCHAR(20)
	)

	INSERT INTO @CeldasDeploy(Id,IdCelda,ClaveCelda,DirIP)
	SELECT ROW_NUMBER() over (order by T.idcelda) 
	      ,T.IdCelda
		  ,C.ClaveWorkCenter AS ClaveCelda
		  ,DireccionIp 
	FROM AswSch.AswCatTablets T
	JOIN AswSch.AswCatWorkCenterVw C
		ON T.IdCelda = C.IdWorkCenter
	JOIN AswSch.AswRelDeployRecursoCelda DRC
		ON T.IdCelda = DRC.IdCelda
	WHERE (@PsClaveCelda = -1 OR C.ClaveWorkCenter = @PsClaveCelda)
	AND DRC.ClaEstatus = 1
	GROUP BY T.IdCelda
		,C.ClaveWorkCenter
		,DireccionIp
	
	DECLARE @nId INT,
			@nIdCelda INT,
			@nClaveCelda INT,
			@sDirIP  VARCHAR(20),
			@sUrl VARCHAR(150)

	SELECT @nId = MIN(id)
	from @CeldasDeploy
	
	WHILE @nId IS NOT NULL
	BEGIN
		
		SET @nIdCelda    = NULL
		SET	@nClaveCelda = NULL
		SET	@sDirIP      = NULL

		SELECT  @nIdCelda    = IdCelda
			   ,@nClaveCelda = ClaveCelda
		       ,@sDirIP      = DirIP 
		FROM @CeldasDeploy
		WHERE Id = @nId


		BEGIN TRY
			SET @sUrl = 'http://'+RTRIM(LTRIM(@sDirIP))+':18800/CU1_Pag6_Deployments_Proc?versionUpd='+RTRIM(LTRIM(@PsVersion))
			PRINT 'ejecutando deploy en '  + CAST(@nClaveCelda AS VARCHAR) +' IP: '+@sDirIP + ' Url: '+@sUrl
			EXEC HTTP_Request @sUrl
		END TRY
		BEGIN CATCH
			PRINT 'ERROR ' + CAST(@nClaveCelda AS VARCHAR) +' IP: '+@sDirIP
		END CATCH

		SELECT @nId = MIN(id)
		FROM @CeldasDeploy
		WHERE Id > @nId

	END

	


END
GO

