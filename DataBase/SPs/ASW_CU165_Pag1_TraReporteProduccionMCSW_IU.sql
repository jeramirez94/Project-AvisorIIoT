--USE [ASW]
--GO
/****** Object:  StoredProcedure [AswSch].[ASW_CU165_Pag1_TraReporteProduccionMCSW_IU]    Script Date: 15/11/2022 12:11:49 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
* MRODRIGUEZC
* 2020/07/01
* guarda la informacion de MP
*/
ALTER PROCEDURE [AswSch].[ASW_CU165_Pag1_TraReporteProduccionMCSW_IU]	
		@pnId INT
		,@psIdCelda VARCHAR(30)
		,@ptFechaAdmScada DATE
		,@pnClaTurno SMALLINT
		,@pnTiempoTurno NUMERIC(4,2)
		,@pnOrdenesTurno SMALLINT
		,@ptFechaHoraInicioProd DATETIME
		,@ptFechaHoraFinProd DATETIME
		,@pnIdComponente1 SMALLINT
		,@pnTiempoParo1 NUMERIC(12,2)
		,@pnIdComponente2 SMALLINT
		,@pnTiempoParo2 NUMERIC(12,2)
		,@pnIdComponente3 SMALLINT
		,@pnTiempoParo3 NUMERIC(12,2)
		,@pnIdComponente4 SMALLINT
		,@pnTiempoParo4 NUMERIC(12,2)
		,@pnIdComponente5 SMALLINT
		,@pnTiempoParo5 NUMERIC(12,2)
		,@pnIdComponente6 SMALLINT
		,@pnTiempoParo6 NUMERIC(12,2)
		,@pnIdComponente7 SMALLINT
		,@pnTiempoParo7 NUMERIC(12,2)
		,@pnIdComponente8 SMALLINT
		,@pnTiempoParo8 NUMERIC(12,2)
		,@pnIdComponente9 SMALLINT
		,@pnTiempoParo9 NUMERIC(12,2)
		,@pnIdComponente10 SMALLINT
		,@pnTiempoParo10 NUMERIC(12,2)
		,@pnCajasProducidas SMALLINT
		,@pnCajasSkid SMALLINT
		,@pnClaArticulo INT
		,@pnPesoScrap NUMERIC(5,2)
		--control
		,@pnClaTipoRegistro TINYINT --1 check in, 3 checkout
		,@pnClaEstatusReplica TINYINT  --1 nuevo, 2 replicado
		,@psEvento VARCHAR(15)
		,@ptFechaUltimaMod DATETIME
		,@psNombrePcMod VARCHAR(64)
		,@pnClaUsuarioMod INT
		,@pnEsManual INT
		,@psComentario VARCHAR(400)
