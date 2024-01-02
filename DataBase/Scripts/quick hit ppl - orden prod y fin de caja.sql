select object_name(id)
from syscomments
where text like '%MswRegistraProduccionSCADASrv%'

select * from [AswSch].[AswTraFinCajaMCSW]
select * from [AswSch].[AswCatCeldas]

/*
delete [AswSch].[AswTraFinCajaMCSW]
--delete [AswSch].[ASWTraOrdenProduccion] where idCelda=34
delete [AswSch].[ASWTraOrdenProduccionDet] where IdPO IN (1,10,11,30)
*/
select * from [AswSch].[ASWTraOrdenProduccion] where idCelda=34
select * from [AswSch].[ASWTraOrdenProduccionDet] where IdPO IN (97)
select * from [AswSch].[AswTraFinCajaMCSW]

EXEC ASWSch.ASW_CU102_Pag1_ReplicaOrdenProduccionPPL_Proc

select * from [AswSch].[ASWTraOrdenProduccion] where idCelda=34
EXEC [MSW_LNKSVR].MCSW_Integra.MSWSch.MSW_CU420_Pag32_ConsultarPlanProduccion_Srv
		--@pnWorkOrder               INT = NULL
		--,@pnClaArticulo                    INT = NULL
		--,@psClaveArticulo           VARCHAR(50) = NULL
		--,@pnClaAreaProduccion INT = NULL
		@pnIdCelda                      =34
		--,@psClaveCelda              VARCHAR(50) = NULL
		,
		@pdFechaProgIni   = '2021-01-01'
		,@pdFechaProgFin   = '2021-08-05'


--	Esta tabla tiene la información que traemos de PPL:
SELECT * FROM [MSW_LNKSVR].[MCSW_Integra].MSWSCh.MSWTraPlanProduccionPPL4 where bajalogicaPPL=0 and idCelda=34
--	Esta tabla es donde registra los datos el servicio que invocas:
SELECT * FROM [MSW_LNKSVR].[MCSW_Integra].MSWSch.MSWPAITraRegistraProduccionSrv


BEGIN TRAN
	EXEC [AswSch].[ASW_CU167_Pag1_FinCajaMCSW_Proc]
	SELECT * FROM [AswSch].[AswTraFinCajaMCSW]
	SELECT * FROM [MSW_LNKSVR].[MCSW_Integra].MSWSCh.MSWTraPlanProduccionPPL4 where bajalogicaPPL=0 and idCelda=34
	SELECT * FROM [MSW_LNKSVR].[MCSW_Integra].MSWSch.MSWPAITraRegistraProduccionSrv
ROLLBACK TRAN