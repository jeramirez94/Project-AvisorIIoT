USE [master]
GO

/* For security reasons the login is created disabled and with a random password. */
/****** Object:  Login [transfer]    Script Date: 26/08/2020 10:30:08 a. m. ******/
CREATE LOGIN [transfer] WITH PASSWORD=N'transfer', DEFAULT_DATABASE=[sincroniza], DEFAULT_LANGUAGE=[us_english], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO

ALTER LOGIN [transfer] DISABLE
GO


