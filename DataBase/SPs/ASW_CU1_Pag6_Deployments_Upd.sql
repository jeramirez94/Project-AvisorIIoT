--USE [ASW]
--GO
/****** Object:  StoredProcedure [AswSch].[ASW_CU1_Pag6_Deployments_Upd]    Script Date: 14/11/2022 11:14:28 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROC [AswSch].[ASW_CU1_Pag6_Deployments_Upd]
	@PsIdCelda VARCHAR(30),
	@PnIdRecurso INT,
	@PnClaEstatus INT,
	@PnVersionInstalada varchar(10),
	@PsNombrePcMod varchar(64) 
AS
BEGIN
	
	DECLARE 
		@sClient_net_address VARCHAR(25),
		@TipoRecurso varchar(10)


	SELECT  @sClient_net_address = CAST( CONNECTIONPROPERTY('client_net_address') AS VARCHAR)
	
	SET @psNombrePcMod = @psNombrePcMod + @sClient_net_address

	SELECT @TipoRecurso = TipoRecurso
	FROM AswSch.AswCatRecursoAvisor
	WHERE IdRecurso = @PnIdRecurso

	

	UPDATE AswSch.AswRelDeployRecursoCelda
	SET ClaEstatus = @PnClaEstatus
	,VersionInstalada = @PnVersionInstalada
	,FechaUltimaMod = GETDATE()
	WHERE IdCelda = @PsIdCelda
	AND IdRecurso = @PnIdRecurso

	IF EXISTS (SELECT 1 FROM [AswSch].[AswTraControlVersionAvisor] WHERE IdCelda = @psIdCelda)
	BEGIN
		UPDATE [AswSch].[AswTraControlVersionAvisor] 
		SET  VersionNodeRed = CASE WHEN @TipoRecurso = 'nodered' THEN @PnVersionInstalada ELSE VersionNodeRed END
		    ,VersionApp     = CASE WHEN @TipoRecurso = 'zip'     THEN @PnVersionInstalada ELSE VersionApp     END
			,[NombrePcMod] = @psNombrePcMod
			,[FechaUltimaMod] = GETDATE()
		WHERE IdCelda = @psIdCelda
	END
	ELSE
	BEGIN 
		INSERT INTO [AswSch].[AswTraControlVersionAvisor] ([IdCelda],VersionNodeRed,VersionApp, [NombrePcMod], [FechaUltimaMod])
		VALUES (@PsIdCelda
			    , CASE WHEN @TipoRecurso = 'nodered' THEN @PnVersionInstalada ELSE null END
				, CASE WHEN @TipoRecurso = 'zip'     THEN @PnVersionInstalada ELSE null END
				, @psNombrePcMod
				, GETDATE()
				)
	END

	INSERT INTO [AswSch].[AswBitControlVersionAvisor]([IdCelda], [Origen], [Version], [NombrePcMod], [FechaUltimaMod])
	VALUES (@PsIdCelda
			, CASE @TipoRecurso WHEN 'nodered' THEN 'NodeRed' WHEN 'zip' THEN 'App' END
			, @PnVersionInstalada
			, @psNombrePcMod
			, GETDATE()
			)


END