USE [ASW]
GO
/****** Object:  StoredProcedure [AswSch].[ASW_CU1_Pag2_ImgUsuarios_Sel]    Script Date: 14/11/2022 10:44:41 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [AswSch].[ASW_CU1_Pag2_ImgUsuarios_Sel]
 @PnidUsuario INT
AS
BEGIN

SELECT imagen,idusuario from ASWSch.ASWCatImagenUsuario
WHERE idusuario = @PnidUsuario

END