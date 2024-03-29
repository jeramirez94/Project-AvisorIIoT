USE [ASWH]
GO
/****** Object:  StoredProcedure [AswSch].[ASW_CU171_Pag1_EvaluarUnidadBitacoraProduccion_U]    Script Date: 26/05/2023 06:17:38 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/* =============================================
* CU: 171.1
* Objetivo: Actualizar campo EsPNC con evaluación de unidades recibida desde estación de trabajo.
* Autor: aorangel
* Fecha: 2023-05-24
* EXEC [AswSch].[ASW_CU171_Pag1_EvaluarUnidadBitacoraProduccion_U] 65,'FF-01', '1,2,3', 0,7,'2023-05-24',1,'',''
-- =============================================*/
ALTER PROCEDURE  [AswSch].[ASW_CU171_Pag1_EvaluarUnidadBitacoraProduccion_U] 
	@pnClaUbicacion  INT,
	@psIdWorkCenter VARCHAR(50),
	@psIdList VARCHAR(255),
	@pnClaUsuarioMod INT,
	@pnClaTurno INT,
	@ptFechaAdmScada DATETIME = NULL,
	@pnEsPNC INT,
	@psIdioma VARCHAR(20),
	@psErrorKey VARCHAR(15) OUT,
	@psErrorMsg VARCHAR(500) OUT
AS
BEGIN
	
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET @psErrorKey = 'SUCCESS'
	SET LANGUAGE @psIdioma;

	SET NOCOUNT ON;

	DECLARE @nClaDepartamento INT
	DECLARE @IdList TABLE(Id INT)
	DECLARE @IdListMicroProg TABLE(Indice INT IDENTITY(1,1),IdPO INT, Id INT)
	DECLARE @sNombrePcMod VARCHAR(50)
	DECLARE @nIdMicroProg INT
	DECLARE @nStartIterator INT
	DECLARE @nEndIterator INT
	INSERT INTO @IdList SELECT Value FROM [ASWSch].[ASWSplitKeyFn](@psIdList,',')

	SET @sNombrePcMod = CONCAT('Estacion: ', @psIdWorkCenter)

	SELECT @nClaDepartamento = ClaDepartamento 
	FROM AswSch.AswCatWorkCenterVw
	WHERE IdWorkCenter = @psIdWorkCenter;

	SELECT @ptFechaAdmScada = CASE WHEN @ptFechaAdmScada = CONVERT(DATE, GETDATE())
						  THEN [AswSch].[ASWGetFechaAdm] (@pnClaUbicacion, @nClaDepartamento, NULL)
						  ELSE @ptFechaAdmScada
						  END;

	INSERT INTO @IdListMicroProg (IdPO, Id)
	SELECT B.IdPO, I.Id  FROM AswSch.AswBitBitacoraProduccion B
				INNER JOIN @IdList I
				ON B.Id = I.Id
				WHERE B.IdCelda = @psIdWorkCenter 
				AND CONVERT(DATE,@ptFechaAdmScada) = B.FechaAdm
				AND B.ClaTurno = @pnClaTurno

	Set @nStartIterator = (SELECT MIN(IdPO) FROM @IdListMicroProg)	
	SET @nEndIterator = (SELECT MAX(IdPO) FROM @IdListMicroProg)

	IF NOT EXISTS (
		SELECT 1 FROM AswSch.AswBitBitacoraProduccion B
			INNER JOIN @IdList I
			ON B.Id = I.Id 
			WHERE B.IdCelda = @psIdWorkCenter 
			AND CONVERT(DATE,@ptFechaAdmScada) = B.FechaAdm
			AND B.ClaTurno = @pnClaTurno
			AND B.Id = I.Id )
	BEGIN
		SET @psErrorKey = 'UNASSOCIATED_RECORDS'
		SELECT @psErrorMsg = Mensaje
		FROM [AswSch].[AswCatMensajeError]
		WHERE ErrorKey = 'UNASSOCIATED_RECORDS'
			AND Idioma = @psIdioma

		RETURN
	END

	UPDATE AswSch.AswBitBitacoraProduccion
	SET EsPNC = @pnEsPNC
	,ClaUsuarioMod = @pnClaUsuarioMod
	,NombrePCMod = @sNombrePcMod
	,FechaUltimaMod = GETDATE()
	FROM  AswSch.AswBitBitacoraProduccion B
	INNER JOIN  @IdListMicroProg I ON B.Id = I.Id
	WHERE IdCelda = @psIdWorkCenter
	AND FechaAdm = CONVERT(DATE,@ptFechaAdmScada)
	AND B.ClaTurno = @pnClaTurno;
	WHILE @nStartIterator <= @nEndIterator
		BEGIN
			
		   EXEC [AswSch].[ASW_CU151_Pag1_ActualizaProduccion_Proc] @pnClaUbicacion, @nStartIterator, @pnClaUsuarioMod, @sNombrePcMod;
		    
		   SELECT @nStartIterator = MIN(IdPO) 
		   FROM @IdListMicroProg
		   WHERE IdPO > @nStartIterator
		   
		END;
	

END
