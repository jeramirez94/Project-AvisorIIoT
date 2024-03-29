/****** Object:  StoredProcedure [AswSch].[ASW_CU151_Pag1_ActualizaProduccion_Proc]    Script Date: 23/05/2023 04:02:42 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*==========================================
* CU: 151.1
* Objetivo: Actualiza la produccion de un registro del programa en base a la bitacora de produccion. 
			Debe ser llamado despues de cada afectacion a la bitacora (relacionada a produccion o PNC) 
* Autor: MRODRIGUEZC
* Fecha: 2023-05-02
* EXEC: AswSch.Asw_CU151_Pag1_ActualizaProduccion_Proc 
*========================================== */
ALTER PROCEDURE  [AswSch].[ASW_CU151_Pag1_ActualizaProduccion_Proc] 
	@pnClaubicacion INT,
	@psIdMicroProg BIGINT,
	@pnClaUsuarioMod INT,
	@psNombrePcMod VARCHAR(250)
AS
BEGIN 
	DECLARE 
		@nCantidadProducida INT = 0
		,@nCantidadPNC INT = 0
		,@nIdOpm INT 

	--Obtengo el idOPM para versiones anteriores del programa 
	SELECT @nIdOpm=IdOpm
	FROM AswSch.AswTraMicroPrograma MP
	WHERE idMicroProg = @psIdMicroProg

	--Obetengo los totales de la bitacora
	SELECT @nCantidadProducida = COUNT(IdBitProduccion) --toda la produccion
		,@nCantidadPNC = COUNT(CASE EsPNC WHEN 1 THEN IdBitProduccion END)
	FROM [AswSch].[AswBitBitacoraProduccion]
	WHERE ClaUbicacion = @pnClaubicacion
		AND (IdPO = @psIdMicroProg
			OR IdPO IN (SELECT idMicroProg FROM AswSch.AswTraMicroPrograma WHERE IdOpm=@nIdOpm))
		AND ISNULL(BajaLogica,0) = 0


	--Actualizo el programa
	EXEC [AswSch].[Asw_CU151_Pag1_MicroProgramaUpd] 
		@pnClaubicacion = @pnClaubicacion,
		@psIdMicroProg = @psIdMicroProg,

		@pnCantidadProducida = @nCantidadProducida,
		@pnCantidadPNC = @nCantidadPNC, 

		@pnClaUsuarioMod = @pnClaUsuarioMod,
		@psNombrePcMod = @psNombrePcMod

END