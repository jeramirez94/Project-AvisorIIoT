--USE [ASW]
--GO
/****** Object:  StoredProcedure [AswSch].[ASWCeldasAvisorCmb]    Script Date: 15/11/2022 04:24:28 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*========================================== 
* CU: NA -  [AswSch].[ASWCeldasAvisorCmb]
* Objetivo: Obtener la lista de Workcenters disponibles con base en el catalogo de tablets y con opcion de formato para Grafana.
* Autor: mrodriguezc 
* Fecha: 2023-02-17 
* EXEC [AswSch].[ASWCeldasAvisorCmb] 65, 1
*========================================== */ 
ALTER PROC [AswSch].[ASWCeldasAvisorCmb]
	@pnClaUbicacion INT,
	@pnEsRegex INT = 0
AS
BEGIN

	SELECT WC.IdWorkCenter AS IdCelda, 
		WC.NomWorkCenter AS Descripcion 
	INTO #Celdas
	FROM [AswSch].[AswCatWorkCenterVw] WC
	JOIN [AswSch].[AswCatTablets] T
		ON WC.IdWorkCenter = T.IdCelda
		AND T.ClaUbicacion = @pnClaUbicacion
	WHERE T.BajaLogica = 0

	IF @pnEsRegex = 1
	BEGIN
		SELECT 'Desc='+Descripcion + ':value='+CAST(IdCelda AS VARCHAR)+':' AS Celda
		FROM #Celdas
	END
	ELSE
	BEGIN
		SELECT IdCelda, 
			Descripcion 
		FROM #Celdas
	END

END
