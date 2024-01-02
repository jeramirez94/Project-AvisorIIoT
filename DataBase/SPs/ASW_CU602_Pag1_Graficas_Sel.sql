USE [ASW]
GO
/****** Object:  StoredProcedure [AswSch].[ASW_CU602_Pag1_Graficas_Sel]    Script Date: 15/11/2022 03:51:24 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROC [AswSch].[ASW_CU602_Pag1_Graficas_Sel]
	@PnClaUbicacion INT = 68,
	@PnAnio INT,
	@PnMes INT,
	@PnSemana INT
AS
BEGIN

	SELECT   ClaDepartamento
			,ClaveDepartamento
			,ClaArea
			,ClaveArea
			,Nivel
			,A1 
			,ProgramaProduccion
			,JidokaAndonRespuesta
			,ParosJustificados
			,ECS.SemanaAnio
			,Semana.FechaInicioAdm
			,Semana.FechaFinAdm
	FROM [AswSch].[AswEstCumplimientoSemanal] ECS
	JOIN AswSch.AswSemanaAnio Semana
		ON  ECS.SemanaAnio = Semana.SemanaDelAnio
		AND ECS.Anio = Semana.Anio
	WHERE ECS.Anio = @PnAnio
	AND SemanaAnio Between @PnSemana - 3 AND @PnSemana
	AND Nivel =3
	
END
