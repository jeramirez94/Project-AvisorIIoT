USE [ASW]
GO
/****** Object:  StoredProcedure [AswSch].[ASW_CU11_Pag1_Boton_cancelarBtn_Proc]    Script Date: 14/11/2022 11:48:10 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROC [AswSch].[ASW_CU11_Pag1_Boton_cancelarBtn_Proc]
	@PsNombrePcMod VARCHAR(64)
AS 
BEGIN

	 DELETE FROM [AswSch].[AswTempOperadores]
	 WHERE NombrePcMod = @PsNombrePcMod

END