select *
from [MSW_LNKSVR].[MCSW_ERP].[MSWSch].[MSWTraBSCReporteAndonSeguimiento] AS T1 WITH(NOLOCK)
INNER JOIN [MSW_LNKSVR].[MCSW_ERP].[MSWSch].MSWTraBSCReporteAndon as RA WITH(NOLOCK)
ON RA.IdReporteAndon = T1.IdReporteAndon
order by T1.FechaUltimaMod desc


/*
  ASW vs ERP 
*/
/*
  ASW vs ERP 
*/
SELECT top 1000
  Cel.ClaveCelda
 ,ERP.IdEventoAvisor
 ,IdParo
 ,IdErpMSW
,ERP.IdReporteAndon
,IdReporteAndonSeguimiento
,CASE WHEN Id = ERP.IdEventoAvisor THEN 1 ELSE 0 END as EsIdCorrecto
,CASE WHEN P.fechahorainicial = ERP.FechaEnviado THEN 1 ELSE 0 END FechaEnvio
,CASE WHEN P.FechaHoraFinal = ERP.FechaSolucion THEN 1 ELSE 0 END FechaSolucion
,Id,IdComponente,IdParo,FechaHoraInicial,FechaHoraFinal
,ClaTurno,ClaGrupoParo,ClaParo,ClaSeccionParo,ClaEventoParo
,ClaEventoJustificacion,ClaEventoReasignacion,ClaEventoAtencion,ClaEventoSolucionado,ClaEventoCierre
,FechaHoraJustificado
,FechaHoraReasignado
,FechaHoraSolucion
,StatusError
,MsgError
,MsgErrorJustificacion
,MsgErrorReasignacion
,MsgErrorAtencion
,MsgErrorSolucion
,MsgErrorSolucionAtm
,EnvioCorreoSN
FROM AswSch.AswBitBitacoraParo P
LEFT JOIN  (SELECT RA.IdEventoAvisor,RA.IdReporteAndon,T1.IdReporteAndonSeguimiento,T1.FechaEnviado,FechaSolucion FROM [MSW_LNKSVR].[MCSW_ERP].[MSWSch].[MSWTraBSCReporteAndonSeguimiento] AS T1 WITH(NOLOCK)
			INNER JOIN [MSW_LNKSVR].[MCSW_ERP].[MSWSch].MSWTraBSCReporteAndon as RA WITH(NOLOCK)
			ON RA.IdReporteAndon = T1.IdReporteAndon
			--WHERE T1.Clamaquina in (468,700,660)
			) ERP
ON P.IdErpMsw = ERP.IdReporteAndon
JOIN AswSch.AswCatMaquina Maq
ON P.IdComponente = Maq.ClaMaquina
JOIN AswSch.AswCatCeldas Cel
ON Cel.IdCelda = Maq.ClaCelda
WHERE Cel.ClaveCelda in (14,15,16,17,73)
AND P.MicroParoSN = 0
order by P.FechaHoraInicial desc, ClaveCelda


--buscar por Idreporteandon
select *
from [MSW_LNKSVR].[MCSW_ERP].[MSWSch].[MSWTraBSCReporteAndonSeguimiento] AS T1 WITH(NOLOCK)
INNER JOIN [MSW_LNKSVR].[MCSW_ERP].[MSWSch].MSWTraBSCReporteAndon as RA WITH(NOLOCK)
ON RA.IdReporteAndon = T1.IdReporteAndon
where T1.idreporteandon = 86559
order by T1.FechaUltimaMod desc

--buscar por ideventoavisor
select *
from [MSW_LNKSVR].[MCSW_ERP].[MSWSch].[MSWTraBSCReporteAndonSeguimiento] AS T1 WITH(NOLOCK)
INNER JOIN [MSW_LNKSVR].[MCSW_ERP].[MSWSch].MSWTraBSCReporteAndon as RA WITH(NOLOCK)
ON RA.IdReporteAndon = T1.IdReporteAndon
where T1.idreporteandon = 17713
order by T1.FechaUltimaMod desc

