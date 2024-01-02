USE [ASW]
GO

/****** Object:  User [AswUsr]    Script Date: 07/08/2020 05:02:35 p. m. ******/
CREATE USER [AswUsr] FOR LOGIN [AswUsr] WITH DEFAULT_SCHEMA=[AswSch]
GO


ALTER SERVER ROLE [sysadmin] ADD MEMBER [AswUsr]
GO
