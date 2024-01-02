--USE [ASW]
--GO
/****** Object:  StoredProcedure [AswSch].[ASW_CU165_Pag1_CheckInOut_Proc]    Script Date: 15/11/2022 12:07:59 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [AswSch].[ASW_CU165_Pag1_CheckInOut_Proc]
	@xml XML
AS
BEGIN


	--insert into [AswSch].[AswBitCheckInOut] (XmlVar)
	--Values (@xml)

	DECLARE @handle INT  
	DECLARE @PrepareXmlStatus INT	

	--DECLARE 
	--	@ErrorMessage  NVARCHAR(4000)
	--	,@ErrorSeverity INT
	--	,@ErrorState    INT	

	--DECLARE @psCodigo VARCHAR(50)	
	--	,@pnReferencia INT
	--	,@psNomAlambre VARCHAR(100)	
	--	,@psNomProvedor VARCHAR(100)	
	--	,@psPesoInicial VARCHAR(100)	
	--	,@psColada VARCHAR(15)

	--DECLARE @tConsultaAlambron TABLE(
	--	Orden INT	
	--	,Codigo VARCHAR(50)	
	--	,Referencia INT
	--	,NomAlambre VARCHAR(100)	
	--	,NomProvedor VARCHAR(100)	
	--	,PesoInicial VARCHAR(100)	
	--	,Colada VARCHAR(15)
	--)

	DECLARE @tResultado TABLE(
		Id INT,
		ClaEstatusReplica INT--control para interfaz con MCSW (1 cambio, 2 replicado)
	)
	
	DECLARE @nId INT
		,@sIdCelda VARCHAR(30)
		,@tFechaAdmScada DATE
		,@nClaTurno SMALLINT
		,@nTiempoTurno NUMERIC(4,2)
		,@nOrdenesTurno SMALLINT
		,@tFechaHoraInicioProd DATETIME
		,@tFechaHoraFinProd DATETIME
		,@nIdComponente1 SMALLINT
		,@nTiempoParo1 NUMERIC(12,2)
		,@nIdComponente2 SMALLINT
		,@nTiempoParo2 NUMERIC(12,2)
		,@nIdComponente3 SMALLINT
		,@nTiempoParo3 NUMERIC(12,2)
		,@nIdComponente4 SMALLINT
		,@nTiempoParo4 NUMERIC(12,2)
		,@nIdComponente5 SMALLINT
		,@nTiempoParo5 NUMERIC(12,2)
		,@nIdComponente6 SMALLINT
		,@nTiempoParo6 NUMERIC(12,2)
		,@nIdComponente7 SMALLINT
		,@nTiempoParo7 NUMERIC(12,2)
		,@nIdComponente8 SMALLINT
		,@nTiempoParo8 NUMERIC(12,2)
		,@nIdComponente9 SMALLINT
		,@nTiempoParo9 NUMERIC(12,2)
		,@nIdComponente10 SMALLINT
		,@nTiempoParo10 NUMERIC(12,2)
		,@nCajasProducidas SMALLINT
		,@nCajasSkid SMALLINT
		,@nClaArticulo INT
		,@nPesoScrap NUMERIC(5,2)
		--control
		,@nClaTipoRegistro TINYINT --1 check in, 3 checkout
		,@nClaEstatusReplica TINYINT  --1 nuevo, 2 replicado
		,@sEvento VARCHAR(15)
		,@tFechaUltimaMod DATETIME
		,@sNombrePcMod VARCHAR(64)
		,@nClaUsuarioMod INT
		,@nEsManual INT
		,@sComentario VARCHAR(400)

	DECLARE @CheckInOut TABLE(
		Id  INT
		,IdCelda SMALLINT
		,FechaAdmScada DATE
		,ClaTurno SMALLINT
		,TiempoTurno NUMERIC(4,2)
		,OrdenesTurno SMALLINT
		,FechaHoraInicioProd DATETIME
		,FechaHoraFinProd DATETIME
		,IdComponente1 SMALLINT
		,TiempoParo1 NUMERIC(12,2)
		,IdComponente2 SMALLINT
		,TiempoParo2  NUMERIC(12,2)
		,IdComponente3 SMALLINT
		,TiempoParo3 NUMERIC(12,2)
		,IdComponente4 SMALLINT
		,TiempoParo4 NUMERIC(12,2)
		,IdComponente5 SMALLINT
		,TiempoParo5 NUMERIC(12,2)
		,IdComponente6 SMALLINT
		,TiempoParo6 NUMERIC(12,2)
		,IdComponente7 SMALLINT
		,TiempoParo7 NUMERIC(12,2)
		,IdComponente8 SMALLINT
		,TiempoParo8 NUMERIC(12,2)
		,IdComponente9 SMALLINT
		,TiempoParo9 NUMERIC(12,2)
		,IdComponente10 SMALLINT
		,TiempoParo10 NUMERIC(12,2)
		,CajasProducidas SMALLINT
		,CajasSkid SMALLINT
		,ClaArticulo INT
		,PesoScrap NUMERIC(5,2)
		--control
		,ClaTipoRegistro TINYINT --1 check in, 3 checkout
		,ClaEstatusReplica TINYINT  --1 nuevo, 2 replicado
		,Evento VARCHAR(15)
		,FechaUltimaMod DATETIME
		,NombrePcMod VARCHAR(64)
		,ClaUsuarioMod INT
		,EsManual INT
		,Comentario VARCHAR(400)
	)

	EXEC @PrepareXmlStatus= sp_xml_preparedocument @handle OUTPUT, @xml  

	INSERT INTO @CheckInOut(Id  
		,IdCelda 
		,FechaAdmScada 
		,ClaTurno 
		,TiempoTurno
		,OrdenesTurno 
		,FechaHoraInicioProd 
		,FechaHoraFinProd 
		,IdComponente1 
		,TiempoParo1 
		,IdComponente2 
		,TiempoParo2 
		,IdComponente3 
		,TiempoParo3 
		,IdComponente4 
		,TiempoParo4 
		,IdComponente5 
		,TiempoParo5 
		,IdComponente6 
		,TiempoParo6 
		,IdComponente7 
		,TiempoParo7 
		,IdComponente8 
		,TiempoParo8 
		,IdComponente9 
		,TiempoParo9 
		,IdComponente10 
		,TiempoParo10 
		,CajasProducidas 
		,CajasSkid 
		,ClaArticulo 
		,PesoScrap 
		--control
		,ClaTipoRegistro  --1 check in, 3 checkout
		,ClaEstatusReplica   --1 nuevo, 2 replicado
		,Evento
		,FechaUltimaMod 
		,NombrePcMod 
		,ClaUsuarioMod 
		,EsManual
		,Comentario
	)
	SELECT Id  
		,IdCelda 
		,FechaAdmScada 
		,ClaTurno 
		,CAST(NULLIF(TiempoTurno,'') AS SMALLINT) AS TiempoTurno
		--,TiempoTurno 
		,CAST(NULLIF(OrdenesTurno,'') AS SMALLINT) AS OrdenesTurno
		,FechaHoraInicioProd 
		,FechaHoraFinProd 
		,CAST(NULLIF(IdComponente1,'') AS SMALLINT) AS IdComponente1
		,CAST(NULLIF(TiempoParo1,'') AS NUMERIC(12,2)) AS  TiempoParo1
		,CAST(NULLIF(IdComponente2, '') AS SMALLINT) AS IdComponente2
		,CAST(NULLIF(TiempoParo2,'') AS NUMERIC(12,2)) AS TiempoParo2 
		,CAST(NULLIF(IdComponente3,'') AS SMALLINT) AS IdComponente3 
		,CAST(NULLIF(TiempoParo3,'') AS NUMERIC(12,2)) AS TiempoParo3 
		,CAST(NULLIF(IdComponente4,'') AS SMALLINT) AS IdComponente4 
		,CAST(NULLIF(TiempoParo4,'') AS NUMERIC(12,2)) AS TiempoParo4 
		,CAST(NULLIF(IdComponente5,'') AS SMALLINT) AS IdComponente5 
		,CAST(NULLIF(TiempoParo5,'') AS NUMERIC(12,2)) AS TiempoParo5 
		,CAST(NULLIF(IdComponente6,'') AS SMALLINT) AS IdComponente6 
		,CAST(NULLIF(TiempoParo6,'') AS NUMERIC(12,2)) AS TiempoParo6 
		,CAST(NULLIF(IdComponente7,'') AS SMALLINT) AS IdComponente7 
		,CAST(NULLIF(TiempoParo7,'') AS NUMERIC(12,2)) AS TiempoParo7 
		,CAST(NULLIF(IdComponente8,'') AS SMALLINT) AS IdComponente8 
		,CAST(NULLIF(TiempoParo8,'') AS NUMERIC(12,2)) AS TiempoParo8 
		,CAST(NULLIF(IdComponente9,'') AS SMALLINT) AS IdComponente9 
		,CAST(NULLIF(TiempoParo9,'') AS NUMERIC(12,2)) AS TiempoParo9 
		,CAST(NULLIF(IdComponente10,'') AS SMALLINT) AS IdComponente10 
		,CAST(NULLIF(TiempoParo10,'') AS NUMERIC(12,2)) AS TiempoParo10 
		,CajasProducidas 
		----,CajasSkid 
		,CAST(NULLIF(CajasSkid,'') AS NUMERIC(6,2)) AS CajasSkid
		,ClaArticulo 
		,CAST(NULLIF(PesoScrap,'') AS NUMERIC(5,2)) AS PesoScrap 
		--,PesoScrap
		--control
		,ClaTipoRegistro  --1 check in, 3 checkout
		,ClaEstatusReplica   --1 nuevo, 2 replicado
		,Evento
		,FechaUltimaMod 
		,NombrePcMod+'_rep' AS NombrePcMod
		,ClaUsuarioMod 
		,EsManual
		,Comentario
	FROM    OPENXML(@handle, '/CheckInOut/CheckInOut', 2)  
		WITH (
		Id  INT
		,IdCelda SMALLINT
		,FechaAdmScada DATE
		,ClaTurno SMALLINT
		,TiempoTurno VARCHAR(6)
		,OrdenesTurno VARCHAR(5)
		,FechaHoraInicioProd DATETIME
		,FechaHoraFinProd DATETIME
		,IdComponente1 VARCHAR(5)
		,TiempoParo1 VARCHAR(6)
		,IdComponente2 VARCHAR(5)
		,TiempoParo2 VARCHAR(6)
		,IdComponente3 VARCHAR(5)
		,TiempoParo3 VARCHAR(6)
		,IdComponente4 VARCHAR(5)
		,TiempoParo4 VARCHAR(6)
		,IdComponente5 VARCHAR(5)
		,TiempoParo5 VARCHAR(6)
		,IdComponente6 VARCHAR(5)
		,TiempoParo6 VARCHAR(6)
		,IdComponente7 VARCHAR(5)
		,TiempoParo7 VARCHAR(6)
		,IdComponente8 VARCHAR(5)
		,TiempoParo8 VARCHAR(6)
		,IdComponente9 VARCHAR(5)
		,TiempoParo9 VARCHAR(6)
		,IdComponente10 VARCHAR(5)
		,TiempoParo10 VARCHAR(6)
		,CajasProducidas SMALLINT
		,CajasSkid SMALLINT
		,ClaArticulo INT
		,PesoScrap VARCHAR(6)
		--control
		,ClaTipoRegistro TINYINT --1 check in, 3 checkout
		,ClaEstatusReplica TINYINT  --1 nuevo, 2 replicado
		,Evento VARCHAR(15)
		,FechaUltimaMod DATETIME
		,NombrePcMod VARCHAR(64)
		,ClaUsuarioMod INT
		,EsManual INT
		,Comentario VARCHAR(400)
		)  

	EXEC sp_xml_removedocument @handle 
	--SELECT * FROM @CheckInOut

	--inicializo la tabla de respuestas
	--la bd local solo actualizara los campos no nulos
	INSERT INTO @tResultado (Id,ClaEstatusReplica)
	SELECT Id
		,2 --no replicado
	FROM @CheckInOut

	--SELECT * FROM @CheckInOut
	--SELECT * FROM @tResultado
	
	SELECT @nId = MIN (Id)
	FROM @CheckInOut
	WHILE @nId IS NOT NULL
	BEGIN
		SELECT 
			 @sIdCelda = IdCelda
			,@tFechaAdmScada = FechaAdmScada 
			,@nClaTurno = ClaTurno 
			,@nTiempoTurno = TiempoTurno 
			,@nOrdenesTurno = OrdenesTurno 
			,@tFechaHoraInicioProd = FechaHoraInicioProd 
			,@tFechaHoraFinProd = FechaHoraFinProd 
			,@nIdComponente1 = IdComponente1 
			,@nTiempoParo1 = TiempoParo1 
			,@nIdComponente2 = IdComponente2 
			,@nTiempoParo2 = TiempoParo2 
			,@nIdComponente3 = IdComponente3 
			,@nTiempoParo3 = TiempoParo3 
			,@nIdComponente4 = IdComponente4 
			,@nTiempoParo4 = TiempoParo4 
			,@nIdComponente5 = IdComponente5 
			,@nTiempoParo5 = TiempoParo5 
			,@nIdComponente6 = IdComponente6 
			,@nTiempoParo6 = TiempoParo6 
			,@nIdComponente7 = IdComponente7 
			,@nTiempoParo7 = TiempoParo7 
			,@nIdComponente8 = IdComponente8 
			,@nTiempoParo8 = TiempoParo8 
			,@nIdComponente9 = IdComponente9 
			,@nTiempoParo9 = TiempoParo9 
			,@nIdComponente10 = IdComponente10 
			,@nTiempoParo10 = TiempoParo10 
			,@nCajasProducidas = CajasProducidas 
			,@nCajasSkid = CajasSkid 
			,@nClaArticulo = ClaArticulo 
			,@nPesoScrap = COALESCE(PesoScrap, 0) 
			--controlontrol
			,@nClaTipoRegistro = ClaTipoRegistro  
			,@nClaEstatusReplica = ClaEstatusReplica   
			,@sEvento = Evento
			,@tFechaUltimaMod = FechaUltimaMod 
			,@sNombrePcMod = NombrePcMod 
			,@nClaUsuarioMod = ClaUsuarioMod 
			,@nEsManual = EsManual
			,@sComentario = Comentario
		FROM @CheckInOut
		WHERE Id = @nId

		BEGIN TRY
			--Inserto el registro en la tabla con la informacion original
			EXEC [AswSch].[ASW_CU165_Pag1_TraReporteProduccionMCSW_IU]
				 @nId 
				,@sIdCelda 
				,@tFechaAdmScada 
				,@nClaTurno 
				,@nTiempoTurno 
				,@nOrdenesTurno 
				,@tFechaHoraInicioProd 
				,@tFechaHoraFinProd 
				,@nIdComponente1 
				,@nTiempoParo1 
				,@nIdComponente2 
				,@nTiempoParo2 
				,@nIdComponente3 
				,@nTiempoParo3 
				,@nIdComponente4 
				,@nTiempoParo4 
				,@nIdComponente5 
				,@nTiempoParo5 
				,@nIdComponente6 
				,@nTiempoParo6 
				,@nIdComponente7 
				,@nTiempoParo7 
				,@nIdComponente8 
				,@nTiempoParo8 
				,@nIdComponente9 
				,@nTiempoParo9 
				,@nIdComponente10 
				,@nTiempoParo10 
				,@nCajasProducidas 
				,@nCajasSkid 
				,@nClaArticulo 
				,@nPesoScrap 
				--control
				,@nClaTipoRegistro  --1 check in, 3 checkout
				,@nClaEstatusReplica --1 nuevo, 2 replicado 
				,@sEvento
				,@tFechaUltimaMod 
				,@sNombrePcMod 
				,@nClaUsuarioMod 
				,@nEsManual
				,@sComentario
			
			END TRY
			BEGIN CATCH

				UPDATE @tResultado
				SET ClaEstatusReplica = 1--no se replico
				WHERE Id=@nId

				DECLARE @ErrorMessage NVARCHAR(4000);  
				DECLARE @ErrorSeverity INT;  
				DECLARE @ErrorState INT;  
  
				SELECT   
					@ErrorMessage = ERROR_MESSAGE(),  
					@ErrorSeverity = ERROR_SEVERITY(),  
					@ErrorState = ERROR_STATE();  

				RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState);  

			END CATCH

		----------------------------------------------------------
		SELECT @nId = MIN (Id)
		FROM @CheckInOut
		WHERE Id>@nId
	END

	select * from @tResultado

END

