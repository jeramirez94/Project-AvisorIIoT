USE [ASW]
GO
/****** Object:  StoredProcedure [AswSch].[ASW_CU604_Pag2_ParetoParos_Sel]    Script Date: 17/01/2023 06:07:56 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROC [AswSch].[ASW_CU604_Pag2_ParetoParos_Sel] 
@PnClaUbicacion INT,
@PdFecha DATETIME
AS
BEGIN
-- 20210219 -302NGALAZ
-- Reporte pareto de paros Nivel 1- Por Maquina , Nivel 2 - Causas

	DECLARE @nSemanaAnio INT,
			@nAnio INT

	DECLARE @Area TABLE (
		ClaArea INT,
		NomArea VARCHAR(50),
		ClaDepartamento INT,
		NomDepartamento VARCHAR(50)
	)

	DECLARE @SemanaAnio TABLE (
	anio int,
	mes int,
	semanaAnio int,
	FechaInicio datetime,
	FechaFin datetime
	)


	DECLARE @ParosTmp TABLE (
		ClaUbicacion INT,
		IdComponente VARCHAR(30),
		NomMaquina VARCHAR(100),
		IdCelda VARCHAR(30),
		NomCelda VARCHAR(100),
		ClaArea INT,
		NomArea VARCHAR(50),
		ClaDepartamento INT,
		NomDepartamento VARCHAR(50),
		MicroParoSN INT,
		DuracionSegundos INT,
		ClaSeccionParo INT,
		NomSeccionParo VARCHAR(100)
	)

	DECLARE @MaquinasPareto TABLE(
		ClaUbicacion INT,
		IdCelda VARCHAR(30),
		NomCelda VARCHAR(100),
		ClaArea INT,
		NomArea VARCHAR(50),
		ClaDepartamento INT,
		NomDepartamento VARCHAR(50),
		ClaSeccionParo INT,
		NomSeccionParo VARCHAR(100),
		DuracionSegundos INT,
		TiempoTotalArea INT,
		PorcParo NUMERIC(5,2)
	)

	DECLARE @CausasPareto TABLE(
		ClaUbicacion INT,
		IdCelda VARCHAR(30),
		NomCelda VARCHAR(100),
		NomMaquina VARCHAR(100),
		ClaArea INT,
		NomArea VARCHAR(50),
		ClaDepartamento INT,
		NomDepartamento VARCHAR(50),
		ClaSeccionParo INT,
		NomSeccionParo VARCHAR(100),
		DuracionSegundos INT,
		TiempoTotalArea INT,
		PorcParo NUMERIC(7,4)
	)



	DECLARE @ReportePareto TABLE (
		ClaUbicacion INT,
		IdCelda VARCHAR(30),
		NomCelda VARCHAR(100),
		ClaArea INT,
		NomArea VARCHAR(50),
		ClaDepartamento INT,
		NomDepartamento VARCHAR(50),
		ClaSeccionParo INT,
		NomSeccionParo VARCHAR(100),
		NomResponsable VARCHAR(50),
		SemanaAnio INT,
		FechaInicioSemana DATETIME,
		Nivel INT,
		DuracionSegundos INT,
		TiempoTotalArea INT,
		PorcParo NUMERIC(5,2),
		PorcPareto NUMERIC(5,2),
	    PorcAvailability NUMERIC(5,2),
		Responsable VARCHAR(50)
	)

	INSERT INTO @Area (ClaArea,NomArea,ClaDepartamento,NomDepartamento)
	SELECT  A.ClaArea
		   ,A.NomArea
		   ,D.ClaDepartamento
		   ,D.NomDepartamento  
	FROM AswSch.AswCatDepartamentoVw D
	INNER JOIN AswSch.AswCatAreaVw A 
	ON D.ClaDepartamento = A.ClaDepartamento
	WHERE A.BajaLogica = 0 AND D.BajaLogica = 0

	INSERT INTO @SemanaAnio (anio,mes,semanaAnio,FechaInicio,FechaFin)
	SELECT anio,MesAdm,SemanaDelAnio,FechaInicioAdm,FechaFinAdm
	FROM [AswSch].[AswSemanaAnio]
	WHERE @PdFecha between FechaInicioAdm AND FechaFinAdm

	SELECT @nSemanaAnio = semanaAnio,@nAnio=anio
	FROM @SemanaAnio

--OBTENEMOS LOS DATOS DE TODOS LOS PARO DE LA SEMANA

	INSERT INTO @ParosTmp (
		ClaUbicacion ,
		ClaArea ,
		NomArea,
		IdCelda,
		NomCelda,
		IdComponente ,
		NomMaquina,
		MicroParoSN  ,
		DuracionSegundos,
		ClaSeccionParo  ,
		NomSeccionParo
	)
	SELECT   BP.ClaUbicacion
			,AR.ClaArea
			,AR.NomArea
			,CEL.IdWorkCenter
			,CEL.NomWorkCenter
			,BP.IdComponente
			,CM.NomMaquina
			,BP.MicroParoSN
			,BP.DuracionSegundos
			,SP.ClaSeccionParo 
			,SP.NomSeccionParo
	FROM [AswSch].[AswBitBitacoraParo] BP
	JOIN AswSch.AswCatSeccionParo SP
		ON BP.ClaSeccionParo = SP.ClaSeccionParo
		AND SP.BajaLogica = 0
	JOIN AswSch.AswCatWorkUnitVw CM
		ON CM.ClaMaquina = BP.IdComponente
		AND CM.BajaLogica = 0
	JOIN AswSch.AswCatWorkCenterVw CEL
		ON CM.IdWorkCenter = CEL.IdWorkCenter
	JOIN @Area AR
		ON CEL.ClaArea = AR.ClaArea
	JOIN @SemanaAnio SA
	ON BP.FechaAdmSCADA between SA.FechaInicio AND SA.FechaFin


--AVAILABILITY 
INSERT INTO @ReportePareto (ClaUbicacion,ClaArea,NomArea,Nivel,SemanaAnio,FechaInicioSemana,PorcAvailability)
SELECT 
 ClaUbicacion
,ClaArea
,ClaveArea as NomArea
,0 AS Nivel 
,EGE.SemanaAnio
,SA.FechaInicioAdm
,[Availability]
FROM [AswSch].[AswEstEGESemanal] EGE
JOIN AswSch.AswSemanaAnio SA
ON EGE.SemanaAnio = SA.SemanaDelAnio
AND EGE.Anio = SA.Anio
WHERE EGE.SemanaAnio BETWEEN (@nSemanaAnio - 6) AND @nSemanaAnio
AND EGE.Nivel = 3
AND EGE.Anio = @nAnio

--ANALISIS DE MAQUINAS - PARETO NIVEL 1
--OBTENEMOS EL TOP 5 DE LAS MAQUINAS CON MAYOR TIEMPO DE PARO POR AREA

	INSERT INTO @MaquinasPareto (
		ClaUbicacion        ,
		IdCelda             ,
		NomCelda            ,
		ClaArea             ,
		NomArea             ,
		ClaDepartamento     ,
		NomDepartamento     ,
		DuracionSegundos    
	)
	SELECT ClaUbicacion        ,
		   IdCelda             ,
		   NomCelda            ,
		   ClaArea             ,
		   NomArea             ,
		   ClaDepartamento     ,
		   NomDepartamento     ,
		   Duracion
	FROM (
	SELECT  ClaUbicacion
	,IdCelda
	,NomCelda
	,ClaArea
	,NomArea
	,ClaDepartamento
	,NomDepartamento
	,SUM(duracionsegundos) as duracion
	,ROW_NUMBER() OVER (PARTITION BY ClaUbicacion,ClaArea ORDER BY SUM(duracionsegundos) DESC) AS RANK
	FROM @ParosTmp 
	GROUP BY ClaUbicacion,IdCelda,NomCelda,ClaArea,NomArea,ClaDepartamento,NomDepartamento
	) AS QRY
	WHERE RANK <=5

--SACAMOS EL PORCENTAJE DE CADA MAQUINA POR AREA
	UPDATE @MaquinasPareto 
	SET TiempoTotalArea = QRY.DuracionArea
	FROM @MaquinasPareto MP 
	JOIN (SELECT ClaArea,SUM(DuracionSegundos) AS DuracionArea FROM @MaquinasPareto GROUP BY ClaArea) QRY
	ON QRY.ClaArea = MP.ClaArea

	UPDATE @MaquinasPareto
	SET PorcParo = CAST(ROUND(CAST(DuracionSegundos AS numeric(10,2))/CAST(TiempoTotalArea AS numeric(10,2)),2) AS numeric(5,2))



	INSERT INTO @ReportePareto (
	 ClaUbicacion
	,IdCelda
	,NomCelda
	,ClaArea
	,NomArea
	,ClaDepartamento
	,NomDepartamento
	,Nivel
	,DuracionSegundos
	,PorcParo
	,PorcPareto
	)
	SELECT   MP1.ClaUbicacion        ,
			 MP1.IdCelda             ,
			 MP1.NomCelda            ,
			 MP1.ClaArea             ,
			 MP1.NomArea             ,
			 MP1.ClaDepartamento     ,
			 MP1.NomDepartamento     ,
			 1 AS Nivel              ,
			 MP1.DuracionSegundos    ,
			 MP1.PorcParo            ,
			 SUM(ISNULL(MP2.PorcParo,0)) + MP1.PorcParo AS PorcPareto
	FROM @MaquinasPareto MP1
	LEFT JOIN @MaquinasPareto MP2
	ON MP1.ClaUbicacion = MP2.ClaUbicacion
	AND MP1.ClaArea = MP2.ClaArea 
	AND MP1.IdCelda <> MP2.IdCelda
	AND MP1.PorcParo <= MP2.PorcParo
	GROUP BY MP1.ClaUbicacion        ,
			 MP1.IdCelda             ,
			 MP1.NomCelda            ,
			 MP1.ClaArea             ,
			 MP1.NomArea             ,
			 MP1.ClaDepartamento     ,
			 MP1.NomDepartamento     ,
			 MP1.DuracionSegundos    ,
			 MP1.PorcParo
	ORDER BY ClaArea,PorcParo DESC

--ANALISIS DE CAUSAS - PARETO NIVEL 2
--CAUSAS POR MAQUINA

 ;WITH CteMaquinaN2 AS (
	SELECT ClaUbicacion
		  ,ClaArea
	      ,IdCelda
	      ,RANK() OVER (PARTITION BY ClaUbicacion,ClaArea ORDER BY PORCPARO DESC) AS RANK
	FROM @MaquinasPareto
 )

INSERT INTO @CausasPareto(
	ClaUbicacion       ,
	IdCelda            ,
	NomCelda           ,
	ClaArea            ,
	NomArea            ,
	ClaDepartamento    ,
	NomDepartamento    ,
	ClaSeccionParo     ,
	NomSeccionParo     ,
	DuracionSegundos   
)
SELECT QRY.ClaUbicacion
,QRY.IdCelda
,QRY.NomCelda
,QRY.ClaArea
,QRY.NomArea
,QRY.ClaDepartamento
,QRY.NomDepartamento
,QRY.ClaSeccionParo
,QRY.NomSeccionParo
,Duracion
FROM 
(SELECT 
 PT.ClaUbicacion
,PT.IdCelda
,PT.NomCelda
,PT.ClaArea
,PT.NomArea
,PT.ClaDepartamento
,PT.NomDepartamento
,PT.ClaSeccionParo
,PT.NomSeccionParo
,SUM(PT.DuracionSegundos) AS Duracion
,ROW_NUMBER() OVER (Partition by PT.IdCelda ORDER BY SUM(PT.DuracionSegundos) DESC) AS Rank
FROM @ParosTmp PT
JOIN CteMaquinaN2 MP
ON PT.ClaUbicacion = MP.ClaUbicacion
	AND PT.ClaArea = MP.ClaArea
	AND PT.IdCelda = MP.IdCelda
	AND MP.RANK = 1
GROUP BY PT.ClaSeccionParo,PT.NomSeccionParo 
,PT.ClaUbicacion,PT.IdCelda,PT.NomCelda,PT.ClaArea,PT.NomArea,PT.ClaDepartamento,PT.NomDepartamento
) QRY
WHERE RANK <= 5


UPDATE @CausasPareto  
SET TiempoTotalArea = QRY.DuracionCausa
FROM @CausasPareto CP 
JOIN (SELECT ClaArea,SUM(DuracionSegundos) AS DuracionCausa FROM @CausasPareto GROUP BY ClaArea) QRY
ON QRY.ClaArea = CP.ClaArea


UPDATE @CausasPareto
SET PorcParo = CAST (CAST(DuracionSegundos AS numeric(10,2))/CAST(TiempoTotalArea AS numeric(10,2)) AS numeric(7,4) )  


INSERT INTO @ReportePareto (ClaUbicacion
	,ClaArea
	,NomArea
	,ClaDepartamento
	,NomDepartamento
	,ClaSeccionParo
	,NomSeccionParo
	,Nivel
	,DuracionSegundos
	,PorcParo
	,PorcPareto
	)
SELECT   CP1.ClaUbicacion
		,CP1.ClaArea
		,CP1.NomArea
		,CP1.ClaDepartamento
		,CP1.NomDepartamento
		,CP1.ClaSeccionParo
		,CP1.NomSeccionParo
		,2 AS Nivel
		,CP1.DuracionSegundos
		,CP1.PorcParo
		,SUM(ISNULL(CP2.PorcParo,0))  + CP1.PorcParo
FROM @CausasPareto CP1
LEFT JOIN @CausasPareto CP2
ON  CP1.ClaUbicacion    =  CP2.ClaUbicacion
AND CP1.ClaArea        =  CP2.ClaArea
AND CP1.IdCelda   =  CP2.IdCelda
AND CP1.ClaSeccionParo <> CP2.ClaSeccionParo
AND CP1.PorcParo       <= CP2.PorcParo
GROUP BY 
 CP1.ClaUbicacion
,CP1.IdCelda
,CP1.NomCelda
,CP1.ClaArea
,CP1.NomArea
,CP1.ClaDepartamento
,CP1.NomDepartamento
,CP1.ClaSeccionParo
,CP1.NomSeccionParo
,CP1.DuracionSegundos
,CP1.TiempoTotalArea 
,CP1.PorcParo
ORDER BY ClaArea,CP1.IdCelda,CP1.PorcParo desc

SELECT  ClaUbicacion ,
		IdCelda ,
		NomCelda ,
		ClaArea ,
		NomArea ,
		ClaDepartamento ,
		NomDepartamento ,
		ClaSeccionParo ,
		NomSeccionParo ,
		NomResponsable,
		SemanaAnio,
		FechaInicioSemana,
		Nivel ,
		ISNULL(DuracionSegundos,0) as DuracionSegundos ,
		ISNULL(TiempoTotalArea,0) as TiempoTotalArea  ,
		ISNULL(PorcParo,0) as PorcParo,
		ISNULL(PorcPareto,0) as PorcPareto,
		ISNULL(PorcAvailability,0) as PorcAvailability,
		'' as Responsable--Responsable
FROM  @ReportePareto

END
