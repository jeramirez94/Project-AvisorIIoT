USE [ASWH]
GO
/****** Object:  StoredProcedure [AswSch].[ASW_CU151_Pag3_ObtenerTurnos_Sel]    Script Date: 10/05/2023 10:49:28 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*==========================================
* CU: 151.3
* Objetivo: Devolver turno actual y resto de turnos por departamento.
* Autor: aorangel
* Fecha: 2023-04-29
* EXEC [AswSch].[ASW_CU151_Pag3_ObtenerTurnos_Sel] 65,'FF-02','2023-04-12','English','',''
*========================================== */

ALTER PROCEDURE [AswSch].[ASW_CU151_Pag3_ObtenerTurnos_Sel]
@pnClaUbicacion int,
@psIdWorkCenter VARCHAR(50),
@ptFechaAdmScada DATE = NULL,
@psIdioma VARCHAR(20),
@psErrorKey VARCHAR(15) OUT,
@psErrorMsg VARCHAR(500) OUT

AS
DECLARE @nClaTurnoActual INT;
DECLARE @nClaDepartamento INT;

SET LANGUAGE @psIdioma;  

SET @psErrorKey = 'SUCCESS';
SET @psErrorMsg = NULL;

SELECT @nClaDepartamento = ClaDepartamento 
FROM AswSch.AswCatWorkCenterVw
WHERE IdWorkCenter = @psIdWorkCenter;

SELECT @nClaTurnoActual = [AswSch].[ASWGetTurno] (@pnClaUbicacion, @nClaDepartamento, NULL);
SELECT @ptFechaAdmScada = CASE WHEN @ptFechaAdmScada = CONVERT(DATE, GETDATE())
						  THEN [AswSch].[ASWGetFechaAdm] (@pnClaUbicacion, @nClaDepartamento, NULL)
						  ELSE @ptFechaAdmScada
						  END;
							  

IF(@psIdWorkCenter IS NULL OR @psIdWorkCenter IS NULL)
	BEGIN
		SET @psErrorKey = 'INCORRECT_PARAMETERS'
		SELECT @psErrorMsg = Mensaje
		FROM [AswSch].[AswCatMensajeError]
		WHERE ErrorKey = 'INCORRECT_PARAMETERS'
			AND Idioma = @psIdioma

		RETURN
	END;


	SELECT DISTINCT CONVERT(VARCHAR,@ptFechaAdmScada) as FechaAdministrativa
	,T.ClaTurno AS ClaTurno
	,T.NomTurno AS NomTurno
	, CASE T.ClaTurno
		WHEN @nClaTurnoActual
		THEN 1
		ELSE 0
	  END AS EsActual
	,RTD.HoraInicioTurno
	FROM ASWSch.AswCatTurno T WITH(NOLOCK)
	JOIN ASWSch.AswRelTurnoDepartamentoHorario RTD
	ON T.ClaTurno = RTD.ClaTurno
	JOIN ASWSch.AswCatDepartamentoVw D
	ON D.ClaDepartamento = RTD.ClaDepartamento
	WHERE T.BajaLogica = 0 
	AND D.BajaLogica = 0
	AND RTD.BajaLogica = 0
	AND RTD.ClaDepartamento = @nClaDepartamento
	ORDER BY RTD.HoraInicioTurno ASC;

