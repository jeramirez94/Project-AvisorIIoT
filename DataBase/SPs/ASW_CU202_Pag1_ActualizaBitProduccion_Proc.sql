--USE [ASW]
--GO
/****** Object:  StoredProcedure [AswSch].[ASW_CU202_Pag1_ActualizaBitProduccion_Proc]    Script Date: 15/11/2022 02:09:26 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROC [AswSch].[ASW_CU202_Pag1_ActualizaBitProduccion_Proc]
	@xml XML
AS
BEGIN

	DECLARE @handle INT
	DECLARE @PrepareXmlStatus INT

	DECLARE  @ErrorMessage  NVARCHAR(4000)
			,@ErrorSeverity INT
			,@ErrorState    INT	= 0

	DECLARE @tResultado TABLE(
			IdBitProduccion INT,
			ClaEstatusReplica INT,--control para interfaz con MCSW (1 cambio, 2 replicado)
			IdCelda VARCHAR(30)
	)

	DECLARE @nId INT
      ,@nClaUbicacion INT
      ,@nIdBitProduccion INT
      ,@sIdCelda VARCHAR(30)
      ,@nIdComponente VARCHAR(30)
      ,@nIdPO INT
      ,@nIdCaja INT
      ,@nClaArticulo INT
      ,@sClaveCorte VARCHAR(15)
      ,@tFechaHoraInicio DATETIME
      ,@tFechaHoraFin DATETIME
      ,@nDuracionSegundos  INT
      ,@nClavosInicio INT
      ,@nClavosFin INT
      ,@nCajasInicio INT
      ,@nCajasFin INT
      ,@nCajasXHora NUMERIC(8,2)
      ,@nClaTurno INT
      ,@tFechaAdm DATETIME
      ,@nHora INT
      ,@nClaEstatusReplica INT
      ,@nBajaLogica INT
      ,@tFechaBajaLogica DATETIME
      ,@nClaUsuarioMod INT
      ,@sNombrePCMod VARCHAR(64)
      ,@tFechaUltimaMod DATETIME

	DECLARE @BitProduccion TABLE (
	   Id INT IDENTITY
      ,ClaUbicacion INT
      ,IdBitProduccion INT
      ,IdCelda VARCHAR(30)
      ,IdComponente VARCHAR(30)
      ,IdPO INT
      ,IdCaja INT
      ,ClaArticulo INT
      ,ClaveCorte VARCHAR(15)
      ,FechaHoraInicio DATETIME
      ,FechaHoraFin DATETIME
      ,DuracionSegundos  INT
      ,ClavosInicio INT
      ,ClavosFin INT
      ,CajasInicio INT
      ,CajasFin INT
      ,CajasXHora NUMERIC(8,2)
      ,ClaTurno INT
      ,FechaAdm DATETIME
      ,Hora INT
      ,ClaEstatusReplica INT
      ,BajaLogica INT
      ,FechaBajaLogica DATETIME
      ,ClaUsuarioMod INT
      ,NombrePCMod VARCHAR(64)
      ,FechaUltimaMod DATETIME
	)
     
	EXEC @PrepareXmlStatus= sp_xml_preparedocument @handle OUTPUT, @xml
	
	INSERT INTO @BitProduccion ([ClaUbicacion]
			   ,[IdBitProduccion]
			   ,[IdCelda]
			   ,[IdComponente]
			   ,[IdPO]
			   ,[IdCaja]
			   ,[ClaArticulo]
			   ,[ClaveCorte]
			   ,[FechaHoraInicio]
			   ,[FechaHoraFin]
			   ,[DuracionSegundos]
			   ,[ClavosInicio]
			   ,[ClavosFin]
			   ,[CajasInicio]
			   ,[CajasFin]
			   ,[CajasXHora]
			   ,[ClaTurno]
			   ,[FechaAdm]
			   ,[Hora]
			   ,[ClaEstatusReplica]
			   ,[BajaLogica]
			   ,[FechaBajaLogica]
			   ,[ClaUsuarioMod]
			   ,[NombrePCMod]
			   ,[FechaUltimaMod]
	)
	SELECT		[ClaUbicacion]
			   ,[IdBitProduccion]
			   ,[IdCelda]
			   ,[IdComponente]
			   ,[IdPO]
			   ,[IdCaja]
			   ,[ClaArticulo]
			   ,[ClaveCorte]
			   ,REPLACE(FechaHoraInicio, CHAR(13) + CHAR(10)  , ' ')
			   ,REPLACE(FechaHoraFin, CHAR(13) + CHAR(10)  , ' ')
			   ,CAST(NULLIF([DuracionSegundos],'') AS INT)
			   ,[ClavosInicio]
			   ,[ClavosFin]
			   ,[CajasInicio]
			   ,[CajasFin]
			   ,CAST(NULLIF([CajasXHora],'') AS NUMERIC(8,2))
			   ,[ClaTurno]
			   ,REPLACE([FechaAdm], CHAR(13) + CHAR(10)  , ' ')
			   ,[Hora]
			   ,[ClaEstatusReplica]
			   ,[BajaLogica]
			   ,REPLACE([FechaBajaLogica], CHAR(13) + CHAR(10)  , ' ')
			   ,[ClaUsuarioMod]
			   ,[NombrePCMod]
			   ,REPLACE([FechaUltimaMod], CHAR(13) + CHAR(10)  , ' ')
	FROM    OPENXML(@handle, '/BitProduccion/Produccion', 2)   
	WITH(  ClaUbicacion INT
		  ,IdBitProduccion INT
		  ,IdCelda VARCHAR(30)
		  ,IdComponente VARCHAR(30)
		  ,IdPO INT
		  ,IdCaja INT
		  ,ClaArticulo INT
		  ,ClaveCorte VARCHAR(15)
		  ,FechaHoraInicio DATETIME
		  ,FechaHoraFin DATETIME
		  ,DuracionSegundos VARCHAR(15)
		  ,ClavosInicio INT
		  ,ClavosFin INT
		  ,CajasInicio INT
		  ,CajasFin INT
		  ,CajasXHora varchar(15)
		  ,ClaTurno INT
		  ,FechaAdm DATETIME
		  ,Hora INT
		  ,ClaEstatusReplica INT
		  ,BajaLogica INT
		  ,FechaBajaLogica DATETIME
		  ,ClaUsuarioMod INT
		  ,NombrePCMod VARCHAR(64)
		  ,FechaUltimaMod DATETIME)

	EXEC sp_xml_removedocument @handle 

	--select * from @BitProduccion

	--inicializo la tabla de respuestas
	--la bd local solo actualizara los campos no nulos
	INSERT INTO @tResultado (IdBitProduccion, ClaEstatusReplica,IdCelda)
	SELECT IdBitProduccion
		,2 --replicado
		,IdCelda
	FROM  @BitProduccion

	SELECT @nId = MIN (Id)
	FROM @BitProduccion

	WHILE @nId IS NOT NULL
	BEGIN
		SELECT @nClaUbicacion = ClaUbicacion
			  ,@nIdBitProduccion  = IdBitProduccion
			  ,@sIdCelda = IdCelda
			  ,@nIdComponente = IdComponente
			  ,@nIdPO = IdPO
			  ,@nIdCaja = IdCaja
			  ,@nClaArticulo = ClaArticulo
			  ,@sClaveCorte = ClaveCorte
			  ,@tFechaHoraInicio = FechaHoraInicio
			  ,@tFechaHoraFin = FechaHoraFin
			  ,@nDuracionSegundos = DuracionSegundos
			  ,@nClavosInicio = ClavosInicio
			  ,@nClavosFin = ClavosFin
			  ,@nCajasInicio = CajasInicio
			  ,@nCajasFin = CajasFin
			  ,@nCajasXHora = CajasXHora
			  ,@nClaTurno = ClaTurno
			  ,@tFechaAdm = FechaAdm
			  ,@nHora = Hora 
			  ,@nClaEstatusReplica = ClaEstatusReplica
			  ,@nBajaLogica = BajaLogica
			  ,@tFechaBajaLogica = FechaBajaLogica
			  ,@nClaUsuarioMod = ClaUsuarioMod
			  ,@sNombrePCMod = NombrePCMod
			  ,@tFechaUltimaMod = FechaUltimaMod
		FROM @BitProduccion
		WHERE Id = @nId
		BEGIN TRY
			EXEC [AswSch].[ASW_CU202_Pag1_ActualizaBitProduccion_IU] 
			   @nClaUbicacion
			  ,@nIdBitProduccion 
			  ,@sIdCelda
			  ,@nIdComponente
			  ,@nIdPO
			  ,@nIdCaja
			  ,@nClaArticulo
			  ,@sClaveCorte
			  ,@tFechaHoraInicio
			  ,@tFechaHoraFin
			  ,@nDuracionSegundos
			  ,@nClavosInicio
			  ,@nClavosFin
			  ,@nCajasInicio
			  ,@nCajasFin
			  ,@nCajasXHora
			  ,@nClaTurno
			  ,@tFechaAdm
			  ,@nHora
			  ,@nClaEstatusReplica
			  ,@nBajaLogica
			  ,@tFechaBajaLogica
			  ,@nClaUsuarioMod
			  ,@sNombrePCMod
			  ,@tFechaUltimaMod
		END TRY

		BEGIN CATCH
		 SET @ErrorState = 1
		END CATCH

		SELECT @nId = MIN (Id)
		FROM @BitProduccion
		WHERE Id>@nId

	END

	select * from @tResultado 
	

END



