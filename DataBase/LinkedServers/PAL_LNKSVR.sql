USE [master]
GO

/****** Object:  LinkedServer [PAL_LNKSVR]    Script Date: 09/06/2023 04:22:48 p. m. ******/
EXEC master.dbo.sp_addlinkedserver @server = N'PAL_LNKSVR', @srvproduct=N'', @provider=N'SQLNCLI', @datasrc=N'DEAHOUNET03', @catalog=N'Operacion'
 /* For security reasons the linked server remote logins password is changed with ######## */
EXEC master.dbo.sp_addlinkedsrvlogin @rmtsrvname=N'PAL_LNKSVR',@useself=N'False',@locallogin=NULL,@rmtuser=N'palusr',@rmtpassword='palusr'
GO

EXEC master.dbo.sp_serveroption @server=N'PAL_LNKSVR', @optname=N'collation compatible', @optvalue=N'false'
GO

EXEC master.dbo.sp_serveroption @server=N'PAL_LNKSVR', @optname=N'data access', @optvalue=N'true'
GO

EXEC master.dbo.sp_serveroption @server=N'PAL_LNKSVR', @optname=N'dist', @optvalue=N'false'
GO

EXEC master.dbo.sp_serveroption @server=N'PAL_LNKSVR', @optname=N'pub', @optvalue=N'false'
GO

EXEC master.dbo.sp_serveroption @server=N'PAL_LNKSVR', @optname=N'rpc', @optvalue=N'true'
GO

EXEC master.dbo.sp_serveroption @server=N'PAL_LNKSVR', @optname=N'rpc out', @optvalue=N'true'
GO

EXEC master.dbo.sp_serveroption @server=N'PAL_LNKSVR', @optname=N'sub', @optvalue=N'false'
GO

EXEC master.dbo.sp_serveroption @server=N'PAL_LNKSVR', @optname=N'connect timeout', @optvalue=N'0'
GO

EXEC master.dbo.sp_serveroption @server=N'PAL_LNKSVR', @optname=N'collation name', @optvalue=null
GO

EXEC master.dbo.sp_serveroption @server=N'PAL_LNKSVR', @optname=N'lazy schema validation', @optvalue=N'false'
GO

EXEC master.dbo.sp_serveroption @server=N'PAL_LNKSVR', @optname=N'query timeout', @optvalue=N'0'
GO

EXEC master.dbo.sp_serveroption @server=N'PAL_LNKSVR', @optname=N'use remote collation', @optvalue=N'true'
GO

EXEC master.dbo.sp_serveroption @server=N'PAL_LNKSVR', @optname=N'remote proc transaction promotion', @optvalue=N'true'
GO


