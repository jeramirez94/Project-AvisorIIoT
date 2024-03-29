USE [ASW]
GO
/****** Object:  StoredProcedure [AswSch].[ASW_CU203_Pag1_RelTipoParoGpoParo_Sel]    Script Date: 15/11/2022 02:17:16 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROC [AswSch].[ASW_CU203_Pag1_RelTipoParoGpoParo_Sel]
AS
BEGIN

	SELECT 'ASWLite_RelTipoParoGpoParo' as nombretabla
	,ClaUbicacion
	,IdTipoParoGpoParo
	,ClaGpoParo
	,ClaTipoParo
	,NomTipoParo
	,EsNoAplicaEficiencia
	,EsNoAplicaAprovechamiento
	,BajaLogica
	,CAST(FechaBajaLogica as VARCHAR) as FechaBajaLogica
	,CAST(FechaUltimaMod as VARCHAR) as FechaUltimaMod
	,NombrePcMod
	,ClaUsuarioMod
	,EsProgramado
	,ClaRubroParo
	FROM [AswSch].[ASWRelTipoParoGpoParo]

END


