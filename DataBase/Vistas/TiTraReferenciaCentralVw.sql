USE [ASW]
GO

/****** Object:  View [AswSch].[TiTraReferenciaCentralVw]    Script Date: 14/11/2022 10:21:46 a. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [AswSch].[TiTraReferenciaCentralVw] AS 
SELECT [IdUsuario] ,
	[IdPerfilReferenciado],
	[FechaInicial],
	[FechaFinal],
	[ClaUbicacion],
	[Orden],
	[FechaUltimaMod],
	[ClaUsuarioMod],
	[NombrePcMod],
	[BajaLogica] ,
	[FechaBajaLogica]
FROM TiCentral.TiSeguridad.dbo.TiTraReferencia
GO