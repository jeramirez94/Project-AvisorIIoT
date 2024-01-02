USE [ASW]
GO

/****** Object:  View [AswSch].[AswCatCapacidadMaquinaVw]    Script Date: 05/04/2023 08:28:54 p. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO
/*
* vista para poplar
*/
ALTER VIEW [AswSch].[AswCatCapacidadMaquinaVw]
AS  

	WITH cteNPM AS (
		SELECT IdWorkCenter
			,CASE EsSuperCelda 
				WHEN 1 THEN ISNULL(NPM,0)+ISNULL(NPM2,0)+ISNULL(NPM3,0) 
				ELSE ISNULL(NPM,0)*CantWafios 
				END AS NPM  
		FROM [AswSch].[AswCatWorkCenterVw]
	)
	,cteClavosCaja AS (
		SELECT ClaArticulo
			,CASE 
				WHEN  CHARINDEX(' ', LTRIM(NomValorCaract))-1  >= 0 
					THEN LEFT(LTRIM(NomValorCaract), CHARINDEX(' ', LTRIM(NomValorCaract)) - 1) 
				ELSE NULL 
				END AS NPB
		FROM [AswSch].[AswCatArticuloCaracteristicasVw]
		WHERE ClaCaracteristica = 1412
	)
	SELECT 68 AS [ClaPlanta]
		  ,IdWorkCenter AS [ClaMaquina]
		  ,[ClaArticulo]
		  ,NPM
		  ,NPB
		  ,ROUND(NPM*60.0/NPB, 2) AS [Capacidad]
		  ,0 AS [BajaLogica]
		  ,NULL AS [FechaBajaLogica]
		  ,GETDATE() AS [FechaUltimaMod]
		  ,0 AS [ClaUsuarioMod]
		  ,'vista compuesta' AS [NombrePcMod] 
	FROM cteNPM N
	CROSS JOIN cteClavosCaja CC
GO

