--USE [ASW]
--GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*==========================================
* CU: 205.4
* Objetivo: Obtener el EventoOrigen máximo en la bitacora  
* Autor: mrodriguezc
* Fecha: 2022-03-21
* EXEC: [AswSch].[ASW_CU205_Pag4_FolioVariable_Sel]
*========================================== */
CREATE PROCEDURE [AswSch].[ASW_CU205_Pag4_FolioVariable_Sel]
AS
BEGIN
	SET NOCOUNT ON
	
	SELECT MAX(EventoOrigen) AS EventoOrigen
	FROM AswSch.AswRecBitVariable 

END
GO
