USE [ASW]
GO
/****** Object:  StoredProcedure [AswSch].[ASW_CU170_Pag1_CatWorkCenter_Sel]    Script Date: 10/03/2023 03:30:18 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*==========================================
* CU: 170.1
* Objetivo: Sp auxiliar para seleccionar centros de trabajo para las alertas
* Autor: José Carlos Arias Rodríguez
* Fecha: 2022-03-10
* EXEC: [AswSch].[ASW_CU170_Pag1_CatWorkCenter_Sel]
*========================================== */
ALTER PROC [AswSch].[ASW_CU170_Pag1_CatWorkCenter_Sel]
	@pnClaUbicacion INT, 
	@PnClaDepartamento INT
AS
BEGIN
/*
*	Regresea los IdWorkCenter correspondientes para el departamento dado
*/
	SELECT 
		IdWorkCenter
	FROM AswSch.AswCatWorkCenterVw
	WHERE ClaDepartamento = @PnClaDepartamento
	AND BajaLogica = 0 
	ORDER BY IdWorkCenter
	
END

