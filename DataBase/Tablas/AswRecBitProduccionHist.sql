rollback tran 
/****** Object:  Table [AswSch].[AswRecBitProduccion]    Script Date: 31/07/2023 10:42:35 a. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [AswSch].[AswRecBitProduccionHist](
	[Evento] [bigint] NOT NULL,
	[EventoOrigen] [bigint] NULL,
	[FechaHoraInicio] [datetime] NULL,
	[FechaHoraFin] [datetime] NULL,
	[ClaMaquina] [varchar](30) NULL,
	[ClaProducto] [int] NULL,
	[Terminado] [int] NULL,
	[Duracion] [real] NULL,
	[EntorchadosTotales] [real] NULL,
	[ClaArea] [int] NULL,
	[ClaUbicacion] [int] NULL,
	[ClaDepartamento] [int] NULL,
	[ClaTipoProducto] [int] NULL,
	[FechaUltimaMod] [datetime] NULL,
	[Multiplo] [int] NULL,
	[ClaPuntoMedicion] [varchar](30) NULL,
	[Anio] [int] NULL,
 CONSTRAINT [PK_AswRecBitProduccionHist] PRIMARY KEY NONCLUSTERED 
(
	[Evento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [Historico]
) ON [Historico]
GO


/****** Object:  Index [IX_AswRecBitProduccion_EventoOrigen_ClaMaquina]    Script Date: 31/07/2023 11:01:27 a. m. ******/
CREATE NONCLUSTERED INDEX [IX_AswRecBitProduccionHist_EventoOrigen_ClaMaquina] ON [AswSch].[AswRecBitProduccionHist]
(
	[EventoOrigen] DESC,
	[ClaMaquina] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [Historico]
GO


