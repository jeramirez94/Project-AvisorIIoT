--USE [ASWH]
--GO

/****** Object:  View [AswSch].[AswCatCapacidadMaquinaVw]    Script Date: 12/05/2023 12:23:08 p. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE VIEW [AswSch].[AswManCatEmpaqueAgrupadoVw]
AS  

SELECT ClaPlanta AS ClaUbicacion
	,ClaArticulo
	,Cantidad
FROM [MAN_LNKSVR].[Operacion].[ManSch].[ManCatEmpaqueAgrupadoVw]
GO


