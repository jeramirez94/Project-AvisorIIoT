USE [msdb]
GO

/****** Object:  Job [TF-ASW-SistemaMtto]    Script Date: 06/10/2022 01:36:01 p. m. ******/
BEGIN TRANSACTION
DECLARE @ReturnCode INT
SELECT @ReturnCode = 0
/****** Object:  JobCategory [[Uncategorized (Local)]]    Script Date: 06/10/2022 01:36:02 p. m. ******/
IF NOT EXISTS (SELECT name FROM msdb.dbo.syscategories WHERE name=N'[Uncategorized (Local)]' AND category_class=1)
BEGIN
EXEC @ReturnCode = msdb.dbo.sp_add_category @class=N'JOB', @type=N'LOCAL', @name=N'[Uncategorized (Local)]'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback

END

DECLARE @jobId BINARY(16)
EXEC @ReturnCode =  msdb.dbo.sp_add_job @job_name=N'TF-ASW-SistemaMtto', 
		@enabled=1, 
		@notify_level_eventlog=2, 
		@notify_level_email=0, 
		@notify_level_netsend=0, 
		@notify_level_page=0, 
		@delete_level=0, 
		@description=N'TF-ASW-SistemaMtto', 
		@category_name=N'[Uncategorized (Local)]', 
		@owner_login_name=N'sa', @job_id = @jobId OUTPUT
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [TF_ASW-684_SistemaMtto-AswSch.AswMtoCatActividad]    Script Date: 06/10/2022 01:36:03 p. m. ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'TF_ASW-684_SistemaMtto-AswSch.AswMtoCatActividad', 
		@step_id=1, 
		@cmdexec_success_code=0, 
		@on_success_action=3, 
		@on_success_step_id=0, 
		@on_fail_action=3, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'EXEC dbo.sp_transferir @grupo= ''TF_ASW'' ,@sub_grupo=''684_SistemaMtto'',@tabla=''TF_AswMtoCatActividad''', 
		@database_name=N'sincroniza', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [TF_ASW-684_SistemaMtto-AswSch.AswMtoCatEquipo]    Script Date: 06/10/2022 01:36:03 p. m. ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'TF_ASW-684_SistemaMtto-AswSch.AswMtoCatEquipo', 
		@step_id=2, 
		@cmdexec_success_code=0, 
		@on_success_action=3, 
		@on_success_step_id=0, 
		@on_fail_action=3, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'EXEC dbo.sp_transferir @grupo= ''TF_ASW'' ,@sub_grupo=''684_SistemaMtto'',@tabla=''TF_AswMtoCatEquipo''', 
		@database_name=N'sincroniza', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [TF_ASW-684_SistemaMtto-AswSch.AswMtoCatRcmFuncion]    Script Date: 06/10/2022 01:36:03 p. m. ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'TF_ASW-684_SistemaMtto-AswSch.AswMtoCatRcmFuncion', 
		@step_id=3, 
		@cmdexec_success_code=0, 
		@on_success_action=3, 
		@on_success_step_id=0, 
		@on_fail_action=3, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'EXEC dbo.sp_transferir @grupo= ''TF_ASW'' ,@sub_grupo=''684_SistemaMtto'',@tabla=''TF_AswMtoCatRcmFuncion''', 
		@database_name=N'sincroniza', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [TF_ASW-684_SistemaMtto-AswSch.AswMtoCatRcmFuncionFalla]    Script Date: 06/10/2022 01:36:04 p. m. ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'TF_ASW-684_SistemaMtto-AswSch.AswMtoCatRcmFuncionFalla', 
		@step_id=4, 
		@cmdexec_success_code=0, 
		@on_success_action=3, 
		@on_success_step_id=0, 
		@on_fail_action=3, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'EXEC dbo.sp_transferir @grupo= ''TF_ASW'' ,@sub_grupo=''684_SistemaMtto'',@tabla=''TF_AswMtoCatRcmFuncionFalla''', 
		@database_name=N'sincroniza', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [TF_ASW-684_SistemaMtto-AswSch.AswMtoCatSistema]    Script Date: 06/10/2022 01:36:04 p. m. ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'TF_ASW-684_SistemaMtto-AswSch.AswMtoCatSistema', 
		@step_id=5, 
		@cmdexec_success_code=0, 
		@on_success_action=3, 
		@on_success_step_id=0, 
		@on_fail_action=3, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'EXEC dbo.sp_transferir @grupo= ''TF_ASW'' ,@sub_grupo=''684_SistemaMtto'',@tabla=''TF_AswMtoCatSistema''', 
		@database_name=N'sincroniza', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [TF_ASW-684_SistemaMtto-AswSch.AswMtoCatSubArea]    Script Date: 06/10/2022 01:36:04 p. m. ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'TF_ASW-684_SistemaMtto-AswSch.AswMtoCatSubArea', 
		@step_id=6, 
		@cmdexec_success_code=0, 
		@on_success_action=3, 
		@on_success_step_id=0, 
		@on_fail_action=3, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'EXEC dbo.sp_transferir @grupo= ''TF_ASW'' ,@sub_grupo=''684_SistemaMtto'',@tabla=''TF_AswMtoCatSubArea''', 
		@database_name=N'sincroniza', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [TF_ASW-684_SistemaMtto-AswSch.AswMtoCatSubSistema]    Script Date: 06/10/2022 01:36:04 p. m. ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'TF_ASW-684_SistemaMtto-AswSch.AswMtoCatSubSistema', 
		@step_id=7, 
		@cmdexec_success_code=0, 
		@on_success_action=3, 
		@on_success_step_id=0, 
		@on_fail_action=3, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'EXEC dbo.sp_transferir @grupo= ''TF_ASW'' ,@sub_grupo=''684_SistemaMtto'',@tabla=''TF_AswMtoCatSubSistema''', 
		@database_name=N'sincroniza', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [TF_ASW-684_SistemaMtto-AswSch.AswMtoTraRcmModoFalla]    Script Date: 06/10/2022 01:36:05 p. m. ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'TF_ASW-684_SistemaMtto-AswSch.AswMtoTraRcmModoFalla', 
		@step_id=8, 
		@cmdexec_success_code=0, 
		@on_success_action=3, 
		@on_success_step_id=0, 
		@on_fail_action=3, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'EXEC dbo.sp_transferir @grupo= ''TF_ASW'' ,@sub_grupo=''684_SistemaMtto'',@tabla=''TF_AswMtoTraRcmModoFalla''', 
		@database_name=N'sincroniza', 
		@flags=0
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
/****** Object:  Step [TF_ASW-684_SistemaMtto-AswSch.ASWTraParoMantenimiento]    Script Date: 06/10/2022 01:36:05 p. m. ******/
EXEC @ReturnCode = msdb.dbo.sp_add_jobstep @job_id=@jobId, @step_name=N'TF_ASW-684_SistemaMtto-AswSch.ASWTraParoMantenimiento', 
		@step_id=9, 
		@cmdexec_success_code=0, 
		@on_success_action=1, 
		@on_success_step_id=0, 
		@on_fail_action=2, 
		@on_fail_step_id=0, 
		@retry_attempts=0, 
		@retry_interval=0, 
		@os_run_priority=0, @subsystem=N'TSQL', 
		@command=N'EXEC dbo.sp_transferir @grupo= ''TF_ASW'' ,@sub_grupo=''684_SistemaMtto'',@tabla=''TF_ASWTraParoMantenimiento''', 
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
		@active_start_date=20201203, 
		@active_end_date=99991231, 
		@active_start_time=0, 
		@active_end_time=235959, 
		@schedule_uid=N'01d16e77-6f43-4424-b790-1da98eedf3bb'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
EXEC @ReturnCode = msdb.dbo.sp_add_jobserver @job_id = @jobId, @server_name = N'(local)'
IF (@@ERROR <> 0 OR @ReturnCode <> 0) GOTO QuitWithRollback
COMMIT TRANSACTION
GOTO EndSave
QuitWithRollback:
    IF (@@TRANCOUNT > 0) ROLLBACK TRANSACTION
EndSave:
GO


