USE [ASW]
GO

/****** Object:  View [AswSch].[MSWCatBSCTipoParoAndonTempVw]    Script Date: 11/11/2022 01:29:22 p. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [AswSch].[MSWCatBSCTipoParoAndonTempVw] AS (
select 68 as ClaUbicacion
,ClaTipoParoAndon as ClaTipoParo
,ClaveTipoParoAndon + '-' + NomTipoParoAndon as NomTipoParo
,BajaLogica
,FechaBajaLogica
,FechaUltimaMod
,ClaUsuarioMod
,NombrePcMod
From  [MSW_LNKSVR].MCSW_Integra.MswSch.MSWCatBSCTipoParoAndonVw
) 
GO


