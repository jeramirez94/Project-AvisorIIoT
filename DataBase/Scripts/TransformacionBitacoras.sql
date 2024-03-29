USE [ASW]

-- EXEC [AswSch].[ASW_CU305_Pag1_CalculaEGEHora] 65, '2023-02-16 13:16:00', 1
SELECT TOP 1000 * FROM [AswSch].[AswBitBitacoraProduccion]
SELECT TOP 1000 * FROM [AswSch].[AswRecBitProduccion]


DELETE [AswSch].[AswBitBitacoraProduccion]

INSERT INTO [AswSch].[AswBitBitacoraProduccion](
	[ClaUbicacion]
      ,[IdBitProduccion]
      ,[IdCelda]
      ,[IdComponente]
      ,[IdPO]
      --,[IdCaja]
      --,[ClaArticulo]
      ,[ClaveCorte]
      ,[FechaHoraInicio]
      ,[FechaHoraFin]
      ,[DuracionSegundos]
      ,[ClavosInicio]
      ,[ClavosFin]
      ,[CajasInicio]
      ,[CajasFin]
      --,[CajasXHora]
      ,[ClaTurno]
      ,[FechaAdm]
      --,[Hora]
      --,[ClaEstatusReplica]
      --,[BajaLogica]
      --,[FechaBajaLogica]
      --,[ClaUsuarioMod]
      --,[NombrePCMod]
      --,[FechaUltimaMod]
)
SELECT DISTINCT [ClaUbicacion]
	,EventoOrigen AS [IdBitProduccion]
	,WC.IdWorkCenter AS [IdCelda]
	,WU.ClaMaquina AS [IdComponente]
	,0 AS [IdPO]
	,'FINCAJA' AS [ClaveCorte]
	,[FechaHoraInicio]
	,[FechaHoraFin]
	,Duracion AS [DuracionSegundos]
	,0 AS [ClavosInicio]
	,EntorchadosTotales AS [ClavosFin]
	,0 AS [CajasInicio]
	,1 AS [CajasFin]
	,[AswSch].[ASWGetTurno] (ClaUbicacion, WC.ClaDepartamento, [FechaHoraFin]) AS ClaTurno 
	,[AswSch].[ASWGetFechaAdm] (ClaUbicacion, WC.ClaDepartamento, [FechaHoraFin]) AS FechaAdm
FROM [AswSch].[AswRecBitProduccion] RBP
JOIN [AswSch].[AswCatWorkUnitVw] WU
	ON RBP.ClaMaquina = WU.ClaMaquina
JOIN [AswSch].[AswCatWorkCenterVw] WC
	ON WU.IdWorkCenter = WC.IdWorkCenter


SELECT TOP 1000 * FROM [AswSch].[AswBitBitacoraParo] where FechaHoraInicial>='2023-02-15'
SELECT TOP 1000 * FROM [AswSch].[AswRecBitParos]

DELETE [AswSch].[AswBitBitacoraParo]

INSERT INTO [AswSch].[AswBitBitacoraParo](--[Id]
      [ClaUbicacion]
      ,[IdComponente]
      ,[IdParo]
      ,[IdPOInicio]
      --,[IdPOFin]
      --,[IdUnidad]
      --,[IdUsuario]
	,[FechaHoraInicial]
    ,[FechaHoraFinal]
    ,[MicroParoSN]
    ,[DuracionSegundos]
    ,[ClaTurno]
    ,[FechaAdmSCADA]
      --,[ClaGrupoParo]
      --,[ClaParo]
      --,[ClaSeccionParo]
      --,[IdParoProgramado]
      --,[ClaEventoParo]
      --,[ClaEventoJustificacion]
      --,[ClaEventoReasignacion]
      --,[ClaEventoAtencion]
      --,[ClaEventoSolucionado]
      --,[FechaHoraJustificado]
      --,[FechaHoraReasignado]
      --,[FechaHoraAtencion]
      --,[FechaHoraSolucion]
      --,[ClaEstatusReplica]
      ,[ClaUsuarioMod]
      ,[NombrePCMod]
      ,[FechaUltimaMod]
      --,[BajaLogica]
      --,[Comentarios]
      --,[ComentariosSolucion]
      --,[NombreEmpleado]
      --,[ClaEventoCierre]
      --,[StatusError]
      --,[MsgError]
      --,[IdErpMsw]
      --,[MsgErrorJustificacion]
      --,[MsgErrorReasignacion]
      --,[MsgErrorAtencion]
      --,[MsgErrorSolucion]
      --,[MsgErrorSolucionAtm]
      --,[EnvioCorreoSN]
      --,[IdAgrupador]
	  )
SELECT DISTINCT --[Evento] AS Id
	ClaUbicacion
	,RBP.ClaMaquina AS IdComponente
	,EventoOrigen AS IdParo
	,0 AS IdPoInicio
	,[FechaHoraInicio] AS [FechaHoraInicial]
    ,[FechaHoraFin] AS [FechaHoraFinal]
    ,CASE WHEN [Duracion]>3*60 THEN 0 ELSE 1 END AS [MicroParoSN]
    ,[Duracion] AS [DuracionSegundos]
	,[AswSch].[ASWGetTurno] (ClaUbicacion, WC.ClaDepartamento, [FechaHoraInicio]) AS ClaTurno --TODO: partir paros por turno
	,[AswSch].[ASWGetFechaAdm] (ClaUbicacion, WC.ClaDepartamento, [FechaHoraInicio]) AS FechaAdm
	,0 AS ClaUsuarioMod
	,'Recolector' AS NombrePcMod
	,GETDATE() AS [FechaUltimaMod]
FROM [AswSch].[AswRecBitParos] RBP
JOIN [AswSch].[AswCatWorkUnitVw] WU
	ON RBP.ClaMaquina = WU.ClaMaquina
JOIN [AswSch].[AswCatWorkCenterVw] WC
	ON WU.IdWorkCenter = WC.IdWorkCenter
WHERE EventoOrigen IS NOT NULL
	AND RBP.FechaUltimaMod IS NOT NULL
	--AND EventoOrigen = 14801

