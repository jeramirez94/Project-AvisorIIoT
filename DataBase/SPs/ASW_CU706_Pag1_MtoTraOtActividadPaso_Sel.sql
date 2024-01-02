--USE [ASW]
--GO
/****** Object:  StoredProcedure [AswSch].[ASW_CU706_Pag1_MtoTraOtActividadPaso_Sel]    Script Date: 15/11/2022 04:12:54 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--	EXEC [AswSch].[ASW_CU706_Pag1_MtoTraOtActividadPaso_Sel] 68, 4
ALTER PROC [AswSch].[ASW_CU706_Pag1_MtoTraOtActividadPaso_Sel]
	@PnClaUbicacion INT
	,@PsIdCelda VARCHAR(30)
AS
BEGIN
/*
*	Regresea los turnos configurados para el departamento dado
*/
	DECLARE 
		@ptFecha DATETIME
		,@pnClaDepartamento INT
		,@ptFechaAdministrativa DATETIME

	DECLARE @Tbl_Turno TABLE (
	ClaTurno int,
	NomTurno varchar(10), 
	NomDepartamento varchar(50),
	Duracion int,
	horaInicio time,
	horaFin time,
	produccionDiaInicio int,
	cruceDia int, 
	FechaAdministrativa date, 
	FechaReal date
)

	SET @ptFecha = GETDATE()

	SELECT @pnClaDepartamento = ClaDepartamento
	FROM [AswSch].[AswCatWorkCenterVw]
	WHERE IdWorkCenter=@psIdCelda

	INSERT INTO @Tbl_Turno
	EXEC [AswSch].[ASW_CU1_Pag4_FechaAdministrativa_Sel] @ptFecha, @pnClaDepartamento

	SELECT @ptFechaAdministrativa = FechaAdministrativa 
	FROM @Tbl_Turno

	SELECT 'ASWLite_MtoTraOtActividadPaso' as nombretabla
		,'ClaUbicacion,IdOt,ClaActividad,ClaActividadPaso' AS keys
		,OTAP.[ClaUbicacion]
		,OTAP.[IdOt]
		,OTAP.[ClaActividad]
		,OTAP.[ClaActividadPaso]
		,OTAP.[Paso]
		,OTAP.[Descripcion]
		--,OTAP.[EsRealizada]
		,OTAP.[TiempoEstimado]
		--,OTAP.[TiempoReal]
		--,OTAP.[ClaEstatusReplica]
		,OTAP.[BajaLogica]
		--,[FechaBajaLogica]
		,OTAP.[ClaUsuarioMod]
		,OTAP.[NombrePcMod]
		,CONVERT(VARCHAR,OTAP.[FechaUltimaMod],121) AS [FechaUltimaMod]
	FROM [AswSch].[AswMtoTraOT] OT
	JOIN [AswSch].[AswMtoTraOTActividadPaso] OTAP
		ON OT.ClaUbicacion = OTAP.ClaUbicacion
		AND OT.IdOt = OTAP.IdOt
	WHERE OT.ClaUbicacion = @PnClaUbicacion
		AND OT.IdCelda = @psIdCelda
		AND OT.FechaProgInicio = @ptFechaAdministrativa

	 
END