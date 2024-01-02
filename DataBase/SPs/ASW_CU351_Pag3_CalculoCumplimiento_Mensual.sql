--USE [ASW]
--GO
/****** Object:  StoredProcedure [AswSch].[ASW_CU351_Pag3_CalculoCumplimiento_Mensual]    Script Date: 17/01/2023 10:35:13 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROC [AswSch].[ASW_CU351_Pag3_CalculoCumplimiento_Mensual]
 @PnClaUbicacion INT
,@PnClaDepartamento INT = NULL
,@PnClaArea INT = NULL
,@PnAnio INT
,@PnMes INT
,@PnNivel INT 
AS
BEGIN

	IF @PnAnio is NULL 
	BEGIN
		RAISERROR('Year is required',16,1);
		RETURN
	END
	IF @PnMes IS NULL
	BEGIN
		RAISERROR('Month is required',16,1);
		RETURN
	END
	
	

DECLARE @nClaSeccionParoSinJustificar INT,
		@nId INT

SELECT @nClaSeccionParoSinJustificar = SeccionParo
FROM ASWSch.AswCfgParametrosOperacion

DECLARE @CatCeldasCapacidadHora TABLE (
	IdCelda VARCHAR(30),
	NomCelda VARCHAR(50),
	ClaDepartamento INT,
	ClaveDepartamento VARCHAR(50),
	ClaArea INT,
	ClaveArea VARCHAR(50),
	CapacidadHora INT
)

DECLARE @DatosProduccion TABLE(
	ClaUbicacion INT,
	ClaveUbicacion VARCHAR(50),
	IdComponente VARCHAR(30),
	IdCelda VARCHAR(30),
	Anio INT,
	Mes INT,
	Dia INT,
	Hora INT,
	ClavosHora INT
)

DECLARE @IndicadoresCumplimiento TABLE (
	id INT identity(1,1),
	[ClaUbicacion] [int] NULL,
	[ClaveUbicacion] [varchar](50) NULL,
	[Anio] INT NULL,
	[Mes] INT NULL,
	[ClaDepartamento] [int] NULL,
	[ClaveDepartamento] [varchar](50) NULL,
	[ClaArea] [int] NULL,
	[ClaveArea] [varchar](50) NULL,
	[ClaMaquina] [int] NULL,
	[ClaveMaquina] [varchar](50) NULL,
	[Nivel] [int] NULL,
	[A1] [numeric](3, 2) NULL,
	[ProgramaProduccion] [numeric](3, 2) NULL,
	[JidokaAndonRespuesta] [numeric](3, 2) NULL,
	ParosJustificados [numeric](3, 2) NULL,
	[BajaLogica] [tinyint] NULL,
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NULL,
	[NombrePcMod] [varchar](64) NULL,
	[ClaUsuarioMod] [int] NULL
) 

DECLARE @CumplimientoA1 TABLE  (
	ClaUbicacion INT,
	ClaveUbicacion Varchar(50),
	IdCelda VARCHAR(30),
	NomCelda VARCHAR(50),
	ClaDepartamento INT,
	ClaveDepartamento VARCHAR(50),
	ClaArea INT,
	ClaveArea VARCHAR(50),
	IdComponente VARCHAR(30),
	Anio INT,
	Mes INT,
	Dia INT, 
	Hora INT,
	CumpleEstandar NUMERIC(2,1)
)

DECLARE @CumplimientoPrograma TABLE  (
	ClaUbicacion INT,
	ClaveUbicacion VARCHAR(50),
	IdCelda VARCHAR(30),
	NomCelda VARCHAR(50),
	ClaDepartamento INT,
	ClaveDepartamento VARCHAR(50),
	ClaArea INT,
	ClaveArea VARCHAR(50),
	Anio INT,
	Mes INT,
	CumplePrograma NUMERIC(2,1)
)

DECLARE @CumplimientoTiempoAndon TABLE  (
	ClaUbicacion INT,
	ClaveUbicacion VARCHAR(50),
	IdCelda VARCHAR(30),
	NomCelda VARCHAR(50),
	ClaDepartamento INT,
	ClaveDepartamento VARCHAR(50),
	ClaArea INT,
	ClaveArea VARCHAR(50),
	Anio INT,
	Mes INT,
	CumpleTiempo NUMERIC(2,1)
)

DECLARE @CumplimientoJustificacionParo TABLE  (
	ClaUbicacion INT,
	ClaveUbicacion VARCHAR(50),
	IdCelda VARCHAR(30),
	NomCelda VARCHAR(50),
	ClaDepartamento INT,
	ClaveDepartamento VARCHAR(50),
	ClaArea INT,
	ClaveArea VARCHAR(50),
	Anio INT,
	Mes INT,
	EsJustificado NUMERIC(2,1)
)


INSERT INTO @DatosProduccion (ClaUbicacion,ClaveUbicacion,IdComponente,IdCelda,Anio,Mes,Dia,Hora,ClavosHora)
SELECT CU.ClaUbicacion
	  ,CU.NombreUbicacion
	  ,BitProd.IdComponente
	  ,BitProd.IdCelda
	  ,@PnAnio AS Anio
	  ,@PnMes  AS Mes
	  ,DAY(BitProd.FechaAdm) AS Dia
	  ,DATEPART(HOUR,BitProd.FechaHoraFin) as Hora
	  ,ISNULL(BitProd.ClavosFin,0)-ISNULL(BitProdAnt.ClavosFin,0) AS ClavosHora
FROM [AswSch].[AswBitBitacoraProduccion] BitProd
LEFT JOIN [AswSch].[AswBitBitacoraProduccion] BitProdAnt
	ON DATEADD(HOUR,-1,BitProd.FechaHoraFin) = BitProdAnt.FechaHoraFin
	AND BitProd.IdComponente = BitProdAnt.IdComponente
	AND BitProd.ClaveCorte = BitProdAnt.ClaveCorte 
JOIN ASWSch.AswCatWorkCenterVw Cel
	ON BitProd.IdCelda = Cel.IdWorkCenter
	AND ISNULL(Cel.BajaLogica ,0) = 0
JOIN AswSch.TiCatUbicacionVw CU
	ON CU.ClaUbicacion = BitProd.ClaUbicacion
	ANd ISNULL(CU.BajaLogica,0) = 0
WHERE   YEAR(BitProd.FechaAdm) = @PnAnio
	AND MONTH(BitProd.FechaAdm) = @PnMes
	AND (@PnClaDepartamento IS NULL OR Cel.ClaDepartamento = @PnClaDepartamento)
	AND (@PnClaArea IS NULL OR Cel.ClaArea = @PnClaArea)
	AND BitProd.ClaveCorte = 'PORHORA'

--OBTENGO CAPACIDAD DE LAS CELDAS
INSERT INTO @CatCeldasCapacidadHora (IdCelda,NomCelda,ClaDepartamento,ClaveDepartamento,ClaArea,ClaveArea,CapacidadHora)
SELECT   C.IdWorkCenter AS IdCelda
		,C.NomWorkCenter AS NomCelda
		,C.ClaDepartamento AS ClaDepartamento
		,NomDepartamento AS ClaveDepartamento
		,C.ClaArea AS ClaArea
		,NomArea AS ClaveArea
		,(ISNULL(C.NPM,0)+ISNULL(C.NPM2,0)+ISNULL(C.NPM3,0)) * ISNULL(C.CantWafios,0) * 60 as CapacidadHora
FROM AswSch.AswCatWorkCenterVw C
JOIN AswSch.AswCatDepartamentoVw CD
	ON C.ClaDepartamento = CD.ClaDepartamento
JOIN AswSch.AswCatAreaVw CA
	ON C.ClaArea = CA.ClaArea
WHERE IdWorkCenter IN (SELECT DISTINCT IdCelda FROM @DatosProduccion )


INSERT INTO @CumplimientoA1 (ClaUbicacion,ClaveUbicacion,IdCelda,NomCelda,ClaDepartamento,ClaveDepartamento,ClaArea,ClaveArea,Anio,Mes,Dia,Hora,CumpleEstandar)
SELECT  Prod.ClaUbicacion,
		Prod.ClaveUbicacion,
		Prod.IdCelda,
	    Cel.NomCelda,
		Cel.ClaDepartamento,
		Cel.ClaveDepartamento,
	    Cel.ClaArea,
		Cel.ClaveArea,
		Prod.Anio,
		Prod.Mes,
		Prod.Dia,
		Prod.Hora,
	    CASE WHEN SUM(ClavosHora) >= CapacidadHora  THEN 1.0 
			ELSE 0.0 
	    END  AS CumpleEstandar
FROM @DatosProduccion Prod
JOIN @CatCeldasCapacidadHora Cel
	ON Prod.IdCelda = Cel.IdCelda
GROUP BY Prod.ClaUbicacion,
		 Prod.ClaveUbicacion,
		 Prod.IdCelda,
	     Cel.NomCelda,
		 Cel.ClaDepartamento,
		 Cel.ClaveDepartamento,
	     Cel.ClaArea,
		 Cel.ClaveArea,
		 Prod.Anio,
		 Prod.Mes,
		 Prod.Dia,
		 Prod.Hora,
		 CapacidadHora


--A1 NIVEL 1 - PLANTA
IF (@PnNivel = 1 OR @PnNivel IS NULL)
BEGIN
	INSERT INTO @IndicadoresCumplimiento
			   ([ClaUbicacion]
			   ,[ClaveUbicacion]
			   ,[Anio]
			   ,[Mes]
			   ,[ClaDepartamento]
			   ,[ClaveDepartamento]
			   ,[ClaArea]
			   ,[ClaveArea]
			   ,[ClaMaquina]
			   ,[ClaveMaquina]
			   ,[Nivel]
			   ,[A1]
			  )
	SELECT  CA1.ClaUbicacion AS ClaUbicacion
		   ,CA1.ClaveUbicacion AS ClaveUbicacion
		   ,@PnAnio AS Anio
		   ,@PnMes AS Mes
		   ,NULL AS ClaDepartamento
		   ,'' AS ClaveDepartamento
		   ,NULL AS ClaArea
		   ,'' AS ClaveArea
		   ,NULL AS ClaMaquina
		   ,'' AS ClaveMaquina
		   ,1 AS NIVEL
		   ,AVG(ISNULL(CumpleEstandar,0.0)) AS A1
	FROM @CumplimientoA1 CA1
	GROUP BY  CA1.Anio,CA1.Mes,CA1.ClaUbicacion,CA1.ClaveUbicacion

END

	
--A1 NIVEL 2 - DEPARTAMENTO
IF (@PnNivel = 2 OR @PnNivel IS NULL) 
BEGIN
	INSERT INTO @IndicadoresCumplimiento
			   ([ClaUbicacion]
			   ,[ClaveUbicacion]
			   ,[Anio]
			   ,[Mes]
			   ,[ClaDepartamento]
			   ,[ClaveDepartamento]
			   ,[ClaArea]
			   ,[ClaveArea]
			   ,[ClaMaquina]
			   ,[ClaveMaquina]
			   ,[Nivel]
			   ,[A1]
			  )
	SELECT  CA1.ClaUbicacion AS ClaUbicacion
		   ,CA1.ClaveUbicacion AS ClaveUbicacion
		   ,@PnAnio AS Anio
		   ,@PnMes AS Mes
		   ,CA1.ClaDepartamento AS ClaDepartamento
		   ,CA1.ClaveDepartamento AS ClaveDepartamento
		   ,NULL AS ClaArea
		   ,'' AS ClaveArea
		   ,NULL AS ClaMaquina
		   ,'' AS ClaveMaquina
		   ,2 AS NIVEL
		   ,AVG(ISNULL(CumpleEstandar,0.0)) as A1
	FROM @CumplimientoA1 CA1
	GROUP BY  CA1.Anio,CA1.Mes
	,CA1.ClaUbicacion
	,CA1.ClaveUbicacion
	,CA1.ClaDepartamento
	,CA1.ClaveDepartamento

END


--A1 NIVEL 3 - AREA
IF (@PnNivel = 3 OR @PnNivel IS NULL)
BEGIN
	INSERT INTO @IndicadoresCumplimiento
			   ([ClaUbicacion]
			   ,[ClaveUbicacion]
			   ,[Anio]
			   ,[Mes]
			   ,[ClaDepartamento]
			   ,[ClaveDepartamento]
			   ,[ClaArea]
			   ,[ClaveArea]
			   ,[ClaMaquina]
			   ,[ClaveMaquina]
			   ,[Nivel]
			   ,[A1]
			  )
	SELECT      CA1.ClaUbicacion AS ClaUbicacion
		       ,CA1.ClaveUbicacion AS ClaveUbicacion
			   ,@PnAnio AS Anio
			   ,@PnMes AS Mes
			   ,CA1.ClaDepartamento AS ClaDepartamento
			   ,CA1.ClaveDepartamento AS ClaveDepartamento
			   ,CA1.ClaArea AS ClaArea
			   ,CA1.ClaveArea AS ClaveArea
			   ,NULL AS ClaMaquina
			   ,NULL AS ClaveMaquina
			   ,3 AS NIVEL
			   ,AVG(ISNULL(CumpleEstandar,0.0)) as A1
		FROM @CumplimientoA1 CA1
		GROUP BY  CA1.Anio,CA1.Mes
				,CA1.ClaUbicacion,CA1.ClaveUbicacion
				,CA1.ClaDepartamento
				,CA1.ClaveDepartamento
				,CA1.ClaArea
				,CA1.ClaveArea
END 

--A1 NIVEL 4 - CELDA
IF (@PnNivel = 4 OR @PnNivel IS NULL)
BEGIN
	INSERT INTO @IndicadoresCumplimiento
			   ([ClaUbicacion]
			   ,[ClaveUbicacion]
			   ,[Anio]
			   ,[Mes]
			   ,[ClaDepartamento]
			   ,[ClaveDepartamento]
			   ,[ClaArea]
			   ,[ClaveArea]
			   ,[ClaMaquina]
			   ,[ClaveMaquina]
			   ,[Nivel]
			   ,[A1]
			  )
	SELECT      CA1.ClaUbicacion AS ClaUbicacion
		       ,CA1.ClaveUbicacion AS ClaveUbicacion
			   ,@PnAnio AS Anio
			   ,@PnMes AS Mes
			   ,CA1.ClaDepartamento AS ClaDepartamento
			   ,CA1.ClaveDepartamento AS ClaveDepartamento
			   ,CA1.ClaArea AS ClaArea
			   ,CA1.ClaveArea AS ClaveArea
			   ,CA1.IdCelda AS ClaMaquina
			   ,CA1.NomCelda AS ClaveMaquina
			   ,4 AS NIVEL
			   ,AVG(ISNULL(CumpleEstandar,0.0)) as A1
	FROM @CumplimientoA1 CA1
	GROUP BY  CA1.Anio,Ca1.Mes
	,CA1.ClaUbicacion,CA1.ClaveUbicacion
	,CA1.ClaDepartamento
	,CA1.ClaveDepartamento
	,CA1.ClaArea
	,CA1.ClaveArea
	,CA1.IdCelda
	,CA1.NomCelda

END

	
/***************************
*CUMPLIMIENTO AL PROGRAMA   *
****************************/

	INSERT INTO @CumplimientoPrograma (ClaUbicacion,ClaveUbicacion,IdCelda,NomCelda,ClaDepartamento,ClaveDepartamento,ClaArea,ClaveArea,Anio,Mes,CumplePrograma)
	SELECT   OP.ClaUbicacion
			,CU.NombreUbicacion AS ClaveUbicacion
			,Cel.IdWorkCenter AS ClaMaquina
			,Cel.NomWorkCenter AS ClaveMaquina
			,Cel.ClaDepartamento AS ClaDepartamento
			,NomDepartamento AS ClaveDepartamento
			,Cel.ClaArea AS ClaArea
			,NomArea AS ClaveArea
			,@PnAnio
			,@PnMes
			,CASE WHEN OP.UnidadesProducidas BETWEEN (OP.UnidadesProgramadas - 1) AND (OP.UnidadesProgramadas + 1)
					THEN 1.0
				  ELSE 0.0
			 END CumplePrograma
	FROM [AswSch].[ASWTraOrdenProduccion] OP
	JOIN AswSch.AswCatWorkCenterVw Cel
		ON OP.IdCelda = Cel.IdWorkCenter
		AND ISNULL(Cel.BajaLogica,0) = 0
	JOIN AswSch.TiCatUbicacionVw CU
		ON CU.ClaUbicacion = OP.ClaUbicacion
	JOIN AswSch.AswCatDepartamentoVw CD
		ON CEL.ClaDepartamento = CD.ClaDepartamento
	JOIN AswSch.AswCatAreaVw CA
		ON CEL.ClaArea = CA.ClaArea
	WHERE     YEAR(OP.FechaFinAdm) = @PnAnio
		  AND MONTH(OP.FechaFinAdm) = @PnMes
		  AND (@PnClaDepartamento IS NULL OR Cel.ClaDepartamento = @PnClaDepartamento)
		  AND (@PnClaArea IS NULL OR Cel.ClaArea = @PnClaArea)
		  AND ClaEstatus IN (3,4) -- 3 Terminada / 4 Cancelada

