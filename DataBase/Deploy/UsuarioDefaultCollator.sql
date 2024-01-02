--SELECT * FROM [AswSch].[TiTraUsuarioCentralVw] where claubicaciondefault = 68 and perfil=0
----SELECT * FROM [AswSch].[TiTraReferenciaCentralVw] where idPerfilReferenciado between 3500000 and 3509999 and bajalogica=0-- and idUsuario=2914553
----SELECT * FROM TiCentral.[TiSeguridad].[dbo].[TiTraUsuarioContrasena] WHERE IdUsuario = 2914553
----SELECT TiSeguridad.dbo.FnDecriptaPassword(0x951B27EFEB06E85E)
/*
SELECT * FROM [AswSch].[TiTraUsuarioCentralVw] where claubicaciondefault = 68 and perfil=1
SELECT * FROM [AswSch].[TiTraUsuarioVw] where claubicaciondefault = 68 and perfil=0
SELECT * FROM [AswSch].[TiTraReferenciaCentralVw] where IdPerfilReferenciado=3500000
SELECT * FROM [AswSch].[TiTraReferenciaVw] where IdPerfilReferenciado=3500000
*/
USE [ASW]
GO

INSERT INTO [AswSch].[TiTraUsuarioCentralVw]
           ([IdUsuario],[ClaEmpleado],[NombreUsuario],[ApellidoPaterno],[ApellidoMaterno],[FechaNacimiento],[Email],[LoginUserName]
			,[Bloqueado],[ClaUbicacionDefault],[Perfil],[NombreModificable],[AutenticacionActiveD],[IntentosFallidosPrincipal],[BajaLogica]
			,[FechaIns],[ClaUsuarioIns],[FechaUltimaMod],[ClaUsuarioMod],[NombrePcMod],[BajaNomina],[Rfc],[ClaIdiomaDefault])
VALUES
			(3502001,3502001,'USER','COLLATOR','POPLAR','1986-12-19','mrodriguezc@deacero.com','COLLATOR'
			,0,68,0,1,0,0,0
			,GETDATE(),2914553,GETDATE(),2914553,'302MRODRIGUEZC',0,'3502001',5)
GO

INSERT INTO [AswSch].[TiTraReferenciaCentralVw]
		(IdUsuario, IdPerfilReferenciado, FechaInicial, FechaFinal, ClaUbicacion,
		Orden, FechaUltimaMod, ClaUsuarioMod, NombrePcMod, BajaLogica, FechaBajaLogica)
VALUES
		(3502001, 3500000, NULL, NULL, 68,
		1, GETDATE(), 2914553, '302MRODRIGUEZC', 0, NULL)
GO


--SUPERVISOR

INSERT INTO [AswSch].[TiTraUsuarioCentralVw]
           ([IdUsuario],[ClaEmpleado],[NombreUsuario],[ApellidoPaterno],[ApellidoMaterno],[FechaNacimiento],[Email],[LoginUserName]
			,[Bloqueado],[ClaUbicacionDefault],[Perfil],[NombreModificable],[AutenticacionActiveD],[IntentosFallidosPrincipal],[BajaLogica]
			,[FechaIns],[ClaUsuarioIns],[FechaUltimaMod],[ClaUsuarioMod],[NombrePcMod],[BajaNomina],[Rfc],[ClaIdiomaDefault])
VALUES
			(3502002,3502002,'SUPERVISOR','COLLATOR','POPLAR','1986-12-19','mrodriguezc@deacero.com','COLL-SUPERVISOR'
			,0,68,0,1,0,0,0
			,GETDATE(),2914553,GETDATE(),2914553,'302MRODRIGUEZC',0,'3502001',5)
GO

INSERT INTO [AswSch].[TiTraReferenciaCentralVw]
		(IdUsuario, IdPerfilReferenciado, FechaInicial, FechaFinal, ClaUbicacion,
		Orden, FechaUltimaMod, ClaUsuarioMod, NombrePcMod, BajaLogica, FechaBajaLogica)
VALUES
		(3502002, 3500001, NULL, NULL, 68,
		1, GETDATE(), 2914553, '302MRODRIGUEZC', 0, NULL)
GO

INSERT INTO [AswSch].[TiTraUsuarioContrasenaCentralVW] 
           ([IdUsuario],[Contrasena],[HuellaUtiliza],[HuellaObligatoria],[CambiarContrasenaPrincipal],[HuellaDefault]
           ,[IntentosFallidosExtra1],[IntentosFallidosExtra2],[IntentosFallidosHuella],[BloqueoExtra1],[BloqueoExtra2],[BloqueoExtraHuella]
           ,[BajaLogica],[FechaUltimaMod],[ClaUsuarioMod],[NombrePcMod],[OpcionesMultiples],[TokenUtiliza],[BlackberryUtiliza])
     VALUES
           (3502002,0x0E211C733E7979B4/*collsup*/,0,0,0,0
           ,0,0,0,0,0,0
           ,0,GETDATE(),2914553,'302MRODRIGUEZC',1,0,0)
GO

