
CREATE VIEW AswSch.AswTiRelUsuarioPerfilVw AS
SELECT [ClaUbicacion]
	,[IdUsuario]
	,[IdPerfilReferenciado] AS IdPerfil
	,[BajaLogica]
	,[FechaBajaLogica]
	,[FechaUltimaMod]
	,[ClaUsuarioMod]
	,[NombrePcMod]
  FROM TiSeguridad.[dbo].[TiTraReferencia] R
  WHERE IdPerfilReferenciado BETWEEN 3500000 AND 3509999
	AND BajaLogica = 0
GO


