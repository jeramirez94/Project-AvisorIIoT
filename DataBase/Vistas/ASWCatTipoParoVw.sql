USE ASW 
GO

CREATE VIEW [AswSch].[ASWCatTipoParoVw]
  AS ( 
	  SELECT 
		 ClaUbicacion
		,ClaGpoParo
		,ClaTipoParo
		,NomTipoPAro
	  FROM [PAL_LNKSVR].[Operacion].[PalSch].[PalCatSeccionParoRel2Vw]
	  Where ISNULL(BajaLogica,0) = 0
	  group by  ClaUbicacion ,ClaGpoParo ,ClaTipoParo,NomTipoPAro
  )
GO















