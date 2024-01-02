--USE [ASW]
--GO
/****** Object:  StoredProcedure [AswSch].[ASW_CU305_Pag1_ObtenerEstado]    Script Date: 15/11/2022 02:45:09 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*========================================== 
* CU305.1 
* Objetivo: Obtener el estado de las maquinas de un workcenter  
* Autor: mrodriguezc
* Fecha: ? 
-- EXEC [AswSch].[ASW_CU305_Pag1_ObtenerEstado] 68, '2022-04-22T00:00:00Z', '2022-07-29T00:00:00Z' , 33, 0, 0
-- EXEC [AswSch].[ASW_CU305_Pag1_ObtenerEstado] 68, '2022-06-27T12:00:00Z', '2022-06-27T21:59:21Z' , 34, 1, 0
-- EXEC  [AswSch].[ASW_CU305_Pag1_ObtenerEstado] 65, '2023-02-20T12:10:21.673Z', '2023-02-20T12:22:14.323Z', 'FF-04', 1, 1
-- EXEC  [AswSch].[ASW_CU305_Pag1_ObtenerEGE] $ClaUbicacion, '${__from:date}', '${__to:date}', $Cell, 1
* 17/02/2023 MRODRIGUEZC Se hace una distincion entre las ubicacion por ser incompatible el origen de las señales crudas 
*========================================== */ 
ALTER PROC [AswSch].[ASW_CU305_Pag1_ObtenerEstado]
	@pnClaUbicacion INT
	,@ptFechaDesde DATETIME
	,@ptFechaHasta DATETIME
	,@psIdCelda VARCHAR(30)
	,@pnTiempoUTC INT = 0
	,@pnDebug INT = 0
