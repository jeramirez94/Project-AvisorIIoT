
/****** Object:  Table [AswSch].[AswRecBitParos]    Script Date: 31/07/2023 10:23:09 a. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [AswSch].[AswRecBitParosHist](
	[Evento] [bigint] NOT NULL,
	[EventoOrigen] [bigint] NULL,
	[FechaHoraInicio] [datetime] NULL,
	[FechaHoraFin] [datetime] NULL,
	[ClaMaquina] [varchar](30) NULL,
	[ClaProducto] [int] NULL,
	[Duracion] [real] NULL,
	[ClaParo] [int] NULL,
	[ClaUbicacion] [int] NULL,
	[ClaArea] [int] NULL,
	[FechaUltimaMod] [datetime] NULL,
	[ClaDepartamento] [int] NULL,
	[ClaPuntoMedicion] [varchar](30) NULL,
	[Anio] [int] NULL,
 CONSTRAINT [PK_AswRecBitParosHist] PRIMARY KEY NONCLUSTERED 
(
	[Evento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [Historico]
) ON [Historico]
GO


/****** Object:  Index [IX_AswRecBitParos_EventoOrigen_ClaMaquina]    Script Date: 31/07/2023 11:06:24 a. m. ******/
CREATE NONCLUSTERED INDEX [IX_AswRecBitParosHist_EventoOrigen_ClaMaquina] ON [AswSch].[AswRecBitParosHist]
(
	[EventoOrigen] DESC,
	[ClaMaquina] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [Historico]
GO



