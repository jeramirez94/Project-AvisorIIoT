--USE [ASW]
--GO
/****** Object:  StoredProcedure [AswSch].[ASW_CU706_Pag1_MtoTraOt_Sel]    Script Date: 15/11/2022 04:11:05 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--	EXEC [AswSch].[ASW_CU706_Pag1_MtoTraOt_Sel] 68, 4
ALTER PROC [AswSch].[ASW_CU706_Pag1_MtoTraOt_Sel]
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

	SELECT 'ASWLite_MtoTraOt' as nombretabla
		,'ClaUbicacion,IdOt' AS keys
		,[ClaUbicacion]
		  ,[IdOt]
		  ,[NomGuia]
		  ,[ClaEstatusOt]
		  ,[NomEstatus]
		  ,[ClaEquipo]
		  ,[IdCelda]
		  ,[ClaGuia]
		  ,CONVERT(VARCHAR,[FechaProgInicio],121) AS [FechaProgInicio]
		  ,[ClaTurno]
		  ,[TiempoEstimado]
		  --,[ClaEstatusReplica]
		  ,[BajaLogica]
		  --,[FechaBajaLogica]
		  ,[ClaUsuarioMod]
		  ,[NombrePcMod]
		  ,CONVERT(VARCHAR,[FechaUltimaMod],121) AS [FechaUltimaMod]
	  FROM [AswSch].[AswMtoTraOT]
	  WHERE ClaUbicacion = @PnClaUbicacion
		  AND IdCelda = @psIdCelda
		  AND FechaProgInicio = @ptFechaAdministrativa
	 
END
