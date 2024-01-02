USE [ASW]
GO
/****** Object:  StoredProcedure [AswSch].[ASW_CU304_Pag1_CalcEgeDiario_IU]    Script Date: 15/11/2022 02:26:49 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROC  [AswSch].[ASW_CU304_Pag1_CalcEgeDiario_IU] 
	 @PnClaUbicacion INT
	,@PnClaDepartamento INT = NULL
	,@PnClaArea INT = NULL
	,@PnAnio INT
	,@PnMes INT
	,@PnNivel INT 
AS
BEGIN

	DECLARE @nId INT

	DECLARE @tmpEstEGE TABLE (
		id INT IDENTITY (1,1),
		[ClaUbicacion] [int] NULL,
		[ClaveUbicacion] [varchar](50) NULL,
		[Anio] [int] NULL,
		[Mes] [int] NULL,
		[Dia] [int] NULL,
		[ClaDepartamento] [int] NULL,
		[ClaveDepartamento] [varchar](50) NULL,
		[ClaArea] [int] NULL,
		[ClaveArea] [varchar](50) NULL,
		[ClaMaquina] [int] NULL,
		[ClaveMaquina] [varchar](50) NULL,
		[NomIndicador] [varchar](100),
		[Nivel] [int] NULL,
		[Efficiencty] [numeric](8,2) NULL,
		[Availability] [numeric](8,2) NULL,
		[Utilization] [numeric](8,2) NULL,
		[Quality] [numeric](8,2) NULL,
		[OEE] [numeric](8,2) NULL
	)


	INSERT INTO @tmpEstEGE
			   ([ClaUbicacion]
			   ,[ClaveUbicacion]
			   ,[Anio],[Mes]
			   ,[Dia]
			   ,[ClaDepartamento]
			   ,[ClaveDepartamento]
			   ,[ClaArea]
			   ,[ClaveArea]
			   ,[ClaMaquina]
			   ,[ClaveMaquina]
			   ,[Nivel]
			   ,[NomIndicador]
			   ,[Efficiencty]
			   ,[Availability]
			   ,[Utilization]
			   ,[Quality]
			   ,[OEE]
			)
	EXEC AswSch.ASW_CU304_Pag1_CalcEgeDiario
		 @PnClaUbicacion = @PnClaUbicacion
		,@PnClaDepartamento  = @PnClaDepartamento
		,@PnClaArea  = @PnClaArea
		,@PnAnio = @PnAnio
		,@PnMes = @PnMes
		,@PnNivel =@PnNivel

	
	DELETE FROM [AswSch].[AswEstEGEDiario]
	WHERE ClaUbicacion = @PnClaUbicacion
		 AND Anio = @PnAnio
		 AND Mes = @PnMes
		 AND (@PnNivel IS NULL OR Nivel =@PnNivel)

	SELECT @nId = ISNULL(MAX(id),0)
	FROM [AswSch].[AswEstEGEDiario]

	INSERT INTO [AswSch].[AswEstEGEDiario]
			   ( Id
			   ,[ClaUbicacion]
			   ,[ClaveUbicacion]
			   ,[Anio]
			   ,[Mes]
			   ,[Dia]
			   ,[ClaDepartamento]
			   ,[ClaveDepartamento]
			   ,[ClaArea]
			   ,[ClaveArea]
			   ,[ClaMaquina]
			   ,[ClaveMaquina]
			   ,[Nivel]
			   ,[Efficiencty]
			   ,[Availability]
			   ,[Utilization]
			   ,[Quality]
			   ,[OEE] 
			   ,FechaUltimaMod
			   ,NombrePcMod
			   ,ClaUsuarioMod
			  )
	SELECT      @nId + ROW_NUMBER() OVER (ORDER BY Id)
			   ,[ClaUbicacion]
			   ,[ClaveUbicacion]
			   ,[Anio],[Mes]
			   ,[Dia]
			   ,[ClaDepartamento]
			   ,[ClaveDepartamento]
			   ,[ClaArea]
			   ,[ClaveArea]
			   ,[ClaMaquina]
			   ,[ClaveMaquina]
			   ,[Nivel]
			   ,[Efficiencty]
			   ,[Availability]
			   ,[Utilization]
			   ,[Quality]
			   ,[OEE]
			   ,GETDATE()
			   ,HOST_NAME()
			   ,0
	FROM @tmpEstEGE


END

