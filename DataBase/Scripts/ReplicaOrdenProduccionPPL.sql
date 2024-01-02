

-- se debe ejecutar al menos 1 hora antes del primer turno del día
EXEC ASWSch.ASW_CU102_Pag1_ReplicaOrdenProduccionPPL_Proc 68, 2, null, '2022-02-21'
EXEC ASWSch.ASW_CU102_Pag1_ReplicaOrdenProduccionPPL_Proc 68, 2, 37, '2022-02-07'
EXEC ASWSch.ASW_CU102_Pag1_ReplicaOrdenProduccionPPL_Proc 68, 2, NULL, '2022-02-08'
EXEC ASWSch.ASW_CU102_Pag1_ReplicaOrdenProduccionPPL_Proc 68, 2, NULL, '2022-02-09'
EXEC ASWSch.ASW_CU102_Pag1_ReplicaOrdenProduccionPPL_Proc 68, 2, NULL, '2022-02-10'
EXEC ASWSch.ASW_CU102_Pag1_ReplicaOrdenProduccionPPL_Proc 68, 2, NULL, '2022-02-11'
EXEC ASWSch.ASW_CU102_Pag1_ReplicaOrdenProduccionPPL_Proc 68, 2, NULL, '2022-02-12'


EXEC [MSW_LNKSVR].MCSW_ERP.MSWSch.MSW_CU420_Pag32_ConsultarPlanProduccion_Srv
		--@pnWorkOrder               INT = NULL
		--,@pnClaArticulo                    INT = NULL
		--,@psClaveArticulo           VARCHAR(50) = NULL
		@pnClaAreaProduccion = 2
		--,@pnIdCelda = @pnIdCelda
		--,@psClaveCelda              VARCHAR(50) = NULL
		,@pdFechaProgIni   = '2022-02-21'
		,@pdFechaProgFin   = '2022-02-27'
