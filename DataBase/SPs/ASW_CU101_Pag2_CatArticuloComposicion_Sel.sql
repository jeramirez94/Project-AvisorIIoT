USE [ASW]
GO
/****** Object:  StoredProcedure [AswSch].[ASW_CU101_Pag2_CatArticuloComposicion_Sel]    Script Date: 02/02/2023 04:49:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROC [AswSch].[ASW_CU101_Pag2_CatArticuloComposicion_Sel]
@PsIdCelda VARCHAR(30) 
AS
BEGIN
IF @PsIdCelda IS NOT NULL 
	SELECT 
	  'ASWLite_CatArticuloComposicion' as nombretabla,
	  keys = 'ClaArticulo,ClaMateriaPrima',
	  fuc = 'FechaUltimaMod',
	  COM.ClaArticulo AS ClaArticulo,
      COM.ArtComposicion1 AS ClaMateriaPrima,
      COM.ClaveArtComposicion AS ClaveMateriaPrima,
      COM.NomArtComposicion AS NomMateriaPrima,
      COM.CantComposicion AS Cantidad,
      COM.UnidadMedida AS Unidad,
      COM.UnidadMedidaIngles AS CantidadUnidad,
      COM.EsAlambre AS EsAlambre,
      COM.BajaLogica AS BajaLogica,
      convert(varchar,COM.FechaBajaLogica,121) AS FechaBajaLogica,
      convert(varchar, GETDATE(),121) AS FechaUltimaMod 
  FROM [AswSch].[AswCatArticuloComposicionVw] COM
  INNER JOIN [AswSch].[AswCatCapacidadMaquinaVw] CM 
  ON COM.ClaArticulo = CM.ClaArticulo
  WHERE CM.ClaMaquina = @PsIdCelda
  AND CM.BajaLogica = 0


END
