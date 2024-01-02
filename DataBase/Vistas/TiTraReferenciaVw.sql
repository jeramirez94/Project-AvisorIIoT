USE [ASW]
GO

/****** Object:  View [AswSch].[TiTraReferenciaVw]    Script Date: 14/11/2022 10:23:00 a. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [AswSch].[TiTraReferenciaVw] AS 
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
FROM TiSeguridad.dbo.[TiTraReferencia]
--where ClaUbicacion = 68
GO


