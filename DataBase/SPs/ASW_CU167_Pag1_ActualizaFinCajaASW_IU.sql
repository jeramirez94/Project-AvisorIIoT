USE [ASW]
GO
/****** Object:  StoredProcedure [AswSch].[ASW_CU167_Pag1_ActualizaFinCajaASW_IU]    Script Date: 15/11/2022 12:14:09 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [AswSch].[ASW_CU167_Pag1_ActualizaFinCajaASW_IU]
	        @pnClaUbicacion         INT,
			@pnClaCelda             INT,
			@pnClaMaquina           INT,
			@pnClaTurno             INT,
			@pnIdUsuario            INT,
			@pnIdPO                 INT,
			@pnClavePO				INT,
			@pnIdUnidadCaja         INT,
			@pnClaArticulo          INT,
			@pdFechaInicioReal      DATETIME,
			@pdFechaFinReal         DATETIME,
			@pnIdMateriaPrimaInicio INT,
			@pnIdMateriaPrimaFin    INT,
			@pnClaEstatus			INT,
			@pnClaEstatusReplica    INT,
			@pdFechaUltimaMod       DATETIME,
			@pnClaUsuarioMod        INT,
			@psNombrePcMod          VARCHAR (64),
			@pnEsCajaManual         INT
AS
BEGIN

--11/02/2020 NGALAZ
--INSERTA O ACTUALIZA LOS REGISTROS 

	IF EXISTS (SELECT 1 FROM [AswSch].[AswTraFinCajaMCSW]
			   WHERE ClaUbicacion = @pnClaUbicacion 
			   AND ClaMaquina = @pnClaMaquina 
			   AND IdPO = @pnIdPO
			   AND IdUnidadCaja = @pnIdUnidadCaja)
	BEGIN
		UPDATE [AswSch].[AswTraFinCajaMCSW]
		   SET [ClaUbicacion] = @pnClaUbicacion
			  ,[ClaCelda] =  @pnClaCelda
			  ,[ClaMaquina] = @pnClaMaquina
			  ,[ClaTurno] = @pnClaTurno
			  ,[IdUsuario] = @pnIdUsuario	
			  ,[IdPO] = @pnIdPO
			  ,[ClavePO] = @pnClavePO
			  ,[IdUnidadCaja] = @pnIdUnidadCaja
			  ,[ClaArticulo] = @pnClaArticulo
			  ,[FechaInicioReal] = @pdFechaInicioReal
			  ,[FechaFinReal] = @pdFechaFinReal
			  ,[IdMateriaPrimaInicio] = @pnIdMateriaPrimaInicio
			  ,[IdMateriaPrimaFin] = @pnIdMateriaPrimaFin
			  ,[ClaEstatus] = @pnClaEstatus 
			  ,[ClaEstatusReplica] = @pnClaEstatusReplica
			  ,[FechaUltimaMod] = @pdFechaUltimaMod
			  ,[ClaUsuarioMod] = @pnClaUsuarioMod
			  ,[NombrePcMod] = @psNombrePcMod
			  ,[EsCajaManual] = @pnEsCajaManual
		 WHERE ClaUbicacion = @pnClaUbicacion 
			   AND ClaMaquina = @pnClaMaquina 
			   AND IdPO = @pnIdPO
			   AND IdUnidadCaja = @pnIdUnidadCaja

	END
	ELSE
	BEGIN
	
		INSERT INTO [AswSch].[AswTraFinCajaMCSW]
				   ([ClaUbicacion]
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
				   ,[EsCajaManual])
			 VALUES
				   (@pnClaUbicacion         ,
					@pnClaCelda             ,
					@pnClaMaquina           ,
					@pnClaTurno             ,
					@pnIdUsuario            ,
					@pnIdPO                 , 
					@pnClavePO				,
					@pnIdUnidadCaja         ,
					@pnClaArticulo          ,
					@pdFechaInicioReal      ,
					@pdFechaFinReal         ,
					@pnIdMateriaPrimaInicio ,
					@pnIdMateriaPrimaFin    ,
					@pnClaEstatus			,
					@pnClaEstatusReplica    ,
					@pdFechaUltimaMod       ,
					@pnClaUsuarioMod        ,
					@psNombrePcMod          ,
					@pnEsCajaManual
					)



	END 
END