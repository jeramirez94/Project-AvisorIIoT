USE ASW
GO

CREATE VIEW [AswSch].[ASWCatGpoParoVw]
  AS ( 
	  SELECT 
		 ClaUbicacion
		,ClaGpoParo
		,NomGpoParo
	  FROM [PAL_LNKSVR].[Operacion].[PalSch].[PalCatSeccionParoRel2Vw]
	  Where ISNULL(BajaLogica,0) = 0
	  group by ClaUbicacion,ClaGpoParo,NomGpoParo
  )
GO