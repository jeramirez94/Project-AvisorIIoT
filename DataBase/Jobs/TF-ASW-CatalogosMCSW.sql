USE [msdb]
GO

/****** Object:  Job [TF-ASW-CatalogosMCSW]    Script Date: 06/10/2022 01:35:28 p. m. ******/
BEGIN TRANSACTION
DECLARE @ReturnCode INT
SELECT @ReturnCode = 0
/****** Object:  JobCategory [[Uncategorized (Local)]]    Script Date: 06/10/2022 01:35:29 p. m. ******/
IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N'[Uncategorized (Local)]' AND category_class=1)
BEGIN
EXEC @ReturnCode = msdb.dbo.sp_add_category @class=N'JOB', @type=N'LOCAL', @name=N'[Uncategorized (Local)]'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

END

DECLARE @jobId BINARY(16)
EXEC @ReturnCode =  msdb.dbo.sp_add_job @job_name=N'TF-ASW-CatalogosMCSW', 
		@enabled=1, 
		@notify_level_eventlog=2, 
		@notify_level_email=0, 
		@notify_level_netsend=0, 
		@notify_level_page=0, 
		@delete_level=0, 
		@description=N'TF-ASW-CatalogosMCSW', 
		@category_name=N'[Uncategorized (Local)]', 
		@owner_login_name=N'sa', @job_id = @jobId OUTPUT
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [TF_ASW-596_CatalogosMCSW-AswSch.AswCatAreaProduccion]    Script Date: 06/10/2022 01:35:30 p. m. ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'TF_ASW-596_CatalogosMCSW-AswSch.AswCatAreaProduccion', 
		@step_id=1, 
		@cmdexec_success_code=0, 
		@on_success_action=3, 
		@on_success_step_id=0, 
		@on_fail_action=3, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'EXEC dbo.sp_transferir @grupo= ''TF_ASW'' ,@sub_grupo=''596_CatalogosMCSW'',@tabla=''TF_AswCatAreaProduccion''', 
		@database_name=N'sincroniza', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [TF_ASW-596_CatalogosMCSW-AswSch.AswCatArticuloCaracteristicas]    Script Date: 06/10/2022 01:35:30 p. m. ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'TF_ASW-596_CatalogosMCSW-AswSch.AswCatArticuloCaracteristicas', 
		@step_id=2, 
		@cmdexec_success_code=0, 
		@on_success_action=3, 
		@on_success_step_id=0, 
		@on_fail_action=3, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'EXEC dbo.sp_transferir @grupo= ''TF_ASW'' ,@sub_grupo=''596_CatalogosMCSW'',@tabla=''TF_AswCatArticuloCaracteristicas''', 
		@database_name=N'sincroniza', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [TF_ASW-596_CatalogosMCSW-AswSch.AswCatArticuloComposicion]    Script Date: 06/10/2022 01:35:30 p. m. ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'TF_ASW-596_CatalogosMCSW-AswSch.AswCatArticuloComposicion', 
		@step_id=3, 
		@cmdexec_success_code=0, 
		@on_success_action=3, 
		@on_success_step_id=0, 
		@on_fail_action=3, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'EXEC dbo.sp_transferir @grupo= ''TF_ASW'' ,@sub_grupo=''596_CatalogosMCSW'',@tabla=''TF_AswCatArticuloComposicion''', 
		@database_name=N'sincroniza', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [TF_ASW-596_CatalogosMCSW-AswSch.AswCatArticuloConfiguracion]    Script Date: 06/10/2022 01:35:31 p. m. ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'TF_ASW-596_CatalogosMCSW-AswSch.AswCatArticuloConfiguracion', 
		@step_id=4, 
		@cmdexec_success_code=0, 
		@on_success_action=3, 
		@on_success_step_id=0, 
		@on_fail_action=3, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'EXEC dbo.sp_transferir @grupo= ''TF_ASW'' ,@sub_grupo=''596_CatalogosMCSW'',@tabla=''TF_AswCatArticuloConfiguracion''', 
		@database_name=N'sincroniza', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [TF_ASW-596_CatalogosMCSW-AswSch.AswCatArticuloGeneral]    Script Date: 06/10/2022 01:35:31 p. m. ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'TF_ASW-596_CatalogosMCSW-AswSch.AswCatArticuloGeneral', 
		@step_id=5, 
		@cmdexec_success_code=0, 
		@on_success_action=3, 
		@on_success_step_id=0, 
		@on_fail_action=3, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'EXEC dbo.sp_transferir @grupo= ''TF_ASW'' ,@sub_grupo=''596_CatalogosMCSW'',@tabla=''TF_AswCatArticuloGeneral''', 
		@database_name=N'sincroniza', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [TF_ASW-596_CatalogosMCSW-AswSch.AswCatBajaEficiencia]    Script Date: 06/10/2022 01:35:31 p. m. ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'TF_ASW-596_CatalogosMCSW-AswSch.AswCatBajaEficiencia', 
		@step_id=6, 
		@cmdexec_success_code=0, 
		@on_success_action=3, 
		@on_success_step_id=0, 
		@on_fail_action=3, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'EXEC dbo.sp_transferir @grupo= ''TF_ASW'' ,@sub_grupo=''596_CatalogosMCSW'',@tabla=''TF_AswCatBajaEficiencia''', 
		@database_name=N'sincroniza', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [TF_ASW-596_CatalogosMCSW-AswSch.AswCatBSCTipoAndon]    Script Date: 06/10/2022 01:35:31 p. m. ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'TF_ASW-596_CatalogosMCSW-AswSch.AswCatBSCTipoAndon', 
		@step_id=7, 
		@cmdexec_success_code=0, 
		@on_success_action=3, 
		@on_success_step_id=0, 
		@on_fail_action=3, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'EXEC dbo.sp_transferir @grupo= ''TF_ASW'' ,@sub_grupo=''596_CatalogosMCSW'',@tabla=''TF_AswCatBSCTipoAndon''', 
		@database_name=N'sincroniza', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [TF_ASW-596_CatalogosMCSW-AswSch.ASWCatBSCTipoMejora]    Script Date: 06/10/2022 01:35:31 p. m. ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'TF_ASW-596_CatalogosMCSW-AswSch.ASWCatBSCTipoMejora', 
		@step_id=8, 
		@cmdexec_success_code=0, 
		@on_success_action=3, 
		@on_success_step_id=0, 
		@on_fail_action=3, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'EXEC dbo.sp_transferir @grupo= ''TF_ASW'' ,@sub_grupo=''596_CatalogosMCSW'',@tabla=''TF_ASWCatBSCTipoMejora''', 
		@database_name=N'sincroniza', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [TF_ASW-596_CatalogosMCSW-AswSch.AswCatCeldas]    Script Date: 06/10/2022 01:35:31 p. m. ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'TF_ASW-596_CatalogosMCSW-AswSch.AswCatCeldas', 
		@step_id=9, 
		@cmdexec_success_code=0, 
		@on_success_action=3, 
		@on_success_step_id=0, 
		@on_fail_action=3, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'EXEC dbo.sp_transferir @grupo= ''TF_ASW'' ,@sub_grupo=''596_CatalogosMCSW'',@tabla=''TF_AswCatCeldas''', 
		@database_name=N'sincroniza', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [TF_ASW-596_CatalogosMCSW-AswSch.AswCatDepartamento]    Script Date: 06/10/2022 01:35:31 p. m. ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'TF_ASW-596_CatalogosMCSW-AswSch.AswCatDepartamento', 
		@step_id=10, 
		@cmdexec_success_code=0, 
		@on_success_action=3, 
		@on_success_step_id=0, 
		@on_fail_action=3, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'EXEC dbo.sp_transferir @grupo= ''TF_ASW'' ,@sub_grupo=''596_CatalogosMCSW'',@tabla=''TF_AswCatDepartamento''', 
		@database_name=N'sincroniza', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [TF_ASW-596_CatalogosMCSW-AswSch.ASWCatGpoParo]    Script Date: 06/10/2022 01:35:32 p. m. ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'TF_ASW-596_CatalogosMCSW-AswSch.ASWCatGpoParo', 
		@step_id=11, 
		@cmdexec_success_code=0, 
		@on_success_action=3, 
		@on_success_step_id=0, 
		@on_fail_action=3, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'EXEC dbo.sp_transferir @grupo= ''TF_ASW'' ,@sub_grupo=''596_CatalogosMCSW'',@tabla=''TF_ASWCatGpoParo''', 
		@database_name=N'sincroniza', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [TF_ASW-596_CatalogosMCSW-AswSch.AswCatMaquina]    Script Date: 06/10/2022 01:35:32 p. m. ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'TF_ASW-596_CatalogosMCSW-AswSch.AswCatMaquina', 
		@step_id=12, 
		@cmdexec_success_code=0, 
		@on_success_action=3, 
		@on_success_step_id=0, 
		@on_fail_action=3, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'EXEC dbo.sp_transferir @grupo= ''TF_ASW'' ,@sub_grupo=''596_CatalogosMCSW'',@tabla=''TF_AswCatMaquina''', 
		@database_name=N'sincroniza', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [TF_ASW-596_CatalogosMCSW-AswSch.AswCatRazonScrapCelda]    Script Date: 06/10/2022 01:35:32 p. m. ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'TF_ASW-596_CatalogosMCSW-AswSch.AswCatRazonScrapCelda', 
		@step_id=13, 
		@cmdexec_success_code=0, 
		@on_success_action=3, 
		@on_success_step_id=0, 
		@on_fail_action=3, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'EXEC dbo.sp_transferir @grupo= ''TF_ASW'' ,@sub_grupo=''596_CatalogosMCSW'',@tabla=''TF_AswCatRazonScrapCelda''', 
		@database_name=N'sincroniza', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [TF_ASW-596_CatalogosMCSW-AswSch.AswCatRelDepartamentoArea]    Script Date: 06/10/2022 01:35:32 p. m. ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'TF_ASW-596_CatalogosMCSW-AswSch.AswCatRelDepartamentoArea', 
		@step_id=14, 
		@cmdexec_success_code=0, 
		@on_success_action=3, 
		@on_success_step_id=0, 
		@on_fail_action=3, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'EXEC dbo.sp_transferir @grupo= ''TF_ASW'' ,@sub_grupo=''596_CatalogosMCSW'',@tabla=''TF_AswCatRelDepartamentoArea''', 
		@database_name=N'sincroniza', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [TF_ASW-596_CatalogosMCSW-AswSch.AswCatSeccionParo]    Script Date: 06/10/2022 01:35:32 p. m. ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'TF_ASW-596_CatalogosMCSW-AswSch.AswCatSeccionParo', 
		@step_id=15, 
		@cmdexec_success_code=0, 
		@on_success_action=3, 
		@on_success_step_id=0, 
		@on_fail_action=3, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'EXEC dbo.sp_transferir @grupo= ''TF_ASW'' ,@sub_grupo=''596_CatalogosMCSW'',@tabla=''TF_AswCatSeccionParo''', 
		@database_name=N'sincroniza', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [TF_ASW-596_CatalogosMCSW-AswSch.AswCatSeccionParoDatosMCSW]    Script Date: 06/10/2022 01:35:32 p. m. ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'TF_ASW-596_CatalogosMCSW-AswSch.AswCatSeccionParoDatosMCSW', 
		@step_id=16, 
		@cmdexec_success_code=0, 
		@on_success_action=3, 
		@on_success_step_id=0, 
		@on_fail_action=3, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'EXEC dbo.sp_transferir @grupo= ''TF_ASW'' ,@sub_grupo=''596_CatalogosMCSW'',@tabla=''TF_AswCatSeccionParoDatosMCSW''', 
		@database_name=N'sincroniza', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [TF_ASW-596_CatalogosMCSW-AswSch.AswCatTipoCelda]    Script Date: 06/10/2022 01:35:32 p. m. ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'TF_ASW-596_CatalogosMCSW-AswSch.AswCatTipoCelda', 
		@step_id=17, 
		@cmdexec_success_code=0, 
		@on_success_action=3, 
		@on_success_step_id=0, 
		@on_fail_action=3, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'EXEC dbo.sp_transferir @grupo= ''TF_ASW'' ,@sub_grupo=''596_CatalogosMCSW'',@tabla=''TF_AswCatTipoCelda''', 
		@database_name=N'sincroniza', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [TF_ASW-596_CatalogosMCSW-AswSch.ASWCatTipoParo]    Script Date: 06/10/2022 01:35:33 p. m. ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'TF_ASW-596_CatalogosMCSW-AswSch.ASWCatTipoParo', 
		@step_id=18, 
		@cmdexec_success_code=0, 
		@on_success_action=3, 
		@on_success_step_id=0, 
		@on_fail_action=3, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'EXEC dbo.sp_transferir @grupo= ''TF_ASW'' ,@sub_grupo=''596_CatalogosMCSW'',@tabla=''TF_ASWCatTipoParo''', 
		@database_name=N'sincroniza', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [TF_ASW-596_CatalogosMCSW-AswSch.AswCatTipoScrapCelda]    Script Date: 06/10/2022 01:35:33 p. m. ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'TF_ASW-596_CatalogosMCSW-AswSch.AswCatTipoScrapCelda', 
		@step_id=19, 
		@cmdexec_success_code=0, 
		@on_success_action=3, 
		@on_success_step_id=0, 
		@on_fail_action=3, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'EXEC dbo.sp_transferir @grupo= ''TF_ASW'' ,@sub_grupo=''596_CatalogosMCSW'',@tabla=''TF_AswCatTipoScrapCelda''', 
		@database_name=N'sincroniza', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [TF_ASW-596_CatalogosMCSW-AswSch.ASWCatTipoSeguimientoAlertaMCSW]    Script Date: 06/10/2022 01:35:33 p. m. ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'TF_ASW-596_CatalogosMCSW-AswSch.ASWCatTipoSeguimientoAlertaMCSW', 
		@step_id=20, 
		@cmdexec_success_code=0, 
		@on_success_action=3, 
		@on_success_step_id=0, 
		@on_fail_action=3, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'EXEC dbo.sp_transferir @grupo= ''TF_ASW'' ,@sub_grupo=''596_CatalogosMCSW'',@tabla=''TF_ASWCatTipoSeguimientoAlertaMCSW''', 
		@database_name=N'sincroniza', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [TF_ASW-596_CatalogosMCSW-AswSch.AswCatTurno]    Script Date: 06/10/2022 01:35:33 p. m. ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'TF_ASW-596_CatalogosMCSW-AswSch.AswCatTurno', 
		@step_id=21, 
		@cmdexec_success_code=0, 
		@on_success_action=3, 
		@on_success_step_id=0, 
		@on_fail_action=3, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'EXEC dbo.sp_transferir @grupo= ''TF_ASW'' ,@sub_grupo=''596_CatalogosMCSW'',@tabla=''TF_AswCatTurno''', 
		@database_name=N'sincroniza', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [TF_ASW-596_CatalogosMCSW-AswSch.ASWCfgBSCProductionChart]    Script Date: 06/10/2022 01:35:33 p. m. ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'TF_ASW-596_CatalogosMCSW-AswSch.ASWCfgBSCProductionChart', 
		@step_id=22, 
		@cmdexec_success_code=0, 
		@on_success_action=3, 
		@on_success_step_id=0, 
		@on_fail_action=3, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'EXEC dbo.sp_transferir @grupo= ''TF_ASW'' ,@sub_grupo=''596_CatalogosMCSW'',@tabla=''TF_ASWCfgBSCProductionChart''', 
		@database_name=N'sincroniza', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [TF_ASW-596_CatalogosMCSW-AswSch.AswPalTraProduccionMCSW]    Script Date: 06/10/2022 01:35:33 p. m. ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'TF_ASW-596_CatalogosMCSW-AswSch.AswPalTraProduccionMCSW', 
		@step_id=23, 
		@cmdexec_success_code=0, 
		@on_success_action=3, 
		@on_success_step_id=0, 
		@on_fail_action=3, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'EXEC dbo.sp_transferir @grupo= ''TF_ASW'' ,@sub_grupo=''596_CatalogosMCSW'',@tabla=''TF_AswPalTraProduccionMCSW''', 
		@database_name=N'sincroniza', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [TF_ASW-596_CatalogosMCSW-AswSch.AswRelAlertaSeccionParoMCSW]    Script Date: 06/10/2022 01:35:33 p. m. ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'TF_ASW-596_CatalogosMCSW-AswSch.AswRelAlertaSeccionParoMCSW', 
		@step_id=24, 
		@cmdexec_success_code=0, 
		@on_success_action=3, 
		@on_success_step_id=0, 
		@on_fail_action=3, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'EXEC dbo.sp_transferir @grupo= ''TF_ASW'' ,@sub_grupo=''596_CatalogosMCSW'',@tabla=''TF_AswRelAlertaSeccionParoMCSW''', 
		@database_name=N'sincroniza', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [TF_ASW-596_CatalogosMCSW-AswSch.AswRelAlertaTipoSeguimientoAlertaMCSW]    Script Date: 06/10/2022 01:35:34 p. m. ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'TF_ASW-596_CatalogosMCSW-AswSch.AswRelAlertaTipoSeguimientoAlertaMCSW', 
		@step_id=25, 
		@cmdexec_success_code=0, 
		@on_success_action=3, 
		@on_success_step_id=0, 
		@on_fail_action=3, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'EXEC dbo.sp_transferir @grupo= ''TF_ASW'' ,@sub_grupo=''596_CatalogosMCSW'',@tabla=''TF_AswRelAlertaTipoSeguimientoAlertaMCSW''', 
		@database_name=N'sincroniza', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [TF_ASW-596_CatalogosMCSW-AswSch.ASWRelTipoParoGpoParo]    Script Date: 06/10/2022 01:35:34 p. m. ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'TF_ASW-596_CatalogosMCSW-AswSch.ASWRelTipoParoGpoParo', 
		@step_id=26, 
		@cmdexec_success_code=0, 
		@on_success_action=1, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'EXEC dbo.sp_transferir @grupo= ''TF_ASW'' ,@sub_grupo=''596_CatalogosMCSW'',@tabla=''TF_ASWRelTipoParoGpoParo''', 
		@database_name=N'sincroniza', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_update_job @job_id = @jobId, @start_step_id = 1
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobschedule @job_id=@jobId, @name=N'Diario-Cada-60-Minutos', 
		@enabled=1, 
		@freq_type=4, 
		@freq_interval=1, 
		@freq_subday_type=4, 
		@freq_subday_interval=60, 
		@freq_relative_interval=0, 
		@freq_recurrence_factor=0, 
		@active_start_date=20220824, 
		@active_end_date=99991231, 
		@active_start_time=0, 
		@active_end_time=235959, 
		@schedule_uid=N'c99eb463-3693-443f-86ba-a8c8361f03bb'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobserver @job_id = @jobId, @server_name = N'(local)'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
COMMIT TRANSACTION
GOTO EndSave
QuitWithRollback:
    IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION
EndSave:
GO


