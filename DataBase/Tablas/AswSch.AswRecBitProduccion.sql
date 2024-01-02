/****** Object:  Table [dbo].[bitacoraProduccionAVISOR_HIST]    Script Date: 11/01/2023 12:03:19 p. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE AswSch.AswRecBitProduccion(
	[Evento] BIGINT IDENTITY NOT NULL,	
	[EventoOrigen] BIGINT NULL,
	[ClaPuntoMedicion] VARCHAR(30) NULL,
	[Anio] INT NULL,
	[FechaHoraInicio] DATETIME NULL,
	[FechaHoraFin] DATETIME NULL,
	[ClaMaquina] VARCHAR(30) NULL,
	[ClaProducto] INT NULL,
	[Terminado] INT NULL,
	[Duracion] REAL NULL,
	[EntorchadosTotales] REAL NULL,
	[ClaArea] INT NULL,
	[ClaUbicacion] INT NULL,
	[ClaDepartamento] INT NULL,
	[ClaTipoProducto] INT NULL,
	[FechaUltimaMod] DATETIME DEFAULT(GETDATE()),
	[Multiplo] INT DEFAULT(1),
	CONSTRAINT PK_AswRecBitProduccion PRIMARY KEY CLUSTERED (Evento)
) ON [Bitacora]
GO

CREATE NONCLUSTERED INDEX IX_AswRecBitProduccion_EventoOrigen_ClaMaquina
ON [AswSch].AswRecBitProduccion ([EventoOrigen] DESC,[ClaMaquina])
GO
