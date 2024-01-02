--USE [ASW]
--GO
/****** Object:  StoredProcedure [AswSch].[ASW_CU9_Pag1_AlertaOeeFueraRango]    Script Date: 14/11/2022 11:30:45 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROC [AswSch].[ASW_CU9_Pag1_AlertaOeeFueraRango] 
AS
BEGIN
	DECLARE   @sSub		VARCHAR(55) = 'Alerta: OEE Fuera de Rango< '+CAST(CURRENT_TIMESTAMP AS varchar)
			 ,@sTitulo	VARCHAR(1000) = '<table width=100%><tr class="header" style="background-color:#304f60; font-family:Arial;color:#FFFFFF;font-size:18px;font-weight:bold;">'+    
												'<th style="width: 60%; ">Alerta OEE Fuera de Rango</th>'+
											'</table>'
			 ,@sMensaje	VARCHAR(max) = '<table border="1" bordercolor="#eeeeee" width=100% style="table-layout: fixed; word-wrap: break-word; font-size:11px; padding:3px">'+
												'<tr style="background-color:#DBDBDB; font-family:Arial; border-collapse:collapse; font-weight:550;">'+
													'<th>IdCelda</th>'+
													'<th>ClaveCelda</th>'+
													'<th>FechaAdmScada</th>'+
													'<th>NomTurno</th>'+
													'<th>Hora</th>'+
													'<th>Disponibilidad</th>' +
													'<th>Eficiencia</th>'+
													'<th>Calidad</th>'+
													'<th>Oee</th>'

	DECLARE @tmpRegistros AS TABLE (
		IdCelda        VARCHAR(30),
		ClaveCelda     VARCHAR(15),
		FechaAdmScada  DATE,
		NomTurno       VARCHAR(10),
		Hora           INT,
		Disponibilidad NUMERIC(8,2),
		Eficiencia     NUMERIC(8,2),
		Calidad        NUMERIC(8,2),
		Oee			   NUMERIC(8,2)
	)

	INSERT INTO @tmpRegistros (
	    IdCelda        ,
		ClaveCelda     ,
		FechaAdmScada  ,
		NomTurno       ,
		Hora           ,
		Disponibilidad ,
		Eficiencia     ,
		Calidad        ,
		Oee			   
	)
	SELECT IdCelda
	,ClaveCelda
	,FechaAdmScada
	,NomTurno
	,Hora 
	,OEE.Disponibilidad
	,OEE.Eficiencia
	,OEE.Calidad
	,OEE.Oee
	FROM AswSch.AswEstEgeHora OEE
	WHERE  (
		   (isnull(OEE.Disponibilidad,-1) < 0  OR OEE.Disponibilidad > 100)
		OR (isnull(OEE.Eficiencia,-1)     < 0  OR OEE.Eficiencia     > 105)--tolerancia de 5% porque pueden iniciar el turno con producto iniciado
		OR (isnull(OEE.Calidad,-1)        < 0  OR OEE.Calidad        > 100) 
		OR (isnull(OEE.Oee,-1)            < 0  OR OEE.Oee            > 100) 
		)
     AND FechaAdmScada = CAST(GETDATE() AS date)
	 AND DATEDIFF(MINUTE,FechaUltimaMod,GETDATE()) <= 6

	SELECT @sMensaje = @sMensaje +
		'<tr>'+
		'<td align="center" style="width:60px;">'+CAST(IdCelda  AS VARCHAR)+'</td>'+
		'<td align="center" style="width:60px;">'+ ClaveCelda   +'</td>'+
		'<td align="center" style="width:60px;">'+CAST(FechaAdmScada AS VARCHAR)+'</td>'+
		'<td align="center" style="width:60px;">'+NomTurno +'</td>'+
		'<td align="center" style="width:60px;">'+CAST(Hora AS VARCHAR)+'</td>'+
		'<td align="center" style="width:60px;">'+CAST(Disponibilidad AS VARCHAR)+'</td>'+
		'<td align="center" style="width:60px;">'+CAST(Eficiencia  AS VARCHAR)+'</td>'+
		'<td align="center" style="width:60px;">'+CAST(Calidad  AS VARCHAR)+'</td>'+
		'<td align="center" style="width:60px;">'+CAST(Oee  AS VARCHAR)+'</td>'+
		'</tr>'
		FROM @tmpRegistros

		SELECT @sMensaje = @sTitulo + @sMensaje

		DECLARE @sSpOrigen VARCHAR(100) = 'ASW_CU9_Pag1_AlertaOeeFueraRango'
			  , @sClaveSp VARCHAR(100) ='OeeFueraRango'

	IF EXISTS(SELECT 1 FROM @tmpRegistros)
	BEGIN
		EXEC [AswSch].[ASW_CU7_Pag1_EnvioCorreo_I] @sSub,@sMensaje,@sSpOrigen,@sClaveSp
	END

END





