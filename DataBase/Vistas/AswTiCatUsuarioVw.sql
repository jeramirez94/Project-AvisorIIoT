
CREATE VIEW AswSch.AswTiCatUsuarioVw AS
SELECT DISTINCT R.ClaUbicacion 
	,U.[IdUsuario]
	,U.[ClaEmpleado]
	,U.[NombreUsuario]
	,U.[ApellidoPaterno]
	,U.[ApellidoMaterno]
	,U.[Email]
	,U.[EmailAlterno]
	,U.[LoginUserName]
	,U.[IdEmpleadoJefe]
	,U.[Bloqueado]
	,U.[BajaLogica]
	,U.[FechaBajaLogica]
	,U.[FechaIns]
	,U.[ClaUsuarioIns]
	,U.[FechaUltimaMod]
	,U.[ClaUsuarioMod]
	,U.[NombrePcMod]
  FROM [TiSeguridad].[dbo].[TiTraUsuario] U
  JOIN TiSeguridad.[dbo].[TiTraReferencia] R
	ON U.IdUsuario = R.IdUsuario
	AND R.BajaLogica = 0
  WHERE IdPerfilReferenciado BETWEEN 3500000 AND 3509999
GO


