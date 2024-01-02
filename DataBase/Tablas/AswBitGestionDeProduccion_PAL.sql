USE ASW
GO
CREATE TABLE AswSch.AswBitGestionDeProduccion_PAL(
	[ClaUbicacion] [int] NOT NULL,
	[Cla1] [int] NOT NULL,
	[Nom1] [varchar](200) NOT NULL,
	[Anio] [int] NOT NULL,
	[Mes] [int] NOT NULL,
	[MesAdm] [int] NULL,
	[Dia] [int] NOT NULL,
	[SemanaDelAnio] [int] NOT NULL,
	[FechaAdmScada] [datetime] NOT NULL,
	[FechaInicioAdm] [datetime] NULL,
	[ClaDepartamento] [int] NOT NULL,
	[ClaArea] [int] NOT NULL,
	[ClaveMaquina] [varchar](200) NOT NULL,
	[ClaTurno] [int] NOT NULL,
	[Unidades] [numeric](19, 2) NULL,
	[Toneladas] [numeric](19, 2) NULL,
	[KilosPNC] [numeric](19, 2) NULL,
	[Aprovechamiento] [numeric](19, 2) NULL,
	[Disponibilidad] [numeric](19, 2) NULL,
	[Eficiencia] [numeric](19, 2) NULL,
	[Calidad] [numeric](19, 2) NULL,
	[EGE] [numeric](19, 2) NULL,
	[ClaUsuarioMod] [int] NOT NULL,
	[NombrePcMod] [varchar](64) NOT NULL,
	[FechaUltimaMod] [datetime] NOT NULL,
 CONSTRAINT [pk_AswBitGestionDeProduccion_PAL] PRIMARY KEY CLUSTERED 
(
	[ClaUbicacion] ASC,
	[ClaDepartamento] ASC,
	[Anio] ASC,
	[Mes] ASC,
	[Dia] ASC,
	[ClaArea] ASC,
	[ClaveMaquina] ASC,
	[FechaAdmScada] ASC,
	[ClaTurno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE AswSch.AswBitGestionDeProduccion_PAL ADD  CONSTRAINT [DF1_AswBitGestionDeProduccion_PA]  DEFAULT (getdate()) FOR [FechaUltimaMod]
GO


