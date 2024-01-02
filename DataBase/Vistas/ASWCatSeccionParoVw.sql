USE ASW
GO

CREATE VIEW [AswSch].[ASWCatSeccionParoVw]
AS ( 
	SELECT 
		 ClaUbicacion
		,ClaArea
		,ClaGpoParo
		,NomGpoParo
		,ClaTipoParo
		,NomTipoParo
		,ClaSeccionParoRel1 as ClaSeccionParo
		,ClaveSeccionParoRel1 as ClaveSeccionParo
		,NomSeccionParoRel1 as NomSeccionParo
	FROM [PAL_LNKSVR].[Operacion].[PalSch].[PalCatSeccionParoRel2Vw]
	WHERE ISNULL(BajaLogica,0) = 0
	
)
GO

