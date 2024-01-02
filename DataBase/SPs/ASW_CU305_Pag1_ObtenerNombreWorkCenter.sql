USE [ASW]
GO
/****** Object:  StoredProcedure [AswSch].[ASW_CU305_Pag1_NombreWorkCenter]    Script Date: 16/02/2023 04:26:22 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*========================================== 
* CU: 305.1 
* Objetivo: Obtener el nombre o clave del workcenter segun la ubicacion
* Autor: mrodriguezc 
* Fecha: 2023-02-17 
* EXEC [AswSch].[ASW_CU305_Pag1_ObtenerNombreWorkCenter] 68, 'FF-02', 1
*========================================== */ 
ALTER PROC [AswSch].[ASW_CU305_Pag1_ObtenerNombreWorkCenter]
	@pnClaUbicacion INT
	,@psIdCelda VARCHAR(30)
	,@pnDebug INT = 0
AS
BEGIN

	SELECT CASE @pnClaUbicacion WHEN 65 THEN ClaveWorkCenter ELSE NomWorkCenter END AS NomWorkCenter
	FROM [AswSch].[AswCatWorkCenterVw]
	WHERE IdWorkCenter = @psIdCelda
END
