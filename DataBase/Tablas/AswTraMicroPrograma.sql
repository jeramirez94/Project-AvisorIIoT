

CREATE TABLE [AswSch].[AswTraMicroPrograma](
	[ClaUbicacion] [int] NOT NULL,
	[idMicroProg] [bigint] IDENTITY(1,1) NOT NULL,
	[ClaArea] [int] NOT NULL,
	[ClaveArea] [int] NOT NULL,
	[NomArea] [varchar](250) NOT NULL,
	[claDepartamento] [int] NULL,
	[claveDepartamento] [int] NULL,
	[NomDepartamento] [varchar](250) NULL,
	[ClaGrupoMaquina] [int] NOT NULL,
	[ClaveGrupoMaquina] [int] NOT NULL,
	[NomGrupoMaquina] [varchar](250) NOT NULL,
	[IdWorkCenter] [varchar](100) NOT NULL,
	[ClaPeriodo] [int] NOT NULL,
	[Version] [int] NOT NULL,
	[ClaArticulo] [int] NOT NULL,
	[ClaveArticulo] [varchar](150) NOT NULL,
	[NomArticulo] [varchar](1000) NOT NULL,
	[ClaUnidad] [int] NOT NULL,
	[NomUnidad] [varchar](250) NOT NULL,
	[IdOpm] [int] NOT NULL,
	[NomOPM] [varchar](250) NULL,
	[CantidadProgramadaKgs] [float] NOT NULL,
	[CantidadProgramadaUds] [float] NOT NULL,
	[FechaInicioPlan] [datetime] NULL,
	[FechaPromesaOPM] [datetime] NOT NULL,
	[ClaEstatus] [tinyint] NOT NULL,
	[Comentarios] [varchar](8000) NULL,
	[ComentariosProduccion] [varchar](8000) NULL,
	[UnidadesPorPaquete] [float] NULL,
	[FechaInicioReal] [datetime] NULL,
	[FechaFinReal] [datetime] NULL,
	[CantidadProducida] [float] NULL,
	[CantidadPNC] [float] NULL,
	[Ege] [float] NULL,
	[CapacidadKgs] [float] NULL,
	[CapacidadUds] [float] NULL,
	[DuracionEge] [float] NULL,
	[FechaIns] [datetime] NULL,
	[FechaUltimaMod] [datetime] NULL,
	[ClaUsuarioMod] [int] NULL,
	[NombrePcMod] [varchar](250) NULL,
 CONSTRAINT [PK_AswTraMicroPrograma] PRIMARY KEY NONCLUSTERED 
(
	[ClaUbicacion] ASC,
	[idMicroProg] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO



/****** Object:  Index [IX_AswTRaMicroPrograma_NC]    Script Date: 11/04/2023 09:30:55 a. m. ******/
CREATE NONCLUSTERED INDEX [IX_AswTRaMicroPrograma_NC] ON [AswSch].[AswTraMicroPrograma]
(
	[ClaUbicacion] ASC,
	[idMicroProg] ASC,
	[ClaArea] ASC,
	[ClaGrupoMaquina] ASC,
	[IdWorkCenter] ASC,
	[ClaPeriodo] ASC,
	[Version] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
GO

