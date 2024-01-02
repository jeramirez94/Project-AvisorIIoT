
/*
Servicio: PplSch.PPL_CU86_Pag1_Grid_GridCombinaciones_Srv
Server: Operofidb03
BD: Operación
sa - Sqlnet#1
Parámetros: @pnClaUbicacionPlanta, (no puede ser nulo)
        @pnClaAreaProduccion, (no puede ser nulo)
                        @pnClaPeriodo, (no puede ser nulo)
                       @pnClaGrupoMaquina, (puede ser nulo, depende del nivel de búsqueda)
       @pnClaArticulo, (puede ser nulo, depende del nivel de búsqueda)
       @pnNivel, (no puede ser nulo))

El nivel de búsqueda de datos es el siguiente:
Nivel 0: Búsqueda por área de producción (default)
Nivel 1: Búsqueda por grupo de máquina, depende del área producción
Nivel 2: Búsqueda por artículo, depende del área producción y grupo de maquina

*/

EXEC PplSch.PPL_CU86_Pag1_Grid_GridCombinaciones_Srv
	@pnClaUbicacionPlanta = 68
    ,@pnClaAreaProduccion = 153
    ,@pnClaPeriodo=202208
    ,@pnClaGrupoMaquina = 163
    ,@pnClaArticulo = 606539
    ,@pnNivel=2

SELECT * FROM PplSch.PPL_WORKORDERS_DET wo where ClaUbicacion=68 and ClaPeriodo=202208

PplSch.PPL_WORKORDERS_DET wo 
	left join PplSch.PplArtCatArticuloVw art ON wo.ClaveArticulo= art.ClaveArticulo
	inner join PplSch.PplRelMaquinaGrupo m ON wo.ClaUbicacion=m.ClaUbicacion and wo.ClaMaquina= m.ClaMaquina
	inner join PplSch.PPLCatGrupoMaquina g ON m.ClaUbicacion=g.ClaUbicacion and m.ClaGrupoMaquina=g.ClaGrupoMaquina
	WHERE art.BajaLogica=0 and m.BajaLogica=0
		and g.ClaUbicacion= 68 -- 3    
		and g.ClaAreaProduccion= @pnClaAreaProduccion --  1027  
		and wo.CLaPeriodo= @pnClaPeriodo
		and wo.BajaLogica= 0


 PplSch.PPL_WORKORDERS_DET wo  
	left join PplSch.PplArtCatArticuloVw art ON wo.ClaveArticulo= art.ClaveArticulo
	--inner join PplSch.PplRelMaquinaGrupo m ON wo.ClaMaquina= m.ClaMaquina
	inner join PplSch.PPLCatGrupoMaquina g ON wo.ClaUbicacion=g.ClaUbicacion and wo.ClaMaquina=g.NomGrupoMaquina
	WHERE art.BajaLogica=0 and g.BajaLogica=0 and wo.claubicacion=68
		and wo.CLaPeriodo= 202208
		and wo.BajaLogica= 0
