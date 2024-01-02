--Tabla [AswSch].[AswBitSeñal]
DROP INDEX Idx_IdCelda_FechaHoraAvisor_HeaderStatus_ThreaderStatus_CollatorStatus_RobotStatus ON [AswSch].[AswBitSeñal]
ALTER TABLE [AswSch].[AswBitSeñal] ALTER COLUMN [IdCelda] VARCHAR(30) NOT NULL
CREATE NONCLUSTERED INDEX Idx_IdCelda_FechaHoraAvisor_HeaderStatus_ThreaderStatus_CollatorStatus_RobotStatus ON [AswSch].[AswBitSeñal](IdCelda,FechaHoraAvisor,Header_Status,Threader_Status,Collator_Status,Robot_Status)
--Tabla [AswSch].[AswCatFolioBitacora]
ALTER TABLE [AswSch].[AswCatFolioBitacora] DROP CONSTRAINT PK__AswCatFolioBitacora__IdCelda_ClaveFolioBitacora
ALTER TABLE [AswSch].[AswCatFolioBitacora] ALTER COLUMN [IdCelda] VARCHAR(30) NOT NULL
ALTER TABLE [AswSch].[AswCatFolioBitacora] ADD CONSTRAINT PK__AswCatFolioBitacora__IdCelda_ClaveFolioBitacora PRIMARY KEY (IdCelda,ClaveFolioBitacora)
--Tabla [AswSch].[AswBitBitacoraParo]
DROP INDEX Idx_ClaEventoParo_FechaUltimaMod ON [AswSch].[AswBitBitacoraParo]
DROP INDEX Idx_ClaUbicacion_IdComponente_IdParo ON [AswSch].[AswBitBitacoraParo]
ALTER TABLE [AswSch].[AswBitBitacoraParo] ALTER COLUMN [IdComponente] VARCHAR(30) NOT NULL
CREATE NONCLUSTERED INDEX Idx_ClaEventoParo_FechaUltimaMod ON [AswSch].[AswBitBitacoraParo](ClaEventoParo,ClaEventoJustificacion,ClaUbicacion,IdComponente,Id,IdPOFin,FechaAdmSCADA,ClaTurno,FechaHoraInicial,FechaHoraFinal,MicroParoSN,ClaSeccionParo,DuracionSegundos,ClaUsuarioMod,NombrePCMod,FechaUltimaMod)
CREATE NONCLUSTERED INDEX Idx_ClaUbicacion_IdComponente_IdParo ON [AswSch].[AswBitBitacoraParo](ClaUbicacion,IdComponente,IdParo)
--Tabla [AswSch].[AswBitAndon]
ALTER TABLE [AswSch].[AswBitAndon] ALTER COLUMN [IdComponente] VARCHAR(30) NOT NULL
--Tabla [AswSch].[AswBitBitacoraProduccion]
DROP INDEX Idx_ClaUbicacion_IdCelda_IdComponente_IdBitProduccion ON [AswSch].[AswBitBitacoraProduccion]
ALTER TABLE [AswSch].[AswBitBitacoraProduccion] ALTER COLUMN [IdComponente] VARCHAR(30) NOT NULL
ALTER TABLE [AswSch].[AswBitBitacoraProduccion] ALTER COLUMN [IdCelda] VARCHAR(30) NOT NULL
CREATE NONCLUSTERED INDEX Idx_ClaUbicacion_IdCelda_IdComponente_IdBitProduccion ON [AswSch].[AswBitBitacoraProduccion](ClaUbicacion,IdCelda,IdComponente,IdBitProduccion)
--Tabla [AswSch].[AswBitBitacoraBajaEficiencia]
ALTER TABLE [AswSch].[AswBitBitacoraBajaEficiencia] ALTER COLUMN [IdCelda] VARCHAR(30) NOT NULL
--Tabla [AswSch].[AswRelDeployRecursoCelda]
ALTER TABLE [AswSch].[AswRelDeployRecursoCelda] ALTER COLUMN [IdCelda] VARCHAR(30) NOT NULL
--Tabla [AswSch].[AswTraControlVersionAvisor]
ALTER TABLE [AswSch].[AswTraControlVersionAvisor] DROP CONSTRAINT PK__AswTraControlVersionAvisor__IdCelda
ALTER TABLE [AswSch].[AswTraControlVersionAvisor] ALTER COLUMN [IdCelda] VARCHAR(30) NOT NULL
ALTER TABLE [AswSch].[AswTraControlVersionAvisor] ADD CONSTRAINT PK__AswTraControlVersionAvisor__IdCelda PRIMARY KEY (IdCelda)
--Tabla [AswSch].[AswBitControlVersionAvisor]
ALTER TABLE [AswSch].[AswBitControlVersionAvisor] ALTER COLUMN [IdCelda] VARCHAR(30) 
--Tabla [AswSch].[AswCatMaquina]
ALTER TABLE [AswSch].[AswCatMaquina] ALTER COLUMN [ClaCelda] VARCHAR(30) 
--Tabla [AswSch].[AswCatMaquinaAvisor]
ALTER TABLE [AswSch].[AswCatMaquinaAvisor] ALTER COLUMN [ClaCelda] VARCHAR(30) NOT NULL
--Tabla [AswSch].[ASWTraOrdenProduccion]
ALTER TABLE [AswSch].[ASWTraOrdenProduccion] ALTER COLUMN [IdCelda] VARCHAR(30) NOT NULL
--Tabla [AswSch].[TraReporteProduccionMCSW]
DROP INDEX UI_IdLocal_IdCelda ON [AswSch].[TraReporteProduccionMCSW]
ALTER TABLE [AswSch].[TraReporteProduccionMCSW] ALTER COLUMN [IdCelda] VARCHAR(30) NOT NULL
CREATE UNIQUE INDEX UI_IdLocal_IdCelda ON [AswSch].[TraReporteProduccionMCSW] (IdLocal,IdCelda)
--Tabla [AswSch].[AswEstEgeHora]
ALTER TABLE [AswSch].[AswEstEgeHora] DROP CONSTRAINT UQ__AswEstEgeHora__IdCelda_FechaReporte
ALTER TABLE [AswSch].[AswEstEgeHora] ALTER COLUMN [IdCelda] VARCHAR(30) NOT NULL
ALTER TABLE [AswSch].[AswEstEgeHora] ADD CONSTRAINT UQ__AswEstEgeHora__IdCelda_FechaReporte UNIQUE(IdCelda,FechaReporte)
--Tabla [AswSch].[ASWTraScrap]
ALTER TABLE [AswSch].[ASWTraScrap] ALTER COLUMN [IdCelda] VARCHAR(30) NOT NULL
--Tabla [AswSch].[AswMtoTraOT]
ALTER TABLE [AswSch].[AswMtoTraOT] ALTER COLUMN [IdCelda] VARCHAR(30) NOT NULL
--Tabla [AswSch].[AswRelMtoSubAreaCelda]
ALTER TABLE [AswSch].[AswRelMtoSubAreaCelda] ALTER COLUMN [IdCelda] VARCHAR(30) NOT NULL
--Tabla [AswSch].[AswCatTablets]
ALTER TABLE [AswSch].[AswCatTablets] ALTER COLUMN [IdCelda] VARCHAR(30) NOT NULL
--Tabla [AswSch].[AswCatCeldas]
ALTER TABLE [AswSch].[AswCatCeldas] ALTER COLUMN [IdCelda] VARCHAR(30) NOT NULL
