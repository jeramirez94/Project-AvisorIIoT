USE ASW
GO

CREATE TABLE AswSch.ASWCatBSCTipoMejora(
	[ClaTipoMejora] [int] NOT NULL,
	[NomTipoMejora] [varchar](50) NOT NULL,
	[BajaLogica] [tinyint] NOT NULL,
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL,
	[ClaUsuarioMod] [int] NOT NULL,
	[NombrePcMod] [varchar](64) NOT NULL,
 CONSTRAINT [PK_ASWTipoMejora] PRIMARY KEY CLUSTERED 
(
	[ClaTipoMejora] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO