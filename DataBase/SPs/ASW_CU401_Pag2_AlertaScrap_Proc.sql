--USE [ASW]
--GO

/****** Object:  StoredProcedure [AswSch].[ASW_CU401_Pag2_AlertaScrap_Proc]    Script Date: 05/01/2023 12:20:19 p. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


ALTER PROCEDURE [AswSch].[ASW_CU401_Pag2_AlertaScrap_Proc]	
 @pnIdScrap INT
,@psIdCelda VARCHAR(30)
,@pnClaTurno INT
,@ptFechaAdmScada DATETIME
,@psError VARCHAR(100)
AS
BEGIN
	DECLARE
		@sSub VARCHAR(55) = 'Error Replica Scrap '+CAST(CURRENT_TIMESTAMP AS varchar)
		,@sTitulo VARCHAR(1000) = '<table width=100%><tr class="header" style="background-color:#304f60; font-family:Arial;color:#FFFFFF;font-size:18px;font-weight:bold;">'+    
										'<th style="width: 60%; ">Alerta de scrap con errores en su replica al ERP</th>'+
									'</table>'
		,@sMensaje	VARCHAR(max) = '<table border="1" bordercolor="#eeeeee" width=100% style="table-layout: fixed; word-wrap: break-word; font-size:11px; padding:3px">'+
										'<tr style="background-color:#DBDBDB; font-family:Arial; border-collapse:collapse; font-weight:550;">'+
											'<th>IdScrap</th>'+
											'<th>Celda</th>'+
											'<th>Turno</th>'+
											'<th>FechaAdmScada</th>'+
											'<th>Error</th>'+
											'<tr>'+
											'<td align="center" style="width:60px;">'+CAST(@pnIdScrap AS VARCHAR)+'</td>'+
											'<td align="center" style="width:60px;">'+CAST(@psIdCelda AS VARCHAR)+'</td>'+
											'<td align="center" style="width:60px;">'+CAST(@pnClaTurno AS VARCHAR)+'</td>'+
											'<td align="center" style="width:60px;">'+CONVERT(VARCHAR, CONVERT(DATETIME,@ptFechaAdmScada),113)+'</td>'+
											'<td align="center" style="width:60px;">'+@psError+'</td></tr>'
										
		,@pSpOrigen VARCHAR(100)
		,@pClaveSp VARCHAR(100)

		SET @pSpOrigen = 'ASW_CU401_Pag2_AlertaScrap_Proc'

		SET @pClaveSp = 'ERROR_REPLICA_SCRAP'

		SET @sMensaje = @sTitulo+@sMensaje

		EXEC [AswSch].[ASW_CU7_Pag1_EnvioCorreo_I]@sSub,@sMensaje,@pSpOrigen,@pClaveSp

END
GO