--CUMPPROG NIVEL 1 - PLANTA
IF (@PnNivel = 1 OR @PnNivel IS NULL)
BEGIN
	--SI EXISTE EL REGISTRO SOLO SE ACTUALIZA EL CAMPO DEL INDICADOR
	UPDATE @IndicadoresCumplimiento 
	SET    ProgramaProduccion = CP.CumplimientoPrograma
	FROM (SELECT  ClaUbicacion as ClaUbicacionCP
			     ,@PnAnio AS AnioCP
			     ,@PnMes AS MesCP
				 ,AVG(ISNULL(CumplePrograma,0.0)) AS CumplimientoPrograma
		  FROM @CumplimientoPrograma 
		  GROUP BY Anio,Mes,ClaUbicacion) CP
	WHERE Nivel = 1 
	AND   Anio = CP.AnioCP
	AND   Mes =  CP.MesCP
	AND   ClaUbicacion = CP.ClaUbicacionCP

	--SI NO EXISTE SE AGREGA REGISTRO NUEVO
	INSERT INTO @IndicadoresCumplimiento
			   ([ClaUbicacion]
			   ,[ClaveUbicacion]
			   ,[Anio]
			   ,[Mes]
			   ,[ClaDepartamento]
			   ,[ClaveDepartamento]
			   ,[ClaArea]
			   ,[ClaveArea]
			   ,[ClaMaquina]
			   ,[ClaveMaquina]
			   ,[Nivel]
			   ,ProgramaProduccion
			  )
	SELECT      CP.ClaUbicacion AS ClaUbicacion
			   ,CP.ClaveUbicacion AS ClaveUbicacion
			   ,@PnAnio AS Anio
			   ,@PnMes AS Mes
			   ,NULL AS ClaDepartamento
			   ,NULL AS ClaveDepartamento
			   ,NULL AS ClaArea
			   ,NULL AS ClaveArea
			   ,NULL AS ClaMaquina
			   ,NULL AS ClaveMaquina
			   ,1 AS NIVEL
			   ,AVG(ISNULL(CumplePrograma,0.0)) AS CumplimientoPrograma
	FROM @CumplimientoPrograma CP
	WHERE NOT EXISTS (SELECT 1 FROM @IndicadoresCumplimiento 
					  WHERE ClaUbicacion = CP.ClaUbicacion 
							AND Anio = CP.Anio 
							AND Mes  = CP.Mes
							AND Nivel = 1)
	AND CP.ClaUbicacion IS NOT NULL
	GROUP BY CP.Anio,CP.Mes,CP.ClaUbicacion,CP.ClaveUbicacion
