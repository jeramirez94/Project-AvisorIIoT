--USE [ASW]
--GO
/****** Object:  StoredProcedure [AswSch].[ASW_CU12_Pag1_Grid_AdmTurnos_Sel]    Script Date: 17/01/2023 10:53:30 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--EXEC ASWSch.ASW_CU12_Pag1_Grid_AdmTurnos_Sel

ALTER PROCEDURE [AswSch].[ASW_CU12_Pag1_Grid_AdmTurnos_Sel] 
    @pnClaUbicacion INT,
    @pnSIBajaLogica INT
AS
BEGIN  
      
      SELECT 	
		 a.NomDepartamento as NomDepartamento, 
		 c.ClaTurno,
		 b.NomTurno,
		 b.Duracion as  Duracion,
		 CAST(c.HoraInicioTurno AS DATETIME) as HoraInicioTurno,
		 CAST(c.HoraFinTurno AS DATETIME) as HoraFinTurno,
		 c.ClaDepartamento as ClaDepartamento,
		 c.BajaLogica as ValorBaja,
		 c.BajaLogica,
		 d.NomProduccionInicio  as  NomProduccionInicio,
		 c.ProduccionDiaInicio  as ClaProduccionInicio
	 FROM ASWSch.AswRelTurnoDepartamentoHorario c WITH(NOLOCK)
	INNER JOIN AswSch.AswCatDepartamentoVw a WITH(NOLOCK)
		ON c.ClaDepartamento = a.ClaDepartamento 
	INNER JOIN AswSch.AswCatTurno b WITH(NOLOCK)
		ON b.ClaTurno = c.ClaTurno
			INNER JOIN AswSch.AswCatProduccionInicio d WITH(NOLOCK)
		ON c.ProduccionDiaInicio = d.ClaProduccionInicio
	WHERE	c.ClaUbicacion	= @pnClaUbicacion AND
		c.BajaLogica  = CASE WHEN @pnSIBajaLogica = 1 THEN  c.BajaLogica ELSE 0 END
	ORDER BY BajaLogica ASC, a.NomDepartamento, b.NomTurno
	   	
 
END  











