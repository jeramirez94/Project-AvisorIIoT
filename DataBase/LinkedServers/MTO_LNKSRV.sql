USE [master]
GO

/****** Object:  LinkedServer [MTO_LNKSRV]    Script Date: 25/11/2020 01:14:03 p. m. ******/
EXEC master.dbo.sp_addlinkedserver @server = N'MTO_LNKSRV', @srvproduct=N'DEAMTDMID', @provider=N'SQLNCLI', @datasrc=N'DEAMTDMID'
 /* For security reasons the linked server remote logins password is changed with ######## */
EXEC master.dbo.sp_addlinkedsrvlogin @rmtsrvname=N'MTO_LNKSRV',@useself=N'False',@locallogin=NULL,@rmtuser=N'MtoUsr',@rmtpassword='MtoUsr'

GO

EXEC master.dbo.sp_serveroption @server=N'MTO_LNKSRV', @optname=N'collation compatible', @optvalue=N'false'
GO

EXEC master.dbo.sp_serveroption @server=N'MTO_LNKSRV', @optname=N'data access', @optvalue=N'true'
GO

EXEC master.dbo.sp_serveroption @server=N'MTO_LNKSRV', @optname=N'dist', @optvalue=N'false'
GO

EXEC master.dbo.sp_serveroption @server=N'MTO_LNKSRV', @optname=N'pub', @optvalue=N'false'
GO

EXEC master.dbo.sp_serveroption @server=N'MTO_LNKSRV', @optname=N'rpc', @optvalue=N'true'
GO

EXEC master.dbo.sp_serveroption @server=N'MTO_LNKSRV', @optname=N'rpc out', @optvalue=N'true'
GO

EXEC master.dbo.sp_serveroption @server=N'MTO_LNKSRV', @optname=N'sub', @optvalue=N'false'
GO

EXEC master.dbo.sp_serveroption @server=N'MTO_LNKSRV', @optname=N'connect timeout', @optvalue=N'0'
GO

EXEC master.dbo.sp_serveroption @server=N'MTO_LNKSRV', @optname=N'collation name', @optvalue=null
GO

EXEC master.dbo.sp_serveroption @server=N'MTO_LNKSRV', @optname=N'lazy schema validation', @optvalue=N'false'
GO

EXEC master.dbo.sp_serveroption @server=N'MTO_LNKSRV', @optname=N'query timeout', @optvalue=N'0'
GO

EXEC master.dbo.sp_serveroption @server=N'MTO_LNKSRV', @optname=N'use remote collation', @optvalue=N'true'
GO

EXEC master.dbo.sp_serveroption @server=N'MTO_LNKSRV', @optname=N'remote proc transaction promotion', @optvalue=N'false'
GO


