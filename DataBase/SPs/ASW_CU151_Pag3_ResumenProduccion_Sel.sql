USE [ASWH]
GO
/****** Object:  StoredProcedure [AswSch].[ASW_CU151_Pag3_ResumenProduccion_Sel]    Script Date: 15/05/2023 05:45:34 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*==========================================
* CU: 151.3
* Objetivo: Devolver la produccion de la maquina actual en el turno actual y anteriores.
* Autor: aorangel
* Fecha: 2023-04-28
* EXEC [AswSch].[ASW_CU151_Pag3_ResumenProduccion_Sel] 65,'FF-04', '2023-04-11',1, 'English','',''
* 15/05/2023 AORANGEL se agrega variable @nClaDepartamento para almacenar el departamento correspondiente al IdWorkCenter recibido
* y posteriormente usar esa variable para obtener el turno actual.
*========================================== */

ALTER PROCEDURE [AswSch].[ASW_CU151_Pag3_ResumenProduccion_Sel]
@pnClaUbicacion int,
@psIdWorkCenter varchar(100),
@ptFechaAdmScada DATETIME = NULL,
@pnClaTurno INT = NULL,
@psIdioma VARCHAR(20),
@psErrorKey VARCHAR(15) OUT,
@psErrorMsg VARCHAR(500) OUT

AS
BEGIN
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

	IF(@ptFechaAdmScada IS NULL)
		BEGIN
			SET @psErrorKey = 'INCORRECT_PARAMETERS'
			SELECT @psErrorMsg = Mensaje
			FROM [AswSch].[AswCatMensajeError]
			WHERE ErrorKey = 'INCORRECT_PARAMETERS'
				AND Idioma = @psIdioma

			RETURN
		END

	SELECT	MP.Nomopm AS 'PO',
			CONCAT(MP.ClaveArticulo,' - ',MP.NomArticulo) AS 'Product',
			CONCAT((MP.CantidadProducida - MP.CantidadPNC),' / ',MP.CantidadProgramadaUds) AS 'Balance',
			ISNULL(MP.CantidadPNC,0) AS 'Total Scrap',
			COUNT(CASE
				WHEN @pnClaTurno =  BP.ClaTurno and ISNULL(EsPNC,0) = 0
				THEN BP.IdBitProduccion
			END) AS 'Production Shift',
			ISNULL(SUM(CASE BP.ClaTurno
				WHEN @pnClaTurno
				THEN ISNULL(BP.EsPNC,0)
			END),0) AS 'Scrap Shift'

	FROM [AswSch].[AswTraMicroPrograma] MP WITH(NOLOCK)
	LEFT JOIN [Aswsch].[AswBitBitacoraProduccion] BP WITH(NOLOCK)  
		ON MP.idMicroProg = BP.IdPO 
		AND BP.FechaAdm = CONVERT(DATE,@ptFechaAdmScada) 
		AND BP.IdCelda = @psIdWorkCenter
		AND BP.ClaTurno = @pnClaTurno
	WHERE BP.ClaUbicacion = @pnClaUbicacion
	GROUP BY	MP.idMicroProg,
				MP.NomOPM, 
				MP.ClaveArticulo, 
				MP.NomArticulo,
				MP.CantidadProgramadaUds,
				MP.CantidadProducida,
				MP.CantidadPNC;

END