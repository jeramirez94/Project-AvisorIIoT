--USE [ASW]
--GO
/****** Object:  StoredProcedure [AswSch].[ASW_CU705_Pag1_ActualizaOt_Proc]    Script Date: 15/11/2022 04:08:36 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
begin tran

EXECUTE AswSch.ASW_CU705_Pag1_ActualizaOt_Proc @xml = '<?xml version="1.0" encoding="UTF-8" standalone="yes"?><ActualizaOt><Ot><Ot><ClaUbicacion>68</ClaUbicacion><IdOt>29</IdOt><ClaEstatusOt>1</ClaEstatusOt><ClaEquipo>12</ClaEquipo><IdCelda>4</IdCelda><EsTerminada>0</EsTerminada><ClaEstatusReplica/><BajaLogica>0</BajaLogica><FechaBajaLogica/><ClaUsuarioMod>0</ClaUsuarioMod><NombrePcMod>AVISOR</NombrePcMod><FechaUltimaMod>2020-12-10 16:39:16.820</FechaUltimaMod></Ot></Ot><Actividad><Actividad><ClaUbicacion>68</ClaUbicacion><IdOt>29</IdOt><ClaActividad>129519</ClaActividad><EsRealizada>0</EsRealizada><GeneraDerivadaSN/><IdOtDerivada/><ClaEstatusReplica/><BajaLogica>0</BajaLogica><FechaBajaLogica/><ClaUsuarioMod>6295</ClaUsuarioMod><NombrePcMod>PB COLLATED CELL #1</NombrePcMod><FechaUltimaMod>2021-01-12 10:30:24</FechaUltimaMod></Actividad></Actividad><Paso><Paso><ClaUbicacion>68</ClaUbicacion><IdOt>29</IdOt><ClaActividad>129519</ClaActividad><ClaActividadPaso>2</ClaActividadPaso><EsRealizada>0</EsRealizada><ClaEstatusReplica>1</ClaEstatusReplica><BajaLogica>0</BajaLogica><FechaBajaLogica/><ClaUsuarioMod>6295</ClaUsuarioMod><NombrePcMod>PB COLLATED CELL #1</NombrePcMod><FechaUltimaMod>2021-01-12 10:30:24</FechaUltimaMod></Paso></Paso><Variable><Variable><ClaUbicacion>68</ClaUbicacion><IdOt>29</IdOt><ClaActividad>129519</ClaActividad><ClaActividadPaso>2</ClaActividadPaso><ClaVariable>2</ClaVariable><ValorReal/><ClaOpcionFija/><ClaTipoVariable/><ClaEstatusReplica>1</ClaEstatusReplica><BajaLogica>0</BajaLogica><FechaBajaLogica/><ClaUsuarioMod>0</ClaUsuarioMod><NombrePcMod>PB COLLATED CELL #1</NombrePcMod><FechaUltimaMod>2021-01-12 10:30:24</FechaUltimaMod></Variable></Variable></ActualizaOt>'

rollback tran
*/

