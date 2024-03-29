USE [ASW]
GO
/****** Object:  StoredProcedure [AswSch].[ASW_CU7_Pag1_EnvioCorreo_I]    Script Date: 14/11/2022 11:28:19 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROC [AswSch].[ASW_CU7_Pag1_EnvioCorreo_I]
	 @pSubject VARCHAR(100)
	,@pMensaje VARCHAR(MAX)
	,@pSpOrigen VARCHAR(100)
	,@pClaveSp VARCHAR(100)
AS
BEGIN
	DECLARE @sError VARCHAR(500)
	,@sPara VARCHAR(100)
			SELECT @sPara = Svalor1
				FROM AswSch.ASWCfgConfiguracion
				WHERE ClaConfiguracion = 15
	    BEGIN TRY
			EXEC msdb.dbo.sp_send_dbmail
				@profile_name = 'Avisor'
				,@recipients = @sPara
				,@subject = @pSubject
				,@body = @pMensaje
				,@body_format = 'html'
				,@importance = 'HIGH'

		INSERT INTO AswSch.AswTraEnvioCorreo (SpOrigen,ClaveSp, EnvioCorreo, Mensaje)
		VALUES (@pSpOrigen,@pClaveSp,1,@pMensaje)

		END TRY	
		BEGIN CATCH
			SELECT @sError = ERROR_MESSAGE()
			
			EXEC msdb.dbo.sp_send_dbmail
				@profile_name = 'Avisor'
				,@recipients = @sPara
				,@subject = @pSubject
				,@body = @sError
				,@body_format = 'html'
				,@importance = 'HIGH'

			INSERT INTO AswSch.AswTraEnvioCorreo (SpOrigen,ClaveSp, EnvioCorreo, Mensaje,ErrorMsg)
			VALUES (@pSpOrigen,@pClaveSp,0,@pMensaje,@sError)
		END CATCH
END