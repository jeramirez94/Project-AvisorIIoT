USE [ASW]
GO
/****** Object:  StoredProcedure [AswSch].[ASW_CU11_Pag1_Grid_grdCargaCatalogoOperadores_IU]    Script Date: 14/11/2022 12:23:15 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROC [AswSch].[ASW_CU11_Pag1_Grid_grdCargaCatalogoOperadores_IU]
	@PnIdUsuarioCarga INT = NULL,
	@PsNombreUsuarioCarga VARCHAR(50),
	@PsApPaternoCarga VARCHAR(50),
	@PdFechaNacimientoCarga DATE,
	@PsEmailCarga VARCHAR(50),
	@PnClaPerfilCarga INT,
	@PsLoginUsernameCarga VARCHAR(15),
	@PsTelefonoCelularCarga VARCHAR(20),
	@PsRFCCarga VARCHAR(13),
	@PnClaUbicacionDefaultCarga INT,
	@PnClaUsuarioMod INT,
	@PsNombrePcMod VARCHAR(64),
	@PnConfirmarChk INT,
	@pnAccionSp   INT = 0
AS
BEGIN

	IF @PnConfirmarChk = 1 AND @pnAccionSp <> 3
	BEGIN
		
		EXECUTE [AswSch].[ASW_CU11_Pag1_Grid_grdcatalogoOperadores_IU] 
			   @PnIdUsuario = NULL
			  ,@PsNombreUsuario = @PsNombreUsuarioCarga
			  ,@PsApPaterno = @PsApPaternoCarga
			  ,@PdFechaNacimiento = @PdFechaNacimientoCarga
			  ,@PsEmail = @PsEmailCarga
			  ,@PnClaPerfil = @PnClaPerfilCarga
			  ,@PsLoginUsername = @PsLoginUsernameCarga
			  ,@PsTelefonoCelular = @PsTelefonoCelularCarga
			  ,@PnBajaLogica = 0
			  ,@PnClaUsuarioMod = @PnClaUsuarioMod
			  ,@PsNombrePcMod = @PsNombrePcMod
			  ,@PsRFC = @PsRFCCarga
			  ,@pnAccionSp = 1
		
	END

END




