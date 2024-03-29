USE [ASW]
GO
/****** Object:  StoredProcedure [AswSch].[Asw_CU151_Pag1_MicroProgramaSel]    Script Date: 23/05/2023 09:23:16 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


ALTER  proc [AswSch].[Asw_CU151_Pag1_MicroProgramaSel] -- 'FF-02'
@pnClaUbicacion int,
@psIdWorkCenter varchar(100) = '-1',
@pnIdMicroProg bigint = -1,
@pnClaPeriodo int = -1,
@pnIncluirTodo int = -1
as


/*==========================================
* CU: 151.1
* Objetivo: DEvolver OPM's disponibles en el periodo por maquina, en ejecucion (2), programadas (1) y pausadas (5),
  o todo el plan de produccion disponible
  @psIdWorker, clave de la estacion de trabajo (clamaquina, celda), con un -1 devuelve todo el plan de produccion
* Autor: cponce
* Fecha: 2023-03-27
* EXEC: AswSch.Asw_CU151_Pag1_MicroProgramaSel 65,'FF-02'
 AswSch.Asw_CU151_Pag1_MicroProgramaSel 65,@pnIncluirCancelado = 1

 AswSch.Asw_CU151_Pag1_MicroProgramaSel 65,@pnIdMicroProg = 13


update [AswSch].[AswTraMicroPrograma] set claestatus = 4 where idmicroprog = 13
*========================================== */

select	mp.IdMicroProg,
		mp.ClaArea,
		mp.ClaveArea,
		mp.NomArea,
		mp.ClaDepartamento,
		mp.ClaveDepartamento,
		mp.NomDepartamento,
		mp.ClaGrupoMaquina,
		mp.ClaveGrupoMaquina,
		mp.NomGrupoMaquina,
		mp.IdWorkCenter,
		mp.ClaPeriodo,
		mp.Version,
		mp.ClaArticulo,
		mp.ClaveArticulo,
		mp.NomArticulo,
		mp.ClaUnidad,
		mp.NomUnidad,
		mp.IdOpm,
		mp.Nomopm,
		mp.CantidadProgramadaKgs,
		mp.CantidadProgramadaUds,
		mp.FechaInicioPlan,
		mp.FechaPromesaOPM,
		mp.ClaEstatus,
		Es.NomEstatus,
		mp.Comentarios,
		mp.ComentariosProduccion,
		mp.UnidadesPorPaquete,
		mp.FechaInicioReal,
		mp.FechaFinReal,
		isnull(mp.CantidadProducida,0) as CantidadProducida,
		isnull(mp.CantidadPNC,0) as CantidadPNC,
		mp.Ege,
		mp.CapacidadKgs,
		mp.CapacidadUds,
		mp.DuracionEge,
		Case when mp.CantidadProgramadaUds + isnull(mp.CantidadPNC,0) - isnull(mp.CantidadProducida,0) > 0 then mp.CantidadProgramadaUds + isnull(mp.CantidadPNC,0)  - isnull(mp.CantidadProducida,0) else 0 end as CantidadPendiente

from [AswSch].[AswTraMicroPrograma] MP with (noLock)
inner join [Aswsch].[AswCatEstatus] Es with (nolock)  on 
	mp.ClaEstatus = Es.ClaEstatus 
where ClaUbicacion = @pnClaUbicacion
and @psIdWorkCenter in ('-1', mp.IdWorkCenter)
and	@pnIdMicroProg in (-1, mp.idMicroProg)
and @pnClaPeriodo in (-1, mp.ClaPeriodo) 
and ( mp.ClaEstatus in ( 1,2,5) 
		or  (idMicroProg = @pnIdMicroProg 
				or @pnIncluirtodo = 1) )
order by IdWorkCenter,FechaInicioPlan 

