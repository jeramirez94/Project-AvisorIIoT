--USE [ASW]
--GO
/****** Object:  StoredProcedure [AswSch].[ASW_CU8_Pag1_AlertaEspacioRB_Proc]    Script Date: 14/11/2022 11:29:31 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROC [AswSch].[ASW_CU8_Pag1_AlertaEspacioRB_Proc]
	@PnClaUbicacion INT
	,@PsIdCelda VARCHAR(30)
	,@PnEspacioOcupado INT 
AS
BEGIN
	DECLARE @PnSpOrigen VARCHAR(MAX)
	,@PnClaveSp VARCHAR(MAX)
	,@nClaveCelda INT
	,@fechaHora DATETIME
	,@PnSub		VARCHAR(55) = 'Alerta  de Espacio en Raspberry '+CAST(CURRENT_TIMESTAMP AS varchar)
		,@PnTitulo	VARCHAR(1000) = '<table width=100%><tr class="header" style="background-color:#304f60; font-family:Arial;color:#FFFFFF;font-size:18px;font-weight:bold;">'+    
										'<th style="width: 60%; ">Alerta de espacio en disco en Raspberry</th>'+
									'</table>'
		,@PnMensaje	VARCHAR(max) = '<table border="1" bordercolor="#eeeeee" width=100% style="table-layout: fixed; word-wrap: break-word; font-size:11px; padding:3px">'+
										'<tr style="background-color:#DBDBDB; font-family:Arial; border-collapse:collapse; font-weight:550;">'+
											'<th>Celda</th>'+
											'<th>IdCelda</th>'+
											'<th>Mensaje</th></tr>'
	  SET @nClaveCelda = (SELECT ClaveWorkCenter FROM [ASW].[AswSch].[AswCatWorkCenterVw] WHERE IdWorkCenter = @PsIdCelda)

	  
	  SET @PnSpOrigen = 'ASW_CU8_Pag1_AlertaEspacioRB_Proc'
	  
	  SET @PnClaveSp = 'ALERTA_ESPACIO_RB'
	  
	DECLARE @sPara VARCHAR(100);
	SELECT @sPara = Svalor1
		FROM AswSch.ASWCfgConfiguracion
		where ClaConfiguracion = 15

	SET @PnMensaje = @PnMensaje +
		'<tr>'+
			'<td align="center" style="width:60px;">'+CAST(@nClaveCelda AS VARCHAR)+'</td>'+
			'<td align="center" style="width:60px;">'+CAST(@PsIdCelda AS VARCHAR)+'</td>'+
			'<td align="center" style="width:60px;">Espacio de '+CAST(@PnEspacioOcupado AS VARCHAR)+'% en raspberry</td></tr>'
			
	IF @PnMensaje IS NOT NULL
		BEGIN
		SET @PnMensaje = @PnTitulo + @PnMensaje
		EXEC [AswSch].[ASW_CU7_Pag1_EnvioCorreo_I]@PnSub,@PnMensaje,@PnSpOrigen,@PnClaveSp
			
		

	END

END