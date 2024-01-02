USE [ASW]
GO

/****** Object:  Table [AswSch].[AswRelTurnoCeldaExcepciones]    Script Date: 29/05/2020 02:24:12 p.m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [AswSch].[AswRelTurnoCeldaExcepciones](
	[ClaUbicacion] [int] NOT NULL,
	[ClaTurno] [int] NOT NULL,
	[ClaDepartamento] [int] NOT NULL,
	[IdCelda] [int] NOT NULL,
	[NomCelda] [varchar](10) NULL,
	[HoraInicio] [time](7) NULL,
	[HoraFin] [time](7) NULL,
	[BajaLogica] [int] NULL,
	[FechaUltimaMod] [datetime] NULL,
	[NombrePcMod] [varchar](64) NOT NULL,
	[ClaUsuarioMod] [int] NOT NULL,
 CONSTRAINT [PK_AswRelTurnoCeldaExcepciones] PRIMARY KEY CLUSTERED 
(
	[ClaUbicacion] ASC,
	[ClaTurno] ASC,
	[ClaDepartamento] ASC,
	[IdCelda] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

ALTER TABLE [AswSch].[AswRelTurnoCeldaExcepciones] ADD  DEFAULT ((0)) FOR [BajaLogica]
GO

ALTER TABLE [AswSch].[AswRelTurnoCeldaExcepciones]  WITH CHECK ADD FOREIGN KEY([ClaDepartamento])
REFERENCES [AswSch].[AswCatDepartamento] ([ClaDepartamento])
GO

ALTER TABLE [AswSch].[AswRelTurnoCeldaExcepciones]  WITH CHECK ADD FOREIGN KEY([ClaTurno])
REFERENCES [AswSch].[AswCatTurno] ([ClaTurno])
GO


