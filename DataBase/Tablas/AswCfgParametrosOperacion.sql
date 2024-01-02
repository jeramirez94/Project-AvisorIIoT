USE [ASW]
GO
--DROP TABLE [AswSch].[AswCfgParametrosOperacion]
CREATE TABLE [AswSch].[AswCfgParametrosOperacion](
	[ClaUbicacion] [int] NULL,
	[ClaDepartamento] [int] NULL,
	[ClaArea] [int] NULL,
	[IdParametro] [int] NULL,
	[Descripcion] [varchar](150) NULL,
	[Tolerancia] [numeric](8, 2) NULL,
	[Intervalo] [numeric](8, 2) NULL,
	[BloqueoApp] [tinyint] NULL,
	[SeccionParo] [int] NULL,
	[DesempenoVerde] NUMERIC(5,2) NULL,
	[DesempenoAmarillo] NUMERIC(5,2) NULL,
	[DesempenoRojo] NUMERIC(5,2) NULL,
	[FechaUltimaMod] [Datetime] NULL,
	[NombrePcMod] [VARCHAR](64) NULL,
	[ClaUsuarioMod] [INT],
	[BajaLogica] [TINYINT] DEFAULT 0,
	[FechaBajaLogica][DATETIME] NULL
) ON [PRIMARY]
GO