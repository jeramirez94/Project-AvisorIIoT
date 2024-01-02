CREATE TABLE AswSch.AswCatTurno(ClaUbicacion int,ClaTurno int,NomTurno varchar(10),Duracion int,BajaLogica int,FechaBajaLogica datetime,FechaUltimaMod datetime)
GO

CREATE UNIQUE NONCLUSTERED INDEX [UIDX_CatTurno]
    ON [AswSch].[AswCatTurno]([ClaTurno] ASC);
GO
