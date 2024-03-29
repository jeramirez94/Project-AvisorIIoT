--USE [ASWH]
--GO
/****** Object:  StoredProcedure [AswSch].[ASW_CU522_Pag1_CatTipoSeguimientoAlerta_Sel]    Script Date: 15/11/2022 03:20:58 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROC [AswSch].[ASW_CU522_Pag1_CatTipoSeguimientoAlerta_Sel]
AS
BEGIN

SELECT
	   'ASWLite_CatTipoSeguimientoAlerta' as nombretabla
	   ,keys = 'ClaUbicacion,ClaTipoSeguimientoAlerta'
	   ,fuc = 'FechaUltimaMod'
	  ,[ClaUbicacion]
      ,[ClaSistema]
      ,[ClaTipoSeguimientoAlerta]
      ,[NomTipoSeguimientoAlerta]
      ,[DescTipoSeguimientoAlerta]
      ,[Color]
      ,[EsContinuo]
      ,[EsSMS]
      ,[EsRequiereAcuse]
      ,[EsHabilitarAtencion]
      ,[MinutosAvisoN1]
      ,[MinutosAvisoN2]
      ,[MinutosAvisoN3]
      ,[MinutosAvisoN4]
      ,[MinutosReenvioN3]
      ,[MinutosReenvioN4]
      ,[BajaLogica]
      ,convert(varchar,FechaBajaLogica,121) as FechaBajaLogica
      ,[ClaUsuarioMod]
      ,convert(varchar, GETDATE() ,121) AS FechaUltimaMod
      ,[NombrePcMod]
  FROM [AswSch].[ASWCatTipoSeguimientoAlertaMCSW]

END