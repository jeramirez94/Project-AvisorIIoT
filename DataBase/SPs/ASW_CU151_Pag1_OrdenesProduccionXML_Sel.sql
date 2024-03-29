USE [ASW]
GO
/****** Object:  StoredProcedure [AswSch].[ASW_CU151_Pag1_OrdenesProduccionXML_Sel]    Script Date: 14/11/2022 11:53:38 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROC [AswSch].[ASW_CU151_Pag1_OrdenesProduccionXML_Sel]
	@PnCelda INT,
	@PdFechaUltimaModTablet datetime
AS
BEGIN

declare @xml VARCHAR(MAX)
SET @xml = CAST ((SELECT 'ASWLite_TraOrdenProduccion' as nombretabla,
	   OP.ClaUbicacion,
       OP.IdPO,
	   OP.ClavePO,
       OP.IdCelda,
       OP.ClaArticulo,
       OP.ClaveArticulo,
       OP.ClaGpoCosteo,
       OP.ClaGrupoProceso,
       OP.Orden,
       OP.ClaUnidadProd,
       OP.UnidadesProgramadas,
       OP.UnidadesProducidas,
       OP.PaquetesPorUnidad,
       OP.PiezasPorUnidad,
       OP.UnidadesPorSkid,
       OP.Diametro,
       OP.DiametroMin,
       OP.DiametroMax,
       OP.Longitud,
       OP.LongitudMin,
       OP.LongitudMax,
       OP.Length,
       OP.Diameter,
       OP.Point,
       OP.Shank,
       OP.ClaEstatus,
       OP.NotasProduccion,
       OP.FechaCaptura,
       OP.FechaInicioReal,
       OP.FechaInicioAdm,
       OP.FechaFinReal,
       OP.FechaFinAdm,
       OP.BajaLogica,
       OP.FechaBajaLogica,
       OP.ClaUsuarioMod,
       OP.NombrePcMod,
       OP.FechaUltimaMod,
					(SELECT 'ASWLite_CatArticuloGeneral' as nombretabla,
						ART.ClaArticulo,
						ART.ClaveArticulo,
						ART.NomArticulo,
						ART.NomArticuloIngles,
						ART.EspesorAltura,
						ART.EspesorAlturaIngles,
						ART.Longitud,
						ART.LongitudIngles,
						ART.CajasSkid,
						ART.Peso,
						ART.BajaLogica,
						ART.FechaBajaLogica,
						ART.FechaUltimaMod, 
						(SELECT 'ASWLite_CatArticuloCaracteristicas' as nombretabla,
								FT.ClaArticulo,
							    FT.ClaPlantilla,
							    FT.NomPlantilla,
							    FT.NomPlantillaIngles,
							    FT.ClaCaracteristica,
							    FT.NomCaracteristica,
							    FT.NomCaracteristicaIngles,
							    FT.NomValorCaract,
							    FT.NomValorCaractIngles,
							    FT.BajaLogica,
							    FT.FechaBajaLogica,
							    FT.FechaUltimaMod
						 FROM [AswSch].[AswCatArticuloCaracteristicas] FT WHERE FT.ClaArticulo=ART.ClaArticulo  FOR XML RAW('AswCatArticuloCaracteristicas'),TYPE)
					FROM [AswSch].AswCatArticuloGeneral ART WHERE ART.ClaArticulo = OP.ClaArticulo  FOR XML RAW('AswCatArticuloGeneral'),TYPE),
				(SELECT 'ASWLite_CatArticuloComposicion' as nombretabla,
					AC.ClaArticulo,
					ArtComposicion1 AS ClaMateriaPrima,
					ClaveArtComposicion AS ClaveMateriaPrima,
					NomArtComposicion AS NomMateriaPrima,
					CantComposicion AS Cantidad,
					UnidadMedida AS Unidad,
					[AswSch].[ASWFormatNumber](CantComposicion,2,',t') +' '+ UnidadMedida AS CantidadUnidad,
					AC.BajaLogica,
					AC.FechaBajaLogica,
					AC.FechaUltimaMod
				FROM [AswSch].[AswCatArticuloComposicion] AC 
				WHERE AC.ClaArticulo = OP.ClaArticulo 
				FOR XML RAW('AswCatArticuloComposicion'),TYPE)
FROM [AswSch].[ASWTraOrdenProduccion] OP
WHERE OP.IdCelda = @PnCelda
AND (@PdFechaUltimaModTablet is null OR (OP.FechaUltimaMod > @PdFechaUltimaModTablet))
FOR XML  RAW('ASWTraOrdenProduccion'),ROOT('OrdenesProduccion')) as nvarchar(max))

SELECT @xml as xml

print LEN(@xml)

END

