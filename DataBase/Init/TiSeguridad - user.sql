USE [TiSeguridad]
GO
CREATE USER [AswUsr] FOR LOGIN [AswUsr]
GO
USE [TiSeguridad]
GO
ALTER USER [AswUsr] WITH DEFAULT_SCHEMA=[dbo]
GO
USE [TiSeguridad]
GO
ALTER ROLE [db_datareader] ADD MEMBER [AswUsr]
GO


