/* =============================================
* CU: 204 Paros
* Objetivo: Devolver catalogo de tipo de paro ASWCatTipoParoVw.
* Autor: JRUIZC
* Fecha: 2023-08-08
* EXEC [AswSch].[ASW_CU204_Pag5_ObtenerTipoParoJustificacion_Sel]  33,7,'English','',''
-- =============================================*/
USE ASW
GO

CREATE PROCEDURE [AswSch].[ASW_CU204_Pag5_ObtenerTipoParoJustificacion_Sel]
	@pnClaTipoParo INT,
	@pnClaGpoParo INT,
	@psIdioma VARCHAR(20),
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

   SELECT ClaArea,
		ClaGpoParo,
		NomGpoParo,
		ClaTipoParo,
		NomTipoParo,
		ClaSeccionParo,
		ClaveSeccionParo,
		NomSeccionParo
	FROM AswSch.AswCatSeccionParoVw WITH(NOLOCK)
	WHERE ClaTipoParo=@pnClaTipoParo
	AND ClaGpoParo=@pnClaGpoParo
	ORDER BY ClaTipoParo
	
END
GO

