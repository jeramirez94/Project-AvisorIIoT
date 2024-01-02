USE [ASW]
GO
--DELETE FROM [AswSch].[AswCatTablets]
INSERT INTO [AswSch].[AswCatTablets]([IdTablet],[ClaUbicacion],[IdCelda],[DireccionIp],[DireccionMac],[BajaLogica],[FechaBajaLogica],[ClaUsuarioMod],[NombrePcMod],[FechaUltimaMod],[Dispositivo])
VALUES(1,65,'FF-01',NULL,NULL,1,NULL,0,'Carga inicial',GETDATE(),'PC')
GO
INSERT INTO [AswSch].[AswCatTablets]([IdTablet],[ClaUbicacion],[IdCelda],[DireccionIp],[DireccionMac],[BajaLogica],[FechaBajaLogica],[ClaUsuarioMod],[NombrePcMod],[FechaUltimaMod],[Dispositivo])
VALUES(2,65,'FF-02',NULL,NULL,0,NULL,0,'Carga inicial',GETDATE(),'PC')
GO
INSERT INTO [AswSch].[AswCatTablets]([IdTablet],[ClaUbicacion],[IdCelda],[DireccionIp],[DireccionMac],[BajaLogica],[FechaBajaLogica],[ClaUsuarioMod],[NombrePcMod],[FechaUltimaMod],[Dispositivo])
VALUES(3,65,'FF-03','192.168.1.220',NULL,0,NULL,0,'Carga inicial',GETDATE(),'PC')
GO
INSERT INTO [AswSch].[AswCatTablets]([IdTablet],[ClaUbicacion],[IdCelda],[DireccionIp],[DireccionMac],[BajaLogica],[FechaBajaLogica],[ClaUsuarioMod],[NombrePcMod],[FechaUltimaMod],[Dispositivo])
VALUES(4,65,'FF-04',NULL,NULL,0,NULL,0,'Carga inicial',GETDATE(),'PC')
GO
INSERT INTO [AswSch].[AswCatTablets]([IdTablet],[ClaUbicacion],[IdCelda],[DireccionIp],[DireccionMac],[BajaLogica],[FechaBajaLogica],[ClaUsuarioMod],[NombrePcMod],[FechaUltimaMod],[Dispositivo])
VALUES(5,65,'FF-05',NULL,NULL,0,NULL,0,'Carga inicial',GETDATE(),'PC')
GO
INSERT INTO [AswSch].[AswCatTablets]([IdTablet],[ClaUbicacion],[IdCelda],[DireccionIp],[DireccionMac],[BajaLogica],[FechaBajaLogica],[ClaUsuarioMod],[NombrePcMod],[FechaUltimaMod],[Dispositivo])
VALUES(6,65,'FF-06',NULL,NULL,0,NULL,0,'Carga inicial',GETDATE(),'PC')
GO
INSERT INTO [AswSch].[AswCatTablets]([IdTablet],[ClaUbicacion],[IdCelda],[DireccionIp],[DireccionMac],[BajaLogica],[FechaBajaLogica],[ClaUsuarioMod],[NombrePcMod],[FechaUltimaMod],[Dispositivo])
VALUES(7,65,'FF-07',NULL,NULL,1,NULL,0,'Carga inicial',GETDATE(),'PC')
GO
INSERT INTO [AswSch].[AswCatTablets]([IdTablet],[ClaUbicacion],[IdCelda],[DireccionIp],[DireccionMac],[BajaLogica],[FechaBajaLogica],[ClaUsuarioMod],[NombrePcMod],[FechaUltimaMod],[Dispositivo])
VALUES(8,65,'FF-08',NULL,NULL,1,NULL,0,'Carga inicial',GETDATE(),'PC')
GO


