USE [ASW]
GO

/****** Object:  StoredProcedure [AswSch].[ASW_CU101_Pag1_AltaPeriodo_I]    Script Date: 11/04/2023 10:28:21 a. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

  
CREATE proc [AswSch].[ASW_CU101_Pag1_AltaPeriodo_I]  
@pnClaUbicacion int,  
@pnClaPeriodo int,  
@pdtFechaInicio datetime,  
@pdtFechaFinal datetime,  
@pnClaUsuarioMod int,  
@psNombrePcMod varchar(150)  
as  
  
declare   
 @nAnio int,  
 @nClavePeriodo int,
 @nClavePeriodoActual int

 select @nClavePeriodoActual = datepart(yy,getdate()) * 100 + datepart(wk,getdate())
  
 select @pdtFechaInicio = isnull(@pdtFechaInicio,fechainicioperiodo), @pdtFechaFinal = isnull(@pdtFechaFinal, fechaterminoperiodo)
 from   aswsch.AsWPPLCatPeriodoCarga
 where claubicacion = @pnClaUbicacion
 and claperiodo =  @pnClaPeriodo
 and	claareaproduccion =  1

    
if not exists (select 1 from  AswSch.ASWCfgProgPeriodo where claubicacion = @pnClaUbicacion and ClaPeriodo =  @pnClaPeriodo )  
begin  
 Select @nAnio = left(convert(varchar(10), @pnClaPeriodo),4),  
   @nClavePeriodo = Substring(convert(varchar(10), @pnClaPeriodo),5,5)  
  
 insert into AswSch.ASWCfgProgPeriodo   
 (ClaUbicacion, anio, ClavePeriodo, VersionActual,ClaPeriodo, FechaInicial, FechaFinal, ClaEstatus, FechaUltimaMod, ClaUsuarioMod, NombrePcMod, idFolioCarga)  
 select @pnClaUbicacion, @nAnio, @nClavePeriodo, 1, @pnClaPeriodo, @pdtFechaInicio, @pdtFechaFinal, 2, getdate(), @pnClaUsuarioMod, @psNombrePcMod, 1  
 

   
end  
else   
 Select 'El Periodo ya existe'
GO


