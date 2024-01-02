USE [ASW]
GO
/****** Object:  StoredProcedure [AswSch].[ASW_CU11_Pag1_Grid_grdCargaCatalogoOperadores_Sel]    Script Date: 14/11/2022 11:54:00 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROC [AswSch].[ASW_CU11_Pag1_Grid_grdCargaCatalogoOperadores_Sel]
 @PnClaUbicacion INT,
 @PnNombrePcMod VARCHAR(64)

AS
BEGIN

	SELECT TMP.[IdUsuario] AS IdUsuarioCarga
		  ,TMP.[NombreUsuario] AS NombreUsuarioCarga
		  ,TMP.[ApellidoPaterno] AS ApPaternoCarga
		  ,TMP.[FechaNacimiento] AS FechaNacimientoCarga
		  ,TMP.[Email]	AS EmailCarga
		  ,TMP.[LoginUserName] AS LoginUserNameCarga
		  ,TMP.[TelefonoCelular] AS TelefonoCelularCarga
		  ,TMP.[ClaUbicacionDefault] AS ClaUbicacionDefaultCarga
		  ,TMP.[Perfil] AS PerfilCarga
		  ,TMP.[FechaIns] AS FechaInsCarga
		  ,TMP.[ClaUsuarioIns] AS ClaUsuarioInsCarga
		  ,TMP.[FechaUltimaMod] AS FechaUltimaModCarga
		  ,TMP.[ClaUsuarioMod] AS ClaUsuarioModCarga
		  ,TMP.[NombrePcMod] AS NombrePcModCarga
		  ,TMP.[Rfc] AS RfcCarga
		  ,TMP.[IdPerfilReferenciado] AS ClaPerfilCarga
		  ,USR.NombrePerfil AS NomPerfil 
		  ,0 AS ConfirmarChk
	  FROM [AswSch].[AswTempOperadores] TMP
	  JOIN AswSch.TiTraUsuarioCentralVw USR
	  ON USR.IdUsuario = TMP.IdPerfilReferenciado
	  WHERE TMP.NombrePcMod = @PnNombrePcMod


END