END	
	
--CUMPPROG NIVEL 2 - DEPARTAMENTO
IF (@PnNivel = 2 OR @PnNivel IS NULL)
BEGIN

	UPDATE @IndicadoresCumplimiento 
	SET    ProgramaProduccion = CP.CumplimientoPrograma
	FROM (SELECT  ClaUbicacion as ClaUbicacionCP
			     ,@PnAnio AS AnioCP
			     ,@PnMes AS MesCP
				 ,ClaDepartamento AS ClaDepartamentoCP
				 ,ClaveDepartamento AS ClaveDepartamentoCP
				 ,AVG(ISNULL(CumplePrograma,0.0)) AS CumplimientoPrograma
		  FROM @CumplimientoPrograma 
		  GROUP BY Anio,Mes,ClaUbicacion,ClaDepartamento,ClaveDepartamento) CP
	WHERE Nivel = 2 
	AND   Anio = CP.AnioCP
	AND   Mes =  CP.MesCP
	AND   ClaDepartamento = CP.ClaDepartamentoCP
	AND   ClaveDepartamento = CP.ClaveDepartamentoCP
	AND   ClaUbicacion = CP.ClaUbicacionCP

	INSERT INTO @IndicadoresCumplimiento
			   ([ClaUbicacion]
			   ,[ClaveUbicacion]
			   ,[Anio]
			   ,[Mes]
			   ,[ClaDepartamento]
			   ,[ClaveDepartamento]
			   ,[ClaArea]
			   ,[ClaveArea]
			   ,[ClaMaquina]
			   ,[ClaveMaquina]
			   ,[Nivel]
			   ,ProgramaProduccion
			  )
	SELECT      CP.ClaUbicacion AS ClaUbicacion
			   ,CP.ClaveUbicacion AS ClaveUbicacion
			   ,@PnAnio AS Anio
			   ,@PnMes AS Mes
			   ,ClaDepartamento AS ClaDepartamento
			   ,ClaveDepartamento AS ClaveDepartamento
			   ,NULL AS ClaArea
			   ,NULL AS ClaveArea
			   ,NULL AS ClaMaquina
			   ,NULL AS ClaveMaquina
			   ,2 AS NIVEL
			   ,AVG(ISNULL(CumplePrograma,0.0)) AS CumplimientoPrograma
	FROM @CumplimientoPrograma CP
	WHERE NOT EXISTS (SELECT 1 FROM @IndicadoresCumplimiento 
					  WHERE ClaUbicacion = CP.ClaUbicacion 
							AND ClaDepartamento =   CP.ClaDepartamento
							AND Anio = CP.Anio 
							AND Mes  = CP.Mes 
							AND Nivel = 2)
	AND CP.ClaUbicacion IS NOT NULL
	GROUP BY CP.Anio,CP.Mes,ClaUbicacion,ClaveUbicacion,ClaDepartamento,ClaveDepartamento

