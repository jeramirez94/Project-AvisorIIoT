/****** Object:  StoredProcedure [AswSch].[AswVerificarPlanProc]    Script Date: 11/04/2023 08:14:30 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER proc [AswSch].[AswVerificarPlanProc] 
@pnClaPeriodo int,
@pnVersion int,
@pnidFolioCarga int,
@pnNvaVersion int output
as

	Select @pnNvaVersion = 0

	--si alguna de las opms del programa no existe en el plan del periodo
	if exists (
			select 1
			from [AswSch].[AswTRaPPLSrvSecuenciaMicroprogramaSemanalCarga] 
			where claperiodo = @pnClaPeriodo 
				and idFolioCarga = @pnidFolioCarga
				and idopm not in (	select IdOpm 
									from [AswSch].[AswTRaMicroPrograma]		
									where ClaPeriodo = @pnClaPeriodo 
										and Version = @pnVersion)
			)
	begin
		Select @pnNvaVersion = 1
	end
	Else if exists (
			select 1
			from [AswSch].[AswTRaMicroPrograma]
			where claperiodo = @pnClaPeriodo 
				and Version = @pnVersion   
				and ClaEstatus not in (4,3) 
				and idopm not in (	select IdOpm 
									from [AswSch].[AswTRaPPLSrvSecuenciaMicroprogramaSemanalCarga]		
									where ClaPeriodo = @pnClaPeriodo 
										and idFolioCarga = @pnidFolioCarga
									) 
				) 
		and @pnNvaVersion = 0
	begin
		 Select @pnNvaVersion = 1
	end
	else if exists (
				select 1 
				from  [AswSch].[AswTRaPPLSrvSecuenciaMicroprogramaSemanalCarga] SC
				inner join [AswSch].[AswTRaMicroPrograma] MP 
				on MP.ClaPeriodo = @pnClaPeriodo 
					and mp.Version = @pnVersion 
					and	mp.ClaPeriodo =  sc.ClaPeriodo
					and	mp.IdOpm = sc.IdOPM
					and sc.idFolioCarga = @pnidFolioCarga
					and (sc.ClaEstatus = 4 and mp.ClaEstatus not in (2,4) --solo cancelaciones mientras esta el servicio de actualizar estatus
							--(mp.claestatus = 1 and sc.claestatus=4
							--or mp.claestatus = 4 and sc.claestatus 1
							--or mp.claestatus = 5 and sc.claestatus =4
							--)
						or mp.FechaPromesaOPM != sc.FechaPromesaOpm
						or mp.CantidadProgramadaUds != sc.CantOpmUds 
						or mp.CantidadProgramadaKgs != sc.CantOPMKgs 
						or mp.ClaArticulo != sc.ClaArticulo 
						or mp.IdWorkCenter != sc.ClaMaquina
						)
				) 
		and @pnNvaVersion = 0
	begin
		select @pnNvaVersion = 1
	end


return isnull(@pnNvaVersion,0)


