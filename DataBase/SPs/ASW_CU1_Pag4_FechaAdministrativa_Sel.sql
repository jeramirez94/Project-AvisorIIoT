--USE [ASW]
--GO
/****** Object:  StoredProcedure [AswSch].[ASW_CU1_Pag4_FechaAdministrativa_Sel]    Script Date: 17/01/2023 10:26:27 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROC [AswSch].[ASW_CU1_Pag4_FechaAdministrativa_Sel] 
@PdFechaHora datetime,
@PnClaDepartamento int
AS 
BEGIN 

DECLARE @dFecha date,
		@tHora time,
		@nCruceDia int,
		@nProduccionDiaInicio int,
		@dFechaAdministrativa date,
		@tHoraInicio time,
		@tHoraFin time

SELECT @dFecha = CAST(@PdFechaHora as DATE), @tHora = CAST(@PdFechaHora as TIME)

DECLARE @Tbl_Turno TABLE (
	ClaTurno int,
	NomTurno varchar(10), 
	NomDepartamento varchar(50),
	Duracion int,
	horaInicio time,
	horaFin time,
	produccionDiaInicio int,
	cruceDia int, 
	FechaAdministrativa date
)

INSERT INTO @Tbl_Turno (ClaTurno,NomTurno,NomDepartamento,Duracion,
						horaInicio,horaFin,produccionDiaInicio,cruceDia) 
SELECT	T.ClaTurno 
		,T.NomTurno
		,D.NomDepartamento
		,T.Duracion 
		,RTD.horaInicioTurno  
		,RTD.horaFinTurno 
		,RTD.produccionDiaInicio
		,CASE WHEN RTD.horaInicioTurno > RTD.horaFinTurno THEN 1 ELSE 0 END
FROM ASWSch.AswCatTurno T
	JOIN ASWSch.AswRelTurnoDepartamentoHorario RTD
		ON T.ClaTurno = RTD.ClaTurno
	JOIN ASWSch.AswCatDepartamentoVw D
		ON D.ClaDepartamento = RTD.ClaDepartamento
WHERE T.BajaLogica = 0 
	AND D.BajaLogica = 0
	AND RTD.BajaLogica = 0
	AND RTD.ClaDepartamento = @PnClaDepartamento
	AND (
			( 
				(RTD.horaInicioTurno > RTD.horaFinTurno) 
				AND @tHora  NOT BETWEEN  RTD.horaFinTurno AND RTD.horaInicioTurno
			)
			OR
			(
				(RTD.horaInicioTurno < RTD.horaFinTurno) 
				AND @tHora BETWEEN RTD.horaInicioTurno AND RTD.horaFinTurno 
			)
		)

	
SELECT   @nCruceDia = cruceDia
		,@nProduccionDiaInicio = produccionDiaInicio
		,@tHoraInicio = horaInicio
		,@tHoraFin = horaFin
FROM @Tbl_Turno
 
 
IF(@nCruceDia = 1)
BEGIN
	IF(@nProduccionDiaInicio = 1)
	BEGIN
	--PRUDUCCION PERTENECE AL DIA DE INICIO DEL TURNO
		IF(@tHora >= @tHoraInicio)
		BEGIN
			--SI HORA ES MAYOR A HORAINICIO -> ESTA EN EL MISMO DIA QUE EMPEZO EL TURNO
			SET @dFechaAdministrativa = @dFecha;
		END
		ELSE
		BEGIN
			IF(@tHora < @tHoraFin)
			BEGIN
				--SI HORA ES MENOR A HORAFIN -> ESTA EN EL DIA SIGUIENTE Y HAY QUE RESTAR UN DIA A LA FECHA
				SET @dFechaAdministrativa = DATEADD(day,-1,@dFecha)
			END
		END
	END
	ELSE
	BEGIN
	--PRODUCCION PERTENECE AL DIA DE FINALIZACION DEL TURNO
		IF(@tHora > @tHoraInicio)
		BEGIN
			--SI HORA ES MAYOR A HORAINICIO -> ES EL MISMO DIA DE INICIO DEL TURNO Y HAY QUE AUMENTAR UN DIA
			SET @dFechaAdministrativa = DATEADD(day,1,@dFecha)
		END
		ELSE
		BEGIN
			IF(@tHora < @tHoraFin)
			BEGIN
			--SI HORA ES MENOR A HORAFIN -> ES EL DIA QUE TERMINA EL TURNO 
				SET @dFechaAdministrativa = @dFecha
			END	
		END 
	END 	
END 
ELSE
BEGIN
--NO HAY CRUCE DE DIA
	SET @dFechaAdministrativa = @dFecha
END
UPDATE @Tbl_Turno 
SET FechaAdministrativa = @dFechaAdministrativa

SELECT  ClaTurno,
		NomTurno, 
		NomDepartamento,
		Duracion,
		horaInicio,
		horaFin,
		produccionDiaInicio,
		cruceDia, 
		fechaAdministrativa,
		@PdFechaHora AS fechaReal
FROM @Tbl_Turno

END

		


		
