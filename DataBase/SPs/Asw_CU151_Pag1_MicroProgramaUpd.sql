

CREATE proc  [AswSch].[Asw_CU151_Pag1_MicroProgramaUpd] -- 'FF-02'
@pnClaubicacion int,
@psIdMicroProg bigint,

@pnClaDepartamento  int = null,
@pnClaveDepartamento int = null,
@psNomDepartamento varchar(250) = null,
@psNomOpm varchar(250) = null,
@pnClaEstatus int = null,
@psComentarios varchar (8000) = null,
@psComentariosProduccion varchar(8000) = null,
@pnUnidadesPorPaquete float = null,
@pdFechaInicioReal datetime = null,
@pdFechaFinReal datetime = null,
@pnCantidadProducida float = null,
@pnCantidadPNC float = null, 

@pnClaUsuarioMod int,
@psNombrePcMod varchar(250)

as


/*==========================================
* CU: 151.1
* Objetivo: Modificar un registro del plan de produccion, solamente los campos que se actualizaran via la aplicacion de piso.
* Autor: cponce
* Fecha: 2023-03-27
* EXEC: AswSch.Asw_CU151_Pag1_MicroProgramaUpd 
*========================================== */
 
update  mp set
			mp.claDepartamento = isnull(@pnClaDepartamento, mp.claDepartamento),
			mp.claveDepartamento = isnull(@pnClaveDepartamento , mp.ClaveDepartamento),
			mp.NomDepartamento  = isnull(@psNomDepartamento,mp.NomDepartamento),
			mp.nomopm = isnull(@psNomOpm,mp.nomopm),
			mp.ClaEstatus = isnull(@pnClaEstatus, mp.claEstatus),
			mp.comentarios = isnull(@psComentarios, mp.comentarios),
			mp.ComentariosProduccion = isnull(@psComentariosProduccion, mp.comentariosProduccion),
			mp.UnidadesPorPaquete = isnull(@pnUnidadesPorPaquete, mp.UnidadesPorPaquete),
			mp.FechaInicioReal = isnull(@pdFechaInicioReal, mp.FechaInicioReal),
			mp.FechaFinReal = isnull(@pdFechaFinReal, mp.FechaFinReal),
			mp.CantidadProducida = isnull(@pnCantidadProducida,mp.CantidadProducida),
			mp.CantidadPNC = isnull(@pnCantidadPNC,mp.CantidadPNC),
			mp.FechaUltimaMod = getdate(),
			mp.ClaUsuarioMod = isnull(@pnClaUsuarioMod, mp.ClaUsuarioMod),
			mp.NombrePcMod = isnull(@psNombrePcMod, mp.NombrePcMod)
from [AswSch].[AswTraMicroPrograma] MP
where	mp.ClaUbicacion = @pnClaubicacion 
and		mp.idMicroProg = @psIdMicroProg
GO


