USE [ASW]
GO

/****** Object:  Table [AswSch].[ASW_ASWLite_BitParos]    Script Date: 11/11/2022 03:59:51 p. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [AswSch].[ASW_ASWLite_BitParos](
	[ClaUbicacion] [int] NULL,
	[IdComponente] [int] NULL,
	[IdParo] [int] NULL,
	[IdPOInicio] [int] NULL,
	[IdPOFin] [int] NULL,
	[idUnidad] [int] NULL,
	[idUsuario] [int] NULL,
	[fechaHoraInicial] [datetime] NULL,
	[fechaHoraFinal] [datetime] NULL,
	[microParoSN] [tinyint] NULL,
	[DuracionSegundos] [numeric](18, 0) NULL,
	[fechaAdmSCADA] [datetime] NULL,
	[ClaTurno] [int] NULL,
	[claGrupoParo] [int] NULL,
	[claParo] [int] NULL,
	[claSeccionParo] [int] NULL,
	[ClaEstatusReplica] [int] NULL,
	[ClaEventoParo] [int] NULL,
	[ClaEventoJustificacion] [int] NULL,
	[ClaEventoReasignacion] [int] NULL,
	[ClaEventoAtencion] [int] NULL,
	[ClaEventoSolucionado] [int] NULL,
	[IdParoProgramado] [int] NULL,
	[FechaHoraJustificado] [datetime] NULL,
	[FechaHoraReasignado] [datetime] NULL,
	[FechaHoraAtencion] [datetime] NULL,
	[FechaHoraSolucion] [datetime] NULL,
	[ClaUsuarioMod] [int] NOT NULL,
	[NombrePCMod] [varchar](64) NOT NULL,
	[FechaUltimaMod] [datetime] NOT NULL,
	[BajaLogica] [tinyint] NULL,
	[Comentarios] [varchar](400) NULL,
	[ComentariosSolucion] [varchar](400) NULL,
	[NombreEmpleado] [varchar](300) NULL,
	[ClaEventoCierre] [int] NULL,
	[IdAgrupador] [int] NULL
) ON [PRIMARY]
GO

ALTER TABLE [AswSch].[ASW_ASWLite_BitParos] ADD  DEFAULT ((0)) FOR [BajaLogica]
GO


