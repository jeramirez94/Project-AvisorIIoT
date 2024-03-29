USE [ASW]
GO
/****** Object:  StoredProcedure [AswSch].[ASW_CU102_Pag1_OrdenProduccionActual]    Script Date: 31/08/2022 10:10:21 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*SP Consulta orden activa (ClaEstatus=2)*/
ALTER PROC [AswSch].[ASW_CU102_Pag1_OrdenProduccionActual]
	@PnClaUbicacion INT
	,@PnIdCelda INT
AS
BEGIN
	DECLARE @orders INT
	,@sError VARCHAR(50)
	,@fechaHora DATETIME
	,@sSub		VARCHAR(55) = 'Error Falta de Orden Activa '+CAST(CURRENT_TIMESTAMP AS varchar)
		,@sTitulo	VARCHAR(1000) = '<table width=100%><tr class="header" style="background-color:#304f60; font-family:Arial;color:#FFFFFF;font-size:18px;font-weight:bold;">'+    
										'<th style="width: 60%; ">Alerta de falta de orden de producción activa</th>'+
									'</table>'
		,@sMensaje	VARCHAR(max) = '<table border="1" bordercolor="#eeeeee" width=100% style="table-layout: fixed; word-wrap: break-word; font-size:11px; padding:3px">'+
										'<tr style="background-color:#DBDBDB; font-family:Arial; border-collapse:collapse; font-weight:550;">'+
											'<th>IdCelda</th>'+
											'<th>FechaHora</th>'+
											'<th>Error</th></tr>'

	  SET @fechaHora = (SELECT GETDATE())
	  
      SET @orders = (SELECT COUNT(*) 
	  FROM [AswSch].[ASWTraOrdenProduccion]
	  WHERE ClaEstatus = 2
	  AND ClaUbicacion = @PnClaUbicacion
	  AND IdCelda = @PnIdCelda)
	 
	  IF @orders < 1
		BEGIN
		BEGIN TRY
			DECLARE @sPara VARCHAR(100);
			SELECT @sPara = Svalor1
				FROM AswSch.ASWCfgConfiguracion
				where ClaConfiguracion = 15

			SET @sMensaje = @sMensaje +
				'<tr>'+
					'<td align="center" style="width:60px;">'+CAST(@PnIdCelda AS VARCHAR)+'</td>'+
					'<td align="center" style="width:60px;">'+CONVERT(VARCHAR, CONVERT(DATETIME,@fechaHora),113)+'</td>'+
					'<td align="center" style="width:60px;">No hay orden de producción activa</td></tr>'

			SELECT @sMensaje = @sTitulo + @sMensaje

			EXEC msdb.dbo.sp_send_dbmail
				@profile_name = 'Avisor'
				,@recipients = @sPara
				,@subject = @sSub
				,@body = @sMensaje
				,@body_format = 'html'
				,@importance = 'HIGH'
		END TRY
		BEGIN CATCH
			SELECT @sError = ERROR_MESSAGE()
			
			EXEC msdb.dbo.sp_send_dbmail
				@profile_name = 'Avisor'
				,@recipients = @sPara
				,@subject = @sSub
				,@body = @sError
				,@body_format = 'html'
				,@importance = 'HIGH'
		END CATCH

	END

END
