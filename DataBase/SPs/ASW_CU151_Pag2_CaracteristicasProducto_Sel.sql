--USE [ASWH]
--GO
/****** Object:  StoredProcedure [AswSch].[ASW_CU151_Pag2_CaracteristicasProducto_Sel]    Script Date: 19/05/2023 10:44:47 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*==========================================
* CU: 151.2
* Objetivo: Devolver Caracteristicas del producto de la orden en progreso
* Autor: ngalaz
* Fecha: 2023-04-21
* EXEC: ASWSch.ASW_CU151_Pag2_CaracteristicasProducto_Sel 65,522803
* 18/05/2023 Se integra el producto por empaque obtenido de la vista [AswSch].[AswManCatEmpaqueAgrupadoVw]
*========================================== */
ALTER PROC [AswSch].[ASW_CU151_Pag2_CaracteristicasProducto_Sel]
	@PnClaUbicacion INT,
	@PnClaArticulo INT,
	@psErrorKey VARCHAR(15) OUT ,
	@psErrorMsg VARCHAR(500) OUT,
	@psIdioma   VARCHAR(20),
	@PnDebug INT = 0 
AS
BEGIN

	--Configuracion caracteristicas principales --Considerar idioma para los errores
	DECLARE @sCarPrincipales VARCHAR(100),
	        @sErrorKey_Success VARCHAR(10) = 'SUCCESS',
			@sErrorKey_IncorrectParams VARCHAR(50) = 'INCORRECT_PARAMETERS',
			@nProductoxEmpaque INT

	DECLARE @Caracteristicas TABLE(ClaArticulo INT, 
									ClaCaracteristica VARCHAR(255),
									NomCaracteristica VARCHAR(255), 
									NomCaracteristicaIngles VARCHAR(255),
									NomValorCaract VARCHAR(255),
									NomValorCaractIngles VARCHAR(255))
			
	SET @psErrorKey = @sErrorKey_Success


	INSERT INTO @Caracteristicas
		SELECT 
			ClaArticulo,
			CONVERT(VARCHAR,ClaCaracteristica),
			NomCaracteristica, 
			NomCaracteristicaIngles,
			NomValorCaract,
			NomValorCaractIngles
		FROM AswSch.AswCatArticuloCaracteristicasVw
		WHERE ClaArticulo = @PnClaArticulo
		AND ISNULL(BajaLogica,0) = 0

	SELECT @nProductoxEmpaque = Cantidad
	FROM [AswSch].[AswManCatEmpaqueAgrupadoVw]
	WHERE ClaArticulo = @PnClaArticulo and ClaUbicacion = @PnClaUbicacion

	
	INSERT INTO @Caracteristicas
	VALUES (@PnClaArticulo, '1-PP'
			,'Unidades por tarima' 
			,'Units per skid'
			,CONVERT(VARCHAR,@nProductoxEmpaque)
			,CONVERT(VARCHAR,@nProductoxEmpaque));

	SELECT @sCarPrincipales = CONCAT(SValor1,',',Svalor2)
	FROM ASWSch.ASWCfgConfiguracion
	WHERE ClaveConfiguracion = 'CAR_PRINCIPAL'

	IF(@pnClaUbicacion IS NULL OR @PnClaArticulo IS NULL)
	BEGIN
		
		SELECT   @psErrorMsg = Mensaje
				,@psErrorKey = ErrorKey
		FROM [AswSch].[AswCatMensajeError]
		WHERE ErrorKey = @sErrorKey_IncorrectParams
			AND Idioma = @psIdioma
		

		RETURN
	END

	IF @PnDebug = 1
	BEGIN
		SELECT 1 as Debug,
			@sCarPrincipales as sCarPrincipales
	END
	
	SELECT ClaArticulo,
		   NomCaracteristica,
		   NomCaracteristicaIngles,
		   NomValorCaract,
		   NomValorCaractIngles,
		   CASE WHEN SP.clave IS NOT NULL THEN 1 ELSE 0 END EsPrincipal
	FROM @Caracteristicas AC
	LEFT JOIN [AswSch].[ASWSplitKeyFn](@sCarPrincipales,',') SP
		ON AC.ClaCaracteristica = SP.Value
	WHERE AC.ClaArticulo = @PnClaArticulo
		AND SP.clave is not null
	


END