END

--CUMPPROG Nivel 3 - AREA
IF (@PnNivel = 3 OR @PnNivel IS NULL)
BEGIN
	UPDATE @IndicadoresCumplimiento 
	SET    ProgramaProduccion = CP.CumplimientoPrograma
	FROM (SELECT  ClaUbicacion as ClaUbicacionCP
			     ,@PnAnio AS AnioCP
			     ,@PnMes AS MesCP
				 ,ClaDepartamento AS ClaDepartamentoCP
				 ,ClaveDepartamento AS ClaveDepartamentoCP
				 ,ClaArea AS ClaAreaCP
				 ,ClaveArea AS ClaveAreaCP
				 ,AVG(ISNULL(CumplePrograma,0.0)) AS CumplimientoPrograma
		  FROM @CumplimientoPrograma 
		  GROUP BY Anio,Mes,ClaUbicacion,ClaDepartamento,ClaveDepartamento,ClaArea,ClaveArea) CP
	WHERE Nivel = 3 
	AND   Anio = CP.AnioCP
	AND   Mes =  CP.MesCP
	AND   ClaDepartamento = CP.ClaDepartamentoCP
	AND   ClaArea = CP.ClaAreaCP
	AND   ClaUbicacion = CP.ClaUbicacionCP

	INSERT INTO @IndicadoresCumplimiento
			   ([ClaUbicacion]
			   ,[ClaveUbicacion]
			   ,[Anio]
			   ,[Mes]
			   ,[ClaDepartamento]
			   ,[ClaveDepartamento]
			   ,[ClaArea]
			   ,[ClaveArea]
			   ,[ClaMaquina]
			   ,[ClaveMaquina]
			   ,[Nivel]
			   ,ProgramaProduccion
			  )
	SELECT   CP.ClaUbicacion AS ClaUbicacion
			,CP.ClaveUbicacion AS ClaveUbicacion
			,@PnAnio AS Anio
			,@PnMes AS Mes
			,ClaDepartamento AS ClaDepartamento
			,ClaveDepartamento AS ClaveDepartamento
			,ClaArea AS ClaArea
			,ClaveArea AS ClaveArea
			,NULL AS ClaMaquina
			,NULL AS ClaveMaquina
			,3 AS NIVEL
			,AVG(ISNULL(CumplePrograma,0.0)) AS CumplimientoPrograma
	FROM @CumplimientoPrograma CP
	WHERE NOT EXISTS (SELECT 1 FROM @IndicadoresCumplimiento 
					  WHERE ClaUbicacion = CP.ClaUbicacion 
							AND ClaDepartamento =  CP.ClaDepartamento
							AND ClaArea = CP.ClaArea
							AND Anio = CP.Anio 
							AND Mes  = CP.Mes 
							AND Nivel = 3)
		 AND CP.ClaUbicacion IS NOT NULL
	GROUP BY CP.Anio,CP.Mes,ClaUbicacion,ClaveUbicacion,ClaDepartamento,ClaveDepartamento,ClaArea,ClaveArea
END
	
--CUMPPROG Nivel 4 - CELDA
IF (@PnNivel = 4 OR @PnNivel IS NULL)
BEGIN
	UPDATE @IndicadoresCumplimiento 
	SET    ProgramaProduccion = CP.CumplimientoPrograma
	FROM (SELECT  ClaUbicacion as ClaUbicacionCP
			     ,@PnAnio AS AnioCP
			     ,@PnMes AS MesCP
				 ,ClaDepartamento AS ClaDepartamentoCP
				 ,ClaveDepartamento AS ClaveDepartamentoCP
				 ,ClaArea AS ClaAreaCP
				 ,ClaveArea AS ClaveAreaCP
				 ,IdCelda AS ClaMaquinaCP
				 ,NomCelda AS ClaveMaquinaCP
				 ,AVG(ISNULL(CumplePrograma,0.0)) AS CumplimientoPrograma
		  FROM @CumplimientoPrograma 
		  GROUP BY Anio,Mes,ClaUbicacion,ClaDepartamento,ClaveDepartamento,ClaArea,ClaveArea,IdCelda,NomCelda) CP
	WHERE Nivel = 4
	AND   Anio = CP.AnioCP
	AND   Mes =  CP.MesCP
	AND   ClaDepartamento = CP.ClaDepartamentoCP
	AND   ClaArea = CP.ClaAreaCP
	AND   ClaMaquina = CP.ClaMaquinaCP
	AND   ClaUbicacion = CP.ClaUbicacionCP

	INSERT INTO @IndicadoresCumplimiento
			   ([ClaUbicacion]
			   ,[ClaveUbicacion]
			   ,[Anio]
			   ,[Mes]
			   ,[ClaDepartamento]
			   ,[ClaveDepartamento]
			   ,[ClaArea]
			   ,[ClaveArea]
			   ,[ClaMaquina]
			   ,[ClaveMaquina]
			   ,[Nivel]
			   ,ProgramaProduccion
			  )
	SELECT  CP.ClaUbicacion AS ClaUbicacion
			,CP.ClaveUbicacion AS ClaveUbicacion
			,@PnAnio AS Anio
			,@PnMes AS Mes
			,ClaDepartamento AS ClaDepartamento
			,ClaveDepartamento AS ClaveDepartamento
			,ClaArea AS ClaArea
			,ClaveArea AS ClaveArea
			,IdCelda AS ClaMaquina
			,NomCelda AS ClaveMaquina
			,4 AS NIVEL
			,AVG(ISNULL(CumplePrograma,0.0)) AS CumplimientoPrograma
	FROM @CumplimientoPrograma CP
	WHERE NOT EXISTS (SELECT 1 FROM @IndicadoresCumplimiento 
					  WHERE ClaUbicacion = CP.ClaUbicacion 
							AND ClaDepartamento =  CP.ClaDepartamento
							AND ClaArea = CP.ClaArea
							AND IdCelda = CP.IdCelda
							AND Anio = CP.Anio 
							AND Mes  = CP.Mes 
							AND Nivel = 4)
		  AND CP.ClaUbicacion IS NOT NULL
	GROUP BY CP.Anio,CP.Mes,ClaUbicacion,ClaveUbicacion,ClaDepartamento,ClaveDepartamento,ClaArea,ClaveArea,IdCelda,NomCelda
