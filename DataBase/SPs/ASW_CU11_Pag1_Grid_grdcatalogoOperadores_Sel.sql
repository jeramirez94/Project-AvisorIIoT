USE [ASW]
GO
/****** Object:  StoredProcedure [AswSch].[ASW_CU11_Pag1_Grid_grdcatalogoOperadores_Sel]    Script Date: 14/11/2022 12:27:11 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [AswSch].[ASW_CU11_Pag1_Grid_grdcatalogoOperadores_Sel]  
      @pnClaUbicacion INT = null,
	  @psNombreTxt VARCHAR(50),
	  @psApPaternoTxt VARCHAR(50),
	  @psApMaternoTxt VARCHAR(50),
	  @pncheckSupervisor INT,
	  @pncheckOperator INT,
	  @pnMostrarBajaLogica INT
AS
BEGIN  
    
	   SELECT
		  USR.IdUsuario 	as IdUsuario,
		  USR.LoginUserName  as LoginUserName,
		  USR.ClaUsuarioIns as ClaUsuarioIns,
		  USR.NombreUsuario	as  NombreUsuario,
		  USR.ApellidoPaterno	as ApPaterno,
		  USR.ApellidoMaterno as ApMaterno,
		  USR.FechaNacimiento as FechaNacimiento,
		  USR.Email as  Email,
		  USR.TelefonoCelular as TelefonoCelular,
		  usrPerf.NombrePerfil as NomPerfil,
		  Ref.IdPerfilReferenciado as ClaPerfil,
		  USR.FechaIns as  FechaIns,
		  USR.ApellidoMaterno as   Rfc,
		  USR.ClaUbicacionDefault,
		  0 AS Perfil,
		  USR.BajaLogica,
		  USR.FechaBajaLogica,
		  USR.ClaUsuarioIns 
        FROM AswSch.TiTraUsuarioCentralVw USR
		LEFT JOIN AswSch.TiTraReferenciaCentralVw ref
		ON Usr.idUsuario = ref.idUsuario
		JOIN AswSch.TiTraUsuarioCentralVw usrPerf
		ON ref.IdPerfilReferenciado = usrPerf.IdUsuario
		AND usrPerf.Perfil = 1 
		WHERE USR.claubicaciondefault = 68
		and USR.perfil = 0
		--and USR.bajalogica = 0
		--and Ref.Bajalogica = 0
		AND usrPerf.idUsuario between 3500000  AND 3500001
		AND (@psNombreTxt = '' OR USR.NombreUsuario like '%'+@psNombreTxt+'%')
		AND (@psApPaternoTxt  = '' OR USR.ApellidoPaterno like '%'+@psApPaternoTxt+'%')
		AND (@psApMaternoTxt = '' OR USR.ApellidoMaterno like '%'+@psApMaternoTxt+'%')
		AND ( (@pncheckSupervisor = 0 AND @pncheckSupervisor = 0) 
			  OR ( @pncheckSupervisor = 1 AND usrPerf.idUsuario = 3500001)
			  OR ( @pncheckOperator   = 1 AND usrPerf.idUsuario = 3500000) 
			)
		AND ((@pnMostrarBajaLogica = 0 AND USR.BajaLogica = 0) OR @pnMostrarBajaLogica = 1 )
	  --  AND (( @pnMostrarBajaLogica = 1 AND ISNULL(usrPerf.BajaLogica,0) = 1 ) )
	    
	
END  



