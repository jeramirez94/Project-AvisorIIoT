/* =============================================
* CU: 204 Paros
* Objetivo: Devolver los paros de la maquina actual en el turno actual.
* Autor: JRUIZC
* Fecha: 2023-08-08
* EXEC [AswSch].[ASW_CU204_Pag5_BitacoraParos_Sel]  65,'FF-01', '2023-08-08',7,0,1,'English','',''
-- =============================================*/
USE ASW
GO 

CREATE PROCEDURE [AswSch].[ASW_CU204_Pag5_BitacoraParos_Sel]
	@pnClaUbicacion INT,
	@psIdWorkCenter VARCHAR(100),
	@ptFechaAdmScada DATETIME = NULL,
	@pnClaTurno INT = 0,
	@pnMostrarJustificados tinyint = 0,
	@pnMostrarMicroParos tinyint = 0,
	@psIdioma VARCHAR(20),
	@psErrorKey VARCHAR(15) OUT,
	@psErrorMsg VARCHAR(500) OUT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	DECLARE @nClaDepartamento INT;

	SET LANGUAGE @psIdioma;  

	SET @psErrorKey = 'SUCCESS'
	SET @psErrorMsg = NULL

	SELECT @nClaDepartamento = ClaDepartamento 
	FROM AswSch.AswCatWorkCenterVw
	WHERE IdWorkCenter = @psIdWorkCenter;

	SELECT @pnClaTurno = CASE @pnClaTurno 
						 WHEN 0 
						 THEN [AswSch].[ASWGetTurno] (@pnClaUbicacion, @nClaDepartamento, NULL)
						 ELSE @pnClaTurno
						 END

	SELECT @ptFechaAdmScada = CASE WHEN @ptFechaAdmScada = CONVERT(DATE, GETDATE())
						  THEN [AswSch].[ASWGetFechaAdm] (@pnClaUbicacion, @nClaDepartamento, NULL)
						  ELSE @ptFechaAdmScada
						  END;

	IF(@ptFechaAdmScada IS NULL)
		BEGIN
			SET @psErrorKey = 'INCORRECT_PARAMETERS'
			SELECT @psErrorMsg = Mensaje
			FROM [AswSch].[AswCatMensajeError]
			WHERE ErrorKey = 'INCORRECT_PARAMETERS'
				AND Idioma = @psIdioma

			RETURN
		END

	--Devolver bitacora de paros en el turno/fechaAdm/ maquina recibida
   SELECT P.Id as 'IdRegistroParo',
		  FORMAT(P.FechaHoraInicial, 'HH:mm') AS 'FechaInicioParo',
		  FORMAT(P.FechaHoraFinal, 'HH:mm') AS 'FechaFinParo',
		  CONCAT(
				CASE WHEN DATEPART(HOUR, DATEADD(ss, P.DuracionSegundos, 0)) >= 1 THEN CONCAT(DATEPART(HOUR, DATEADD(ss, DuracionSegundos, 0)), 'h ') else '' end
				,
				CASE WHEN DATEPART(MINUTE, DATEADD(ss, P.DuracionSegundos, 0)) >= 1 THEN CONCAT(DATEPART(MINUTE, DATEADD(ss, DuracionSegundos, 0)), 'm ') else '' end
				,
				CASE WHEN DATEPART(SECOND, DATEADD(ss, P.DuracionSegundos, 0)) >= 1 THEN CONCAT(DATEPART(SECOND, DATEADD(ss, DuracionSegundos, 0)), 's ') else '' end
		  ) AS 'DuracionParo',
		  ISNULL(CASE 
				WHEN S.NomTipoParo IS NOT NULL AND S.NomSeccionParo IS NOT NULL
				THEN CONCAT(S.NomTipoParo, ' > ', S.NomSeccionParo)
				WHEN S.NomTipoParo IS NOT NULL
				THEN S.NomTipoParo
				WHEN S.NomSeccionParo IS NOT NULL
				THEN S.NomSeccionParo
				ELSE ''
			END, '') as 'Justificacion',
		  P.IdComponente as 'IdWorkCenterParo',
		  P.ClaTurno as 'ClaTurno'
	FROM  AswSch.AswBitBitacoraParo P WITH(NOLOCK)
	LEFT JOIN AswSch.AswCatSeccionParoVw S WITH(NOLOCK) ON P.ClaSeccionParo = S.ClaSeccionParo AND P.ClaParo=S.ClaTipoParo
	WHERE P.ClaUbicacion = @pnClaUbicacion
		AND P.BajaLogica = 0 
		AND P.FechaAdmSCADA = CONVERT(DATE,@ptFechaAdmScada)
		AND P.IdComponente = @psIdWorkCenter
		AND P.ClaTurno = @pnClaTurno
		AND ((P.MicroParoSN = 0 OR (@pnMostrarMicroParos = 1)) OR P.FechaHoraFinal is null)
		AND (@pnMostrarJustificados = 1 OR S.NomTipoParo is null)
	ORDER BY P.FechaHoraInicial DESC
	
END
GO

