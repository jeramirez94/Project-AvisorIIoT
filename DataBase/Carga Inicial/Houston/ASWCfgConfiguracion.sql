USE ASW
GO

DELETE [AswSch].[ASWCfgConfiguracion]

INSERT [AswSch].[ASWCfgConfiguracion] ([ClaUbicacion],[ClaConfiguracion],[ClaveConfiguracion],[DescConfiguracion],[DescConfiguracionES],[Valor1],[Valor2],[Valor3],[Svalor1],[Svalor2],[Svalor3],[Numero1],[Numero2],[Numero3],[Fecha1],[Fecha2],[Fecha3],[FechaUltimaMod],[NombrePcMod],[ClaUsuarioMod],[BajaLogica],[FechaBajaLogica])
VALUES(65,1,'UBI_DEFAULT','Default Location','Ubicacion Default',65,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Feb  1 2020 12:00:00:000AM','carga inicia',0,0,NULL)
INSERT [AswSch].[ASWCfgConfiguracion] ([ClaUbicacion],[ClaConfiguracion],[ClaveConfiguracion],[DescConfiguracion],[DescConfiguracionES],[Valor1],[Valor2],[Valor3],[Svalor1],[Svalor2],[Svalor3],[Numero1],[Numero2],[Numero3],[Fecha1],[Fecha2],[Fecha3],[FechaUltimaMod],[NombrePcMod],[ClaUsuarioMod],[BajaLogica],[FechaBajaLogica])
VALUES(65,2,NULL,'Order Sales Locations','Localidades Ordenes de Venta',NULL,NULL,NULL,'8,28','8-PB,28-WD / MO',NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Feb  1 2020 12:00:00:000AM','carga inicia',0,0,NULL)
INSERT [AswSch].[ASWCfgConfiguracion] ([ClaUbicacion],[ClaConfiguracion],[ClaveConfiguracion],[DescConfiguracion],[DescConfiguracionES],[Valor1],[Valor2],[Valor3],[Svalor1],[Svalor2],[Svalor3],[Numero1],[Numero2],[Numero3],[Fecha1],[Fecha2],[Fecha3],[FechaUltimaMod],[NombrePcMod],[ClaUsuarioMod],[BajaLogica],[FechaBajaLogica])
VALUES(65,3,'MICROPARO','Micro-Torque Duration Minutes','Duracion MicroParo Minuto',3,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'May 21 2020  3:29:08:970PM','carga inicia',0,0,NULL)
INSERT [AswSch].[ASWCfgConfiguracion] ([ClaUbicacion],[ClaConfiguracion],[ClaveConfiguracion],[DescConfiguracion],[DescConfiguracionES],[Valor1],[Valor2],[Valor3],[Svalor1],[Svalor2],[Svalor3],[Numero1],[Numero2],[Numero3],[Fecha1],[Fecha2],[Fecha3],[FechaUltimaMod],[NombrePcMod],[ClaUsuarioMod],[BajaLogica],[FechaBajaLogica])
VALUES(65,4,'CHANGEOVER','Duration ChangeOver Minutes','Duracion ChangeOver horas',30,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'May 21 2020  3:32:18:647PM','carga inicia',0,0,NULL)
INSERT [AswSch].[ASWCfgConfiguracion] ([ClaUbicacion],[ClaConfiguracion],[ClaveConfiguracion],[DescConfiguracion],[DescConfiguracionES],[Valor1],[Valor2],[Valor3],[Svalor1],[Svalor2],[Svalor3],[Numero1],[Numero2],[Numero3],[Fecha1],[Fecha2],[Fecha3],[FechaUltimaMod],[NombrePcMod],[ClaUsuarioMod],[BajaLogica],[FechaBajaLogica])
VALUES(65,10,'CLA_NAILS_BOX','ClaCaracteristica nails/box','ClaCaracteristica clavos/caja',1412,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Jul 15 2020  1:49:44:523PM','Carga Inicial',0,0,NULL)
INSERT [AswSch].[ASWCfgConfiguracion] ([ClaUbicacion],[ClaConfiguracion],[ClaveConfiguracion],[DescConfiguracion],[DescConfiguracionES],[Valor1],[Valor2],[Valor3],[Svalor1],[Svalor2],[Svalor3],[Numero1],[Numero2],[Numero3],[Fecha1],[Fecha2],[Fecha3],[FechaUltimaMod],[NombrePcMod],[ClaUsuarioMod],[BajaLogica],[FechaBajaLogica])
VALUES(65,11,'SCRAP_LIMIT','Scrap Limmit','Limite Scrap',5,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Jul 15 2020  1:49:44:523PM','Carga Inicial',0,0,NULL)
INSERT [AswSch].[ASWCfgConfiguracion] ([ClaUbicacion],[ClaConfiguracion],[ClaveConfiguracion],[DescConfiguracion],[DescConfiguracionES],[Valor1],[Valor2],[Valor3],[Svalor1],[Svalor2],[Svalor3],[Numero1],[Numero2],[Numero3],[Fecha1],[Fecha2],[Fecha3],[FechaUltimaMod],[NombrePcMod],[ClaUsuarioMod],[BajaLogica],[FechaBajaLogica])
VALUES(65,12,NULL,'ruta archivos operadores','ruta archivos operadores',NULL,NULL,NULL,'\\localhost\ASW\operadores',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-09-04 13:33:00','Carga Inicial',0,0,NULL)
INSERT [AswSch].[ASWCfgConfiguracion] ([ClaUbicacion],[ClaConfiguracion],[ClaveConfiguracion],[DescConfiguracion],[DescConfiguracionES],[Valor1],[Valor2],[Valor3],[Svalor1],[Svalor2],[Svalor3],[Numero1],[Numero2],[Numero3],[Fecha1],[Fecha2],[Fecha3],[FechaUltimaMod],[NombrePcMod],[ClaUsuarioMod],[BajaLogica],[FechaBajaLogica])
VALUES(65,13,'PATH_BLUEPRINT','Path to blueprint folder in the tablet','Ruta de carpeta de blueprints en la tablet',NULL,NULL,NULL,'../../Proyecto/Contents/blueprints/',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2020-10-14 13:33:00','Carga Inicial',0,0,NULL)
INSERT [AswSch].[ASWCfgConfiguracion] ([ClaUbicacion],[ClaConfiguracion],[ClaveConfiguracion],[DescConfiguracion],[DescConfiguracionES],[Valor1],[Valor2],[Valor3],[Svalor1],[Svalor2],[Svalor3],[Numero1],[Numero2],[Numero3],[Fecha1],[Fecha2],[Fecha3],[FechaUltimaMod],[NombrePcMod],[ClaUsuarioMod],[BajaLogica],[FechaBajaLogica])
VALUES(65,14,'AUTOLOGIN','Autologin configuration','Configuracion de autologin',1,3502001,NULL,'COLLATOR',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2022-04-25 13:33:00','Carga Inicial',0,0,NULL)
INSERT [AswSch].[ASWCfgConfiguracion] ([ClaUbicacion],[ClaConfiguracion],[ClaveConfiguracion],[DescConfiguracion],[DescConfiguracionES],[Valor1],[Valor2],[Valor3],[Svalor1],[Svalor2],[Svalor3],[Numero1],[Numero2],[Numero3],[Fecha1],[Fecha2],[Fecha3],[FechaUltimaMod],[NombrePcMod],[ClaUsuarioMod],[BajaLogica],[FechaBajaLogica])
VALUES(65,15,'ERROR_MAILS','Error Mail List','Correos Reportes de Error',NULL,NULL,NULL,'ngalaz@deacero.com;josari@deacero.com;mrodriguezc@deacero.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2022-06-15 11:34:03.657','Carga Inicial',0,0,NULL)
INSERT [AswSch].[ASWCfgConfiguracion] ([ClaUbicacion],[ClaConfiguracion],[ClaveConfiguracion],[DescConfiguracion],[DescConfiguracionES],[Valor1],[Valor2],[Valor3],[Svalor1],[Svalor2],[Svalor3],[Numero1],[Numero2],[Numero3],[Fecha1],[Fecha2],[Fecha3],[FechaUltimaMod],[NombrePcMod],[ClaUsuarioMod],[BajaLogica],[FechaBajaLogica])
VALUES(65,16,'TEST_MAIL','Test Error Mail List','Test Error Mail List',NULL,NULL,NULL,'josari@deacero.com',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2022-06-15 11:34:03.657','Carga Inicial',0,0,NULL)
INSERT [AswSch].[ASWCfgConfiguracion] ([ClaUbicacion],[ClaConfiguracion],[ClaveConfiguracion],[DescConfiguracion],[DescConfiguracionES],[Valor1],[Valor2],[Valor3],[Svalor1],[Svalor2],[Svalor3],[Numero1],[Numero2],[Numero3],[Fecha1],[Fecha2],[Fecha3],[FechaUltimaMod],[NombrePcMod],[ClaUsuarioMod],[BajaLogica],[FechaBajaLogica])
VALUES(65,17,'CARGA_ARTICULO','Carga inicial de Articulos por orden de producción (1) o capacidad (2) según la ubicación','Carga inicial de Articulos por orden de producción (1) o capacidad (2) según la ubicación',2,NULL,NULL,'NULL',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2023-01-24 17:00:00.000','Carga Inicial',0,0,NULL)
INSERT [AswSch].[ASWCfgConfiguracion] ([ClaUbicacion],[ClaConfiguracion],[ClaveConfiguracion],[DescConfiguracion],[DescConfiguracionES],[Valor1],[Valor2],[Valor3],[Svalor1],[Svalor2],[Svalor3],[Numero1],[Numero2],[Numero3],[Fecha1],[Fecha2],[Fecha3],[FechaUltimaMod],[NombrePcMod],[ClaUsuarioMod],[BajaLogica],[FechaBajaLogica])
select 65, 18, 'PPL_LNKSVR', 'Connection to PPL server', 'Conexion a Servidor de PPL', null, null,null,'PPL_LNKSVR.OPERACION.PPLSCH.PPLSrvSecuenciaMicroprogramaSemanal',null,null,null,null, null,null,null,null,getdate(),'Carga inicial',0,0,null
INSERT [AswSch].[ASWCfgConfiguracion] ([ClaUbicacion],[ClaConfiguracion],[ClaveConfiguracion],[DescConfiguracion],[DescConfiguracionES],[Valor1],[Valor2],[Valor3],[Svalor1],[Svalor2],[Svalor3],[Numero1],[Numero2],[Numero3],[Fecha1],[Fecha2],[Fecha3],[FechaUltimaMod],[NombrePcMod],[ClaUsuarioMod],[BajaLogica],[FechaBajaLogica])
select 65, 19, 'RES_ALERTAS', 'Destinatarios para recibir alertas del sistema avisor', 'Destinatarios para recibir alertas del sistema avisor', null, null,null,'+5218333656175,+5214611893208','José,Martha',null,null,null, null,null,null,null,getdate(),'Carga inicial',0,0,null
INSERT [AswSch].[ASWCfgConfiguracion] ([ClaUbicacion],[ClaConfiguracion],[ClaveConfiguracion],[DescConfiguracion],[DescConfiguracionES],[Valor1],[Valor2],[Valor3],[Svalor1],[Svalor2],[Svalor3],[Numero1],[Numero2],[Numero3],[Fecha1],[Fecha2],[Fecha3],[FechaUltimaMod],[NombrePcMod],[ClaUsuarioMod],[BajaLogica],[FechaBajaLogica])
select 65, 20, 'CAR_PRINCIPAL', 'Product Main Features', 'Caracteristicas principales del articulo', null, null,null,'1009,1-PP',null,null,null,null, null,null,null,null,getdate(),'Carga inicial',0,0,null
INSERT [AswSch].[ASWCfgConfiguracion] ([ClaUbicacion],[ClaConfiguracion],[ClaveConfiguracion],[DescConfiguracion],[DescConfiguracionES],[Valor1],[Valor2],[Valor3],[Svalor1],[Svalor2],[Svalor3],[Numero1],[Numero2],[Numero3],[Fecha1],[Fecha2],[Fecha3],[FechaUltimaMod],[NombrePcMod],[ClaUsuarioMod],[BajaLogica],[FechaBajaLogica])
select 65, 21, 'PERFIL_APP', 'Perfiles autorizados para login en la app', 'Authorized profiles to log in the app', null, null,null,'3500000,3500001',null,null,null,null, null,null,null,null,getdate(),'Carga inicial',0,0,null
INSERT [AswSch].[ASWCfgConfiguracion] ([ClaUbicacion],[ClaConfiguracion],[ClaveConfiguracion],[DescConfiguracion],[DescConfiguracionES],[Valor1],[Valor2],[Valor3],[Svalor1],[Svalor2],[Svalor3],[Numero1],[Numero2],[Numero3],[Fecha1],[Fecha2],[Fecha3],[FechaUltimaMod],[NombrePcMod],[ClaUsuarioMod],[BajaLogica],[FechaBajaLogica])
select 65, 22, 'ONLINE HISTORY', 'Meses de historia que quedan en linea', 'Months of history left online', -1, null,null,null,null,null,null,null, null,null,null,null,getdate(),'Carga inicial',0,0,null
INSERT INTO AswSch.ASWCfgConfiguracion([ClaUbicacion],[ClaConfiguracion],[ClaveConfiguracion],[DescConfiguracion],[DescConfiguracionES],[Valor1],[Valor2],[Valor3],[Svalor1],[Svalor2],[Svalor3],[Numero1],[Numero2],[Numero3],[Fecha1],[Fecha2],[Fecha3],[FechaUltimaMod],[NombrePcMod],[ClaUsuarioMod],[BajaLogica],[FechaBajaLogica])
VALUES('65','23','SISTEMA','System number','Numero del sistema','350',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Aug  7 2023  6:00PM','Carga Inicial','0','0',NULL)
INSERT INTO AswSch.ASWCfgConfiguracion([ClaUbicacion],[ClaConfiguracion],[ClaveConfiguracion],[DescConfiguracion],[DescConfiguracionES],[Valor1],[Valor2],[Valor3],[Svalor1],[Svalor2],[Svalor3],[Numero1],[Numero2],[Numero3],[Fecha1],[Fecha2],[Fecha3],[FechaUltimaMod],[NombrePcMod],[ClaUsuarioMod],[BajaLogica],[FechaBajaLogica])
VALUES('65','24','PERFILES_SIS','Rango de perfiles del sistema','System profile range','3500000','3509999',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'Aug  9 2023  1:11PM','Carga Inicial','0','0',NULL)
