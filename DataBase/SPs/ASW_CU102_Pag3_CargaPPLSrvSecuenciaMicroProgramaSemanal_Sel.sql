USE ASW
GO 

ALTER PROC AswSch.ASW_CU102_Pag3_CargaPPLSrvSecuenciaMicroProgramaSemanal_Sel
	@PtFechaInicio DATE = null,
    @PtFechaFin DATE = null
AS
/*==========================================
* CU: 102.3
* Objetivo: Dar visibilidad de los registros recibidos de PPL 
*			  
* Autor: ngalaz
* Fecha: 2023-02-20
* EXEC: AswSch.ASW_CU102_Pag3_CargaPPLSrvSecuenciaMicroProgramaSemanal_Sel  null, null
* 
*========================================== */

BEGIN

	IF @PtFechaInicio IS NULL 
	BEGIN
		SET @PtFechaInicio = getdate()
	END 

	IF @PtFechaFin IS NULL
	BEGIN
		SET @PtFechaFin = getdate()
	END

	SELECT ClaUbicacion
		,ClaMaquina
		,ClaPeriodo
		,ClaArticulo
		,WorkOrderCode
		,Cantidad
		,PlannedStarTime
		,PlannedEndTime
		,BajaLogica
		,FechaBajaLogica
		,FechaIns
		,FechaUltimaMod
		,ClaUsuarioMod
		,NombrePcMod
	FROM [AswSch].[AswCargaPPLSrvSecuenciaMicroprogramaSemanal]
	WHERE CAST(PlannedStarTime AS DATE) >  @PtFechaInicio 
		AND  CAST(PlannedStarTime AS DATE) < @PtFechaFin



END