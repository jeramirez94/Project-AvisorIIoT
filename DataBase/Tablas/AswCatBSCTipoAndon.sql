USE ASW
GO

CREATE TABLE [ASWSch].[AswCatBSCTipoAndon] (
	[ClaTipoAndon] int NOT NULL, 
	[NomTipoAndon] varchar(50) NOT NULL, 
	[BajaLogica] tinyint NOT NULL, 
	[FechaBajaLogica] datetime, 
	[FechaUltimaMod] datetime NOT NULL, 
	[ClaUsuarioMod] int NOT NULL, 
	[NombrePcMod] varchar(64) NOT NULL, 
	[NomTipoAndonCorto] varchar(30),
	CONSTRAINT [PK_AswCatBSCTipoAndon] PRIMARY KEY CLUSTERED 
(
	[ClaTipoAndon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
)