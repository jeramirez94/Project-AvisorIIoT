--USE [ASW]
--GO
/****** Object:  StoredProcedure [AswSch].[ASW_CU12_Pag1_Grid_NAdmTurnos_IU]    Script Date: 14/11/2022 12:48:57 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


--EXEC StoredProcedure ASWSch.ASW_CU12_Pag1_Grid_NAdmTurnos_IU  

ALTER PROCEDURE  [AswSch].[ASW_CU12_Pag1_Grid_NAdmTurnos_IU]
    @pnClaUbicacion INT,
    @pnClaTurno INT,
    @PnClaDepartamento  INT=0,
    @pnBajaLogica INT = 0,
    @pnSIBajaLogica INT,
    @pdHoraInicio DATETIME,
    @pdHoraFin DATETIME,
    @psClaCelda VARCHAR(30),
    @pnValorBajaL INT =1,
    @pnClausuarioMod INT,
    @psNombrePcMod VARCHAR(64),
    @pnAccionSp INT=0

AS
BEGIN
	 --------Campos Obligatorios-------------------------------------
DECLARE @SEdbMSg VARCHAR(100) 
--DECLARE @psNomCelda VARCHAR(10)



	   IF  (@PnClaDepartamento=-1 OR @PnClaDepartamento IS NULL)
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

	   IF  (@psClaCelda =-1 OR @psClaCelda IS NULL)
	   BEGIN
		  SET @SEdbMSg = 'You have not selected a cell.'
			 RAISERROR( @SEdbMSg, 16,1)
			 RETURN
	   END

	   IF  (@pdHoraInicio =-1 OR @pdHoraInicio IS NULL)
	   BEGIN
		  SET @SEdbMSg = 'You have not selected a shift start time.'
			 RAISERROR( @SEdbMSg, 16,1)
			 RETURN
	   END

	   IF  (@pdHoraFin =-1 OR @pdHoraFin IS NULL)
	   BEGIN
		  SET @SEdbMSg = 'You have not selected a shift end time.'
			 RAISERROR( @SEdbMSg, 16,1)
			 RETURN
	   END
	
	 ----------------------------------------------------------------

	   IF @pnAccionSP =1
	    BEGIN
	   IF  NOT EXISTS ( SELECT 1 FROM ASWSch.AswRelTurnoDepartamentoHorario
	   WHERE
	        ClaTurno = @PnClaTurno AND
		  ClaDepartamento = @PnClaDepartamento)
	   BEGIN
	   RAISERROR('Cannot add a configuration by cell , if there is no configuration by department.',16, 1)	   
	   END
	   ELSE
	   IF  EXISTS ( SELECT 1 FROM ASWSch.AswRelTurnoCeldaExcepciones
	   WHERE
	       ClaUbicacion = @pnClaUbicacion AND
		  ClaTurno = @PnClaTurno AND
		  ClaDepartamento = @PnClaDepartamento AND
		  IdCelda = @psClaCelda AND
		  BajaLogica =1 )
		 
		    BEGIN
		   UPDATE  ASWSch.AswRelTurnoCeldaExcepciones
		  SET 
			 ClaTurno =@PnClaTurno, 
			 ClaDepartamento =@PnClaDepartamento,
			 IdCelda =@psClaCelda,
			 NomCelda =@psClaCelda, 
			 HoraInicio =  @pdHoraInicio, 
			 HoraFin = @pdHoraFin,
			 BajaLogica = 0,
			 FechaUltimaMod = GETDATE(),
			 NombrePcMod= @psNombrePcMod,
			 ClausuarioMod= @pnClausuarioMod
		   WHERE 
			 ClaUbicacion = @pnClaUbicacion AND
			 ClaTurno = @PnClaTurno AND
			 ClaDepartamento = @PnClaDepartamento AND
			 IdCelda = @psClaCelda 
		   END

		  ELSE
	   IF  EXISTS ( SELECT 1 FROM ASWSch.AswRelTurnoCeldaExcepciones
	   WHERE
	       ClaUbicacion = @pnClaUbicacion AND
		  ClaTurno = @PnClaTurno AND
		  ClaDepartamento = @PnClaDepartamento AND
		  IdCelda = @psClaCelda AND
		   BajaLogica =0 )
	   BEGIN
	   RAISERROR('Can not double the turn.',16, 1)
			   RETURN
	   END
		ELSE
	    INSERT INTO  ASWSch.AswRelTurnoCeldaExcepciones 
		  (ClaUbicacion,
		  ClaTurno, 
		  ClaDepartamento, 
		  IdCelda,
		  NomCelda,
		  HoraInicio, 
		  HoraFin,
		  BajaLogica,
		  FechaUltimaMod,
		  NombrePcMod,
		  ClausuarioMod) 
	   VALUES
		  (@pnClaUbicacion,
		  @PnClaTurno,
		  @PnClaDepartamento,
		  @psClaCelda, 
		  @psClaCelda,
		  CAST(@pdHoraInicio AS TIME),
		  CAST(@pdHoraFin  AS TIME),
		  @pnBajaLogica,
		  GETDATE(),
		  @psNombrePcMod,
		  @pnClausuarioMod)
		 
		   END

	   -----------Actualiza-------------------- 
	   IF @pnAccionSP =2
		   BEGIN
		   UPDATE  ASWSch.AswRelTurnoCeldaExcepciones
		  SET 
			 ClaTurno =@PnClaTurno, 
			 ClaDepartamento =@PnClaDepartamento,
			 IdCelda =@psClaCelda,
			 NomCelda =@psClaCelda, 
			 HoraInicio =  @pdHoraInicio, 
			 HoraFin = @pdHoraFin,
			 BajaLogica = 0,
			 FechaUltimaMod = GETDATE(),
			 NombrePcMod= @psNombrePcMod,
			 ClausuarioMod= @pnClausuarioMod
		   WHERE 
			 ClaUbicacion = @pnClaUbicacion AND
			 ClaTurno = @PnClaTurno AND
			 ClaDepartamento = @PnClaDepartamento AND
			 IdCelda = @psClaCelda 
		   END
		   ----Eliminar-------
		   IF @pnAccionSP =3
		   BEGIN

		   UPDATE  ASWSch.AswRelTurnoCeldaExcepciones
		  SET 
			 ClaTurno =@PnClaTurno, 
			 ClaDepartamento =@PnClaDepartamento,
			 IdCelda =@psClaCelda,
			 NomCelda =@psClaCelda, 
			 HoraInicio =  @pdHoraInicio, 
			 HoraFin = @pdHoraFin,
			 BajaLogica = 1,
			 FechaUltimaMod = GETDATE(),
			 NombrePcMod= @psNombrePcMod,
			 ClausuarioMod= @pnClausuarioMod
		   WHERE 
			 ClaUbicacion = @pnClaUbicacion AND
			 ClaTurno = @PnClaTurno AND
			 ClaDepartamento = @PnClaDepartamento AND
			 IdCelda = @psClaCelda 
			 
			 

		   END
			END




