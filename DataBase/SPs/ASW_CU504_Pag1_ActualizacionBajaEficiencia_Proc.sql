--USE [ASW]
--GO
/****** Object:  StoredProcedure [AswSch].[ASW_CU504_Pag1_ActualizacionBajaEficiencia_Proc]    Script Date: 15/11/2022 03:14:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
begin tran

EXECUTE AswSch.ASW_CU504_Pag1_ActualizacionBajaEficiencia_Proc @xml = '<?xml version="1.0" encoding="UTF-8" standalone="yes"?><BE><BajaEficiencia><IdBajaEficiencia>1</IdBajaEficiencia><ClaUbicacion>68</ClaUbicacion><IdCelda>4</IdCelda><FechaAdmSCADA>2020-02-02</FechaAdmSCADA><ClaTurno>1</ClaTurno><Hora>10</Hora><FechaHoraInicial>2020-02-02</FechaHoraInicial><FechaHoraFinal>2020-02-02</FechaHoraFinal><IdUsuario/><VelocidaObjetivo/><VelocidadReal/><PorcentajeTolerancia/><ClaBajaEfciencia/><ClaEstatusReplica>1</ClaEstatusReplica><BajaLogica>0</BajaLogica><FechaBajaLogica/><ClaUsuarioMod>0</ClaUsuarioMod><NombrePCMod>mrc</NombrePCMod><FechaUltimaMod>2020-02-02</FechaUltimaMod></BajaEficiencia></BE>'

select * from [AswSch].[AswBitBitacoraBajaEficiencia]

rollback tran
*/

