USE [ASW]
GO
/****** Object:  StoredProcedure [AswSch].[ASW_CU170_Pag1_AlertaParo]    Script Date: 10/03/2023 03:26:53 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*==========================================
* CU: 170.1
* Objetivo: Emitir alerta de paro en base a los datos de la recolección
* Autor: José Carlos Arias Rodríguez
* Fecha: 2022-03-10
* EXEC: [AswSch].[ASW_CU170_Pag1_AlertaParo]
*========================================== */
ALTER PROC [AswSch].[ASW_CU170_Pag1_AlertaParo]
@PnClaTurno INT
,@PnClaUbicacion INT
,@PnClaDepartamento INT
,@PsIdWorkCenter VARCHAR(30)
,@PdFechaAdm DATE
,@PdFechaArranquePrevio DATETIME

AS
BEGIN
DECLARE 
	@tFechaHoraInicioTurno DATETIME
	,@tFechaHoraFinTurno DATETIME
	,@nTiempoMicroParo INT
	,@tFechaUltimoParo DATETIME
	,@tFechaUltimoOn DATETIME
	,@tFechaUltimoProd DATETIME
	,@nDiferenciaProdParo INT
	,@nDiferenciaParoActual INT
	,@tParoMargenSuperior DATETIME
	,@tParoMargenInferior DATETIME
	
	SET @tFechaHoraInicioTurno = (SELECT [AswSch].[ASWGetInicioTurno] (@PnClaUbicacion,@PdFechaAdm,@PnClaTurno,@PnClaDepartamento))
	
	SET @tFechaHoraFinTurno = (SELECT [AswSch].[ASWGetFinTurno] (@PnClaUbicacion,@PdFechaAdm,@PnClaTurno,@PnClaDepartamento))
   
	SET @nTiempoMicroParo = (SELECT [Valor1] FROM [AswSch].[ASWCfgConfiguracion] WHERE ClaConfiguracion = 3)
	 
	SET @tFechaUltimoParo = (SELECT TOP (1) [FechaHoraInicio] FROM [AswSch].[AswRecBitParos] WHERE ClaMaquina = @PsIdWorkCenter AND FechaHoraInicio > @PdFechaArranquePrevio AND FechaHoraInicio <= @tFechaHoraFinTurno ORDER BY FechaHoraInicio)

	SET @tFechaUltimoOn = (SELECT TOP (1) [FechaHoraMaquina] FROM [AswSch].[AswRecBitVariable] WHERE ClaMaquina = @PsIdWorkCenter AND ClaVariable = 1 AND Valor = 1 AND FechaHoraMaquina > @tFechaHoraInicioTurno AND FechaHoraMaquina <= @tFechaHoraFinTurno ORDER BY FechaHoraMaquina DESC)

	--Se obtiene rango menor a 5 segundos del ultimo paro

	SET @tParoMargenInferior = (SELECT dateadd(SECOND, -90,@tFechaUltimoParo))

	--Se obtiene rango mayor a 5 segundos del ultimo paro
	SET @tParoMargenSuperior = (SELECT dateadd(SECOND, 90,@tFechaUltimoParo))
	
	--Se guarda fecha de fin de ultimo producto terminado
	SET @tFechaUltimoProd = (SELECT TOP (1) [FechaHoraFin] FROM [AswSch].[AswRecBitProduccion] WHERE ClaMaquina = @PsIdWorkCenter AND FechaHoraFin IS NOT NULL AND FechaHoraFin >= @tParoMargenInferior AND FechaHoraFin <= @tParoMargenSuperior ORDER BY FechaHoraInicio)
	

	--Se estima diferencia en segundos entre último paro registrado y el último fin de producto
		SET @nDiferenciaProdParo = (SELECT DATEDIFF(SS, @tFechaUltimoParo, @tFechaUltimoProd))
		
    --Se estima diferencia en minutos entre fecha actual y el último paro registrado
		SET @nDiferenciaParoActual = (SELECT DATEDIFF(MI, @tFechaUltimoParo, GETDATE()))
		

	--Condición para evaluar si la diferencia entre arranque de paro es mayor a 5 segundos y la diferencia entre paro y fecha actual es de 7 minutos se envía información
		IF (@tFechaUltimoParo > @PdFechaArranquePrevio) AND (@nDiferenciaParoActual > 15) AND (@tFechaUltimoProd IS NOT NULL)
					
					BEGIN
						SELECT TOP (1) [Evento]
						  ,[EventoOrigen]
						  ,[FechaHoraInicio] AS FechaHoraMaquina
						  ,[FechaHoraFin]
						  ,[ClaMaquina] AS ClaMaquina
						  ,[ClaProducto]
						  ,[Duracion]
						  ,[ClaParo]
						  ,[ClaUbicacion]
						  ,[ClaArea]
						  ,[FechaUltimaMod]
						FROM [AswSch].[AswRecBitParos]
						WHERE ClaMaquina = @PsIdWorkCenter
						AND FechaHoraInicio > @PdFechaArranquePrevio
						AND FechaHoraInicio <= @tFechaHoraFinTurno
						ORDER BY FechaHoraInicio
					END

		--Al no cummplirse condición anterior se verifica que el tiempo de paro actual sea mayor al tiempo de microparo por configuración
		IF (@tFechaUltimoParo > @PdFechaArranquePrevio) AND (@nDiferenciaParoActual > 15) AND (@tFechaUltimoProd IS NULL)
				
				BEGIN
						SELECT TOP (1) [Evento]
						  ,[EventoOrigen]
						  ,[FechaHoraInicio] AS FechaHoraMaquina
						  ,[FechaHoraFin]
						  ,[ClaMaquina] AS ClaMaquina
						  ,[ClaProducto]
						  ,[Duracion]
						  ,[ClaParo]
						  ,[ClaUbicacion]
						  ,[ClaArea]
						  ,[FechaUltimaMod]
						FROM [AswSch].[AswRecBitParos]
						WHERE ClaMaquina = @PsIdWorkCenter
						AND FechaHoraInicio > @PdFechaArranquePrevio
						AND FechaHoraInicio <= @tFechaHoraFinTurno
						ORDER BY FechaHoraInicio
				END
			    	
		IF (@tFechaUltimoParo < @PdFechaArranquePrevio)
				BEGIN
				SELECT NULL
				END

END
