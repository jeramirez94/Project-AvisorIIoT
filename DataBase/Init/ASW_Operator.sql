USE [msdb]
GO
EXEC msdb.dbo.sp_add_operator @name=N'ASW_Operator', 
		@enabled=1, 
		@pager_days=0, 
		@email_address=N'mrodriguezc@deacero.com'
GO
