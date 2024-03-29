/*==========================================       
* HU: HOU - H5 - Obtener el plan de produccion detallado desde PPL - CU101.1       
* Objetivo: Obtener el microprograma directamente de PPL, para la gestión de la produccion a nivel Máquina       
* Autor:cponce       
* Fecha: 2023-02-20       
* EXEC: aswsch.AswPPLSrvSecuenciaMicroprogramaSemanalCargaProc   65      
* Configuracion: 18 de [AswSch].[ASWCfgConfiguracion] se tiene la cadena de conexion via Linked Server      
*========================================== */       
alter proc [AswSch].[Asw_CU101_Pag1_PPLSrvSecuenciaMicroprogramaSemanalCargaProc]   --65  
@pnClaUbicacion int      
as   
      
DEclare       
	@sCadenaSrv varchar(250),
	@nClaPeriodo int,
	@nIdFolioCarga int,
	@nVersion int,
	@nNvaVersion int
	
declare @tblPeriodos	table   
		(	
			claPeriodo int)
      
      
select @sCadenaSrv = sValor1 +  ' ' + (select ltrim(rtrim(convert(varchar(10),valor1))) from [AswSch].[ASWCfgConfiguracion] where ClaConfiguracion = 1)      
      
from [AswSch].[ASWCfgConfiguracion] where ClaConfiguracion = 18      
      
    
create table #MircroProgramaSemanal    
(    
 [ClaUbicacion] [int] NULL,  
 [ClaAreaProduccion] [int] null,  
 [ClaveAreaProduccion] [int] null,  
 [NomAreaProduccion] [Varchar] (250) null,  
 [ClaGrupoMaquina] [int] null,  
 [ClaveGrupoMaquina] [int] null,  
 [NomGrupoMaquina] [varchar] (250) null,  
 [ClaMaquina] [varchar](100) NULL,  
 [ClaPeriodo] [int] NULL,  
 [ClaArticulo] [int] NULL,  
 [ClaveArticulo] [varchar](150) null,  
 [NomArticulo] [varchar] (1000) null,  
 [ClaUnidad] [int] null,  
 [NomUnidad] [varchar] (250) null,  
 [IdOPM] [int] NULL,  
 [CantidadOPMkgs] [float] NULL,  
 [CantidadOPMUds] [float] NULL,  

 [PlannedStartTime] [datetime] NULL,  
 [FEchaPromesaOpm] [datetime] NULL,  
 [CapacidadKgs] [float] null,  
 [CapacidadUds] [float] null,  
 [EgeColaborado] [float] null,
 [Ege] [float] null,

 [DuracionEgeColaborado] [float] null,  
 [DuracionEge] [float] null,	
 --[BajaLogica] [int] NULL,  
-- [FechaBajaLogica] [datetime] NULL,  
 [FechaIns] [datetime] NULL,  
 [FechaUltimaMod] [datetime] NULL,  
 [ClaUsuarioMod] [int] NULL,  
 [NombrePcMod] [varchar](250) NULL,
 [ClaEstatus] [int] NULL
)     
    
    
insert  into #MircroProgramaSemanal    
 ( [ClaUbicacion] ,  
 [ClaAreaProduccion] ,  
 [ClaveAreaProduccion] ,  
 [NomAreaProduccion] ,  
 [ClaGrupoMaquina] ,  
 [ClaveGrupoMaquina] ,  
 [NomGrupoMaquina] ,  
 [ClaMaquina],  
 [ClaPeriodo],  
 [ClaArticulo] ,  
 [ClaveArticulo] ,  
 [NomArticulo] ,  
 [ClaUnidad] ,  
 [NomUnidad] ,  
 [IdOPM] ,  
 [CantidadOPMkgs] ,  
 [CantidadOPMUds] ,  

 [PlannedStartTime] ,  
 [FEchaPromesaOpm] ,  
 [CapacidadKgs],  
 [CapacidadUds] ,  
 [EgeColaborado] ,
 [Ege],

 [DuracionEgeColaborado] ,  
 [DuracionEge] ,	
  
 [FechaIns],  
 [FechaUltimaMod] ,  
 [ClaUsuarioMod] ,  
 [NombrePcMod] ,
 [ClaEstatus])      
exec (@sCadenaSrv )    

insert into @tblPeriodos
select distinct  claperiodo
from  #MircroProgramaSemanal
  
select @nClaPeriodo =  min(ClaPeriodo)
from @tblPeriodos
    
