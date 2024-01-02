USE [master]
GO

/****** Object:  LinkedServer [APH_LNKSVR]    Script Date: 09/06/2023 04:21:34 p. m. ******/
EXEC master.dbo.sp_addlinkedserver @server = N'APH_LNKSVR', @srvproduct=N'SqlServer', @provider=N'SQLNCLI11', @datasrc=N'DEAHOUNET01'
 /* For security reasons the linked server remote logins password is changed with ######## */
EXEC master.dbo.sp_addlinkedsrvlogin @rmtsrvname=N'APH_LNKSVR',@useself=N'False',@locallogin=NULL,@rmtuser=N'consulta',@rmtpassword='consulta'
GO

EXEC master.dbo.sp_serveroption @server=N'APH_LNKSVR', @optname=N'collation compatible', @optvalue=N'false'
GO

EXEC master.dbo.sp_serveroption @server=N'APH_LNKSVR', @optname=N'data access', @optvalue=N'true'
GO

EXEC master.dbo.sp_serveroption @server=N'APH_LNKSVR', @optname=N'dist', @optvalue=N'false'
GO

EXEC master.dbo.sp_serveroption @server=N'APH_LNKSVR', @optname=N'pub', @optvalue=N'false'
GO

EXEC master.dbo.sp_serveroption @server=N'APH_LNKSVR', @optname=N'rpc', @optvalue=N'true'
GO

EXEC master.dbo.sp_serveroption @server=N'APH_LNKSVR', @optname=N'rpc out', @optvalue=N'true'
GO

EXEC master.dbo.sp_serveroption @server=N'APH_LNKSVR', @optname=N'sub', @optvalue=N'false'
GO

EXEC master.dbo.sp_serveroption @server=N'APH_LNKSVR', @optname=N'connect timeout', @optvalue=N'0'
GO

EXEC master.dbo.sp_serveroption @server=N'APH_LNKSVR', @optname=N'collation name', @optvalue=null
GO

EXEC master.dbo.sp_serveroption @server=N'APH_LNKSVR', @optname=N'lazy schema validation', @optvalue=N'false'
GO

EXEC master.dbo.sp_serveroption @server=N'APH_LNKSVR', @optname=N'query timeout', @optvalue=N'0'
GO

EXEC master.dbo.sp_serveroption @server=N'APH_LNKSVR', @optname=N'use remote collation', @optvalue=N'true'
GO

EXEC master.dbo.sp_serveroption @server=N'APH_LNKSVR', @optname=N'remote proc transaction promotion', @optvalue=N'true'
GO


