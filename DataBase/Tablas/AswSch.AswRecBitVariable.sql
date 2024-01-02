/****** Object:  Table [dbo].[bitVariableAVISOR]    Script Date: 11/01/2023 12:04:48 p. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE AswSch.AswRecBitVariable(
	[Evento] BIGINT IDENTITY NOT NULL,
	[EventoOrigen] BIGINT NULL,	
	[ClaPuntoMedicion] VARCHAR(30) NULL,
	[Anio] INT NULL,
	[FechaHoraMaquina] DATETIME NULL,
	[ClaVariable] INT NULL,
	[ClaMaquina] VARCHAR(30) NULL,
	[Valor] REAL NULL,
	[ClaProducto] BIGINT NULL,
	[ClaUbicacion] INT NULL,
	[ClaDepartamento] INT NULL,
	[ClaArea] INT NULL,
	[ClaSubarea] INT NULL,
	[FechaUltimaMod] DATETIME DEFAULT(GETDATE()),
	CONSTRAINT PK_AswRecBitVariable PRIMARY KEY CLUSTERED (Evento)
) ON [Bitacora]
GO


CREATE NONCLUSTERED INDEX [IX_AswRecBitVariable_EventoOrigen_ClaMaquina] ON [AswSch].[AswRecBitVariable]
(
	[ClaMaquina] ASC,
	[ClaVariable] ASC,
	[Valor] ASC,
	[FechaHoraMaquina] ASC,
	[EventoOrigen] DESC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [Bitacora]
GO