/*XML
<?xml version="1.0" encoding="UTF-8" standalone="yes"?>
<ActualizaOt>
	<Ot>
		<Ot>
			<ClaUbicacion>68</ClaUbicacion>
			<IdOt>29</IdOt>
			<ClaEstatusOt>1</ClaEstatusOt>
			<ClaEquipo>12</ClaEquipo>
			<IdCelda>4</IdCelda>
			<EsTerminada>0</EsTerminada>
			<ClaEstatusReplica/>
			<BajaLogica>0</BajaLogica>
			<FechaBajaLogica/>
			<ClaUsuarioMod>0</ClaUsuarioMod>
			<NombrePcMod>AVISOR</NombrePcMod>
			<FechaUltimaMod>2020-12-10 16:39:16.820</FechaUltimaMod>
		</Ot>
	</Ot>
	<Actividad>
		<Actividad>
			<ClaUbicacion>68</ClaUbicacion>
			<IdOt>29</IdOt>
			<ClaActividad>129519</ClaActividad>
			<EsRealizada>0</EsRealizada>
			<GeneraDerivadaSN/>
			<IdOtDerivada/>
			<ClaEstatusReplica/>
			<BajaLogica>0</BajaLogica>
			<FechaBajaLogica/>
			<ClaUsuarioMod>6295</ClaUsuarioMod>
			<NombrePcMod>PB COLLATED CELL #1</NombrePcMod>
			<FechaUltimaMod>2021-01-12 10:30:24</FechaUltimaMod>
		</Actividad>
	</Actividad>
	<Paso>
		<Paso>
			<ClaUbicacion>68</ClaUbicacion>
			<IdOt>29</IdOt>
			<ClaActividad>129519</ClaActividad>
			<ClaActividadPaso>2</ClaActividadPaso>
			<EsRealizada>0</EsRealizada>
			<ClaEstatusReplica>1</ClaEstatusReplica>
			<BajaLogica>0</BajaLogica>
			<FechaBajaLogica/>
			<ClaUsuarioMod>6295</ClaUsuarioMod>
			<NombrePcMod>PB COLLATED CELL #1</NombrePcMod>
			<FechaUltimaMod>2021-01-12 10:30:24</FechaUltimaMod>
		</Paso>
	</Paso>
	<Variable>
		<Variable>
			<ClaUbicacion>68</ClaUbicacion>
			<IdOt>29</IdOt>
			<ClaActividad>129519</ClaActividad>
			<ClaActividadPaso>2</ClaActividadPaso>
			<ClaVariable>2</ClaVariable>
			<ValorReal/>
			<ClaOpcionFija/>
			<ClaTipoVariable/>
			<ClaEstatusReplica>1</ClaEstatusReplica>
			<BajaLogica>0</BajaLogica>
			<FechaBajaLogica/>
			<ClaUsuarioMod>0</ClaUsuarioMod>
			<NombrePcMod>PB COLLATED CELL #1</NombrePcMod>
			<FechaUltimaMod>2021-01-12 10:30:24</FechaUltimaMod>
		</Variable>
	</Variable>
</ActualizaOt>
*/
ALTER PROCEDURE [AswSch].[ASW_CU705_Pag1_ActualizaOt_Proc]
	@xml XML