--update CMPS set 
--				cmps.cantOPMKgs = mps.CantidadOPMkgs, 
--				cmps.cantOpmUds = mps.CantidadOpmUds,
--				cmps.PlannedStartTime = mps.PlannedStartTime,    
--				cmps.FechaPromesaOpm= mps.FEchaPromesaOpm,  
--				cmps.capacidadkgs = mps.capacidadkgs,  
--				cmps.capacidaduds = mps.capacidaduds,  
--				cmps.egecolaborado = mps.egecolaborado,
--				cmps.ege = mps.ege,
--				cmps.duracionEgeColaborado = mps.duracionEgeColaborado,  
--				cmps.duracionege = mps.duracionEge,
--				cmps.fechains = mps.fechains,  
--				cmps.FechaUltimaMod =mps.FechaUltimaMod,    
--				cmps.ClaUsuarioMod = mps.ClaUsuarioMod,    
--				cmps.NombrePcMod = mps.NombrePcMod    
--from  ASWSCH.AswPPLSrvSecuenciaMicroprogramaSemanalcarga  CMPS     
--inner join #MircroProgramaSemanal MPS on    
-- cmps.claubicacion =  mps.ClaUbicacion and   
-- cmps.claareaproduccion = mps.ClaAreaProduccion and  
-- cmps.clagrupomaquina = mps.ClaGrupoMaquina and  
-- cmps.ClaMaquina = mps.ClaMaquina and
-- cmps.claperiodo = mps.claperiodo and    
-- cmps.claarticulo = mps.claarticulo and    
-- cmps.idopm = mps.IdOPM  

while @nClaPeriodo is not null
begin

	If not exists (select 1 from aswsch.ASWCfgProgPeriodo where ClaPeriodo = @nClaPeriodo and claubicacion = @pnClaUbicacion)
	Begin
			exec ASWSch.ASW_CU101_Pag1_AltaPeriodo_I
					@pnClaUbicacion = @pnClaUbicacion,  
					@pnClaPeriodo = @nClaPeriodo,  
					@pdtFechaInicio = null,  
					@pdtFechaFinal = null,  
					@pnClaUsuarioMod = 999,  
					@psNombrePcMod = 'Job_CArga'

	end

	exec ASWSch.ASW_CU101_Pag1_ObtenerFolioCarga_Proc  
			@pnClaUbicacion = @pnClaUbicacion,  
			@pnClaPeriodo = @nClaPeriodo ,
			@pnIdFolioCarga =  @nIdFolioCarga output  

	
    

	
	insert into ASWSCH.AswTraPPLSrvSecuenciaMicroprogramaSemanalCarga    
		(	[ClaUbicacion] ,  
			[ClaAreaProduccion] ,  
			[ClaveAreaProduccion] ,  
			[NomAreaProduccion],  
			[ClaGrupoMaquina] ,  
			[ClaveGrupoMaquina] ,  
			[NomGrupoMaquina],  
			[ClaMaquina] ,  
			[ClaPeriodo] ,  
			[ClaArticulo] ,  
			[ClaveArticulo] ,  
			[NomArticulo],  
			[ClaUnidad] ,  
			[NomUnidad] ,  
			[IdOPM] ,  
			[CantOPMkgs] ,
			[CantOpmUds],
			[PlannedStartTime] ,  
			[fechapromesaOpm],  
			[CapacidadKgs] ,  
			[CapacidadUds] ,  
			[Egecolaborado] ,
			[ege],
			[DuracionEgeColaborado] ,
			[DuracionEge],
 --[BajaLogica] [int] NULL,  
-- [FechaBajaLogica] [datetime] NULL,  
			 [FechaIns] ,  
			[FechaUltimaMod],  
			[ClaUsuarioMod] ,  
			[NombrePcMod] ,
			[idFolioCarga],
			[ClaEstatus])      
		select		mps.ClaUbicacion ,  
					mps.ClaAreaProduccion ,  
					mps.ClaveAreaProduccion ,  
					mps.NomAreaProduccion,  
					mps.ClaGrupoMaquina ,  
					mps.ClaveGrupoMaquina ,  
					mps.NomGrupoMaquina,  
					mps.ClaMaquina ,  
					mps.ClaPeriodo ,  
					mps.ClaArticulo ,  
					mps.ClaveArticulo ,  
					mps.NomArticulo,  
					mps.ClaUnidad ,  
					mps.NomUnidad ,  
					mps.IdOPM ,  
					mps.CantidadOPMkgs , 
					mps.CantidadOPMUds,
					mps.PlannedStartTime,  
					mps.FEchaPromesaOpm,  
					mps.CapacidadKgs ,  
					mps.CapacidadUds,  
					mps.EgeColaborado ,
					mps.Ege,
					mps.DuracionEgeColaborado ,
					mps.DuracionEge,
 --[BajaLogica] [int] NULL,  
-- [FechaBajaLogica] [datetime] NULL,  
					mps.FechaIns ,  
					mps.FechaUltimaMod,  
					mps.ClaUsuarioMod ,  
					mps.NombrePcMod,
					@nIdFolioCarga,
					mps.ClaEstatus
		from #MircroProgramaSemanal mps    
