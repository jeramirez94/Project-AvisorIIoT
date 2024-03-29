USE [ASW]
GO

DROP PROC [AswSch].[ASW_CU304_Pag2_CalcEgeSemanal]
GO

CREATE PROC [AswSch].[ASW_CU304_Pag2_CalcEgeSemanal]
 @PnClaUbicacion INT
,@PnClaDepartamento INT = NULL
,@PnClaArea INT = NULL
,@PnAnio INT
,@PnMes INT
,@PnNivel INT 

/*

EXEC AswSch.ASW_CU304_Pag2_CalcEgeSemanal
 @PnClaUbicacion = 68
,@PnClaDepartamento  = null
,@PnClaArea  = null
,@PnAnio = 2020
,@PnMes = 09
,@PnNivel =3
*/

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
	
	
	DECLARE  @nNivel INT
		    ,@nClaIndicador INT = 11 --ASIGNAR EL INDICADOR A TRABAJAR
			,@sClaveIndicador VARCHAR(50)
			,@nClaTipoIndicador INT 
			,@sClaveTipoIndicador VARCHAR(25)
			,@sUnidadIndicador VARCHAR(5)
			,@nObjetivo NUMERIC(8,2) = 81
			,@sClaveUbicacion VARCHAR(50)
			,@sNomIndicador varchar(50)
			
