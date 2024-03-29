USE [ASW]
GO
/****** Object:  StoredProcedure [AswSch].[ASW_CU4_Pag2_ConfiguracionTablet_Sel]    Script Date: 14/11/2022 11:16:41 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROC [AswSch].[ASW_CU4_Pag2_ConfiguracionTablet_Sel]
	@PsDirIp  VARCHAR(15)= null,
	@PsDirMac VARCHAR(18) = null
AS
BEGIN
	
	DECLARE @nClaUbicacionDefault INT

	SELECT @nClaUbicacionDefault = Valor1
	FROM AswSch.ASWCfgConfiguracion
	WHERE ClaConfiguracion = 1

	DECLARE @msgError VARCHAR(140);
	IF @PsDirIp IS NOT NULL
	BEGIN
		IF EXISTS (SELECT 1 FROM AswSch.aswCatTablets CT 
					JOIN AswSch.AswCatWorkCenterVw WC 
					ON CT.IdCelda = WC.IdWorkCenter 
					WHERE DireccionIp = @PsDirIp
						AND CT.BajaLogica = 0)
		BEGIN
			SELECT 'AswLite_CatTablets' as nombretabla,
				   @nClaUbicacionDefault AS ClaUbicacion,
				   IdTablet,
				   CT.IdCelda as IdCelda,
				   WC.ClaDepartamento,
				   WC.ClaArea,
				   0 AS ClaUsuarioMod,
				   WC.NomWorkCenter AS NombreTablet,
				   CT.DireccionIp AS DireccionIp,
				   CT.DireccionMac AS DireccionMac,
				   CT.Dispositivo,
				   'current' as FechaUltimaMod,
				   WC.NomWorkCenter AS NombrePcMod
			FROM AswSch.aswCatTablets CT
			JOIN AswSch.AswCatWorkCenterVw WC
			ON CT.IdCelda = WC.IdWorkCenter
			WHERE DireccionIp = @PsDirIp
		END
		ELSE 
		BEGIN
			SET @msgError = 'NO CONFIGURATION FOUND FOR THE IP '+ @PsDirIp
			GOTO ERROR
		END
		
	END
	ELSE
	BEGIN
		SET @msgError = 'IP NOT DEFINED, DEVICE MAY NOT BE CONFIGURED CORRECTLY' 
		GOTO ERROR
	END

	RETURN

	ERROR:
		SELECT @msgError AS Error
END
