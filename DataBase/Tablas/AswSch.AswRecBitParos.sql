/****** Object:  Table [dbo].[bitacoraParosAVISOR_HIST]    Script Date: 11/01/2023 11:53:00 a. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE AswSch.AswRecBitParos(
	[Evento] BIGINT IDENTITY NOT NULL,
	[EventoOrigen] BIGINT NULL,
	[ClaPuntoMedicion] VARCHAR(30) NULL,
	[Anio] INT NULL,
	[FechaHoraInicio] DATETIME NULL,
	[FechaHoraFin] DATETIME NULL,
	[ClaMaquina] VARCHAR(30) NULL,
	[ClaProducto] INT NULL,
	[Duracion] REAL NULL,
	[ClaParo] INT NULL,
	[ClaUbicacion] INT NULL,
	[ClaDepartamento] INT NULL,
	[ClaArea] INT NULL,
	[FechaUltimaMod] DATETIME DEFAULT(GETDATE()),
	CONSTRAINT PK_AswRecBitParos PRIMARY KEY CLUSTERED (Evento)
) ON [Bitacora]
GO


CREATE NONCLUSTERED INDEX IX_AswRecBitParos_EventoOrigen_ClaMaquina
ON [AswSch].AswRecBitParos ([EventoOrigen] DESC,[ClaMaquina])
GO