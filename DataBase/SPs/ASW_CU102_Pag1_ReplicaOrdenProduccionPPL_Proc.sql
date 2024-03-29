--USE [ASW]
--GO
/****** Object:  StoredProcedure [AswSch].[ASW_CU102_Pag1_ReplicaOrdenProduccionPPL_Proc]    Script Date: 14/11/2022 11:43:25 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
begin tran
EXEC ASWSch.ASW_CU102_Pag1_ReplicaOrdenProduccionPPL_Proc 68, 2, 38, '2021-08-05'
EXEC ASWSch.ASW_CU102_Pag1_ReplicaOrdenProduccionPPL_Proc 68, 2, NULL, '2021-08-05'
rollback tran



*/
ALTER PROCEDURE [AswSch].[ASW_CU102_Pag1_ReplicaOrdenProduccionPPL_Proc]  
 @pnClaUbicacion INT  
 ,@pnClaAreaProduccion INT  
 ,@psIdCelda VARCHAR(30) = NULL  
 ,@ptFechaProduccion DATETIME = NULL  
AS  
BEGIN  
 --para usar la fechahora default correr una hora antes del turno siguiente  
 IF @ptFechaProduccion IS NULL  
 BEGIN  
  SET @ptFechaProduccion = DATEADD(HOUR, 1, GETDATE())  
  SET @ptFechaProduccion=[AswSch].[ASWGetFechaAdm] (@pnClaUbicacion, @pnClaAreaProduccion, @ptFechaProduccion)  
 END  
    
 DECLARE   
  @nClaUbicacion INT  
  ,@nIdOPM INT  
  ,@nWorkOrderCode INT  
  ,@nClaArticulo INT  
  ,@nClaAreaProduccion INT  
  ,@sIdCelda VARCHAR(30)  
  ,@pnUnidadesProgramadas INT  
  ,@pnOrden INT  
  ,@tFechaProgramada DATETIME  
  ,@tFechaCaptura DATETIME  
  
 DECLARE @tPlanProduccion TABLE(  
  ClaUbicacion INT  
  ,IdOPM INT  
  ,WorkOrderCode INT  
  ,IdCelda VARCHAR(30)  
  ,ClaveCelda VARCHAR(15)  
  ,ClaAreaProduccion INT  
  ,ClaArticulo INT  
  ,ClaveArticulo VARCHAR(20)  
  ,ClaGpoCosteo INT  
  ,ClaGrupoProceso INT  
  ,ClaUnidadProd INT  
  ,Orden INT  
  ,FechaProgramada DATETIME  
  ,UnidadesProgramadas INT  
  ,[Length] VARCHAR(250)  
  ,Diameter VARCHAR(250)  
  ,Point VARCHAR(250)  
  ,Shank VARCHAR(250)  
  ,FechaCaptura DATETIME  
 )  
  
 INSERT INTO @tPlanProduccion  
 EXEC [MSW_LNKSVR].MCSW_ERP.MSWSch.MSW_CU420_Pag32_ConsultarPlanProduccion_Srv  
  --@pnWorkOrder               INT = NULL  
  --,@pnClaArticulo                    INT = NULL  
  --,@psClaveArticulo           VARCHAR(50) = NULL  
  @pnClaAreaProduccion = @pnClaAreaProduccion  
  ,@pnIdCelda = @psIdCelda  
  --,@psClaveCelda              VARCHAR(50) = NULL  
  ,@pdFechaProgIni   = @ptFechaProduccion  
  ,@pdFechaProgFin   = @ptFechaProduccion  
  
 --SELECT * FROM @tPlanProduccion  
 --return  
 SELECT @nIdOPM=MIN(IdOPM)  
 FROM @tPlanProduccion  
   
 WHILE @nIdOPM IS NOT NULL  
 BEGIN  
  SELECT @nClaUbicacion = ClaUbicacion   
   ,@nWorkOrderCode = WorkOrderCode  
   ,@nClaArticulo = ClaArticulo  
   ,@nClaAreaProduccion = ClaAreaProduccion  
   ,@sIdCelda = IdCelda  
   ,@pnUnidadesProgramadas = UnidadesProgramadas  
   ,@pnOrden = Orden   
   ,@tFechaProgramada = FechaProgramada  
   ,@tFechaCaptura = FechaCaptura  
  FROM @tPlanProduccion   
  WHERE IdOPM=@nIdOPM  
  
  BEGIN TRY  
   EXEC [AswSch].[ASW_CU102_Pag1_AgregarOrdenProduccionPPL_Proc]  
    @pnClaUbicacion = @nClaUbicacion  
    ,@pnClavePO = @nIdOPM  
    ,@pnWO = @nWorkOrderCode  
    ,@pnClaArticulo = @nClaArticulo  
    ,@pnClaDepartamentoOrden = @nClaAreaProduccion  
    ,@psIdCeldaOrden = @sIdCelda  
    ,@pnScheduledBoxes = @pnUnidadesProgramadas  
    ,@pnOrden = @pnOrden  
    ,@ptFechaProgramada = @tFechaProgramada  
    ,@ptFechaCaptura = @tFechaCaptura  
    --,@psProductionNotes =''  
    ,@pnClaUsuarioMod =0  
    ,@psNombrePcMod ='PPL'  
  END TRY  
  BEGIN CATCH  
   --todo:log errors to send message to the user  
  END CATCH  
  
  --select @nClaArticulo AS ClaArticulo  
  SELECT @nIdOPM=MIN(IdOPM)  
  FROM @tPlanProduccion  
  WHERE IdOPM>@nIdOPM  
 END  
END