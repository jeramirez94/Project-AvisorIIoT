USE [ASW]
GO
/****** Object:  StoredProcedure [AswSch].[ASW_CU705_Pag1_EnviaActualizacionAutonomo_Proc]    Script Date: 15/11/2022 04:09:38 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*
BEGIN TRAN
	EXEC [AswSch].[ASW_CU705_Pag1_EnviaActualizacionAutonomo_Proc] 68, 1
	SELECT * from [AswSch].[AswMtoTraOTActividad] where claEstatusReplica=1
	SELECT * from [AswSch].[AswMtoTraOTActividad] where claEstatusReplica=2
ROLLBACK TRAN
*/

ALTER PROCEDURE [AswSch].[ASW_CU705_Pag1_EnviaActualizacionAutonomo_Proc]
(
	@PnClaUbicacion		int
	,@pnDebug int = 0
)
AS
DECLARE @nRow int,
		@pnIdOt INT,
		@pnClaActividad INT,
		@pnClaActividadPaso INT,
		@pnClaVariable INT,
		@pnEsRealizada INT,
		@pnValorReal NUMERIC(22,2),
		@pnClaActividadD INT,
		@psNombrePcMod VARCHAR(64),
		@pnClaUsuarioMod INT,
		@pdFechaInicio DATETIME,
		@pdFechaFin DATETIME

	DECLARE @nClaEstatusOt INT
	DECLARE @nIdOtNuevaDerivada INT
	DECLARE @nExitoso INT
	DECLARE @sNomEstatusOT VARCHAR(50)
	DECLARE @nGeneraDerivadaSN INT
	DECLARE @sError	VARCHAR(250)
	DECLARE @nClaTipoVariable INT