--TODO: CAMBIAR A TABLA REAL
	--DATOS UBICACION
	SELECT @sClaveUbicacion = '68 - Mid Continent'

	DECLARE @tblCatIndicador TABLE (
		 ClaUbicacion INT
		,ClaDepartamento INT
		,ClaIndicador INT
		,NomIndicador varchar(50)
		,Unidad VARCHAR(5)
		,Tipo INT
		,Objetivo NUMERIC(8,2)
	);

	;WITH CteObjetivos 
	AS (
	SELECT ClaUbicacion,ClaDepartamento,ClaveIndicador,Objetivo
	FROM
	(SELECT ClaUbicacion,ClaDepartamento,EGE_Obj AS OEE,Eficiencia_Obj as Efficienty,Calidad_Obj as Quality ,Disponibilidad_Obj as [Availability]
	 FROM [AswSch].[AswObjetivosGestionproduccion]
	 WHERE Anio = @PnAnio 
		AND Mes = @PnMes) q 
	UNPIVOT
		(Objetivo FOR ClaveIndicador 
		IN (OEE, [Availability],Efficienty, Quality)
		) AS unpvt )
	INSERT INTO @tblCatIndicador (ClaUbicacion,ClaDepartamento,ClaIndicador,NomIndicador,Unidad,Tipo,Objetivo)
	SELECT ClaUbicacion,ClaDepartamento,ClaIndicador,NomIndicador,Unidad,Tipo,Objetivo
	FROM CteObjetivos CteObj
	JOIN AswSch.AswCatIndicador CatInd
		ON CteObj.ClaveIndicador = CatInd.NomIndicador
	WHERE 
	BajaLogica = 0

	DECLARE @tmpDatos TABLE (
		ClaUbicacion INT,
		ClaveUbicacion VARCHAR(50),
		Anio INT,
		Mes INT,
		Semana INT,
		ClaIndicador INT,
		ClaveIndicador VARCHAR(50),
		ClaTipoIndicador INT,
		ClaveTipoIndicador VARCHAR(50),
		ClaDepartamento INT,
		Departamento VARCHAR(50),
		ClaArea INT,
		Area VARCHAR(50),
		ClaMaquina INT,
		Maquina VARCHAR(50),
		Unidad VARCHAR(4),
		Nails_min numeric(19,2),
		Nails_MinPosibles numeric(19,2),
		Sched_Hrs numeric(19,2),
		Run_Hrs numeric(19,2),
		TotalHrsTurnoDia numeric(19,2)
	)

	DECLARE @tmpIndicador TABLE (
		ClaUbicacion INT,
		ClaveUbicacion VARCHAR(50),
		Anio INT,
		Mes INT,
		Semana INT,
		ClaIndicador INT,
		ClaveIndicador VARCHAR(50),
		ClaTipoIndicador INT,
		ClaveTipoIndicador VARCHAR(50),
		ClaDepartamento INT,
		Departamento VARCHAR(50),
		ClaArea INT,
		Area VARCHAR(50),
		ClaMaquina INT,
		Maquina VARCHAR(50),
		Unidad VARCHAR(4),
		Objetivo NUMERIC(8,2),
		Nivel INT,
		NomIndicador VARCHAR(50),
		Efficienty NUMERIC(8,2),
		[Availability] NUMERIC(8,2),
		[Utilization] NUMERIC(8,2),
		Quality NUMERIC(8,2),
		OEE NUMERIC(8,2)
	)

	DECLARE @tmpIndicadorFinal TABLE (
		ClaUbicacion INT,
		ClaveUbicacion VARCHAR(50),
		Anio INT,
		Mes INT,
		Semana INT,
		ClaIndicador INT,
		ClaveIndicador VARCHAR(50),
		ClaTipoIndicador INT,
		ClaveTipoIndicador VARCHAR(50),
		ClaDepartamento INT,
		Departamento VARCHAR(50),
		ClaArea INT,
		Area VARCHAR(50),
		ClaMaquina INT,
		Maquina VARCHAR(50),
		Unidad VARCHAR(4),
		Objetivo NUMERIC(8,2),
		Nivel INT,
		NomIndicador VARCHAR(50),
		valor NUMERIC(8,2)
	)
		
	--OBTENER DATOS PARA EL CALCULO - DE ORIGEN LOS DATOS VIENEN SEPARADOS POR TURNO ASI QUE LOS AGRUPAMOS POR DIA
	INSERT INTO @tmpDatos
	SELECT   MPTP.ClaUbicacion
			,@sClaveUbicacion
			,@PnAnio AS Anio
			,@PnMes  AS Mes
			,Sa.SemanaDelAnio AS Semana
			,NULL  AS ClaIndicador 
			,NULL  AS ClaveIndicador
			,NULL  AS ClaTipoIndicador
			,NULL  AS ClaveTipoIndicador
			,MPTP.ClaDepartamento
			,DPT.NomDepartamentoIngles as Departamento
			,MPTP.ClaArea
			,TC.NomTipoCelda as Area
			,MPTP.ClaMaquina
			,Cell.Descripcion as Maquina
			,NULL AS UnidadIndicador 
			,SUM(ISNULL(MPTP.Nails_min,0)) as Nails_min
			,Sum(ISNULL(MPTP.Nails_MinPosibles,0)) as Nails_MinPosibles
			,SUM(ISNULL(MPTP.HrsProgramadas,0)) as Sched_Hrs
			,SUM(ISNULL(MPTP.Duracion,0)) as Run_Hrs
			,SUM(ISNULL(MPTP.TotalHrsTurno,0)) as TotalHrsTurnoDia
	FROM [AswSch].[AswPalTraProduccionMCSW] MPTP
	LEFT	JOIN [AswSch].[AswCatDepartamento] DPT
			ON DPT.ClaDepartamento = MPTP.ClaDepartamento
	LEFT	JOIN [AswSch].[AswCatTipoCelda] TC
			ON TC.ClaTipoCelda = MPTP.ClaArea
	LEFT	JOIN [AswSch].[AswCatCeldas] Cell
			ON Cell.IdCelda = MPTP.ClaMaquina
			AND Cell.ClaAreaProduccion = MPTP.ClaDepartamento
			AND Cell.ClaTipoCelda = MPTP.ClaArea 
	JOIN [AswSemanaAnio] SA
		ON YEAR(MPTP.Fecha) = SA.Anio
		AND MONTH(MPTP.Fecha) = SA.MesAdm
		AND MPTP.Fecha BETWEEN FechaInicioAdm AND FechaFinAdm
	WHERE YEAR(MPTP.Fecha) = @PnAnio
	AND MONTH(MPTP.Fecha) = @PnMes
	AND (@PnClaDepartamento IS NULL OR MPTP.ClaDepartamento = @PnClaDepartamento)
	AND (@PnClaArea IS NULL OR MPTP.ClaArea = @PnClaArea)
	GROUP BY MPTP.ClaUbicacion,MPTP.ClaDepartamento,MPTP.ClaArea
	,MPTP.ClaMaquina,DPT.NomDepartamentoIngles,TC.NomTipoCelda,Cell.Descripcion
	,SA.SemanaDelAnio
	

	--DEPENDIENDO EL NIVEL VAMOS A LA ETIQUETA QUE LE CORRESPONDE
	IF @PnNivel = 1
		GOTO NIVEL1
	ELSE IF @PnNivel = 2
		GOTO NIVEL2
	ELSE IF @PnNivel = 3
		GOTO NIVEL3
	ELSE IF @PnNivel = 4
		GOTO NIVEL4
	
	

	--NIVEL 1 PLANTA 
	NIVEL1:
		SET @nNivel = 1 

		INSERT INTO @tmpIndicador
		SELECT   tmp.ClaUbicacion
				,@sClaveUbicacion as ClaveUbicacion
				,tmp.Anio
				,tmp.Mes
				,tmp.Semana
				,tmp.ClaIndicador
				,tmp.ClaveIndicador
				,tmp.ClaTipoIndicador
				,tmp.ClaveTipoIndicador
				,null as ClaDepartamento
				,null as Departamento
				,null as ClaArea
				,null as Area
				,null as ClaMaquina
				,null as Maquina
				,tmp.Unidad
				,NULL as objetivo
				,@nNivel as Nivel
				,tmp.ClaveUbicacion as NomIndicador
				,CASE WHEN SUM(Nails_MinPosibles) = 0 THEN 0 ELSE SUM(Nails_min)/SUM(Nails_MinPosibles) END as Efficienty
				,CASE WHEN SUM(TotalHrsTurnoDia)  = 0  THEN 0 ELSE SUM(Run_Hrs) / SUM(TotalHrsTurnoDia) END as [Availability] 
				,CASE WHEN SUM(Sched_hrs) = 0 THEN 0 ELSE SUM(Run_Hrs) / SUM(Sched_hrs) END as Utilization
				,1 AS Quality
				,CASE WHEN SUM(tmp.Nails_MinPosibles) = 0 OR SUM(tmp.TotalHrsTurnoDia) = 0 OR SUM(tmp.Sched_hrs) = 0
					  THEN 0
					  ELSE SUM(tmp.Nails_min)/SUM(tmp.Nails_MinPosibles) *  SUM(tmp.Run_Hrs) / SUM(tmp.TotalHrsTurnoDia) *  SUM(tmp.Run_Hrs) / SUM(tmp.Sched_hrs) * 100
				 END AS OEE
		FROM @tmpDatos tmp
		GROUP BY tmp.ClaUbicacion,tmp.Anio,tmp.Mes,tmp.Semana,tmp.ClaIndicador
				,tmp.ClaveIndicador
				,tmp.ClaTipoIndicador
				,tmp.ClaveTipoIndicador
				,tmp.Unidad,tmp.ClaveUbicacion
	
	IF @PnNivel IS NOT NULL
		GOTO FINAL

	----NIVEL 2 - DEPARTAMENTO 
	NIVEL2:
	SET @nNivel = 2

	INSERT INTO @tmpIndicador
	SELECT   tmp.ClaUbicacion
		    ,@sClaveUbicacion as ClaveUbicacion
		    ,tmp.Anio
			,tmp.Mes
			,tmp.Semana
			,tmp.ClaIndicador
			,tmp.ClaveIndicador
			,tmp.ClaTipoIndicador
			,tmp.ClaveTipoIndicador
			,tmp.ClaDepartamento as ClaDepartamento
			,tmp.Departamento as Departamento
			,null as ClaArea
			,null as Area
			,null as ClaMaquina
			,null as Maquina
			,tmp.Unidad
			,NULL as objetivo
			,@nNivel as Nivel
			,tmp.Departamento as NomIndicador
		    ,CASE WHEN SUM(Nails_MinPosibles) = 0 THEN 0 ELSE SUM(Nails_min)/SUM(Nails_MinPosibles) END as Efficienty
			,CASE WHEN SUM(TotalHrsTurnoDia)  = 0  THEN 0 ELSE SUM(Run_Hrs) / SUM(TotalHrsTurnoDia) END as [Availability] 
			,CASE WHEN SUM(Sched_hrs) = 0 THEN 0 ELSE SUM(Run_Hrs) / SUM(Sched_hrs) END as Utilization
			,1 AS Quality
			,CASE WHEN SUM(tmp.Nails_MinPosibles) = 0 OR SUM(tmp.TotalHrsTurnoDia) = 0 OR SUM(tmp.Sched_hrs) = 0
				  THEN 0
				  ELSE SUM(tmp.Nails_min)/SUM(tmp.Nails_MinPosibles) *  SUM(tmp.Run_Hrs) / SUM(tmp.TotalHrsTurnoDia) *  SUM(tmp.Run_Hrs) / SUM(tmp.Sched_hrs) * 100
		     END AS OEE
	FROM @tmpDatos tmp
	JOIN [AswSch].[AswObjetivosGestionproduccion] ObInd
		ON  tmp.Anio = ObInd.Anio
		AND tmp.Mes = ObInd.Mes
		AND tmp.ClaDepartamento = ObInd.ClaDepartamento
	GROUP BY tmp.ClaUbicacion,tmp.Anio,tmp.Mes,tmp.Semana,tmp.ClaIndicador
			,tmp.ClaveIndicador
			,tmp.ClaTipoIndicador
			,tmp.ClaveTipoIndicador
			,tmp.Unidad,tmp.ClaveUbicacion,tmp.ClaDepartamento,tmp.Departamento,ObInd.EGE_Obj

	IF @PnNivel IS NOT NULL
		GOTO FINAL

	--NIVEL 3 - AREA
	NIVEL3:
	SET @nNivel = 3

	INSERT INTO @tmpIndicador
	SELECT  tmp.ClaUbicacion
		    ,@sClaveUbicacion as ClaveUbicacion
		    ,tmp.Anio
			,tmp.Mes
			,tmp.Semana
			,tmp.ClaIndicador
			,tmp.ClaveIndicador
			,tmp.ClaTipoIndicador
			,tmp.ClaveTipoIndicador
			,tmp.ClaDepartamento as ClaDepartamento
			,tmp.Departamento as Departamento
			,tmp.ClaArea as ClaArea
			,tmp.Area as Area
			,null as ClaMaquina
			,null as Maquina
			,tmp.Unidad
			,NULL as objetivo
			,@nNivel as Nivel
			,tmp.Area as NomIndicador
		    ,CASE WHEN SUM(Nails_MinPosibles) = 0 THEN 0 ELSE SUM(Nails_min)/SUM(Nails_MinPosibles) END as Efficienty
			,CASE WHEN SUM(TotalHrsTurnoDia)  = 0  THEN 0 ELSE SUM(Run_Hrs) / SUM(TotalHrsTurnoDia) END as [Availability] 
			,CASE WHEN SUM(Sched_hrs) = 0 THEN 0 ELSE SUM(Run_Hrs) / SUM(Sched_hrs) END as Utilization
			,1 AS Quality
			,CASE WHEN SUM(tmp.Nails_MinPosibles) = 0 OR SUM(tmp.TotalHrsTurnoDia) = 0 OR SUM(tmp.Sched_hrs) = 0
				  THEN 0
				  ELSE SUM(tmp.Nails_min)/SUM(tmp.Nails_MinPosibles) *  SUM(tmp.Run_Hrs) / SUM(tmp.TotalHrsTurnoDia) *  SUM(tmp.Run_Hrs) / SUM(tmp.Sched_hrs) * 100
		     END AS OEE
	FROM @tmpDatos tmp
	JOIN [AswSch].[AswObjetivosGestionproduccion] ObInd
		ON  tmp.Anio = ObInd.Anio
		AND tmp.Mes = ObInd.Mes
		AND tmp.ClaDepartamento = ObInd.ClaDepartamento
	GROUP BY tmp.ClaUbicacion,tmp.Anio,tmp.Mes,Semana,ClaIndicador
			,tmp.ClaveIndicador
			,tmp.ClaTipoIndicador
			,tmp.ClaveTipoIndicador
			,tmp.Unidad,tmp.ClaveUbicacion,tmp.ClaDepartamento,tmp.Departamento,tmp.ClaArea,tmp.Area
			,ObInd.EGE_Obj
	
	IF @PnNivel IS NOT NULL
		GOTO FINAL

	--NIVEL 4 - MAQUINA
	NIVEL4:
	SET @nNivel = 4

	INSERT INTO @tmpIndicador
	SELECT   tmp.ClaUbicacion
		    ,@sClaveUbicacion as ClaveUbicacion
		    ,tmp.Anio
			,tmp.Mes
			,tmp.Semana
			,tmp.ClaIndicador
			,tmp.ClaveIndicador
			,tmp.ClaTipoIndicador
			,tmp.ClaveTipoIndicador
			,tmp.ClaDepartamento as ClaDepartamento
			,tmp.Departamento as Departamento
			,tmp.ClaArea as ClaArea
			,tmp.Area as Area
			,tmp.ClaMaquina as ClaMaquina
			,tmp.Maquina as Maquina
			,tmp.Unidad
			,NULL as objetivo
			,@nNivel as Nivel
			,tmp.Maquina as NomIndicador
		    ,CASE WHEN SUM(Nails_MinPosibles) = 0 THEN 0 ELSE SUM(Nails_min)/SUM(Nails_MinPosibles) END as Efficienty
			,CASE WHEN SUM(TotalHrsTurnoDia)  = 0  THEN 0 ELSE SUM(Run_Hrs) / SUM(TotalHrsTurnoDia) END as [Availability] 
			,CASE WHEN SUM(Sched_hrs) = 0 THEN 0 ELSE SUM(Run_Hrs) / SUM(Sched_hrs) END as Utilization
			,1 AS Quality
			,CASE WHEN SUM(tmp.Nails_MinPosibles) = 0 OR SUM(tmp.TotalHrsTurnoDia) = 0 OR SUM(tmp.Sched_hrs) = 0
				  THEN 0
				  ELSE SUM(tmp.Nails_min)/SUM(tmp.Nails_MinPosibles) *  SUM(tmp.Run_Hrs) / SUM(tmp.TotalHrsTurnoDia) *  SUM(tmp.Run_Hrs) / SUM(tmp.Sched_hrs) * 100
		     END AS OEE
	FROM @tmpDatos tmp
	JOIN [AswSch].[AswObjetivosGestionproduccion] ObInd
		ON  tmp.Anio = ObInd.Anio
		AND tmp.Mes = ObInd.Mes
		AND tmp.ClaDepartamento = ObInd.ClaDepartamento
	GROUP BY tmp.ClaUbicacion,tmp.Anio,tmp.Mes,tmp.Semana,tmp.ClaIndicador
			,tmp.ClaveIndicador
			,tmp.ClaTipoIndicador
			,tmp.ClaveTipoIndicador
			,tmp.Unidad,tmp.ClaveUbicacion,tmp.ClaDepartamento,tmp.Departamento,tmp.ClaArea,tmp.Area,tmp.ClaMaquina,tmp.Maquina
			,ObInd.EGE_Obj


	FINAL: 

		SELECT  ClaUbicacion,
				ClaveUbicacion,
				Anio ,
				Mes ,
				Semana ,
				--ClaTipoIndicador ,
				--ClaveTipoIndicador ,
				ClaDepartamento ,
				Departamento ,
				ClaArea ,
				Area ,
				ClaMaquina ,
				Maquina ,
				--Unidad ,
				--Objetivo ,
				Nivel ,
				NomIndicador,
				OEE, [Availability],Efficienty, Quality,Utilization
			   FROM @tmpIndicador

	/*
		--HACE UN UNPIVOT PARA PASAR LOS VALORES DE LOS INDICADORES A RENGLONES
		INSERT INTO @tmpIndicadorFinal
			SELECT ClaUbicacion ,
			ClaveUbicacion,
			Anio ,
			Mes ,
			Semana ,
			NULL AS ClaIndicador ,
			ClaveIndicador,
			NULL AS ClaTipoIndicador ,
			ClaveTipoIndicador ,
			ClaDepartamento ,
			Departamento ,
			ClaArea ,
			Area ,
			ClaMaquina ,
			Maquina ,
			Unidad ,
			Objetivo ,
			Nivel ,
			NomIndicador,
			valor
		FROM   
		   (SELECT ClaUbicacion,
			ClaveUbicacion,
			Anio ,
			Mes ,
			Semana ,
			ClaTipoIndicador ,
			ClaveTipoIndicador ,
			ClaDepartamento ,
			Departamento ,
			ClaArea ,
			Area ,
			ClaMaquina ,
			Maquina ,
			Unidad ,
			Objetivo ,
			Nivel ,
			NomIndicador,
			OEE, [Availability],Efficienty, Quality,Utilization
		   FROM @tmpIndicador) p  
		UNPIVOT  
		   (valor FOR ClaveIndicador IN   
			  (OEE, [Availability], Efficienty, Quality,Utilization)  
		)AS unpvt;  

		--JOIN PARA OBTENER INFORMACION GENERAL DEL CATALOGO DE INDICADORES
		SELECT tmp.ClaUbicacion ,
			tmp.ClaveUbicacion ,
			tmp.Anio ,
			tmp.Mes ,
			CAST(tmp.Semana as varchar)+' - '+ FORMAT(SA.FechaInicioAdm ,'MMM','en-US') +' '+ CAST(DAY(SA.FechaInicioAdm) as varchar) as semana,
			Ind.ClaIndicador ,
			CAST(Ind.ClaIndicador AS VARCHAR)+' - '+ClaveIndicador AS ClaveIndicador , 
			Ind.Tipo ,
			CAST(Ind.Tipo AS VARCHAR) + ' - ' + CASE WHEN Ind.Tipo = 1 THEN 'Result' WHEN Ind.Tipo = 2 THEN 'Prosess' END as ClaveTipoIndicador,
			tmp.ClaDepartamento ,
			CAST(tmp.ClaDepartamento AS VARCHAR )+ ' - ' + tmp.Departamento as Departamento,
			tmp.ClaArea ,
			CAST(ClaArea AS VARCHAR)+ ' - ' + tmp.Area as Area,
			tmp.ClaMaquina ,
			CAST(ClaMaquina AS VARCHAR)+ ' - '  + tmp.Maquina as Maquina,
			Ind.Unidad,
			Ind.Objetivo,
			tmp.Nivel ,
			tmp.NomIndicador,
			tmp.valor
		FROM @tmpIndicadorFinal tmp
		JOIN @tblCatIndicador Ind
			ON tmp.ClaveIndicador = Ind.NomIndicador
			AND (tmp.ClaDepartamento = Ind.ClaDepartamento OR (tmp.ClaDepartamento IS NULL))
		LEFT JOIN [AswSch].[AswObjetivosGestionproduccion] ObInd
			ON  tmp.Anio = ObInd.Anio
			AND tmp.Mes = ObInd.Mes
			AND tmp.ClaDepartamento = ObInd.ClaDepartamento
		JOIN [AswSemanaAnio] SA
		ON tmp.Anio = SA.Anio
			AND tmp.Mes = SA.MesAdm
			AND tmp.Semana = SA.SemanaDelAnio
		GROUP BY tmp.ClaUbicacion ,
				 tmp.ClaveUbicacion ,
				 tmp.Anio ,
				 tmp.Mes ,
				 tmp.Semana ,
				 Ind.ClaIndicador ,
				 ClaveIndicador,Tipo,
				 tmp.ClaDepartamento ,
				 tmp.ClaArea,
				 tmp.ClaMaquina ,
				 tmp.Maquina,
				 Ind.Unidad,
				 Ind.Objetivo,
				 tmp.Nivel ,
				 tmp.NomIndicador,
				 tmp.valor,
				 tmp.Departamento,
				 tmp.Area,
				 SA.FechaInicioAdm
				 */
END



