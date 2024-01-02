--USE [ASW]
--GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*==========================================
* CU: 204.4
* Objetivo: Obtener el EventoOrigen máximo en la bitacora  
* Autor: mrodriguezc
* Fecha: 2022-03-21
* EXEC: [AswSch].[ASW_CU204_Pag4_FolioParos_Sel]
*========================================== */
CREATE PROCEDURE [AswSch].[ASW_CU204_Pag4_FolioParos_Sel]
AS
BEGIN
	SET NOCOUNT ON
	
	SELECT MAX(EventoOrigen) AS EventoOrigen
	FROM AswSch.AswRecBitParos

END
GO
