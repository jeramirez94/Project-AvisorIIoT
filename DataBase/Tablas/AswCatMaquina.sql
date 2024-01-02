CREATE TABLE AswSch.AswCatMaquina(
	[ClaMaquina] int NOT NULL PRIMARY KEY, 
	[ClaveMaquina] varchar(20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL, 
	[NomMaquina] varchar(200) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL, 
	[NumeroSerie] varchar(50) COLLATE SQL_Latin1_General_CP1_CI_AS, 
	[ClaCuentaReparacion] int, 
	[ClaCuentaHerramienta] int, 
	[ClaCelda] [varchar](30), 
	[BajaLogica] int NOT NULL, 
	[FechaBajaLogica] datetime, 
	[FechaUltimaMod] datetime NOT NULL, 
	[ClaUsuarioMod] int, 
	[NombrePcMod] varchar(64) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL, 
	[ClaCuentaOtra] int, 
	[ClaTipoMaquina] int, 
	[ABCMachine] varchar(1) COLLATE SQL_Latin1_General_CP1_CI_AS
)