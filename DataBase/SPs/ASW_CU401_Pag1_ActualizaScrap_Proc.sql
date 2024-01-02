--USE [ASW]
--GO
/****** Object:  StoredProcedure [AswSch].[ASW_CU401_Pag1_ActualizaScrap_Proc]    Script Date: 15/11/2022 03:04:30 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
begin tran

EXECUTE AswSch.ASW_CU401_Pag1_ActualizaScrap_Proc @xml = '<?xml version="1.0" encoding="UTF-8" standalone="yes"?><ActualizaScrap><Scrap><IdScrap>1</IdScrap><IdPO>2</IdPO><IdCelda>4</IdCelda><Peso>20</Peso><ClaEstatusReplica>1</ClaEstatusReplica><BajaLogica>1</BajaLogica><FechaBajaLogica>2020-07-07 13:31:26</FechaBajaLogica><FechaUltimaMod>2020-07-07 13:31:26</FechaUltimaMod><NombrePcMod>302MRODRIGUEZC</NombrePcMod><ClaUsuarioMod>7599</ClaUsuarioMod></Scrap></ActualizaScrap>'

select * from  [AswSch].[ASWTraScrap]

rollback tran
*/

/*XML
<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<ActualizaScrap>
	<Scrap>
		<IdScrap>1</IdScrap>
		<IdPO>2</IdPO>
		<IdCelda>4</IdCelda>
		<Peso>20</Peso>
		<TipoScrapCelda>WIRE</TipoScrapCelda>
		<MotivoScrap>BROKEN WIRE</MotivoScrap>
		<ClaEstatusReplica>1</ClaEstatusReplica>
		<BajaLogica>1</BajaLogica>
		<FechaBajaLogica>2020-07-07 13:31:26</FechaBajaLogica>
		<FechaUltimaMod>2020-07-07 13:31:26</FechaUltimaMod>
		<NombrePcMod>302MRODRIGUEZC</NombrePcMod>
		<ClaUsuarioMod>7599</ClaUsuarioMod>
	</Scrap>
<ActualizaScrap>
*/
ALTER PROCEDURE [AswSch].[ASW_CU401_Pag1_ActualizaScrap_Proc]
	@xml XML
