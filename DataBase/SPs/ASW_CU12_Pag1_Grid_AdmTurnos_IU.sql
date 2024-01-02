USE [ASW]
GO
/****** Object:  StoredProcedure [AswSch].[ASW_CU12_Pag1_Grid_AdmTurnos_IU]    Script Date: 14/11/2022 12:44:26 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






--EXEC  ASWSch.ASW_CU12_Pag1_Grid_AdmTurnos_IU  3,0,1,68,'2020-06-08 15:22:34.950','2020-05-08 23:46:00.967',2,0,'SOPORTE',15765,3

ALTER PROC [AswSch].[ASW_CU12_Pag1_Grid_AdmTurnos_IU]
    @pnClaDepartamento INT =0,
    @pnClaProduccionInicio INT,
    --@pnProduccionInicio INT,
    @pnBajaLogica INT=0,
    @pnProduccionDiaInicio INT=0,
    @pnClaUbicacion INT,
    @pdHoraInicioTurno DATETIME,
    @pdHoraFinTurno DATETIME,
    @pnClaTurno INT,
    @pnValorBaja INT =1,
    @psNombrePcMod VARCHAR(64),
    @pnClausuarioMod INT,
    @pnAccionSp INT=0

AS
BEGIN

	  ------------Campos Obligatorios------------------------------------
DECLARE @SEdbMSg VARCHAR(100)
	   IF  (@pnClaDepartamento =-1 OR @pnClaDepartamento IS NULL)
	   BEGIN
		  SET @SEdbMSg = 'You have not selected a department.'
			 RAISERROR( @SEdbMSg, 16,1)
			 RETURN
	   END

	   IF  (@pnClaTurno =-1 OR @pnClaTurno IS NULL)
	   BEGIN
		  SET @SEdbMSg = 'You have not selected a shift.'
			 RAISERROR( @SEdbMSg, 16,1)
			 RETURN
	   END

	   IF  (@pdHoraInicioTurno =-1 OR @pdHoraInicioTurno IS NULL)
	   BEGIN
		  SET @SEdbMSg = 'You have not selected a shift start time.'
			 RAISERROR( @SEdbMSg, 16,1)
			 RETURN
	   END

	   IF  (@pdHoraFinTurno =-1 OR @pdHoraFinTurno IS NULL)
	   BEGIN
		  SET @SEdbMSg = 'You have not selected a shift end time.'
			 RAISERROR( @SEdbMSg, 16,1)
			 RETURN
	   END

	   	   	   IF  (@pnClaProduccionInicio =-1 OR @pnClaProduccionInicio IS NULL)
	   BEGIN
		  SET @SEdbMSg = 'You have not selected a shift production day.'
			 RAISERROR( @SEdbMSg, 16,1)
			 RETURN
	   END

	 --------------------------------------------------------------------

	   IF @pnAccionSP =1
	   
          BEGIN
		  IF   EXISTS ( SELECT 1 FROM ASWSch.AswRelTurnoDepartamentoHorario	 WITH(NOLOCK)
	    
	   WHERE
		  ClaUbicacion = @pnClaUbicacion AND
		  ClaTurno = @pnClaTurno AND
		  ClaDepartamento = @pnClaDepartamento AND
	   	  BajaLogica = 1)
		   BEGIN
     	    UPDATE ASWSch.AswRelTurnoDepartamentoHorario
	   SET 
		  ClaTurno =@PnClaTurno, 
		  ClaDepartamento =@pnClaDepartamento,
		  HoraInicioTurno =  @pdHoraInicioTurno, 
		  HoraFinTurno = @pdHoraFinTurno,
		  ProduccionDiaInicio = @pnClaProduccionInicio,
		  BajaLogica = 0,
		  FechaUltimaMod = GETDATE(),
		  NombrePcMod=@psNombrePcMod,
		  ClausuarioMod= @pnClausuarioMod 

		  WHERE 
		  ClaUbicacion = @pnClaUbicacion AND
		  ClaTurno = @pnClaTurno AND
		  ClaDepartamento = @pnClaDepartamento 

		    END
		 	ELSE
	
	    	    BEGIN
	   IF   EXISTS ( SELECT 1 FROM ASWSch.AswRelTurnoDepartamentoHorario	 WITH(NOLOCK)
	   WHERE
		  ClaUbicacion = @pnClaUbicacion AND
		  ClaTurno = @pnClaTurno AND
		  ClaDepartamento = @pnClaDepartamento AND
		  BajaLogica =0 )

	   BEGIN
		  RAISERROR('Can not double the turn',16, 1)
		  RETURN
	   END
		ELSE
	   INSERT INTO ASWSch.AswRelTurnoDepartamentoHorario 
		   (ClaTurno, 
		   ClaDepartamento,
		   HoraInicioTurno, 
		   HoraFinTurno,
		   ProduccionDiaInicio,
		   BajaLogica,
		   FechaUltimaMod,
		   ClaUbicacion,
		   NombrePcMod,
		   ClausuarioMod) 
	    VALUES
		  (@pnClaTurno,
		   @pnClaDepartamento, 
		   CAST(@pdHoraInicioTurno AS TIME), 
		   CAST(@pdHoraFinTurno AS TIME),
		   @pnClaProduccionInicio,
		   @pnBajaLogica,
		   GETDATE(),
		   @pnClaUbicacion,
		   @psNombrePcMod,
		   @pnClausuarioMod)
		 
	   END
	   END
    		
	   ----------Actualiza-----------
	   IF @pnAccionSP =2
	   BEGIN 
	    UPDATE ASWSch.AswRelTurnoDepartamentoHorario
	   SET 
		  ClaTurno =@PnClaTurno, 
		  ClaDepartamento =@pnClaDepartamento,
		  HoraInicioTurno =  @pdHoraInicioTurno, 
		  HoraFinTurno = @pdHoraFinTurno,
		  BajaLogica = 0,
		  ProduccionDiaInicio =@pnClaProduccionInicio, 
		  FechaUltimaMod = GETDATE(),
		  NombrePcMod=@psNombrePcMod,
		  ClausuarioMod= @pnClausuarioMod


	    WHERE 
		  ClaUbicacion = @pnClaUbicacion AND
		  ClaTurno = @pnClaTurno AND
		  ClaDepartamento = @pnClaDepartamento 
	
		 END
	    -----------------Eliminar-------------------
		 IF @pnAccionSP =3														 
		 BEGIN
		  UPDATE ASWSch.AswRelTurnoDepartamentoHorario
	   SET 
		  ClaTurno =@PnClaTurno, 
		  ClaDepartamento =@pnClaDepartamento,
		  HoraInicioTurno =  @pdHoraInicioTurno, 
		  HoraFinTurno = @pdHoraFinTurno,
		  BajaLogica = 1,
		  ProduccionDiaInicio =@pnClaProduccionInicio,
		  FechaUltimaMod = GETDATE(),
		  NombrePcMod=@psNombrePcMod,
		  ClausuarioMod= @pnClausuarioMod

	    WHERE 
		  ClaUbicacion = @pnClaUbicacion AND
		  ClaTurno = @pnClaTurno AND
		  ClaDepartamento = @pnClaDepartamento AND
		  BajaLogica =0
	    
		  END         

	   END



















