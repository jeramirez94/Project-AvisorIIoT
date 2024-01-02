--USE [ASW]
--GO
/****** Object:  StoredProcedure [AswSch].[ASW_CU12_Pag1_Grid_NAdmTurnos_Sel]    Script Date: 17/01/2023 10:55:59 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


--EXEC ASWSch.ASW_CU12_Pag1_Grid_NAdmTurnos_Sel  68,0

ALTER  PROCEDURE [AswSch].[ASW_CU12_Pag1_Grid_NAdmTurnos_Sel] 
    @pnClaUbicacion INT,
    @pnSIBajaLogica INT
    
   

AS
BEGIN  
    
	SELECT  DISTINCT
		a.NomDepartamento,
		c.ClaDepartamento, 
		b.NomTurno,
		c.ClaTurno,
		b.Duracion as  DuracionN,
		CAST(c.HoraInicio AS DATETIME) as HoraInicio,
		CAST(c.HoraFin AS DATETIME) as HoraFin,
		c.BajaLogica as ValorBajaL,
		c.BajaLogica,
		c.IdCelda,
		d.NomWorkCenter as NomCelda,
		c.IdCelda as ClaCelda,
		c.IdCelda as GClaCelda 
	FROM ASWSch.AswRelTurnoCeldaExcepciones c WITH(NOLOCK)
	INNER JOIN  AswSch.AswCatDepartamentoVw a WITH(NOLOCK)
		ON c.ClaDepartamento = a.ClaDepartamento
	INNER JOIN AswSch.AswCatTurno b WITH(NOLOCK)
		ON b.ClaTurno = c.ClaTurno
	INNER JOIN AswSch.AswCatWorkCenterVw d WITH(NOLOCK)
		ON c.IdCelda = d.IdWorkCenter  
	WHERE c.BajaLogica  = CASE WHEN @pnSIBajaLogica = 1 THEN  c.BajaLogica ELSE 0 END
	ORDER BY BajaLogica ASC, a.NomDepartamento, b.NomTurno, d.NomWorkCenter 
	  
    END  







