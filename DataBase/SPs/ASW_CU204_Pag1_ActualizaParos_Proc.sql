--USE [ASW]
--GO
/****** Object:  StoredProcedure [AswSch].[ASW_CU204_Pag1_ActualizaParos_Proc]    Script Date: 15/11/2022 02:18:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [AswSch].[ASW_CU204_Pag1_ActualizaParos_Proc]  
 @xml XML  
AS  
BEGIN  
  
 DECLARE @handle INT    
 DECLARE @PrepareXmlStatus INT   
  
 DECLARE   
  @ErrorMessage  NVARCHAR(4000)  
  ,@ErrorSeverity INT  
  ,@ErrorState    INT   
  
 DECLARE @tResultado TABLE(  
  IdParo INT,  
  IdComponente VARCHAR(30),
  ClaEventoParo INT,  
  ClaEventoJustificacion INT,
  FechaHoraJustificado DATETIME,
  ClaEventoReasignacion INT,  
  FechaHoraReasignado DATETIME,
  ClaEventoAtencion INT,  
  FechaHoraAtencion DATETIME,
  ClaEventoSolucionado INT,  
  FechaHoraSolucion DATETIME,
  ClaEstatusReplica INT,--control para interfaz con MCSW (1 cambio, 2 replicado)    
  FechaUltimaMod  DATETIME,
  ClaEventoCierre INT,
  FechaHoraFinal DATETIME,
  FechaHoraRecibido DATETIME
 )  
   
 DECLARE @nId INT,    
  @nClaUbicacion INT,  
  @nIdComponente VARCHAR(30),  
  @nIdParo INT,  
  @nIdPOInicio INT,  
  @nIdPOFin INT,  
  @nIdUnidad INT,  
  @nIdUsuario INT,  
  @tFechaHoraInicial DATETIME,  
  @tFechaHoraFinal DATETIME,  
  @nMicroParoSN INT,  
  @nDuracionSegundos INT,  
  @tFechaAdmSCADA DATETIME,  
  @nClaTurno INT,  
  @nClaGrupoParo INT,  
  @nClaParo INT,  
  @nClaSeccionParo INT,  
  @nClaEstatusReplica INT,  
  @nClaEventoParo INT,  
  @nClaEventoJustificacion INT,  
  @nClaEventoReasignacion INT,  
  @nClaEventoAtencion INT,  
  @nClaEventoSolucionado INT,  
  @nClaEventoCierre INT,  
  @nIdParoProgramado     INTEGER,  
        @tFechaHoraJustificado DATETIME,  
        @tFechaHoraReasignado  DATETIME,  
        @tFechaHoraAtencion    DATETIME,  
        @tFechaHoraSolucion    DATETIME,  
  @nClaUsuarioMod INT,  
  @sNombrePCMod VARCHAR(64),  
  @tFechaUltimaMod DATETIME,  
  @nBajaLogica INT,  
  @sComentarios VARCHAR(400),  
  @sComentariosSolucion VARCHAR(400),  
  @sNombreEmpleado VARCHAR(300),  
  @nIdAgrupador INT  

  Declare @nClaveCelda INT
  
 DECLARE @Paros TABLE(  
  Id INT IDENTITY,  
  ClaUbicacion INT,  
  IdComponente VARCHAR(30),  
  IdParo INT,  
  IdPOInicio INT,  
  IdPOFin INT,  
  idUnidad INT,  
  idUsuario INT,  
  fechaHoraInicial DATETIME,  
  fechaHoraFinal DATETIME,  
  microParoSN INT,  
  DuracionSegundos INT,  
  fechaAdmSCADA DATETIME,  
  ClaTurno INT,  
  claGrupoParo VARCHAR(10),  
  claParo VARCHAR(10),  
  claSeccionParo VARCHAR(10),  
  ClaEstatusReplica INT,  
  ClaEventoParo INT,  
  ClaEventoJustificacion INT,  
  ClaEventoReasignacion INT,  
  ClaEventoAtencion INT,  
  ClaEventoSolucionado INT,  
  ClaEventoCierre INT,  
  IdParoProgramado     INTEGER,  
  FechaHoraJustificado DATETIME,  
  FechaHoraReasignado  DATETIME,  
  FechaHoraAtencion    DATETIME,  
  FechaHoraSolucion    DATETIME,  
  IdAgrupador INT,  
  ClaUsuarioMod INT,  
  NombrePCMod VARCHAR(64),  
  FechaUltimaMod DATETIME,  
  BajaLogica INT,  
  Comentarios VARCHAR(400),  
  ComentariosSolucion VARCHAR(400),  
  NombreEmpleado VARCHAR(300)  
 )  
  
 EXEC @PrepareXmlStatus= sp_xml_preparedocument @handle OUTPUT, @xml    
   
 INSERT INTO @Paros([ClaUbicacion]  
  ,[IdComponente]  
  ,[IdParo]  
  ,[IdPOInicio]  
  ,[IdPOFin]  
  ,[idUnidad]  
  ,[idUsuario]  
  ,[fechaHoraInicial]  
  ,[fechaHoraFinal]  
  ,[microParoSN]  
  ,[DuracionSegundos]  
  ,[fechaAdmSCADA]  
  ,[ClaTurno]  
  ,[claGrupoParo]  
  ,[claParo]  
  ,[claSeccionParo]  
  ,[ClaEstatusReplica]  
  ,ClaEventoParo  
  ,ClaEventoJustificacion  
  ,ClaEventoReasignacion  
  ,ClaEventoAtencion  
  ,ClaEventoSolucionado  
  ,ClaEventoCierre  
  ,IdParoProgramado       
        ,FechaHoraJustificado   
        ,FechaHoraReasignado    
        ,FechaHoraAtencion      
        ,FechaHoraSolucion      
  ,IdAgrupador  
  ,[ClaUsuarioMod]  
  ,[NombrePcMod]  
  ,[FechaUltimaMod]  
  ,[BajaLogica]  
  ,[Comentarios]  
  ,[ComentariosSolucion]  
  ,[NombreEmpleado]  
 )  
 SELECT [ClaUbicacion]  
  ,[IdComponente]  
  ,[IdParo]  
  ,[IdPOInicio]  
  ,[IdPOFin]  
  ,[idUnidad]  
  ,[idUsuario]  
  ,[fechaHoraInicial]  
  ,[fechaHoraFinal]  
  ,[microParoSN]  
  ,[DuracionSegundos]  
  ,[fechaAdmSCADA]  
  ,[ClaTurno]  
  ,NULLIF([claGrupoParo],'') AS [claGrupoParo]  
  ,NULLIF([claParo],'') AS [claParo]  
  ,NULLIF([claSeccionParo],'') AS [claSeccionParo]  
  ,[ClaEstatusReplica]  
  ,ClaEventoParo  
  ,ClaEventoJustificacion  
  ,ClaEventoReasignacion  
  ,ClaEventoAtencion  
  ,ClaEventoSolucionado  
  ,ClaEventoCierre  
  ,IdParoProgramado       
        ,FechaHoraJustificado   
        ,FechaHoraReasignado   
        ,FechaHoraAtencion     
        ,FechaHoraSolucion     
  ,IdAgrupador  
  ,[ClaUsuarioMod]  
  ,[NombrePcMod]+'_rep' AS NombrePcMod  
  ,[FechaUltimaMod]  
  ,[BajaLogica]  
  ,[Comentarios]  
  ,[ComentariosSolucion]  
  ,[NombreEmpleado]  
 FROM    OPENXML(@handle, '/ActualizaParos/Paro', 2)    
  WITH (  
  ClaUbicacion INT,  
  IdComponente VARCHAR(30),  
  IdParo INT,  
  IdPOInicio INT,  
  IdPOFin INT,  
  idUnidad INT,  
  idUsuario INT,  
  fechaHoraInicial DATETIME,  
  fechaHoraFinal DATETIME,  
  microParoSN INT,  
  DuracionSegundos INT,  
  fechaAdmSCADA DATETIME,  
  ClaTurno INT,  
  claGrupoParo VARCHAR(10),  
  claParo VARCHAR(10),  
  claSeccionParo VARCHAR(10),  
  ClaEstatusReplica INT,  
  ClaEventoParo INT,  
  ClaEventoJustificacion INT,  
  ClaEventoReasignacion INT,  
  ClaEventoAtencion INT,  
  ClaEventoSolucionado INT,  
  ClaEventoCierre INT,  
  IdParoProgramado     INTEGER,  
  FechaHoraJustificado DATETIME,  
  FechaHoraReasignado  DATETIME,  
  FechaHoraAtencion    DATETIME,  
  FechaHoraSolucion    DATETIME,  
  IdAgrupador INT,  
  ClaUsuarioMod INT,  
  NombrePCMod VARCHAR(64),  
  FechaUltimaMod DATETIME,  
  BajaLogica INT,  
  Comentarios VARCHAR (400),  
  ComentariosSolucion VARCHAR(400),  
  NombreEmpleado VARCHAR(300)  
  )    
  
 EXEC sp_xml_removedocument @handle   
   

 --OBTENER LA CELDA
 SELECT @nClaveCelda = ClaveWorkCenter
 FROM @Paros p
 JOIN AswSch.AswCatWorkUnitVw M
 ON p.IdComponente = M.ClaMaquina
 JOIN AswSch.AswCatWorkCenterVw C
 ON M.IdWorkCenter = C.IdWorkCenter
 group by ClaveWorkCenter

 INSERT INTO ASWSch.ASW_ASWLite_BitParos(   
  ClaUbicacion           ,  
  IdComponente           ,  
  IdParo                 ,  
  IdPOInicio             ,  
  IdPOFin                ,  
  idUnidad               ,  
  idUsuario              ,  
  fechaHoraInicial       ,  
  fechaHoraFinal         ,  
  microParoSN            ,  
  DuracionSegundos       ,  
  fechaAdmSCADA          ,  
  ClaTurno               ,  
  claGrupoParo           ,  
  claParo                ,  
  claSeccionParo         ,  
  ClaEstatusReplica      ,  
  ClaEventoParo          ,  
  ClaEventoJustificacion ,  
  ClaEventoReasignacion  ,  
  ClaEventoAtencion      ,  
  ClaEventoSolucionado   ,  
  IdParoProgramado       ,  
  FechaHoraJustificado   ,  
  FechaHoraReasignado    ,  
  FechaHoraAtencion      ,  
  FechaHoraSolucion      ,  
  ClaUsuarioMod          ,  
  NombrePCMod            ,  
  FechaUltimaMod         ,  
  BajaLogica             ,  
  Comentarios            ,  
  ComentariosSolucion    ,  
  NombreEmpleado         ,  
  ClaEventoCierre        ,  
  IdAgrupador            )  
 Select ClaUbicacion            ,  
   IdComponente           ,  
   IdParo                 ,  
   IdPOInicio             ,  
   IdPOFin                ,  
   idUnidad               ,  
   idUsuario              ,  
   fechaHoraInicial       ,  
   fechaHoraFinal         ,  
   microParoSN            ,  
   DuracionSegundos       ,  
   fechaAdmSCADA          ,  
   ClaTurno               ,  
   claGrupoParo           ,  
   claParo                ,  
   claSeccionParo         ,  
   ClaEstatusReplica      ,  
   ClaEventoParo          ,  
   ClaEventoJustificacion ,  
   ClaEventoReasignacion  ,  
   ClaEventoAtencion      ,  
   ClaEventoSolucionado   ,  
   IdParoProgramado       ,  
   FechaHoraJustificado   ,  
   FechaHoraReasignado    ,  
   FechaHoraAtencion      ,  
   FechaHoraSolucion      ,  
   ClaUsuarioMod          ,  
   NombrePCMod            ,  
   FechaUltimaMod         ,  
   BajaLogica             ,  
   Comentarios            ,  
   ComentariosSolucion    ,  
   NombreEmpleado         ,  
   ClaEventoCierre        ,  
   IdAgrupador            
   FROM @Paros  
 --select * from @Paros  
  
 --inicializo la tabla de respuestas  
 --la bd local solo actualizara los campos no nulos  
 INSERT INTO @tResultado (IdParo
	,IdComponente
	,ClaEstatusReplica
	,FechaUltimaMod
	,ClaEventoJustificacion
	,FechaHoraJustificado
	,ClaEventoReasignacion
	,FechaHoraReasignado
	,ClaEventoAtencion
	,FechaHoraAtencion
	,ClaEventoSolucionado
	,FechaHoraSolucion
	,ClaEventoCierre
	,FechaHoraFinal
	,FechaHoraRecibido)  
 SELECT IdParo  
  ,IdComponente
  ,1 --por replicar  
  ,FechaUltimaMod
  ,ClaEventoJustificacion 
  ,FechaHoraJustificado
  ,ClaEventoReasignacion  
  ,FechaHoraReasignado
  ,ClaEventoAtencion  
  ,FechaHoraAtencion
  ,ClaEventoSolucionado  
  ,FechaHoraSolucion
  ,ClaEventoCierre  
  ,fechaHoraFinal
  ,GETDATE()
 FROM @Paros  
  
   
 SELECT @nId = MIN (Id)  
 FROM @Paros  
   
 WHILE @nId IS NOT NULL  
 BEGIN  
  SELECT   
   @nClaUbicacion = ClaUbicacion   
   ,@nIdComponente = IdComponente   
   ,@nIdParo = IdParo   
   ,@nIdPOInicio = IdPOInicio   
   ,@nIdPOFin = IdPOFin   
   ,@nIdUnidad = IdUnidad   
   ,@nIdUsuario = IdUsuario   
   ,@tFechaHoraInicial = FechaHoraInicial   
   ,@tFechaHoraFinal = FechaHoraFinal   
   ,@nMicroParoSN = MicroParoSN   
   ,@nDuracionSegundos = DuracionSegundos   
   ,@tFechaAdmSCADA = FechaAdmSCADA   
   ,@nClaTurno = ClaTurno   
   ,@nClaGrupoParo = ClaGrupoParo   
   ,@nClaParo = ClaParo   
   ,@nClaSeccionParo = ClaSeccionParo   
   ,@nClaEstatusReplica = ClaEstatusReplica   
   ,@nClaEventoParo = ClaEventoParo  
   ,@nClaEventoJustificacion = ClaEventoJustificacion  
   ,@nClaEventoReasignacion = ClaEventoReasignacion  
   ,@nClaEventoAtencion = ClaEventoAtencion  
   ,@nClaEventoSolucionado = ClaEventoSolucionado  
   ,@nClaEventoCierre = ClaEventoCierre  
   ,@nIdParoProgramado =IdParoProgramado     
   ,@tFechaHoraJustificado = FechaHoraJustificado  
   ,@tFechaHoraReasignado  = FechaHoraReasignado  
   ,@tFechaHoraAtencion   = FechaHoraAtencion  
   ,@tFechaHoraSolucion   = FechaHoraSolucion  
   ,@nIdAgrupador = IdAgrupador  
   ,@nClaUsuarioMod = ClaUsuarioMod   
   ,@sNombrePCMod = NombrePCMod   
   ,@tFechaUltimaMod = FechaUltimaMod   
   ,@nBajaLogica = BajaLogica   
   ,@sComentarios = Comentarios  
   ,@sComentariosSolucion = ComentariosSolucion  
      ,@sNombreEmpleado = NombreEmpleado  
  FROM @Paros  
  WHERE Id = @nId  
  
  --Inserto el registro en la tabla con la informacion original  
  EXEC [AswSch].[ASW_CU204_Pag1_BitParos_IU]  
   @nClaUbicacion   
   ,@nIdComponente   
   ,@nIdParo   
   ,@nIdPOInicio   
   ,@nIdPOFin   
   ,@nIdUnidad   
   ,@nIdUsuario   
   ,@tFechaHoraInicial   
   ,@tFechaHoraFinal   
   ,@nMicroParoSN   
   ,@nDuracionSegundos   
   ,@tFechaAdmSCADA   
   ,@nClaTurno   
   ,@nClaGrupoParo   
   ,@nClaParo   
   ,@nClaSeccionParo   
   ,@nClaEstatusReplica  
   ,@nClaEventoParo  
   ,@nClaEventoJustificacion  
   ,@nClaEventoReasignacion  
   ,@nClaEventoAtencion  
   ,@nClaEventoSolucionado  
   ,@nClaEventoCierre  
   ,@nIdParoProgramado       
   ,@tFechaHoraJustificado   
   ,@tFechaHoraReasignado    
   ,@tFechaHoraAtencion     
   ,@tFechaHoraSolucion     
   ,@nIdAgrupador  
   ,@nClaUsuarioMod   
   ,@sNombrePCMod   
   ,@tFechaUltimaMod   
   ,@nBajaLogica  
   ,@sComentarios   
   ,@sComentariosSolucion  
      ,@sNombreEmpleado   
    
  --si me traje un evento nuevo lo confirmo de recibido, si no no afecto la columna  
  --sqlite solo se va a actualizar si se tiene un valor no nulo  
  UPDATE @tResultado  
  SET ClaEventoParo = CASE WHEN @nClaEventoParo = 1 THEN 2 ELSE NULL END  
   ,ClaEventoJustificacion = CASE WHEN @nClaEventoJustificacion = 1 THEN 2 ELSE NULL END  
   ,ClaEventoReasignacion = CASE WHEN @nClaEventoReasignacion = 1 THEN 2 ELSE NULL END  
   ,ClaEventoAtencion = CASE WHEN @nClaEventoAtencion = 1 THEN 2 ELSE NULL END  
   ,ClaEventoSolucionado = CASE WHEN @nClaEventoSolucionado = 1 THEN 2 ELSE NULL END  
   ,ClaEventoCierre = CASE WHEN @nClaEventoCierre = 1 THEN 2 ELSE NULL END  
   ,ClaEstatusReplica = 2
  
  UPDATE @Paros  
  SET ClaEstatusReplica=2  
  WHERE Id=@nId  
  ----------------------------------------------------------  
  SELECT @nId = MIN (Id)  
  FROM @Paros  
  WHERE Id>@nId  
 END  

 IF @nClaveCelda in (13,14,15,16,17,18,68,71)
 BEGIN
	 select IdParo  
	  ,IdComponente
	  ,ClaEstatusReplica 
	  ,convert(varchar,FechaUltimaMod,121) as FechaUltimaMod
	  ,ClaEventoJustificacion  
	  ,convert(varchar,FechaHoraJustificado,121) as FechaHoraJustificado
	  ,ClaEventoReasignacion  
	  ,convert(varchar,FechaHoraReasignado,121) as FechaHoraReasignado
	  ,ClaEventoAtencion  
	  ,convert(varchar,FechaHoraAtencion,121) as FechaHoraAtencion
	  ,ClaEventoSolucionado  
	  ,convert(varchar,FechaHoraSolucion,121) as FechaHoraSolucion
	  ,ClaEventoCierre 
	  ,convert(varchar,FechaHoraFinal,121) as FechaHoraFinal
	  ,convert(varchar,FechaHoraRecibido,121) as FechaHoraRecibido
	  ,convert(varchar,GETDATE(),121)  as FechaHoraRespuesta
	 from @tResultado  
 END
 ELSE
 BEGIN
	select IdParo  
	  ,ClaEventoJustificacion  
	  ,ClaEventoReasignacion  
	  ,ClaEventoAtencion  
	  ,ClaEventoSolucionado  
	  ,ClaEventoCierre 
	 from @tResultado  
 END
 
  
   
  
END  


