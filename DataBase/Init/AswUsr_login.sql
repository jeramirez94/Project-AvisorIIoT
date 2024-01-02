USE [master]
GO

/* For security reasons the login is created disabled and with a random password. */
/****** Object:  Login [AswUsr]    Script Date: 07/08/2020 05:00:44 p. m. ******/
CREATE LOGIN [AswUsr] WITH PASSWORD=N'AswUsr', DEFAULT_DATABASE=[ASW], DEFAULT_LANGUAGE=[us_english], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO

ALTER LOGIN [AswUsr] DISABLE
GO