END

/**************************
*  TIEMPO RESPUESTA ANDON *
***************************/
	INSERT INTO @CumplimientoTiempoAndon (ClaUbicacion,ClaveUbicacion,IdCelda,NomCelda,ClaDepartamento,ClaveDepartamento,ClaArea,ClaveArea,Anio,Mes,CumpleTiempo)
	SELECT  BitAndon.ClaUbicacion
		   ,CU.NombreUbicacion AS ClaveUbicacion
		   ,CEL.IdWorkCenter
		   ,CEL.NomWorkCenter
		   ,CEL.ClaDepartamento
		   ,NomDepartamento
		   ,CEL.ClaArea
		   ,NomArea
		   ,@PnAnio AS Anio
		   ,@PnMes AS Mes
		   ,CASE WHEN ISNULL(BitAndon.DuracionSegundos,0)/60 < ISNULL(SPD.MinutosAvisoN1,0) + ISNULL(SPD.MinutosAvisoN2,0) + ISNULL(SPD.MinutosAvisoN3,0)
				 THEN 0
				 ELSE 1
			END AS CumpleTiempo
	FROM [AswSch].[AswBitAndon] BitAndon
	JOIN AswSch.AswCatWorkUnitVw MAQ
		ON BitAndon.IdComponente = MAQ.ClaMaquina
	JOIN AswSch.AswCatWorkCenterVw CEL
		ON MAQ.IdWorkCenter = CEL.IdWorkCenter
	JOIN  [AswSch].[AswCatSeccionParoDatosMCSW] SPD
		ON	BitAndon.ClaUbicacion = SPD.ClaUbicacion
				AND	CEL.ClaArea = SPD.ClaveArea    
				AND CEL.ClaDepartamento = SPD.ClaveDepartamento
				AND ISNULL(SPD.BajaLogica,0) = 0
				AND	BitAndon.ClaGrupoParo = SPD.ClaGpoParo
				AND	BitAndon.ClaTipoParo = SPD.ClaTipoParo
				AND	BitAndon.claSeccionParo = SPD.ClaSeccionParo
	JOIN AswSch.TiCatUbicacionVw CU
		ON CU.ClaUbicacion = BitAndon.ClaUbicacion
	WHERE   YEAR(FechaAdmSCADA) = @PnAnio
		AND MONTH(FechaAdmSCADA) = @PnMes
		AND (@PnClaDepartamento IS NULL OR CEL.ClaDepartamento = @PnClaDepartamento)
		AND (@PnClaArea IS NULL OR CEL.ClaArea = @PnClaArea)
		AND FechaHoraAtencion IS NOT NULL


--TRESPANDN NIVEL 1 - PLANTA
IF (@PnNivel = 1 OR @PnNivel IS NULL)
BEGIN

	UPDATE @IndicadoresCumplimiento 
		SET    JidokaAndonRespuesta = CTA.CumplimientoTiempoAndon
		FROM (SELECT  ClaUbicacion as ClaUbicacionCTA
					 ,@PnAnio AS AnioCTA
					 ,@PnMes AS MesCTA
					 ,AVG(ISNULL(CumpleTiempo,0.0)) AS CumplimientoTiempoAndon
			  FROM @CumplimientoTiempoAndon CTA 
			  GROUP BY Anio,Mes,ClaUbicacion) CTA
		WHERE Nivel = 1 
		AND   Anio = CTA.AnioCTA
		AND   Mes =  CTA.MesCTA
		AND   ClaUbicacion = CTA.ClaUbicacionCTA

	INSERT INTO @IndicadoresCumplimiento
				   ([ClaUbicacion]
				   ,[ClaveUbicacion]
				   ,[Anio]
				   ,[Mes]
				   ,[ClaDepartamento]
				   ,[ClaveDepartamento]
				   ,[ClaArea]
				   ,[ClaveArea]
				   ,[ClaMaquina]
				   ,[ClaveMaquina]
				   ,[Nivel]
				   ,JidokaAndonRespuesta
				  )
	SELECT          CTA.ClaUbicacion AS ClaUbicacion
				   ,CTA.ClaveUbicacion AS ClaveUbicacion
				   ,@PnAnio AS Anio
				   ,@PnMes AS Mes
				   ,NULL AS ClaDepartamento
				   ,NULL AS ClaveDepartamento
				   ,NULL AS ClaArea
				   ,NULL AS ClaveArea
				   ,NULL AS ClaMaquina
				   ,NULL AS ClaveMaquina
				   ,1 AS NIVEL
				   ,AVG(CumpleTiempo) AS CumplimientoTiempo
		FROM @CumplimientoTiempoAndon CTA
		WHERE NOT EXISTS (SELECT 1 FROM @IndicadoresCumplimiento 
						  WHERE ClaUbicacion = CTA.ClaUbicacion 
								AND Anio = CTA.Anio 
								AND Mes  = CTA.Mes
								AND Nivel = 1)
		GROUP BY Anio,Mes,ClaUbicacion,ClaveUbicacion
END

--TRESPANDN NIVEL 2 - DEPARTAMENTO
IF (@PnNivel = 2 OR @PnNivel IS NULL)
BEGIN
	UPDATE @IndicadoresCumplimiento 
		SET    JidokaAndonRespuesta = CTA.CumplimientoTiempoAndon
		FROM (SELECT  ClaUbicacion as ClaUbicacionCTA
					 ,ClaDepartamento AS ClaDepartamentoCTA
					 ,@PnAnio AS AnioCTA
					 ,@PnMes AS MesCTA
					 ,AVG(CumpleTiempo) AS CumplimientoTiempoAndon
			  FROM @CumplimientoTiempoAndon CTA 
			  GROUP BY Anio,Mes,ClaUbicacion,ClaDepartamento) CTA
		WHERE Nivel = 2
		AND   Anio = CTA.AnioCTA
		AND   Mes =  CTA.MesCTA
		AND   ClaUbicacion = CTA.ClaUbicacionCTA
		AND   ClaDepartamento = CTA.ClaDepartamentoCTA

	INSERT INTO @IndicadoresCumplimiento
				   ([ClaUbicacion]
				   ,[ClaveUbicacion]
				   ,[Anio]
				   ,[Mes]
				   ,[ClaDepartamento]
				   ,[ClaveDepartamento]
				   ,[ClaArea]
				   ,[ClaveArea]
				   ,[ClaMaquina]
				   ,[ClaveMaquina]
				   ,[Nivel]
				   ,JidokaAndonRespuesta
				  )
	SELECT          CTA.ClaUbicacion AS ClaUbicacion
				   ,CTA.ClaveUbicacion AS ClaveUbicacion
				   ,@PnAnio AS Anio
				   ,@PnMes AS Mes
				   ,ClaDepartamento AS ClaDepartamento
				   ,ClaveDepartamento AS ClaveDepartamento
				   ,NULL AS ClaArea
				   ,NULL AS ClaveArea
				   ,NULL AS ClaMaquina
				   ,NULL AS ClaveMaquina
				   ,2 AS NIVEL
				   ,AVG(CumpleTiempo) AS CumplimientoTiempo
		FROM @CumplimientoTiempoAndon CTA
		WHERE NOT EXISTS (SELECT 1 FROM @IndicadoresCumplimiento 
						  WHERE ClaUbicacion = CTA.ClaUbicacion 
								AND ClaDepartamento = CTA.ClaDepartamento
								AND Anio = CTA.Anio 
								AND Mes  = CTA.Mes 
								AND Nivel = 2)
		GROUP BY Anio,Mes,ClaUbicacion,ClaveUbicacion,ClaDepartamento,ClaveDepartamento
	
