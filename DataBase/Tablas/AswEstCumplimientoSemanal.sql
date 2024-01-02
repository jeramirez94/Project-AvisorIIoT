USE [ASW]
GO

/****** Object:  Table [AswSch].[AswEstCumplimientoSemanal]    Script Date: 26/11/2020 12:11:41 p. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [AswSch].[AswEstCumplimientoSemanal](
	[Id] [int] NOT NULL,
	[ClaUbicacion] [int] NULL,
	[ClaveUbicacion] [varchar](50) NULL,
	[Anio] [int] NULL,
	[Mes] [int] NULL,
	[SemanaAnio] [int] NULL,
	[ClaDepartamento] [int] NULL,
	[ClaveDepartamento] [varchar](50) NULL,
	[ClaArea] [int] NULL,
	[ClaveArea] [varchar](50) NULL,
	[ClaMaquina] [int] NULL,
	[ClaveMaquina] [varchar](50) NULL,
	[Nivel] [int] NULL,
	[A1] [numeric](3, 2) NULL,
	[ProgramaProduccion] [numeric](3, 2) NULL,
	[JidokaAndonRespuesta] [numeric](3, 2) NULL,
	[ParosJustificados] [numeric](3, 2) NULL,
	[BajaLogica] [tinyint] NULL,
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NULL,
	[NombrePcMod] [varchar](64) NULL,
	[ClaUsuarioMod] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [AswSch].[AswEstCumplimientoSemanal] ADD  DEFAULT ((0)) FOR [BajaLogica]
GO


CREATE NONCLUSTERED INDEX [NCIdx_CumplimientoSemanal] ON [AswSch].[AswEstCumplimientoSemanal]
(
	[ClaUbicacion] ASC,
	[Anio] ASC,
	[Mes] ASC,
	[Nivel] ASC
)
INCLUDE([ClaDepartamento],[ClaArea],[ClaMaquina]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
