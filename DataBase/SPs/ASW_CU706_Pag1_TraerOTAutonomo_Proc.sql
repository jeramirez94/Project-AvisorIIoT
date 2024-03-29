--USE [ASW]
--GO
/****** Object:  StoredProcedure [AswSch].[ASW_CU706_Pag1_TraerOTAutonomo_Proc]    Script Date: 15/11/2022 04:14:57 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
	EXEC	[AswSch].[ASW_CU706_Pag1_TraerOTAutonomo_Proc]
			@PnClaUbicacion		= 68,
			@psIdCelda	= 4,
			@PnClaUsuarioMod	= 0,
			@psNombrePcMod		= 'AVISOR',
			@PdFechaInicio		= '20201227',
			@PdFechaFin			= '20201231'
*/
ALTER PROCEDURE [AswSch].[ASW_CU706_Pag1_TraerOTAutonomo_Proc]
	@PnClaUbicacion		int,
	@psIdCelda	varchar(30),
	@PnClaUsuarioMod	int,
	@psNombrePcMod		varchar(64),
	@PdFechaInicio		datetime = null,
	@PdFechaFin			datetime = null
AS

BEGIN
SET NOCOUNT ON

	DECLARE @nClaEquipo			INT
	DECLARE @sClaveMaquina		VARCHAR(250)
	DECLARE @nIdOT				INT
	DECLARE @nClaActividad		INT
	
	IF OBJECT_ID('tempdb..#tbMtoEquipo') IS NOT NULL
		DROP TABLE #tbMtoEquipo
	IF OBJECT_ID('tempdb..#tbMtoOTAutonomo') IS NOT NULL
		DROP TABLE #tbMtoOTAutonomo
	IF OBJECT_ID('tempdb..#tbMtoOTAutonomoActividad') IS NOT NULL
		DROP TABLE #tbMtoOTAutonomoActividad
	IF OBJECT_ID('tempdb..#tbMtoOTAutonomoActividadPaso') IS NOT NULL
		DROP TABLE #tbMtoOTAutonomoActividadPaso
	IF OBJECT_ID('tempdb..#tbMtoOTAutonomoActividadVariable') IS NOT NULL
		DROP TABLE #tbMtoOTAutonomoActividadVariable
	IF OBJECT_ID('tempdb..#tbMtoOTAutonomoActividadD') IS NOT NULL
		DROP TABLE #tbMtoOTAutonomoActividadD

	CREATE TABLE #tbMtoEquipo
	(
		[ClaEquipo] INT
	)
	CREATE TABLE #tbMtoOTAutonomo
	(
		[ClaUbicacion] [int],
		[IdOt][INT] ,
		[NomGuia][varchar](max) ,
		[ClaEstatusOt][INT] ,
		[NomEstatus] [varchar](250) ,
		[ClaEquipo][INT] ,
		[IdCelda][VARCHAR](30) ,
		[ClaGuia][INT] ,
		[FechaProgInicio] [datetime] ,
		[ClaTurno][INT] ,
		[TiempoEstimado][numeric](19,2) 
	)

	CREATE TABLE #tbMtoOTAutonomoActividad
	(
		[ClaUbicacion] [int] ,
		[IdOt][INT] ,
		[ClaActividad][INT] ,
		[NomSistema][varchar](max) ,
		[NomSubSistema][varchar](max) ,
		[NomActividad][varchar](max) ,
		[EsRealizada][INT] ,
		[TiempoEstimado][numeric](19,2) 
	)

	CREATE TABLE #tbMtoOTAutonomoActividadPaso
	(
		[ClaUbicacion] [int] ,
		[IdOt][INT] ,
		[ClaActividad][INT] ,
		[ClaActividadPaso][INT] ,
		[Paso][varchar](max) ,
		[Descripcion][varchar](max) ,
		[EsRealizada][INT] ,
		[TiempoEstimado][numeric](19,2) 
	)

	CREATE TABLE #tbMtoOTAutonomoActividadVariable
	(
		[ClaUbicacion] [int],
		[IdOt][INT] ,
		[ClaActividad][INT] ,
		[ClaActividadPaso][INT] ,
		[NomDescripcionPaso][varchar](max) ,
		[ClaVariable][INT] ,
		[NomVariable][varchar](max) ,
		[NomUnidadVariable][varchar](250) ,
		[ValorEstandar][numeric](19,2) ,
		[ValorMinimo][numeric](19,2) ,
		[ValorMaximo][numeric](19,2) ,
		[ValorReal][numeric](19,2) ,
		[ClaReferenciaCumple][numeric](19,2) ,
		[NomReferenciaCumple][varchar](250) ,
		[ClaOpcionFija][Real] ,
		[NomOpcionFija][varchar](250) ,
		[ClaTipoVariable][INT] ,
		[Referencia][INT]
	)

	CREATE TABLE #tbMtoOTAutonomoActividadD
	(
		[ClaUbicacion] [int] NOT NULL,
		[IdOt][INT] NOT NULL,
		[ClaActividad][INT] NOT NULL,
		[ClaActividadD][INT] NOT NULL,
		[DescripcionActividadD][varchar](max) NOT NULL,
		[TiempoEstimadoD][numeric](19,2) NOT NULL,
		[RequiereParo] [int] NULL
	)

	CREATE TABLE #tbMtoOTAutonomoActividadD_temp
	(
		[ClaActividadD][INT] NOT NULL,
		[DescripcionActividadD][varchar](max) NOT NULL,
		[SeleccionarD][varchar](30) NULL,
		[TiempoEstimadoD][numeric](19,2) NOT NULL,
		[RequiereParo] [int] NULL
	)
	
	SELECT	@PdFechaInicio = ISNULL(@PdFechaInicio, DATEADD(dd, 0, DATEDIFF(dd, 0, GETDATE()))),
			@PdFechaFin = ISNULL(@PdFechaFin, DATEADD(dd, 1, DATEDIFF(dd, 0, GETDATE())))

	INSERT INTO #tbMtoEquipo (ClaEquipo)
	SELECT ClaEquipo
	FROM [AswSch].[AswRelMtoSubAreaCelda] C
	JOIN [MTO_LNKSRV].Operacion.[MtoSch].[MtoCatEquipo] E
		ON C.ClaUbicacion = E.ClaUbicacion
		AND C.ClaDepartamento = E.ClaDepartamento
		AND C.ClaArea = E.ClaArea
		AND C.ClaSubArea = E.ClaSubArea
	WHERE IdCelda = @psIdCelda

	--SELECT * 
	--FROM [MTO_LNKSRV].Operacion.[MtoSch].[MtoCatEquipo]

	--EXEC	dbo.prodScaPuntoMedicionMtoEquipo_Sel	@PnClaUbicacion = @PnClaUbicacion, 
	--												@PsClavePtoMedicion = @sClaveMaquina, 
	--												@PnClaEquipo = @nClaEquipo OUTPUT, 
	--												@PnOcultaRS = 1
	--SELECT	@nClaEquipo = 2145

	SELECT @nClaEquipo=MIN(ClaEquipo)
	FROM #tbMtoEquipo

	WHILE @nClaEquipo IS NOT NULL
	BEGIN
		INSERT	#tbMtoOTAutonomo(
									[IdOt],
									[NomGuia],
									[ClaEstatusOt],
									[NomEstatus],
									[ClaEquipo],
									[ClaGuia],
									[FechaProgInicio],
									[ClaTurno],
									[TiempoEstimado]
								)
		EXEC [MTO_LNKSRV].Operacion.[MtoSch].[MtoConsultaOtAutonomasSrv] 
				 @pnClaUbicacion = @PnClaUbicacion,
				 @ptFechaIni = @PdFechaInicio,
				 @ptFechaFin = @PdFechaFin,
				 @pnClaEquipo = @nClaEquipo,
				 @pnDataSet = 1, /* 1 para Ot, 2 Actividades, 3 Pasos, 4 Variables */ 
				 @pnIdOt = null,
				 @pnClaActividad = null

		UPDATE	#tbMtoOTAutonomo
		SET		ClaUbicacion = @PnClaUbicacion,
				IdCelda = @psIdCelda

