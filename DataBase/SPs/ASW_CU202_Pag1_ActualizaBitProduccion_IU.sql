USE [ASWH]
GO
/****** Object:  StoredProcedure [AswSch].[ASW_CU202_Pag1_ActualizaBitProduccion_IU]    Script Date: 23/05/2023 01:18:06 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*==========================================
* CU: 202.1
* Objetivo: Recibir los datos de la recoleccion de la bitacora de produccion del sistema de recoleccion complementada 
*			con los datos del sistema de gestion de la produccion
* Autor: mrodriguezc
* Fecha: 2022-01-13
* EXEC: [AswSch].[ASW_CU202_Pag2_BitProduccion_IU]
* MRODRIGUEZC - 20230405 - Se agrega IdMultiplo para soportar la produccion en paralelo de maquinas que producen
*							más de una unidad simultaneamente. Si el idCaja es nulo se genera en automatico.
*NGALAZ - 20230523 - Agrego condicion para no considerar registros manuales 
*========================================== */
ALTER PROC [AswSch].[ASW_CU202_Pag1_ActualizaBitProduccion_IU]
	   @pnClaUbicacion INT
      ,@pnIdBitProduccion INT
	  ,@psClaPuntoMedicion VARCHAR(30) = NULL
	  ,@pnAnio INT = NULL
	  ,@pnIdMultiplo INT = 1
      ,@psIdCelda VARCHAR(30)
      ,@pnIdComponente VARCHAR(30)
      ,@pnIdPO INT
      ,@pnIdCaja INT
      ,@pnClaArticulo INT
      ,@psClaveCorte VARCHAR(15)
      ,@ptFechaHoraInicio DATETIME
      ,@ptFechaHoraFin DATETIME
      ,@pnDuracionSegundos  NUMERIC(8,2)
      ,@pnClavosInicio INT
      ,@pnClavosFin INT
      ,@pnCajasInicio INT
      ,@pnCajasFin INT
	  ,@pnEsPNC INT
      ,@pnCajasXHora NUMERIC(8,2)
	  ,@pnMultiplo INT = 1
      ,@pnClaTurno INT
      ,@ptFechaAdm DATETIME
      ,@pnHora INT
      ,@pnClaEstatusReplica INT
      ,@pnBajaLogica INT
      ,@ptFechaBajaLogica DATETIME
      ,@pnClaUsuarioMod INT
      ,@psNombrePCMod VARCHAR(64)
      ,@ptFechaUltimaMod DATETIME
AS
BEGIN

	IF EXISTS (SELECT 1 FROM [AswSch].[AswBitBitacoraProduccion]
			   WHERE ClaUbicacion = @pnClaUbicacion 
					AND IdComponente = @pnIdComponente 
					AND IdBitProduccion = @pnIdBitProduccion
					AND IdMultiplo = @pnIdMultiplo)
	BEGIN
		UPDATE [AswSch].[AswBitBitacoraProduccion]
	    SET [ClaPuntoMedicion] = @psClaPuntoMedicion
		   ,[Anio] = @pnAnio
		   ,[IdCelda] = @psIdCelda
		   ,[IdPO] = @pnIdPO
		   --,[IdCaja] = @pnIdCaja
		   ,[ClaArticulo] = @pnClaArticulo
		   ,[ClaveCorte] = @psClaveCorte
		   ,[FechaHoraInicio] = @ptFechaHoraInicio
		   ,[FechaHoraFin] = @ptFechaHoraFin
		   ,[DuracionSegundos] = @pnDuracionSegundos
		   ,[ClavosInicio] = @pnClavosInicio
		   ,[ClavosFin] = @pnClavosFin
		   ,[CajasInicio] = @pnCajasInicio
		   ,[CajasFin] = @pnCajasFin
		   ,[EsPNC] = @pnEsPNC
		   ,[CajasXHora] = @pnCajasXHora
		   ,[Multiplo] = @pnMultiplo
		   ,[ClaTurno] = @pnClaTurno
		   ,[FechaAdm] = @ptFechaAdm
		   ,[Hora] = @pnHora
		   ,[ClaEstatusReplica] = @pnClaEstatusReplica
		   ,[BajaLogica] = @pnBajaLogica
		   ,[FechaBajaLogica] = @ptFechaBajaLogica
		   ,[ClaUsuarioMod] = @pnClaUsuarioMod
		   ,[NombrePCMod] = @psNombrePCMod
		   ,[FechaUltimaMod] = @ptFechaUltimaMod
	   WHERE ClaUbicacion = @pnClaUbicacion 
			AND IdComponente = @pnIdComponente
			AND IdBitProduccion = @pnIdBitProduccion
			AND IdMultiplo = @pnIdMultiplo
			AND EsManual = 0 --NO CONSIDERAR UNIDADES MANUALES 
	END
	ELSE
	BEGIN
	
		IF (@pnIdCaja IS NULL)
		BEGIN
			SELECT @pnIdCaja = ISNULL(MAX(IdCaja),0)+1
			FROM [AswSch].[AswBitBitacoraProduccion]
			WHERE ClaUbicacion = @pnClaUbicacion 
				AND IdComponente = @pnIdComponente
				AND IdPO = @pnIdPO
		
		END

		INSERT INTO [AswSch].[AswBitBitacoraProduccion]
           ([ClaUbicacion]
           ,[IdBitProduccion]
		   ,[ClaPuntoMedicion]
		   ,[Anio]
		   ,[IdMultiplo]
           ,[IdCelda]
           ,[IdComponente]
           ,[IdPO]
           ,[IdCaja]
           ,[ClaArticulo]
           ,[ClaveCorte]
           ,[FechaHoraInicio]
           ,[FechaHoraFin]
           ,[DuracionSegundos]
           ,[ClavosInicio]
           ,[ClavosFin]
           ,[CajasInicio]
           ,[CajasFin]
		   ,[EsPNC]
           ,[CajasXHora]
		   ,[Multiplo]
           ,[ClaTurno]
           ,[FechaAdm]
           ,[Hora]
           ,[ClaEstatusReplica]
           ,[BajaLogica]
           ,[FechaBajaLogica]
           ,[ClaUsuarioMod]
           ,[NombrePCMod]
           ,[FechaUltimaMod])
     VALUES
           ( @pnClaUbicacion 
			,@pnIdBitProduccion 
			,@psClaPuntoMedicion
			,@pnAnio
			,@pnIdMultiplo
			,@psIdCelda 
			,@pnIdComponente 
			,@pnIdPO 
			,@pnIdCaja 
			,@pnClaArticulo 
			,@psClaveCorte
			,@ptFechaHoraInicio 
			,@ptFechaHoraFin 
			,@pnDuracionSegundos  
			,@pnClavosInicio 
			,@pnClavosFin 
			,@pnCajasInicio 
			,@pnCajasFin 
			,@pnEsPNC
			,@pnCajasXHora 
			,@pnMultiplo
			,@pnClaTurno 
			,@ptFechaAdm 
			,@pnHora 
			,@pnClaEstatusReplica 
			,@pnBajaLogica 
			,@ptFechaBajaLogica 
			,@pnClaUsuarioMod 
			,@psNombrePCMod 
			,@ptFechaUltimaMod )
	END 
END