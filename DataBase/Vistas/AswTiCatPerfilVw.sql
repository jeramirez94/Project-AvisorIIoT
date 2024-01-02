
CREATE VIEW AswSch.AswTiCatPerfilVw AS
SELECT [IdUsuario]
      ,[NombrePerfil]
      ,[BajaLogica]
      ,[FechaBajaLogica]
      ,[FechaIns]
      ,[ClaUsuarioIns]
      ,[FechaUltimaMod]
      ,[ClaUsuarioMod]
      ,[NombrePcMod]
  FROM [TiSeguridad].[dbo].[TiTraUsuario] 
  WHERE IdUsuario BETWEEN 3500000 AND 3509999
	AND Perfil = 1
GO