END

--TRESPANDN NIVEL 3 - AREA
IF (@PnNivel = 3 OR @PnNivel IS NULL)
BEGIN

	UPDATE @IndicadoresCumplimiento 
		SET    JidokaAndonRespuesta = CTA.CumplimientoTiempoAndon
		FROM (SELECT  ClaUbicacion as ClaUbicacionCTA
					 ,ClaDepartamento AS ClaDepartamentoCTA
					 ,ClaArea AS ClaAreaCTA
					 ,@PnAnio AS AnioCTA
					 ,@PnMes AS MesCTA
					 ,AVG(CumpleTiempo) AS CumplimientoTiempoAndon
			  FROM @CumplimientoTiempoAndon CTA 
			  GROUP BY Anio,Mes,ClaUbicacion,ClaveUbicacion,ClaDepartamento,ClaArea) CTA
		WHERE Nivel = 3
		AND   Anio = CTA.AnioCTA
		AND   Mes =  CTA.MesCTA
		AND   ClaUbicacion = CTA.ClaUbicacionCTA
		AND   ClaDepartamento = CTA.ClaDepartamentoCTA
		AND   ClaArea = CTA.ClaAreaCTA

	INSERT INTO @IndicadoresCumplimiento
				   ([ClaUbicacion]
				   ,[ClaveUbicacion]
				   ,[Anio]
				   ,[Mes]
				   ,[ClaDepartamento]
				   ,[ClaveDepartamento]
				   ,[ClaArea]
				   ,[ClaveArea]
				   ,[ClaMaquina]
				   ,[ClaveMaquina]
				   ,[Nivel]
				   ,JidokaAndonRespuesta
				  )
	SELECT          CTA.ClaUbicacion AS ClaUbicacion
				   ,CTA.ClaveUbicacion AS ClaveUbicacion
				   ,@PnAnio AS Anio
				   ,@PnMes AS Mes
				   ,ClaDepartamento AS ClaDepartamento
				   ,ClaveDepartamento AS ClaveDepartamento
				   ,ClaArea AS ClaArea
				   ,ClaveArea AS ClaveArea
				   ,NULL AS ClaMaquina
				   ,NULL AS ClaveMaquina
				   ,3 AS NIVEL
				   ,AVG(CumpleTiempo) AS CumplimientoTiempo
		FROM @CumplimientoTiempoAndon CTA
		WHERE NOT EXISTS (SELECT 1 FROM @IndicadoresCumplimiento 
						  WHERE ClaUbicacion = CTA.ClaUbicacion 
								AND ClaDepartamento = CTA.ClaDepartamento
								AND ClaArea = CTA.ClaArea
								AND Anio = CTA.Anio 
								AND Mes  = CTA.Mes 
								AND Nivel = 3)
		GROUP BY Anio,Mes,ClaUbicacion,ClaveUbicacion,ClaDepartamento,ClaveDepartamento,ClaArea,ClaveArea
END

--TRESPANDN NIVEL 4 - CELDA
IF (@PnNivel = 4 OR @PnNivel IS NULL)
BEGIN
	UPDATE @IndicadoresCumplimiento 
		SET    JidokaAndonRespuesta = CTA.CumplimientoTiempoAndon
		FROM (SELECT  ClaUbicacion as ClaUbicacionCTA
					 ,ClaDepartamento AS ClaDepartamentoCTA
					 ,ClaArea AS ClaAreaCTA
					 ,IdCelda AS ClaMaquinaCTA
					 ,@PnAnio AS AnioCTA
					 ,@PnMes AS MesCTA
					 ,AVG(CumpleTiempo) AS CumplimientoTiempoAndon
			  FROM @CumplimientoTiempoAndon CTA 
			  GROUP BY Anio,Mes,ClaUbicacion,ClaDepartamento,ClaArea,IdCelda) CTA
		WHERE Nivel = 4
		AND   Anio = CTA.AnioCTA
		AND   Mes =  CTA.MesCTA
		AND   ClaUbicacion = CTA.ClaUbicacionCTA
		AND   ClaDepartamento = CTA.ClaDepartamentoCTA
		AND   ClaArea = CTA.ClaAreaCTA
		AND   ClaMaquina = CTA.ClaMaquinaCTA

	INSERT INTO @IndicadoresCumplimiento
				   ([ClaUbicacion]
				   ,[ClaveUbicacion]
				   ,[Anio]
				   ,[Mes]
				   ,[ClaDepartamento]
				   ,[ClaveDepartamento]
				   ,[ClaArea]
				   ,[ClaveArea]
				   ,[ClaMaquina]
				   ,[ClaveMaquina]
				   ,[Nivel]
				   ,JidokaAndonRespuesta
				  )
	SELECT          CTA.ClaUbicacion AS ClaUbicacion
				   ,CTA.ClaveUbicacion AS ClaveUbicacion
				   ,@PnAnio AS Anio
				   ,@PnMes AS Mes
				   ,ClaDepartamento AS ClaDepartamento
				   ,ClaveDepartamento AS ClaveDepartamento
				   ,ClaArea AS ClaArea
				   ,ClaveArea AS ClaveArea
				   ,IdCelda AS ClaMaquina
				   ,NomCelda AS ClaveMaquina
				   ,4 AS NIVEL
				   ,AVG(CumpleTiempo) AS CumplimientoTiempo
		FROM @CumplimientoTiempoAndon CTA
		WHERE NOT EXISTS (SELECT 1 FROM @IndicadoresCumplimiento 
						  WHERE ClaUbicacion = CTA.ClaUbicacion 
								AND ClaDepartamento = CTA.ClaDepartamento
								AND ClaArea = CTA.ClaArea
								AND ClaMaquina = CTA.IdCelda
								AND Anio = CTA.Anio 
								AND Mes  = CTA.Mes 
								AND Nivel = 4)
		GROUP BY Anio,Mes,ClaUbicacion,ClaveUbicacion,ClaDepartamento,ClaveDepartamento,ClaArea,ClaveArea,IdCelda,NomCelda
		
END

