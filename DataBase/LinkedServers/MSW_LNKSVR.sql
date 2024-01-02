USE [master]
GO

/****** Object:  LinkedServer [MSW_LNKSVR]    Script Date: 07/08/2020 05:21:58 p. m. ******/
EXEC master.dbo.sp_addlinkedserver @server = N'MSW_LNKSVR', @srvproduct=N'SQLSERVER', @provider=N'SQLNCLI', @datasrc=N'DEAMIDCON', @catalog=N'MCSW_Integra'
 /* For security reasons the linked server remote logins password is changed with ######## */
EXEC master.dbo.sp_addlinkedsrvlogin @rmtsrvname=N'MSW_LNKSVR',@useself=N'False',@locallogin=NULL,@rmtuser=N'MswUsr',@rmtpassword='mswusr'

GO

EXEC master.dbo.sp_serveroption @server=N'MSW_LNKSVR', @optname=N'collation compatible', @optvalue=N'false'
GO

EXEC master.dbo.sp_serveroption @server=N'MSW_LNKSVR', @optname=N'data access', @optvalue=N'true'
GO

EXEC master.dbo.sp_serveroption @server=N'MSW_LNKSVR', @optname=N'dist', @optvalue=N'false'
GO

EXEC master.dbo.sp_serveroption @server=N'MSW_LNKSVR', @optname=N'pub', @optvalue=N'false'
GO

EXEC master.dbo.sp_serveroption @server=N'MSW_LNKSVR', @optname=N'rpc', @optvalue=N'true'
GO

EXEC master.dbo.sp_serveroption @server=N'MSW_LNKSVR', @optname=N'rpc out', @optvalue=N'true'
GO

EXEC master.dbo.sp_serveroption @server=N'MSW_LNKSVR', @optname=N'sub', @optvalue=N'false'
GO

EXEC master.dbo.sp_serveroption @server=N'MSW_LNKSVR', @optname=N'connect timeout', @optvalue=N'0'
GO

EXEC master.dbo.sp_serveroption @server=N'MSW_LNKSVR', @optname=N'collation name', @optvalue=null
GO

EXEC master.dbo.sp_serveroption @server=N'MSW_LNKSVR', @optname=N'lazy schema validation', @optvalue=N'false'
GO

EXEC master.dbo.sp_serveroption @server=N'MSW_LNKSVR', @optname=N'query timeout', @optvalue=N'0'
GO

EXEC master.dbo.sp_serveroption @server=N'MSW_LNKSVR', @optname=N'use remote collation', @optvalue=N'true'
GO

EXEC master.dbo.sp_serveroption @server=N'MSW_LNKSVR', @optname=N'remote proc transaction promotion', @optvalue=N'true'
GO


