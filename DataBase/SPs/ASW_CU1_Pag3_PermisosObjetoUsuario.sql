/*==========================================
* CU: 1.3
* Objetivo: Obtener los permisos de un perfil sobre un CU
* Autor: ngalaz
* Fecha: 2023-08-09
*/
USE ASW
GO 

 CREATE PROC [AswSch].[ASW_CU1_Pag3_PermisosObjetoUsuario]  
 @PnClaUbicacion INT,  
 @PnIdUsuario INT,  
 @PnCU INT,  
 @PnPag INT,  
 @psIdioma VARCHAR(20),
 @psErrorKey VARCHAR(50) OUT ,
 @psErrorMsg VARCHAR(500) OUT,
 @PnDebug INT = 0
AS  
BEGIN  
   

	 SET @psErrorKey = 'SUCCESS'
	 SET @psErrorMsg = ''

	 DECLARE @nIdObjeto INT  
	 ,@nidPerfilReferenciado INT  
	 ,@nSistema INT
	 ,@nPerfilInicio INT
	 ,@nPerfilFin INT


  
	 DECLARE @tmpPermisos table(  
		 IdUsuario INT,  
	  IdObjeto  INT,  
	  Acceso    INT,  
	  Guardar   INT,  
	  Imprimir  INT,  
	  Exportar  INT,  
	  Permiso5  INT,  
	  Permiso6  INT,  
	  Permiso7  INT,  
	  Permiso8  INT  
	 )  
  

	 SELECT @nSistema = Valor1 FROM AswSch.ASWCfgConfiguracion
	 where ClaveConfiguracion = 'SISTEMA'

	 SELECT @nPerfilInicio = Valor1
		   ,@nPerfilFin = Valor2
	 FROM AswSch.ASWCfgConfiguracion
	 where ClaveConfiguracion = 'PERFILES_SIS'

	 IF @pnClaUbicacion IS NULL OR @psIdioma IS NULL
	 OR @PnIdUsuario IS NULL OR @PnCU IS NULL OR @PnPag IS NULL
	 BEGIN
		SELECT @psErrorKey = ErrorKey
			  ,@psErrorMsg = Mensaje
		FROM [AswSch].[AswCatMensajeError]
		WHERE ErrorKey = 'INCORRECT_PARAMETERS'
			AND Idioma = COALESCE(@psIdioma, 'English')
		RETURN
	 END

	 SELECT @nidPerfilReferenciado = R.IdPerfilReferenciado  
	 FROM TiSeguridad.dbo.TiTraUsuario U  
	 JOIN TiSeguridad.dbo.TiTraReferencia R  
		ON U.IdUsuario = R.IdUsuario  
	 WHERE U.IdUsuario = @PnIdUsuario  
		AND R.ClaUbicacion = @PnClaUbicacion  
		AND R.IdPerfilReferenciado between @nPerfilInicio AND @nPerfilFin  
  
	 SELECT @nIdObjeto = IdObjeto   
	 FROM TiSeguridad.dbo.[TiTraObjeto]  
	 WHERE ClaSistema = @nSistema  
		AND   Nombre like CAST(@PnCU as varchar)+'.'+CAST(@PnPag as varchar)+'%'  
  
	 IF @PnDebug = 1  
	 BEGIN  
	  SELECT @nidPerfilReferenciado as nidPerfilReferenciado,@nIdObjeto as nIdObjeto  
  
	  SELECT 'Debug', *   
	  FROM TiSeguridad.dbo.TiTraUsuario U  
	  JOIN TiSeguridad.dbo.TiTraReferencia R  
		ON U.IdUsuario = R.IdUsuario  
	  WHERE U.IdUsuario = @PnIdUsuario  
		AND R.ClaUbicacion = @PnClaUbicacion  
		AND R.IdPerfilReferenciado between @nPerfilInicio AND @nPerfilFin  
  
	 END  
  
	 INSERT INTO @tmpPermisos (  
	   IdUsuario  
	  ,IdObjeto  
	  ,Acceso     
	  ,Guardar    
	  ,Imprimir   
	  ,Exportar   
	  ,Permiso5   
	  ,Permiso6   
	  ,Permiso7   
	  ,Permiso8   
	 )  
	 SELECT  IdUsuario  
		 ,IdObjeto  
		 ,Permiso1 as Acceso  
		 ,Permiso2 as Guardar  
		 ,Permiso3 as Imprimir  
		 ,Permiso4 as Exportar  
		 ,Permiso5  
		 ,Permiso6  
		 ,Permiso7  
		 ,Permiso8  
	 FROM TiSeguridad.dbo.TiTraPermiso  
	 WHERE  idObjeto = @nIdObjeto  
		AND  IdUsuario = @nidPerfilReferenciado  
  
	 IF NOT EXISTS (SELECT 1 FROM @tmpPermisos)  
	 BEGIN  
   
	  SELECT  @psErrorKey = ErrorKey
			 ,@psErrorMsg = Mensaje
	  FROM [AswSch].[AswCatMensajeError]
	  WHERE ErrorKey = 'UNCONF_PERMS'
		AND Idioma = COALESCE(@psIdioma, 'English')

	  RETURN  
	 END  
  
	 SELECT  Acceso     
		 ,Guardar    
		 ,Imprimir   
		 ,Exportar   
		 ,Permiso5   
		 ,Permiso6   
		 ,Permiso7   
		 ,Permiso8   
	 FROM @tmpPermisos  
  
   
  
END
GO

