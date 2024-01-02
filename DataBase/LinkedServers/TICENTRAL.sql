USE [master]
GO

/****** Object:  LinkedServer [TICENTRAL]    Script Date: 27/08/2020 07:27:54 a. m. ******/
EXEC master.dbo.sp_addlinkedserver @server = N'TICENTRAL', @srvproduct=N'SQL Server'
 /* For security reasons the linked server remote logins password is changed with ######## */
EXEC master.dbo.sp_addlinkedsrvlogin @rmtsrvname=N'TICENTRAL',@useself=N'False',@locallogin=N'AswUsr',@rmtuser=N'consulta',@rmtpassword='consulta'
EXEC master.dbo.sp_addlinkedsrvlogin @rmtsrvname=N'TICENTRAL',@useself=N'False',@locallogin=N'sa',@rmtuser=N'consulta',@rmtpassword='consulta'

GO

EXEC master.dbo.sp_serveroption @server=N'TICENTRAL', @optname=N'collation compatible', @optvalue=N'false'
GO

EXEC master.dbo.sp_serveroption @server=N'TICENTRAL', @optname=N'data access', @optvalue=N'true'
GO

EXEC master.dbo.sp_serveroption @server=N'TICENTRAL', @optname=N'dist', @optvalue=N'false'
GO

EXEC master.dbo.sp_serveroption @server=N'TICENTRAL', @optname=N'pub', @optvalue=N'false'
GO

EXEC master.dbo.sp_serveroption @server=N'TICENTRAL', @optname=N'rpc', @optvalue=N'true'
GO

EXEC master.dbo.sp_serveroption @server=N'TICENTRAL', @optname=N'rpc out', @optvalue=N'true'
GO

EXEC master.dbo.sp_serveroption @server=N'TICENTRAL', @optname=N'sub', @optvalue=N'false'
GO

EXEC master.dbo.sp_serveroption @server=N'TICENTRAL', @optname=N'connect timeout', @optvalue=N'0'
GO

EXEC master.dbo.sp_serveroption @server=N'TICENTRAL', @optname=N'collation name', @optvalue=null
GO

EXEC master.dbo.sp_serveroption @server=N'TICENTRAL', @optname=N'lazy schema validation', @optvalue=N'false'
GO

EXEC master.dbo.sp_serveroption @server=N'TICENTRAL', @optname=N'query timeout', @optvalue=N'0'
GO

EXEC master.dbo.sp_serveroption @server=N'TICENTRAL', @optname=N'use remote collation', @optvalue=N'true'
GO

EXEC master.dbo.sp_serveroption @server=N'TICENTRAL', @optname=N'remote proc transaction promotion', @optvalue=N'true'
GO


