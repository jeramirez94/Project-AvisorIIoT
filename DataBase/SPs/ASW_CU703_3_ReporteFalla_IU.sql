--USE [ASW]
--GO
/****** Object:  StoredProcedure [AswSch].[ASW_CU703_3_ReporteFalla_IU]    Script Date: 15/11/2022 04:06:03 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/*
* MRODRIGUEZC
* 2020/07/01
* guarda la informacion de andon
*/
ALTER PROCEDURE [AswSch].[ASW_CU703_3_ReporteFalla_IU]		
		@pnClaUbicacion int
		,@pnIdReporteFalla int
		,@psIdCelda varchar(30)
		,@pnClaEquipo int
		,@pnClaTurno int
		,@pnFechaAdmScada datetime
		,@ptFechaReporte DATETIME
		,@pnClaSistema int
		,@pnClaSubSistema int
		,@pnClaRcmFuncion int
		,@pnClaRcmFuncionFalla int
		,@pnClaEstatusReplica int
		,@ptFechaBajaLogica datetime
		,@pnBajaLogica int
		,@pnClaUsuarioMod int	
		,@psNombrePcMod VARCHAR(64)
		,@ptFechaUltimaMod DATETIME
AS
BEGIN
--print 'uno'
	IF NOT EXISTS (SELECT 1 FROM [AswSch].[AswMtoTraReporteFalla] WHERE ClaUbicacion = @pnClaUbicacion AND IdCelda = @psIdCelda AND IdReporteFalla = @pnIdReporteFalla)
	BEGIN
		
		INSERT INTO [AswSch].[AswMtoTraReporteFalla]
			([ClaUbicacion]
			,[IdReporteFalla]
			,[IdCelda]
			,[ClaEquipo]
			,[ClaTurno]
			,[FechaAdmScada]
			,[FechaReporte]
			,[ClaSistema]
			,[ClaSubSistema]
			,[ClaRcmFuncion]
			,[ClaRcmFuncionFalla]
			,[ClaEstatusReplica]
			,[FechaBajaLogica]
			,[BajaLogica]
			,[ClaUsuarioMod]
			,[NombrePCMod]
			,[FechaUltimaMod])
		VALUES
			(@pnClaUbicacion 
			,@pnIdReporteFalla 
			,@psIdCelda 
			,@pnClaEquipo 
			,@pnClaTurno 
			,@pnFechaAdmScada 
			,@ptFechaReporte 
			,@pnClaSistema 
			,@pnClaSubSistema 
			,@pnClaRcmFuncion 
			,@pnClaRcmFuncionFalla 
			,@pnClaEstatusReplica
			,@ptFechaBajaLogica 
			,@pnBajaLogica 
			,@pnClaUsuarioMod 	
			,@psNombrePcMod 
			,@ptFechaUltimaMod)
	END
END

