--USE [ASW]
--GO
/****** Object:  StoredProcedure [AswSch].[ASW_CU201_Pag1_AlertaParoDuplicado]    Script Date: 15/11/2022 12:19:43 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROC [AswSch].[ASW_CU201_Pag1_AlertaParoDuplicado]
AS
BEGIN
	DECLARE  @sSub		VARCHAR(55) = 'Alerta: Paros sin cerrar '+CAST(CURRENT_TIMESTAMP AS varchar)
			,@sTitulo	VARCHAR(1000) = '<table width=100%><tr class="header" style="background-color:#304f60; font-family:Arial;color:#FFFFFF;font-size:18px;font-weight:bold;">'+    
											'<th style="width: 60%; ">Alerta Paros sin cerrar</th>'+
										'</table>'
			,@sMensaje	VARCHAR(max) = '<table border="1" bordercolor="#eeeeee" width=100% style="table-layout: fixed; word-wrap: break-word; font-size:11px; padding:3px">'+
											'<tr style="background-color:#DBDBDB; font-family:Arial; border-collapse:collapse; font-weight:550;">'+
												'<th>Id</th>'+
												'<th>IdParo</th>'+
												'<th>IdCelda</th>'+
												'<th>ClaveCelda</th>'+
												'<th>IdComponente</th>'+
												'<th>Maquina</th>' +
												'<th>FechaHoraInicial</th>'
											
	--Todos los paros abiertos

	DECLARE @ParosPendientesCerrar TABLE (
		 Id INT
		,IdParo INT
		,IdCelda VARCHAR(30)
		,ClaveCelda VARCHAR(30)
		,IdComponente VARCHAR(30)
		,NomMaquina VARCHAR(250)
		,FechaHoraInicial DATETIME
	)

	;WITH CteParosRecientes AS ( 
		SELECT IdCelda
			  ,IdComponente
			  ,MAX(idparo) as UltimoIdParo
		FROM AswSch.AswBitBitacoraParoCeldaVw 
		WHERE   FechaAdmSCADA = CAST(GETDATE() as date)
			AND fechaHoraInicial  BETWEEN DATEADD(MINUTE,-11,getdate()) AND GETDATE() --Para evitar repetir envio de alerta
		GROUP BY IdCelda
				,IdComponente
	)
	INSERT INTO @ParosPendientesCerrar(
		 Id 
		,IdParo 
		,IdCelda 
		,ClaveCelda 
		,IdComponente
		,NomMaquina
		,FechaHoraInicial  
	)
	SELECT BPC.Id 
		  ,BPC.IdParo 
		  ,BPC.IdCelda 
		  ,BPC.ClaveCelda 
		  ,BPC.IdComponente
		  ,BPC.NomMaquina
		  ,BPC.FechaHoraInicial 
	FROM  CteParosRecientes PR
	JOIN  AswSch.AswBitBitacoraParoCeldaVw BPC
		ON PR.IdCelda = BPC.IdCelda
		AND PR.IdComponente = BPC.IdComponente
	WHERE BPC.IdParo < PR.UltimoIdParo
		AND ISNULL(FechaHoraFinal,'1900-01-01') = '1900-01-01'
		AND FechaAdmSCADA = CAST(GETDATE() as date)



	IF EXISTS (SELECT 1 FROM @ParosPendientesCerrar)
	BEGIN
		SELECT @sMensaje = @sMensaje +
		'<tr>'+
		'<td align="center" style="width:60px;">'+CAST(Id  AS VARCHAR)+'</td>'+
		'<td align="center" style="width:60px;">'+CAST(IdParo  AS VARCHAR)+'</td>'+
		'<td align="center" style="width:60px;">'+CAST(IdCelda AS VARCHAR)+'</td>'+
		'<td align="center" style="width:60px;">'+CAST(ClaveCelda AS VARCHAR)+'</td>'+
		'<td align="center" style="width:60px;">'+CAST(IdComponente AS VARCHAR)+'</td>'+
		'<td align="center" style="width:60px;">'+CAST(NomMaquina AS VARCHAR)+'</td>'+
		'<td align="center" style="width:60px;">'+CAST(FechaHoraInicial  AS VARCHAR)+'</td>'+
		'</tr>'
		FROM @ParosPendientesCerrar

		SELECT @sMensaje = @sTitulo + @sMensaje

		DECLARE @sSpOrigen VARCHAR(100) = 'ASW_CU201_Pag1_AlertaParoDuplicado'
			  , @sClaveSp VARCHAR(100) ='ParoDuplicado'

		EXEC [AswSch].[ASW_CU7_Pag1_EnvioCorreo_I] @sSub,@sMensaje,@sSpOrigen,@sClaveSp
	END
	
END