AS
BEGIN

	DECLARE @handle INT  
	DECLARE @PrepareXmlStatus INT	

	--DECLARE 
	--	@ErrorMessage  NVARCHAR(4000)
	--	,@ErrorSeverity INT
	--	,@ErrorState    INT	

	DECLARE @tResultado TABLE(
		IdScrap INT,
		IdPO INT,
		ClaEstatusReplica INT--control para interfaz con MCSW (1 cambio, 2 replicado)
	)
	
	DECLARE @nId INT,
		@pnIdScrap int,
		@pnIdPO int,
		@psIdCelda varchar(30),
		@pnClaTurno int,
		@ptFechaAdmScada datetime,
		@pnPeso numeric(22,4),
		@psTipoScrapCelda varchar(50),
		@psMotivoScrap varchar(500),
		@pnClaScrapReason INT,
		@pnClaEstatusReplica INT,
		@pnBajaLogica int,
		@ptFechaBajaLogica datetime, 
		@pnClaUsuarioMod int, 
		@psNombrePcMod varchar(64), 
		@pnFechaUltimaMod datetime

	DECLARE @Scrap TABLE(
		Id INT IDENTITY,
		[IdScrap] int,
		[IdPO] int,
		[IdCelda] varchar(30),
		[ClaTurno] int,
		[FechaAdmScada] datetime,
		[Peso] numeric(22,4),
		[TipoScrapCelda] varchar(50),
		[MotivoScrap] varchar(500),
		[ClaScrapReason]	INT,
		[ClaEstatusReplica] INT,
		[BajaLogica] int,
		[FechaBajaLogica] datetime, 
		[ClaUsuarioMod] int, 
		[NombrePcMod] varchar(64), 
		[FechaUltimaMod] datetime
	)

	EXEC @PrepareXmlStatus= sp_xml_preparedocument @handle OUTPUT, @xml  
	
	INSERT INTO @Scrap( [IdScrap]
		,[IdPO]
		,[IdCelda]
		,[ClaTurno]
		,[FechaAdmScada]
		,[Peso]
		,[TipoScrapCelda]
		,[MotivoScrap]
		,[ClaScrapReason]
		,[ClaEstatusReplica]
		,[BajaLogica]
		,[FechaBajaLogica]
		,[FechaUltimaMod]
		,[NombrePcMod]
		,[ClaUsuarioMod]
	)
	SELECT [IdScrap]
		,[IdPO]
		,[IdCelda]
		,[ClaTurno]
		,[FechaAdmScada]
		,[Peso]
		,[TipoScrapCelda]
		,[MotivoScrap]
		,[ClaScrapReason]
		,[ClaEstatusReplica]
		,[BajaLogica]
		,[FechaBajaLogica]
		,[FechaUltimaMod]
		,[NombrePcMod]
		,[ClaUsuarioMod]
	FROM    OPENXML(@handle, '/ActualizaScrap/Scrap', 2)  
		WITH (
		[IdScrap] int,
		[IdPO] int,
		[IdCelda] varchar(30),
		[ClaTurno] int,
		[FechaAdmScada] datetime,
		[Peso] numeric(22,4),
		[TipoScrapCelda] varchar(50),
		[MotivoScrap] varchar(500),
		[ClaScrapReason]	INT,
		[ClaEstatusReplica] INT,
		[BajaLogica] int,
		[FechaBajaLogica] datetime, 
		[ClaUsuarioMod] int, 
		[NombrePcMod] varchar(64), 
		[FechaUltimaMod] datetime
		)  

	EXEC sp_xml_removedocument @handle 

	--select * from @Scrap

	--inicializo la tabla de respuestas
	--la bd local solo actualizara los campos no nulos
	INSERT INTO @tResultado (IdScrap, IdPO, ClaEstatusReplica)
	SELECT IdScrap
		,IdPO
		,2 --replicado
	FROM @Scrap

	
	SELECT @nId = MIN (Id)
	FROM @Scrap
	
	WHILE @nId IS NOT NULL
	BEGIN
		SELECT 
			@pnIdScrap = IdScrap 
			,@pnIdPO = IdPO 
			,@psIdCelda = IdCelda 
			,@pnClaTurno = ClaTurno
			,@ptFechaAdmScada = FechaAdmScada
			,@pnPeso = Peso 
			,@psTipoScrapCelda = TipoScrapCelda
			,@psMotivoScrap = MotivoScrap
			,@pnClaScrapReason = ClaScrapReason
			,@pnClaEstatusReplica = ClaEstatusReplica 
			,@pnBajaLogica = BajaLogica 
			,@ptFechaBajaLogica = FechaBajaLogica 
			,@pnClaUsuarioMod = ClaUsuarioMod 
			,@psNombrePcMod = NombrePcMod 
			,@pnFechaUltimaMod = FechaUltimaMod 
		FROM @Scrap
		WHERE Id = @nId

		--Inserto el registro en la tabla con la informacion original
		EXEC [AswSch].[ASW_CU401_Pag1_TraScrap_IU]
			@pnIdScrap
			,@pnIdPO
			,@psIdCelda
			,@pnClaTurno
			,@ptFechaAdmScada
			,@pnPeso
			,@psTipoScrapCelda
			,@psMotivoScrap
			,@pnClaScrapReason
			,@pnClaEstatusReplica
			,@pnBajaLogica
			,@ptFechaBajaLogica
			,@pnClaUsuarioMod
			,@psNombrePcMod
			,@pnFechaUltimaMod

		----------------------------------------------------------
		SELECT @nId = MIN (Id)
		FROM @Scrap
		WHERE Id>@nId
	END

	select * from @tResultado

	

END
