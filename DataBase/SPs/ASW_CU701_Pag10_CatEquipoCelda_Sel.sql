--USE [ASW]
--GO
/****** Object:  StoredProcedure [AswSch].[ASW_CU701_Pag10_CatEquipoCelda_Sel]    Script Date: 15/11/2022 03:56:22 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--	EXEC [AswSch].[ASW_CU701_Pag10_CatEquipoCelda_Sel] 68, 4
ALTER PROC [AswSch].[ASW_CU701_Pag10_CatEquipoCelda_Sel]
	@PnClaUbicacion INT
	,@PsIdCelda VARCHAR(30)
AS
BEGIN
/*
*	Regresea los turnos configurados para el departamento dado
*/
	SELECT 'ASWLite_MtoCatEquipoCelda' as nombretabla
		,keys = 'ClaUbicacion,ClaEquipo'
		,fuc = 'FechaUltimaMod'
		,[ClaUbicacion]
		,[ClaEquipo]
		,[NomEquipoCelda]
		,[NomEquipo]
		,[ClaGrupoEquipo]
		,[ClaEquipoTipo]
		,[EsCritico]
		,[ClaDepartamento]
		,[ClaArea]
		,[ClaSubArea]
		,[IdCelda]
		,[BajaLogica]
		--,[FechaBajaLogica]
		,CONVERT(VARCHAR, GETDATE(),121) AS [FechaUltimaMod]
		,[NombrePcMod]
		,[ClaUsuarioMod]
  FROM [AswSch].[AswMtoCatEquipoCeldaVw]
	WHERE ClaUbicacion = @pnClaUbicacion
		AND IdCelda = @psIdCelda
		AND BajaLogica = 0

END