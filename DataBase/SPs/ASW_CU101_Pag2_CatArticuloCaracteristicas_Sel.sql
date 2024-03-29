USE [ASW]
GO
/****** Object:  StoredProcedure [AswSch].[ASW_CU101_Pag2_CatArticuloCaracteristicas_Sel]    Script Date: 02/02/2023 04:48:31 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROC [AswSch].[ASW_CU101_Pag2_CatArticuloCaracteristicas_Sel]
@PsIdCelda VARCHAR(30) 
AS
BEGIN
IF @PsIdCelda IS NOT NULL 
	SELECT 
	  'ASWLite_CatArticuloCaracteristicas' as nombretabla,
	  keys = 'ClaArticulo,ClaCaracteristica',
	  fuc = 'FechaUltimaMod',
	  AC.ClaArticulo,
      AC.ClaPlantilla,
      AC.NomPlantilla,
      AC.NomPlantillaIngles,
      AC.ClaCaracteristica,
      AC.NomCaracteristica,
      AC.NomCaracteristicaIngles,
      AC.NomValorCaract,
      AC.NomValorCaractIngles,
      AC.BajaLogica,
      convert(varchar,AC.FechaBajaLogica,121) as FechaBajaLogica,
      convert(varchar, GETDATE(),121) as FechaUltimaMod 
  FROM [AswSch].[AswCatArticuloCaracteristicasVw] AC
  INNER JOIN [AswSch].[AswCatCapacidadMaquinaVw] CM
  ON AC.ClaArticulo = CM.ClaArticulo
  WHERE CM.ClaMaquina = @PsIdCelda
  AND CM.BajaLogica = 0


END
