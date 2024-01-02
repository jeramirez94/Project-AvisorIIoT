--USE [ASW]
--GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*==========================================
* CU: 202.4
* Objetivo: Obtener el EventoOrigen máximo en la bitacora  
* Autor: mrodriguezc
* Fecha: 2022-03-21
* EXEC: [AswSch].[ASW_CU202_Pag4_FolioProduccion_Sel]
*========================================== */
CREATE PROCEDURE [AswSch].[ASW_CU202_Pag4_FolioProduccion_Sel]
AS
BEGIN
	SET NOCOUNT ON
	
	SELECT MAX(EventoOrigen) AS EventoOrigen
	FROM AswSch.AswRecBitProduccion

END
GO