AS
BEGIN

	DECLARE @handle INT  
	DECLARE @PrepareXmlStatus INT  

	DECLARE @psIdOts VARCHAR(MAX)
		,@ptMinFechaUltimaMod DATETIME
		,@psIdOtDets VARCHAR(MAX)
		,@ptMinFechaUltimaModDet DATETIME

	DECLARE @MtoOT TABLE(
		ClaUbicacion INT
		,IdOt INT
		,ClaEstatusOt INT
		,ClaEquipo INT
		,IdCelda VARCHAR(30)
		,EsTerminada BIT
		,ClaEstatusReplica INT
		,BajaLogica INT
		,FechaBajaLogica DATETIME
		,ClaUsuarioMod INT
		,NombrePcMod VARCHAR(64)
		,FechaUltimaMod DATETIME
	)

	DECLARE @MtoActividad TABLE(
		ClaUbicacion INT
		,IdOt INT
		,ClaActividad INT
		,EsRealizada INT
		,GeneraDerivadaSN INT
		,IdOtDerivada INT
		,ClaEstatusReplica INT
		,BajaLogica INT
		,FechaBajaLogica DATETIME
		,ClaUsuarioMod INT
		,NombrePcMod VARCHAR(64)
		,FechaUltimaMod DATETIME
	)

	DECLARE @MtoPaso TABLE(
		ClaUbicacion INT
		,IdOt INT
		,ClaActividad INT
		,ClaActividadPaso INT
		,EsRealizada INT
		,ClaEstatusReplica INT
		,BajaLogica INT
		,FechaBajaLogica DATETIME
		,ClaUsuarioMod INT
		,NombrePcMod VARCHAR(64)
		,FechaUltimaMod DATETIME
	)

	DECLARE @MtoVariable TABLE(
		ClaUbicacion INT
		,IdOt INT
		,ClaActividad INT
		,ClaActividadPaso INT
		,ClaVariable INT
		,ValorReal NUMERIC(19,4)
		,ClaOpcionFija INT
		,ClaTipoVariable INT
		,ClaEstatusReplica INT
		,BajaLogica INT
		,FechaBajaLogica DATETIME
		,ClaUsuarioMod INT
		,NombrePcMod VARCHAR(64)
		,FechaUltimaMod DATETIME
	)

	EXEC @PrepareXmlStatus= sp_xml_preparedocument @handle OUTPUT, @xml  

	INSERT INTO @MtoOT(
		ClaUbicacion
		,IdOt
		,ClaEstatusOt
		,ClaEquipo
		,IdCelda
		,EsTerminada
		,ClaEstatusReplica
		,BajaLogica
		,FechaBajaLogica
		,ClaUsuarioMod
		,NombrePcMod
		,FechaUltimaMod
	)
	SELECT ClaUbicacion
		,IdOt
		,ClaEstatusOt
		,ClaEquipo
		,IdCelda
		,EsTerminada
		,ClaEstatusReplica
		,BajaLogica
		,FechaBajaLogica
		,ClaUsuarioMod
		,NombrePcMod
		,FechaUltimaMod
	FROM    OPENXML(@handle, '/ActualizaOt/Ot/Ot', 2)  
		WITH (
			
		ClaUbicacion INT
		,IdOt INT
		,ClaEstatusOt INT
		,ClaEquipo INT
		,IdCelda VARCHAR(30)
		,EsTerminada BIT
		,ClaEstatusReplica INT
		,BajaLogica INT
		,FechaBajaLogica DATETIME
		,ClaUsuarioMod INT
		,NombrePcMod VARCHAR(64)
		,FechaUltimaMod DATETIME
		)  
	WHERE ClaEstatusReplica = 1

	INSERT INTO @MtoActividad(
		ClaUbicacion
		,IdOt
		,ClaActividad
		,EsRealizada 
		,GeneraDerivadaSN 
		,IdOtDerivada 
		,ClaEstatusReplica
		,BajaLogica
		,FechaBajaLogica
		,ClaUsuarioMod
		,NombrePcMod
		,FechaUltimaMod
	)
	SELECT ClaUbicacion
		,IdOt
		,ClaActividad
		,EsRealizada 
		,GeneraDerivadaSN 
		,IdOtDerivada 
		,ClaEstatusReplica
		,BajaLogica
		,FechaBajaLogica
		,ClaUsuarioMod
		,NombrePcMod
		,FechaUltimaMod
	FROM    OPENXML(@handle, '/ActualizaOt/Actividad/Actividad', 2)  
		WITH (
		ClaUbicacion INT
		,IdOt INT
		,ClaActividad INT
		,EsRealizada INT
		,GeneraDerivadaSN INT
		,IdOtDerivada INT
		,ClaEstatusReplica INT
		,BajaLogica INT
		,FechaBajaLogica DATETIME
		,ClaUsuarioMod INT
		,NombrePcMod VARCHAR(64)
		,FechaUltimaMod DATETIME
		)  
	WHERE ClaEstatusReplica = 1

	INSERT INTO @MtoPaso(
		ClaUbicacion
		,IdOt
		,ClaActividad
		,ClaActividadPaso
		,EsRealizada
		,ClaEstatusReplica
		,BajaLogica
		,FechaBajaLogica
		,ClaUsuarioMod
		,NombrePcMod
		,FechaUltimaMod
	)
	SELECT ClaUbicacion
		,IdOt
		,ClaActividad
		,ClaActividadPaso
		,EsRealizada
		,ClaEstatusReplica
		,BajaLogica
		,FechaBajaLogica
		,ClaUsuarioMod
		,NombrePcMod
		,FechaUltimaMod
	FROM    OPENXML(@handle, '/ActualizaOt/Paso/Paso', 2)  
		WITH (
		ClaUbicacion INT
		,IdOt INT
		,ClaActividad INT
		,ClaActividadPaso INT
		,EsRealizada INT
		,ClaEstatusReplica INT
		,BajaLogica INT
		,FechaBajaLogica DATETIME
		,ClaUsuarioMod INT
		,NombrePcMod VARCHAR(64)
		,FechaUltimaMod DATETIME
		)  
	WHERE ClaEstatusReplica = 1

	INSERT INTO @MtoVariable(
		ClaUbicacion
		,IdOt
		,ClaActividad
		,ClaActividadPaso
		,ClaVariable
		,ValorReal 
		,ClaOpcionFija 
		,ClaTipoVariable
		,ClaEstatusReplica
		,BajaLogica
		,FechaBajaLogica
		,ClaUsuarioMod
		,NombrePcMod
		,FechaUltimaMod
	)
	SELECT ClaUbicacion
		,IdOt
		,ClaActividad
		,ClaActividadPaso
		,ClaVariable
		,CAST(NULLIF(ValorReal,'') AS NUMERIC(19, 4)) 
		,ClaOpcionFija 
		,ClaTipoVariable 
		,ClaEstatusReplica
		,BajaLogica
		,FechaBajaLogica
		,ClaUsuarioMod
		,NombrePcMod
		,FechaUltimaMod
	FROM    OPENXML(@handle, '/ActualizaOt/Variable/Variable', 2)  
		WITH (
		ClaUbicacion INT
		,IdOt INT
		,ClaActividad INT
		,ClaActividadPaso INT
		,ClaVariable INT
		,ValorReal VARCHAR(24)
		,ClaOpcionFija INT
		,ClaTipoVariable INT
		,ClaEstatusReplica INT
		,BajaLogica INT
		,FechaBajaLogica DATETIME
		,ClaUsuarioMod INT
		,NombrePcMod VARCHAR(64)
		,FechaUltimaMod DATETIME
		)  
	WHERE ClaEstatusReplica = 1

	EXEC sp_xml_removedocument @handle 

	--SELECT * FROM @MtoOT
	--SELECT * FROM @MtoActividad
	--SELECT * FROM @MtoPaso
	--SELECT * FROM @MtoVariable

	UPDATE OT
	SET OT.ClaEstatusOt = OTR.ClaEstatusOt
		,OT.EsTerminada = OTR.EsTerminada
		,OT.ClaEstatusReplica = 1--replicar a MTD
		,OT.ClaUsuarioMod = OTR.ClaUsuarioMod
		,OT.NombrePcMod = OTR.NombrePcMod
		,OT.FechaUltimaMod = OTR.FechaUltimaMod
	FROM [AswSch].[AswMtoTraOT] OT
	JOIN @MtoOT OTR
	ON OT.ClaUbicacion = OTR.ClaUbicacion
		AND OT.IdOt = OTR.IdOT 

	UPDATE A
	SET A.EsRealizada = AR.EsRealizada
		,A.GeneraDerivadaSN = AR.GeneraDerivadaSN
		,A.ClaEstatusReplica = 1--replicar a MTD
		,A.ClaUsuarioMod = AR.ClaUsuarioMod
		,A.NombrePcMod = AR.NombrePcMod
		,A.FechaUltimaMod = AR.FechaUltimaMod
	FROM [AswSch].[AswMtoTraOTActividad] A
	JOIN @MtoActividad AR
	ON A.ClaUbicacion = AR.ClaUbicacion
		AND A.IdOt = AR.IdOT 
		AND A.ClaActividad = AR.ClaActividad 

	UPDATE P
	SET P.EsRealizada = PR.EsRealizada
		,P.ClaEstatusReplica = 1--replicar a MTD
		,P.ClaUsuarioMod = PR.ClaUsuarioMod
		,P.NombrePcMod = PR.NombrePcMod
		,P.FechaUltimaMod = PR.FechaUltimaMod
	FROM [AswSch].[AswMtoTraOTActividadPaso] P
	JOIN @MtoPaso PR
	ON P.ClaUbicacion = PR.ClaUbicacion
		AND P.IdOt = PR.IdOT 
		AND P.ClaActividad = PR.ClaActividad 
		AND P.ClaActividadPaso = PR.ClaActividadPaso 

	UPDATE V
	SET V.ValorReal = VR.ValorReal
		,V.ClaOpcionFija = VR.ClaOpcionFija
		,V.ClaEstatusReplica = 1--replicar a MTD
		,V.ClaUsuarioMod = VR.ClaUsuarioMod
		,V.NombrePcMod = VR.NombrePcMod
		,V.FechaUltimaMod = VR.FechaUltimaMod
	FROM [AswSch].[AswMtoTraOTActividadVariable] V
	JOIN @MtoVariable VR
	ON V.ClaUbicacion = VR.ClaUbicacion
		AND V.IdOt = VR.IdOT 
		AND V.ClaActividad = VR.ClaActividad 
		AND V.ClaActividadPaso = VR.ClaActividadPaso 
		AND V.ClaVariable = VR.ClaVariable 

	
	SELECT ClaUbicacion
		,IdOt
		,2 AS ClaEstatusReplica
	FROM @MtoOT
	WHERE ClaEstatusReplica=1

	SELECT ClaUbicacion
		,IdOt
		,ClaActividad
		,2 AS ClaEstatusReplica
	FROM @MtoActividad
	WHERE ClaEstatusReplica=1

	SELECT ClaUbicacion
		,IdOt
		,ClaActividad
		,ClaActividadPaso
		,2 AS ClaEstatusReplica
	FROM @MtoPaso
	WHERE ClaEstatusReplica=1

	SELECT ClaUbicacion
		,IdOt
		,ClaActividad
		,ClaActividadPaso
		,ClaVariable
		,2 AS ClaEstatusReplica
	FROM @MtoVariable
	WHERE ClaEstatusReplica=1

END