/*************************
* JUSTIFICACION PAROS     *
**************************/

		
		INSERT INTO @CumplimientoJustificacionParo (ClaUbicacion,ClaveUbicacion,IdCelda,NomCelda,ClaDepartamento,ClaveDepartamento,ClaArea,ClaveArea,Anio,Mes,EsJustificado)
		SELECT  CU.ClaUbicacion
			   ,CU.NombreUbicacion
			   ,CEL.IdWorkCenter
			   ,CEL.NomWorkCenter
			   ,CEL.ClaDepartamento
			   ,NomDepartamento
			   ,CEL.ClaArea
			   ,NomArea
			   ,@PnAnio AS Anio
			   ,@PnMes AS Mes
			   ,CASE WHEN BitParo.ClaSeccionParo IS NULL OR BitParo.ClaSeccionParo = @nClaSeccionParoSinJustificar
							THEN 0
							ELSE 1
						END EsJustificado
		FROM AswSch.AswBitBitacoraParo BitParo
		JOIN AswSch.AswCatWorkUnitVw MAQ
			ON BitParo.IdComponente = MAQ.ClaMaquina
			AND ISNULL(MAQ.BajaLogica,0) = 0
		JOIN AswSch.AswCatWorkCenterVw CEL
			ON MAQ.IdWorkCenter = CEL.IdWorkCenter
			AND ISNULL(CEL.BajaLogica,0) = 0
		JOIN AswSch.TiCatUbicacionVw CU 
			ON CU.ClaUbicacion = BitParo.ClaUbicacion
		JOIN AswSch.AswCatDepartamentoVw CD
			ON CEL.ClaDepartamento = CD.ClaDepartamento
		JOIN AswSch.AswCatAreaVw CA
			ON CEL.ClaArea = CA.ClaArea
		WHERE   YEAR(BitParo.FechaAdmSCADA)    = @PnAnio
			AND MONTH(BitParo.FechaAdmSCADA)   = @PnMes
			AND (@PnClaDepartamento IS NULL OR Cel.ClaDepartamento = @PnClaDepartamento)
			AND (@PnClaArea IS NULL OR Cel.ClaArea = @PnClaArea)


--JUSTPARO NIVEL 1 -- PLANTA 
IF (@PnNivel = 1 OR @PnNivel IS NULL)
BEGIN
	UPDATE @IndicadoresCumplimiento 
	SET    ParosJustificados = CJP.ParosJustificados
	FROM (SELECT  ClaUbicacion as ClaUbicacionCJP
			     ,@PnAnio AS AnioCJP
			     ,@PnMes AS MesCJP
				 ,SUM(EsJustificado)/Count(1) AS ParosJustificados
		  FROM @CumplimientoJustificacionParo CJP 
		  GROUP BY Anio,Mes,ClaUbicacion) CJP
	WHERE Nivel = 1 
	AND   Anio = CJP.AnioCJP
	AND   Mes =  CJP.MesCJP
	AND   ClaUbicacion = CJP.ClaUbicacionCJP

	INSERT INTO @IndicadoresCumplimiento
			   ([ClaUbicacion]
			   ,[ClaveUbicacion]
			   ,[Anio]
			   ,[Mes]
			   ,[ClaDepartamento]
			   ,[ClaveDepartamento]
			   ,[ClaArea]
			   ,[ClaveArea]
			   ,[ClaMaquina]
			   ,[ClaveMaquina]
			   ,[Nivel]
			   ,ParosJustificados
			  )
	SELECT      CJP.ClaUbicacion AS ClaUbicacion
			   ,CJP.ClaveUbicacion AS ClaveUbicacion
			   ,@PnAnio AS Anio
			   ,@PnMes AS Mes
			   ,NULL AS ClaDepartamento
			   ,NULL AS ClaveDepartamento
			   ,NULL AS ClaArea
			   ,NULL AS ClaveArea
			   ,NULL AS ClaMaquina
			   ,NULL AS ClaveMaquina
			   ,1 AS NIVEL
			   ,SUM(EsJustificado)/Count(1) AS ParosJustificados
	FROM @CumplimientoJustificacionParo CJP
	WHERE NOT EXISTS (SELECT 1 FROM @IndicadoresCumplimiento 
					  WHERE ClaUbicacion = CJP.ClaUbicacion 
							AND Anio = CJP.Anio 
							AND Mes  = CJP.Mes 
							AND Nivel = 1)
	GROUP BY Anio,Mes,ClaUbicacion,ClaveUbicacion
END

--JUSTPARO NIVEL 2 - DEPARTAMENTO
IF (@PnNivel = 2 OR @PnNivel IS NULL)
BEGIN
	UPDATE @IndicadoresCumplimiento 
	SET    ParosJustificados = CJP.ParosJustificados
	FROM (SELECT  ClaUbicacion as ClaUbicacionCJP
				 ,ClaDepartamento AS ClaDepartamentoCJP
			     ,@PnAnio AS AnioCJP
			     ,@PnMes AS MesCJP
				 ,SUM(EsJustificado)/Count(1) AS ParosJustificados
		  FROM @CumplimientoJustificacionParo CJP 
		  GROUP BY Anio,Mes,ClaUbicacion,ClaDepartamento) CJP
	WHERE Nivel = 2 
	AND   Anio = CJP.AnioCJP
	AND   Mes =  CJP.MesCJP
	AND   ClaUbicacion    = CJP.ClaUbicacionCJP
	AND   ClaDepartamento = CJP.ClaDepartamentoCJP

	INSERT INTO @IndicadoresCumplimiento
			   ([ClaUbicacion]
			   ,[ClaveUbicacion]
			   ,[Anio]
			   ,[Mes]
			   ,[ClaDepartamento]
			   ,[ClaveDepartamento]
			   ,[ClaArea]
			   ,[ClaveArea]
			   ,[ClaMaquina]
			   ,[ClaveMaquina]
			   ,[Nivel]
			   ,ParosJustificados
			  )
	SELECT      CJP.ClaUbicacion AS ClaUbicacion
			   ,CJP.ClaveUbicacion AS ClaveUbicacion
			   ,@PnAnio AS Anio
			   ,@PnMes AS Mes
			   ,ClaDepartamento AS ClaDepartamento
			   ,ClaveDepartamento AS ClaveDepartamento
			   ,NULL AS ClaArea
			   ,NULL AS ClaveArea
			   ,NULL AS ClaMaquina
			   ,NULL AS ClaveMaquina
			   ,2 AS NIVEL
			   ,SUM(EsJustificado)/Count(1)
	FROM @CumplimientoJustificacionParo CJP
	WHERE NOT EXISTS (SELECT 1 FROM @IndicadoresCumplimiento 
					  WHERE ClaUbicacion = CJP.ClaUbicacion 
							AND Anio = CJP.Anio 
							AND Mes  = CJP.Mes 
							AND Nivel = 2)
	GROUP BY Anio,Mes,ClaUbicacion,ClaveUbicacion,ClaDepartamento,ClaveDepartamento
END

