declare @dFecha date = '2022-04-20'

;with CteHorasTurno--(Fecha,i,duracion,idComponente,NomMaquina,FechaAdministrativa,ClaTurno,CajasXHora,horainicioturno) 
AS (
     SELECT fecha,i,duracion
         FROM (SELECT CAST(@dFecha AS datetime) +CAST(R.HoraInicioTurno as datetime) as fecha
                  ,1 as i
                  ,duracion * 3600 as duracion
              FROM AswSch.AswCatTurno TURNO
                 JOIN AswSch.AswRelTurnoDepartamentoHorario R
				 on TURNO.ClaTurno = R.ClaTurno
				 WHERE R.ClaDepartamento = 2
				 and TURNO.ClaTurno =1 
                  ) qry
      UNION ALL 
      SELECT DATEADD(SECOND,1,Fecha ),i+1,duracion
	  FROM CteHorasTurno WHERE i<duracion 
)
,cteBitCollator as (
select Collator_Status,FechaHoraAvisor,CAST(FORMAT(FechaHoraAvisor, 'yyyy/MM/dd HH:mm:ss') AS datetime) as fechaAvisor 
from [ASW].[AswSch].[AswBitSeñal]
where IdCelda = 112
and FechaHoraAvisor  > '2022-04-20'
AND FechaHoraAvisor  < '2022-04-20 17:00:00.000'
)
,cteBitVision as (
SELECT Vision_Strip_Status,CAST(FORMAT(FechaHoraAvisor, 'yyyy/MM/dd HH:mm:ss') AS datetime) as fechaHoraRegistro
FROM [ASW].[AswSch].[AswBitSeñal]
where IdCelda = 112
and FechaHoraAvisor  > '2022-04-20'
AND FechaHoraAvisor  < '2022-04-20 17:00:00.000'
)
,cteBitHeader as (
SELECT Header_Status,CAST(FORMAT(FechaHoraAvisor, 'yyyy/MM/dd HH:mm:ss') AS datetime) as fechaHoraRegistro
FROM [ASW].[AswSch].[AswBitSeñal]
where IdCelda = 112
and FechaHoraAvisor  > '2022-04-20'
AND FechaHoraAvisor  < '2022-04-20 17:00:00.000'
)
select q1.fecha,CASE WHEN q2.Collator_Status = 1 THEN .1  WHEN q2.Collator_Status = 0 THEN 0 
ELSE (select top 1 CASE WHEN a.Collator_Status = 1 THEN .1  WHEN a.Collator_Status = 0 THEN 0 END 
		from [ASW].[AswSch].[AswBitSeñal] a 
		where CAST(FORMAT(a.FechaHoraAvisor, 'yyyy/MM/dd HH:mm:ss') as datetime) <= q1.fecha 
		AND IdCelda = 112
		and FechaHoraAvisor  > '2022-04-20'
		AND FechaHoraAvisor  < '2022-04-20 17:00:00.000'
		order by CAST(FORMAT(a.FechaHoraAvisor, 'yyyy/MM/dd HH:mm:ss') as datetime) desc ) 
END AS Collator_Status 
,CASE WHEN q3.Vision_Strip_Status = 1 THEN .2 WHEN q3.Vision_Strip_Status = 0 THEN 0
ELSE (select top 1 CASE WHEN a.Vision_Strip_Status = 1 THEN .2 WHEN a.Vision_Strip_Status = 0 THEN 0 END 
		FROM [ASW].[AswSch].[AswBitSeñal] a 
		WHERE a.FechaHoraAvisor <= q1.fecha 
		AND IdCelda = 112
		and FechaHoraAvisor  > '2022-04-20'
		AND FechaHoraAvisor  < '2022-04-20 17:00:00.000'
		order by a.FechaHoraAvisor desc
) END  as Vision_Status
,CASE WHEN q4.Header_Status = 1 THEN .3 WHEN q4.Header_Status = 0 THEN 0 
ELSE (select top 1 CASE WHEN a.Header_Status = 1 THEN .3 WHEN a.Header_Status = 0 THEN 0 END 
		FROM [ASW].[AswSch].[AswBitSeñal] a 
		WHERE a.FechaHoraAvisor <= q1.fecha 
		AND IdCelda = 112
		and FechaHoraAvisor  > '2022-04-20'
		AND FechaHoraAvisor  < '2022-04-20 17:00:00.000'
		order by a.FechaHoraAvisor desc
) END  as Header_Status
from CteHorasTurno q1
left join cteBitCollator q2
on q1.fecha = q2.fechaAvisor
left join cteBitVision q3
on q1.fecha = q3.fechaHoraRegistro
left join cteBitHeader q4
on q1.fecha = q4.fechaHoraRegistro
order by q1.fecha
option (maxrecursion 0);

--select Collator_Status,FechaHoraAvisor from [ASW].[AswSch].[AswBitSeñal]
--where Origen like '%27-D%' 
--AND IdCelda = 112

--order by FechaHoraAvisor desc

--select CAST('20220326' as datetime) + CAST('08:00:00' AS datetime)