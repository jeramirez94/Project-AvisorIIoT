USE [ASW]
GO
/****** Object:  StoredProcedure [AswSch].[ASW_CU101_Pag2_CatArticuloGeneral_Sel]    Script Date: 02/02/2023 04:50:12 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROC [AswSch].[ASW_CU101_Pag2_CatArticuloGeneral_Sel]
@PsIdCelda VARCHAR(30) 
AS
BEGIN
IF @PsIdCelda IS NOT NULL 
	SELECT 
	  'ASWLite_CatArticuloGeneral' as nombretabla,
	  keys = 'ClaArticulo',
	  fuc = 'FechaUltimaMod',
	  CG.ClaArticulo
      ,CG.ClaveArticulo
      ,CG.NomArticulo
      ,CG.NomArticuloIngles
      ,CG.EspesorAltura
      ,CG.EspesorAlturaIngles
      ,CG.CajasSkid
      ,CG.Peso
      ,CG.BajaLogica
      ,convert(varchar,CG.FechaBajaLogica,121) as FechaBajaLogica
      ,convert(varchar, GETDATE(),121) as FechaUltimaMod
  FROM [AswSch].[AswCatArticuloGeneralVw] CG
  INNER JOIN [AswSch].[AswCatCapacidadMaquinaVw] CM
  ON CG.ClaArticulo = CM.ClaArticulo
  WHERE CM.ClaMaquina = @PsIdCelda
  AND CM.BajaLogica = 0


END