AS
BEGIN

	--TODO:corregir bug que recibe claCelda en 0
	IF (@psIdCelda = 0 AND @pnEsManual = 1)
	BEGIN
		IF @pnIdComponente1 = 34
		BEGIN
			SET @psIdCelda = 34
		END
		IF @pnIdComponente1 = 610
		BEGIN
			SET @psIdCelda = 35
		END
		IF @pnIdComponente1 = 99
		BEGIN
			SET @psIdCelda = 33
		END
		IF @pnIdComponente1 = 660
		BEGIN
			SET @psIdCelda = 112
		END
	END

	IF EXISTS (SELECT 1 FROM [AswSch].[TraReporteProduccionMCSW] WHERE IdLocal = @pnId AND IdCelda = @psIdCelda)
	BEGIN
		
		UPDATE [AswSch].[TraReporteProduccionMCSW]
		SET [FechaAdmScada] = @ptFechaAdmScada
			,[ClaTurno] = @pnClaTurno
			,[TiempoTurno] = @pnTiempoTurno
			,[OrdenesTurno] = @pnOrdenesTurno
			,[FechaHoraInicioProd] = @ptFechaHoraInicioProd
			,[FechaHoraFinProd] = @ptFechaHoraFinProd
			,[IdComponente1] = @pnIdComponente1
			,[TiempoParo1] = @pnTiempoParo1
			,[IdComponente2] = @pnIdComponente2
			,[TiempoParo2] = @pnTiempoParo2
			,[IdComponente3] = @pnIdComponente3
			,[TiempoParo3] = @pnTiempoParo3
			,[IdComponente4] = @pnIdComponente4
			,[TiempoParo4] = @pnTiempoParo4
			,[IdComponente5] = @pnIdComponente5
			,[TiempoParo5] = @pnTiempoParo5
			,[IdComponente6] = @pnIdComponente6
			,[TiempoParo6] = @pnTiempoParo6
			,[IdComponente7] = @pnIdComponente7
			,[TiempoParo7] = @pnTiempoParo7
			,[IdComponente8] = @pnIdComponente8
			,[TiempoParo8] = @pnTiempoParo8
			,[IdComponente9] = @pnIdComponente9
			,[TiempoParo9] = @pnTiempoParo9
			,[IdComponente10] = @pnIdComponente10
			,[TiempoParo10] = @pnTiempoParo10
			,[CajasProducidas] = @pnCajasProducidas
			,[CajasSkid] = @pnCajasSkid
			,[ClaArticulo] = @pnClaArticulo
			,[PesoScrap] = @pnPesoScrap
			,[ClaTipoRegistro] = @pnClaTipoRegistro
			,[ClaEstatusReplica] = @pnClaEstatusReplica
			,[Evento] = @psEvento
			,[FechaUltimaMod] = @ptFechaUltimaMod
			,[NombrePcMod] = @psNombrePcMod
			,[ClaUsuarioMod] = @pnClaUsuarioMod
			,[EsManual] = @pnEsManual
			,[Comentario] = @psComentario
		WHERE IdLocal = @pnId 
			AND IdCelda = @psIdCelda


	END
	ELSE
	BEGIN
	
		INSERT INTO [AswSch].[TraReporteProduccionMCSW]
			([IdLocal]
			,[IdCelda]
			,[FechaAdmScada]
			,[ClaTurno]
			,[TiempoTurno]
			,[OrdenesTurno]
			,[FechaHoraInicioProd]
			,[FechaHoraFinProd]
			,[IdComponente1]
			,[TiempoParo1]
			,[IdComponente2]
			,[TiempoParo2]
			,[IdComponente3]
			,[TiempoParo3]
			,[IdComponente4]
			,[TiempoParo4]
			,[IdComponente5]
			,[TiempoParo5]
			,[IdComponente6]
			,[TiempoParo6]
			,[IdComponente7]
			,[TiempoParo7]
			,[IdComponente8]
			,[TiempoParo8]
			,[IdComponente9]
			,[TiempoParo9]
			,[IdComponente10]
			,[TiempoParo10]
			,[CajasProducidas]
			,[CajasSkid]
			,[ClaArticulo]
			,[PesoScrap]
			,[ClaTipoRegistro]
			,[ClaEstatusReplica]
			,[Evento]
			,[FechaUltimaMod]
			,[NombrePcMod]
			,[ClaUsuarioMod]
			,[EsManual]
			,[Comentario])
		VALUES(
			@pnId 
			,@psIdCelda 
			,@ptFechaAdmScada 
			,@pnClaTurno 
			,@pnTiempoTurno 
			,@pnOrdenesTurno 
			,@ptFechaHoraInicioProd 
			,@ptFechaHoraFinProd 
			,@pnIdComponente1 
			,@pnTiempoParo1 
			,@pnIdComponente2 
			,@pnTiempoParo2 
			,@pnIdComponente3 
			,@pnTiempoParo3 
			,@pnIdComponente4 
			,@pnTiempoParo4 
			,@pnIdComponente5 
			,@pnTiempoParo5 
			,@pnIdComponente6 
			,@pnTiempoParo6 
			,@pnIdComponente7 
			,@pnTiempoParo7 
			,@pnIdComponente8 
			,@pnTiempoParo8 
			,@pnIdComponente9 
			,@pnTiempoParo9 
			,@pnIdComponente10 
			,@pnTiempoParo10 
			,@pnCajasProducidas 
			,@pnCajasSkid 
			,@pnClaArticulo 
			,@pnPesoScrap 
			--control
			,@pnClaTipoRegistro  --1 check in, 3 checkout
			,@pnClaEstatusReplica --1 nuevo, 2 replicado
			,@psEvento
			,@ptFechaUltimaMod 
			,@psNombrePcMod 
			,@pnClaUsuarioMod 
			,@pnEsManual
			,@psComentario
		)

	END
END