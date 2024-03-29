/****** Object:  StoredProcedure [AswSch].[ASWGenerarNvaVersionPeriodoProc]    Script Date: 18/04/2023 11:18:34 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  
alter proc [AswSch].[ASWGenerarNvaVersionPeriodoProc]  
@pnClaPeriodo int,  
@pnVersion int,   
@pnIdFolioCarga int,  
@pnNvaVersion int output  
as  
  
--Se verfica si la version existe en el micro programa  
if exists (select 1 from aswsch.AswTraMicroPrograma where ClaPeriodo = @pnClaPeriodo and version = @pnVersion)  
begin
  
	-- Se incrementa la version en el periodo  
  
	update AswSch.ASWCfgProgPeriodo set versionactual  = versionactual +1,   
			idFolioCarga = @pnIdFolioCarga  
	where ClaPeriodo = @pnClaPeriodo   
		and versionactual = @pnVersion  

	select @pnVersion  = @pnVersion + 1
end  

select @pnNvaVersion = VersionActual  
from AswSch.ASWCfgProgPeriodo   
where ClaPeriodo = @pnClaPeriodo   
and versionactual = @pnVersion  
  
Return @pnNvaVersion  