USE [ASWH]
GO
/****** Object:  StoredProcedure [AswSch].[ASW_CU170_Pag1_ObtenerDestinatarios]    Script Date: 10/03/2023 03:17:35 p. m. ******/

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*==========================================
* CU: 170.1
* Objetivo: Obtener destinatarios para recepción de alertas
* Autor: José Carlos Arias Rodríguez
* Fecha: 2022-03-10
* EXEC: [AswSch].[ASW_CU170_Pag1_ObtenerDestinatarios]
*========================================== */
ALTER PROC [AswSch].[ASW_CU170_Pag1_ObtenerDestinatarios]
 @PnClaUbicacion INT
,@PnClaDepartamento INT
,@PsArrayChatIDs VARCHAR(300)
AS

BEGIN
  SELECT Svalor1 AS NumerosTelefonicos, Svalor2 AS Usuarios
  FROM [AswSch].[ASWCfgConfiguracion]
  WHERE ClaConfiguracion = 19 AND ClaUbicacion = @PnClaUbicacion
END
