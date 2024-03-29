USE [ASW]
GO
/****** Object:  StoredProcedure [AswSch].[ASW_CU101_Pag10_CatMaquina_Sel]    Script Date: 02/02/2023 10:47:13 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROC [AswSch].[ASW_CU101_Pag10_CatMaquina_Sel]
	@PsIdCelda VARCHAR(30) 
AS
BEGIN

IF @PsIdCelda IS NOT NULL 
	BEGIN
		;WITH CteCatMaquina AS (
			SELECT 'ASWLite_CatWorkUnit' as nombretabla
				,keys = 'IdWorkCenter,ClaMaquina,EsMaquina'
				,fuc = 'FechaUltimaMod'
			   ,M.ClaMaquina
			   ,M.ClaveMaquina
			   ,M.NomMaquina
			   ,M.IdWorkCenter
			   ,M.ClaTipoMaquina
			   ,M.ABCMachine
			   ,A.PullyArms
			   ,A.PulleyRevs
			   ,A.NailsPerRev
			   ,A.RobotBrand
			   ,M.EsGralProduccion
			   ,M.EsGralParos
			   ,COALESCE(A.EsMaquina, 0) AS EsMaquina
			   ,A.TipoSeñal
			   ,A.ClaMaquinaReporta
			   ,CASE M.ClaTipoMaquina
				WHEN 1 THEN 'HEADER'
				WHEN 2 THEN 'THREADER'
				WHEN 3 THEN 'COLLATOR'
				WHEN 4 THEN 'CLEANER'
				WHEN 6 THEN 'ROBOT'
				ELSE NomMaquina 
				END AS Origen
				,ROW_NUMBER() OVER (PARTITION BY M.BajaLogica, M.ClaTipoMaquina ORDER BY M.ABCMachine) AS Posicion
			   ,M.BajaLogica
			   ,convert(varchar,M.FechaBajaLogica,121) as FechaBajaLogica
			   --,M.ClaUsuarioMod
			   --,M.NombrePcMod
			   ,convert(varchar,GETDATE(),121) as FechaUltimaMod
			FROM AswSch.AswCatWorkUnitVw M
			LEFT JOIN AswSch.AswCatMaquinaAux A
				ON M.ClaMaquina = A.ClaOrigen
				AND A.EsMaquina=1
			WHERE IdWorkCenter = @PsIdCelda
			UNION ALL
			SELECT 'ASWLite_CatWorkUnit' as nombretabla
				,keys = 'IdWorkCenter,ClaMaquina,EsMaquina'
				,fuc = 'FechaUltimaMod'
			    ,CAST(M.ClaSeñal AS VARCHAR) AS ClaMaquina
			   ,CAST(M.Orden AS VARCHAR) AS ClaveMaquina
			   ,M.NomSeñal AS NomMaquina
			   ,M.ClaCelda AS IdWorkCenter
			   ,NULL AS ClaTipoMaquina
			   ,'' AS ABCMachine
			   ,A.PullyArms
			   ,A.PulleyRevs
			   ,A.NailsPerRev
			   ,A.RobotBrand
			   ,A.EsGralProduccion
			   ,A.EsGralParos
			   ,COALESCE(A.EsMaquina, 0) AS EsMaquina
			   ,A.TipoSeñal
			   ,A.ClaMaquinaReporta
			   ,NomSeñal AS Origen
			   ,ROW_NUMBER() OVER (PARTITION BY BajaLogica, NomSeñal ORDER BY Orden) AS Posicion
			   ,M.BajaLogica
			   ,convert(varchar,M.FechaBajaLogica,121) as FechaBajaLogica
			 -- ,M.ClaUsuarioMod
			 --  ,M.NombrePcMod
			   ,convert(varchar,GETDATE(),121) as FechaUltimaMod
			FROM AswSch.AswCatMaquinaAvisor M
			LEFT JOIN AswSch.AswCatMaquinaAux A
				ON M.ClaSeñal = A.ClaOrigen
				AND A.EsMaquina=0
			WHERE ClaCelda = @PsIdCelda
		)
		,CteCatDispositivo AS (
			SELECT IdCelda 
				,MAX(Dispositivo) AS Dispositivo
			FROM AswSch.AswCatTablets
			GROUP BY IdCelda	
		)

		SELECT M.nombretabla	
			,M.keys	
			,M.fuc	
			,M.ClaMaquina	
			,M.ClaveMaquina	
			,M.NomMaquina	
			,M.IdWorkCenter	
			,M.ClaTipoMaquina	
			,M.ABCMachine	
			,M.PullyArms	
			,M.PulleyRevs	
			,M.NailsPerRev	
			,M.RobotBrand	
			,M.EsGralProduccion	
			,M.EsGralParos	
			,M.EsMaquina	
			,M.TipoSeñal	
			,M.ClaMaquinaReporta	
			,G.GPIO
			,G.Pin
			,G.Entrada
			,G.Dispositivo
			,G.Origen
			,G.Posicion
			,M.BajaLogica	
			,M.FechaBajaLogica	
			--,M.ClaUsuarioMod	
			--,M.NombrePcMod	
			,M.FechaUltimaMod
		FROM CteCatMaquina M
		LEFT JOIN CteCatDispositivo D
			ON M.IdWorkCenter=D.IdCelda
		LEFT JOIN [AswSch].[AswCatGpio] G
			ON M.Origen = G.Origen
			AND M.Posicion = G.Posicion
			AND G.dispositivo = D.Dispositivo
			AND G.BajaLogica = 0
	END
END

