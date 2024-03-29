--USE [ASW]
--GO
/****** Object:  StoredProcedure [AswSch].[ASW_CU102_Pag3_CargaPPLSrvSecuenciaMicroProgramaSemanal_Sel]    Script Date: 25/05/2023 08:09:40 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*==========================================
* CU: 102.4
* Objetivo: Dar visibilidad del avance al plan de produccion
*			  
* Autor: mrodriguezc
* Fecha: 2023-05-25
* EXEC: AswSch.ASW_CU102_Pag4_SeguimientoPlanProduccion_Sel  65, 1
* 
*========================================== */
ALTER PROC [AswSch].[ASW_CU102_Pag4_SeguimientoPlanProduccion_Sel]
	@pnClaUbicacion INT,
	@pnPorOrden INT = 1,
	@pnTiempoUTC INT = 0,
	@pnDebug INT = 0
AS

BEGIN

	DECLARE 
		@nOffSet INT

	IF @pnTiempoUTC = 1
	BEGIN
		SET @nOffSet = datediff(hh, getutcdate(), getdate())
	END
	ELSE
	BEGIN
		SET @nOffSet=0
	END

	IF (@pnPorOrden=1)
	BEGIN
		SELECT [IdWorkCenter] AS Machine
			,[ClaveArticulo] AS Code
			,[CantidadProgramadaUds] AS Programmed
			,[CantidadProducida] AS Done
			,[CantidadPNC] AS PNC
			,([CantidadProducida]-[CantidadPNC])/[CantidadProgramadaUds]*100.0 AS Progress
			,DATEADD(hh, -@nOffSet, [FechaInicioReal]) AS Start
			,DATEADD(hh, -@nOffSet, [FechaFinReal]) AS [End]
			,E.NomEstatus AS Status
			,[NomArticulo] AS Item
			,[NomUnidad] AS Unit
			,[NomOPM] AS PO
		FROM [AswSch].[AswTraMicroPrograma] MP
		JOIN [AswSch].[ASWCfgProgPeriodo] PP
			ON MP.ClaUbicacion = PP.ClaUbicacion
			AND MP.ClaPeriodo = PP.ClaPeriodo
			AND MP.Version = PP.VersionActual
		JOIN [AswSch].[AswCatEstatus] E
			ON MP.ClaEstatus = E.ClaEstatus
		WHERE MP.ClaUbicacion = @pnClaUbicacion 
			AND PP.ClaEstatus = 2 --Plan de produccion vigente
			AND [IdWorkCenter] LIKE '%FF%'
		ORDER BY [IdWorkCenter], FechaInicioPlan
	END
	ELSE--por producto
	BEGIN
		SELECT [ClaveArticulo] AS Code
			,SUM([CantidadProgramadaUds]) AS Programmed
			,SUM([CantidadProducida]) AS Done
			,SUM([CantidadPNC]) AS PNC
			,(SUM([CantidadProducida])-SUM([CantidadPNC]))/SUM([CantidadProgramadaUds])*100.0 AS Progress
			,[NomArticulo] AS Item
			,[NomUnidad] AS Unit
		FROM [AswSch].[AswTraMicroPrograma] MP
		JOIN [AswSch].[ASWCfgProgPeriodo] PP
			ON MP.ClaUbicacion = PP.ClaUbicacion
			AND MP.ClaPeriodo = PP.ClaPeriodo
			AND MP.Version = PP.VersionActual
		JOIN [AswSch].[AswCatEstatus] E
			ON MP.ClaEstatus = E.ClaEstatus
		WHERE MP.ClaUbicacion = @pnClaUbicacion 
			AND PP.ClaEstatus = 2 --Plan de produccion vigente
			AND [IdWorkCenter] LIKE '%FF%'
		GROUP BY [ClaveArticulo], [NomArticulo], [NomUnidad]
		ORDER BY [ClaveArticulo]

	END



END