--select * from #tbMtoOTAutonomo
		IF (SELECT count(IdOt) FROM	#tbMtoOTAutonomo) > 0
		BEGIN
		--	--RAISERROR('Sin Ots Autonomas', 16,1);
		--	RETURN;
		--END

			SELECT	@nIdOT = MIN(IdOt)
			FROM	#tbMtoOTAutonomo
			WHERE	ClaEquipo = @nClaEquipo

			WHILE @nIdOt IS NOT NULL
			BEGIN
				INSERT #tbMtoOTAutonomoActividad
				(
					[ClaUbicacion],
					[IdOt],
					[ClaActividad],
					[NomSistema],
					[NomSubSistema],
					[NomActividad],
					[EsRealizada],
					[TiempoEstimado]
				)
				EXEC [MTO_LNKSRV].Operacion.[MtoSch].[MtoConsultaOtAutonomasSrv] 
					 @pnClaUbicacion = @PnClaUbicacion,
					 @ptFechaIni = @PdFechaInicio,    
					 @ptFechaFin = @PdFechaFin,
					 @pnClaEquipo = @nClaEquipo,
					 @pnDataSet = 2, /* 1 para Ot, 2 Actividades, 3 Pasos, 4 Variables */ 
					 @pnIdOt = @nIdOT,
					 @pnClaActividad = null
		
				SELECT	@nClaActividad = MIN(ClaActividad)
				FROM	#tbMtoOTAutonomoActividad
				WHERE	IdOt = @nIdOT
		
				WHILE @nClaActividad IS NOT NULL
				BEGIN
					-------------- PASOS
					INSERT #tbMtoOTAutonomoActividadPaso
					(
						[IdOt],
						[ClaActividad],
						[ClaActividadPaso],
						[Paso],
						[Descripcion],
						[EsRealizada],
						[TiempoEstimado]
					)
					EXEC [MTO_LNKSRV].Operacion.[MtoSch].[MtoConsultaOtAutonomasSrv] 
						 @pnClaUbicacion = @PnClaUbicacion,
						 @ptFechaIni = @PdFechaInicio,    
						 @ptFechaFin = @PdFechaFin,
						 @pnClaEquipo = @nClaEquipo,
						 @pnDataSet = 3, /* 1 para Ot, 2 Actividades, 3 Pasos, 4 Variables */ 
						 @pnIdOt = @nIdOT,
						 @pnClaActividad = @nClaActividad

					-------------- VARIABLES
					INSERT #tbMtoOTAutonomoActividadVariable
					(
						[IdOt],
						[ClaActividad],
						[ClaActividadPaso],
						[NomDescripcionPaso],
						[ClaVariable],
						[NomVariable],
						[NomUnidadVariable],
						[ValorEstandar],
						[ValorMinimo],
						[ValorMaximo],
						[ValorReal],
						[ClaReferenciaCumple],
						[NomReferenciaCumple],
						[ClaOpcionFija],
						[NomOpcionFija],
						[ClaTipoVariable],
						[Referencia]
					)
					EXEC [MTO_LNKSRV].Operacion.[MtoSch].[MtoConsultaOtAutonomasSrv] 
						 @pnClaUbicacion = @PnClaUbicacion,
						 @ptFechaIni = @PdFechaInicio,    
						 @ptFechaFin = @PdFechaFin,
						 @pnClaEquipo = @nClaEquipo,
						 @pnDataSet = 4, /* 1 para Ot, 2 Actividades, 3 Pasos, 4 Variables */ 
						 @pnIdOt = @nIdOT,
						 @pnClaActividad = @nClaActividad
		
				-------------- ACTIVIDAD D
				--TODO:filtrar las actividades para tener solo derivadas
					INSERT #tbMtoOTAutonomoActividadD_temp
					(
						[ClaActividadD],
						[DescripcionActividadD],
						[SeleccionarD],
						[TiempoEstimadoD],
						[RequiereParo]
					)
					EXEC [MTO_LNKSRV].Operacion.[MtoSch].[MtoConsultaOtAutonomasSrv] 
						 @pnClaUbicacion = @PnClaUbicacion,
						 @ptFechaIni = @PdFechaInicio,    
						 @ptFechaFin = @PdFechaFin,
						 @pnClaEquipo = @nClaEquipo,
						 @pnDataSet = 5, /* 1 para Ot, 2 Actividades, 3 Pasos, 4 Variables */ 
						 @pnIdOt = @nIdOT,
						 @pnClaActividad = @nClaActividad

					INSERT #tbMtoOTAutonomoActividadD
					(
						[ClaUbicacion],
						[IdOt],
						[ClaActividad],
						[ClaActividadD],
						[DescripcionActividadD],
						[TiempoEstimadoD],
						[RequiereParo]
					)
					SELECT	
						@PnClaUbicacion,
						@nIdOT,
						@nClaActividad,
						AT.[ClaActividadD],
						AT.[DescripcionActividadD],
						AT.[TiempoEstimadoD],
						AT.[RequiereParo]
					FROM	#tbMtoOTAutonomoActividadD_temp AT
					JOIN [AswSch].[AswMtoCatActividad] A
						ON A.ClaUbicacion = @PnClaUbicacion
						AND AT.ClaActividadD=A.ClaActividad
					--solo me interesa la actividad que corresponde al derivado
					WHERE A.ClaTipoMantenimiento = 5--DERIVADO

					TRUNCATE TABLE #tbMtoOTAutonomoActividadD_temp

					---- siguiente bucle
					SELECT	@nClaActividad = MIN(ClaActividad)
					FROM	#tbMtoOTAutonomoActividad
					WHERE	IdOt = @nIdOT
					AND		ClaActividad > @nClaActividad
				END
		
				SELECT	@nIdOT = MIN(IdOt)
				FROM	#tbMtoOTAutonomo
				WHERE	ClaEquipo = @nClaEquipo
					AND IdOt > @nIdOT
			END
		END

		--siguiente equipo
		SELECT @nClaEquipo=MIN(ClaEquipo)
		FROM #tbMtoEquipo
		WHERE ClaEquipo > @nClaEquipo
	END


	UPDATE	#tbMtoOTAutonomoActividadPaso
	SET		ClaUbicacion = @PnClaUbicacion
	
	UPDATE	#tbMtoOTAutonomoActividadVariable
	SET		ClaUbicacion = @PnClaUbicacion

	------ actualización a tablas
	UPDATE	ot
	SET		ot.NomGuia = tmp.NomGuia,
			ot.ClaEstatusOt = tmp.ClaEstatusOt,
			ot.NomEstatus = tmp.NomEstatus,
			ot.ClaEquipo = tmp.ClaEquipo,
			ot.ClaGuia = tmp.ClaGuia,
			ot.FechaProgInicio = tmp.FechaProgInicio,
			ot.ClaTurno = tmp.ClaTurno,
			ot.TiempoEstimado = tmp.TiempoEstimado,
			ot.ClaUsuarioMod = @PnClaUsuarioMod,
			ot.NombrePcMod = @psNombrePcMod,
			ot.FechaUltimaMod = getdate()
	FROM	[AswSch].[AswMtoTraOT] ot with(NOLOCK)
	JOIN	#tbMtoOTAutonomo tmp
		ON	ot.claUbicacion = tmp.ClaUbicacion
		AND	ot.IdOT	= tmp.IdOt
		AND	ot.ClaEstatusOt < 2

	UPDATE	act
	SET		act.NomSistema = tmp.NomSistema,
			act.NomSubSistema = tmp.NomSubSistema,
			act.NomActividad = tmp.NomActividad,
			act.EsRealizada = tmp.EsRealizada,
			act.TiempoEstimado = tmp.TiempoEstimado,
			act.ClaUsuarioMod = @PnClaUsuarioMod,
			act.NombrePcMod = @psNombrePcMod,
			act.FechaUltimaMod = GETDATE()
	FROM	[AswSch].[AswMtoTraOTActividad] act with(NOLOCK)
	JOIN	#tbMtoOTAutonomoActividad tmp
		ON	act.claUbicacion = tmp.ClaUbicacion
		AND	act.IdOT	= tmp.IdOt
		AND	act.ClaActividad = tmp.ClaActividad
		AND	isnull(act.EsRealizada,0) = 0

	UPDATE	actD
	SET		actD.DescripcionActividadD	= tmp.DescripcionActividadD,
			actD.TiempoEstimadoD = tmp.TiempoEstimadoD,
			actD.RequiereParo = tmp.RequiereParo,
			actD.FechaUltimaMod = GETDATE()
	FROM	[AswSch].[AswMtoTraOTActividadDerivada] actD with(NOLOCK)
	JOIN	#tbMtoOTAutonomoActividadD tmp
		ON	actD.claUbicacion = tmp.ClaUbicacion
		AND	actD.IdOT	= tmp.IdOt
		AND	actD.ClaActividad = tmp.ClaActividad
		AND	actD.ClaActividadD = tmp.ClaActividadD

	UPDATE	paso
	SET		paso.Paso = tmp.Paso,
			paso.Descripcion = tmp.Descripcion,
			paso.EsRealizada = tmp.EsRealizada,
			paso.TiempoEstimado = tmp.TiempoEstimado,
			paso.ClaUsuarioMod = @PnClaUsuarioMod,
			paso.NombrePcMod = @psNombrePcMod,
			paso.FechaUltimaMod =GETDATE()
	FROM	[AswSch].[AswMtoTraOTActividadPaso] paso with(NOLOCK)
	JOIN	#tbMtoOTAutonomoActividadPaso tmp
		ON	paso.claUbicacion = tmp.ClaUbicacion
		AND	paso.IdOT	= tmp.IdOt
		AND	paso.ClaActividad = tmp.ClaActividad
		AND	paso.ClaActividadPaso = tmp.ClaActividadPaso
		AND	isnull(paso.EsRealizada,0) = 0
	
	UPDATE	vari
	SET		vari.NomDescripcionPaso = tmp.NomDescripcionPaso,
			vari.ClaVariable = tmp.ClaVariable,
			vari.NomVariable = tmp.NomVariable,
			vari.NomUnidadVariable = tmp.NomUnidadVariable,
			vari.ValorEstandar = tmp.ValorEstandar,
			vari.ValorMinimo = tmp.ValorMinimo,
			vari.ValorMaximo = tmp.ValorMaximo,
			--vari.ValorReal = tmp.ValorReal,
			vari.ClaReferenciaCumple = tmp.ClaReferenciaCumple,
			vari.NomReferenciaCumple = tmp.NomReferenciaCumple,
			vari.ClaOpcionFija = tmp.ClaOpcionFija,
			vari.NomOpcionFija = tmp.NomOpcionFija,
			vari.ClaTipoVariable = tmp.ClaTipoVariable,
			vari.Referencia = tmp.Referencia,
			vari.ClaUsuarioMod = @PnClaUsuarioMod,
			vari.NombrePcMod = @psNombrePcMod,
			vari.FechaUltimaMod = GETDATE()
	FROM	[AswSch].[AswMtoTraOTActividadVariable] vari with(NOLOCK)
	JOIN	#tbMtoOTAutonomoActividadVariable tmp
		ON	vari.claUbicacion = tmp.ClaUbicacion
		AND	vari.IdOT	= tmp.IdOt
		AND	vari.ClaActividad = tmp.ClaActividad
		AND	vari.ClaActividadPaso = tmp.ClaActividadPaso

	---- inserciones
	INSERT [AswSch].[AswMtoTraOT]
	(
		ClaUbicacion
		,IdOt
		,NomGuia
		,ClaEstatusOt
		,NomEstatus
		,ClaEquipo
		,IdCelda
		,ClaGuia
		,FechaProgInicio
		,ClaTurno
		,TiempoEstimado
		,BajaLogica
		,FechaBajaLogica
		,ClaUsuarioMod
		,NombrePcMod
		,FechaUltimaMod
	)
	SELECT	tmp.ClaUbicacion
		,tmp.IdOt
		,tmp.NomGuia
		,tmp.ClaEstatusOt
		,tmp.NomEstatus
		,tmp.ClaEquipo
		,tmp.IdCelda
		,tmp.ClaGuia
		,tmp.FechaProgInicio
		,tmp.ClaTurno
		,tmp.TiempoEstimado
		,0
		,NULL
		,@PnClaUsuarioMod
		,@psNombrePcMod
		,GETDATE()
	FROM	#tbMtoOTAutonomo tmp
	LEFT JOIN	[AswSch].[AswMtoTraOT] ot WITH(NOLOCK)
		ON		tmp.IdOt = ot.IdOt
		AND		tmp.ClaUbicacion = ot.ClaUbicacion
	WHERE	ot.idOt is null

	INSERT	[AswSch].[AswMtoTraOTActividad]
	(
		ClaUbicacion
		,IdOt
		,ClaActividad
		,NomSistema
		,NomSubSistema
		,NomActividad
		,EsRealizada
		,TiempoEstimado
		,BajaLogica
		,FechaBajaLogica
		,ClaUsuarioMod
		,NombrePcMod
		,FechaUltimaMod
	)
	SELECT	 tmp.ClaUbicacion
			,tmp.IdOt
			,tmp.ClaActividad
			,tmp.NomSistema
			,tmp.NomSubSistema
			,tmp.NomActividad
			,tmp.EsRealizada
			,tmp.TiempoEstimado
			,0
			,NULL
			,@PnClaUsuarioMod
			,@psNombrePcMod
			,GETDATE()
	FROM	#tbMtoOTAutonomoActividad tmp
	LEFT JOIN	[AswSch].[AswMtoTraOTActividad] ot WITH(NOLOCK)
		ON		tmp.IdOt = ot.IdOt
		AND		tmp.ClaUbicacion = ot.ClaUbicacion
		AND		tmp.ClaActividad = ot.ClaActividad
	WHERE	ot.idOt is null

	INSERT	[AswSch].[AswMtoTraOTActividadDerivada]
	(
		ClaUbicacion
		,IdOt
		,ClaActividad
		,ClaActividadD
		,DescripcionActividadD
		,TiempoEstimadoD
		,RequiereParo
		,FechaUltimaMod
	)
	SELECT	 tmp.ClaUbicacion
			,tmp.IdOt
			,tmp.ClaActividad
			,tmp.ClaActividadD
			,tmp.DescripcionActividadD
			,tmp.TiempoEstimadoD
			,tmp.RequiereParo
			,GETDATE()
	FROM	#tbMtoOTAutonomoActividadD tmp
	LEFT JOIN	[AswSch].[AswMtoTraOTActividadDerivada] ot WITH(NOLOCK)
		ON		tmp.IdOt = ot.IdOt
		AND		tmp.ClaUbicacion = ot.ClaUbicacion
		AND		tmp.ClaActividad = ot.ClaActividad
		AND		tmp.ClaActividadD = ot.ClaActividadD
	WHERE	ot.idOt is null

	INSERT [AswSch].[AswMtoTraOTActividadPaso]
	(
		ClaUbicacion
		,IdOt
		,ClaActividad
		,ClaActividadPaso
		,Paso
		,Descripcion
		,EsRealizada
		,TiempoEstimado
		,BajaLogica
		,FechaBajaLogica
		,ClaUsuarioMod
		,NombrePcMod
		,FechaUltimaMod
	)
	SELECT	 tmp.ClaUbicacion
			,tmp.IdOt
			,tmp.ClaActividad
			,tmp.ClaActividadPaso
			,tmp.Paso
			,tmp.Descripcion
			,tmp.EsRealizada
			,tmp.TiempoEstimado
			,0
			,NULL
			,@PnClaUsuarioMod
			,@psNombrePcMod
			,GETDATE()
	FROM	#tbMtoOTAutonomoActividadPaso tmp
	LEFT JOIN	[AswSch].[AswMtoTraOTActividadPaso] ot WITH(NOLOCK)
		ON		tmp.IdOt = ot.IdOt
		AND		tmp.ClaUbicacion = ot.ClaUbicacion
		AND		tmp.ClaActividad = ot.ClaActividad
		AND		tmp.ClaActividadPaso = ot.ClaActividadPaso
	WHERE	ot.idOt is null

	INSERT [AswSch].[AswMtoTraOTActividadVariable]
	(
		ClaUbicacion
		,IdOt
		,ClaActividad
		,ClaActividadPaso
		,NomDescripcionPaso
		,ClaVariable
		,NomVariable
		,NomUnidadVariable
		,ValorEstandar
		,ValorMinimo
		,ValorMaximo
		,ValorReal
		,ClaReferenciaCumple
		,NomReferenciaCumple
		,ClaOpcionFija
		,NomOpcionFija
		,ClaTipoVariable
		,Referencia
		,BajaLogica
		,FechaBajaLogica
		,ClaUsuarioMod
		,NombrePcMod
		,FechaUltimaMod
	)
	SELECT	 tmp.ClaUbicacion
			,tmp.IdOt
			,tmp.ClaActividad
			,tmp.ClaActividadPaso
			,tmp.NomDescripcionPaso
			,tmp.ClaVariable
			,tmp.NomVariable
			,tmp.NomUnidadVariable
			,tmp.ValorEstandar
			,tmp.ValorMinimo
			,tmp.ValorMaximo
			,NULL AS ValorReal
			,tmp.ClaReferenciaCumple
			,tmp.NomReferenciaCumple
			,tmp.ClaOpcionFija
			,tmp.NomOpcionFija
			,tmp.ClaTipoVariable
			,tmp.Referencia
			,0
			,NULL
			,@PnClaUsuarioMod
			,@psNombrePcMod
			,GETDATE()
	FROM	#tbMtoOTAutonomoActividadVariable tmp
	LEFT JOIN	[AswSch].[AswMtoTraOTActividadVariable] ot WITH(NOLOCK)
		ON		tmp.IdOt = ot.IdOt
		AND		tmp.ClaUbicacion = ot.ClaUbicacion
		AND		tmp.ClaActividad = ot.ClaActividad
		AND		tmp.ClaActividadPaso = ot.ClaActividadPaso
	WHERE	ot.idOt is null
SET NOCOUNT OFF
END
