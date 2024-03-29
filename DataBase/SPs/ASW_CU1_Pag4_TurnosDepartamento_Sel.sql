--USE [ASW]
--GO
/****** Object:  StoredProcedure [AswSch].[ASW_CU1_Pag4_TurnosDepartamento_Sel]    Script Date: 17/01/2023 10:38:41 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROC [AswSch].[ASW_CU1_Pag4_TurnosDepartamento_Sel]
	@PnClaDepartamento INT
AS
BEGIN
/*
*	Regresea los turnos configurados para el departamento dado
*/
	SELECT 'ASWLite_CatTurno' as nombretabla
	,keys = 'ClaTurno,ClaDepartamento'
	,fuc = 'fechaUltimaMod'
	,T.ClaTurno 
	,T.NomTurno
	,D.ClaDepartamento
	,D.NomDepartamento
	,T.Duracion 
	,CAST(RTD.horaInicioTurno  AS VARCHAR) as horaInicioTurno
	,CAST(RTD.horaFinTurno  AS VARCHAR) as horaFinTurno
	,RTD.ProduccionDiaInicio
	,convert(varchar,getdate(),121) as fechaUltimaMod
	FROM ASWSch.AswCatTurno T
	JOIN ASWSch.AswRelTurnoDepartamentoHorario RTD
	ON T.ClaTurno = RTD.ClaTurno
	JOIN ASWSch.AswCatDepartamentoVw D
	ON D.ClaDepartamento = RTD.ClaDepartamento
	WHERE T.BajaLogica = 0 
	AND D.BajaLogica = 0
	AND RTD.BajaLogica = 0
	AND RTD.ClaDepartamento = @PnClaDepartamento

END

