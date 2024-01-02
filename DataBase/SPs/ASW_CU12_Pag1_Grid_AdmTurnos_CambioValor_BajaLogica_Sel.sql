--USE [ASW]
--GO
/****** Object:  StoredProcedure [AswSch].[ASW_CU12_Pag1_Grid_AdmTurnos_CambioValor_BajaLogica_Sel]    Script Date: 17/01/2023 10:49:27 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--EXEC  AswSch.ASW_CU12_Pag1_Grid_AdmTurnos_CambioValor_BajaLogica_Sel
ALTER PROCEDURE  [AswSch].[ASW_CU12_Pag1_Grid_AdmTurnos_CambioValor_BajaLogica_Sel] 


         @pnClaUbicacion Int,
         @pnBajasSn  Int =1,
	    @pnBajaLogica int,
	    @pnShowI INT
AS
BEGIN

    IF @pnShowI = 1
            SELECT 

		 a.NomDepartamento as NomDepartamento, 
		 b.NomTurno as NomTurno,
		 b.Duracion as  Duracion,
		 CAST(c.HoraInicioTurno AS DATETIME) as HoraInicioTurno,
		 CAST(c.HoraFinTurno AS DATETIME) as HoraFinTurno
		
	FROM AswSch.AswRelTurnoDepartamentoHorario c with(nolock)
		  INNER JOIN AswSch.AswCatDepartamentoVw a with(nolock)
		  ON c.ClaDepartamento = a.ClaDepartamento 
		  INNER JOIN AswSch.AswCatTurno b with(nolock)
		  ON b.ClaTurno = c.ClaTurno 
		  WHERE c.BajaLogica = 0


    ELSE
        SELECT 	

		 a.NomDepartamento as NomDepartamento, 
		 b.NomTurno as NomTurno,
		 b.Duracion as  Duracion,
		 CAST(c.HoraInicioTurno AS DATETIME) as HoraInicioTurno,
		 CAST(c.HoraFinTurno AS DATETIME) as HoraFinTurno
		
	    FROM AswSch.AswRelTurnoDepartamentoHorario c with(nolock)
			 INNER JOIN AswSch.AswCatDepartamentoVw a with(nolock)
			 ON c.ClaDepartamento = a.ClaDepartamento 
			 INNER JOIN AswSch.AswCatTurno b with(nolock)
			 ON b.ClaTurno = c.ClaTurno 
			 WHERE c.BajaLogica = 1

END









