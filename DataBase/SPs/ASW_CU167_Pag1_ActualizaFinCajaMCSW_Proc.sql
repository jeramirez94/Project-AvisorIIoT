--USE [ASW]
--GO
/****** Object:  StoredProcedure [AswSch].[ASW_CU167_Pag1_ActualizaFinCajaMCSW_Proc]    Script Date: 15/11/2022 12:15:42 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROC [AswSch].[ASW_CU167_Pag1_ActualizaFinCajaMCSW_Proc]
	@xml XML
AS
BEGIN

	DECLARE @handle INT
	DECLARE @PrepareXmlStatus INT

	DECLARE  @ErrorMessage  NVARCHAR(4000)
			,@ErrorSeverity INT
			,@ErrorState    INT	= 0

	DECLARE @tResultado TABLE(
			IdPo INT,
			IdUnidadCaja INT,
			ClaEstatusReplica INT,--control para interfaz con MCSW (1 cambio, 2 replicado)
			IdCelda VARCHAR(30)
		
	)

	DECLARE @nId                   INT,
			@nClaUbicacion         INT,
			@nClaCelda             VARCHAR(30),
			@nClaMaquina           INT,
			@nClaTurno             INT,
			@nIdUsuario            INT,
			@nIdPO                 INT,
			@nClavePO				INT,
			@nIdUnidadCaja         INT,
			@nClaArticulo          INT,
			@dFechaInicioReal      DATETIME,
			@dFechaFinReal         DATETIME,
			@nIdMateriaPrimaInicio INT,
			@nIdMateriaPrimaFin    INT,
			@nClaEstatus    INT,
			@nClaEstatusReplica    INT,
			@dFechaUltimaMod       DATETIME,
			@nClaUsuarioMod        INT,
			@sNombrePcMod          VARCHAR (64),
			@nEsCajaManual         INT

	DECLARE @FinCaja TABLE (
	 Id                   INT,
	 ClaUbicacion         INT,
	 ClaCelda             VARCHAR(30),
     ClaMaquina           INT,
     ClaTurno             INT,
     IdUsuario            INT,
     IdPO                 INT,
	 ClavePO				INT,
     IdUnidadCaja         INT,
     ClaArticulo          INT,
     FechaInicioReal      DATETIME,
     FechaFinReal         DATETIME,
     IdMateriaPrimaInicio INT,
     IdMateriaPrimaFin    INT,
     ClaEstatus			  INT,
     ClaEstatusReplica    INT,
     FechaUltimaMod       DATETIME,
     ClaUsuarioMod        INT,
     NombrePcMod          VARCHAR (64),
	 EsCajaManual         INT
	)
     
	EXEC @PrepareXmlStatus= sp_xml_preparedocument @handle OUTPUT, @xml
	
	INSERT INTO @FinCaja (
		    [Id]	
		   ,[ClaUbicacion]
           ,[ClaCelda]
           ,[ClaMaquina]
           ,[ClaTurno]
           ,[IdUsuario]
           ,[IdPO]
		   ,[ClavePO]
           ,[IdUnidadCaja]
           ,[ClaArticulo]
           ,[FechaInicioReal]
           ,[FechaFinReal]
           ,[IdMateriaPrimaInicio]
           ,[IdMateriaPrimaFin]
           ,[ClaEstatus]
           ,[ClaEstatusReplica]
           ,[FechaUltimaMod]
           ,[ClaUsuarioMod]
           ,[NombrePcMod]
		   ,[EsCajaManual]
	)
	SELECT	row_number() over (order by IdUnidadCaja) as Id
		   ,[ClaUbicacion]
           ,[ClaCelda]
           ,[ClaMaquina]
           ,[ClaTurno]
           ,[IdUsuario]
           ,[IdPO]
		   ,[ClavePO]
           ,[IdUnidadCaja]
           ,[ClaArticulo]
           ,REPLACE([FechaInicioReal], CHAR(13) + CHAR(10)  , ' ')
           ,REPLACE([FechaFinReal], CHAR(13) + CHAR(10)  , ' ')
           ,[IdMateriaPrimaInicio]
           ,[IdMateriaPrimaFin]
           ,[ClaEstatus]
           ,[ClaEstatusReplica]
           ,REPLACE([FechaUltimaMod], CHAR(13) + CHAR(10)  , ' ')
           ,[ClaUsuarioMod]
           ,[NombrePcMod]
		   ,[EsCajaManual]
		   
	FROM    OPENXML(@handle, '/Produccion/FinCaja', 2)   
	WITH(   ClaUbicacion         INT,
			ClaCelda             VARCHAR(30),
			ClaMaquina           INT,
			ClaTurno             INT,
			IdUsuario            INT,
			IdPO                 INT,
			ClavePO				INT,
			IdUnidadCaja         INT,
			ClaArticulo          INT,
			FechaInicioReal      DATETIME,
			FechaFinReal         DATETIME,
			IdMateriaPrimaInicio INT,
			IdMateriaPrimaFin    INT,
			ClaEstatus			 INT,
			ClaEstatusReplica    INT,
			FechaUltimaMod       DATETIME,
			ClaUsuarioMod        INT,
			NombrePcMod          VARCHAR (64),
			EsCajaManual         INT
			
	 )

	EXEC sp_xml_removedocument @handle 

	--select * from @FinCaja

	--inicializo la tabla de respuestas
	--la bd local solo actualizara los campos no nulos

	INSERT INTO @tResultado (IdPo, IdUnidadCaja,ClaEstatusReplica,IdCelda)
	SELECT   IdPO
			,IdUnidadCaja
			,2 --replicado
			,ClaCelda
	FROM  @FinCaja

	SELECT @nId = MIN (Id)
	FROM @FinCaja

	WHILE @nId IS NOT NULL
	BEGIN
		SELECT 
		    @nClaUbicacion         = [ClaUbicacion]
           ,@nClaCelda             = [ClaCelda]
           ,@nClaMaquina           = [ClaMaquina]
           ,@nClaTurno             = [ClaTurno]
           ,@nIdUsuario            = [IdUsuario]
           ,@nIdPO                 = [IdPO]
		   ,@nClavePO				=[ClavePO]
           ,@nIdUnidadCaja         = [IdUnidadCaja]
           ,@nClaArticulo          = [ClaArticulo]
           ,@dFechaInicioReal      = [FechaInicioReal]
           ,@dFechaFinReal         = [FechaFinReal]
           ,@nIdMateriaPrimaInicio = [IdMateriaPrimaInicio]
           ,@nIdMateriaPrimaFin    = [IdMateriaPrimaFin]
           ,@nClaEstatus		   = [ClaEstatus]
           ,@nClaEstatusReplica    = [ClaEstatusReplica]
           ,@dFechaUltimaMod       = [FechaUltimaMod]
           ,@nClaUsuarioMod        = [ClaUsuarioMod]
           ,@sNombrePcMod          = [NombrePcMod]
		   ,@nEsCajaManual         = [EsCajaManual]
	
		FROM @FinCaja
		WHERE Id = @nId
		BEGIN TRY
			EXEC [AswSch].[ASW_CU167_Pag1_ActualizaFinCajaASW_IU]
			  @nClaUbicacion         ,
			  @nClaCelda             ,
			  @nClaMaquina           ,
			  @nClaTurno             ,
			  @nIdUsuario            ,
			  @nIdPO                 , 
			  @nClavePO				,
			  @nIdUnidadCaja         ,
			  @nClaArticulo          ,
			  @dFechaInicioReal      ,
			  @dFechaFinReal         ,
			  @nIdMateriaPrimaInicio ,
			  @nIdMateriaPrimaFin    ,
			  @nClaEstatus		     ,
			  @nClaEstatusReplica    ,
			  @dFechaUltimaMod       ,
			  @nClaUsuarioMod        ,
			  @sNombrePcMod          ,
			  @nEsCajaManual      
		      

		END TRY

		BEGIN CATCH
		 SET @ErrorState = 1
		END CATCH

		SELECT @nId = MIN (Id)
		FROM @FinCaja
		WHERE Id>@nId

	END

	select * from @tResultado 
	

END