/*XML
<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<BE>
	<BajaEficiencia>
		<IdBajaEficiencia>1</IdBajaEficiencia>
		<ClaUbicacion>68</ClaUbicacion>
		<IdCelda>4</IdCelda>
		<FechaAdmSCADA>2020-02-02</FechaAdmSCADA>
		<ClaTurno>1</ClaTurno>
		<Hora>10</Hora>
		<FechaHoraInicial>2020-02-02</FechaHoraInicial>
		<FechaHoraFinal>2020-02-02</FechaHoraFinal>
		<IdUsuario/>
		<VelocidaObjetivo/>
		<VelocidadReal/>
		<PorcentajeTolerancia/>
		<ClaBajaEfciencia/>
		<ClaEstatusReplica>1</ClaEstatusReplica>
		<BajaLogica>0</BajaLogica>
		<FechaBajaLogica/>
		<ClaUsuarioMod>0</ClaUsuarioMod>
		<NombrePCMod>mrc</NombrePCMod>
		<FechaUltimaMod>2020-02-02</FechaUltimaMod>
	</BajaEficiencia>
</BE>
*/
ALTER PROCEDURE [AswSch].[ASW_CU504_Pag1_ActualizacionBajaEficiencia_Proc]
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
		IdBajaEficiencia INT,
		ClaEstatusReplica INT--control para interfaz con MCSW (1 cambio, 2 replicado)
	)
	
	DECLARE @nId INT,
		@nIdBajaEficiencia INT,
		@nClaUbicacion INT,
		@sIdCelda varchar(30),
		@tFechaAdmSCADA DATETIME,
		@nClaTurno INT,
		@nHora TINYINT,
		@tFechaHoraInicial DATETIME,
		@tFechaHoraFinal DATETIME,
		@nIdUsuario INT,
		@nVelocidaObjetivo SMALLINT,
		@nVelocidadReal SMALLINT,
		@nPorcentajeTolerancia NUMERIC(5, 2),
		@nClaBajaEfciencia SMALLINT,
		@nClaEstatusReplica TINYINT,
		@nBajaLogica INT,
		@tFechaBajaLogica DATETIME,
		@nClaUsuarioMod INT,
		@sNombrePCMod VARCHAR(64),
		@tFechaUltimaMod DATETIME

	DECLARE @BajaEficiencia TABLE(
		Id INT IDENTITY,
		[IdBajaEficiencia] INT,
		[ClaUbicacion] INT,
		[IdCelda] SMALLINT,
		[FechaAdmSCADA] DATETIME,
		[ClaTurno] INT,
		[Hora] TINYINT,
		[FechaHoraInicial] DATETIME,
		[FechaHoraFinal] DATETIME,
		[IdUsuario] INT,
		[VelocidaObjetivo] SMALLINT,
		[VelocidadReal] SMALLINT,
		[PorcentajeTolerancia] NUMERIC(5, 2),
		[ClaBajaEfciencia] SMALLINT,
		[ClaEstatusReplica] TINYINT,
		[BajaLogica] INT,
		[FechaBajaLogica] DATETIME,
		[ClaUsuarioMod] INT,
		[NombrePCMod] VARCHAR(64),
		[FechaUltimaMod] DATETIME
	)

	EXEC @PrepareXmlStatus= sp_xml_preparedocument @handle OUTPUT, @xml  
	
	INSERT INTO @BajaEficiencia( [IdBajaEficiencia]
      ,[ClaUbicacion]
      ,[IdCelda]
      ,[FechaAdmSCADA]
      ,[ClaTurno]
      ,[Hora]
      ,[FechaHoraInicial]
      ,[FechaHoraFinal]
      ,[IdUsuario]
      ,[VelocidaObjetivo]
      ,[VelocidadReal]
      ,[PorcentajeTolerancia]
      ,[ClaBajaEfciencia]
      ,[ClaEstatusReplica]
      ,[BajaLogica]
      ,[FechaBajaLogica]
      ,[ClaUsuarioMod]
      ,[NombrePCMod]
      ,[FechaUltimaMod]
	)
	SELECT [IdBajaEficiencia]
      ,[ClaUbicacion]
      ,[IdCelda]
      ,[FechaAdmSCADA]
      ,[ClaTurno]
      ,[Hora]
      ,[FechaHoraInicial]
      ,[FechaHoraFinal]
      ,[IdUsuario]
      ,[VelocidaObjetivo]
      ,[VelocidadReal]
      ,CAST(NULLIF([PorcentajeTolerancia],'') AS NUMERIC(5, 2))
      ,[ClaBajaEfciencia]
      ,[ClaEstatusReplica]
      ,[BajaLogica]
      ,[FechaBajaLogica]
      ,[ClaUsuarioMod]
      ,[NombrePCMod]
      ,[FechaUltimaMod]
	FROM    OPENXML(@handle, '/BE/BajaEficiencia', 2)  
		WITH (
		[IdBajaEficiencia] INT,
		[ClaUbicacion] INT,
		[IdCelda] SMALLINT,
		[FechaAdmSCADA] DATETIME,
		[ClaTurno] INT,
		[Hora] TINYINT,
		[FechaHoraInicial] DATETIME,
		[FechaHoraFinal] DATETIME,
		[IdUsuario] INT,
		[VelocidaObjetivo] SMALLINT,
		[VelocidadReal] SMALLINT,
		[PorcentajeTolerancia] VARCHAR(6),--NUMERIC(5, 2),
		[ClaBajaEfciencia] SMALLINT,
		[ClaEstatusReplica] TINYINT,
		[BajaLogica] INT,
		[FechaBajaLogica] DATETIME,
		[ClaUsuarioMod] INT,
		[NombrePCMod] VARCHAR(64),
		[FechaUltimaMod] DATETIME
		)  

	EXEC sp_xml_removedocument @handle 

	--select * from @BajaEficiencia

	--inicializo la tabla de respuestas
	--la bd local solo actualizara los campos no nulos
	INSERT INTO @tResultado (IdBajaEficiencia, ClaEstatusReplica)
	SELECT IdBajaEficiencia
		,2 --replicado
	FROM @BajaEficiencia

	
	SELECT @nId = MIN (Id)
	FROM @BajaEficiencia
	
	WHILE @nId IS NOT NULL
	BEGIN
		SELECT 
			@nIdBajaEficiencia = IdBajaEficiencia 
			,@nClaUbicacion = ClaUbicacion
			,@sIdCelda = IdCelda
			,@tFechaAdmSCADA = FechaAdmSCADA
			,@nClaTurno = ClaTurno
			,@nHora = Hora
			,@tFechaHoraInicial = FechaHoraInicial
			,@tFechaHoraFinal = FechaHoraFinal
			,@nIdUsuario = IdUsuario
			,@nVelocidaObjetivo = VelocidaObjetivo
			,@nVelocidadReal = VelocidadReal
			,@nPorcentajeTolerancia = PorcentajeTolerancia
			,@nClaBajaEfciencia = ClaBajaEfciencia		
			,@nClaEstatusReplica = ClaEstatusReplica 
			,@nBajaLogica = BajaLogica 
			,@tFechaBajaLogica = FechaBajaLogica 
			,@nClaUsuarioMod = ClaUsuarioMod 
			,@sNombrePcMod = NombrePcMod 
			,@tFechaUltimaMod = FechaUltimaMod 
		FROM @BajaEficiencia
		WHERE Id = @nId

		--Inserto el registro en la tabla con la informacion original
		EXEC [AswSch].[ASW_CU504_Pag1_BitacoraBajaEficiencia_IU]
			@nIdBajaEficiencia,
			@nClaUbicacion,
			@sIdCelda,
			@tFechaAdmSCADA,
			@nClaTurno,
			@nHora,
			@tFechaHoraInicial,
			@tFechaHoraFinal,
			@nIdUsuario,
			@nVelocidaObjetivo,
			@nVelocidadReal,
			@nPorcentajeTolerancia,
			@nClaBajaEfciencia,
			@nClaEstatusReplica,
			@nBajaLogica,
			@tFechaBajaLogica,
			@nClaUsuarioMod,
			@sNombrePCMod,
			@tFechaUltimaMod

		----------------------------------------------------------
		SELECT @nId = MIN (Id)
		FROM @BajaEficiencia
		WHERE Id>@nId
	END

	SELECT IdBajaEficiencia
		,ClaEstatusReplica
	FROM @tResultado

	

END
