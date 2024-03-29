USE [ASW]
GO
/****** Object:  StoredProcedure [AswSch].[ASW_CU522_Pag1_RelAlertaTipoSeguimientoAlerta_Sel]    Script Date: 15/11/2022 03:23:29 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


ALTER PROC [AswSch].[ASW_CU522_Pag1_RelAlertaTipoSeguimientoAlerta_Sel]
AS
BEGIN

	SELECT 'ASWLite_RelAlertaTipoSeguimientoAlerta' as nombretabla
		  ,keys = 'ClaUbicacion,ClaSistema,ClaAlerta'
		  ,fuc = 'FechaUltimaMod'
		  ,[ClaUbicacion]
		  ,[ClaSistema]
		  ,[ClaAlerta]
		  ,[ClaTipoSeguimientoAlerta]
		  ,[BajaLogica]
		  ,CONVERT(VARCHAR,FechaBajaLogica,121) AS FechaBajaLogica
		  ,[ClaUsuarioMod]
		  ,CONVERT(VARCHAR,GETDATE(),121) AS FechaUltimaMod
		  ,[NombrePcMod]
	  FROM [AswSch].[AswRelAlertaTipoSeguimientoAlertaMCSW]



END
