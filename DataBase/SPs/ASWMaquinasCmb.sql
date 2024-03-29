USE [ASWH]
GO
/****** Object:  StoredProcedure [AswSch].[ASWMaquinasCmb]    Script Date: 16/06/2023 09:19:57 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- CU: 162.1
-- Objetivo: Obtener todas las maquinas y las maquinas preferidas
-- Autor: aorangel
-- Fecha: 2023-04-19
-- EXEC [AswSch].[ASWMaquinasCmb] 'FF-02,FF-03,FF-04',0,0,0,65,'English', '', ''
-- =============================================
ALTER PROCEDURE [AswSch].[ASWMaquinasCmb]
	@psValor	VARCHAR(100) = '',
	@psMaquinasPreferidas VARCHAR(100) = '',
	@pnTipo		INT = 1,
	@pnModoSel	INT = 0,  
	@pnBajasSn	INT = 0,
	@pnClaUbicacion INT,
	@psIdioma VARCHAR(20) = 'English',
	@psIdWorkCenterActual VARCHAR(50),
	@psErrorKey VARCHAR(15) OUT,
	@psErrorMsg VARCHAR(500) OUT

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	SET LANGUAGE @psIdioma;  

	SET @psErrorKey = 'SUCCESS'
	SET @psErrorMsg = NULL

	IF(@pnClaUbicacion IS NULL)
	BEGIN
		SET @psErrorKey = 'INCORRECT_PARAMETERS'
		SELECT @psErrorMsg = Mensaje
		FROM [AswSch].[AswCatMensajeError]
		WHERE ErrorKey = 'INCORRECT_PARAMETERS'
			AND Idioma = @psIdioma

		RETURN
	END

	DECLARE @Maquinas TABLE(Maquina VARCHAR(30), EsPreferida INT)

	--Se inserta en la primera posición del arreglo la maquina configurada previamente.
	IF @psIdWorkCenterActual != '' AND @psMaquinasPreferidas NOT LIKE CONCAT('%',@psIdWorkCenterActual,'%')
		BEGIN
			INSERT INTO @Maquinas VALUES (@psIdWorkCenterActual, 2);
		END
	--se declara variable de tabla para almacenar las maquinas con formato modificado
	INSERT INTO @Maquinas 
	SELECT Value, 
		CASE Value WHEN @psIdWorkCenterActual THEN 2 ELSE 1 END 
	FROM [ASWSch].[ASWSplitKeyFn](@psMaquinasPreferidas,',')
   

	 -- Obtener maquinas y maquinas preferidas.
	IF @pnTipo = 0 AND @pnModoSel = 0
	BEGIN
		;WITH CteCatMaquina AS (
			SELECT
			   M.DisplayName as NomWorkCenter
			   ,M.IdWorkCenter
			   ,ISNULL(S.EsPreferida,0) AS EsPreferida
			FROM AswSch.AswCatWorkCenterVw M
			/*LEFT*/ JOIN @Maquinas S on M.IdWorkCenter = S.Maquina
			WHERE M.BajaLogica <= @pnBajasSn
			
			
		)
		--Devolver resultado
		SELECT
			 M.IdWorkCenter
			,M.NomWorkCenter
			,M.EsPreferida
		FROM CteCatMaquina M
		ORDER BY M.EsPreferida DESC, M.IdWorkCenter ASC
		
		
	END

	IF @pnTipo = 0 AND @pnModoSel = 1
	BEGIN
		;WITH CteCatMaquina AS (
			SELECT
			    M.DisplayName as NomWorkCenter
			   ,M.IdWorkCenter
			   ,ISNULL(S.EsPreferida,0) AS EsPreferida
			FROM AswSch.AswCatWorkCenterVw M
			/*LEFT*/ JOIN @Maquinas S on M.IdWorkCenter = S.Maquina
			WHERE M.BajaLogica <= @pnBajasSn
		)
		--Devolver resultado
		SELECT
			 CONCAT (M.IdWorkCenter,' - ',M.NomWorkCenter) as NomMaquina
			,M.EsPreferida
		FROM CteCatMaquina M
		ORDER BY M.EsPreferida DESC, M.IdWorkCenter ASC
		
	END

END
