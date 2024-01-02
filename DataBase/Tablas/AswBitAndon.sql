USE [ASW]
GO

/****** Object:  Table [AswSch].[AswBitAndon]    Script Date: 11/11/2022 03:53:53 p. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [AswSch].[AswBitAndon](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ClaUbicacion] [int] NOT NULL,
	[IdComponente] [varchar](30) NOT NULL,
	[IdAndon] [int] NOT NULL,
	[IdPOInicio] [int] NOT NULL,
	[IdPOFin] [int] NULL,
	[IdUnidad] [int] NULL,
	[IdUsuario] [int] NULL,
	[FechaHoraInicial] [datetime] NULL,
	[FechaHoraReasignado] [datetime] NULL,
	[FechaHoraAtencion] [datetime] NULL,
	[FechaHoraFinal] [datetime] NULL,
	[DuracionSegundos] [int] NULL,
	[ClaTurno] [tinyint] NULL,
	[FechaAdmSCADA] [date] NULL,
	[ClaGrupoParo] [int] NULL,
	[ClaTipoParo] [int] NULL,
	[ClaSeccionParo] [int] NULL,
	[ClaEventoNuevo] [tinyint] NULL,
	[ClaEventoReasignacion] [tinyint] NULL,
	[ClaEventoAtencion] [tinyint] NULL,
	[ClaEventoSolucionado] [tinyint] NULL,
	[ClaEstatusReplica] [tinyint] NULL,
	[ClaUsuarioMod] [int] NOT NULL,
	[NombrePCMod] [varchar](64) NOT NULL,
	[FechaUltimaMod] [datetime] NOT NULL,
	[BajaLogica] [int] NULL,
	[Comentarios] [varchar](400) NULL,
	[ComentariosSolucion] [varchar](400) NULL,
	[NombreEmpleado] [varchar](400) NULL,
	[StatusError] [int] NULL,
	[MsgError] [varchar](500) NULL,
	[IdErpMsw] [int] NULL,
	[MsgErrorJustificacion] [varchar](500) NULL,
	[MsgErrorReasignacion] [varchar](500) NULL,
	[MsgErrorAtencion] [varchar](500) NULL,
	[MsgErrorSolucion] [varchar](500) NULL,
	[EnvioCorreoSN] [tinyint] NULL,
	[IdTipoSeguimientoAlerta] [tinyint] NULL,
 CONSTRAINT [PK_AswBitAndon] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [Bitacora]
) ON [Bitacora]
GO

ALTER TABLE [AswSch].[AswBitAndon] ADD  DEFAULT ((0)) FOR [BajaLogica]
GO



