USE [ASWH]
GO
/****** Object:  StoredProcedure [AswSch].[ASW_CU170_Pag1_EnvioMensajeEncendido]    Script Date: 10/03/2023 03:33:52 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*==========================================
* CU: 170.1
* Objetivo: Sp encargado de ejecutar servicio de envío de alertas vía whatsapp
* Autor: José Carlos Arias Rodríguez
* Fecha: 2022-03-10
* EXEC: [AswSch].[ASW_CU170_Pag1_EnvioMensajeEncendido]
*========================================== */
ALTER PROC [AswSch].[ASW_CU170_Pag1_EnvioMensajeEncendido]
@PnClaTurno INT
,@PnClaUbicacion INT
,@PsMensaje VARCHAR(1024)
,@PsNumeroTelefonico VARCHAR(30)
,@PnSMS TINYINT 
,@PsNombrePcMod VARCHAR(120)
,@PnClaUsuarioMod INT


AS
BEGIN
DECLARE 
@nError INT,
@MsgError VARCHAR(200)

IF LEN(LTRIM(RTRIM(@PsMensaje))) > 0 
EXEC  [MWA_LNKSVR].[MCSW_FILES].[dbo].MSWSrvMSWTraWhatsappNoEnviadosSrv
        @pnIdConfigSistema = 2, 
        @psMensaje = @PsMensaje, 
        @psCelularDestino = @PsNumeroTelefonico,
	    @pnEsSMS = @PnSMS,
        @psnombrepcmod = @PsNombrePcMod, 
        @pnClaUsuarioMod = @PnClaUsuarioMod,
        @pnError = @nError OUTPUT,
		@msgError = @MsgError OUTPUT 
		
SELECT @nError,@MsgError


END


