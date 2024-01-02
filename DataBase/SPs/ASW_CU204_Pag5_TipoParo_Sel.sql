/* =============================================
* CU: 204 Paros
* Objetivo: Devolver catalogo de tipo de paro ASWCatTipoParoVw.
* Autor: JRUIZC
* Fecha: 2023-08-08
* EXEC [AswSch].[ASW_CU204_Pag5_TipoParo_Sel]  65,'English','',''
-- =============================================*/
USE ASW
GO

CREATE PROCEDURE [AswSch].[ASW_CU204_Pag5_TipoParo_Sel]
	@pnClaUbicacion INT,
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

   SELECT ClaGpoParo,
		  ClaTipoParo,
		  NomTipoParo
	FROM  AswSch.ASWCatTipoParoVw WITH(NOLOCK)
	WHERE ClaUbicacion = @pnClaUbicacion 
	ORDER BY ClaTipoParo
	
END
GO

