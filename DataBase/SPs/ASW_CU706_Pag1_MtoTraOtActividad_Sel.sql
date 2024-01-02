--USE [ASW]
--GO
/****** Object:  StoredProcedure [AswSch].[ASW_CU706_Pag1_MtoTraOtActividad_Sel]    Script Date: 15/11/2022 04:11:59 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--	EXEC [AswSch].[ASW_CU706_Pag1_MtoTraOtActividad_Sel] 68, 4
ALTER PROC [AswSch].[ASW_CU706_Pag1_MtoTraOtActividad_Sel]
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

	SELECT 'ASWLite_MtoTraOtActividad' as nombretabla
		,'ClaUbicacion,IdOt,ClaActividad' AS keys
		,OTA.[ClaUbicacion]
		,OTA.[IdOt]
		,OTA.[ClaActividad]
		,OTA.[NomSistema]
		,OTA.[NomSubSistema]
		,OTA.[NomActividad]
		--,OTA.[EsRealizada]
		,OTA.[TiempoEstimado]
		--,OTA.[GeneraDerivadaSN]
		,OTA.[IdOtDerivada]
		--,OTA.[ClaEstatusReplica]
		,OTA.[BajaLogica]
		--,OTA.[FechaBajaLogica]
		,OTA.[ClaUsuarioMod]
		,OTA.[NombrePcMod]
		,CONVERT(VARCHAR,OTA.[FechaUltimaMod],121) AS [FechaUltimaMod]
	FROM [AswSch].[AswMtoTraOT] OT
	JOIN [AswSch].[AswMtoTraOTActividad] OTA
		ON OT.ClaUbicacion = OTA.ClaUbicacion
		AND OT.IdOt = OTA.IdOt
	WHERE OT.ClaUbicacion = @PnClaUbicacion
		AND OT.IdCelda = @psIdCelda
		AND OT.FechaProgInicio = @ptFechaAdministrativa

	 
END