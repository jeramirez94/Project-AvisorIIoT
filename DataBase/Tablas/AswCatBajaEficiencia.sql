CREATE TABLE [AswSch].[AswCatBajaEficiencia] (
	[ClaUbicacion] int NOT NULL, 
	[ClaArea] int NOT NULL, 
	[ClaBajaEficiencia] int NOT NULL, 
	[ClaveBajaEficiencia] int, 
	[NomBajaEficiencia] varchar(255) NOT NULL, 
	[ClaRubroParo] int NOT NULL, 
	[BajaLogica] tinyint NOT NULL, 
	[FechaBajaLogica] datetime, 
	[FechaUltimaMod] datetime NOT NULL, 
	[NombrePcMod] varchar(64) NOT NULL, 
	[ClaUsuarioMod] int NOT NULL,
	CONSTRAINT [PK_MSWPalCatBajaEficiencia] PRIMARY KEY ([ClaUbicacion], [ClaArea], [ClaBajaEficiencia])
)
