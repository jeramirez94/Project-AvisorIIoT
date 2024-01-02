--USE [ASW]
--GO
/****** Object:  StoredProcedure [AswSch].[ASW_CU703_3_ActualizaReporteFalla_Proc]    Script Date: 15/11/2022 04:04:42 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*
begin tran

EXECUTE AswSch.ASW_CU703_3_ActualizaReporteFalla_Proc @xml = '<?xml version="1.0" encoding="UTF-8" standalone="yes"?><ReporteFalla><Reporte><IdReporteFalla>1</IdReporteFalla><IdCelda>4</IdCelda><ClaEquipo>1</ClaEquipo><ClaTurno>1</ClaTurno><FechaAdmScada>2021-01-05</FechaAdmScada><FechaReporte/><ClaSistema>31</ClaSistema><ClaSubSistema>8</ClaSubSistema><ClaRcmFuncion>75</ClaRcmFuncion><ClaRcmFuncionFalla>1</ClaRcmFuncionFalla><ClaEstatusReplica>1</ClaEstatusReplica><FechaBajaLogica/><BajaLogica>0</BajaLogica><ClaUsuarioMod>6295</ClaUsuarioMod><NombrePCMod>302MRODRIGUEZC</NombrePCMod><FechaUltimaMod>2021-01-05 11:15:07</FechaUltimaMod></Reporte></ReporteFalla>'
select * from  [AswSch].[AswMtoTraReporteFalla]

rollback tran
*/

/*XML
<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<ReporteFalla>
	<Reporte>
		<IdReporteFalla>1</IdReporteFalla>
		<IdCelda>4</IdCelda>
		<ClaEquipo>1</ClaEquipo>
		<ClaTurno>1</ClaTurno>
		<FechaAdmScada>2021-01-05</FechaAdmScada>
		<FechaReporte/>
		<ClaSistema>31</ClaSistema>
		<ClaSubSistema>8</ClaSubSistema>
		<ClaRcmFuncion>75</ClaRcmFuncion>
		<ClaRcmFuncionFalla>1</ClaRcmFuncionFalla>
		<ClaEstatusReplica>1</ClaEstatusReplica>
		<FechaBajaLogica/>
		<BajaLogica>0</BajaLogica>
		<ClaUsuarioMod>6295</ClaUsuarioMod>
		<NombrePCMod>302MRODRIGUEZC</NombrePCMod>
		<FechaUltimaMod>2021-01-05 11:15:07</FechaUltimaMod>
	</Reporte>
</ReporteFalla>
*/
ALTER PROCEDURE [AswSch].[ASW_CU703_3_ActualizaReporteFalla_Proc]
	@xml XML
