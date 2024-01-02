/*==========================================
* CU: 11.2
* Objetivo: Asociar automaticamente a los operadores de pal houston al perfil de operadores de ASW 
* Autor: mrodriguezc
* Fecha: 2022-06-09
* EXEC: [AswSch].[ASW_CU11_Pag2_AsociarOperadores_Proc] 65, 1
*========================================== */
CREATE PROCEDURE [AswSch].[ASW_CU11_Pag2_AsociarOperadores_Proc]
	@pnClaUbicacion INT
	,@pnDebug INT = 0
AS
BEGIN
	/*
	SELECT * FROM [APH_LNKSVR].Operacion.[APHSch].[AphCatTrabajadorVw]
	SELECT * FROM [PAL_LNKSVR].TiCatalogo.dbo.NomCatTrabajadorVw 
	*/
	--tomo la informacion de APH porque en PAL no encontre la informacion para relacionar a los operadores-usuarios
	SELECT distinct aph.ClaUbicacion 
		,u.IdUsuario
		--, u.ClaEmpleado, aph.Nombre, aph.ApellidoPaterno, nom.ClaNomina, nom.NombreTrabajador, nom.ApellidoPaterno 
		--,*
	INTO #OperadorAph
	--SELECT * 
	FROM APH_LNKSVR.Operacion.[APHSch].[AphCatTrabajadorVw]    aph
	JOIN  [PAL_LNKSVR].TiCatalogo.dbo.NomCatTrabajadorVw nom
	 ON aph.ClaTrabajadorExterno = nom.ClaTrabajador
		AND nom.ClaUbicacion in (65,220)
		AND nom.ClaNomina = 1
	JOIN TiSeguridad.dbo.TiTraUsuario U
		ON U.ClaUbicacionDefault in (65,220)
		AND nom.ClaTrabajadorEUN = U.ClaEmpleado
	WHERE aph.ClaUbicacion = 65 
		AND aph.EsStaff = 0  
		AND aph.BajaLogica = 0
	--ORDER BY aph.ClaTrabajador

	IF (@pnDebug = 1)
	BEGIN
		SELECT * 
		FROM #OperadorAph O
		LEFT JOIN TICENTRAL.Tiseguridad.dbo.TitraReferencia U
		ON O.claUbicacion = U.ClaUbicacion
		AND O.IdUsuario = U.IdUsuario
		AND IdPerfilReferenciado BETWEEN 3500000 AND 3509999
	END

	INSERT INTO TICENTRAL.Tiseguridad.dbo.TitraReferencia(
		IdUsuario
		,IdPerfilReferenciado
		,ClaUbicacion
		,Orden
		,FechaUltimaMod
		,NombrePcMod
		)
	SELECT O.IdUsuario
		,3500000 --PerfilOperador
		,O.ClaUbicacion
		,1
		,GETDATE()
		,'JobOperador'
		--,0
	FROM #OperadorAph O
	LEFT JOIN TICENTRAL.Tiseguridad.dbo.TitraReferencia U
		ON O.claUbicacion = U.ClaUbicacion
		AND O.IdUsuario = U.IdUsuario
		AND IdPerfilReferenciado BETWEEN 3500000 AND 3509999
	WHERE U.idUsuario IS NULL -- que no tenga ningun perfil

END