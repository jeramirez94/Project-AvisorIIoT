CREATE TABLE AswSch.AswCatTurno(
GO

CREATE UNIQUE NONCLUSTERED INDEX [UIDX_CatTurno]
    ON [AswSch].[AswCatTurno]([ClaTurno] ASC);
GO