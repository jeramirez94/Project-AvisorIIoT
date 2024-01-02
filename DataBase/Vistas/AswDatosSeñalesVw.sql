USE [ASW]
GO

/****** Object:  View [AswSch].[AswDatosSeñalesVw]    Script Date: 14/11/2022 10:09:25 a. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

create view [AswSch].[AswDatosSeñalesVw] AS
with CteHorasTurno--(Fecha,i,duracion,idComponente,NomMaquina,FechaAdministrativa,ClaTurno,CajasXHora,horainicioturno) 
AS (
     SELECT fecha,i,duracion
         FROM (SELECT CAST('2022-03-28' AS datetime) +CAST(R.HoraInicioTurno as datetime) as fecha
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
select Collator_Status,FechaHoraAvisor,CAST(FORMAT(FechaHoraAvisor, 'yyyy/MM/dd HH:mm:ss') AS datetime) as fechaAvisor from RecoleccionAvisorUSA
where Origen like '%27-D%' 
AND IdCelda = 112
and FechaHoraAvisor  > '2022-03-28'
AND FechaHoraAvisor  < '2022-03-28 17:00:00.000'
)
,cteBitVision as (
SELECT Vision_Status,CAST(FORMAT(FechaHoraRegistro, 'yyyy/MM/dd HH:mm:ss') AS datetime) as fechaHoraRegistro
FROM [ASW].[dbo].[ProduccionClavosAvisor]
WHERE IdComponente = 1043
and FechaHoraRegistro  > '2022-03-28'
AND FechaHoraRegistro  < '2022-03-28 17:00:00.000'
)
,cteBitHeader as (
SELECT Header_Status,CAST(FORMAT(FechaHoraRegistro, 'yyyy/MM/dd HH:mm:ss') AS datetime) as fechaHoraRegistro
FROM [ASW].[dbo].[ProduccionClavosAvisor]
WHERE IdComponente = 660
and FechaHoraRegistro  > '2022-03-28'
AND FechaHoraRegistro  < '2022-03-28 17:00:00.000'
)
select q1.fecha,CASE WHEN q2.Collator_Status = 1 THEN .1  WHEN q2.Collator_Status = 0 THEN 0 
ELSE (select top 1 CASE WHEN a.Collator_Status = 1 THEN .1  WHEN a.Collator_Status = 0 THEN 0 END 
		from RecoleccionAvisorUSA a 
		where CAST(FORMAT(a.FechaHoraAvisor, 'yyyy/MM/dd HH:mm:ss') as datetime) <= q1.fecha 
		AND Origen like '%27-D%' 
		AND IdCelda = 112
		and FechaHoraAvisor  > '2022-03-28'
		AND FechaHoraAvisor  < '2022-03-28 17:00:00.000'
		order by CAST(FORMAT(a.FechaHoraAvisor, 'yyyy/MM/dd HH:mm:ss') as datetime) desc ) 
END AS Collator_Status 
,CASE WHEN q3.Vision_Status = 'ON' THEN .2 WHEN q3.Vision_Status = 'OFF' THEN 0
ELSE (select top 1 CASE WHEN a.Vision_Status = 'ON' THEN .2 WHEN a.Vision_Status = 'OFF' THEN 0 END 
		FROM [ASW].[dbo].[ProduccionClavosAvisor] a 
		WHERE a.fechaHoraRegistro <= q1.fecha 
		AND IdComponente = 1043
		and FechaHoraRegistro  > '2022-03-28'
		AND FechaHoraRegistro  < '2022-03-28 17:00:00.000'
		order by a.fechaHoraRegistro desc
) END  as Vision_Status
,CASE WHEN q4.Header_Status = 'ON' THEN .3 WHEN q4.Header_Status = 'OFF' THEN 0 
ELSE (select top 1 CASE WHEN a.Header_Status = 'ON' THEN .3 WHEN a.Header_Status = 'OFF' THEN 0 END 
		FROM [ASW].[dbo].[ProduccionClavosAvisor] a 
		WHERE a.fechaHoraRegistro <= q1.fecha 
		AND IdComponente = 660
		and FechaHoraRegistro  > '2022-03-28'
		AND FechaHoraRegistro  < '2022-03-28 17:00:00.000'
		order by a.fechaHoraRegistro desc
) END  as Header_Status
from CteHorasTurno q1
left join cteBitCollator q2
on q1.fecha = q2.fechaAvisor
left join cteBitVision q3
on q1.fecha = q3.fechaHoraRegistro
left join cteBitHeader q4
on q1.fecha = q4.fechaHoraRegistro
GO


