CREATE TABLE [AswSch].[AswRecBitBitParos] (
    [Evento]          BIGINT       IDENTITY (1, 1) NOT NULL,
    [EventoOrigen]    BIGINT       NULL,
    [FechaHoraInicio] DATETIME     NULL,
    [FechaHoraFin]    DATETIME     NULL,
    [ClaMaquina]      VARCHAR (30) NULL,
    [ClaProducto]     INT          NULL,
    [Duracion]        REAL         NULL,
    [ClaParo]         INT          NULL,
    [ClaUbicacion]    INT          NULL,
    [ClaArea]         INT          NULL,
    [FechaUltimaMod]  DATETIME     DEFAULT (getdate()) NULL
) ON [Bitacora];
GO

