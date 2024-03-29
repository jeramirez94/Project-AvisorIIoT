--USE [ASW]
--GO
/****** Object:  StoredProcedure [AswSch].[ASW_CU1_Pag6_Deployments_Sel]    Script Date: 14/11/2022 11:13:12 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROC [AswSch].[ASW_CU1_Pag6_Deployments_Sel]
	@PsIdCelda VARCHAR(30)
AS
BEGIN

	SELECT  
	'AswLite_TraDeployment' as nombretabla
	,RA.IdRecurso as Id
	,Origen 
	,Destino 
	,TipoRecurso
	,DRC.ClaEstatus as estatus
	FROM AswSch.AswCatRecursoAvisor RA
	JOIN AswSch.AswRelDeployRecursoCelda DRC
		ON RA.IdRecurso = DRC.IdRecurso
	WHERE DRC.IdCelda = @PsIdCelda
	AND DRC.ClaEstatus = 1

END



