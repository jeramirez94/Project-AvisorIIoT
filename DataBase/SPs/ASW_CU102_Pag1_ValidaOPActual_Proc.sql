--USE [ASW]
--GO
/****** Object:  StoredProcedure [AswSch].[ASW_CU102_Pag1_ValidaOPActual_Proc]    Script Date: 14/11/2022 11:45:08 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROC [AswSch].[ASW_CU102_Pag1_ValidaOPActual_Proc]
	@PnClaUbicacion INT
	,@PsIdCelda VARCHAR(30)
	,@PnSinOrden INT
AS
BEGIN
	DECLARE @orders INT
	,@sError VARCHAR(50)
	,@PnSpOrigen VARCHAR(MAX)
	,@PnClaveSp VARCHAR(MAX)
	,@nClaveCelda INT
	,@Msg VARCHAR(50)
	,@fechaHora DATETIME
	,@PnSub		VARCHAR(55) = 'Error Falta de Orden Activa '+CAST(CURRENT_TIMESTAMP AS varchar)
		,@PnTitulo	VARCHAR(1000) = '<table width=100%><tr class="header" style="background-color:#304f60; font-family:Arial;color:#FFFFFF;font-size:18px;font-weight:bold;">'+    
										'<th style="width: 60%; ">Alerta de falta de orden de producción activa</th>'+
									'</table>'
		,@PnMensaje	VARCHAR(max) = '<table border="1" bordercolor="#eeeeee" width=100% style="table-layout: fixed; word-wrap: break-word; font-size:11px; padding:3px">'+
										'<tr style="background-color:#DBDBDB; font-family:Arial; border-collapse:collapse; font-weight:550;">'+
											'<th>Celda</th>'+
											'<th>IdCelda</th>'+
											'<th>FechaHora</th>'+
											'<th>Error</th></tr>'
	  SET @nClaveCelda = (SELECT ClaveWorkCenter FROM [AswSch].[AswCatWorkCenterVw] WHERE IdWorkCenter = @PsIdCelda)

	  SET @fechaHora = (SELECT GETDATE())
	  
	  SET @PnSpOrigen = 'ASW_CU102_Pag1_ValidaOPActual_Proc'
	  
	  SET @PnClaveSp = 'ERROR_VALIDACION_OP'
	  
      SET @orders = (SELECT COUNT(IdPO) 
	  FROM [AswSch].[ASWTraOrdenProduccion]
	  WHERE ClaEstatus = 2
	  AND ClaUbicacion = @PnClaUbicacion
	  AND IdCelda = @PsIdCelda)
	  
	  IF @orders < 1 AND @PnSinOrden = 0 
	  SET @Msg = 'No hay orden activa en SQL Server'
	  
	  IF @orders < 0 AND @PnSinOrden = 1
	  SET @Msg = 'No hay orden activa en Sqlite'

	  IF @orders < 1 AND @PnSinOrden = 1
	  SET @Msg = 'No hay orden activa en SQL Server ni Sqlite'


	  IF @orders < 1 OR @PnSinOrden = 1
		BEGIN
			DECLARE @sPara VARCHAR(100);
			SELECT @sPara = Svalor1
				FROM AswSch.ASWCfgConfiguracion
				where ClaConfiguracion = 15

			SET @PnMensaje = @PnMensaje +
				'<tr>'+
				    '<td align="center" style="width:60px;">'+CAST(@nClaveCelda AS VARCHAR)+'</td>'+
					'<td align="center" style="width:60px;">'+CAST(@PsIdCelda AS VARCHAR)+'</td>'+
					'<td align="center" style="width:60px;">'+CONVERT(VARCHAR, CONVERT(DATETIME,@fechaHora),113)+'</td>'+
					'<td align="center" style="width:60px;">'+@Msg+'</td></tr>'
			
			IF @PnMensaje IS NOT NULL
				BEGIN
				SET @PnMensaje = @PnTitulo + @PnMensaje
				EXEC [AswSch].[ASW_CU7_Pag1_EnvioCorreo_I]@PnSub,@PnMensaje,@PnSpOrigen,@PnClaveSp
			END
		

	END

END