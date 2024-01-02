USE [ASW]
GO

/****** Object:  View [AswSch].[MSWCatBSCTipoAndonTempVW]    Script Date: 11/11/2022 01:28:56 p. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW  [AswSch].[MSWCatBSCTipoAndonTempVW]  AS(

SELECT 68 AS ClaUbicacion
	,ClaTipoAndon AS ClaGpoParo
	,NomTipoAndon AS NomGpoParo
	,BajaLogica
	,FechaBajaLogica
	,FechaUltimaMod
	,ClaUsuarioMod
	,NombrePcMod
FROM [MSW_LNKSVR].MCSW_Integra.MSWSch.MSWCatBSCTipoAndon 

)
GO


