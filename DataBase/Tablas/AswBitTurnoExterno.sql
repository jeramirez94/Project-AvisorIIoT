
CREATE TABLE [AswSch].[AswBitTurnoExterno] (
    [Id]              INT          IDENTITY (1, 1) NOT NULL,
    [ClaUbicacion]    INT          NULL,
    [IdWorkCenter]    VARCHAR (30) NOT NULL,
    [FechaAdm]        DATETIME     NULL,
    [ClaTurno]        INT          NULL,
    [ClaTurnoExterno] INT          NOT NULL,
    [BajaLogica]      INT          DEFAULT ((0)) NULL,
    [FechaBajaLogica] DATETIME     NULL,
    [ClaUsuarioMod]   INT          NULL,
    [NombrePCMod]     VARCHAR (64) NULL,
    [FechaUltimaMod]  DATETIME     NULL,
    PRIMARY KEY CLUSTERED ([Id] ASC) ON [Bitacora]
) ON [Bitacora];
GO
