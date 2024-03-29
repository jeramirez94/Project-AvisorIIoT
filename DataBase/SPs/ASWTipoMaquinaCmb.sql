--USE [ASW]
--GO
/****** Object:  StoredProcedure [AswSch].[ASWTipoMaquinaCmb]    Script Date: 15/11/2022 04:28:21 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROC [AswSch].[ASWTipoMaquinaCmb]
@psIdCelda VARCHAR(30)
,@pnEsRegex INT = 0


AS
BEGIN
	DECLARE @nCollator INT
 ,@nThreader INT
 ,@nHeader INT
 ,@nRobot INT
 
 


	SELECT DISTINCT ClaTipoMaquina,NomMaquina
	INTO #Assets
	FROM [AswSch].[AswCatWorkUnitVw]
	WHERE IdWorkCenter = @psIdCelda AND ClaTipoMaquina IN(1,2,3,6)


	

	UPDATE #Assets SET NomMaquina = 'Header' WHERE ClaTipoMaquina = 1
	
	UPDATE #Assets SET NomMaquina = 'Threader' WHERE ClaTipoMaquina = 2

	UPDATE #Assets SET NomMaquina = 'Collator' WHERE ClaTipoMaquina = 3

	UPDATE #Assets SET NomMaquina = 'Robot' WHERE ClaTipoMaquina = 6

	;WITH CTE AS (
    SELECT ClaTipoMaquina, NomMaquina,
        ROW_NUMBER() OVER (
            PARTITION BY 
                ClaTipoMaquina
            ORDER BY 
                ClaTipoMaquina
        ) row_num
     FROM 
        #Assets
)

DELETE FROM cte

WHERE row_num > 1;


	IF @pnEsRegex = 1
	
	BEGIN
		SELECT 'Desc='+CAST(NomMaquina AS VARCHAR) + ':value='+CAST(ClaTipoMaquina AS VARCHAR)+':' AS Asset
		FROM #Assets
	END
	ELSE
	BEGIN
		SELECT NomMaquina,ClaTipoMaquina
		FROM #Assets
	END
	
END