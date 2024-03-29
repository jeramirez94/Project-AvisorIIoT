--USE [ASWH]
--GO
/****** Object:  StoredProcedure [AswSch].[ASW_CU171_Pag1_ObtenerBitacoraProduccion_Sel]    Script Date: 26/05/2023 06:16:17 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/* =============================================
* CU: 171.1
* Objetivo: Devolver la produccion de la maquina actual en el turno actual, anteriores y/o por fecha administrativa.
* Autor: aorangel
* Fecha: 2023-05-24
* EXEC [AswSch].[ASW_CU171_Pag1_ObtenerBitacoraProduccion_Sel]  65,'FF-01', '2023-05-22',null, 'English','',''
-- =============================================*/
ALTER PROCEDURE [AswSch].[ASW_CU171_Pag1_ObtenerBitacoraProduccion_Sel]

	@pnClaUbicacion INT,
	@psIdWorkCenter VARCHAR(100),
	@ptFechaAdmScada DATETIME = NULL,
	@pnClaTurno INT = NULL,
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
	--Devolver bitacora de producción en el turno/fechaAdm/ maquina recibida
   SELECT B.Id as 'IdRegistro',
		  B.IdCaja as 'Unit#',	
		  B.IdPO as 'IdOrder',
		  P.Nomopm AS 'NomOrder',
		  P.NomArticulo AS 'Item',
		  FORMAT(B.FechaHoraFin, 'yyyy/MM/dd HH:mm:ss') AS 'Date',
		  CONCAT(
				CASE WHEN DATEPART(HOUR, DATEADD(ss, DuracionSegundos, 0)) >= 1 THEN CONCAT(DATEPART(HOUR, DATEADD(ss, DuracionSegundos, 0)), 'h ') else '' end
				,
				CASE WHEN DATEPART(MINUTE, DATEADD(ss, DuracionSegundos, 0)) >= 1 THEN CONCAT(DATEPART(MINUTE, DATEADD(ss, DuracionSegundos, 0)), 'm ') else '' end
				,
				CASE WHEN DATEPART(SECOND, DATEADD(ss, DuracionSegundos, 0)) >= 1 THEN CONCAT(DATEPART(SECOND, DATEADD(ss, DuracionSegundos, 0)), 's ') else '' end
		  ) AS 'Duration',
		  CASE ISNULL(B.EsPNC,0)
			   WHEN 0
			   THEN 'Good'
			   ELSE 'Rejected'
		  END as 'Status'
	FROM [AswSch].[AswTraMicroPrograma] P WITH(NOLOCK)
	LEFT JOIN [Aswsch].[AswBitBitacoraProduccion] B WITH(NOLOCK)  
		ON P.idMicroProg = B.IdPO 
		AND B.FechaAdm = CONVERT(DATE,@ptFechaAdmScada) 
		AND B.IdCelda = @psIdWorkCenter
		AND B.ClaTurno = @pnClaTurno
	WHERE B.ClaUbicacion = @pnClaUbicacion
		AND B.BajaLogica = 0
	GROUP BY	B.Id,
				P.idMicroProg,
				B.IdPO,
				P.NomOPM,
				P.NomArticulo,
				B.IdCaja,
				B.FechaHoraFin,
				B.FechaHoraInicio,
				B.DuracionSegundos,
				B.EsPNC
	ORDER BY B.FechaHoraInicio DESC, B.IdCaja DESC
END

