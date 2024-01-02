CREATE TABLE [AswSch].[AswCatTipoScrapCelda] (
    [ClaTipoScrapCelda] int NOT NULL PRIMARY KEY,
    [NomTipoScrapCelda] varchar(50),
    [NomTipoScrapCeldaIngles] varchar(50),
    [BajaLogica] int,
    [FechaBajaLogica] datetime,
    [FechaUltimaMod] datetime,
    [ClaUsuarioMod] int,
    [NombrePcMod] varchar(100),
    [ClaTipoScrap] int
)