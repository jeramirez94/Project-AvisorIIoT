USE [ASW]
GO

/****** Object:  View [AswSch].[MSWCatBSCRazonAndonTempVw]    Script Date: 11/11/2022 01:28:08 p. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [AswSch].[MSWCatBSCRazonAndonTempVw] AS (
select  68 as ClaUbicacion
,ClaRazonAndon as ClaSeccionParo
,ClaTipoAndon as ClaGpoParo
,ClaTipoParoAndon as ClaTipoParo
,ClaveRazonAndon + '-' + NomRazonAndon as NomSeccionParo
,BajaLogica
,FechaBajaLogica
,FechaUltimaMod
,NombrePcMod
,ClaUsuarioMod
from [MSW_LNKSVR].MCSW_Integra.MswSch.MSWCatBSCRazonAndonVw
)

GO


