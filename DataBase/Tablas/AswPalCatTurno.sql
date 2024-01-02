/****** Object:  Table [PalSch].[PalCatTurno]    Script Date: 12/06/2023 03:49:39 p. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE AswSch.AswPalCatTurno(
	[ClaUbicacion] [int] NOT NULL,
	[ClaTurno] [int] NOT NULL,
	[NomTurno] [varchar](255) NULL,
	[Duracion] [float] NULL,
	[HoraInicio] [datetime] NULL,
	[HoraFin] [datetime] NULL,
	[Orden] [int] NULL,
	[BajaLogica] [tinyint] NULL,
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NULL,
	[NombrePcMod] [varchar](64) NULL,
	[ClaUsuarioMod] [int] NULL,
 CONSTRAINT [PK_AswPalCatTurno] PRIMARY KEY CLUSTERED 
(
	[ClaUbicacion] ASC,
	[ClaTurno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO