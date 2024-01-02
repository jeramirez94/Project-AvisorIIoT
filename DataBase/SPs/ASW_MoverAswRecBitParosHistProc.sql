/*==========================================
*
* Objetivo: Mover información de tablas transaccionales a tablas hisotricos
* Autor: cponce
* Fecha: 2020-05-20
* EXEC: ASWsch.ASW_MoverAswRecBitParosHistProc
insert into AswSch.ASWCfgConfiguracion
select 65, 22, 'ONLINE HISTORY', 'Meses de historia que quedan en linea', 'Months of history left online', 3, null,null,null,null,null,null,null, null,null,null,null,getdate(),'Carga inicial',0,0,null

update AswSch.ASWCfgConfiguracion set valor1 = -1
where claconfiguracion = 22
*========================================== */


CREATE PROC ASWsch.ASW_MoverAswRecBitParosHistProc
@pnClaubicacion INT
AS

DECLARE @nMeses INT

SELECT	@nMeses = valor1
FROM	AswSch.ASWCfgConfiguracion
WHERE	claubicacion =  @pnClaubicacion
AND		ClaConfiguracion =  22

-- Se obtienen los registros a pasar a historico
INSERT INTO	aswsch.AswRecBitParosHist
		(Evento,
		EventoOrigen,
		FechaHoraInicio,
		FechaHoraFin,
		ClaMaquina,
		ClaProducto,
		Duracion,
		ClaParo,
		ClaUbicacion,
		ClaArea,
		FechaUltimaMod,
		ClaDepartamento,
		ClaPuntoMedicion,
		Anio)
SELECT 
		Evento,
		EventoOrigen,
		FechaHoraInicio,
		FechaHoraFin,
		ClaMaquina,
		ClaProducto,
		Duracion,
		ClaParo,
		ClaUbicacion,
		ClaArea,
		FechaUltimaMod,
		ClaDepartamento,
		ClaPuntoMedicion,
		Anio
FROM	aswsch.AswRecBitParos Prod
WHERE	claubicacion = @pnClaubicacion
AND		ISNULL(fechahorainicio, fechaultimamod) < (DATEADD(mm, @nMeses, GETDATE()))
AND		NOT EXISTS (SELECT 1 FROM aswsch.AswRecBitParosHist Hist WHERE claubicacion  =  @pnClaubicacion AND hist.evento =  prod.evento)

--- eliminar inf de tablas transaccionales
IF @@ERROR = 0
	DELETE FROM aswsch.AswRecBitParos
	WHERE	claubicacion = @pnClaubicacion
	AND		ISNULL(fechahorainicio, fechaultimamod) < (DATEADD(mm, @nMeses, GETDATE()))



go

