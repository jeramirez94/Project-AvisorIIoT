USE [ASWH]
GO
/****** Object:  StoredProcedure [AswSch].[AviObtieneBitProduccion_Srv]    Script Date: 29/06/2023 12:35:06 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*==========================================
* CU: 182.1
* Objetivo: Servicio para que el pal consuma los datos de produccion 
* Autor: mrodriguez
* Fecha: 2023-05-20
* EXEC [AswSch].[AviObtieneBitProduccion_Srv] 65, '2023-06-29', '2023-06-29', ''
*========================================== */
ALTER PROCEDURE [AswSch].[AviObtieneBitProduccion_Srv]
	@pnClaUbicacion	INT
	,@pdFechaInicio	DATETIME --adm
	,@pdFechaFin	DATETIME --adm
	,@psClaMaquina	VARCHAR(30)--'' todas

AS
BEGIN
	--SELECT @pnClaUbicacion = 65
	--	,@pdFechaInicio = '2023-05-15'
	--	,@pdFechaFin = '2023-05-15'
	--	,@psClaMaquina = 'FF-03'


	;WITH CteVelocidadRollo AS (
		SELECT P.Id
			,P.IdComponente
			,AVG(Valor) AS Velocidad
		FROM [AswSch].[AswBitBitacoraProduccion] P
		LEFT JOIN [AswSch].[AswRecBitVariable] V
			ON P.ClaUbicacion = V.ClaUbicacion
			AND P.IdComponente = V.ClaMaquina
			AND P.FechaHoraInicio <= V.FechaHoraMaquina
			AND P.FechaHoraFin >= V.FechaHoraMaquina
			AND V.ClaVariable = 4 --velocidad
		WHERE P.ClaUbicacion = @pnClaUbicacion
			AND P.FechaAdm >= @pdFechaInicio
			AND P.FechaAdm <= @pdFechaFin
			AND V.Valor >= 1
		GROUP BY P.Id
			,P.IdComponente
	)
	SELECT P.[ClaUbicacion] AS ClaUbicacion
		,P.[FechaHoraFin] AS Fecha
		,P.[IdCelda] AS ClaMaquina
		,COALESCE(T.ClaTurnoExterno, P.[ClaTurno]) AS ClaTurno
		,P.[ClaArticulo] AS ClaArticulo
		,1.0 AS Cantidad
		,1.0 * A.[PesoTeoricoKgs] AS Kilos
		,P.Multiplo
		,COALESCE(O.IdUsuario, P.[ClaUsuarioMod]) AS ClaveUsuario
		,P.[FechaAdm] AS FechaAdmScada
		,V.Velocidad AS Velocidad
		,NULL AS VelocidadStd
		,NULL AS ClaCausaBE
		,NULL AS PorcentajeBE
		,NULL AS FechaJustificacionBE
		,NULL AS FactorLocal
		,P.IdCaja AS IdRollo
		,MP.IdOpm AS IdOPM
		,idMicroProg AS IdLotePLC
	FROM [AswSch].[AswBitBitacoraProduccion] P
	JOIN [AswSch].[AswTraMicroPrograma] MP
		ON P.IdPO = MP.idMicroProg
	LEFT JOIN [AswSch].[AswArtCatArticuloVw] A
		ON P.ClaArticulo = A.ClaArticulo
		AND A.ClaTipoInventario = 1  
	LEFT JOIN CteVelocidadRollo V
		ON P.Id = V.Id
	LEFT JOIN AswSch.AswTraOperador O
		ON P.ClaUbicacion = O.ClaUbicacion
		AND P.IdCelda = O.IdWorkCenter
		AND P.FechaAdm = O.FechaAdm
		AND P.ClaTurno = O.ClaTurno
	LEFT JOIN AswSch.AswTraTurnoExterno T
		ON P.ClaUbicacion = T.ClaUbicacion
		AND P.IdCelda = T.IdWorkCenter
		AND P.FechaAdm = T.FechaAdm
		AND P.ClaTurno = T.ClaTurno
	WHERE P.ClaUbicacion = @pnClaUbicacion
		AND (P.IdCelda = @psClaMaquina OR @psClaMaquina='')
		AND P.FechaAdm >= @pdFechaInicio
		AND P.FechaAdm <= @pdFechaFin
		AND P.EsPNC = 0
	ORDER BY P.Id
END
