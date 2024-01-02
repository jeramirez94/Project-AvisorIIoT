--USE [ASW]
--GO
/****** Object:  StoredProcedure [AswSch].[ASW_CU305_Pag1_ObtenerVelocidad]    Script Date: 15/11/2022 02:57:01 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*========================================== 
* CU305.1 
* Objetivo: Obtener la velocidad vs objetivo de las maquinas de un workcenter  
* Autor: mrodriguezc
* Fecha: ? 
-- EXEC [AswSch].[ASW_CU305_Pag1_ObtenerVelocidad] 68, '2022-06-27T12:00:00Z', '2022-06-27T21:59:21Z' , 34, 1, 0
-- EXEC  [AswSch].[ASW_CU305_Pag1_ObtenerVelocidad] 65, '2023-02-17T19:08:17.097Z', '2023-02-17T20:08:17.098Z', 'FF-02', 1, 1
-- EXEC  [AswSch].[ASW_CU305_Pag1_ObtenerVelocidad] $ClaUbicacion, '${__from:date}', '${__to:date}', $Cell, 1
* 17/02/2023 MRODRIGUEZC Se hace una distincion entre las ubicacion por ser incompatible el origen de las señales crudas 
*========================================== */ 
ALTER PROC [AswSch].[ASW_CU305_Pag1_ObtenerVelocidad]
	@pnClaUbicacion INT
	,@ptFechaDesde DATETIME
	,@ptFechaHasta DATETIME
	,@psIdCelda VARCHAR(30)
	,@pnTiempoUTC INT = 0
	,@pnDebug INT = 0
AS
BEGIN

	DECLARE 
		@nOffSet INT
	   ,@nPulleyRevs NUMERIC(7,4)
	   ,@nPulleyArms INT
	   ,@nNailsPerRev INT

	IF @pnTiempoUTC = 1
	BEGIN
		SET @nOffSet = datediff(hh, getutcdate(), getdate())
	END
	ELSE
	BEGIN
		SET @nOffSet=0
	END

	SET @ptFechaDesde = dateadd(hh, @nOffSet, @ptFechaDesde)
	SET @ptFechaHasta = dateadd(hh, @nOffSet, @ptFechaHasta)

	IF (@pnClaUbicacion = 68)
	BEGIN
		SELECT @nNailsPerRev=aux.NailsPerRev, @nPulleyArms = aux.PullyArms, @nPulleyRevs = aux.PulleyRevs 
		FROM [AswSch].[AswCatMaquinaAux] aux INNER JOIN [AswSch].[AswCatWorkUnitVw] maq
		ON aux.ClaOrigen = maq.ClaMaquina 
		WHERE maq.IdWorkCenter = @psIdCelda AND maq.ClaTipoMaquina = 1 AND maq.BajaLogica = 0 AND aux.EsMaquina = 1

		SELECT
			DATEADD(hh, -@nOffSet, FechaHoraAvisor) AS time,
			Robot_Speed,
			(Header_Speed*(@nNailsPerRev/(@nPulleyRevs*@nPulleyArms))),
			(CASE WHEN aswcc.NPM IS NULL THEN 0 ELSE aswcc.NPM END +
			CASE WHEN aswcc.NPM2 IS NULL THEN 0 ELSE aswcc.NPM2 END +
			CASE WHEN aswcc.NPM3 IS NULL THEN 0 ELSE aswcc.NPM3 END) * aswcc.CantWafios as 'Target'
		FROM [AswSch].[AswBitSeñal] aswbs
		JOIN [AswSch].[AswCatWorkCenterVw] aswcc
			ON aswcc.IdWorkCenter = aswbs.IdCelda
		WHERE
			FechaHoraAvisor >= @ptFechaDesde
			AND FechaHoraAvisor <= @ptFechaHasta
			AND aswbs.IdCelda = @psIdCelda
		ORDER BY
			FechaHoraAvisor ASC
	END
	IF (@pnClaUbicacion = 65)
	BEGIN

		SELECT
			DATEADD(hh, -@nOffSet, V.FechaHoraMaquina) AS time,
			V.Valor AS Speed,
			CASE V.ClaMaquina WHEN 'FF-05' THEN 35 ELSE 40 END AS 'Target'
		FROM [AswSch].[AswRecBitVariable] V
		JOIN [AswSch].[AswCatWorkUnitVw] WU
			ON V.ClaMaquina = WU.IdWorkCenter
		WHERE V.ClaVariable = 4
			AND V.FechaHoraMaquina >= @ptFechaDesde
			AND V.FechaHoraMaquina <= @ptFechaHasta
			AND WU.IdWorkCenter = @psIdCelda
		ORDER BY
			FechaHoraMaquina ASC
	END

END