--where not exists (select 1 from ASWSCH.AswPPLSrvSecuenciaMicroprogramaSemanalcarga cmps   
--    where cmps.claubicacion =  mps.ClaUbicacion and   
--      cmps.claareaproduccion = mps.ClaAreaProduccion and  
--       cmps.clagrupomaquina = mps.ClaGrupoMaquina and  
--      cmps.clamaquina = mps.clamaquina and    
--      cmps.claperiodo = mps.claperiodo and    
--      cmps.claarticulo = mps.claarticulo and    
--      cmps.idopm = mps.idopm)

		select @nVersion = versionactual from aswsch.ASWCfgProgPeriodo where ClaPeriodo = @nClaPeriodo
		select @nNvaVersion = 0

		exec aswsch.AswVerificarPlanProc 
			@pnClaPeriodo = @nClaPeriodo,
			@pnVersion = @nVersion,
			@pnidFolioCarga = @nIdFolioCarga,
			@pnNVaVersion = @nNvaVersion  output

		if @nNvaVersion = 1
		begin
			exec  aswsch.ASWGenerarNvaVersionPeriodoProc
						@pnClaPeriodo  = @nClaPeriodo,
						@pnVersion = @nVersion, 
						@pnIdFolioCarga = @nIdFolioCarga,
						@pnNvaVersion = @nNvaVersion output

			insert into [AswSch].[AswTRaMicroPrograma]
						(	claubicacion, 
							ClaArea,
							ClaveArea,
							NomArea,
							ClaGrupoMaquina,
							ClaveGrupoMaquina,
							NomGrupoMaquina,
							IdWorkCenter,

							ClaPeriodo,
							Version, 
							ClaArticulo,
							ClaveArticulo,
							NomArticulo, 
							ClaUnidad,
							NomUnidad,
							IdOpm  ,
							NomOPM,
							CantidadProgramadaKgs,
							CantidadProgramadaUds,
							FechaInicioPlan,
							FechaPromesaOPM,
							ClaEstatus,

							FechaInicioReal,
							FechaFinReal,
							CantidadProducida,
							CantidadPNC,

							Ege,
							CapacidadKgs,
							CapacidadUds,
							DuracionEge,

							FechaIns,
							FechaUltimaMod,
							ClaUsuarioMod,
							NombrePcMod
							)
				select	ppl.claubicacion, 
						ppl.ClaAreaProduccion,
						ppl.ClaveAreaProduccion,
						ppl.NomAreaProduccion,
						ppl.ClaGrupoMaquina,
						ppl.ClaveGrupoMaquina,
						ppl.NomGrupoMaquina,
						ppl.clamaquina,
						
						ppl.ClaPeriodo,
						@nNvaVersion, 
						ppl.ClaArticulo,
						ppl.ClaveArticulo,
						ppl.NomArticulo, 
						ppl.ClaUnidad,
						ppl.NomUnidad,
						ppl.IdOpm  ,
						ppl.ClaveArticulo,
						ppl.CantOPMKgs,
						ppl.CantOpmUds,
						ppl.PlannedStarttime,
						ppl.FechaPromesaOpm ,
						
						--actualizacion version anterior:
						COALESCE(CASE WHEN mp.ClaEstatus in (2,3) THEN mp.ClaEstatus
							WHEN ppl.ClaEstatus = 2 THEN mp.ClaEstatus
							ELSE ppl.ClaEstatus END,1),

						mp.FechaInicioReal,
						mp.FechaFinReal,
						mp.CantidadProducida,
						mp.CantidadPNC,

						ppl.Ege ,
						ppl.CapacidadKgs,
						ppl.CapacidadUds,
						ppl.DuracionEge,
						
						ppl.FechaIns,
						ppl.FechaUltimaMod,
						ppl.ClaUsuarioMod,
						ppl.NombrePcMod
				from [AswSch].[AswTRaPPLSrvSecuenciaMicroprogramaSemanalCarga] ppl
				left join [AswSch].[AswTRaMicroPrograma] mp
				on ppl.ClaPeriodo =  mp.ClaPeriodo
					and ppl.IdOPM = mp.IdOpm
					and mp.[Version] = @nNvaVersion - 1 --version anterior
					and mp.idMicroProgOrigen IS NULL --de momento se ignoran las opms partidas
				where ppl.ClaPeriodo =  @nClaPeriodo
					and ppl.idFolioCarga = @nIdFolioCarga
				     
				---Se cancela la version Anterior, las partidas que no se esten corriendo  
				update aswsch.AswTraMicroPrograma set ClaEstatus = 4   
				where  ClaPeriodo = @nClaPeriodo   
					and version =  @nNvaVersion - 1  
					and ClaEstatus in (1, 2, 5)  

		end


		select @nClaPeriodo =  min(ClaPeriodo)
		from @tblPeriodos
		where claPeriodo > @nClaPeriodo

end