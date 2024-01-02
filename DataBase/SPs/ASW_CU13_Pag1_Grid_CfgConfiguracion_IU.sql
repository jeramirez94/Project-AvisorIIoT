USE [ASW]
GO
/****** Object:  StoredProcedure [AswSch].[ASW_CU13_Pag1_Grid_CfgConfiguracion_IU]    Script Date: 14/11/2022 12:52:09 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


--EXEC StoredProcedure ASWSch.ASW_CU13_Pag1_Grid_CfgConfiguracion_IU  

ALTER PROC [AswSch].[ASW_CU13_Pag1_Grid_CfgConfiguracion_IU]
	   @pnClaUbicacion INT,
	   @pnClaConfiguracion INT,
	   @psClaveConfiguracion   VARCHAR(15),
	   @psDescConfiguracion VARCHAR(250),
	   @pnValor1 INT,
	   @pnValor2 INT,
	   @pnValor3 INT,
	   @psSvalor1 VARCHAR(250),
	   @psSvalor2 VARCHAR(250),
	   @psSvalor3 VARCHAR(250),
	   @pnNumero1  FLOAT,
	   @pnNumero3  FLOAT,
	   @pnNumero2  FLOAT,
	   @pdFecha1  DATETIME,
	   @pdFecha2  DATETIME,
	   @pdFecha3  DATETIME,
	   @psNombrePcMod VARCHAR(64),
	   @pnClausuarioMod INT,
	   @pnAccionSp INT=0,
	   @pnBajaLogica INT = 0,
	   @pnValorBaja INT =1

AS
BEGIN
    DECLARE 
        @nConsecutivo INT,
	   @pnFechaBajaLogica DATETIME,
	   @sEdbMsg VARCHAR(100)


	     IF ISNULL (@psDescConfiguracion, '') = ''
	   BEGIN
		  SET @sEdbMsg  = 'You have not selected Configuration description.'
			 RAISERROR( @sEdbMsg, 16, 1)
			 RETURN
	   END


	 ---------------------------------------------------------------------
	IF @pnAccionSP =1
 	  BEGIN
	  IF   EXISTS ( SELECT 1 FROM AswSch.ASWCfgConfiguracion WITH(NOLOCK)
	   WHERE
		  ClaUbicacion = @pnClaUbicacion AND
		  DescConfiguracion =@psDescConfiguracion AND
		  BajaLogica = 1)
		  BEGIN
	 UPDATE AswSch.ASWCfgConfiguracion 
	   SET 
		  DescConfiguracion = @psDescConfiguracion,
		  Valor1 = @pnValor1,
		  Valor2 = @pnValor2,
		  Valor3 = @pnValor3,
		  Svalor1 = @psSvalor1,
		  Svalor2 = @psSvalor2,
		  Svalor3 = @psSvalor3,
		  Numero1 = @pnNumero1,
		  Numero2 = @pnNumero2,
		  Numero3 = @pnNumero3,
		  Fecha1 = @pdFecha1,
		  Fecha2 = @pdFecha2,
		  Fecha3 = @pdFecha3,
		  FechaUltimaMod = GETDATE(),
		  NombrePcMod = @psNombrePcMod,
		  ClausuarioMod = @pnClausuarioMod,
		  BajaLogica=0,		   
		  FechaBajaLogica= CASE WHEN BajaLogica=0 and @pnBajaLogica=1 THEN GETDATE() ELSE fechaBajaLogica END,
		  ClaveConfiguracion = @psClaveConfiguracion
	    WHERE 
		  ClaUbicacion = @pnClaUbicacion AND
		  DescConfiguracion =@psDescConfiguracion

          END
	        ELSE
	    BEGIN
	   IF   EXISTS ( SELECT 1 FROM AswSch.ASWCfgConfiguracion WITH(NOLOCK)
	   WHERE
            DescConfiguracion =@psDescConfiguracion AND
		  BajaLogica = 0)
		  
	   BEGIN
		  RAISERROR('The Description is already registered, Please Verify.',16, 1)
		  RETURN
	   END
	    ELSE
	    BEGIN
	  SELECT @nConsecutivo = ISNULL(MAX(ClaConfiguracion), 0) + 1 FROM AswSch.ASWCfgConfiguracion WITH(NOLOCK) 
		 WHERE ClaUbicacion = @pnClaUbicacion

       INSERT INTO AswSch.ASWCfgConfiguracion 
		   (ClaUbicacion,
		   ClaConfiguracion,
		   DescConfiguracion,
		   Valor1,
		   Valor2,
		   Valor3,
		   Svalor1,
		   Svalor2,
		   Svalor3,
		   Numero1,
		   Numero2,
		   Numero3,
		   Fecha1,
		   Fecha2,
		   Fecha3,
		   FechaUltimaMod,
		   NombrePcMod,
		   ClausuarioMod,
		   BajaLogica,
		   FechaBajaLogica,
		   ClaveConfiguracion) 
	    VALUES
		  (@pnClaUbicacion,
		   @nConsecutivo,
		   @psDescConfiguracion,
		   @pnValor1,
		   @pnValor2,
		   @pnValor3,
		   @psSvalor1,
		   @psSvalor2,
		   @psSvalor3,
		   @pnNumero1,
		   @pnNumero2,
		   @pnNumero3,
		   @pdFecha1,
		   @pdFecha2,
		   @pdFecha3,
		   GETDATE(),
		   @psNombrePcMod,
		   @pnClausuarioMod,
		   @pnBajaLogica,
	        CASE WHEN @pnBajaLogica= 1 THEN GETDATE() ELSE null END,
		   @psClaveConfiguracion)
		  END
		  END

			 END
		 	   ----------Actualiza-----------
	   IF @pnAccionSP =2
	    BEGIN
	     IF   EXISTS ( SELECT 1 FROM AswSch.ASWCfgConfiguracion WITH(NOLOCK)
	   WHERE
            DescConfiguracion =@psDescConfiguracion AND
		  BajaLogica = 0)
		  
	   BEGIN
		  RAISERROR('The Description is already registered, Please Verify.',16, 1)
		  RETURN
	   END
	    ELSE
	    
	    UPDATE AswSch.ASWCfgConfiguracion 
	   SET 
		  DescConfiguracion = @psDescConfiguracion,
		  Valor1 = @pnValor1,
		  Valor2 = @pnValor2,
		  Valor3 = @pnValor3,
		  Svalor1 = @psSvalor1,
		  Svalor2 = @psSvalor2,
		  Svalor3 = @psSvalor3,
		  Numero1 = @pnNumero1,
		  Numero2 = @pnNumero2,
		  Numero3 = @pnNumero3,
		  Fecha1 = @pdFecha1,
		  Fecha2 = @pdFecha2,
		  Fecha3 = @pdFecha3,
		  FechaUltimaMod = GETDATE(),
		  NombrePcMod = @psNombrePcMod,
		  ClausuarioMod = @pnClausuarioMod,
		  BajaLogica=0,		   
		  FechaBajaLogica= CASE WHEN BajaLogica=0 and @pnBajaLogica=1 THEN GETDATE() ELSE fechaBajaLogica END, 
		  ClaveConfiguracion = @psClaveConfiguracion
	    WHERE 
		  ClaUbicacion = @pnClaUbicacion AND
		  ClaConfiguracion = @pnClaConfiguracion
	
		 END
	    -----------------Eliminar-------------------
		 IF @pnAccionSP =3
		 BEGIN
		  UPDATE AswSch.ASWCfgConfiguracion
	   SET 
		  DescConfiguracion = @psDescConfiguracion,
		  Valor1 = @pnValor1,
		  Valor2 = @pnValor2,
		  Valor3 = @pnValor3,
		  Svalor1 = @psSvalor1,
		  Svalor2 = @psSvalor2,
		  Svalor3 = @psSvalor3,
		  Numero1 = @pnNumero1,
		  Numero2 = @pnNumero2,
		  Numero3 = @pnNumero3,
		  Fecha1 = @pdFecha1,
		  Fecha2 = @pdFecha2,
		  Fecha3 = @pdFecha3,
		  FechaUltimaMod = GETDATE(),
		  NombrePcMod = @psNombrePcMod,
		  ClausuarioMod = @pnClausuarioMod,
		  BajaLogica=1,		   
		  FechaBajaLogica = GETDATE(),
		  ClaveConfiguracion = @psClaveConfiguracion

	    WHERE 
		  ClaUbicacion = @pnClaUbicacion AND
		  ClaConfiguracion = @pnClaConfiguracion
	    
		  END       

	 
	   END




