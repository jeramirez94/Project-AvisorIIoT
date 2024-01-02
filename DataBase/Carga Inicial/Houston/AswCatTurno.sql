
--Carga inicial de turnos para HOUSTON

-- DELETE [AswSch].[AswCatTurno]
INSERT [AswSch].[AswCatTurno] ([ClaUbicacion],[ClaTurno],[NomTurno],[Duracion],[BajaLogica],[FechaBajaLogica],[FechaUltimaMod])VALUES(65,1,'Morning',10,0,NULL,GETDATE())
INSERT [AswSch].[AswCatTurno] ([ClaUbicacion],[ClaTurno],[NomTurno],[Duracion],[BajaLogica],[FechaBajaLogica],[FechaUltimaMod])VALUES(65,2,'Evening',10,0,NULL,GETDATE())