BEGIN
SET NOCOUNT ON

	DECLARE @prodMtoAutonomoResultado TABLE
	(
		renglon			int identity(1,1)
		,ClaUbicacion	int
		,IdOt			int
		,ClaActividad	int
		,ClaActividadPaso	int 
		,ClaVariable	int 
		,ClaTipoVariable	int
		,EsRealizada	int
		,ValorReal		numeric(19,4)
		,GeneraDerivasaSN	int
		,ClaActividadD	int
		,NombrePcMod	varchar(250)
		,ClaUsuarioMod	int
		--,ClaEstatusOt	int
		--,NomEstatusOt	varchar(250)
		,IdOtNuevaDerivada	int
		--,Exitoso		int
		,FechaIns		datetime
		,EnviadaSN		int
	)

	INSERT @prodMtoAutonomoResultado
	(
		ClaUbicacion
		,IdOt
		,ClaActividad
		,ClaActividadPaso
		,ClaVariable
		,ClaTipoVariable
		,EsRealizada
		,ValorReal
		,GeneraDerivasaSN
		,ClaActividadD
		,NombrePcMod
		,ClaUsuarioMod
		--,ClaEstatusOt
		--,NomEstatusOt
		,IdOtNuevaDerivada
		--,Exitoso
		,FechaIns
		,EnviadaSN
	)
	SELECT A.[ClaUbicacion]
      ,A.[IdOt]
      ,A.[ClaActividad]
      ,AP.[ClaActividadPaso]
      ,AV.[ClaVariable]
      ,AV.[ClaTipoVariable]
      ,AP.[EsRealizada]
      ,AV.[ValorReal]
      ,A.[GeneraDerivadaSN]
      ,AD.[ClaActividadD]--como sacar solo la derivada?
      ,A.[NombrePcMod]
      ,A.[ClaUsuarioMod]
      --,[ClaEstatusOt]
      --,[NomEstatusOt]
      ,A.[IdOtDerivada]
      --,A.[Exitoso]
      ,AP.[FechaUltimaMod]
      ,A.[ClaEstatusReplica]
	FROM [AswSch].[AswMtoTraOTActividad] A
	LEFT JOIN [AswSch].[AswMtoTraOTActividadPaso] AP
		ON A.ClaUbicacion = AP.ClaUbicacion
		AND A.IdOt = AP.IdOt
		AND A.ClaActividad = AP.ClaActividad
	LEFT JOIN [AswSch].[AswMtoTraOTActividadVariable] AV
		ON AP.ClaUbicacion = AV.ClaUbicacion
		AND AP.IdOt = AV.IdOt
		AND AP.ClaActividad = AV.ClaActividad
		AND AP.ClaActividadPaso = AV.ClaActividadPaso
	JOIN [AswSch].[AswMtoTraOTActividadDerivada] AD
		ON A.ClaUbicacion = AD.ClaUbicacion
		AND A.IdOt = AD.IdOt
		AND A.ClaActividad = AD.ClaActividad
	WHERE A.ClaUbicacion = 68--@PnClaUbicacion 
		AND	A.[ClaEstatusReplica] = 1
		AND A.FechaUltimaMod > dateadd(week, -2, getdate())
	--SELECT	 ClaUbicacion
	--		,IdOt
	--		,ClaActividad
	--		,ClaActividadPaso
	--		,ClaVariable
	--		,ClaTipoVariable
	--		,EsRealizada
	--		,ValorReal
	--		,GeneraDerivasaSN
	--		,ClaActividadD
	--		,NombrePcMod
	--		,ClaUsuarioMod
	--		,ClaEstatusOt
	--		,NomEstatusOt
	--		,IdOtNuevaDerivada
	--		,Exitoso
	--		,FechaIns
	--		,EnviadaSN
	--FROM	prodMtoAutonomoResultado WITH(NOLOCK)
	--WHERE	ClaUbicacion = @PnClaUbicacion 
	--	AND	EnviadaSN = 0
	--	AND FechaIns > dateadd(week, -2, getdate())

	SELECT	@nRow = MIN(Renglon)
	FROM	@prodMtoAutonomoResultado
	
	WHILE @nRow IS NOT NULL
	BEGIN

		SELECT	@pnIdOt = IdOt
				,@pnClaActividad = ClaActividad
				,@pnClaActividadPaso = ClaActividadPaso
				,@pnEsRealizada = EsRealizada
				,@pnClaVariable = ClaVariable
				,@nClaTipoVariable = ClaTipoVariable
				,@pnValorReal = ValorReal
				,@nGeneraDerivadaSN = GeneraDerivasaSN
				,@pnClaActividadD = ClaActividadD
				,@psNombrePcMod = NombrePcMod
				,@pnClaUsuarioMod = ClaUsuarioMod
				--,@nClaEstatusOt = ClaEstatusOt
				--,@sNomEstatusOT = NomEstatusOt
				,@nIdOtNuevaDerivada = IdOtNuevaDerivada
				--,@nExitoso = Exitoso
		FROM	@prodMtoAutonomoResultado
		WHERE	renglon = @nRow

		SELECT @pdFechaInicio = MIN(FechaIns),
			   @pdFechaFin = MAX(FechaIns)
		FROM @prodMtoAutonomoResultado
		WHERE IdOt = @pnIdOt
	
		BEGIN TRY
			EXEC [MTO_LNKSRV].[Operacion].[MtoSch].[MtoActualizarEstatusOtAutonomasSrv] 
				@pnClaUbicacion			= @pnClaUbicacion
				,@pnIdOt				= @pnIdOt
				,@pnClaActividad		= @pnClaActividad
				,@pnClaActividadPaso	= @pnClaActividadPaso
				,@pnEsRealizada			= @pnEsRealizada
				,@pnClaVariable			= @pnClaVariable
				,@pnClaTipoVariable		= @nClaTipoVariable
				,@pnValorReal			= @pnValorReal
				,@pnGeneraDerivasaSN	= @nGeneraDerivadaSN
				,@pnClaActividadD		= @pnClaActividadD
				,@psNombrePcMod			= @psNombrePcMod
				,@pnClaUsuarioMod		= @pnClaUsuarioMod--TODO: asociar usuarios o quitar validacion en MTD... @pnClaUsuarioMod = 2271208
				,@pnClaEstatusOt		= @nClaEstatusOt out
				,@psNomEstatusOt		= @sNomEstatusOT out
				,@pnIdOtNuevaDerivada	= @nIdOtNuevaDerivada out
				,@pnExitoso				= @nExitoso out
				,@ptFechaHoraInicio		= @pdFechaInicio
				,@ptFechaHoraFin		= @pdFechaFin
			IF @pnDebug = 1
				SELECT @nClaEstatusOt 'estatusOt', @sNomEstatusOT 'nombre', @nIdOtNuevaDerivada 'OtNueva', @nExitoso 'exitoso', @nGeneraDerivadaSN 'Genera'

			UPDATE	[AswSch].[AswMtoTraOT]
			SET		ClaEstatusOt = @nClaEstatusOt,
					NomEstatus = @sNomEstatusOT
			WHERE	ClaUbicacion = @pnClaUbicacion
				AND	IdOt = @pnIdOt

			--exitosi devuelve 1 solo si se genera derivada, puede devolver 0 sin que haya error
			--IF @nExitoso = 1 --@nClaEstatusOt in (2,3)
			--BEGIN
				UPDATE	[AswSch].[AswMtoTraOTActividad]
				SET	ClaEstatusReplica = 2
					--,ClaEstatusOt = @nClaEstatusOt 
					--,NomEstatusOt = @sNomEstatusOT
					,IdOtDerivada = @nIdOtNuevaDerivada
					--,Exitoso = @nExitoso
				WHERE	ClaUbicacion = @PnClaUbicacion 
					AND IdOt = @pnIdOt 
					AND ClaActividad = @pnClaActividad 
			--END
		END TRY
		BEGIN CATCH
			SELECT @sError = ERROR_MESSAGE()
			RAISERROR(@sError,16,1)
		END CATCH	
		
		SELECT	@nRow = MIN(Renglon)
		FROM	@prodMtoAutonomoResultado
		WHERE	Renglon > @nRow
	END
	
SET NOCOUNT OFF
END
