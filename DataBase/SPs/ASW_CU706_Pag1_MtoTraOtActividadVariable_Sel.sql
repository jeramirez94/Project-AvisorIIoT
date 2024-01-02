--USE [ASW]
--GO
/****** Object:  StoredProcedure [AswSch].[ASW_CU706_Pag1_MtoTraOtActividadVariable_Sel]    Script Date: 15/11/2022 04:13:48 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--	EXEC [AswSch].[ASW_CU706_Pag1_MtoTraOtActividadVariable_Sel] 68, 4
ALTER PROC [AswSch].[ASW_CU706_Pag1_MtoTraOtActividadVariable_Sel]
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
	WHERE IdWorkCenter=@PsIdCelda

	INSERT INTO @Tbl_Turno
	EXEC [AswSch].[ASW_CU1_Pag4_FechaAdministrativa_Sel] @ptFecha, @pnClaDepartamento

	SELECT @ptFechaAdministrativa = FechaAdministrativa 
	FROM @Tbl_Turno

	SELECT 'ASWLite_MtoTraOtActividadVariable' as nombretabla
		,'ClaUbicacion,IdOt,ClaActividad,ClaActividadPaso,ClaVariable' AS keys
		,OTAV.[ClaUbicacion]
		,OTAV.[IdOt]
		,OTAV.[ClaActividad]
		,OTAV.[ClaActividadPaso]
		,OTAV.[NomDescripcionPaso]
		,OTAV.[ClaVariable]
		,OTAV.[NomVariable]
		,OTAV.[NomUnidadVariable]
		,OTAV.[ValorEstandar]
		,OTAV.[ValorMinimo]
		,OTAV.[ValorMaximo]
		--,OTAV.[ValorReal]
		,OTAV.[ClaReferenciaCumple]
		,OTAV.[NomReferenciaCumple]
		--,OTAV.[ClaOpcionFija]
		--,OTAV.[NomOpcionFija]
		,OTAV.[ClaTipoVariable]
		,OTAV.[Referencia]
		--,OTAV.[idOTDerivada]
		--,OTAV.[generarOTDerivada]
		--,OTAV.[ClaEstatusReplica]
		,OTAV.[BajaLogica]
		--,OTAV.[FechaBajaLogica]
		,OTAV.[ClaUsuarioMod]
		,OTAV.[NombrePcMod]
		,CONVERT(VARCHAR,OTAV.[FechaUltimaMod],121) AS [FechaUltimaMod]
	FROM [AswSch].[AswMtoTraOT] OT
	JOIN [AswSch].[AswMtoTraOTActividadVariable] OTAV
		ON OT.ClaUbicacion = OTAV.ClaUbicacion
		AND OT.IdOt = OTAV.IdOt
	WHERE OT.ClaUbicacion = @PnClaUbicacion
		AND OT.IdCelda = @psIdCelda
		AND OT.FechaProgInicio = @ptFechaAdministrativa

	 
END