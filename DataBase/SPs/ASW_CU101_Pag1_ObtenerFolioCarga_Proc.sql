/****** Object:  StoredProcedure [AswSch].[ASW_CU101_Pag1_ObtenerFolioCarga_Proc]    Script Date: 11/04/2023 10:29:07 a. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


alter proc [AswSch].[ASW_CU101_Pag1_ObtenerFolioCarga_Proc]
@pnClaUbicacion int,
@pnClaPeriodo int,
@pnIdFolioCarga int output
as

select @pnIdFolioCarga = IdFolioCarga +1
from aswsch.ASWCfgProgPeriodo 
where claUbicacion =  @pnClaUbicacion
and		ClaPeriodo = @pnClaPeriodo

update  aswsch.ASWCfgProgPeriodo set IdFolioCarga = @pnIdFolioCarga
where claUbicacion =  @pnClaUbicacion
and		ClaPeriodo = @pnClaPeriodo


return @pnIdFolioCarga
GO


