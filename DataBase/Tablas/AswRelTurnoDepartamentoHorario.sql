--DROP TABLE [AswSch].[AswRelTurnoDepartamentoHorario]
CREATE TABLE [AswSch].[AswRelTurnoDepartamentoHorario](
    [ClaUbicacion] [int] NOT NULL,
	[ClaTurno] [int] NOT NULL,
	[ClaDepartamento] [int] NOT NULL,
	[HoraInicioTurno] [time](7) NULL,
	[HoraFinTurno] [time](7) NULL,
	[ProduccionDiaInicio] [int] NULL,
	[BajaLogica] [int] NULL,
	[FechaUltimaMod] [datetime] NULL,
	[ClaUsuarioMod] [int] NOT NULL,
	[NombrePcMod] [varchar](64),
    CONSTRAINT [PK_AswRelTurnoDepartamentoHorario] PRIMARY KEY CLUSTERED ([ClaUbicacion] ASC, [ClaTurno] ASC, [ClaDepartamento] ASC)
) ON [PRIMARY]
GO

ALTER TABLE [AswSch].[AswRelTurnoDepartamentoHorario] ADD  DEFAULT ((0)) FOR [BajaLogica]
GO

--CatDepartamento es una vista ahora
--ALTER TABLE [AswSch].[AswRelTurnoDepartamentoHorario]  WITH CHECK ADD FOREIGN KEY([ClaDepartamento])
--REFERENCES [AswSch].[AswCatDepartamento] ([ClaDepartamento])
--GO

ALTER TABLE [AswSch].[AswRelTurnoDepartamentoHorario]  WITH CHECK ADD FOREIGN KEY([ClaTurno])
REFERENCES [AswSch].[AswCatTurno] ([ClaTurno])
GO