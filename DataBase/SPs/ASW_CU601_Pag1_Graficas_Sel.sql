USE [ASW]
GO
/****** Object:  StoredProcedure [AswSch].[ASW_CU601_Pag1_Graficas_Sel]    Script Date: 15/11/2022 03:34:39 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROC [AswSch].[ASW_CU601_Pag1_Graficas_Sel]
	@PnClaUbicacion INT = 68,
	@PnAnio INT,
	@PnMes INT,
	@PnSemana INT
AS
BEGIN

	SELECT ClaDepartamento
	,ClaveDepartamento
	,ClaArea
	,ClaveArea
	,Nivel
	,Ege.SemanaAnio
	,FechaInicioAdm
	,FechaFinAdm
	,Efficiencty
	,Availability
	,Utilization
	,Quality
	,OEE
	FROM [AswSch].[AswEstEGESemanal] Ege
	JOIN AswSch.AswSemanaAnio Semana
	On Ege.SemanaAnio = Semana.SemanaDelAnio
	AND Ege.Anio = Semana.Anio
	WHERE Ege.Anio = @PnAnio
	AND SemanaAnio Between @PnSemana - 3 AND @PnSemana

	
END
