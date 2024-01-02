USE [ASW]
GO

/****** Object:  View [AswSch].[AswMtoCatEquipoCeldaVw]    Script Date: 14/11/2022 10:16:53 a. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [AswSch].[AswMtoCatEquipoCeldaVw]
AS 
	SELECT E.[ClaUbicacion]
		  ,E.[ClaEquipo]
		  ,SA.[NomSubArea] + ' >> ' + E.[NomEquipo] AS NomEquipoCelda
		  ,E.[NomEquipo]
		  ,E.[ClaGrupoEquipo]
		  ,E.[ClaEquipoTipo]
		  ,E.[EsCritico]
		  ,E.[ClaDepartamento]
		  ,E.[ClaArea]
		  ,E.[ClaSubArea]
		  ,SAC.[IdCelda]
		  ,E.[BajaLogica]
		  ,E.[FechaBajaLogica]
		  ,E.[FechaUltimaMod]
		  ,E.[NombrePcMod]
		  ,E.[ClaUsuarioMod]  
	FROM [AswSch].[AswMtoCatEquipo] E 
	JOIN [AswSch].[AswMtoCatSubArea] SA
		ON E.ClaUbicacion = SA.ClaUbicacion
		AND E.ClaDepartamento = SA.ClaDepartamento
		AND E.ClaArea = SA.ClaArea
		AND E.ClaSubArea = SA.ClaSubArea
	JOIN [AswSch].[AswRelMtoSubAreaCelda] SAC
		ON SA.ClaUbicacion = SAC.ClaUbicacion
		AND SA.ClaDepartamento = SAC.ClaDepartamento
		AND SA.ClaArea = SAC.ClaArea
		AND SA.ClaSubArea = SAC.ClaSubArea
GO


