USE [ASW]
GO

/****** Object:  Table [MtoSch].[MtoCatEquipo]    Script Date: 26/11/2020 10:42:54 p. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [AswSch].[AswMtoCatEquipo](
	[ClaUbicacion] [int] NOT NULL,
	[ClaEquipo] [int] NOT NULL,
	[CodigoFabricante] [varchar](30) NOT NULL,
	[CodigoMantenimiento] [varchar](30) NOT NULL,
	[NomEquipo] [varchar](200) NOT NULL,
	[ClaGrupoEquipo] [int] NULL,
	[ClaEquipoTipo] [int] NULL,
	[EsCritico] [tinyint] NOT NULL DEFAULT ((0)),
	[ClaDepartamento] [int] NULL,
	[ClaArea] [int] NULL,
	[ClaSubArea] [int] NULL,
	[ClaEquipoPertenece] [int] NULL,
	[ClaMaquina] [varchar](30) NULL,
	[LocalizacionFisica] [varchar](100) NULL,
	[Observaciones] [varchar](500) NULL,
	[FechaInstalacion] [datetime] NULL,
	[NoSerie] [varchar](100) NULL,
	[FechaCompra] [datetime] NULL,
	[ClaTipoGarantia] [int] NULL,
	[FechaInicioGarantia] [datetime] NULL,
	[FechaFinGarantia] [datetime] NULL,
	[DatosProveedor] [varchar](100) NULL,
	[EsLlevaMotorizacion] [tinyint] NULL DEFAULT ((0)),
	[PotenciaInstalada] [int] NULL,
	[ClaUnidadMedidaPI] [int] NULL,
	[ClaAlimentacionElectrica] [int] NULL,
	[ConsumoPorHora] [int] NULL,
	[ClaEstatusEquipo] [int] NULL,
	[ClaEmpresaResponsable] [int] NULL,
	[ClaNominaResponsable] [int] NULL,
	[ClaTrabajadorResponsable] [int] NULL,
	[BajaLogica] [int] NOT NULL,
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL DEFAULT (getdate()),
	[NombrePcMod] [varchar](64) NOT NULL DEFAULT (host_name()),
	[ClaUsuarioMod] [int] NOT NULL,
	[ClaGenerico] [int] NULL,
	[Secuencia] [int] NULL,
	[OrdenHorometro] [int] NULL,
	[NoMapeoPalSN] [bit] NOT NULL DEFAULT ((0)),
 CONSTRAINT [PK_AswMtoCatEquipo] PRIMARY KEY CLUSTERED 
(
	[ClaUbicacion] ASC,
	[ClaEquipo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO