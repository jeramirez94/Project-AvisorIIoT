USE [ASWH]
GO
/****** Object:  StoredProcedure [AswSch].[ASW_CU170_Pag2_UltimoOn]    Script Date: 10/03/2023 03:39:42 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*==========================================
* CU: 170.1
* Objetivo: SP auxiliar para almacenar ultimo encendido de máquina
* Autor: José Carlos Arias Rodríguez
* Fecha: 2022-03-10
* EXEC: [AswSch].[ASW_CU170_Pag2_UltimoOn]
*========================================== */
ALTER PROC [AswSch].[ASW_CU170_Pag2_UltimoOn]
@PnClaTurno INT
,@PnClaUbicacion INT
,@PnClaDepartamento INT
,@PsIdWorkCenter VARCHAR(30)
,@PdFechaAdm DATE

AS
BEGIN
DECLARE 
	@tFechaHoraInicioTurno DATETIME
	,@tFechaHoraFinTurno DATETIME
	,@tFechaUltimoOn DATETIME

	
	
	SET @tFechaHoraInicioTurno = (SELECT [AswSch].[ASWGetInicioTurno] (@PnClaUbicacion,@PdFechaAdm,@PnClaTurno,@PnClaDepartamento))
	SET @tFechaHoraFinTurno = (SELECT [AswSch].[ASWGetFinTurno] (@PnClaUbicacion,@PdFechaAdm,@PnClaTurno,@PnClaDepartamento))
	SET @tFechaUltimoOn = (SELECT TOP (1) [FechaHoraMaquina] FROM [AswSch].[AswRecBitVariable] WHERE ClaMaquina = @PsIdWorkCenter AND ClaVariable = 1 AND Valor = 1 AND FechaHoraMaquina >= @tFechaHoraInicioTurno  AND FechaHoraMaquina <= @tFechaHoraFinTurno ORDER BY FechaHoraMaquina DESC)
    
	SELECT @tFechaUltimoOn AS FechaUltimoOn 

END
