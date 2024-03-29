--USE [ASW]
--GO
/****** Object:  StoredProcedure [AswSch].[ASW_CU305_Pag1_ObtenerOrdenActual]    Script Date: 18/05/2023 12:22:41 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*========================================== 
* CU: 305.1 
* Objetivo: Obtener la orden de produccion actual y su balance
* Autor: mrodriguezc 
* Fecha: 2023-02-17 
* EXEC [AswSch].[ASW_CU305_Pag1_ObtenerOrdenActual] 65, 'FF-01', 1
*========================================== */ 
ALTER PROC [AswSch].[ASW_CU305_Pag1_ObtenerOrdenActual]
	@pnClaUbicacion INT
	,@psIdCelda VARCHAR(30)
	,@pnDebug INT = 0
AS
BEGIN
	IF EXISTS (SELECT 1 FROM [AswSch].[AswTraMicroPrograma] WHERE ClaUbicacion = @pnClaUbicacion AND IdWorkCenter = @psIdCelda AND ClaEstatus = 2)
	BEGIN
		SELECT NomOPM
			,[AswSch].[ASWFormatNumber](COALESCE(CantidadProducida, 0) - COALESCE(CantidadPNC,0), 0, ',l') 
				+ '/' 
				+ [AswSch].[ASWFormatNumber](CantidadProgramadaUds, 0, ',l') AS Balance
		FROM [AswSch].[AswTraMicroPrograma]
		WHERE ClaUbicacion = @pnClaUbicacion
			AND IdWorkCenter = @psIdCelda
			AND ClaEstatus = 2 --En progreso
	END
	ELSE
	BEGIN
		SELECT 'No order running' AS NoOrder
	END
END