AS
BEGIN
	DECLARE @pnClaUbicacion INT
	DECLARE @handle INT  
	DECLARE @PrepareXmlStatus INT	

	DECLARE 
		@ErrorMessage  NVARCHAR(4000)
		,@ErrorSeverity INT
		,@ErrorState    INT	

	DECLARE @tResultado TABLE(
		IdReporteFalla INT,
		ClaEstatusReplica INT--control para interfaz con MCSW (1 cambio, 2 replicado)
	)
	
	DECLARE
		@nClaUbicacion int
		,@nId int
		,@nIdReporteFalla int
		,@sIdCelda varchar(30)
		,@nClaEquipo int
		,@nClaTurno int
		,@nFechaAdmScada datetime
		,@tFechaReporte DATETIME
		,@nClaSistema int
		,@nClaSubSistema int
		,@nClaRcmFuncion int
		,@nClaRcmFuncionFalla int
		,@nClaEstatusReplica int
		,@tFechaBajaLogica datetime
		,@nBajaLogica int
		,@nClaUsuarioMod int	
		,@sNombrePcMod VARCHAR(64)
		,@tFechaUltimaMod DATETIME


	DECLARE @ReporteFalla TABLE
	(
		[Id] [int] IDENTITY,
		[IdReporteFalla] [int] NOT NULL,
		[IdCelda] [int] NOT NULL,
		[ClaEquipo] [int] NOT NULL,
		[ClaTurno] [int] NULL,
		[FechaAdmScada] [datetime] NULL,
		[FechaReporte] [datetime] NULL,
		[ClaSistema] [int] NOT NULL,
		[ClaSubSistema] [int] NOT NULL,
		[ClaRcmFuncion] [int] NOT NULL,
		[ClaRcmFuncionFalla] [int] NOT NULL,
		[ClaEstatusReplica] [int] NULL,
		[FechaBajaLogica] [datetime] NULL,
		[BajaLogica] [int] NULL,
		[ClaUsuarioMod] [int] NOT NULL,
		[NombrePCMod] [varchar](64) NOT NULL,
		[FechaUltimaMod] [datetime] NOT NULL
	)

	SELECT @pnClaUbicacion=Valor1
	FROM [AswSch].[ASWCfgConfiguracion]
	WHERE ClaConfiguracion = 1

	EXEC @PrepareXmlStatus= sp_xml_preparedocument @handle OUTPUT, @xml  
	
	INSERT INTO @ReporteFalla(
		[IdReporteFalla]
		,[IdCelda]
		,[ClaEquipo]
		,[ClaTurno] 
		,[FechaAdmScada] 
		,[FechaReporte]
		,[ClaSistema] 
		,[ClaSubSistema]
		,[ClaRcmFuncion] 
		,[ClaRcmFuncionFalla] 
		,[ClaEstatusReplica] 
		,[FechaBajaLogica]
		,[BajaLogica] 
		,[ClaUsuarioMod] 
		,[NombrePCMod] 
		,[FechaUltimaMod]
	)
	SELECT [IdReporteFalla]
		,[IdCelda]
		,[ClaEquipo]
		,[ClaTurno]
		,[FechaAdmScada]
		,[FechaReporte]
		,[ClaSistema]
		,[ClaSubSistema]
		,[ClaRcmFuncion]
		,[ClaRcmFuncionFalla]
		,[ClaEstatusReplica]
		,[FechaBajaLogica]
		,[BajaLogica]
		,[ClaUsuarioMod]
		,[NombrePCMod]
		,[FechaUltimaMod]
	FROM    OPENXML(@handle, '/ReporteFalla/Reporte', 2)  
		WITH (
		[IdReporteFalla] [int],
		[IdCelda] [int],
		[ClaEquipo] [int],
		[ClaTurno] [int],
		[FechaAdmScada] [datetime],
		[FechaReporte] [datetime],
		[ClaSistema] [int],
		[ClaSubSistema] [int],
		[ClaRcmFuncion] [int],
		[ClaRcmFuncionFalla] [int],
		[ClaEstatusReplica] [int],
		[FechaBajaLogica] [datetime],
		[BajaLogica] [int],
		[ClaUsuarioMod] [int],
		[NombrePCMod] [varchar](64),
		[FechaUltimaMod] [datetime]
		) 

	EXEC sp_xml_removedocument @handle 
	
	--select * from @ReporteFalla

	--inicializo la tabla de respuestas
	--la bd local solo actualizara los campos no nulos
	INSERT INTO @tResultado (IdReporteFalla, ClaEstatusReplica)
	SELECT IdReporteFalla
		,NULL --replicado
	FROM @ReporteFalla

	
	SELECT @nId = MIN (Id)
	FROM @ReporteFalla
	
	WHILE @nId IS NOT NULL
	BEGIN
		SELECT 
			@nClaUbicacion = @pnClaUbicacion 
			,@nIdReporteFalla = IdReporteFalla 
			,@sIdCelda = IdCelda 
			,@nClaEquipo = ClaEquipo 
			,@nClaTurno = ClaTurno 
			,@nFechaAdmScada = FechaAdmScada 
			,@tFechaReporte = FechaReporte 
			,@nClaSistema = ClaSistema 
			,@nClaSubSistema = ClaSubSistema 
			,@nClaRcmFuncion = ClaRcmFuncion 
			,@nClaRcmFuncionFalla = ClaRcmFuncionFalla 
			,@nClaEstatusReplica = ClaEstatusReplica
			,@tFechaBajaLogica = FechaBajaLogica
			,@nBajaLogica = BajaLogica 
			,@nClaUsuarioMod = ClaUsuarioMod 
			,@sNombrePcMod = NombrePcMod
			,@tFechaUltimaMod = FechaUltimaMod
		FROM @ReporteFalla
		WHERE Id = @nId
		
--print 'uno'
		--Inserto el registro en la tabla con la informacion original
		EXEC [AswSch].[ASW_CU703_3_ReporteFalla_IU]
		--SELECT
			@nClaUbicacion
			,@nIdReporteFalla
			,@sIdCelda
			,@nClaEquipo
			,@nClaTurno
			,@nFechaAdmScada
			,@tFechaReporte
			,@nClaSistema
			,@nClaSubSistema
			,@nClaRcmFuncion
			,@nClaRcmFuncionFalla
			,@nClaEstatusReplica
			,@tFechaBajaLogica
			,@nBajaLogica
			,@nClaUsuarioMod
			,@sNombrePcMod
			,@tFechaUltimaMod
		
		--si me traje un evento nuevo lo confirmo de recibido, si no no afecto la columna
		--sqlite solo se va a actualizar si se tiene un valor no nulo
		UPDATE @tResultado
		SET ClaEstatusReplica = 2
		WHERE IdReporteFalla = @nIdReporteFalla

		----------------------------------------------------------
		SELECT @nId = MIN (Id)
		FROM @ReporteFalla
		WHERE Id>@nId
	END

	select * from @tResultado

	

END

