USE [ASW]
GO

/****** Object:  View [AswSch].[TiTraUsuarioContrasenaCentralVW]    Script Date: 14/11/2022 10:27:18 a. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [AswSch].[TiTraUsuarioContrasenaCentralVW] AS (
SELECT [IdUsuario]
      ,[Contrasena]
      ,[ContrasenaExtra1]
      ,[ContrasenaExtra2]
      ,[HuellaUtiliza]
      ,[InfoHuella1]
      ,[InfoHuella2]
      ,[IntentosMaximosContrasena]
      ,[TiempoExpiracion]
      ,[HuellaObligatoria]
      ,[CambiarContrasenaPrincipal]
      ,[HuellaDefault]
      ,[IntentosMaximosHuella]
      ,[IntentosFallidosExtra1]
      ,[IntentosFallidosExtra2]
      ,[IntentosFallidosHuella]
      ,[BloqueoExtra1]
      ,[BloqueoExtra2]
      ,[BloqueoExtraHuella]
      ,[FechaUltIntentoExtra1]
      ,[FechaUltIntentoExtra2]
      ,[FechaUltIntentoHuella]
      ,[BajaLogica]
      ,[FechaBajaLogica]
      ,[FechaUltimaMod]
      ,[ClaUsuarioMod]
      ,[NombrePcMod]
      ,[OpcionesMultiples]
      ,[TokenUtiliza]
      ,[BlackberryUtiliza]
  FROM TiCentral.[TiSeguridad].[dbo].[TiTraUsuarioContrasena] 
  )
GO


