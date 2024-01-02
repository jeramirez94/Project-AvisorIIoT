--USE [ASW]
--GO
/****** Object:  StoredProcedure [AswSch].[ASW_CU6_Pag1_ErrorSQLiteUpdate_Proc]    Script Date: 14/11/2022 11:21:09 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/*
* MRODRIGUEZC
* 2022/08/18
* Confirma la  ultima version actualizada de la bd Sqlite en la tablet
*/
/*
EXECUTE AswSch.ASW_CU6_Pag1_ErrorSQLiteUpdate_Proc '0.0', 1
*/
ALTER  PROCEDURE [AswSch].[ASW_CU6_Pag1_ErrorSQLiteUpdate_Proc]
	@psIdCelda VARCHAR(30),
	@psError VARCHAR(500),
	@psSource VARCHAR(100),
	@psNombrePcMod VARCHAR(64),
	@pnDebug INT = 0
AS
BEGIN
SET NOCOUNT ON
	
	DECLARE 
		@sPara VARCHAR(100)
		,@sSubject VARCHAR(100)
		,@sTitulo	VARCHAR(500)
		,@sMesage VARCHAR(1000)

		,@sCelda VARCHAR(25)
		,@sClient_net_address VARCHAR(25)

	SELECT  @sClient_net_address = CAST( CONNECTIONPROPERTY('client_net_address') AS VARCHAR)


	SELECT @sPara = Svalor1
				FROM AswSch.ASWCfgConfiguracion
				where ClaConfiguracion = 15

	SELECT @sCelda = NomWorkCenter
	FROM [AswSch].[AswCatWorkCenterVw]
	WHERE IdWorkCenter = @psIdCelda

	SET @sSubject = 'Error on SQLiteUpdate. Cell '+COALESCE(@sCelda,'NotFound')+' Id: '+CAST(@psIdCelda AS VARCHAR) + ' From: ' + COALESCE( @sClient_net_address , 'missing ip address')

	SET @sTitulo = '<table width=100%><tr class="header" style="background-color:#304f60; font-family:Arial;color:#FFFFFF;font-size:18px;font-weight:bold;">'+    
										'<th style="width: 60%; ">Error on SQLiteUpdate</th>'+
									'</table>'
	SET @sMesage = 'Ocurrio el siguiente error en la actualizacion de Sqlite<br/>' + @psError +'<br/>From: '+@psSource

	SET @sMesage = @sTitulo + @sMesage
	
		EXEC msdb.dbo.sp_send_dbmail
					@profile_name = 'Avisor'
					,@recipients = @sPara
					,@subject = @sSubject
					,@body = @sMesage
					,@body_format = 'html'
					,@importance = 'HIGH'

END