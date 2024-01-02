--USE [ASW]
--GO
/****** Object:  StoredProcedure [AswSch].[ASW_CU605_Pag1_ParetoPerformance_Sel]    Script Date: 17/01/2023 10:45:51 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROC [AswSch].[ASW_CU605_Pag1_ParetoPerformance_Sel] 
	@PnClaUbicacion INT,
	@PdFecha DATETIME
AS
BEGIN 

--23022021 NGALAZ 

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

	DECLARE @BajaEficienciaTmp TABLE (
		ClaUbicacion INT,
		IdCelda VARCHAR(30),
		NomCelda VARCHAR(50),
		ClaArea INT,
		NomArea VARCHAR(50),
		ClaDepartamento INT,
		NomDepartamento VARCHAR(50),
		ClaBajaEficiencia INT,
		NomBajaEficiencia Varchar(50)
	)

	DECLARE @CeldasPareto TABLE(
		ClaUbicacion INT,
		IdCelda VARCHAR(30),
		NomCelda VARCHAR(50),
		ClaArea INT,
		NomArea VARCHAR(50),
		ClaBajaEficiencia INT,
		NomBajaEficiencia VARCHAR(50),
		TiempoBE NUMERIC(5,2),
		TiempoBEArea NUMERIC(5,2),
		PorcBE NUMERIC(5,2)
	
	)

	DECLARE @CausasPareto TABLE (
		ClaUbicacion INT,
		IdCelda  VARCHAR(30),
		NomCelda VARCHAR(100),
		ClaArea  INT,
		NomArea VARCHAR(100),
		ClaBajaEficiencia INT,
		NomBajaEficiencia VARCHAR(100),
		TiempoBE NUMERIC(7,2),
		TiempoBETotal NUMERIC(7,2),
		PorcBE Numeric(7,2)
	)

	DECLARE @ReportePareto TABLE (
		ClaUbicacion INT,
		IdCelda VARCHAR(30),
		NomCelda VARCHAR(100),
		ClaArea INT,
		NomArea VARCHAR(100),
		ClaDepartamento INT,
		NomDepartamento VARCHAR(100),
		ClaBajaEficiencia INT,
		NomBajaEficiencia VARCHAR(100),
		SemanaAnio INT,
		FechaInicioSemana DATETIME,
		Nivel INT,
		TiempoBE INT,
		PorcBE NUMERIC(5,2),
		PorcPareto NUMERIC(5,2),
		PorcEfficiency NUMERIC(5,2)
	)

	INSERT INTO @SemanaAnio (anio,mes,semanaAnio,FechaInicio,FechaFin)
	SELECT anio,MesAdm,SemanaDelAnio,FechaInicioAdm,FechaFinAdm
	FROM [AswSch].[AswSemanaAnio]
	WHERE @PdFecha between FechaInicioAdm AND FechaFinAdm

	SELECT @nSemanaAnio = semanaAnio,@nAnio=anio
	FROM @SemanaAnio


	INSERT INTO @ReportePareto (ClaUbicacion,ClaArea,NomArea,Nivel,SemanaAnio,FechaInicioSemana,PorcEfficiency)
	SELECT 
	 ClaUbicacion
	,ClaArea
	,ClaveArea as NomArea
	,0 AS Nivel 
	,EGE.SemanaAnio
	,SA.FechaInicioAdm
	,Efficiencty
	FROM [AswSch].[AswEstEGESemanal] EGE
	JOIN AswSch.AswSemanaAnio SA
	ON EGE.SemanaAnio = SA.SemanaDelAnio
	AND EGE.Anio = SA.Anio
	WHERE EGE.SemanaAnio BETWEEN (@nSemanaAnio - 6) AND @nSemanaAnio
	AND EGE.Nivel = 3
	AND EGE.Anio = @nAnio

	INSERT INTO @BajaEficienciaTmp (
		ClaUbicacion ,
		IdCelda ,
		NomCelda,
		ClaArea ,
		NomArea ,
		ClaDepartamento ,
		NomDepartamento ,
		ClaBajaEficiencia ,
		NomBajaEficiencia 
	)
	SELECT BE.ClaUbicacion,
	BE.IdCelda,
	CEL.NomWorkCenter as NomCelda,
	CEL.ClaArea AS ClaArea,
	NomArea AS NomArea,
	CEL.ClaDepartamento AS ClaDepartamento,
	NomDepartamento AS NomDepartamento,
	CBE.ClaBajaEficiencia,
	CBE.NomBajaEficiencia
	FROM [AswSch].[AswBitBitacoraBajaEficiencia] BE
	JOIN [AswSch].[AswCatBajaEficiencia] CBE
		ON BE.ClaBajaEfciencia = CBE.ClaBajaEficiencia
	JOIN AswSch.AswCatWorkCenterVw CEL
		ON BE.IdCelda = CEL.IdWorkCenter
	JOIN AswSch.AswCatDepartamentoVw CD
		ON CEL.ClaDepartamento = CD.ClaDepartamento
	JOIN AswSch.AswCatAreaVw CA
		ON CEL.ClaArea = CA.ClaArea
	
	INSERT INTO @CeldasPareto (
	    ClaUbicacion      ,
		IdCelda           ,
		NomCelda          ,
		ClaArea           ,
		NomArea           ,
		TiempoBE
	)
	SELECT ClaUbicacion
		  ,IdCelda
		  ,NomCelda
	      ,ClaArea
	      ,NomArea
		  ,TiempoBE
	FROM (
		SELECT ClaUbicacion
		,IdCelda
		,NomCelda
		,ClaArea
		,NomArea
		,COUNT(1) AS TiempoBE 
		,ROW_NUMBER() OVER (PARTITION BY ClaArea Order by Count(1) DESC) AS RANK 
		FROM @BajaEficienciaTmp
		GROUP BY ClaUbicacion,IdCelda,NomCelda,ClaArea,NomArea
	) QRY
	WHERE RANK <= 5
	
	UPDATE @CeldasPareto
	SET TiempoBEArea = QRY.TiempoTotal
	FROM @CeldasPareto CP
	JOIN(
		SELECT ClaArea,SUM(TiempoBE) as TiempoTotal
		FROM @CeldasPareto
		GROUP BY ClaArea
	) QRY
	ON CP.ClaArea = QRY.ClaArea
	
	UPDATE @CeldasPareto 
	SET PorcBE = TiempoBE/TiempoBEArea

	INSERT INTO @ReportePareto (
	 ClaUbicacion,
	 IdCelda,
	 NomCelda,
	 ClaArea,
	 NomArea,
	 Nivel,
	 TiempoBE,
	 PorcBE,
	 PorcPareto
	)
	SELECT CP1.ClaUbicacion
	,CP1.IdCelda
	,CP1.NomCelda
	,CP1.ClaArea
	,CP1.NomArea
	,1 AS Nivel
	,CP1.TiempoBE
	,CP1.PorcBE
	,SUM(ISNULL(CP2.PorcBE,0)) + CP1.PorcBE AS PorcPareto
	FROM @CeldasPareto CP1
	Left JOIN @CeldasPareto CP2
	ON CP1.ClaUbicacion = CP2.ClaUbicacion
	AND CP1.ClaArea = CP2.ClaArea
	AND CP1.IdCelda <> CP2.IdCelda
	AND CP1.PorcBE <= CP2.PorcBE
	AND CP1.TiempoBE <= CP2.TiempoBE
	GROUP BY CP1.ClaUbicacion
			,CP1.IdCelda
			,CP1.NomCelda
			,CP1.ClaArea
			,CP1.NomArea
			,CP1.TiempoBE
			,CP1.PorcBE
		
	ORDER BY ClaArea,CP1.PorcBE DESC

	;WITH CteCeldasN2 AS (
		SELECT ClaUbicacion
		,ClaArea
		,IdCelda
		,RANK() OVER (Partition by ClaUbicacion,ClaArea ORDER BY TiempoBe) AS RANK
		FROM @CeldasPareto

	)


	INSERT INTO @CausasPareto (
		ClaUbicacion,
		IdCelda,
		NomCelda,
		ClaArea,
		NomArea,
		ClaBajaEficiencia,
		NomBajaEficiencia,
		TiempoBE
	)
	SELECT   QRY.ClaUbicacion
			,QRY.IdCelda
			,QRY.NomCelda
			,QRY.ClaArea
			,QRY.NomArea
			,QRY.ClaBajaEficiencia
			,QRY.NomBajaEficiencia
			,TiempoBE
	FROM (
	SELECT 
	 BE.ClaUbicacion
	,BE.IdCelda
	,BE.NomCelda
	,BE.ClaArea
	,BE.NomArea
	,BE.ClaBajaEficiencia
	,BE.NomBajaEficiencia
	,COUNT(1) AS TiempoBE
	,ROW_NUMBER() OVER (PARTITION BY BE.ClaUbicacion,BE.ClaArea,BE.IdCelda 
						ORDER BY COUNT(1) DESC) AS RANK
	FROM @BajaEficienciaTmp BE
	JOIN CteCeldasN2 CEL
	ON  BE.ClaUbicacion = CEL.ClaUbicacion
	AND BE.ClaArea = CEL.ClaArea
	AND BE.IdCelda = CEL.IdCelda
	AND CEL.RANK = 1 
	GROUP BY BE.ClaUbicacion
	,BE.IdCelda
	,BE.NomCelda
	,BE.ClaArea
	,BE.NomArea
	,BE.ClaBajaEficiencia
	,BE.NomBajaEficiencia
	) QRY
	WHERE RANK <= 5


	UPDATE @CausasPareto
	SET CP.TiempoBETotal = QRY.TiempoBE
	FROM @CausasPareto CP
	JOIN (SELECT ClaUbicacion,ClaArea,SUM(TiempoBE) AS TiempoBE
		  FROM @CausasPareto GROUP BY ClaUbicacion,ClaArea
		  ) QRY
	ON QRY.ClaUbicacion = CP.ClaUbicacion
	AND QRY.ClaArea = CP.ClaArea
	
	UPDATE @CausasPareto
	SET PorcBE = TiempoBE/TiempoBETotal
	
	INSERT INTO @ReportePareto(
	 ClaUbicacion
	,IdCelda
	,NomCelda
	,ClaArea
	,NomArea
	,ClaBajaEficiencia
	,NomBajaEficiencia
	,Nivel
	,TiempoBE
	,PorcBE
	,PorcPareto
	)
	SELECT CP1.ClaUbicacion
		  ,CP1.IdCelda
		  ,CP1.NomCelda
		  ,CP1.ClaArea
		  ,CP1.NomArea
		  ,CP1.ClaBajaEficiencia
		  ,CP1.NomBajaEficiencia
		  ,2 AS Nivel
		  ,CP1.TiempoBE
		  ,CP1.PorcBE 
		  ,SUM(ISNULL(CP2.PorcBE,0)) + CP1.PorcBE
	FROM @CausasPareto CP1
	LEFT JOIN @CausasPareto CP2
		ON CP1.ClaUbicacion = CP2.ClaUbicacion
		AND CP1.ClaArea = CP2.ClaArea
		AND CP1.IdCelda = CP2.IdCelda
		AND CP1.ClaBajaEficiencia <> CP2.ClaBajaEficiencia
		AND CP1.PorcBE <= CP2.PorcBE
		AND CP1.TiempoBE <= CP2.TiempoBE
	GROUP BY CP1.ClaUbicacion
	        ,CP1.IdCelda
			,CP1.NomCelda
		    ,CP1.ClaArea
		    ,CP1.NomArea
		    ,CP1.ClaBajaEficiencia
		    ,CP1.NomBajaEficiencia
		    ,CP1.TiempoBE
		    ,CP1.PorcBE   
	ORDER BY CP1.ClaUbicacion,CP1.ClaArea,CP1.IdCelda,TiempoBE DESC
	
	select * from @ReportePareto


END
