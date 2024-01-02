USE [ASW]
GO
/****** Object:  StoredProcedure [AswSch].[ASW_CU13_Pag1_Grid_CfgConfiguracion_Sel]    Script Date: 14/11/2022 12:53:57 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO







--EXEC ASWSch.ASW_CU13_Pag1_Grid_CfgConfiguracion_Sel 68 ,1

ALTER PROCEDURE [AswSch].[ASW_CU13_Pag1_Grid_CfgConfiguracion_Sel]  
      @pnClaUbicacion INT,
	 @pnSBajaLogica INT,
	 @psTxDescripcion VARCHAR(100)

AS
BEGIN  
    
	   SELECT
		  TC.ClaConfiguracion as ClaConfiguracion,
		  TC.ClaveConfiguracion as ClaveConfiguracion, 	  
		  TC.DescConfiguracion as DescConfiguracion,
		  TC.Valor1 as Valor1,
		  TC.Valor2 as Valor2,
		  TC.Valor3 as Valor3, 
		  TC.Svalor1 as Svalor1,
		  TC.Svalor2 as Svalor2, 
		  TC.Svalor3 as Svalor3,
		  TC.Numero1 as Numero1,
		  TC.Numero2 as Numero2,
		  TC.Numero3 as Numero3, 
		  TC.Fecha1  as Fecha1,
		  TC.Fecha2  as Fecha2, 
		  TC.Fecha3 as  Fecha3,
		  TC.BajaLogica,
		  TC.BajaLogica as ValorBaja 
        FROM [AswSch].[ASWCfgConfiguracion] TC WITH(NOLOCK)
	   WHERE TC.ClaUbicacion = @pnClaUbicacion AND
		    @psTxDescripcion IS NULL OR TC.DescConfiguracion LIKE '%'  + @psTxDescripcion + '%' AND
	         TC.BajaLogica  = CASE WHEN @pnSBajaLogica = 1 THEN  TC.BajaLogica ELSE 0 END
		 ORDER BY BajaLogica ASC,TC.ClaConfiguracion 

		 
	   
	   	
 
END  







