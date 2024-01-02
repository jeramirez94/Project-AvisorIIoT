CREATE TABLE [AswSch].[AswRecBitBitProduccion] (
    [Evento]             BIGINT       IDENTITY (1, 1) NOT NULL,
    [EventoOrigen]       BIGINT       NULL,
    [FechaHoraInicio]    DATETIME     NULL,
    [FechaHoraFin]       DATETIME     NULL,
    [ClaMaquina]         VARCHAR (30) NULL,
    [ClaProducto]        INT          NULL,
    [Terminado]          INT          NULL,
    [Duracion]           REAL         NULL,
    [EntorchadosTotales] REAL         NULL,
    [ClaArea]            INT          NULL,
    [ClaUbicacion]       INT          NULL,
    [ClaTipoProducto]    INT          NULL,
    [FechaUltimaMod]     DATETIME     DEFAULT (getdate()) NULL,
    [Multiplo]           INT          DEFAULT ((1)) NULL
) ON [Bitacora];
GO

