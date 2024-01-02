

/*
delete [AswSch].[AswTraFinCajaMCSW]
--delete [AswSch].[ASWTraOrdenProduccion] where idCelda=34
delete [AswSch].[ASWTraOrdenProduccionDet] where IdPO IN (1,10,11,30)
*/
select * from [AswSch].[ASWTraOrdenProduccion] where idCelda=38
select * from [AswSch].[ASWTraOrdenProduccionDet] where IdPO IN (38) 
select * from [AswSch].[AswTraFinCajaMCSW] order by fechaUltimaMod

--EXEC ASWSch.ASW_CU102_Pag1_ReplicaOrdenProduccionPPL_Proc

SELECT * FROM [AswSch].[AswBitBitacoraParo]
SELECT * FROM [AswSch].[AswBitBitacoraProduccion]

select  CONVERT(varchar(10),FechaFinReal,120), ClaTurno, COUNT(distinct idUnidadCaja) AS Cajas
from [AswSch].[AswTraFinCajaMCSW]  
where Fechainicioreal>='20210927'
GROUP BY  CONVERT(varchar(10),FechaFinReal,120), ClaTurno
ORDER BY 1,2

select CONVERT(varchar(10),FechaFinReal,120),COUNT(distinct idUnidad) AS Cajas 
from [AswSch].[ASWTraOrdenProduccionDet] 
where IdPO IN (38) and fechainicioreal>='20210927'
GROUP BY  CONVERT(varchar(10),FechaFinReal,120)

--2 coll, 151 head, 709 botn
SELECT FechaAdmScada, ClaTurno, IdComponente, CASE microparosn WHEN 1 THEN 'Microparos' WHEN 0 THEN 'Paro' END AS TipoParo, sum(DuracionSegundos)/60.0/60.0 as hr, sum(DuracionSegundos)/60.0 as [min] 
FROM [AswSch].[AswBitBitacoraParo]
WHERE FechaAdmScada>='20210927' --and claturno=1
GROUP BY FechaAdmScada, ClaTurno, IdComponente, microparosn
ORDER BY FechaAdmScada, ClaTurno, IdComponente, microparosn




select  *
from [AswSch].[AswTraFinCajaMCSW]  
where Fechainicioreal>='20210910' and fechainicioreal<'20210911'
order by fechainicioreal

select *
from [AswSch].[ASWTraOrdenProduccionDet] 
where IdPO IN (38) and fechainicioreal>='20210910' and fechainicioreal<'20210911'
order by fechainicioreal

--2 coll, 151 head, 709 bot
SELECT *--FechaAdmScada, ClaTurno, IdComponente, sum(DuracionSegundos)/60.0/60.0 as hr, sum(DuracionSegundos)/60.0 as [min] 
FROM [AswSch].[AswBitBitacoraParo]
WHERE microparosn = 0 AND FechaAdmScada>='20210910' 
ORDER BY FechaAdmScada, ClaTurno, IdComponente

SELECT *
FROM [AswSch].[AswBitBitacoraProduccion]
WHERE  FechaAdm>='20210910' 