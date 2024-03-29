USE [ASW]
GO
/****** Object:  StoredProcedure [AswSch].[ASWPerfilCmb]    Script Date: 15/11/2022 04:26:09 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [AswSch].[ASWPerfilCmb]  
	@psValor	varchar(100),		-- Texto a Buscar  
	@pnTipo		int,				-- 1=Buscar por la ClaveXxxxx  
	@pnModoSel	int = 1,			-- 1=Retorno Clave - Descripcion   <>1  Descripcion  
	@pnBajasSn	int = 0,
	@pnwtk0		int = null  		   
AS    
BEGIN  
	
	IF(@psValor = '' OR @psValor is Null)  
	BEGIN
		SELECT IdUsuario as IdPerfil, 
		NombrePerfil As NomPerfil
		FROM AswSch.TiTraUsuarioVw
		WHERE PERFIL = 1
		AND IdUsuario between 3500000  AND 3500001
	END
	ELSE
	BEGIN
		IF ISNUMERIC(@psValor) = 1
		BEGIN
			SELECT IdUsuario as IdPerfil, 
			NombrePerfil As NomPerfil
			FROM AswSch.TiTraUsuarioVw
			WHERE PERFIL = 1
			AND IdUsuario between 3500000  AND 3500001
			AND IdUsuario = @psValor
		END
		ELSE
		BEGIN
			SELECT IdUsuario as IdPerfil, 
			NombrePerfil As NomPerfil
			FROM AswSch.TiTraUsuarioVw
			WHERE PERFIL = 1
			AND IdUsuario between 3500000  AND 3500001
			AND NombrePerfil like '%'+@psValor+'%'
		END
	END

END
