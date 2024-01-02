--USE [ASW]
--GO
/****** Object:  StoredProcedure [AswSch].[ASW_CU401_Pag1_TraScrap_IU]    Script Date: 15/11/2022 03:07:58 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*
* MRODRIGUEZC
* 2020/07/01
* guarda la informacion de scrap
*/
ALTER PROCEDURE [AswSch].[ASW_CU401_Pag1_TraScrap_IU]	
		@pnIdScrap int,
		@pnIdPO int,
		@psIdCelda varchar(30),
		@pnClaTurno int,
		@ptFechaAdmScada datetime,
		@pnPeso numeric(22,4),
		@psTipoScrapCelda varchar(50),
		@psMotivoScrap varchar(500),
		@pnClaScrapReason	INT = null,
		@pnClaEstatusReplica INT,
		@pnBajaLogica int,
		@ptFechaBajaLogica datetime, 
		@pnClaUsuarioMod int, 
		@psNombrePcMod varchar(64), 
		@pnFechaUltimaMod datetime
AS
BEGIN
	DECLARE
		@nClaTipoScrapCelda INT

	SELECT @nClaTipoScrapCelda = ClaTipoScrapCelda
	FROM [AswSch].[AswCatTipoScrapCelda]
	WHERE @psTipoScrapCelda IN (NomTipoScrapCelda, NomTipoScrapCeldaIngles)

	IF EXISTS (SELECT 1 FROM [AswSch].[AswTraScrap] WHERE IdScrap = @pnIdScrap AND IdPO = @pnIdPO)
	BEGIN

		UPDATE [AswSch].[ASWTraScrap]
		SET [IdScrap] = @pnIdScrap
			,[IdPo] = @pnIdPo
			,[IdCelda] = @psIdCelda
			,[ClaTurno] = @pnClaTurno
			,[FechaAdmScada] = @ptFechaAdmScada
			,[Peso] = @pnPeso
			,[ClaTipoScrapCelda] = @nClaTipoScrapCelda
			,[MotivoScrap] = @psMotivoScrap
			,[ClaScrapReason]	= @pnClaScrapReason
			,[ClaEventoReplica] = @pnClaEstatusReplica
			,[FechaBajaLogica] = @ptFechaBajaLogica
			,[BajaLogica] = @pnBajaLogica
			,[ClaUsuarioMod] = @pnClaUsuarioMod
			,[NombrePCMod] = @psNombrePCMod
			,[FechaUltimaMod] = @pnFechaUltimaMod
		WHERE IdScrap = @pnIdScrap 
			AND IdPO = @pnIdPO


	END
	ELSE
	BEGIN	
	
		INSERT INTO [AswSch].[ASWTraScrap]
			([IdScrap]
			,[IdPo]
			,[IdCelda]
			,[ClaTurno]
			,[FechaAdmScada]
			,[Peso]
			,[ClaTipoScrapCelda]
			,[MotivoScrap]
			,[ClaScrapReason]
			,[ClaEventoReplica]
			,[FechaBajaLogica]
			,[BajaLogica]
			,[ClaUsuarioMod]
			,[NombrePCMod]
			,[FechaUltimaMod])
		VALUES
			(@pnIdScrap
			,@pnIdPO
			,@psIdCelda
			,@pnClaTurno
			,@ptFechaAdmScada
			,@pnPeso
			,@nClaTipoScrapCelda
			,@psMotivoScrap
			,@pnClaScrapReason
			,@pnClaEstatusReplica
			,@ptFechaBajaLogica
			,@pnBajaLogica
			,@pnClaUsuarioMod
			,@psNombrePcMod
			,@pnFechaUltimaMod)

	END
END