AS
BEGIN

	IF @pnTiempoUTC = 1
	BEGIN
		SET @ptFechaDesde = dateadd(hh, datediff(hh, getutcdate(), getdate()), @ptFechaDesde)
		SET @ptFechaHasta = dateadd(hh, datediff(hh, getutcdate(), getdate()), @ptFechaHasta)
	END

	--MRODRIGUEZC 2023-02-17 Origen de señales crudas por ubicacion
	IF @pnClaUbicacion = 68
	BEGIN
		;WITH CteBitacoraParo AS(
			SELECT ClaMaquina
				,FechaHoraInicial
				,FechaHoraFinal
				,ClaTipoMaquina
				,MicroParoSN
				,ClaSeccionParo
			FROM [AswSch].[AswBitBitacoraParo] P
			JOIN [AswSch].[AswCatWorkUnitVw] M
				ON P.IdComponente = M.ClaMaquina
			WHERE IdWorkCenter = @psIdCelda
				AND FechaHoraInicial<=@ptFechaHasta
				AND FechaHoraFinal>@ptFechaDesde
		)
		SELECT --DISTINCT
			CASE WHEN @pnTiempoUTC=1 THEN dateadd(hh, -datediff(hh, getutcdate(), getdate()), FechaHoraAvisor) ELSE FechaHoraAvisor END AS time
			,CASE WHEN PH.MicroParoSN = 1 AND [Header_Status]=0 THEN 2 WHEN PH.ClaSeccionParo<>184 AND [Header_Status]=0 THEN 3 ELSE [Header_Status] END AS Header
			,CASE WHEN PT.MicroParoSN = 1 AND [Threader_Status]=0 THEN 2 WHEN PT.ClaSeccionParo<>184 AND [Threader_Status]=0 THEN 3 ELSE [Threader_Status] END AS Threader
			,CASE WHEN PC.MicroParoSN = 1 AND [Collator_Status]=0 THEN 2 WHEN PC.ClaSeccionParo<>184 AND [Collator_Status]=0 THEN 3 ELSE [Collator_Status] END AS Collator
			,CASE WHEN PR.MicroParoSN = 1 AND [Robot_Status]=0 THEN 2 WHEN PR.ClaSeccionParo<>184 AND [Robot_Status]=0 THEN 3 ELSE [Robot_Status] END AS Robot
		FROM [AswSch].[AswBitSeñal] S
		LEFT JOIN CteBitacoraParo PH
			ON S.FechaHoraAvisor BETWEEN PH.FechaHoraInicial AND PH.FechaHoraFinal
			AND PH.ClaTipoMaquina = 1
		LEFT JOIN CteBitacoraParo PT
			ON S.FechaHoraAvisor BETWEEN PT.FechaHoraInicial AND PT.FechaHoraFinal
			AND PT.ClaTipoMaquina = 2
		LEFT JOIN CteBitacoraParo PC
			ON S.FechaHoraAvisor BETWEEN PC.FechaHoraInicial AND PC.FechaHoraFinal
			AND PC.ClaTipoMaquina = 3
		LEFT JOIN CteBitacoraParo PR
			ON S.FechaHoraAvisor BETWEEN PR.FechaHoraInicial AND PR.FechaHoraFinal
			AND PR.ClaTipoMaquina = 6
		WHERE 
			FechaHoraAvisor >= @ptFechaDesde
			AND FechaHoraAvisor <= @ptFechaHasta
			AND IdCelda = @psIdCelda
		ORDER BY 1
	END
	IF @pnClaUbicacion = 65
	BEGIN
		;WITH CteBitacoraParo AS(
			SELECT ClaMaquina
				,FechaHoraInicial
				,FechaHoraFinal
				,ClaTipoMaquina
				,MicroParoSN
				,ClaSeccionParo
			FROM [AswSch].[AswBitBitacoraParo] P
			JOIN [AswSch].[AswCatWorkUnitVw] M
				ON P.IdComponente = M.ClaMaquina
			WHERE IdWorkCenter = @psIdCelda
				AND FechaHoraInicial<=@ptFechaHasta
				AND FechaHoraFinal>@ptFechaDesde
		)
		SELECT --DISTINCT
			CASE WHEN @pnTiempoUTC=1 THEN dateadd(hh, -datediff(hh, getutcdate(), getdate()), FechaHoraMaquina) ELSE FechaHoraMaquina END AS time
			,CASE WHEN BP.MicroParoSN = 1 AND Valor=0 THEN 2 WHEN BP.ClaSeccionParo<>184 AND Valor=0 THEN 3 ELSE Valor END AS [ ]
		FROM [AswSch].[AswRecBitVariable] S
		JOIN [AswSch].[AswCatWorkUnitVw] WU
			ON S.ClaMaquina = WU.ClaMaquina
		LEFT JOIN CteBitacoraParo BP
			ON S.ClaMaquina = BP.ClaMaquina
			AND S.FechaHoraMaquina >= BP.FechaHoraInicial 
			AND S.FechaHoraMaquina <= BP.FechaHoraFinal
		WHERE 
			S.FechaHoraMaquina >= @ptFechaDesde
			AND S.FechaHoraMaquina <= @ptFechaHasta
			AND WU.IdWorkCenter = @psIdCelda 
			AND S.ClaVariable = 1 --Estatus
		ORDER BY 1

		IF (@pnDebug = 1) 
		BEGIN
			;WITH CteBitacoraParo AS(
				SELECT IdWorkCenter
					,ClaMaquina
					,FechaHoraInicial
					,FechaHoraFinal
					,ClaTipoMaquina
					,MicroParoSN
					,ClaSeccionParo
				FROM [AswSch].[AswBitBitacoraParo] P
				JOIN [AswSch].[AswCatWorkUnitVw] M
					ON P.IdComponente = M.ClaMaquina
				WHERE IdWorkCenter = @psIdCelda
					AND FechaHoraInicial<=@ptFechaHasta
					AND FechaHoraFinal>@ptFechaDesde
			)
			SELECT S.*
			FROM [AswSch].[AswRecBitVariable] S
			JOIN [AswSch].[AswCatWorkUnitVw] WU
				ON S.ClaMaquina = WU.ClaMaquina
			LEFT JOIN CteBitacoraParo BP
				ON S.ClaMaquina = BP.ClaMaquina
				AND S.FechaHoraMaquina >= BP.FechaHoraInicial 
				AND S.FechaHoraMaquina <= BP.FechaHoraFinal
			WHERE 
				S.FechaHoraMaquina >= @ptFechaDesde
				AND S.FechaHoraMaquina <= @ptFechaHasta
				AND WU.IdWorkCenter = @psIdCelda 
				AND S.ClaVariable = 1 --Estatus
			ORDER BY 1
		END
	END

END

