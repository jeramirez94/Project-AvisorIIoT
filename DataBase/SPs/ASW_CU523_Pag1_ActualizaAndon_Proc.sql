--USE [ASW]
--GO
/****** Object:  StoredProcedure [AswSch].[ASW_CU523_Pag1_ActualizaAndon_Proc]    Script Date: 15/11/2022 03:24:28 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
begin tran

EXECUTE AswSch.ASW_CU523_Pag1_ActualizaAndon_Proc @xml = '<?xml version="1.0" encoding="UTF-8" standalone="yes"?><ActualizaAndon><Andon><IdAndon>11</IdAndon><ClaUbicacion>68</ClaUbicacion><IdComponente>1000</IdComponente><IdPOInicio>24</IdPOInicio><IdPOFin/><IdUnidad>4505</IdUnidad><IdUsuario>215004067</IdUsuario><FechaHoraInicial>2020-10-30 02:20:01</FechaHoraInicial><FechaHoraReasignado/><FechaHoraAtencion/><FechaHoraFinal/><DuracionSegundos/><FechaAdmSCADA>2020-10-29</FechaAdmSCADA><ClaTurno>3</ClaTurno><ClaGrupoParo>7</ClaGrupoParo><ClaTipoParo>101</ClaTipoParo><ClaSeccionParo>101</ClaSeccionParo><ClaEventoNuevo>1</ClaEventoNuevo><ClaEventoReasignacion/><ClaEventoAtencion/><ClaEventoSolucionado/><ClaEstatusReplica>1</ClaEstatusReplica><ClaUsuarioMod>215004067</ClaUsuarioMod><NombrePCMod>302MRODRIGUEZC</NombrePCMod><FechaUltimaMod>2020-10-30 02:20:01</FechaUltimaMod><BajaLogica>0</BajaLogica></Andon></ActualizaAndon>'
select * from  [AswSch].[ASWBitAndon]

rollback tran
*/

/*XML
<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<ActualizaAndon>
	<Andon>
		<IdAndon>11</IdAndon>
		<ClaUbicacion>68</ClaUbicacion>
		<IdComponente>1000</IdComponente>
		<IdPOInicio>24</IdPOInicio>
		<IdPOFin/>
		<IdUnidad>4505</IdUnidad>
		<IdUsuario>215004067</IdUsuario>
		<FechaHoraInicial>2020-10-30 02:20:01</FechaHoraInicial>
		<FechaHoraReasignado/>
		<FechaHoraAtencion/>
		<FechaHoraFinal/>
		<DuracionSegundos/>
		<FechaAdmSCADA>2020-10-29</FechaAdmSCADA>
		<ClaTurno>3</ClaTurno>
		<ClaGrupoParo>7</ClaGrupoParo>
		<ClaTipoParo>101</ClaTipoParo>
		<ClaSeccionParo>101</ClaSeccionParo>
		<ClaEventoNuevo>1</ClaEventoNuevo>
		<ClaEventoReasignacion/>
		<ClaEventoAtencion/>
		<ClaEventoSolucionado/>
		<ClaEstatusReplica>1</ClaEstatusReplica>
		<ClaUsuarioMod>215004067</ClaUsuarioMod>
		<NombrePCMod>302MRODRIGUEZC</NombrePCMod>
		<FechaUltimaMod>2020-10-30 02:20:01</FechaUltimaMod>
		<BajaLogica>0</BajaLogica>
	</Andon>
</ActualizaAndon>
*/
ALTER PROCEDURE [AswSch].[ASW_CU523_Pag1_ActualizaAndon_Proc]
	@xml XML
