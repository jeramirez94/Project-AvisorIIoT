--USE [ASW]
--GO
/****** Object:  StoredProcedure [AswSch].[ASW_CU999_Pag3_AvisorProduccionParos]    Script Date: 15/11/2022 04:18:57 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [AswSch].[ASW_CU999_Pag3_AvisorProduccionParos]
	@dFechaAdm date,
	@nClaTurno int,
	@PnDebug int = 0
AS
BEGIN
	 

	DECLARE @TblCeldas TABLE (
		IdCelda           VARCHAR(30),
		ClaveCelda        VARCHAR(30),
		ClaAreaProduccion INT,
		NomAreaProduccion VARCHAR(50),
		Descripcion       VARCHAR(60)
	)

	INSERT INTO @TblCeldas (
		 IdCelda
		,ClaveCelda
		,ClaAreaProduccion
		,Descripcion
	)
	SELECT IdWorkCenter
		  ,ClaveWorkCenter
		  ,ClaDepartamento
		  ,NomWorkCenter
	FROM AswSch.AswCatWorkCenterVw
	WHERE IdWorkCenter in (26
,28
,29
,30
,31
,33
,34
,35
,37
,38
,106
,110
,112)

	--select * from @TblCeldas


	DECLARE @tblDatos TABLE (
		 idCelda varchar(30)
		,NomCelda varchar(60)
		,IdComponente varchar(30)
		,NomComponente varchar(60)
		,NomTipoComponente varchar(60)
		,OrdenTipoMaquina int
		,produccionAvisor int 
		,tiempoParoAvisor numeric(4,2)
		,produccionERP int
		,tiempoParoERP numeric(4,2)
		,ClaTurno int
		,Nivel int
		,Fecha date
	)


	;WITH cteParos as (
		SELECT idParo
			,IdComponente
			,FechaHoraInicial
			,FechaHoraFinal
			,MicroParoSN
			,DuracionSegundos
			,ClaTurno
			,FechaAdmScada
		FROM [AswSch].[AswBitBitacoraParo]
		GROUP BY idParo
				,IdComponente
				,FechaHoraInicial
				,FechaHoraFinal
				,MicroParoSN
				,DuracionSegundos
				,ClaTurno
				,FechaAdmScada
	)
	INSERT INTO @tblDatos (idCelda
		,NomCelda
		,IdComponente 
		,NomComponente 
		,NomTipoComponente 
		,OrdenTipoMaquina
		,produccionAvisor 
		,tiempoParoAvisor 
		,produccionERP 
		,tiempoParoERP 
		,ClaTurno 
		,Nivel 
		,Fecha 
		)
	SELECT  
		 C.IdWorkCenter
		,C.NomWorkCenter
		,M.ClaMaquina
		,M.NomMaquina
		,CASE M.ClaTipoMaquina
			WHEN 1 THEN 'Header'
			WHEN 2 THEN 'Threader'
			WHEN 3 THEN 'Collator'
			WHEN 4 THEN 'Cleaner'
			WHEN 6 THEN 'Robot'
			ELSE NomMaquina 
		 END AS TipoMaquina
		 ,CASE M.ClaTipoMaquina
			WHEN 1 THEN 1
			WHEN 2 THEN 2
			WHEN 3 THEN 3
			WHEN 4 THEN 4
			WHEN 6 THEN 5
			ELSE NomMaquina 
		 END AS OrdenTipoMaquina
		 ,null as produccionAvisor
		 ,SUM(duracionsegundos)/3600.0 as tiempoParoAvisor
		 ,null as produccionERP
		 ,null as tiempoParoERP
		 ,@nClaTurno
		 ,0 as nivel
		 ,@dFechaAdm
	FROM @TblCeldas tmpCel
	LEFT JOIN AswSch.AswCatWorkCenterVw C
		ON tmpCel.IdCelda = C.IdWorkCenter
	LEFT JOIN AswSch.AswCatWorkUnitVw M
		ON M.IdWorkCenter = C.IdWorkCenter
		AND ISNULL(M.BajaLogica,0) = 0
	LEFT JOIN cteParos BitParo
		ON M.ClaMaquina = BitParo.IdComponente
		AND  BitParo.FechaAdmSCADA = @dFechaAdm
		AND BitParo.ClaTurno = @nClaTurno
	LEFT JOIN AswSch.AswCatTurno T
		ON BitParo.ClaTurno = T.ClaTurno
	
	GROUP BY C.IdWorkCenter
			,C.NomWorkCenter
			,M.ClaMaquina
			,M.NomMaquina
			,M.ClaTipoMaquina
			,BitParo.ClaTurno
			,BitParo.FechaAdmSCADA

	IF @PnDebug = 1
	BEGIN

	SELECT idParo
			,IdComponente
			,FechaHoraInicial
			,FechaHoraFinal
			,MicroParoSN
			,DuracionSegundos
			,ClaTurno
			,FechaAdmScada
		FROM [AswSch].[AswBitBitacoraParo]
		WHERE IdComponente = 34
		GROUP BY idParo
				,IdComponente
				,FechaHoraInicial
				,FechaHoraFinal
				,MicroParoSN
				,DuracionSegundos
				,ClaTurno
				,FechaAdmScada
		ORDER BY FechaAdmSCADA

		SELECT * FROM @TblCeldas
		SELECT * FROM @tblDatos
	END

	;WITH cteProduccion AS (
		SELECT tmpCel.IdCelda,IdComponente,count(OPD.IdUnidad) as cajas
		FROM @TblCeldas tmpCel
		LEFT JOIN AswSch.AswCatWorkCenterVw C
			ON tmpCel.IdCelda = C.IdWorkCenter
		LEFT JOIN AswSch.AswCatWorkUnitVw M
			ON M.IdWorkCenter = C.IdWorkCenter
		LEFT JOIN AswSch.ASWTraOrdenProduccionDet OPD
			ON OPD.IdComponente = M.ClaMaquina
		JOIN AswSch.AswCatTurno T
			ON   OPD.ClaTurno = T.ClaTurno
		WHERE OPD.FechaInicioAdm = @dFechaAdm
		and T.ClaTurno = 1
		group by tmpCel.IdCelda,IdComponente
	)
	UPDATE tmp
	SET tmp.produccionAvisor = prod.cajas
	FROM cteProduccion prod
	JOIN @tblDatos tmp
		ON tmp.idCelda = prod.IdCelda
		AND tmp.IdComponente = prod.IdComponente

	--DECLARE @sIdCelda VARCHAR(30)
	
	--SELECT @sIdCelda = MIN(idCelda) 
	--FROM @tblDatos

	--WHILE @sIdCelda is not null
	--BEGIN
		

		
	--	SELECT @sIdCelda = MIN(idCelda) 
	--	FROM   @tblDatos
	--	WHERE idCelda > @sIdCelda

	--END
	
	UPDATE D
	SET D.tiempoParoERP = 10 - ERP.RunHrs 
	FROM @tblDatos D
	LEFT JOIN [MSW_LNKSVR].[MCSW_ERP].MswSch.MswTraProduccionCeldaTabletCaptMaquina4Vw ERP
	ON  D.idCelda = ERP.IdCelda 
	AND D.IdComponente = ERP.ClaMaquina
	AND D.ClaTurno = ERP.ClaTurno
	AND D.Fecha = ERP.Fecha 

	 UPDATE D
	 SET D.produccionERP = ERP.CantidadUnidades
	 FROM @tblDatos D
	 LEFT JOIN [MSW_LNKSVR].[MCSW_ERP].MSWSch.MSWPalTraProduccionVw ERP
	 ON D.idCelda = ERP.ClaMaquina
	 AND D.Fecha = ERP.Fecha
	 AND ERP.BajaLogica = 0
	 AND D.ClaTurno = ERP.ClaTurno
	 WHERE D.NomTipoComponente = 'Robot' 
	
	select * from @tblDatos

	--select idcelda,[HEADER],[THREADER],[COLLATOR],[ROBOT]
	--from ( 
	--	select idcelda,NomTipocomponente,tiempoParoAvisor from  @tblDatos
	--) as A
	--pivot (
	--	max(tiempoParoAvisor)
	--	for NomTipocomponente in ([HEADER],[THREADER],[COLLATOR],[ROBOT]  )
	--) as b

END
