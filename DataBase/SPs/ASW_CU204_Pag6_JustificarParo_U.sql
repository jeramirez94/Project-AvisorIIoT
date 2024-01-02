/* =============================================
* CU: 204.6
* Objetivo: Actualizar los campos ClaTipoParo, ClaSeccionParo para justificar paros desde estación de trabajo.
* Autor: JRUIZC
* Fecha: 2023-08-09
* EXEC [AswSch].[ASW_JustificarParosBitacoraParos_U] 65,'FF-02', '', 0,7,'2023-05-24',33,199,'English','',''
-- =============================================*/
USE ASW 
GO 

CREATE PROCEDURE [AswSch].[ASW_CU204_Pag6_JustificarParo_U]
	@pnClaUbicacion INT,
	@psIdWorkCenter VARCHAR(50),
	@psIdList VARCHAR(255),
	@pnClaUsuarioMod INT,
	@pnClaTurno INT,
	@ptFechaAdmScada DATETIME = NULL,
	@pnClaTipoParo INT,
	@pnClaSeccionParo INT,
	@psIdioma VARCHAR(20),
	@psErrorKey VARCHAR(15) OUT,
	@psErrorMsg VARCHAR(500) OUT
AS
BEGIN
	
	SET @psErrorKey = 'SUCCESS'
	SET LANGUAGE @psIdioma;

	SET NOCOUNT ON;

	DECLARE @nClaDepartamento INT
	DECLARE @IdList TABLE(Id INT)
	DECLARE @sNombrePcMod VARCHAR(50)
	INSERT INTO @IdList SELECT Value FROM [ASWSch].[ASWSplitKeyFn](@psIdList,',')

	SET @sNombrePcMod = CONCAT('Estacion: ', @psIdWorkCenter)

	SELECT @nClaDepartamento = ClaDepartamento 
	FROM AswSch.AswCatWorkCenterVw WITH(NOLOCK)
	WHERE IdWorkCenter = @psIdWorkCenter;

	SELECT @ptFechaAdmScada = CASE WHEN @ptFechaAdmScada = CONVERT(DATE, GETDATE())
						  THEN [AswSch].[ASWGetFechaAdm] (@pnClaUbicacion, @nClaDepartamento, GETDATE())
						  ELSE @ptFechaAdmScada
						  END;

	DECLARE @nCurrentId INT;
	DECLARE @nEsPrimeraModificacion TINYINT;
	DECLARE @nEsFueraDeTiempo TINYINT;

	DECLARE IdListCursor CURSOR FOR
		SELECT Id FROM @IdList;

	OPEN IdListCursor;

	FETCH NEXT FROM IdListCursor INTO @nCurrentId;

	WHILE @@FETCH_STATUS = 0
	BEGIN
		
		IF NOT EXISTS (
		SELECT 1 FROM AswSch.AswBitBitacoraParo P
			WHERE P.IdComponente = @psIdWorkCenter 
			AND CONVERT(DATE,@ptFechaAdmScada) = P.FechaAdmSCADA
			AND P.ClaTurno = @pnClaTurno
			AND P.Id = @nCurrentId)
		BEGIN
			SET @psErrorKey = 'UNASSOCIATED_RECORDS'
			SELECT @psErrorMsg = Mensaje
			FROM [AswSch].[AswCatMensajeError]
			WHERE ErrorKey = 'UNASSOCIATED_RECORDS'
				AND Idioma = @psIdioma

			RETURN
		END

		SELECT @nEsPrimeraModificacion = CASE
			WHEN NOT EXISTS (
				SELECT 1 FROM AswSch.AswBitBitacoraParo WITH(NOLOCK)
				WHERE IdComponente = @psIdWorkCenter
				AND FechaAdmSCADA = CONVERT(DATE, @ptFechaAdmScada)
				AND ClaTurno = @pnClaTurno
				AND ClaParo IS NOT NULL
				AND Id = @nCurrentId
			) THEN 1
			ELSE 0
			END;

		SELECT @nEsFueraDeTiempo = CASE
			WHEN NOT EXISTS(
				SELECT 1 FROM AswSch.AswBitBitacoraParo WITH(NOLOCK)
				WHERE IdComponente = @psIdWorkCenter
				AND FechaAdmSCADA = CONVERT(DATE, @ptFechaAdmScada)
				AND ClaTurno = @pnClaTurno
				AND Id = @nCurrentId
				AND FechaHoraFinal IS NOT NULL
			)THEN 1
			ELSE 0
			END;

		UPDATE AswSch.AswBitBitacoraParo
		SET 
			ClaParo = @pnClaTipoParo,
			ClaSeccionParo = @pnClaSeccionParo,
			ClaUsuarioMod = @pnClaUsuarioMod,
			NombrePCMod = @sNombrePcMod,
			FechaUltimaMod = GETDATE(),
			ClaEventoJustificacion = CASE WHEN @nEsPrimeraModificacion = 1 THEN 1 ELSE ClaEventoJustificacion END,
			FechaHoraJustificado = CASE WHEN @nEsPrimeraModificacion = 1 THEN GETDATE() ELSE FechaHoraJustificado END,
			ClaEventoReasignacion = CASE WHEN @nEsPrimeraModificacion = 0 THEN 1 ELSE ClaEventoReasignacion END,
			FechaHoraReasignado = CASE WHEN @nEsPrimeraModificacion = 0 THEN GETDATE() ELSE FechaHoraReasignado END,
			FueraTiempo = CASE WHEN @nEsFueraDeTiempo = 0 THEN 1 ELSE 0 END
		FROM AswSch.AswBitBitacoraParo P WITH(NOLOCK)
		WHERE P.IdComponente = @psIdWorkCenter
		AND P.FechaAdmSCADA = CONVERT(DATE, @ptFechaAdmScada)
		AND P.ClaTurno = @pnClaTurno
		AND P.Id = @nCurrentId;

		FETCH NEXT FROM IdListCursor INTO @nCurrentId;
	END;

	CLOSE IdListCursor;
	DEALLOCATE IdListCursor;

END
GO