AS
BEGIN
	DECLARE @handle INT  
	DECLARE @PrepareXmlStatus INT	

	DECLARE 
		@ErrorMessage  NVARCHAR(4000)
		,@ErrorSeverity INT
		,@ErrorState    INT	

	DECLARE @tResultado TABLE(
		IdAndon INT,
		ClaEventoNuevo INT,
		ClaEventoReasignacion INT,
		ClaEventoAtencion INT,
		ClaEventoSolucionado INT,
		ClaEstatusReplica INT--control para interfaz con MCSW (1 cambio, 2 replicado)
	)
	
	DECLARE @nId INT, 	
		@nClaUbicacion INT,
		@nIdComponente VARCHAR(30),
		@nIdAndon INT,
		@nIdPOInicio INT,
		@nIdPOFin INT,
		@nIdUnidad INT,
		@nIdUsuario INT,
		@tFechaHoraInicial DATETIME,
		@tFechaHoraReasignado DATETIME,
		@tFechaHoraAtencion DATETIME,
		@tFechaHoraFinal DATETIME,
		@nDuracionSegundos INT,
		@tFechaAdmSCADA DATETIME,
		@nClaTurno INT,
		@nClaGrupoParo INT,
		@nClaTipoParo INT,
		@nClaSeccionParo INT,
		@nClaEstatusReplica INT,
		@nClaEventoNuevo INT,
		@nClaEventoReasignacion INT,
		@nClaEventoAtencion INT,
		@nClaEventoSolucionado INT,
		@nClaUsuarioMod INT,
		@sNombrePCMod VARCHAR(64),
		@tFechaUltimaMod DATETIME,
		@nBajaLogica INT,
		@nNombreEmpleado VARCHAR(400),
		@nComentarios VARCHAR(400),
		@nComentariosSolucion VARCHAR(400),
		@nIdTipoSeguimientoAlerta TINYINT,
		@sSubject VARCHAR(100),
		@sMensaje VARCHAR(MAX),
		@sSpOrigen VARCHAR(100),
		@sClaveSp VARCHAR(100)

	DECLARE @Andon TABLE(
		Id INT IDENTITY,
		ClaUbicacion INT,
		IdComponente VARCHAR(30),
		IdAndon INT,
		IdPOInicio INT,
		IdPOFin INT,
		idUnidad INT,
		idUsuario INT,
		fechaHoraInicial DATETIME,
		fechaHoraReasignado DATETIME,
		fechaHoraAtencion DATETIME,
		fechaHoraFinal DATETIME,
		DuracionSegundos INT,
		fechaAdmSCADA DATETIME,
		ClaTurno INT,
		claGrupoParo VARCHAR(10),
		ClaTipoParo VARCHAR(10),
		claSeccionParo VARCHAR(10),
		ClaEstatusReplica INT,
		ClaEventoNuevo INT,
		ClaEventoReasignacion INT,
		ClaEventoAtencion INT,
		ClaEventoSolucionado INT,
		ClaUsuarioMod INT,
		NombrePCMod VARCHAR(64),
		FechaUltimaMod DATETIME,
		BajaLogica INT,
		NombreEmpleado VARCHAR(400),
		Comentarios VARCHAR(400),
		ComentariosSolucion VARCHAR(400),
		IdTipoSeguimientoAlerta TINYINT
	)

	EXEC @PrepareXmlStatus= sp_xml_preparedocument @handle OUTPUT, @xml  
	
	INSERT INTO @Andon([ClaUbicacion]
		,[IdComponente]
		,[IdAndon]
		,[IdPOInicio]
		,[IdPOFin]
		,[idUnidad]
		,[idUsuario]
		,[fechaHoraInicial]
		,[fechaHoraReasignado]
		,[fechaHoraAtencion]
		,[fechaHoraFinal]
		,[DuracionSegundos]
		,[fechaAdmSCADA]
		,[ClaTurno]
		,[claGrupoParo]
		,[ClaTipoParo]
		,[claSeccionParo]
		,[ClaEstatusReplica]
		,ClaEventoNuevo
		,ClaEventoReasignacion
		,ClaEventoAtencion
		,ClaEventoSolucionado
		,[ClaUsuarioMod]
		,[NombrePcMod]
		,[FechaUltimaMod]
		,[BajaLogica]
		,[NombreEmpleado]
		,[Comentarios]
		,[ComentariosSolucion]
		,IdTipoSeguimientoAlerta 
	)
	SELECT [ClaUbicacion]
		,[IdComponente]
		,[IdAndon]
		,[IdPOInicio]
		,NULLIF([IdPOFin],'') AS [IdPOFin]
		,[IdUnidad]
		,[IdUsuario]
		,[FechaHoraInicial]
		,NULLIF([FechaHoraReasignado],'') AS [FechaHoraReasignado]
		,NULLIF([FechaHoraAtencion],'') AS [FechaHoraAtencion]
		,NULLIF([FechaHoraFinal],'') AS [FechaHoraFinal]
		,NULLIF([DuracionSegundos],'') AS [DuracionSegundos]
		,[FechaAdmSCADA]
		,[ClaTurno]
		,NULLIF([ClaGrupoParo],'') AS [claGrupoParo]
		,NULLIF([ClaTipoParo],'') AS [ClaTipoParo]
		,NULLIF([ClaSeccionParo],'') AS [claSeccionParo]
		,[ClaEstatusReplica]
		,ClaEventoNuevo 
		,NULLIF(ClaEventoReasignacion,'') AS ClaEventoReasignacion
		,NULLIF(ClaEventoAtencion,'') AS ClaEventoAtencion
		,NULLIF(ClaEventoSolucionado,'') AS ClaEventoSolucionado
		,[ClaUsuarioMod]
		,[NombrePcMod]+'_rep' AS NombrePcMod
		,[FechaUltimaMod]
		,[BajaLogica]
		,[NombreEmpleado]
		,[Comentarios]
		,[ComentariosSolucion]
		,IdTipoSeguimientoAlerta 
	FROM    OPENXML(@handle, '/ActualizaAndon/Andon', 2)  
		WITH (
		ClaUbicacion INT,
		IdComponente VARCHAR(30),
		IdAndon INT,
		IdPOInicio INT,
		IdPOFin VARCHAR(6),
		IdUnidad INT,
		IdUsuario INT,
		FechaHoraInicial DATETIME,
		FechaHoraReasignado VARCHAR(25),
		FechaHoraAtencion VARCHAR(25),
		FechaHoraFinal VARCHAR(25),
		DuracionSegundos VARCHAR(6),
		FechaAdmSCADA DATETIME,
		ClaTurno INT,
		ClaGrupoParo VARCHAR(10),
		ClaTipoParo VARCHAR(10),
		ClaSeccionParo VARCHAR(10),
		ClaEstatusReplica INT,
		ClaEventoNuevo INT,
		ClaEventoReasignacion VARCHAR(1),
		ClaEventoAtencion  VARCHAR(1),
		ClaEventoSolucionado  VARCHAR(1),
		ClaUsuarioMod INT,
		NombrePCMod VARCHAR(64),
		FechaUltimaMod DATETIME,
		BajaLogica INT,
		NombreEmpleado VARCHAR(400),
		Comentarios VARCHAR(400),
		ComentariosSolucion VARCHAR(400),
		IdTipoSeguimientoAlerta TINYINT
		) 

	EXEC sp_xml_removedocument @handle 
	
	--select * from @Andon

	--inicializo la tabla de respuestas
	--la bd local solo actualizara los campos no nulos
	INSERT INTO @tResultado (IdAndon, ClaEstatusReplica)
	SELECT IdAndon
		,2 --replicado
	FROM @Andon

	
	SELECT @nId = MIN (Id)
	FROM @Andon
	
	WHILE @nId IS NOT NULL
	BEGIN
		SELECT 
			@nClaUbicacion = ClaUbicacion 
			,@nIdComponente = IdComponente 
			,@nIdAndon = IdAndon 
			,@nIdPOInicio = IdPOInicio 
			,@nIdPOFin = IdPOFin 
			,@nIdUnidad = IdUnidad 
			,@nIdUsuario = IdUsuario 
			,@tFechaHoraInicial = FechaHoraInicial 
			,@tFechaHoraReasignado  = FechaHoraReasignado
			,@tFechaHoraAtencion   = FechaHoraAtencion
			,@tFechaHoraFinal = FechaHoraFinal 
			,@nDuracionSegundos = DuracionSegundos 
			,@tFechaAdmSCADA = FechaAdmSCADA 
			,@nClaTurno = ClaTurno 
			,@nClaGrupoParo = ClaGrupoParo 
			,@nClaTipoParo = ClaTipoParo 
			,@nClaSeccionParo = ClaSeccionParo 
			,@nClaEstatusReplica = ClaEstatusReplica 
			,@nClaEventoNuevo = ClaEventoNuevo
			,@nClaEventoReasignacion = ClaEventoReasignacion
			,@nClaEventoAtencion = ClaEventoAtencion
			,@nClaEventoSolucionado = ClaEventoSolucionado
			,@nClaUsuarioMod = ClaUsuarioMod 
			,@sNombrePCMod = NombrePCMod 
			,@tFechaUltimaMod = FechaUltimaMod 
			,@nBajaLogica = BajaLogica 
			,@nNombreEmpleado = NombreEmpleado
			,@nComentarios = Comentarios
			,@nComentariosSolucion = ComentariosSolucion
			,@nIdTipoSeguimientoAlerta = IdTipoSeguimientoAlerta
		FROM @Andon
		WHERE Id = @nId

		--Inserto el registro en la tabla con la informacion original
		BEGIN TRY
		EXEC [AswSch].[ASW_CU523_Pag1_BitAndon_IU]
			@nClaUbicacion 
			,@nIdComponente 
			,@nIdAndon 
			,@nIdPOInicio 
			,@nIdPOFin 
			,@nIdUnidad 
			,@nIdUsuario 
			,@tFechaHoraInicial 
			,@tFechaHoraReasignado  
			,@tFechaHoraAtencion   
			,@tFechaHoraFinal 
			,@nDuracionSegundos 
			,@tFechaAdmSCADA 
			,@nClaTurno 
			,@nClaGrupoParo 
			,@nClaTipoParo 
			,@nClaSeccionParo 
			,@nClaEstatusReplica
			,@nClaEventoNuevo
			,@nClaEventoReasignacion
			,@nClaEventoAtencion
			,@nClaEventoSolucionado
			,@nClaUsuarioMod 
			,@sNombrePCMod 
			,@tFechaUltimaMod 
			,@nBajaLogica
			,@nNombreEmpleado
			,@nComentarios
			,@nComentariosSolucion
			,@nIdTipoSeguimientoAlerta
		END TRY
		BEGIN CATCH
			
			IF DATEDIFF(minute,@tFechaUltimaMod,GETDATE()) <= 5 
			BEGIN

				SELECT @sSubject = 'Alerta replica andon sqlite-sqlserver',
				       @sMensaje = 'IdAndon= '+ CAST(@nIdAndon AS VARCHAR) + ' IdComponente= '+ CAST(@nIdComponente AS VARCHAR) +' NombrePcMod=' + @sNombrePCMod,
				       @sSpOrigen = 'ASW_CU523_Pag1_ActualizaAndon_Proc',
				       @sClaveSp  = 'ASW_CU523_Pag1'

				EXEC [AswSch].[ASW_CU7_Pag1_EnvioCorreo_I]
				 @pSubject  = @sSubject 
				,@pMensaje  = @sMensaje 
				,@pSpOrigen = @sSpOrigen
				,@pClaveSp  = @sClaveSp 
			END			    
			
		END CATCH
		--si me traje un evento nuevo lo confirmo de recibido, si no no afecto la columna
		--sqlite solo se va a actualizar si se tiene un valor no nulo
		UPDATE @tResultado
		SET ClaEventoNuevo = CASE WHEN @nClaEventoNuevo = 1 THEN 2 ELSE NULL END
			,ClaEventoReasignacion = CASE WHEN @nClaEventoReasignacion = 1 THEN 2 ELSE NULL END
			,ClaEventoAtencion = CASE WHEN @nClaEventoAtencion = 1 THEN 2 ELSE NULL END
			,ClaEventoSolucionado = CASE WHEN @nClaEventoSolucionado = 1 THEN 2 ELSE NULL END

		----------------------------------------------------------
		SELECT @nId = MIN (Id)
		FROM @Andon
		WHERE Id>@nId
	END

	select * from @tResultado

	

END



