USE ASW
GO

DROP PROC ASWSch.ASW_CU402_Pag1_Boton_ChkItemName_Proc
GO

CREATE PROC ASWSch.ASW_CU402_Pag1_Boton_ChkItemName_Proc
	@PnClaArticuloSubir INT
AS
BEGIN

	IF @PnClaArticuloSubir IS NULL
	SELECT TOP 1 TxtDescripcionSubir = ''

	DECLARE @tmpArticulo TABLE (ClaArticulo INT ,Descripcion VARCHAR(250))

	INSERT INTO @tmpArticulo
		EXEC [AswSch].[ASWArticuloCmb]  
			@psValor	= @PnClaArticuloSubir,
			@pnTipo		= 1,				
			@pnModoSel  = 0,			
			@pnBajasSn	 = 0 


	SELECT TOP 1 TxtDescripcionSubir = Descripcion FROM @tmpArticulo

END