--JUSTPARO NIVEL 3 - AREA
IF (@PnNivel = 3 OR @PnNivel IS NULL)
BEGIN
	UPDATE @IndicadoresCumplimiento 
	SET    ParosJustificados = CJP.ParosJustificados
	FROM (SELECT  ClaUbicacion as ClaUbicacionCJP
				 ,ClaDepartamento AS ClaDepartamentoCJP
				 ,ClaArea AS ClaAreaCJP
			     ,@PnAnio AS AnioCJP
			     ,@PnMes AS MesCJP
				 ,SUM(EsJustificado)/Count(1) AS ParosJustificados
		  FROM @CumplimientoJustificacionParo CJP 
		  GROUP BY Anio,Mes,ClaUbicacion,ClaDepartamento,ClaArea) CJP
	WHERE Nivel = 3
	AND   Anio = CJP.AnioCJP
	AND   Mes =  CJP.MesCJP
	AND   ClaUbicacion    = CJP.ClaUbicacionCJP
	AND   ClaDepartamento = CJP.ClaDepartamentoCJP
	AND   ClaArea         = CJP.ClaAreaCJP

	INSERT INTO @IndicadoresCumplimiento
			   ([ClaUbicacion]
			   ,[ClaveUbicacion]
			   ,[Anio]
			   ,[Mes]
			   ,[ClaDepartamento]
			   ,[ClaveDepartamento]
			   ,[ClaArea]
			   ,[ClaveArea]
			   ,[ClaMaquina]
			   ,[ClaveMaquina]
			   ,[Nivel]
			   ,ParosJustificados
			  )
	SELECT      CJP.ClaUbicacion AS ClaUbicacion
			   ,CJP.ClaveUbicacion AS ClaveUbicacion
			   ,@PnAnio AS Anio
			   ,@PnMes AS Mes
			   ,ClaDepartamento AS ClaDepartamento
			   ,ClaveDepartamento AS ClaveDepartamento
			   ,ClaArea AS ClaArea
			   ,ClaveArea AS ClaveArea
			   ,NULL AS ClaMaquina
			   ,NULL AS ClaveMaquina
			   ,3 AS NIVEL
			   ,SUM(EsJustificado)/Count(1)
	FROM @CumplimientoJustificacionParo CJP
	WHERE NOT EXISTS (SELECT 1 FROM @IndicadoresCumplimiento 
					  WHERE ClaUbicacion = CJP.ClaUbicacion 
							AND Anio = CJP.Anio 
							AND Mes  = CJP.Mes 
							AND Nivel = 3)
	GROUP BY Anio,Mes,ClaUbicacion,ClaveUbicacion,ClaDepartamento,ClaveDepartamento,ClaArea,ClaveArea

END

--JUSTPARO NIVEL 4 - CELDA
IF (@PnNivel = 4 OR @PnNivel IS NULL)
BEGIN
	UPDATE @IndicadoresCumplimiento 
	SET    ParosJustificados = CJP.ParosJustificados
	FROM (SELECT  ClaUbicacion as ClaUbicacionCJP
				 ,ClaDepartamento AS ClaDepartamentoCJP
				 ,ClaArea AS ClaAreaCJP
				 ,IdCelda AS ClaMaquinaCJP
			     ,@PnAnio AS AnioCJP
			     ,@PnMes AS MesCJP
				 ,SUM(EsJustificado)/Count(1) AS ParosJustificados
		  FROM @CumplimientoJustificacionParo CJP 
		  GROUP BY Anio,Mes,ClaUbicacion,ClaveUbicacion,ClaDepartamento,ClaArea,IdCelda) CJP
	WHERE Nivel = 4
	AND   Anio = CJP.AnioCJP
	AND   Mes =  CJP.MesCJP
	AND   ClaUbicacion    = CJP.ClaUbicacionCJP
	AND   ClaDepartamento = CJP.ClaDepartamentoCJP
	AND   ClaArea         = CJP.ClaAreaCJP
	AND   ClaMaquina      = CJP.ClaMaquinaCJP

	INSERT INTO @IndicadoresCumplimiento
			   ([ClaUbicacion]
			   ,[ClaveUbicacion]
			   ,[Anio]
			   ,[Mes]
			   ,[ClaDepartamento]
			   ,[ClaveDepartamento]
			   ,[ClaArea]
			   ,[ClaveArea]
			   ,[ClaMaquina]
			   ,[ClaveMaquina]
			   ,[Nivel]
			   ,ParosJustificados
			  )
	SELECT      CJP.ClaUbicacion AS ClaUbicacion
			   ,CJP.ClaveUbicacion AS ClaveUbicacion
			   ,@PnAnio AS Anio
			   ,@PnMes AS Mes
			   ,ClaDepartamento AS ClaDepartamento
			   ,ClaveDepartamento AS ClaveDepartamento
			   ,ClaArea AS ClaArea
			   ,ClaveArea AS ClaveArea
			   ,IdCelda AS ClaMaquina
			   ,NomCelda AS ClaveMaquina
			   ,4 AS NIVEL
			   ,SUM(EsJustificado)/Count(1)
	FROM @CumplimientoJustificacionParo CJP
	WHERE NOT EXISTS (SELECT 1 FROM @IndicadoresCumplimiento 
					  WHERE ClaUbicacion = CJP.ClaUbicacion 
							AND Anio = CJP.Anio 
							AND Mes  = CJP.Mes 
							AND Nivel = 4)
	GROUP BY Anio,Mes,ClaUbicacion,ClaveUbicacion,ClaDepartamento,ClaveDepartamento,ClaArea,ClaveArea,IdCelda,NomCelda
END


--FINAL

	/*Limpiamos la Tabla Real*/

	DELETE FROM [AswSch].[AswEstCumplimientoMensual]
	WHERE   Anio = @PnAnio
		AND Mes  = @PnMes
		AND (@PnClaUbicacion IS NULL OR ClaUbicacion = @PnClaUbicacion)
		AND (@PnClaDepartamento IS NULL OR ClaDepartamento = @PnClaDepartamento)
		AND (@PnClaArea IS NULL OR ClaArea = @PnClaArea)
		AND (@PnNivel IS NULL OR Nivel = @PnNivel)

	SELECT @nId = ISNULL(MAX(id),0) 
	FROM [AswSch].[AswEstCumplimientoMensual]

	INSERT INTO [AswSch].[AswEstCumplimientoMensual]
			   (id
			   ,[ClaUbicacion]
			   ,[ClaveUbicacion]
			   ,[Anio]
			   ,[Mes]
			   ,[ClaDepartamento]
			   ,[ClaveDepartamento]
			   ,[ClaArea]
			   ,[ClaveArea]
			   ,[ClaMaquina]
			   ,[ClaveMaquina]
			   ,[Nivel]
			   ,[A1]
			   ,[ProgramaProduccion]
			   ,[JidokaAndonRespuesta]
			   ,[ParosJustificados]
			   ,[BajaLogica]
			   ,[FechaBajaLogica]
			   ,[FechaUltimaMod]
			   ,[NombrePcMod]
			   ,[ClaUsuarioMod])
     SELECT @nId + ROW_NUMBER() OVER (Order by Anio,Mes,Nivel)
		   ,ClaUbicacion
           ,ClaveUbicacion
           ,Anio
           ,Mes
           ,ClaDepartamento
           ,ClaveDepartamento
           ,ClaArea
           ,ClaveArea
           ,ClaMaquina
           ,ClaveMaquina
           ,Nivel
           ,ISNULL(A1,0.0) AS A1
           ,ISNULL(ProgramaProduccion,0.0) AS ProgramaProduccion
           ,ISNULL(JidokaAndonRespuesta,0.0) AS JidokaAndonRespuesta
           ,ISNULL(ParosJustificados,0.0) AS ParosJustificados
           ,0
           ,NULL
           ,GETDATE()
           ,HOST_NAME()
           ,0
	 FROM @IndicadoresCumplimiento
	 WHERE   Anio = @PnAnio
		 AND Mes  = @PnMes
		 AND (@PnClaUbicacion IS NULL OR ClaUbicacion = @PnClaUbicacion)
		 AND (@PnClaDepartamento IS NULL OR ClaDepartamento = @PnClaDepartamento)
		 AND (@PnClaArea IS NULL OR ClaArea = @PnClaArea)
		 AND (@PnNivel IS NULL OR Nivel = @PnNivel)

		
	
END

