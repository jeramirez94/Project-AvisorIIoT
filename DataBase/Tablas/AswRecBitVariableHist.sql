
/****** Object:  Table [AswSch].[AswRecBitVariable]    Script Date: 31/07/2023 11:07:51 a. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [AswSch].[AswRecBitVariableHist](
	[Evento] [bigint]  NOT NULL,
	[EventoOrigen] [bigint] NULL,
	[ClaPuntoMedicion] [varchar](30) NULL,
	[Anio] [int] NULL,
	[FechaHoraMaquina] [datetime] NULL,
	[ClaVariable] [int] NULL,
	[ClaMaquina] [varchar](30) NULL,
	[Valor] [real] NULL,
	[ClaProducto] [bigint] NULL,
	[ClaUbicacion] [int] NULL,
	[ClaDepartamento] [int] NULL,
	[ClaArea] [int] NULL,
	[ClaSubarea] [int] NULL,
	[FechaUltimaMod] [datetime] NULL,
 CONSTRAINT [PK_AswRecBitVariableHist] PRIMARY KEY CLUSTERED 
(
	[Evento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [Historico]
) ON [Historico]
GO


/****** Object:  Index [IX_AswRecBitVariable_EventoOrigen_ClaMaquina]    Script Date: 31/07/2023 11:09:31 a. m. ******/
CREATE NONCLUSTERED INDEX [IX_AswRecBitVariableHist_EventoOrigen_ClaMaquina] ON [AswSch].[AswRecBitVariableHist]
(
	[ClaMaquina] ASC,
	[ClaVariable] ASC,
	[Valor] ASC,
	[EventoOrigen] ASC,
	[FechaHoraMaquina] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [Historico]
GO


