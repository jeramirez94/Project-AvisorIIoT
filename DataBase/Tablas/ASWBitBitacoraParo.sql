

USE [ASW]
GO

/****** Object:  Table [AswSch].[AswBitBitacoraParo]    Script Date: 11/11/2022 01:22:04 p. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [AswSch].[AswBitBitacoraParo](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[ClaUbicacion] [int] NOT NULL,
	[ClaPuntoMedicion] VARCHAR(30) NULL,
	[Anio] INT NULL,
	[IdComponente] [varchar](30) NOT NULL,
	[IdParo] [int] NOT NULL,
	[IdPOInicio] [int] NOT NULL,
	[IdPOFin] [int] NULL,
	[IdUnidad] [int] NULL,
	[IdUsuario] [int] NULL,
	[FechaHoraInicial] [datetime] NULL,
	[FechaHoraFinal] [datetime] NULL,
	[MicroParoSN] [tinyint] NULL,
	[DuracionSegundos] [int] NULL,
	[ClaTurno] [int] NULL,
	[FechaAdmSCADA] [datetime] NULL,
	[ClaGrupoParo] [int] NULL,
	[ClaParo] [int] NULL,
	[ClaSeccionParo] [int] NULL,
	[IdParoProgramado] [int] NULL,
	[ClaEventoParo] [int] NULL,
	[ClaEventoJustificacion] [int] NULL,
	[ClaEventoReasignacion] [tinyint] NULL,
	[ClaEventoAtencion] [tinyint] NULL,
	[ClaEventoSolucionado] [tinyint] NULL,
	[FechaHoraJustificado] [datetime] NULL,
	[FechaHoraReasignado] [datetime] NULL,
	[FechaHoraAtencion] [datetime] NULL,
	[FechaHoraSolucion] [datetime] NULL,
	[ClaEstatusReplica] [tinyint] NULL,
	[ClaUsuarioMod] [int] NOT NULL,
	[NombrePCMod] [varchar](64) NOT NULL,
	[FechaUltimaMod] [datetime] NOT NULL,
	[BajaLogica] [int] NULL,
	[Comentarios] [varchar](400) NULL,
	[ComentariosSolucion] [varchar](400) NULL,
	[NombreEmpleado] [varchar](300) NULL,
	[ClaEventoCierre] [tinyint] DEFAULT ((0)) NULL,
	[StatusError] [int] NULL,
	[MsgError] [varchar](500) NULL,
	[IdErpMsw] [int] NULL,
	[MsgErrorJustificacion] [varchar](500) NULL,
	[MsgErrorReasignacion] [varchar](500) NULL,
	[MsgErrorAtencion] [varchar](500) NULL,
	[MsgErrorSolucion] [varchar](500) NULL,
	[MsgErrorSolucionAtm] [varchar](500) NULL,
	[EnvioCorreoSN] [tinyint] NULL,
	[IdAgrupador] [int] NULL,
 CONSTRAINT [PK_AswBitBitacoraParo] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [Bitacora]
) ON [Bitacora]
GO

ALTER TABLE [AswSch].[AswBitBitacoraParo] ADD  DEFAULT ((0)) FOR [MicroParoSN]
GO

ALTER TABLE [AswSch].[AswBitBitacoraParo] ADD  DEFAULT ((0)) FOR [BajaLogica]
GO

CREATE NONCLUSTERED INDEX Idx_ClaEventoParo_FechaUltimaMod ON [AswSch].[AswBitBitacoraParo](ClaEventoParo,ClaEventoJustificacion,ClaUbicacion,IdComponente,Id,IdPOFin,FechaAdmSCADA,ClaTurno,FechaHoraInicial,FechaHoraFinal,MicroParoSN,ClaSeccionParo,DuracionSegundos,ClaUsuarioMod,NombrePCMod,FechaUltimaMod)
GO

CREATE NONCLUSTERED INDEX Idx_ClaUbicacion_IdComponente_IdParo ON [AswSch].[AswBitBitacoraParo](ClaUbicacion,IdComponente,IdParo)
GO



