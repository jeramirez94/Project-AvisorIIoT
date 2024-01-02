USE [ASW]
GO

/****** Object:  View [AswSch].[TiTraUsuarioCentralVw]    Script Date: 14/11/2022 10:24:14 a. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [AswSch].[TiTraUsuarioCentralVw] AS
SELECT [IdUsuario]
      ,[ClaEmpleado]
      ,[NombrePerfil]
      ,[NombreUsuario]
      ,[ApellidoPaterno]
      ,[ApellidoMaterno]
      ,[FechaNacimiento]
      ,[Email]
      ,[EmailAlterno]
      ,[LoginUserName]
      ,[TelefonoCasa]
      ,[TelefonoOficina]
      ,[TelefonoCelular]
      ,[Puesto]
      ,[IdEmpleadoJefe]
      ,[ClaCrc]
      ,[Dominio]
      ,[Bloqueado]
      ,[ClaUbicacionDefault]
      ,[Perfil]
      ,[NombreModificable]
      ,[AutenticacionActiveD]
      ,[IntentosFallidosPrincipal]
      ,[FechaUltIntentoPrincipal]
      ,[DispositivoMovil]
      ,[BajaLogica]
      ,[FechaBajaLogica]
      ,[FechaIns]
      ,[ClaUsuarioIns]
      ,[FechaUltimaMod]
      ,[ClaUsuarioMod]
      ,[NombrePcMod]
      ,[ClaPuesto]
      ,[BajaNomina]
      ,[Rfc]
      ,[ClaIdiomaDefault]
  FROM TICENTRAL.[TiSeguridad].[dbo].[TiTraUsuario]

GO





