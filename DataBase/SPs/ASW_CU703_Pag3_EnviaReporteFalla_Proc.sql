--USE [ASW]
--GO
/****** Object:  StoredProcedure [AswSch].[ASW_CU703_Pag3_EnviaReporteFalla_Proc]    Script Date: 15/11/2022 04:07:20 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
BEGIN TRAN
	EXEC [AswSch].[ASW_CU703_Pag3_EnviaReporteFalla_Proc] 68
	SELECT * FROM  [AswSch].[AswMtoTraReporteFalla] WHERE ClaEstatusReplica=2
ROLLBACK TRAN 
*/

ALTER PROCEDURE [AswSch].[ASW_CU703_Pag3_EnviaReporteFalla_Proc]
(
	@PnClaUbicacion		int
)
AS

BEGIN
SET NOCOUNT ON

	DECLARE
		@nId					int
		,@nIdReporteFalla int
		,@sIdCelda varchar(30)
		,@nClaTurno int
		,@nClaGpoEquipo		int
		,@nClaEquipo			int
		,@nClaSistema			int
		,@nClaSubSistema		int
		,@nClaRcmFuncion			int
		,@nClaRcmFuncionFalla		int
		,@nFechaAdmScada datetime
		,@tFechaReporte DATETIME
		,@nClaUsuarioMod		int	
		,@tFechaProgramacion	DATETIME
		,@nClaSistemaOrigen	INT
		,@nClaReporteFalla	INT
		,@nExitosoSN			INT
		,@nIdOtNueva			INT
		,@sMsgError			VARCHAR(500)


	DECLARE @ReporteFalla TABLE
	(
		[Id] [int] NOT NULL,
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

	INSERT @ReporteFalla
	(
		[Id]
		,[IdReporteFalla]
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
	SELECT [Id] 
		,[IdReporteFalla]
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
	FROM [AswSch].[AswMtoTraReporteFalla]
	WHERE ClaUbicacion = @PnClaUbicacion 
		AND	[ClaEstatusReplica] = 1
		AND FechaUltimaMod > dateadd(week, -2, getdate())

	SET @nClaSistemaOrigen = 181

	SELECT	@nId = MIN([Id])
	FROM	@ReporteFalla
	
	WHILE @nId IS NOT NULL
	BEGIN

	SELECT	 @nId = Id
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
			,@nClaUsuarioMod = ClaUsuarioMod
		FROM	@ReporteFalla
		WHERE	Id = @nId
	
		BEGIN TRY
			EXEC [MTO_LNKSRV].[Operacion].[MtoSch].[MTO_MtoReportarFalla_Srv]
			--SELECT
				@pnClaUbicacion = @pnClaUbicacion,
				@pnClaEquipo = @nClaEquipo,
				@pnClaSistema = @nClaSistema,
				@pnClaSubsistema = @nClaSubSistema,
				@pnClaFuncion = @nClaRcmFuncion,
				@pnClaFuncionFalla = @nClaRcmFuncionFalla,
				@pnClaEfectoFalla = NULL,
				@psEfectoFalla = '',
				@pnClaModoFalla = NULL,
				@pnClaActividad = NULL,
				@pnClaTipoMantenimiento = NULL,
				@pnClaResponsable = NULL,
				@pnClaSistemaOrigen = @nClaSistemaOrigen,
				@pnGenerarOtSN = 0,
				@pnNuevoefecto = 0,
				@pdFechaSaleOperacion = @tFechaReporte,
				@pnClaUsuarioMod = @nClaUsuarioMod,
				@psNombrePcMod = 'AVISOR',
				@ptFechaProgramacion = @tFechaProgramacion OUTPUT, 
				@pnClaReporteFalla = @nClaReporteFalla OUTPUT,
				@pnExitosoSN = @nExitosoSN OUTPUT,
				@pnIdOt = @nIdOtNueva OUTPUT,
				@psMsgError = @sMsgError OUTPUT


			UPDATE	[AswSch].[AswMtoTraReporteFalla]
			SET		Error = @sMsgError
			WHERE	Id = @nId

			IF @nExitosoSN = 1 --@nClaEstatusOt in (2,3)
			BEGIN
				UPDATE	[AswSch].[AswMtoTraReporteFalla]
				SET	ClaEstatusReplica = 2
					,FechaProgramacion = @tFechaProgramacion
					,ClaReporteFalla = @nClaReporteFalla
					,IdOt = @nIdOtNueva
				WHERE	Id = @nId
			END
		END TRY
		BEGIN CATCH
			SELECT @sMsgError = ERROR_MESSAGE()
			RAISERROR(@sMsgError,16,1)


			UPDATE	[AswSch].[AswMtoTraReporteFalla]
			SET		Error = @sMsgError
			WHERE	Id = @nId

		END CATCH	
		
		SELECT	@nId = MIN(Id)
		FROM	@ReporteFalla
		WHERE	Id > @nId
	END
	
SET NOCOUNT OFF
END
