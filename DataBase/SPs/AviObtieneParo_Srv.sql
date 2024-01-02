
/*==========================================
* CU: 182.2
* Objetivo: Servicio para que el pal consuma los datos de paros 
* Autor: ngalaz
* Fecha: 2023-08-04
* 
*========================================== */
ALTER PROC AviObtieneParo_Srv
	@pnClaUbicacion INT,
	@pdFechaIni DATETIME,
	@pdFechaFin DATETIME,
	@psClaMaquina VARCHAR(30) = null,
	@pnClaTurno INT = null

AS
BEGIN
	SELECT  top 100 
		 BP.ClaUbicacion
		,null as ClaveProyecto
		,BP.ClaveCelda as ClavePuntoMedicion
		,YEAR(BP.FechaAdmScada) as Anio
		,BP.Id as Evento
		,BP.FechaAdmSCADA as FechaAdmSCADA
		,BP.FechaHoraInicial as FechaHoraInicial
		,BP.FechaHoraFinal as FechaHoraFinal
		,CASE WHEN IdParoProgramado IS NOT NULL THEN 1 ELSE 0 END as EsProgramado
		,BP.IdCelda as ClaMaquina 
		,BP.ClaTurno
		,BP.IdParo
		,BP.ClaParo AS ClaParo
		,BP.ClaSeccionParo AS ClaSeccionParo
		,BP.ClaGrupoParo as ClaGrupoParo
		,BP.DuracionSegundos as DuracionSegundos
		,MP.ClaArticulo as ClaArticulo
		,BP.MicroParoSN as MicroParoSN
		,SP.ClaveSeccionParo as ClaveSeccion
		,null as SegundosDiff
		,MP.IdOpm as IdOPM  -- IdOpm del microprograma
		,MP.idMicroProg as IdLotePLC --idMicroProg
	FROM ASWSch.AswBitBitacoraParoCeldaVw BP
	LEFT JOIN [AswSch].[AswTraMicroPrograma] MP
		ON  BP.IdPOInicio = MP.idMicroProg
		AND BP.ClaUbicacion = MP.ClaUbicacion
	LEFT JOIN AswSch.ASWCatSeccionParoVw SP
		ON BP.ClaSeccionParo = SP.ClaSeccionParo
	WHERE BP.ClaUbicacion = @pnClaUbicacion 
	AND FechaAdmSCADA >= @pdFechaIni
	AND FechaAdmSCADA <= @pdFechaFin
	AND (BP.IdCelda = @psClaMaquina OR ISNULL(@psClaMaquina,'') = '')
	AND (BP.ClaTurno = @pnClaTurno OR ISNULL(@pnClaTurno,0) = 0)

END





