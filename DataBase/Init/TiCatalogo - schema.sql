USE [TiCatalogo]
GO
/****** Object:  Schema [AveSch]    Script Date: 26/08/2020 01:22:26 p. m. ******/
CREATE SCHEMA [AveSch]
GO
/****** Object:  Schema [DTSch]    Script Date: 26/08/2020 01:22:26 p. m. ******/
CREATE SCHEMA [DTSch]
GO
/****** Object:  Schema [Inventarios]    Script Date: 26/08/2020 01:22:26 p. m. ******/
CREATE SCHEMA [Inventarios]
GO
/****** Object:  Schema [transfer]    Script Date: 26/08/2020 01:22:26 p. m. ******/
CREATE SCHEMA [transfer]
GO
/****** Object:  Schema [usercs3]    Script Date: 26/08/2020 01:22:26 p. m. ******/
CREATE SCHEMA [usercs3]
GO

/****** Object:  Table [dbo].[AceCatAcabador]    Script Date: 26/08/2020 01:22:26 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AceCatAcabador](
	[ClaUbicacion] [int] NOT NULL,
	[ClaAcabador] [int] NOT NULL,
	[ClaveAcabador] [varchar](10) NULL,
	[AcabadorDesc] [varchar](50) NULL,
	[BajaLogica] [int] NULL,
	[ClaUsuarioIns] [int] NULL,
	[ClaUsuarioMod] [int] NULL,
	[FechaIns] [datetime] NULL,
	[FechaUltimaMod] [datetime] NULL,
	[NombrePcMod] [varchar](64) NULL,
 CONSTRAINT [PK_AceCatAcabador] PRIMARY KEY CLUSTERED 
(
	[ClaAcabador] ASC,
	[ClaUbicacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AceCatAlmacen]    Script Date: 26/08/2020 01:22:26 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AceCatAlmacen](
	[ClaUbicacion] [int] NOT NULL,
	[ClaAlmacen] [int] NOT NULL,
	[AlmacenDesc] [varchar](100) NULL,
	[ClaTipoPersonal] [int] NULL,
	[ClaNivelLocAlmacen] [int] NULL,
	[BajaLogica] [int] NULL,
	[ClaveAutomatizacion] [int] NULL,
	[ClaUsuarioIns] [int] NULL,
	[ClaUsuarioMod] [int] NULL,
	[FechaIns] [datetime] NULL,
	[FechaUltimaMod] [datetime] NULL,
	[NombrePCMod] [varchar](64) NULL,
	[FechaBajaLogica] [datetime] NULL,
 CONSTRAINT [PK_AceCatAlmacen] PRIMARY KEY CLUSTERED 
(
	[ClaAlmacen] ASC,
	[ClaUbicacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AceCatArea]    Script Date: 26/08/2020 01:22:26 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AceCatArea](
	[ClaUbicacion] [int] NOT NULL,
	[ClaArea] [int] NOT NULL,
	[NomArea] [varchar](80) NULL,
	[BajaLogica] [int] NULL,
	[ClaUsuarioIns] [int] NULL,
	[ClaUsuarioMod] [int] NULL,
	[FechaIns] [datetime] NULL,
	[FechaUltimaMod] [datetime] NULL,
	[NombrePCMod] [varchar](64) NULL,
 CONSTRAINT [PK_AceCatArea] PRIMARY KEY CLUSTERED 
(
	[ClaArea] ASC,
	[ClaUbicacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AceCatBanda]    Script Date: 26/08/2020 01:22:26 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AceCatBanda](
	[ClaBanda] [int] NOT NULL,
	[NomBanda] [varchar](30) NOT NULL,
	[BajaLogica] [tinyint] NOT NULL,
	[ClaUsuarioIns] [int] NULL,
	[ClaUsuarioMod] [int] NULL,
	[FechaIns] [datetime] NULL,
	[FechaUltimaMod] [datetime] NULL,
	[NombrePcMod] [varchar](35) NULL,
	[FolioSincro] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK__AceCatBanda__3587F3E0] PRIMARY KEY CLUSTERED 
(
	[ClaBanda] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AceCatCalGrado]    Script Date: 26/08/2020 01:22:26 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AceCatCalGrado](
	[ClaGrado] [int] NOT NULL,
	[NomGrado] [varchar](30) NULL,
	[ClaGrupoChatarra] [int] NULL,
	[EsActivo] [tinyint] NULL,
	[DeAcero] [tinyint] NULL,
	[ClaUsuarioIns] [int] NULL,
	[FechaIns] [datetime] NULL,
	[ClaUsuarioMod] [int] NULL,
	[FechaUltimaMod] [datetime] NULL,
	[NombrePcMod] [varchar](64) NULL,
 CONSTRAINT [PK_AceCatCalGrado] PRIMARY KEY CLUSTERED 
(
	[ClaGrado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AceCatCalibre]    Script Date: 26/08/2020 01:22:26 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AceCatCalibre](
	[ClaCalibre] [int] NOT NULL,
	[NomCalibre] [varchar](30) NULL,
	[Medidamm] [numeric](18, 8) NULL,
	[AreaNominal] [numeric](18, 8) NULL,
	[TonHora] [numeric](18, 8) NULL,
	[KgsPunta] [numeric](18, 8) NULL,
	[KgsCola] [numeric](18, 8) NULL,
	[KgsEspira] [numeric](18, 8) NULL,
	[BajaLogica] [int] NULL,
	[MinPm] [numeric](18, 8) NULL,
	[MaxPm] [numeric](18, 8) NULL,
	[MinEl] [numeric](18, 8) NULL,
	[MaxEl] [numeric](18, 8) NULL,
	[SepPCObjetivo] [numeric](18, 8) NULL,
	[VelObjetivo] [numeric](18, 8) NULL,
	[PesoPq] [numeric](18, 8) NULL,
	[ClaUsuarioIns] [int] NULL,
	[ClaUsuarioMod] [int] NULL,
	[FechaIns] [datetime] NULL,
	[FechaUltimaMod] [datetime] NULL,
	[NombrePcMod] [varchar](64) NULL,
 CONSTRAINT [PK_AceCatCalibre] PRIMARY KEY CLUSTERED 
(
	[ClaCalibre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AceCatCapacidadMolinoCalibre]    Script Date: 26/08/2020 01:22:26 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AceCatCapacidadMolinoCalibre](
	[ClaUbicacion] [int] NOT NULL,
	[ClaGrupoProduccion] [int] NOT NULL,
	[ClaCalibre] [int] NOT NULL,
	[ClaMolino] [int] NOT NULL,
	[TonHrCargaCaliente] [int] NULL,
	[TonHrCargaFrio] [int] NULL,
	[ClaUsuarioIns] [int] NULL,
	[FechaIns] [datetime] NULL,
	[FechaUltimaMod] [datetime] NULL,
	[NombrePcMod] [varchar](64) NULL,
 CONSTRAINT [PK_AceCatCapacidadMolinoCalibre] PRIMARY KEY CLUSTERED 
(
	[ClaGrupoProduccion] ASC,
	[ClaCalibre] ASC,
	[ClaMolino] ASC,
	[ClaUbicacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AceCatCausaDesviacion]    Script Date: 26/08/2020 01:22:26 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AceCatCausaDesviacion](
	[ClaCausaDesviacion] [int] NOT NULL,
	[NomCortoCausaDesviacion] [varchar](2) NOT NULL,
	[NomCausaDesviacion] [varchar](30) NOT NULL,
	[ClaTipoElemento] [int] NOT NULL,
	[EsQuimico] [int] NOT NULL,
	[BajaLogica] [tinyint] NOT NULL,
	[ClaUsuarioIns] [int] NOT NULL,
	[FechaBajaLogica] [datetime] NULL,
	[FechaIns] [datetime] NOT NULL,
	[FechaUltimaMod] [datetime] NOT NULL,
	[NombrePcMod] [varchar](64) NOT NULL,
	[ClaUsuarioMod] [int] NOT NULL,
	[ClaUbicacion] [int] NOT NULL,
 CONSTRAINT [PK_AceCatCausasDesviacion] PRIMARY KEY CLUSTERED 
(
	[ClaUbicacion] ASC,
	[ClaCausaDesviacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AceCatCausaReclasificacion]    Script Date: 26/08/2020 01:22:26 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AceCatCausaReclasificacion](
	[ClaCausaReclasificacion] [int] NOT NULL,
	[NomCausaReclasificacion] [varchar](50) NULL,
	[BajaLogica] [tinyint] NOT NULL,
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL,
	[NombrePcMod] [varchar](64) NOT NULL,
	[ClaUsuarioMod] [int] NOT NULL,
 CONSTRAINT [PK_AceCatCausaReclasificacion] PRIMARY KEY CLUSTERED 
(
	[ClaCausaReclasificacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AceCatClienteEspecial]    Script Date: 26/08/2020 01:22:26 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AceCatClienteEspecial](
	[ClaClienteUnico] [int] NOT NULL,
	[EsImprimeCalidad] [tinyint] NOT NULL,
	[ClaUsuarioIns] [int] NOT NULL,
	[FechaIns] [datetime] NOT NULL,
	[BajaLogica] [tinyint] NOT NULL,
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL,
	[NombrePcMod] [varchar](64) NOT NULL,
	[ClaUsuarioMod] [int] NOT NULL,
 CONSTRAINT [PK_AceCatClienteEspecial] PRIMARY KEY CLUSTERED 
(
	[ClaClienteUnico] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AceCatDefecto]    Script Date: 26/08/2020 01:22:26 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AceCatDefecto](
	[ClaDefecto] [int] NOT NULL,
	[ClaTipoInventario] [int] NOT NULL,
	[ClaFamilia] [int] NOT NULL,
	[NomDefecto] [varchar](30) NOT NULL,
	[EsCalidadInterna] [tinyint] NOT NULL,
	[EsCalidadSuperficial] [tinyint] NOT NULL,
	[BajaLogica] [tinyint] NOT NULL,
	[ClaUsuarioIns] [int] NOT NULL,
	[FechaBajaLogica] [datetime] NULL,
	[FechaIns] [datetime] NOT NULL,
	[FechaUltimaMod] [datetime] NOT NULL,
	[NombrePcMod] [varchar](64) NOT NULL,
	[ClaUsuarioMod] [int] NOT NULL,
	[ClaUbicacion] [int] NOT NULL,
 CONSTRAINT [PK_AceCatDefecto] PRIMARY KEY CLUSTERED 
(
	[ClaUbicacion] ASC,
	[ClaDefecto] ASC,
	[ClaTipoInventario] ASC,
	[ClaFamilia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AceCatElementoQuimico]    Script Date: 26/08/2020 01:22:26 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AceCatElementoQuimico](
	[ClaElementoQuimico] [int] NOT NULL,
	[NomElemento] [varchar](250) NOT NULL,
	[EsFormula] [tinyint] NULL DEFAULT ((0)),
	[BajaLogica] [tinyint] NOT NULL DEFAULT ((0)),
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL DEFAULT (getdate()),
	[NombrePcMod] [varchar](64) NOT NULL DEFAULT (host_name()),
	[ClaUsuarioMod] [int] NOT NULL,
 CONSTRAINT [PK_AceCatElementoQuimico] PRIMARY KEY CLUSTERED 
(
	[ClaElementoQuimico] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AceCatEspecifCliente]    Script Date: 26/08/2020 01:22:26 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AceCatEspecifCliente](
	[ClaCliente] [int] NOT NULL,
	[ClaGrado] [int] NOT NULL,
	[ClaEspCliente] [int] NOT NULL,
	[BajaLogica] [tinyint] NOT NULL DEFAULT ((0)),
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL DEFAULT (getdate()),
	[NombrePcMod] [varchar](64) NOT NULL DEFAULT (host_name()),
	[ClaUsuarioMod] [int] NOT NULL,
 CONSTRAINT [PK_AceCatEspecifCliente] PRIMARY KEY CLUSTERED 
(
	[ClaCliente] ASC,
	[ClaGrado] ASC,
	[ClaEspCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AceCatEspecificacionQuimConnum]    Script Date: 26/08/2020 01:22:26 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AceCatEspecificacionQuimConnum](
	[ClaUbicacion] [int] NOT NULL,
	[ClaGrado] [int] NOT NULL,
	[ClaBanda] [int] NOT NULL,
	[FechaInicioVigencia] [datetime] NOT NULL,
	[FechaFinVigencia] [datetime] NULL,
	[ClaEstatusBanda] [int] NULL,
	[ClaEspecificacionQuimica] [numeric](18, 0) NOT NULL,
	[Observaciones] [varchar](250) NULL,
	[MinimoFormula1] [numeric](16, 4) NULL,
	[MaximoFormula1] [numeric](16, 4) NULL,
	[MinimoFormula2] [numeric](16, 4) NULL,
	[MaximoFormula2] [numeric](16, 4) NULL,
	[MinimoFormula3] [numeric](16, 4) NULL,
	[MaximoFormula3] [numeric](16, 4) NULL,
	[MinimoFormula4] [numeric](16, 4) NULL,
	[MaximoFormula4] [numeric](16, 4) NULL,
	[MinimoFormula5] [numeric](16, 4) NULL,
	[MaximoFormula5] [numeric](16, 4) NULL,
	[MinimoCarbono] [numeric](16, 4) NULL,
	[MaximoCarbono] [numeric](16, 4) NULL,
	[MinimoManganeso] [numeric](16, 4) NULL,
	[MaximoManganeso] [numeric](16, 4) NULL,
	[MinimoSilicio] [numeric](16, 4) NULL,
	[MaximoSilicio] [numeric](16, 4) NULL,
	[MinimoFosforo] [numeric](16, 4) NULL,
	[MaximoFosforo] [numeric](16, 4) NULL,
	[MinimoAzufre] [numeric](16, 4) NULL,
	[MaximoAzufre] [numeric](16, 4) NULL,
	[MinimoCobre] [numeric](16, 4) NULL,
	[MaximoCobre] [numeric](16, 4) NULL,
	[MinimoCromo] [numeric](16, 4) NULL,
	[MaximoCromo] [numeric](16, 4) NULL,
	[MinimoNiquel] [numeric](16, 4) NULL,
	[MaximoNiquel] [numeric](16, 4) NULL,
	[MinimoMolibdeno] [numeric](16, 4) NULL,
	[MaximoMolibdeno] [numeric](16, 4) NULL,
	[MinimoEstano] [numeric](16, 4) NULL,
	[MaximoEstano] [numeric](16, 4) NULL,
	[MinimoAluminio] [numeric](16, 4) NULL,
	[MaximoAluminio] [numeric](16, 4) NULL,
	[MinimoBoro] [numeric](16, 4) NULL,
	[MaximoBoro] [numeric](16, 4) NULL,
	[MinimoNitrogeno] [numeric](16, 4) NULL,
	[MaximoNitrogeno] [numeric](16, 4) NULL,
	[MinimoVanadio] [numeric](16, 4) NULL,
	[MaximoVanadio] [numeric](16, 4) NULL,
	[MinimoCalcio] [numeric](16, 4) NULL,
	[MaximoCalcio] [numeric](16, 4) NULL,
	[MinimoTitanio] [numeric](16, 4) NULL,
	[MaximoTitanio] [numeric](16, 4) NULL,
	[MinimoZinc] [numeric](16, 4) NULL,
	[MaximoZinc] [numeric](16, 4) NULL,
	[MinimoNobio] [numeric](16, 4) NULL,
	[MaximoNobio] [numeric](16, 4) NULL,
	[MinimoOxigeno] [numeric](16, 4) NULL,
	[MaximoOxigeno] [numeric](16, 4) NULL,
	[MinimoPlomo] [numeric](16, 4) NULL,
	[MaximoPlomo] [numeric](16, 4) NULL,
	[MinimoExpansion1] [numeric](16, 4) NULL,
	[MaximoExpansion1] [numeric](16, 4) NULL,
	[MinimoExpansion2] [numeric](16, 4) NULL,
	[MaximoExpansion2] [numeric](16, 4) NULL,
	[MinimoExpansion3] [numeric](16, 4) NULL,
	[MaximoExpansion3] [numeric](16, 4) NULL,
	[MinimoExpansion4] [numeric](16, 4) NULL,
	[MaximoExpansion4] [numeric](16, 4) NULL,
	[MinimoExpansion5] [numeric](16, 4) NULL,
	[MaximoExpansion5] [numeric](16, 4) NULL,
	[MinimoExpansion6] [numeric](16, 4) NULL,
	[MaximoExpansion6] [numeric](16, 4) NULL,
	[MinimoExpansion7] [numeric](16, 4) NULL,
	[MaximoExpansion7] [numeric](16, 4) NULL,
	[MinimoExpansion8] [numeric](16, 4) NULL,
	[MaximoExpansion8] [numeric](16, 4) NULL,
	[MinimoExpansion9] [numeric](16, 4) NULL,
	[MaximoExpansion9] [numeric](16, 4) NULL,
	[MinimoExpansion10] [numeric](16, 4) NULL,
	[MaximoExpansion10] [numeric](16, 4) NULL,
	[MinimoExpansion11] [numeric](16, 4) NULL,
	[MaximoExpansion11] [numeric](16, 4) NULL,
	[MinimoExpansion12] [numeric](16, 4) NULL,
	[MaximoExpansion12] [numeric](16, 4) NULL,
	[MinimoExpansion13] [numeric](16, 4) NULL,
	[MaximoExpansion13] [numeric](16, 4) NULL,
	[MinimoExpansion14] [numeric](16, 4) NULL,
	[MaximoExpansion14] [numeric](16, 4) NULL,
	[MinimoExpansion15] [numeric](16, 4) NULL,
	[MaximoExpansion15] [numeric](16, 4) NULL,
	[ClaUsuarioIns] [int] NULL,
	[ClaUsuarioMod] [int] NULL,
	[FechaIns] [datetime] NULL,
	[FechaUltimaMod] [datetime] NULL,
	[NombrePcMod] [varchar](64) NULL,
 CONSTRAINT [PK_AceCatEspecificacionQuimCon] PRIMARY KEY CLUSTERED 
(
	[ClaGrado] ASC,
	[ClaBanda] ASC,
	[FechaInicioVigencia] ASC,
	[ClaUbicacion] ASC,
	[ClaEspecificacionQuimica] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AceCatEspecificacionQuimica]    Script Date: 26/08/2020 01:22:26 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AceCatEspecificacionQuimica](
	[ClaGrado] [int] NOT NULL,
	[ClaEspecificacionQuimica] [int] NOT NULL,
	[ClaTipoEspecificacion] [int] NOT NULL DEFAULT ((1)),
	[ClaUbicacion] [int] NULL,
	[ClaEstatusVigencia] [int] NOT NULL,
	[FechaInicioVigencia] [datetime] NOT NULL,
	[FechaFinVigencia] [datetime] NULL,
	[Observaciones] [varchar](250) NULL,
	[ClaUsuarioIns] [int] NOT NULL,
	[FechaIns] [datetime] NOT NULL,
	[EsRestablecer] [tinyint] NOT NULL DEFAULT ((0)),
	[BajaLogica] [tinyint] NOT NULL DEFAULT ((0)),
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL DEFAULT (getdate()),
	[NombrePcMod] [varchar](64) NOT NULL DEFAULT (host_name()),
	[ClaUsuarioMod] [int] NOT NULL,
 CONSTRAINT [PK_AceCatEspecificacionQuimica] PRIMARY KEY CLUSTERED 
(
	[ClaGrado] ASC,
	[ClaEspecificacionQuimica] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AceCatEspecificacionQuimicaBAK]    Script Date: 26/08/2020 01:22:26 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AceCatEspecificacionQuimicaBAK](
	[ClaUbicacion] [int] NOT NULL,
	[ClaGrado] [int] NOT NULL,
	[ClaBanda] [int] NOT NULL,
	[FechaInicioVigencia] [datetime] NOT NULL,
	[FechaFinVigencia] [datetime] NULL,
	[ClaEstatusBanda] [int] NULL,
	[ClaEspecificacionQuimica] [numeric](18, 0) NOT NULL,
	[Observaciones] [varchar](250) NULL,
	[MinimoFormula1] [numeric](16, 4) NULL,
	[MaximoFormula1] [numeric](16, 4) NULL,
	[MinimoFormula2] [numeric](16, 4) NULL,
	[MaximoFormula2] [numeric](16, 4) NULL,
	[MinimoFormula3] [numeric](16, 4) NULL,
	[MaximoFormula3] [numeric](16, 4) NULL,
	[MinimoFormula4] [numeric](16, 4) NULL,
	[MaximoFormula4] [numeric](16, 4) NULL,
	[MinimoFormula5] [numeric](16, 4) NULL,
	[MaximoFormula5] [numeric](16, 4) NULL,
	[MinimoCarbono] [numeric](16, 4) NULL,
	[MaximoCarbono] [numeric](16, 4) NULL,
	[MinimoManganeso] [numeric](16, 4) NULL,
	[MaximoManganeso] [numeric](16, 4) NULL,
	[MinimoSilicio] [numeric](16, 4) NULL,
	[MaximoSilicio] [numeric](16, 4) NULL,
	[MinimoFosforo] [numeric](16, 4) NULL,
	[MaximoFosforo] [numeric](16, 4) NULL,
	[MinimoAzufre] [numeric](16, 4) NULL,
	[MaximoAzufre] [numeric](16, 4) NULL,
	[MinimoCobre] [numeric](16, 4) NULL,
	[MaximoCobre] [numeric](16, 4) NULL,
	[MinimoCromo] [numeric](16, 4) NULL,
	[MaximoCromo] [numeric](16, 4) NULL,
	[MinimoNiquel] [numeric](16, 4) NULL,
	[MaximoNiquel] [numeric](16, 4) NULL,
	[MinimoMolibdeno] [numeric](16, 4) NULL,
	[MaximoMolibdeno] [numeric](16, 4) NULL,
	[MinimoEstano] [numeric](16, 4) NULL,
	[MaximoEstano] [numeric](16, 4) NULL,
	[MinimoAluminio] [numeric](16, 4) NULL,
	[MaximoAluminio] [numeric](16, 4) NULL,
	[MinimoBoro] [numeric](16, 4) NULL,
	[MaximoBoro] [numeric](16, 4) NULL,
	[MinimoNitrogeno] [numeric](16, 4) NULL,
	[MaximoNitrogeno] [numeric](16, 4) NULL,
	[MinimoVanadio] [numeric](16, 4) NULL,
	[MaximoVanadio] [numeric](16, 4) NULL,
	[MinimoCalcio] [numeric](16, 4) NULL,
	[MaximoCalcio] [numeric](16, 4) NULL,
	[MinimoTitanio] [numeric](16, 4) NULL,
	[MaximoTitanio] [numeric](16, 4) NULL,
	[MinimoZinc] [numeric](16, 4) NULL,
	[MaximoZinc] [numeric](16, 4) NULL,
	[MinimoNobio] [numeric](16, 4) NULL,
	[MaximoNobio] [numeric](16, 4) NULL,
	[MinimoOxigeno] [numeric](16, 4) NULL,
	[MaximoOxigeno] [numeric](16, 4) NULL,
	[MinimoPlomo] [numeric](16, 4) NULL,
	[MaximoPlomo] [numeric](16, 4) NULL,
	[MinimoExpansion1] [numeric](16, 4) NULL,
	[MaximoExpansion1] [numeric](16, 4) NULL,
	[MinimoExpansion2] [numeric](16, 4) NULL,
	[MaximoExpansion2] [numeric](16, 4) NULL,
	[MinimoExpansion3] [numeric](16, 4) NULL,
	[MaximoExpansion3] [numeric](16, 4) NULL,
	[MinimoExpansion4] [numeric](16, 4) NULL,
	[MaximoExpansion4] [numeric](16, 4) NULL,
	[MinimoExpansion5] [numeric](16, 4) NULL,
	[MaximoExpansion5] [numeric](16, 4) NULL,
	[MinimoExpansion6] [numeric](16, 4) NULL,
	[MaximoExpansion6] [numeric](16, 4) NULL,
	[MinimoExpansion7] [numeric](16, 4) NULL,
	[MaximoExpansion7] [numeric](16, 4) NULL,
	[MinimoExpansion8] [numeric](16, 4) NULL,
	[MaximoExpansion8] [numeric](16, 4) NULL,
	[MinimoExpansion9] [numeric](16, 4) NULL,
	[MaximoExpansion9] [numeric](16, 4) NULL,
	[MinimoExpansion10] [numeric](16, 4) NULL,
	[MaximoExpansion10] [numeric](16, 4) NULL,
	[MinimoExpansion11] [numeric](16, 4) NULL,
	[MaximoExpansion11] [numeric](16, 4) NULL,
	[MinimoExpansion12] [numeric](16, 4) NULL,
	[MaximoExpansion12] [numeric](16, 4) NULL,
	[MinimoExpansion13] [numeric](16, 4) NULL,
	[MaximoExpansion13] [numeric](16, 4) NULL,
	[MinimoExpansion14] [numeric](16, 4) NULL,
	[MaximoExpansion14] [numeric](16, 4) NULL,
	[MinimoExpansion15] [numeric](16, 4) NULL,
	[MaximoExpansion15] [numeric](16, 4) NULL,
	[ClaUsuarioIns] [int] NULL,
	[ClaUsuarioMod] [int] NULL,
	[FechaIns] [datetime] NULL,
	[FechaUltimaMod] [datetime] NULL,
	[NombrePcMod] [varchar](64) NULL,
	[ClaEstatusVigencia] [int] NULL,
	[EsRestablecer] [tinyint] NULL DEFAULT ((0)),
	[BajaLogica] [tinyint] NULL DEFAULT ((0)),
	[FechaBajaLogica] [datetime] NULL,
 CONSTRAINT [PK_AceCatEspecificacionQuimicaBAK] PRIMARY KEY CLUSTERED 
(
	[ClaGrado] ASC,
	[ClaBanda] ASC,
	[FechaInicioVigencia] ASC,
	[ClaUbicacion] ASC,
	[ClaEspecificacionQuimica] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AceCatEstatusVigencia]    Script Date: 26/08/2020 01:22:26 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AceCatEstatusVigencia](
	[ClaEstatusVigencia] [int] NOT NULL,
	[Descripcion] [varchar](150) NOT NULL,
	[BajaLogica] [tinyint] NOT NULL DEFAULT ((0)),
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL DEFAULT (getdate()),
	[ClaUsuarioMod] [int] NOT NULL DEFAULT ((0)),
	[NombrePcMod] [varchar](64) NOT NULL DEFAULT (host_name()),
 CONSTRAINT [PK_AceCatEstatusVigencia] PRIMARY KEY CLUSTERED 
(
	[ClaEstatusVigencia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AceCatGpoCalibre]    Script Date: 26/08/2020 01:22:26 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AceCatGpoCalibre](
	[ClaUbicacion] [int] NOT NULL,
	[ClaGpoCalibre] [int] NOT NULL,
	[NomGpoCalibre] [varchar](30) NULL,
	[BajaLogica] [int] NULL,
	[ClaUsuarioIns] [int] NULL,
	[ClaUsuarioMod] [int] NULL,
	[FechaIns] [datetime] NULL,
	[FechaUltimaMod] [datetime] NULL,
	[NombrePc] [varchar](64) NULL,
 CONSTRAINT [PK_AceCatGpoCalibre] PRIMARY KEY CLUSTERED 
(
	[ClaGpoCalibre] ASC,
	[ClaUbicacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AceCatGrado]    Script Date: 26/08/2020 01:22:26 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AceCatGrado](
	[ClaGrado] [int] NOT NULL,
	[NomCortoGrado] [varchar](30) NULL,
	[NomGrado] [varchar](30) NOT NULL,
	[ClaGrupoRecetaChatarra] [int] NULL,
	[ClaGrupoUsoTipico] [int] NULL,
	[ClaveAutomatizacion] [int] NULL,
	[EsDeAcero] [tinyint] NOT NULL DEFAULT ((0)),
	[EsVarilla] [tinyint] NOT NULL DEFAULT ((0)),
	[BajaLogica] [tinyint] NOT NULL DEFAULT ((0)),
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL DEFAULT (getdate()),
	[NombrePcMod] [varchar](64) NOT NULL DEFAULT (host_name()),
	[ClaUsuarioMod] [int] NOT NULL,
 CONSTRAINT [PK_AceCatGrado] PRIMARY KEY CLUSTERED 
(
	[ClaGrado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AceCatGradoFormula]    Script Date: 26/08/2020 01:22:26 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AceCatGradoFormula](
	[ClaGrado] [int] NOT NULL,
	[Formula1] [varchar](255) NULL,
	[Formula2] [varchar](255) NULL,
	[Formula3] [varchar](255) NULL,
	[Formula4] [varchar](255) NULL,
	[Formula5] [varchar](255) NULL,
	[ClaUsuarioMod] [int] NULL,
	[FechaUltimaMod] [datetime] NOT NULL DEFAULT (getdate()),
	[NombrePcMod] [varchar](64) NOT NULL DEFAULT (host_name()),
 CONSTRAINT [PK_AceCatGradoFormula] PRIMARY KEY CLUSTERED 
(
	[ClaGrado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AceCatGrupoCarbono]    Script Date: 26/08/2020 01:22:26 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AceCatGrupoCarbono](
	[ClaUbicacion] [int] NOT NULL,
	[ClaGrupoCarbono] [int] NOT NULL,
	[NombreGpoCarbono] [varchar](50) NULL,
	[BajaLogica] [int] NULL,
	[ClaUsuarioIns] [int] NULL,
	[ClaUsuarioMod] [int] NULL,
	[FechaIns] [datetime] NULL,
	[FechaUltimaMod] [datetime] NULL,
	[NombrePcMod] [varchar](64) NULL,
 CONSTRAINT [PK_AceCatGrupoCarbono] PRIMARY KEY CLUSTERED 
(
	[ClaGrupoCarbono] ASC,
	[ClaUbicacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AceCatGrupoCosteo]    Script Date: 26/08/2020 01:22:26 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AceCatGrupoCosteo](
	[ClaUbicacion] [int] NULL,
	[ClaGrupoCosteo] [int] NOT NULL,
	[NomGpoCosteo] [varchar](50) NULL,
	[Lote] [int] NULL,
	[Local] [int] NULL,
	[ClaAlmacen] [int] NULL,
	[BajaLogica] [int] NULL,
	[ClaUsuarioIns] [int] NULL,
	[ClaUsuarioMod] [int] NULL,
	[FechaIns] [datetime] NULL,
	[FechaUltimaMod] [datetime] NULL,
	[NombrePCMod] [varchar](64) NULL,
	[GrupoCosteoDesc] [varchar](50) NULL,
	[FechaBajaLogica] [datetime] NULL,
 CONSTRAINT [PK_AceCatGrupoCosteo] PRIMARY KEY CLUSTERED 
(
	[ClaGrupoCosteo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AceCatGrupoFamilia]    Script Date: 26/08/2020 01:22:26 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AceCatGrupoFamilia](
	[ClaGrupoFamilia] [int] NOT NULL,
	[EsSegunda] [int] NULL DEFAULT ((0)),
	[BajaLogica] [tinyint] NULL DEFAULT ((0)),
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NULL DEFAULT (getdate()),
	[NombrePcMod] [varchar](64) NULL DEFAULT (host_name()),
	[ClaUsuarioMod] [int] NULL,
	[ClaveFamilia] [int] NOT NULL,
 CONSTRAINT [PK_AceCatGrupoFamilia] PRIMARY KEY CLUSTERED 
(
	[ClaGrupoFamilia] ASC,
	[ClaveFamilia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AceCatGrupoProduccion]    Script Date: 26/08/2020 01:22:26 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AceCatGrupoProduccion](
	[ClaUbicacion] [int] NULL,
	[ClaGrupoProduccion] [int] NOT NULL,
	[NomGrupoProduccion] [varchar](250) NULL,
	[NomCortoGpoProd] [varchar](5) NULL,
	[ClaFamilia] [int] NULL,
	[ClaUsuarioIns] [int] NULL,
	[ClaUsuarioMod] [int] NULL,
	[FechaIns] [datetime] NULL,
	[FechaUltimaMod] [datetime] NULL,
	[NombrePcMod] [varchar](64) NULL,
	[BajaLogica] [tinyint] NULL DEFAULT ((0)),
	[FechaBajaLogica] [datetime] NULL,
 CONSTRAINT [PK_AceCatGrupoProduccion] PRIMARY KEY CLUSTERED 
(
	[ClaGrupoProduccion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AceCatGrupoRecetaChatarra]    Script Date: 26/08/2020 01:22:26 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AceCatGrupoRecetaChatarra](
	[ClaGrupoRecetaChatarra] [int] NOT NULL,
	[NomGrupoChatarra] [varchar](35) NULL,
	[ClaveAutomatizacion] [int] NULL,
	[ClaUsuarioIns] [int] NULL,
	[BajaLogica] [tinyint] NULL DEFAULT ((0)),
	[FechaBajaLogica] [datetime] NULL,
	[FechaIns] [datetime] NULL,
	[FechaUltimaMod] [datetime] NULL DEFAULT (getdate()),
	[NombrePcMod] [varchar](64) NULL DEFAULT (host_name()),
	[ClaUsuarioMod] [int] NULL,
 CONSTRAINT [PK_AceCatGrupoRecetaChatarra] PRIMARY KEY CLUSTERED 
(
	[ClaGrupoRecetaChatarra] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AceCatGrupoTrabajo]    Script Date: 26/08/2020 01:22:26 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AceCatGrupoTrabajo](
	[ClaGrupoTrabajo] [int] NOT NULL,
	[ClaUbicacion] [int] NOT NULL,
	[NomGrupoTrabajo] [varchar](20) NULL,
	[EsActivo] [tinyint] NULL,
	[ClaArea] [int] NULL,
	[ClaUsuarioIns] [int] NULL,
	[ClaUsuarioMod] [int] NULL,
	[FechaIns] [datetime] NULL DEFAULT (getdate()),
	[FechaUltimaMod] [datetime] NULL DEFAULT (getdate()),
	[NombrePcMod] [varchar](64) NULL,
 CONSTRAINT [PK__AceCatGrupoTrabajo] PRIMARY KEY CLUSTERED 
(
	[ClaGrupoTrabajo] ASC,
	[ClaUbicacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AceCatGrupoUsoTipico]    Script Date: 26/08/2020 01:22:26 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AceCatGrupoUsoTipico](
	[ClaGrupoUsoTipico] [int] NOT NULL,
	[NomGrupoUsoTipico] [varchar](35) NULL,
	[BajaLogica] [tinyint] NULL DEFAULT ((0)),
	[ClaUsuarioIns] [int] NULL,
	[FechaBajaLogica] [datetime] NULL,
	[FechaIns] [datetime] NULL,
	[FechaUltimaMod] [datetime] NULL DEFAULT (getdate()),
	[NombrePcMod] [varchar](64) NULL DEFAULT (host_name()),
	[ClaUsuarioMod] [int] NULL,
 CONSTRAINT [PK_AceCatGrupoUsoTipico] PRIMARY KEY CLUSTERED 
(
	[ClaGrupoUsoTipico] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AceCatHornoAfino]    Script Date: 26/08/2020 01:22:26 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AceCatHornoAfino](
	[ClaUbicacion] [int] NULL,
	[ClaHornoAfino] [int] NOT NULL,
	[ClaveHornoAfino] [varchar](20) NULL,
	[HornoAfinoDesc] [varchar](50) NULL,
	[BajaLogica] [int] NULL,
	[ClaUsuarioIns] [int] NULL,
	[ClaUsuarioMod] [int] NULL,
	[FechaIns] [datetime] NULL,
	[FechaUltimaMod] [datetime] NULL,
	[NombrePcMod] [varchar](64) NULL,
	[NomHornoAfino] [varchar](50) NULL,
	[ClaveAutomatizacion] [int] NULL,
	[FolioSincro] [int] NULL,
 CONSTRAINT [PK_AceCatHornoAfino] PRIMARY KEY CLUSTERED 
(
	[ClaHornoAfino] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AceCatHornoFusion]    Script Date: 26/08/2020 01:22:26 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AceCatHornoFusion](
	[ClaUbicacion] [int] NULL,
	[ClaHornoFusion] [int] NOT NULL,
	[ClaveAlfanumerica] [varchar](20) NULL,
	[EsDeAcero] [tinyint] NULL,
	[NomHornoFusion] [varchar](50) NULL,
	[ClaveAutomatizacion] [int] NULL,
	[BajaLogica] [int] NULL,
	[ClaUsuarioIns] [int] NULL,
	[ClaUsuarioMod] [int] NULL,
	[FechaIns] [datetime] NULL,
	[FechaUltimaMod] [datetime] NULL,
	[NombrePcMod] [varchar](64) NULL,
	[ClaOrigen] [int] NULL,
	[FolioSincro] [int] NULL,
 CONSTRAINT [PK_AceCatHornoFusion] PRIMARY KEY CLUSTERED 
(
	[ClaHornoFusion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AceCatMaquinaCC]    Script Date: 26/08/2020 01:22:26 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AceCatMaquinaCC](
	[ClaUbicacion] [int] NULL,
	[ClaMaquinaCC] [int] NOT NULL,
	[ClaveMaquinaCC] [varchar](20) NULL,
	[MaquinaCCDesc] [varchar](50) NULL,
	[ClaveAutomatizacion] [int] NULL,
	[BajaLogica] [int] NULL,
	[ClaUsuarioIns] [int] NULL,
	[ClaUsuarioMod] [int] NULL,
	[FechaIns] [datetime] NULL,
	[FechaUltimaMod] [datetime] NULL,
	[NombrePcMod] [varchar](64) NULL,
	[NomMaquinaCC] [varchar](50) NULL,
	[FolioSincro] [int] NULL,
 CONSTRAINT [PK_AceCatMaquinaCC] PRIMARY KEY CLUSTERED 
(
	[ClaMaquinaCC] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AceCatMaterial]    Script Date: 26/08/2020 01:22:26 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AceCatMaterial](
	[ClaUbicacion] [int] NOT NULL,
	[ClaMaterial] [numeric](29, 0) NOT NULL,
	[NomMaterial] [char](255) NULL,
	[TipoAdicAdit] [int] NULL,
	[PrecioCompra] [float] NULL,
	[FacConvKg] [numeric](16, 4) NULL,
	[ConsFijoVar] [int] NULL,
	[UdsCompra] [char](5) NULL,
	[ClaUnidad] [numeric](29, 0) NULL,
	[ClaveAutomatizacion] [int] NULL,
	[ClaMaterialConsecutivo] [numeric](29, 0) NULL,
	[ClaTipoReceta] [int] NULL,
	[ClaFamiliaMaterial] [int] NULL,
	[ClaUnidadPresentacion] [int] NULL,
	[ClaUnidadCompras] [int] NULL,
	[FactorConvPresentacionACompras] [numeric](16, 4) NULL,
	[FactorConvPresentacionAKilos] [numeric](16, 4) NULL,
	[FolMaterial] [numeric](29, 0) NULL,
	[LugarAfectacionInv] [int] NULL,
	[EsGranel] [int] NULL,
	[EsEditable] [int] NULL,
	[ExiMinUnidadCompras] [numeric](16, 4) NULL,
	[ExiMaxUnidadCompras] [numeric](16, 4) NULL,
	[PuntoReordenUnidadCompras] [numeric](16, 4) NULL,
	[EsPermiteLocFueraPeps] [int] NULL,
	[BajaLogica] [int] NULL,
	[ClaUsuarioIns] [int] NULL,
	[ClaUsuarioMod] [int] NULL,
	[FechaUltimaMod] [datetime] NULL,
	[NombrePcMod] [varchar](64) NULL,
	[FechaIns] [datetime] NULL DEFAULT (getdate()),
	[LugarAfectacionInventario] [int] NULL,
	[ExistenciaMinimaUnidadCompras] [numeric](22, 4) NULL,
	[ExistenciaMaximaUnidadCompras] [numeric](22, 4) NULL,
	[EsPermitidoLocFueraPeps] [tinyint] NULL DEFAULT ((0)),
	[FechaBajaLogica] [datetime] NULL,
	[FacConvPresentacionCompras] [numeric](22, 4) NULL,
	[FacConvPresentacionKilos] [numeric](22, 4) NULL,
 CONSTRAINT [PK_AceCatMaterial] PRIMARY KEY CLUSTERED 
(
	[ClaMaterial] ASC,
	[ClaUbicacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AceCatMaterialMP]    Script Date: 26/08/2020 01:22:26 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AceCatMaterialMP](
	[ClaUbicacion] [int] NOT NULL,
	[ClaMaterialMP] [int] NOT NULL,
	[NomMaterialMP] [varchar](50) NOT NULL,
	[ClaTipoMateriaPrima] [int] NOT NULL,
	[ClaProveedor] [int] NULL,
	[ClaTipoCompra] [int] NULL,
	[ClaTipoProveedor] [int] NULL,
	[BajaLogica] [tinyint] NOT NULL,
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL,
	[NombrePcMod] [varchar](64) NOT NULL,
	[ClaUsuarioMod] [int] NOT NULL,
 CONSTRAINT [PK_AceCatMaterialMP] PRIMARY KEY CLUSTERED 
(
	[ClaUbicacion] ASC,
	[ClaMaterialMP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AceCatModoAplicacionAA]    Script Date: 26/08/2020 01:22:26 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AceCatModoAplicacionAA](
	[ClaModoAplicacionAA] [int] NOT NULL,
	[NomModoAplicacionAA] [varchar](30) NULL,
	[ClaUsuarioIns] [int] NULL,
	[ClaUsuarioMod] [int] NULL,
	[FechaIns] [datetime] NULL,
	[FechaUltimaMod] [datetime] NULL,
	[NombrePcMod] [varchar](64) NULL,
	[ClaveAutomatizacion] [int] NULL,
	[BajaLogica] [tinyint] NULL,
	[FechaBajaLogica] [datetime] NULL,
 CONSTRAINT [PK_AceCatModoAplicacionAA] PRIMARY KEY CLUSTERED 
(
	[ClaModoAplicacionAA] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AceCatMolino]    Script Date: 26/08/2020 01:22:26 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AceCatMolino](
	[ClaUbicacion] [int] NULL,
	[ClaMolino] [int] NOT NULL,
	[NumCartuchos] [int] NULL,
	[ClaveAutomatizacion] [int] NULL,
	[EsDeacero] [tinyint] NULL,
	[BajaLogica] [int] NULL,
	[ClaUsuarioIns] [int] NULL,
	[ClaUsuarioMod] [int] NULL,
	[FechaIns] [datetime] NULL,
	[FechaUltimaMod] [datetime] NULL,
	[NombrePcMod] [varchar](64) NULL,
	[NomMolino] [varchar](30) NULL,
	[ClaveAlfanumerica] [varchar](10) NULL DEFAULT ('0'),
	[FolioSincro] [int] NULL,
 CONSTRAINT [PK_AceCatMolino] PRIMARY KEY CLUSTERED 
(
	[ClaMolino] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AceCatMotivoEntrada]    Script Date: 26/08/2020 01:22:26 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AceCatMotivoEntrada](
	[ClaMotivoEntrada] [int] NOT NULL,
	[NomMotivoEntrada] [varchar](50) NULL,
	[BajaLogica] [tinyint] NULL,
	[ClaTipoCompra] [int] NULL,
	[EsRequeridaBasculaCertificada] [tinyint] NULL,
	[EsValidaReuso] [tinyint] NULL,
	[EsCargaDescarga] [tinyint] NULL,
	[EsExterna] [tinyint] NULL,
	[EsMostrarVigilancia] [tinyint] NULL,
	[ClaAlmacen] [int] NULL,
	[EsMostrarFfcc] [tinyint] NULL,
	[ClaUsuarioIns] [int] NULL,
	[ClaUsuarioMod] [int] NULL,
	[FechaIns] [datetime] NULL,
	[FechaUltimaMod] [datetime] NULL,
	[NombrePcMod] [varchar](64) NULL,
	[FechaBajaLogica] [datetime] NULL,
 CONSTRAINT [PK_AceCatMotivoEntrada] PRIMARY KEY CLUSTERED 
(
	[ClaMotivoEntrada] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AceCatPrefProgGrado]    Script Date: 26/08/2020 01:22:26 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AceCatPrefProgGrado](
	[ClaUbicacion] [int] NOT NULL,
	[ClaGrado] [int] NOT NULL,
	[ClaGradoPrincipalDesvio] [int] NULL,
	[ClaGrupoCarbono] [int] NULL,
	[OrdenCalidad] [int] NULL,
	[EsProgDespuesParo] [tinyint] NULL,
	[ClaOrdenProg] [int] NULL,
	[GradosEspeciales] [int] NULL,
	[RequiereEnfriamiento] [int] NULL,
	[PqComprada] [int] NULL,
	[LeadTime] [varchar](100) NULL,
	[ClaUsuarioIns] [int] NULL,
	[ClaUsuarioMod] [int] NULL,
	[FechaIns] [datetime] NULL,
	[FechaUltimaMod] [datetime] NULL,
	[NombrePcMod] [varchar](64) NULL,
 CONSTRAINT [PK_AceCatPrefProgGrado] PRIMARY KEY CLUSTERED 
(
	[ClaUbicacion] ASC,
	[ClaGrado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AceCatPrefProgProducto]    Script Date: 26/08/2020 01:22:26 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AceCatPrefProgProducto](
	[ClaUbicacion] [int] NOT NULL,
	[ClaArticulo] [int] NOT NULL,
	[ClaMolino] [int] NULL,
	[ClaHorno] [int] NULL,
	[ClaAcabador] [int] NULL,
	[ClaTurnoPreferido] [int] NULL,
	[EsCargaFria] [int] NULL,
	[EsCampaniaUnica] [int] NULL,
	[ClaUsuarioIns] [int] NULL,
	[ClaUsuarioMod] [int] NULL,
	[FechaIns] [datetime] NULL,
	[FechaUltimaMod] [datetime] NULL,
	[NombrePcMod] [varchar](64) NULL,
 CONSTRAINT [PK_AceCatPrefProgProducto] PRIMARY KEY CLUSTERED 
(
	[ClaArticulo] ASC,
	[ClaUbicacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AceCatProducto]    Script Date: 26/08/2020 01:22:26 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AceCatProducto](
	[ClaArticulo] [int] NOT NULL,
	[ClaveArticuloPta] [varchar](10) NULL,
	[ClaveArticuloVta] [varchar](10) NULL,
	[NomArticulo] [varchar](100) NULL,
	[NomArticuloCorto] [varchar](35) NULL,
	[ClaFamilia] [int] NULL,
	[ClaSubFamilia] [int] NULL,
	[ClaUnidad] [int] NULL,
	[ClaUnidadVta] [int] NULL,
	[ClaCalibre] [int] NULL,
	[ClaGrado] [int] NULL,
	[ClaGrupoProduccion] [int] NULL,
	[ClaGrupoCosteo] [int] NULL,
	[ClaGpoEstadistico] [int] NULL,
	[ClaTipoArticulo] [int] NULL,
	[ClaAlmacen] [int] NULL,
	[ClaTipoLongitudVarilla] [int] NULL,
	[ClaFamiliaUso] [int] NULL,
	[ClaFamiliaDesperdicio] [int] NULL,
	[KgMetro] [numeric](16, 4) NULL,
	[KgMetroAlambron] [numeric](16, 4) NULL,
	[FactorCubicaje] [numeric](18, 8) NULL,
	[PesoTeoricoKgs] [numeric](16, 4) NULL,
	[PesoTeoricoKgsVta] [numeric](18, 8) NULL,
	[EsControlLote] [int] NULL,
	[EsCuna] [int] NULL,
	[BajaLogica] [int] NULL,
	[ClaUsuarioIns] [int] NULL,
	[ClaUsuarioMod] [int] NULL,
	[FechaIns] [datetime] NULL,
	[FechaUltimaMod] [datetime] NULL,
	[NombrePcMod] [varchar](64) NULL,
 CONSTRAINT [PK_AceCatProducto] PRIMARY KEY CLUSTERED 
(
	[ClaArticulo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AceCatProveedor]    Script Date: 26/08/2020 01:22:26 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AceCatProveedor](
	[ClaProveedor] [int] NOT NULL,
	[ClaTipoProveedor] [int] NOT NULL,
	[ClaTipoCompra] [int] NOT NULL,
	[NomProveedor] [varchar](60) NULL,
	[Direccion] [varchar](30) NULL,
	[Poblacion] [varchar](30) NULL,
	[Telefono] [varchar](100) NULL,
	[Fax] [varchar](20) NULL,
	[TelCelular] [varchar](20) NULL,
	[TelParticular] [varchar](20) NULL,
	[Contacto] [varchar](40) NULL,
	[NumeroCuenta] [varchar](18) NULL,
	[FechaDato] [datetime] NULL,
	[PreoxiM3] [numeric](22, 8) NULL,
	[ConoxiM3] [numeric](22, 8) NULL,
	[VisiDeseadas] [numeric](22, 8) NULL,
	[DiasVisi] [numeric](22, 8) NULL,
	[Cumplimiento] [numeric](22, 8) NULL,
	[Kilos] [numeric](22, 8) NULL,
	[ClaZona] [int] NULL,
	[CiudadLab] [int] NULL,
	[Patio1M2] [int] NULL,
	[Patio2M2] [int] NULL,
	[NumTrailer] [int] NULL,
	[NumTorton] [int] NULL,
	[NumPrensas] [int] NULL,
	[NumCaiman] [int] NULL,
	[Notebook] [int] NULL,
	[Iva] [int] NULL,
	[ClaCiudad] [int] NULL,
	[EstatusTransmision] [int] NULL,
	[FaxAutomatico] [varchar](20) NULL,
	[Ubicacion1] [varchar](250) NULL,
	[Ubicacion2] [varchar](250) NULL,
	[ComentInstal] [varchar](250) NULL,
	[SucCta] [varchar](3) NULL,
	[BancoCta] [varchar](20) NULL,
	[CtaEmail] [varchar](25) NULL,
	[PlazaCtaBco] [varchar](4) NULL,
	[ClaRegion] [int] NULL,
	[CtaContable] [varchar](16) NULL,
	[CtaAnticipo] [varchar](16) NULL,
	[Regimen] [int] NULL,
	[Rfc] [varchar](13) NULL,
	[ApPaterno] [varchar](20) NULL,
	[ApMaterno] [varchar](20) NULL,
	[NombreFiscal] [varchar](50) NULL,
	[Calle] [varchar](50) NULL,
	[Numero] [varchar](10) NULL,
	[Colonia] [varchar](30) NULL,
	[Cp] [varchar](12) NULL,
	[Municipio] [varchar](30) NULL,
	[Estado] [varchar](30) NULL,
	[TelFiscal] [varchar](30) NULL,
	[NombreGral] [varchar](30) NULL,
	[ApPatGral] [varchar](30) NULL,
	[ApMatGral] [varchar](30) NULL,
	[NumGral] [varchar](10) NULL,
	[ColGral] [varchar](12) NULL,
	[CpGral] [varchar](12) NULL,
	[TitGral] [varchar](5) NULL,
	[Cup] [int] NULL,
	[ClaBene] [int] NULL,
	[ClaUsuarioIns] [int] NULL,
	[ClaUsuarioMod] [int] NULL,
	[FechaIns] [datetime] NULL,
	[FechaUltimaMod] [datetime] NULL,
	[NombrePcMod] [varchar](64) NULL,
	[BajaLogica] [tinyint] NULL,
	[FechaBajaLogica] [datetime] NULL,
 CONSTRAINT [PK_AceCatProveedor] PRIMARY KEY CLUSTERED 
(
	[ClaProveedor] ASC,
	[ClaTipoCompra] ASC,
	[ClaTipoProveedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AceCatRolTurno]    Script Date: 26/08/2020 01:22:26 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AceCatRolTurno](
	[ClaGrupoTrabajo] [int] NOT NULL,
	[ClaUbicacion] [int] NOT NULL,
	[ClaTurno] [int] NOT NULL,
	[Fecha] [datetime] NOT NULL,
	[AsociadoA] [int] NULL,
	[ClaTurnoAuxiliar] [int] NULL,
	[ClaUsuarioIns] [int] NULL,
	[ClaUsuarioMod] [int] NULL,
	[FechaIns] [datetime] NULL DEFAULT (getdate()),
	[FechaUltimaMod] [datetime] NULL DEFAULT (getdate()),
	[NombrePcMod] [varchar](64) NULL,
 CONSTRAINT [PK__AceCatRolTurno] PRIMARY KEY CLUSTERED 
(
	[ClaGrupoTrabajo] ASC,
	[ClaUbicacion] ASC,
	[ClaTurno] ASC,
	[Fecha] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AceCatSeccionInv]    Script Date: 26/08/2020 01:22:26 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AceCatSeccionInv](
	[ClaSeccionInv] [int] NOT NULL,
	[ClaUbicacion] [int] NOT NULL,
	[ClaUbicacionInv] [int] NOT NULL,
	[ClaSubAlmacen] [int] NOT NULL,
	[ClaAlmacen] [int] NOT NULL,
	[NomSeccionInv] [varchar](100) NOT NULL,
	[BajaLogica] [tinyint] NOT NULL,
	[ClaveAutomatizacion] [int] NULL,
	[ClaUsuarioIns] [int] NULL,
	[ClaUsuarioMod] [int] NULL,
	[FechaIns] [datetime] NULL,
	[FechaUltimaMod] [datetime] NULL,
	[NombrePcMod] [varchar](35) NULL,
	[FolioSincro] [int] NOT NULL,
 CONSTRAINT [PKInvSeccion] PRIMARY KEY CLUSTERED 
(
	[ClaSeccionInv] ASC,
	[ClaUbicacion] ASC,
	[ClaUbicacionInv] ASC,
	[ClaSubAlmacen] ASC,
	[ClaAlmacen] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AceCatSubAlmacen]    Script Date: 26/08/2020 01:22:26 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AceCatSubAlmacen](
	[ClaAlmacen] [int] NOT NULL,
	[ClaUbicacion] [int] NOT NULL,
	[ClaSubAlmacen] [int] NOT NULL,
	[NomSubAlmacen] [varchar](100) NOT NULL,
	[BajaLogica] [tinyint] NOT NULL,
	[ClaveAutomatizacion] [int] NULL,
	[ClaUsuarioIns] [int] NULL,
	[ClaUsuarioMod] [int] NULL,
	[FechaIns] [datetime] NULL,
	[FechaUltimaMod] [datetime] NULL,
	[NombrePcMod] [varchar](35) NULL,
	[FolioSincro] [int] NOT NULL,
 CONSTRAINT [PKInvSubalmacen] PRIMARY KEY CLUSTERED 
(
	[ClaAlmacen] ASC,
	[ClaUbicacion] ASC,
	[ClaSubAlmacen] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AceCatSubArea]    Script Date: 26/08/2020 01:22:26 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AceCatSubArea](
	[ClaUbicacion] [int] NOT NULL,
	[ClaSubArea] [int] NOT NULL,
	[NomSubArea] [varchar](80) NULL,
	[BajaLogica] [int] NULL,
	[ClaArea] [int] NULL,
	[ClaveAutomatizacion] [int] NULL,
	[ClaUsuarioIns] [int] NULL,
	[ClaUsuarioMod] [int] NULL,
	[FechaIns] [datetime] NULL,
	[FechaUltimaMod] [datetime] NULL,
	[NombrePCMod] [varchar](64) NULL,
 CONSTRAINT [PK_AceCatSubArea] PRIMARY KEY CLUSTERED 
(
	[ClaSubArea] ASC,
	[ClaUbicacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AceCatTarifaHoraria]    Script Date: 26/08/2020 01:22:26 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AceCatTarifaHoraria](
	[ClaUbicacion] [int] NOT NULL,
	[ClaAnio] [int] NOT NULL,
	[ClaPeriodo] [int] NOT NULL,
	[FechaInicial] [datetime] NULL,
	[FechaFinal] [datetime] NULL,
	[Dia1HrInicial] [datetime] NULL,
	[Dia1HrFinal] [datetime] NULL,
	[Dia2HrInicial] [datetime] NULL,
	[Dia2HrFinal] [datetime] NULL,
	[Dia3HrInicial] [datetime] NULL,
	[Dia3HrFinal] [datetime] NULL,
	[Dia4HrInicial] [datetime] NULL,
	[Dia4HrFinal] [datetime] NULL,
	[Dia5HrInicial] [datetime] NULL,
	[Dia5HrFinal] [datetime] NULL,
	[Dia6HrInicial] [datetime] NULL,
	[Dia6HrFinal] [datetime] NULL,
	[Dia7HrInicial] [datetime] NULL,
	[Dia7HrFinal] [datetime] NULL,
	[ClaUsuarioIns] [int] NULL,
	[ClaUsuarioMod] [int] NULL,
	[FechaIns] [datetime] NULL,
	[FechaUltimaMod] [datetime] NULL,
	[NombrePcMod] [varchar](64) NULL,
 CONSTRAINT [PK_AceCatTarifaHoraria] PRIMARY KEY CLUSTERED 
(
	[ClaAnio] ASC,
	[ClaPeriodo] ASC,
	[ClaUbicacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AceCatTipoElemento]    Script Date: 26/08/2020 01:22:26 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AceCatTipoElemento](
	[ClaTipoElemento] [int] NOT NULL,
	[NomTipoElemento] [varchar](30) NULL,
	[BajaLogica] [tinyint] NULL DEFAULT ((0)),
	[ClaUsuarioIns] [int] NULL,
	[FechaBajaLogica] [datetime] NULL,
	[FechaIns] [datetime] NULL,
	[FechaUltimaMod] [datetime] NULL DEFAULT (getdate()),
	[NombrePcMod] [varchar](64) NULL DEFAULT (host_name()),
	[ClaUsuarioMod] [int] NULL,
 CONSTRAINT [PK_AceCatTipoElemento] PRIMARY KEY CLUSTERED 
(
	[ClaTipoElemento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AceCatTipoEspecificacion]    Script Date: 26/08/2020 01:22:26 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AceCatTipoEspecificacion](
	[ClaTipoEspecificacion] [int] NOT NULL,
	[NomTipoEspecificacion] [varchar](100) NOT NULL,
	[BajaLogica] [tinyint] NOT NULL DEFAULT ((0)),
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL DEFAULT (getdate()),
	[NombrePcMod] [varchar](64) NOT NULL DEFAULT (host_name()),
	[ClaUsuarioMod] [int] NOT NULL DEFAULT ((0)),
 CONSTRAINT [PK_AceCatTipoEspecificacion] PRIMARY KEY CLUSTERED 
(
	[ClaTipoEspecificacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AceCatTipoPersonal]    Script Date: 26/08/2020 01:22:26 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AceCatTipoPersonal](
	[ClaUbicacion] [int] NOT NULL,
	[ClaTipoPersonal] [int] NOT NULL,
	[ClaSubArea] [int] NULL,
	[ClaArea] [int] NULL,
	[NomTipoPersonal] [varchar](50) NULL,
	[BajaLogica] [tinyint] NULL,
	[ClaUsuarioIns] [int] NULL,
	[ClaUsuarioMod] [int] NULL,
	[FechaIns] [datetime] NULL,
	[FechaUltimaMod] [datetime] NULL,
	[NombrePcMod] [varchar](35) NULL,
 CONSTRAINT [PK_AceCatTipoPersonal] PRIMARY KEY CLUSTERED 
(
	[ClaUbicacion] ASC,
	[ClaTipoPersonal] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AceCatTipoReceta]    Script Date: 26/08/2020 01:22:26 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AceCatTipoReceta](
	[ClaTipoReceta] [int] NOT NULL,
	[ClaUbicacion] [int] NOT NULL,
	[NomTipoReceta] [varchar](50) NULL,
	[NomCortoTipoReceta] [varchar](20) NULL,
	[ClaUsuarioIns] [int] NULL,
	[ClaUsuarioMod] [int] NULL,
	[FechaIns] [datetime] NULL,
	[FechaUltimaMod] [datetime] NULL,
	[NombrePcMod] [varchar](64) NULL,
	[ClaveAutomatizacion] [int] NULL,
 CONSTRAINT [PK_AceCatTipoReceta] PRIMARY KEY CLUSTERED 
(
	[ClaTipoReceta] ASC,
	[ClaUbicacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AceCatTipoVersionArticulo]    Script Date: 26/08/2020 01:22:26 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AceCatTipoVersionArticulo](
	[ClaTipoVersionArticulo] [int] NOT NULL,
	[NomTipoVersionArticulo] [varchar](100) NULL,
	[BajaLogica] [tinyint] NOT NULL DEFAULT ((0)),
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL DEFAULT (getdate()),
	[NombrePcMod] [varchar](64) NOT NULL DEFAULT (host_name()),
	[ClaUsuarioMod] [int] NOT NULL DEFAULT ((0)),
 CONSTRAINT [PK_AceCatTipoVersion] PRIMARY KEY CLUSTERED 
(
	[ClaTipoVersionArticulo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AceCatTrabajador]    Script Date: 26/08/2020 01:22:26 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AceCatTrabajador](
	[ClaTrabajador] [int] NOT NULL,
	[NomTrabajador] [varchar](80) NULL,
	[ClaUsuarioSeguridad] [int] NULL,
	[ClaUbicacion] [int] NULL,
	[ClaTipoPersonal] [int] NULL,
	[ClaUsuarioIns] [int] NULL,
	[ClaUsuarioMod] [int] NULL,
	[FechaIns] [datetime] NULL DEFAULT (getdate()),
	[FechaUltimaMod] [datetime] NULL DEFAULT (getdate()),
	[NombrePcMod] [varchar](35) NULL,
	[Estatus] [tinyint] NULL,
	[FolioSincro] [int] NULL,
 CONSTRAINT [PK_AceCatTrabajador] PRIMARY KEY CLUSTERED 
(
	[ClaTrabajador] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AceCatTurno]    Script Date: 26/08/2020 01:22:26 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AceCatTurno](
	[ClaUbicacion] [int] NOT NULL,
	[ClaTurno] [int] NOT NULL,
	[NomTurno] [varchar](50) NULL,
	[HoraInicio] [datetime] NULL,
	[HoraFin] [datetime] NULL,
	[ClaUsuarioIns] [int] NULL,
	[ClaUsuarioMod] [int] NULL,
	[FechaIns] [datetime] NULL,
	[FechaUltimaMod] [datetime] NULL,
	[NombrePcMod] [varchar](64) NULL,
 CONSTRAINT [PK_AceCatTurno] PRIMARY KEY CLUSTERED 
(
	[ClaTurno] ASC,
	[ClaUbicacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AceCatUbicacionInv]    Script Date: 26/08/2020 01:22:26 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AceCatUbicacionInv](
	[ClaUbicacionInv] [int] NOT NULL,
	[ClaUbicacion] [int] NOT NULL,
	[ClaSubAlmacen] [int] NOT NULL,
	[ClaAlmacen] [int] NOT NULL,
	[NomUbicacionInv] [varchar](100) NOT NULL,
	[BajaLogica] [tinyint] NOT NULL,
	[ClaveAutomatizacion] [int] NULL,
	[ClaUsuarioIns] [int] NULL,
	[ClaUsuarioMod] [int] NULL,
	[FechaIns] [datetime] NULL,
	[FechaUltimaMod] [datetime] NULL,
	[NombrePcMod] [varchar](35) NULL,
	[FolioSincro] [int] NOT NULL,
 CONSTRAINT [PKInvUbicacion] PRIMARY KEY CLUSTERED 
(
	[ClaUbicacionInv] ASC,
	[ClaUbicacion] ASC,
	[ClaSubAlmacen] ASC,
	[ClaAlmacen] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AceCatUnidadMecanica]    Script Date: 26/08/2020 01:22:26 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AceCatUnidadMecanica](
	[ClaUnidadMecanica] [int] NOT NULL,
	[NomUnidad] [varchar](10) NOT NULL,
	[SisMetrico] [int] NOT NULL,
	[ClaUsuarioIns] [int] NULL,
	[ClaUsuarioMod] [int] NULL,
	[FechaIns] [datetime] NULL,
	[FechaUltimaMod] [datetime] NULL,
	[NombrePcMod] [varchar](64) NULL,
 CONSTRAINT [PK_AceCatUnidadMecanica] PRIMARY KEY CLUSTERED 
(
	[ClaUnidadMecanica] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AceCatVarillaLongitud]    Script Date: 26/08/2020 01:22:26 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AceCatVarillaLongitud](
	[ClaVarillaLongitud] [numeric](29, 0) NOT NULL,
	[DescVarillaLongitud] [varchar](30) NULL,
	[LongitudMetros] [numeric](18, 8) NULL,
	[Activo] [tinyint] NULL,
	[ClaUsuarioIns] [int] NULL,
	[ClaUsuarioMod] [int] NULL,
	[FechaIns] [datetime] NULL,
	[FechaUltimaMod] [datetime] NULL,
	[NombrePcMod] [varchar](64) NULL,
	[BajaLogica] [tinyint] NULL,
	[FechaBajaLogica] [datetime] NULL,
 CONSTRAINT [PK_VarillaLongitud] PRIMARY KEY CLUSTERED 
(
	[ClaVarillaLongitud] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AceCatVarillaPrePresentacion]    Script Date: 26/08/2020 01:22:26 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AceCatVarillaPrePresentacion](
	[ClaVarillaPrePresentacion] [numeric](29, 0) NOT NULL,
	[NomVarillaPrePresentacion] [varchar](30) NULL,
	[Activo] [tinyint] NULL,
	[ClaUsuarioIns] [int] NULL,
	[ClaUsuarioMod] [int] NULL,
	[FechaIns] [datetime] NULL,
	[FechaUltimaMod] [datetime] NULL,
	[NombrePcMod] [varchar](64) NULL,
	[BajaLogica] [tinyint] NULL,
	[FechaBajaLogica] [datetime] NULL,
 CONSTRAINT [PK_VarillaPrePresentacion] PRIMARY KEY CLUSTERED 
(
	[ClaVarillaPrePresentacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AceCatVersion]    Script Date: 26/08/2020 01:22:26 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AceCatVersion](
	[ClaArticulo] [int] NOT NULL,
	[ClaVersion] [int] NOT NULL,
	[ClaUbicacion] [int] NULL,
	[VersionDesc] [varchar](100) NULL,
	[ClaUnidad] [int] NULL,
	[ClaTipoVersion] [int] NULL,
	[PesoTeorico] [numeric](16, 4) NULL,
	[VelMtsSeg] [numeric](16, 4) NULL,
	[SepPyCSeg] [numeric](16, 4) NULL,
	[EsDeacero] [int] NULL,
	[EsLocal] [int] NULL,
	[FactorCubicaje] [numeric](18, 8) NULL,
	[NumPiezasSubAtado] [int] NULL,
	[NumSubAtadoXAtado] [int] NULL,
	[ClaEquivalenciaScada] [int] NULL,
	[Densidad] [numeric](18, 8) NULL,
	[ClaOrigen] [int] NULL,
	[ClaveAutomatizacion] [numeric](8, 0) NULL,
	[BajaLogica] [int] NULL,
	[ClaUsuarioIns] [int] NULL,
	[ClaUsuarioMod] [int] NULL,
	[FechaIns] [datetime] NULL,
	[FechaUltimaMod] [datetime] NULL,
	[NombrePcMod] [varchar](64) NULL,
 CONSTRAINT [PK_AceCatVersion] PRIMARY KEY CLUSTERED 
(
	[ClaVersion] ASC,
	[ClaArticulo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AceCatVersionArticulo]    Script Date: 26/08/2020 01:22:26 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AceCatVersionArticulo](
	[ClaUbicacion] [int] NOT NULL,
	[ClaArticulo] [int] NOT NULL,
	[ClaVersionArticulo] [int] NOT NULL,
	[NomVersionArticulo] [varchar](100) NULL,
	[ClaTipoVersionArticulo] [int] NULL,
	[ClaUnidad] [int] NULL,
	[PesoTeoricoKgs] [numeric](22, 4) NULL,
	[SepPuntaColaSeg] [numeric](22, 4) NULL,
	[VelocidadMtsSeg] [numeric](22, 4) NULL,
	[ClaveAutomatizacion] [int] NULL,
	[EsProducidaEnDeacero] [tinyint] NULL,
	[EsLocal] [tinyint] NULL,
	[FactorCubicaje] [numeric](22, 4) NULL,
	[BajaLogica] [tinyint] NOT NULL DEFAULT ((0)),
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL DEFAULT (getdate()),
	[NombrePcMod] [varchar](64) NOT NULL DEFAULT (host_name()),
	[ClaUsuarioMod] [int] NOT NULL DEFAULT ((0)),
 CONSTRAINT [PK_AceCatVersionArticulo] PRIMARY KEY CLUSTERED 
(
	[ClaUbicacion] ASC,
	[ClaArticulo] ASC,
	[ClaVersionArticulo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AceCfgProgConfiguracion]    Script Date: 26/08/2020 01:22:26 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AceCfgProgConfiguracion](
	[ClaUbicacion] [int] NOT NULL,
	[ClaConfiguracion] [int] NOT NULL,
	[NombreConfiguracion] [varchar](100) NULL,
	[Aplica] [tinyint] NULL,
	[valor1] [int] NULL,
	[valor2] [int] NULL,
	[valor3] [int] NULL,
	[string1] [varchar](250) NULL,
	[string2] [varchar](250) NULL,
	[string3] [varchar](250) NULL,
	[numero1] [numeric](10, 2) NULL,
	[numero2] [numeric](10, 2) NULL,
	[numero3] [numeric](10, 2) NULL,
	[ConfUsuario] [tinyint] NULL,
	[ClaUsuarioIns] [int] NULL,
	[ClaUsuarioMod] [int] NULL,
	[FechaIns] [datetime] NULL,
	[FechaUltimaMod] [datetime] NULL,
	[NombrePcMod] [varchar](64) NULL,
 CONSTRAINT [PK_AceCfgProgConfiguracion] PRIMARY KEY CLUSTERED 
(
	[ClaConfiguracion] ASC,
	[ClaUbicacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AceCTraMatrizCambioDet]    Script Date: 26/08/2020 01:22:26 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AceCTraMatrizCambioDet](
	[ClaUbicacion] [int] NOT NULL,
	[ClaTipoMatriz] [int] NOT NULL,
	[ClaTipoMatrizCambio] [int] NOT NULL,
	[ClaOrigen] [int] NOT NULL,
	[ClaDestino] [int] NOT NULL,
	[Costo] [float] NULL,
	[Tiempo] [float] NULL,
	[BajaLogica] [int] NULL,
	[ClaUsuarioIns] [int] NULL,
	[ClaUsuarioMod] [int] NULL,
	[FechaIns] [datetime] NULL,
	[FechaUltimaMod] [datetime] NULL,
	[NombrePcMod] [varchar](64) NULL,
 CONSTRAINT [PK_AceCTraMatrizCambioDet] PRIMARY KEY CLUSTERED 
(
	[ClaTipoMatriz] ASC,
	[ClaTipoMatrizCambio] ASC,
	[ClaUbicacion] ASC,
	[ClaOrigen] ASC,
	[ClaDestino] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AceCTraMatrizCambioEnc]    Script Date: 26/08/2020 01:22:26 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AceCTraMatrizCambioEnc](
	[ClaUbicacion] [int] NOT NULL,
	[ClaTipoMatriz] [int] NOT NULL,
	[ClaTipoMatrizCambio] [int] NOT NULL,
	[NomMatrizCambio] [varchar](50) NULL,
	[EsDefault] [int] NULL,
	[BajaLogica] [int] NULL,
	[ClaUsuarioIns] [int] NULL,
	[ClaUsuarioMod] [int] NULL,
	[FechaIns] [datetime] NULL,
	[FechaUltimaMod] [datetime] NULL,
	[NombrePcMod] [varchar](35) NULL,
 CONSTRAINT [PK_AceCTraMatrizCambioEnc] PRIMARY KEY CLUSTERED 
(
	[ClaTipoMatriz] ASC,
	[ClaTipoMatrizCambio] ASC,
	[ClaUbicacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AceRelEspecifClienteElemento]    Script Date: 26/08/2020 01:22:26 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AceRelEspecifClienteElemento](
	[ClaCliente] [int] NOT NULL,
	[ClaGrado] [int] NOT NULL,
	[ClaEspCliente] [int] NOT NULL,
	[ClaElemento] [int] NOT NULL,
	[ValorMin] [numeric](22, 8) NULL,
	[ValorMax] [numeric](22, 8) NULL,
	[Decimales] [int] NULL,
	[FechaUltimaMod] [datetime] NOT NULL DEFAULT (getdate()),
	[NombrePcMod] [varchar](64) NOT NULL DEFAULT (host_name()),
	[ClaUsuarioMod] [int] NOT NULL,
 CONSTRAINT [PK_AceRelEspecifClienteElemento] PRIMARY KEY CLUSTERED 
(
	[ClaCliente] ASC,
	[ClaGrado] ASC,
	[ClaEspCliente] ASC,
	[ClaElemento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AceRelEspecificacionElemento]    Script Date: 26/08/2020 01:22:26 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AceRelEspecificacionElemento](
	[ClaGrado] [int] NOT NULL,
	[ClaEspecificacionQuimica] [int] NOT NULL,
	[ClaElementoQuimico] [int] NOT NULL,
	[ValorMin] [numeric](22, 8) NULL,
	[ValorMax] [numeric](22, 8) NULL,
	[Formula] [varchar](8000) NULL,
	[EsDesviacion] [tinyint] NOT NULL DEFAULT ((0)),
	[FechaUltimaMod] [datetime] NOT NULL DEFAULT (getdate()),
	[NombrePcMod] [varchar](64) NOT NULL DEFAULT (host_name()),
	[ClaUsuarioMod] [int] NOT NULL,
 CONSTRAINT [PK_AceRelEspecificacionElemento] PRIMARY KEY CLUSTERED 
(
	[ClaGrado] ASC,
	[ClaEspecificacionQuimica] ASC,
	[ClaElementoQuimico] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AceTmpCalProducto]    Script Date: 26/08/2020 01:22:26 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AceTmpCalProducto](
	[ClaCalProducto] [int] NOT NULL,
	[ClaProductoPlanta] [varchar](10) NULL,
	[ClaProductoVentas] [varchar](10) NULL,
	[ClaAlmacen] [int] NULL,
	[ClaGrupoCosteo] [int] NULL,
	[ClaFamilia] [int] NULL,
	[ClaCalibre] [int] NULL,
	[ClaGrado] [int] NULL,
	[DescProducto] [varchar](250) NULL,
	[KgMetro] [numeric](16, 4) NULL,
	[ClaTipoLongitudVarilla] [int] NULL,
	[KgMetroAlambron] [numeric](16, 4) NULL,
	[PesoTeorico] [numeric](16, 4) NULL,
	[ClaUnidad] [int] NULL,
	[ControlPorLote] [tinyint] NULL,
	[Activo] [tinyint] NULL,
	[Cuna] [tinyint] NULL,
	[TipoProducto] [int] NULL,
	[FolioSolicitud] [int] NULL,
	[ClaFamiliaVentas] [int] NULL,
	[FactorCubicaje] [numeric](18, 8) NULL,
	[ClaSubfamilia] [int] NULL,
	[PesoTeoricoVenta] [numeric](18, 8) NULL,
	[ClaGrupoEstadistico] [int] NULL,
	[TipoEntsal] [int] NULL,
	[ClaUnidadVentas] [int] NULL,
	[Construccion] [tinyint] NULL,
	[ClaFamiliaProducir] [int] NULL,
	[ClaFamiliaDesperdicio] [int] NULL,
	[MatCorte] [int] NULL,
	[ClaUsuarioIns] [int] NULL,
	[ClaUsuarioMod] [int] NULL,
	[FechaIns] [datetime] NULL,
	[FechaUltimaMod] [datetime] NULL,
	[NombrePc] [varchar](35) NULL,
	[ClaGrupoProduccion] [int] NULL,
	[FolioSincro] [int] IDENTITY(1,1) NOT NULL,
	[NombreCorto] [varchar](250) NULL,
	[BajaLogica] [tinyint] NULL,
	[FechaBajaLogica] [datetime] NULL,
 CONSTRAINT [PK__CalProducto] PRIMARY KEY CLUSTERED 
(
	[ClaCalProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AceTmpEspecificacionMecanica]    Script Date: 26/08/2020 01:22:26 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AceTmpEspecificacionMecanica](
	[ClaGrado] [int] NOT NULL,
	[Observaciones] [varchar](250) NOT NULL,
	[MinRt] [numeric](16, 4) NULL,
	[MaxRt] [numeric](16, 4) NULL,
	[MinRa] [numeric](16, 4) NULL,
	[MaxRa] [numeric](16, 4) NULL,
	[MinEl] [numeric](16, 4) NULL,
	[MaxEl] [numeric](16, 4) NULL,
	[MinFl] [numeric](16, 4) NULL,
	[MaxFl] [numeric](16, 4) NULL,
	[ClaUsuarioIns] [int] NULL,
	[ClaUsuarioMod] [int] NULL,
	[FechaIns] [datetime] NULL,
	[FechaUltimaMod] [datetime] NULL,
	[NombrePc] [varchar](35) NULL,
	[ClaEspecificacionMecanica] [int] NOT NULL,
	[FechaInicioConfiguracion] [datetime] NULL,
	[FolProducto] [int] NULL,
 CONSTRAINT [PK_EspecificacionMecanica] PRIMARY KEY CLUSTERED 
(
	[ClaGrado] ASC,
	[ClaEspecificacionMecanica] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AceTmpEspecificacionTension]    Script Date: 26/08/2020 01:22:26 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AceTmpEspecificacionTension](
	[ClaArticulo] [int] NOT NULL,
	[MinRt] [numeric](22, 4) NULL,
	[MaxRt] [numeric](22, 4) NULL,
	[ClaPlanta] [int] NULL,
	[ClaUsuarioIns] [int] NULL,
	[ClaUsuarioMod] [int] NULL,
	[FechaIns] [datetime] NULL,
	[FechaUltimaMod] [datetime] NULL,
	[NombrePcMod] [varchar](64) NULL,
 CONSTRAINT [PK_EspecificacionTension] PRIMARY KEY CLUSTERED 
(
	[ClaArticulo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AceTmpPresentacionVarilla]    Script Date: 26/08/2020 01:22:26 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AceTmpPresentacionVarilla](
	[ClaPresentacionVarilla] [int] NULL,
	[DescPresentacionVarilla] [varchar](30) NULL,
	[Activo] [tinyint] NULL,
	[ClaveAutomatizacion] [int] NULL,
	[ClaVarillaLongitud] [numeric](29, 0) NULL,
	[ClaVarillaPrePresentacion] [numeric](29, 0) NULL,
	[ClaUsuarioIns] [int] NULL,
	[ClaUsuarioMod] [int] NULL,
	[FechaIns] [datetime] NULL,
	[FechaUltimaMod] [datetime] NULL,
	[NombrePcMod] [varchar](35) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AcuRelAcuerdoUbicacion]    Script Date: 26/08/2020 01:22:26 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AcuRelAcuerdoUbicacion](
	[ClaAcuerdo] [int] NOT NULL,
	[ClaUbicacion] [int] NOT NULL,
	[BajaLogica] [int] NULL,
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NULL,
	[ClaUsuarioMod] [int] NULL,
	[NombrePcMod] [varchar](50) NULL,
 CONSTRAINT [PK_AcuRelAcuerdoUbicacion] PRIMARY KEY CLUSTERED 
(
	[ClaAcuerdo] ASC,
	[ClaUbicacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AcuTraAcuerdo]    Script Date: 26/08/2020 01:22:26 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AcuTraAcuerdo](
	[ClaAcuerdo] [int] NOT NULL,
	[NomAcuerdo] [varchar](100) NULL,
	[ClaCUP] [int] NULL,
	[ClaProveedor] [int] NULL,
	[ClaTipoProveedor] [int] NULL,
	[Objetivo] [varchar](250) NULL,
	[DescAcuerdo] [varchar](100) NULL,
	[DescPenal] [varchar](250) NULL,
	[CalidadEspecif] [varchar](250) NULL,
	[SoporteTecnico] [varchar](250) NULL,
	[Garantias] [varchar](250) NULL,
	[ConveniosRelac] [varchar](100) NULL,
	[Comentarios] [varchar](250) NULL,
	[Descuento] [int] NULL,
	[ClaPaisOrigenProveedor] [int] NULL,
	[DiasPlazoPago] [int] NULL,
	[NomResponsable] [int] NULL,
	[FechaInicio] [datetime] NULL,
	[FechaTermino] [datetime] NULL,
	[ClaMoneda] [int] NULL,
	[ClaIncoterm] [int] NULL,
	[BajaLogica] [int] NULL DEFAULT ((0)),
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NULL DEFAULT (getdate()),
	[ClaUsuarioMod] [int] NULL,
	[NombrePcMod] [varchar](64) NULL DEFAULT (host_name()),
 CONSTRAINT [PK_AcuTraAcuerdo] PRIMARY KEY CLUSTERED 
(
	[ClaAcuerdo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AcuTraAcuerdoDet]    Script Date: 26/08/2020 01:22:26 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AcuTraAcuerdoDet](
	[ClaAcuerdo] [int] NOT NULL,
	[ClaArticulo] [int] NOT NULL,
	[ClaUbicacion] [int] NOT NULL,
	[ClaveArticulo] [int] NOT NULL,
	[DiasPlanta] [int] NULL,
	[DiasEmbarque] [int] NULL,
	[PrecioNeto] [numeric](14, 4) NULL,
	[ClaUnidad] [int] NULL,
	[BajaLogica] [int] NULL CONSTRAINT [DF__AcuTraAcu__BajaL__5E4C7456]  DEFAULT ((0)),
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NULL CONSTRAINT [DF__AcuTraAcu__Fecha__5F40988F]  DEFAULT (getdate()),
	[ClaUsuarioMod] [int] NULL,
	[NombrePcMod] [varchar](64) NULL CONSTRAINT [DF__AcuTraAcu__Nombr__6034BCC8]  DEFAULT (host_name()),
 CONSTRAINT [PK_AcuTraAcuerdoDet] PRIMARY KEY CLUSTERED 
(
	[ClaAcuerdo] ASC,
	[ClaArticulo] ASC,
	[ClaUbicacion] ASC,
	[ClaveArticulo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AfTraProyecto]    Script Date: 26/08/2020 01:22:26 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AfTraProyecto](
	[ClaEmpresa] [int] NOT NULL,
	[IdProyecto] [int] NOT NULL,
	[ClaDireccion] [int] NOT NULL,
	[NombreProyecto] [varchar](100) NULL,
	[ClaEstatus] [int] NULL,
	[BajaLogica] [int] NULL,
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NULL,
	[ClaUsuarioMod] [int] NULL,
	[NombrePcMod] [varchar](50) NULL,
 CONSTRAINT [PK_AfTraProyecto] PRIMARY KEY CLUSTERED 
(
	[ClaEmpresa] ASC,
	[IdProyecto] ASC,
	[ClaDireccion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AgCatDiasTransito]    Script Date: 26/08/2020 01:22:26 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AgCatDiasTransito](
	[ClaUbicacionOrigen] [int] NOT NULL,
	[ClaUbicacionDestino] [int] NOT NULL,
	[DiasTransito] [int] NOT NULL,
	[BajaLogica] [int] NOT NULL,
	[FechaBajaLogica] [datetime] NULL,
	[NombrePcMod] [varchar](255) NULL,
	[FechaUltimaMod] [datetime] NULL,
	[ClaUsuarioMod] [int] NULL,
	[FechaIns] [datetime] NULL,
	[ClaUsuarioIns] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ClaUbicacionOrigen] ASC,
	[ClaUbicacionDestino] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AgCatTecnologiaExclusiva]    Script Date: 26/08/2020 01:22:26 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AgCatTecnologiaExclusiva](
	[ClaArticulo] [int] NOT NULL,
	[ClaUbicacion] [int] NOT NULL,
	[ClaUbicacionElabora] [int] NULL,
	[ClaFamilia] [int] NOT NULL,
	[ClaSubfamilia] [int] NOT NULL,
	[DiasTransito] [int] NULL,
	[Multiplo] [int] NULL,
	[FechaUltimaMod] [datetime] NULL,
	[NombrePcMod] [varchar](64) NULL,
	[ClaUsuarioMod] [int] NULL,
	[FechaIns] [datetime] NULL,
	[ClaUsuarioIns] [int] NULL,
	[BajaLogica] [int] NULL,
	[FechaBajaLogica] [datetime] NULL,
 CONSTRAINT [PK_AgCatTecnologiaExclusiva] PRIMARY KEY CLUSTERED 
(
	[ClaFamilia] ASC,
	[ClaSubfamilia] ASC,
	[ClaArticulo] ASC,
	[ClaUbicacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AlmCTraCostoPromMesArticulo]    Script Date: 26/08/2020 01:22:26 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AlmCTraCostoPromMesArticulo](
	[ClaUbicacion] [int] NOT NULL,
	[ClaArticulo] [int] NOT NULL,
	[ClaveArticulo] [varchar](20) NULL,
	[AnioMes] [int] NOT NULL,
	[PrecioMn] [numeric](14, 4) NULL,
	[BajaLogica] [int] NULL,
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NULL,
	[ClaUsuarioMod] [int] NULL,
	[NombrePcMod] [varchar](64) NULL,
 CONSTRAINT [PK_AlmCTraCostoPromMesArticulo_1] PRIMARY KEY CLUSTERED 
(
	[ClaUbicacion] ASC,
	[ClaArticulo] ASC,
	[AnioMes] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AlmRelAfectaSubDepto]    Script Date: 26/08/2020 01:22:26 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AlmRelAfectaSubDepto](
	[ClaUbicacion] [int] NOT NULL,
	[ClaDepartamento] [int] NOT NULL,
	[ClaSubDepartamento] [int] NOT NULL,
	[ClaProyecto] [int] NULL,
	[ClaCRC] [int] NULL,
	[ClaGrupoAsignacion] [int] NULL,
	[ClaDireccion] [varchar](50) NULL,
	[ClaClasificacionCuenta] [int] NULL,
	[BajaLogica] [int] NULL,
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NULL,
	[ClaUsuarioMod] [int] NULL,
	[NombrePcMod] [varchar](60) NULL,
 CONSTRAINT [PK_AlmRelAfectaSubDepto] PRIMARY KEY CLUSTERED 
(
	[ClaUbicacion] ASC,
	[ClaDepartamento] ASC,
	[ClaSubDepartamento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AlmTraCostoPromMesArticulo]    Script Date: 26/08/2020 01:22:26 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AlmTraCostoPromMesArticulo](
	[ClaUbicacion] [int] NOT NULL,
	[ClaArticulo] [int] NOT NULL,
	[AnioMes] [int] NOT NULL,
	[PrecioMn] [numeric](14, 4) NULL,
	[BajaLogica] [int] NULL DEFAULT ((0)),
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NULL DEFAULT (getdate()),
	[NombrePcMod] [varchar](64) NULL DEFAULT (host_name()),
	[ClaUsuarioMod] [int] NULL,
 CONSTRAINT [PK_AlmTraCostoPromMesArticulo] PRIMARY KEY CLUSTERED 
(
	[ClaUbicacion] ASC,
	[ClaArticulo] ASC,
	[AnioMes] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AlmTraDiaCierre]    Script Date: 26/08/2020 01:22:26 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AlmTraDiaCierre](
	[ClaUbicacion] [int] NOT NULL,
	[AnioMes] [int] NOT NULL,
	[FechaCierre] [datetime] NULL,
	[BajaLogica] [int] NULL,
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NULL,
	[NombrePcMod] [varchar](50) NULL,
 CONSTRAINT [PK_AlmTraDiaCierre] PRIMARY KEY CLUSTERED 
(
	[ClaUbicacion] ASC,
	[AnioMes] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AmpCatProveedor]    Script Date: 26/08/2020 01:22:26 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AmpCatProveedor](
	[ClaUbicacion] [int] NOT NULL,
	[ClaProveedor] [int] NOT NULL,
	[ClaTipoProveedor] [int] NULL,
	[NomProveedor] [varchar](250) NULL,
	[Direccion] [varchar](250) NULL,
	[Poblacion] [varchar](250) NULL,
	[ClaCup] [int] NULL,
	[BajaLogica] [tinyint] NOT NULL,
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL,
	[ClaUsuarioMod] [int] NOT NULL,
	[NombrePcMod] [varchar](64) NOT NULL,
	[ClaMoneda] [int] NULL,
	[ApellidoPaterno] [varchar](50) NULL,
	[ApellidoMaterno] [varchar](50) NULL,
	[EsCuentaIndustrial] [tinyint] NULL,
	[EsMaterialIndexado] [tinyint] NULL,
	[EsRollOff] [tinyint] NULL,
	[ClaCupProveedorEntrega] [int] NULL,
	[ClaPlaza] [int] NULL,
	[ClaDivision] [int] NULL,
	[ClaRegion] [int] NULL,
	[ClaZonaFacturacion] [int] NULL,
	[ClaZona] [int] NULL,
	[ClaEsquemaProveedor] [int] NULL,
	[ClaClasifProveedor] [int] NULL,
	[MotivoEliminacion] [varchar](250) NULL,
 CONSTRAINT [PK_AmpCatProveedor] PRIMARY KEY CLUSTERED 
(
	[ClaUbicacion] ASC,
	[ClaProveedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AmpCatProveedorLegacy]    Script Date: 26/08/2020 01:22:26 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AmpCatProveedorLegacy](
	[ClaUbicacion] [int] NOT NULL,
	[ClaProveedor] [int] NOT NULL,
	[ClaTipoProveedor] [int] NULL,
	[NomProveedor] [varchar](250) NULL,
	[Direccion] [varchar](250) NULL,
	[Poblacion] [varchar](250) NULL,
	[ClaCup] [int] NULL,
	[BajaLogica] [tinyint] NOT NULL,
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL,
	[ClaUsuarioMod] [int] NOT NULL,
	[NombrePcMod] [varchar](64) NOT NULL,
	[ClaMoneda] [int] NULL,
	[ApellidoPaterno] [varchar](50) NULL,
	[ApellidoMaterno] [varchar](50) NULL,
	[EsCuentaIndustrial] [tinyint] NULL,
	[EsMaterialIndexado] [tinyint] NULL,
	[EsRollOff] [tinyint] NULL,
	[ClaCupProveedorEntrega] [int] NULL,
	[ClaPlaza] [int] NULL,
	[ClaDivision] [int] NULL,
	[ClaRegion] [int] NULL,
	[ClaZonaFacturacion] [int] NULL,
	[ClaZona] [int] NULL,
	[ClaEsquemaProveedor] [int] NULL,
	[ClaClasifProveedor] [int] NULL,
	[MotivoEliminacion] [varchar](250) NULL,
 CONSTRAINT [PK_AmpCatProveedorLegacy] PRIMARY KEY CLUSTERED 
(
	[ClaUbicacion] ASC,
	[ClaProveedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AmpCatVehiculo]    Script Date: 26/08/2020 01:22:26 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AmpCatVehiculo](
	[ClaUbicacion] [tinyint] NOT NULL,
	[ClaVehiculo] [int] NOT NULL,
	[Placas] [varchar](20) NOT NULL,
	[ClaTransportista] [int] NULL,
	[ClaProveedor] [int] NULL,
	[EsTransportistaProv] [tinyint] NULL,
	[BajaLogica] [int] NULL,
	[FechaUltimaMod] [datetime] NULL,
	[ClaUsuarioMod] [int] NULL,
	[NombrePcMod] [varchar](60) NULL,
	[FechaBajaLogica] [datetime] NULL,
	[ClaTransporte] [int] NULL,
 CONSTRAINT [PKAmpCatVehiculo] PRIMARY KEY CLUSTERED 
(
	[ClaUbicacion] ASC,
	[ClaVehiculo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ArtCatAgrupadoresCostoInt]    Script Date: 26/08/2020 01:22:26 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ArtCatAgrupadoresCostoInt](
	[ClaAgrupador] [int] NOT NULL,
	[ClaveAgrupador] [varchar](50) NOT NULL,
	[NomAgrupador] [varchar](100) NOT NULL,
	[BajaLogica] [int] NOT NULL,
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NULL,
	[ClaUsuarioMod] [int] NULL,
	[NombrePcMod] [varchar](64) NULL,
	[ClaFamilia] [int] NULL,
 CONSTRAINT [PKArtCatAgrupadoresCostoInt] PRIMARY KEY CLUSTERED 
(
	[ClaAgrupador] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ArtCatArticulo]    Script Date: 26/08/2020 01:22:26 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ArtCatArticulo](
	[ClaTipoInventario] [int] NOT NULL,
	[ClaArticulo] [int] NOT NULL,
	[ClaveArticulo] [varchar](20) NOT NULL,
	[CodigoArticulo] [varchar](100) NULL,
	[NomArticulo] [varchar](250) NOT NULL,
	[NomArticuloIngles] [varchar](250) NULL,
	[NomArticuloOtroIdioma] [varchar](250) NULL,
	[ClaClasifGeneral] [int] NOT NULL,
	[ClaFamilia] [int] NOT NULL,
	[ClaSubfamilia] [int] NOT NULL,
	[ClaPlantilla] [int] NOT NULL,
	[ClaMarca] [int] NULL,
	[ClaTipoArticulo] [int] NULL,
	[ClaGpoProcesoProd] [int] NULL,
	[ClaGpoCosteo] [int] NULL,
	[ClaGpoEstadistico] [int] NULL,
	[ClaUNSPC1] [int] NULL,
	[ClaUNSPC2] [int] NULL,
	[ClaUNSPC3] [int] NULL,
	[ClaUNSPC4] [int] NULL,
	[ClaUnidadBase] [int] NOT NULL,
	[ClaUnidadProd] [int] NULL,
	[FactorConversion] [numeric](22, 7) NULL,
	[FactorCubicaje] [numeric](22, 7) NULL,
	[PesoTeoricoKgs] [numeric](22, 7) NULL,
	[Comentarios] [varchar](250) NULL,
	[FechaIns] [datetime] NOT NULL,
	[ClaUsuarioIns] [int] NOT NULL,
	[ClaEstatusVobo] [int] NOT NULL,
	[BajaLogica] [int] NOT NULL,
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL,
	[NombrePcMod] [varchar](64) NOT NULL,
	[ClaUsuarioMod] [int] NOT NULL,
	[ClaPrefijoClave] [int] NULL,
	[ClaClaveCruda] [int] NULL,
	[ClaArticuloInsumo] [int] NULL,
	[Referencia] [varchar](250) NULL,
	[ClaEmpaqueInd] [int] NULL,
	[ClaEmpaqueAgrup] [int] NULL,
	[ClaUbicacionIns] [int] NOT NULL CONSTRAINT [DF__ArtCatArt__ClaUb__0936D25B]  DEFAULT ((6)),
	[ClaGpoEmpaque] [int] NULL,
	[EsObsoleto] [tinyint] NULL,
	[EsExcentoIVA] [tinyint] NULL,
	[VolumenAlto] [numeric](22, 7) NULL,
	[VolumenAncho] [numeric](22, 7) NULL,
	[VolumenLargo] [numeric](22, 7) NULL,
	[ClaUnidadVolumen] [int] NULL,
	[ClaComplejidad] [int] NULL,
	[EsHomologado] [tinyint] NULL,
	[PesoTeoricoKgsMin] [numeric](22, 7) NULL,
	[PesoTeoricoKgsMax] [numeric](22, 7) NULL,
	[ClaEmpresaCodigoBar] [int] NULL,
	[ClaProteccionEmpaque] [int] NULL,
	[EsDisponibleCopia] [int] NULL DEFAULT ((1)),
	[EsDisponibleUso] [int] NULL DEFAULT ((1)),
	[EsCambioHistorial] [int] NULL DEFAULT ((0)),
	[ClaAgrupador] [int] NULL,
	[ClaClienteArt] [int] NULL,
 CONSTRAINT [PKArtCatArticulo] PRIMARY KEY CLUSTERED 
(
	[ClaTipoInventario] ASC,
	[ClaArticulo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ArtCatArticulo_Bitacora]    Script Date: 26/08/2020 01:22:26 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ArtCatArticulo_Bitacora](
	[ClaTipoInventario] [int] NOT NULL,
	[ClaArticulo] [int] NOT NULL,
	[ClaveArticulo] [varchar](20) NOT NULL,
	[ClaveArticuloPlanta] [varchar](50) NOT NULL,
	[CodigoArticulo] [varchar](100) NULL,
	[TipoMigracion] [int] NOT NULL,
	[Sube] [int] NULL,
	[NomArticulo] [varchar](250) NOT NULL,
	[NomArticuloIngles] [varchar](250) NULL,
	[NomArticuloOtroIdioma] [varchar](250) NULL,
	[ClaClasifGeneral] [int] NOT NULL,
	[ClaFamilia] [int] NOT NULL,
	[ClaSubfamilia] [int] NOT NULL,
	[ClaPlantilla] [int] NOT NULL,
	[ClaMarca] [int] NULL,
	[ClaTipoArticulo] [int] NULL,
	[ClaGpoProcesoProd] [int] NULL,
	[ClaGpoCosteo] [int] NULL,
	[ClaGpoEstadistico] [int] NULL,
	[ClaUNSPC1] [int] NULL,
	[ClaUNSPC2] [int] NULL,
	[ClaUNSPC3] [int] NULL,
	[ClaUNSPC4] [int] NULL,
	[ClaUnidadBase] [int] NOT NULL,
	[ClaUnidadProd] [int] NULL,
	[FactorConversion] [numeric](22, 7) NULL,
	[FactorCubicaje] [numeric](22, 7) NULL,
	[PesoTeoricoKgs] [numeric](22, 7) NULL,
	[Comentarios] [varchar](250) NULL,
	[FechaIns] [datetime] NOT NULL,
	[ClaUsuarioIns] [int] NOT NULL,
	[ClaEstatusVobo] [int] NOT NULL,
	[BajaLogica] [int] NOT NULL,
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL,
	[NombrePcMod] [varchar](64) NOT NULL,
	[ClaUsuarioMod] [int] NOT NULL,
	[ClaPrefijoClave] [int] NULL,
	[ClaClaveCruda] [int] NULL,
	[ClaArticuloInsumo] [int] NULL,
	[Referencia] [varchar](250) NULL,
	[ClaEmpaqueInd] [int] NULL,
	[ClaEmpaqueAgrup] [int] NULL,
	[ClaUbicacionIns] [int] NOT NULL CONSTRAINT [DF__ArtCatArt_1]  DEFAULT ((6)),
	[ClaGpoEmpaque] [int] NULL,
	[EsObsoleto] [tinyint] NULL,
	[EsExcentoIVA] [tinyint] NULL,
	[VolumenAlto] [numeric](22, 7) NULL,
	[VolumenAncho] [numeric](22, 7) NULL,
	[VolumenLargo] [numeric](22, 7) NULL,
	[ClaUnidadVolumen] [int] NULL,
	[ClaComplejidad] [int] NULL,
	[EsHomologado] [tinyint] NULL,
	[PesoTeoricoKgsMin] [numeric](22, 7) NULL,
	[PesoTeoricoKgsMax] [numeric](22, 7) NULL,
	[ClaEmpresaCodigoBar] [int] NULL,
	[EsDisponibleCopia] [int] NULL DEFAULT ((1)),
	[EsDisponibleUso] [int] NULL DEFAULT ((1)),
	[EsCambioHistorial] [int] NULL DEFAULT ((0)),
	[ClaProteccionEmpaque] [int] NULL,
	[ClaFolio] [int] NOT NULL,
 CONSTRAINT [PKArtCatArticulo_bitacora] PRIMARY KEY CLUSTERED 
(
	[ClaTipoInventario] ASC,
	[ClaArticulo] ASC,
	[ClaFolio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ArtCatArticulo_Bitacora2]    Script Date: 26/08/2020 01:22:26 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ArtCatArticulo_Bitacora2](
	[clavearticulo] [varchar](20) NOT NULL,
	[claarticulo] [int] NOT NULL,
	[tipomigracion] [int] NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[artcatarticulo_desconocido]    Script Date: 26/08/2020 01:22:26 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[artcatarticulo_desconocido](
	[ClaTipoInventario] [int] NOT NULL,
	[ClaArticulo] [int] NOT NULL,
	[ClaveArticulo] [varchar](20) NOT NULL,
	[CodigoArticulo] [varchar](100) NULL,
	[NomArticulo] [varchar](250) NOT NULL,
	[NomArticuloIngles] [varchar](250) NULL,
	[NomArticuloOtroIdioma] [varchar](250) NULL,
	[ClaClasifGeneral] [int] NOT NULL,
	[ClaFamilia] [int] NOT NULL,
	[ClaSubfamilia] [int] NOT NULL,
	[ClaPlantilla] [int] NOT NULL,
	[ClaMarca] [int] NULL,
	[ClaTipoArticulo] [int] NULL,
	[ClaGpoProcesoProd] [int] NULL,
	[ClaGpoCosteo] [int] NULL,
	[ClaGpoEstadistico] [int] NULL,
	[ClaUNSPC1] [int] NULL,
	[ClaUNSPC2] [int] NULL,
	[ClaUNSPC3] [int] NULL,
	[ClaUNSPC4] [int] NULL,
	[ClaUnidadBase] [int] NOT NULL,
	[ClaUnidadProd] [int] NULL,
	[FactorConversion] [numeric](22, 7) NULL,
	[FactorCubicaje] [numeric](22, 7) NULL,
	[PesoTeoricoKgs] [numeric](22, 7) NULL,
	[Comentarios] [varchar](250) NULL,
	[FechaIns] [datetime] NOT NULL,
	[ClaUsuarioIns] [int] NOT NULL,
	[ClaEstatusVobo] [int] NOT NULL,
	[BajaLogica] [int] NOT NULL,
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL,
	[NombrePcMod] [varchar](64) NOT NULL,
	[ClaUsuarioMod] [int] NOT NULL,
	[ClaPrefijoClave] [int] NULL,
	[ClaClaveCruda] [int] NULL,
	[ClaArticuloInsumo] [int] NULL,
	[Referencia] [varchar](250) NULL,
	[ClaEmpaqueInd] [int] NULL,
	[ClaEmpaqueAgrup] [int] NULL,
	[ClaUbicacionIns] [int] NOT NULL,
	[ClaGpoEmpaque] [int] NULL,
	[EsObsoleto] [tinyint] NULL,
	[EsExcentoIVA] [tinyint] NULL,
	[VolumenAlto] [numeric](22, 7) NULL,
	[VolumenAncho] [numeric](22, 7) NULL,
	[VolumenLargo] [numeric](22, 7) NULL,
	[ClaUnidadVolumen] [int] NULL,
	[ClaComplejidad] [int] NULL,
	[EsHomologado] [tinyint] NULL,
	[PesoTeoricoKgsMin] [numeric](22, 7) NULL,
	[PesoTeoricoKgsMax] [numeric](22, 7) NULL,
	[ClaEmpresaCodigoBar] [int] NULL,
	[ClaProteccionEmpaque] [int] NULL,
	[EsDisponibleCopia] [int] NULL,
	[EsDisponibleUso] [int] NULL,
	[EsCambioHistorial] [int] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ArtCatArticulo_fp178665]    Script Date: 26/08/2020 01:22:26 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ArtCatArticulo_fp178665](
	[ClaTipoInventario] [int] NOT NULL,
	[ClaArticulo] [int] NOT NULL,
	[ClaveArticulo] [varchar](20) NOT NULL,
	[CodigoArticulo] [varchar](100) NULL,
	[NomArticulo] [varchar](250) NOT NULL,
	[NomArticuloIngles] [varchar](250) NULL,
	[NomArticuloOtroIdioma] [varchar](250) NULL,
	[ClaClasifGeneral] [int] NOT NULL,
	[ClaFamilia] [int] NOT NULL,
	[ClaSubfamilia] [int] NOT NULL,
	[ClaPlantilla] [int] NOT NULL,
	[ClaMarca] [int] NULL,
	[ClaTipoArticulo] [int] NULL,
	[ClaGpoProcesoProd] [int] NULL,
	[ClaGpoCosteo] [int] NULL,
	[ClaGpoEstadistico] [int] NULL,
	[ClaUNSPC1] [int] NULL,
	[ClaUNSPC2] [int] NULL,
	[ClaUNSPC3] [int] NULL,
	[ClaUNSPC4] [int] NULL,
	[ClaUnidadBase] [int] NOT NULL,
	[ClaUnidadProd] [int] NULL,
	[FactorConversion] [numeric](22, 7) NULL,
	[FactorCubicaje] [numeric](22, 7) NULL,
	[PesoTeoricoKgs] [numeric](22, 7) NULL,
	[Comentarios] [varchar](250) NULL,
	[FechaIns] [datetime] NOT NULL,
	[ClaUsuarioIns] [int] NOT NULL,
	[ClaEstatusVobo] [int] NOT NULL,
	[BajaLogica] [int] NOT NULL,
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL,
	[NombrePcMod] [varchar](64) NOT NULL,
	[ClaUsuarioMod] [int] NOT NULL,
	[ClaPrefijoClave] [int] NULL,
	[ClaClaveCruda] [int] NULL,
	[ClaArticuloInsumo] [int] NULL,
	[Referencia] [varchar](250) NULL,
	[ClaEmpaqueInd] [int] NULL,
	[ClaEmpaqueAgrup] [int] NULL,
	[ClaUbicacionIns] [int] NOT NULL,
	[ClaGpoEmpaque] [int] NULL,
	[EsObsoleto] [tinyint] NULL,
	[EsExcentoIVA] [tinyint] NULL,
	[VolumenAlto] [numeric](22, 7) NULL,
	[VolumenAncho] [numeric](22, 7) NULL,
	[VolumenLargo] [numeric](22, 7) NULL,
	[ClaUnidadVolumen] [int] NULL,
	[ClaComplejidad] [int] NULL,
	[EsHomologado] [tinyint] NULL,
	[PesoTeoricoKgsMin] [numeric](22, 7) NULL,
	[PesoTeoricoKgsMax] [numeric](22, 7) NULL,
	[ClaEmpresaCodigoBar] [int] NULL,
	[ClaProteccionEmpaque] [int] NULL,
	[EsDisponibleCopia] [int] NULL,
	[EsDisponibleUso] [int] NULL,
	[EsCambioHistorial] [int] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[artcatarticulo_fp191283]    Script Date: 26/08/2020 01:22:26 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[artcatarticulo_fp191283](
	[ClaTipoInventario] [int] NOT NULL,
	[ClaArticulo] [int] NOT NULL,
	[ClaveArticulo] [varchar](20) NOT NULL,
	[CodigoArticulo] [varchar](100) NULL,
	[NomArticulo] [varchar](250) NOT NULL,
	[NomArticuloIngles] [varchar](250) NULL,
	[NomArticuloOtroIdioma] [varchar](250) NULL,
	[ClaClasifGeneral] [int] NOT NULL,
	[ClaFamilia] [int] NOT NULL,
	[ClaSubfamilia] [int] NOT NULL,
	[ClaPlantilla] [int] NOT NULL,
	[ClaMarca] [int] NULL,
	[ClaTipoArticulo] [int] NULL,
	[ClaGpoProcesoProd] [int] NULL,
	[ClaGpoCosteo] [int] NULL,
	[ClaGpoEstadistico] [int] NULL,
	[ClaUNSPC1] [int] NULL,
	[ClaUNSPC2] [int] NULL,
	[ClaUNSPC3] [int] NULL,
	[ClaUNSPC4] [int] NULL,
	[ClaUnidadBase] [int] NOT NULL,
	[ClaUnidadProd] [int] NULL,
	[FactorConversion] [numeric](22, 7) NULL,
	[FactorCubicaje] [numeric](22, 7) NULL,
	[PesoTeoricoKgs] [numeric](22, 7) NULL,
	[Comentarios] [varchar](250) NULL,
	[FechaIns] [datetime] NOT NULL,
	[ClaUsuarioIns] [int] NOT NULL,
	[ClaEstatusVobo] [int] NOT NULL,
	[BajaLogica] [int] NOT NULL,
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL,
	[NombrePcMod] [varchar](64) NOT NULL,
	[ClaUsuarioMod] [int] NOT NULL,
	[ClaPrefijoClave] [int] NULL,
	[ClaClaveCruda] [int] NULL,
	[ClaArticuloInsumo] [int] NULL,
	[Referencia] [varchar](250) NULL,
	[ClaEmpaqueInd] [int] NULL,
	[ClaEmpaqueAgrup] [int] NULL,
	[ClaUbicacionIns] [int] NOT NULL,
	[ClaGpoEmpaque] [int] NULL,
	[EsObsoleto] [tinyint] NULL,
	[EsExcentoIVA] [tinyint] NULL,
	[VolumenAlto] [numeric](22, 7) NULL,
	[VolumenAncho] [numeric](22, 7) NULL,
	[VolumenLargo] [numeric](22, 7) NULL,
	[ClaUnidadVolumen] [int] NULL,
	[ClaComplejidad] [int] NULL,
	[EsHomologado] [tinyint] NULL,
	[PesoTeoricoKgsMin] [numeric](22, 7) NULL,
	[PesoTeoricoKgsMax] [numeric](22, 7) NULL,
	[ClaEmpresaCodigoBar] [int] NULL,
	[ClaProteccionEmpaque] [int] NULL,
	[EsDisponibleCopia] [int] NULL,
	[EsDisponibleUso] [int] NULL,
	[EsCambioHistorial] [int] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ARTCATARTICULO_MIGRADOS]    Script Date: 26/08/2020 01:22:26 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ARTCATARTICULO_MIGRADOS](
	[CLAARTICULO] [int] NULL,
	[CLAVEARTICULO] [varchar](50) NULL,
	[NOMARTICULO] [varchar](250) NULL,
	[CLAFAMILIA] [int] NULL,
	[CLASUBFAMILIA] [int] NULL,
	[CLAPLANTILLA] [int] NULL,
	[FACTORCONVERSION] [numeric](22, 7) NULL,
	[ClaClasifGeneral] [int] NULL,
	[ClaUnidadBase] [int] NULL,
	[EsHomologado] [int] NULL,
	[EsDisponibleCopia] [int] NULL,
	[EsDisponibleUso] [int] NULL,
	[EsCambioHistorial] [int] NULL,
	[FechaUltimaMod] [datetime] NULL,
	[NombrePcMod] [varchar](50) NULL,
	[EsObsoleto] [int] NULL,
	[ClaUsuarioMod] [int] NULL,
	[BajaLogica] [int] NULL,
	[ClaUNSPC1] [int] NULL,
	[ClaUNSPC2] [int] NULL,
	[ClaUNSPC3] [int] NULL,
	[ClaUNSPC4] [int] NULL,
	[FechaIns] [datetime] NULL,
	[ClaUbicacionIns] [int] NULL,
	[ClaFolio] [int] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[artcatarticulo_problema]    Script Date: 26/08/2020 01:22:26 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[artcatarticulo_problema](
	[FOLIO_CENTRAL] [int] NULL,
	[NOCASOS] [int] NULL,
	[MOTIVO] [varchar](20) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[artcatarticulo_respaldo_htce]    Script Date: 26/08/2020 01:22:26 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[artcatarticulo_respaldo_htce](
	[ClaTipoInventario] [int] NOT NULL,
	[ClaArticulo] [int] NOT NULL,
	[ClaveArticulo] [varchar](20) NOT NULL,
	[CodigoArticulo] [varchar](100) NULL,
	[NomArticulo] [varchar](250) NOT NULL,
	[NomArticuloIngles] [varchar](250) NULL,
	[NomArticuloOtroIdioma] [varchar](250) NULL,
	[ClaClasifGeneral] [int] NOT NULL,
	[ClaFamilia] [int] NOT NULL,
	[ClaSubfamilia] [int] NOT NULL,
	[ClaPlantilla] [int] NOT NULL,
	[ClaMarca] [int] NULL,
	[ClaTipoArticulo] [int] NULL,
	[ClaGpoProcesoProd] [int] NULL,
	[ClaGpoCosteo] [int] NULL,
	[ClaGpoEstadistico] [int] NULL,
	[ClaUNSPC1] [int] NULL,
	[ClaUNSPC2] [int] NULL,
	[ClaUNSPC3] [int] NULL,
	[ClaUNSPC4] [int] NULL,
	[ClaUnidadBase] [int] NOT NULL,
	[ClaUnidadProd] [int] NULL,
	[FactorConversion] [numeric](22, 7) NULL,
	[FactorCubicaje] [numeric](22, 7) NULL,
	[PesoTeoricoKgs] [numeric](22, 7) NULL,
	[Comentarios] [varchar](250) NULL,
	[FechaIns] [datetime] NOT NULL,
	[ClaUsuarioIns] [int] NOT NULL,
	[ClaEstatusVobo] [int] NOT NULL,
	[BajaLogica] [int] NOT NULL,
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL,
	[NombrePcMod] [varchar](64) NOT NULL,
	[ClaUsuarioMod] [int] NOT NULL,
	[ClaPrefijoClave] [int] NULL,
	[ClaClaveCruda] [int] NULL,
	[ClaArticuloInsumo] [int] NULL,
	[Referencia] [varchar](250) NULL,
	[ClaEmpaqueInd] [int] NULL,
	[ClaEmpaqueAgrup] [int] NULL,
	[ClaUbicacionIns] [int] NOT NULL,
	[ClaGpoEmpaque] [int] NULL,
	[EsObsoleto] [tinyint] NULL,
	[EsExcentoIVA] [tinyint] NULL,
	[VolumenAlto] [numeric](22, 7) NULL,
	[VolumenAncho] [numeric](22, 7) NULL,
	[VolumenLargo] [numeric](22, 7) NULL,
	[ClaUnidadVolumen] [int] NULL,
	[ClaComplejidad] [int] NULL,
	[EsHomologado] [tinyint] NULL,
	[PesoTeoricoKgsMin] [numeric](22, 7) NULL,
	[PesoTeoricoKgsMax] [numeric](22, 7) NULL,
	[ClaEmpresaCodigoBar] [int] NULL,
	[ClaProteccionEmpaque] [int] NULL,
	[EsDisponibleCopia] [int] NULL,
	[EsDisponibleUso] [int] NULL,
	[EsCambioHistorial] [int] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ArtCatArticuloAce]    Script Date: 26/08/2020 01:22:26 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ArtCatArticuloAce](
	[ClaTipoInventario] [int] NOT NULL,
	[ClaArticulo] [int] NOT NULL,
	[ClaGrado] [int] NULL,
	[ClaGrupoProduccion] [int] NULL,
	[KgMetro] [numeric](22, 4) NULL,
	[ClaFamiliaUso] [int] NULL,
	[ClaFamiliaDesperdicio] [int] NULL,
	[EsCuna] [tinyint] NULL,
	[ClaAlmacen] [int] NULL,
	[EsControlLote] [tinyint] NULL,
	[BajaLogica] [tinyint] NOT NULL DEFAULT ((0)),
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL DEFAULT (getdate()),
	[NombrePcMod] [varchar](64) NOT NULL DEFAULT (host_name()),
	[ClaUsuarioMod] [int] NOT NULL,
 CONSTRAINT [PK_ArtCatArticuloAce] PRIMARY KEY CLUSTERED 
(
	[ClaTipoInventario] ASC,
	[ClaArticulo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ArtCatArtSustitutoOrig]    Script Date: 26/08/2020 01:22:26 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ArtCatArtSustitutoOrig](
	[ClaUbicacion] [int] NOT NULL,
	[ClaArticuloOriginal] [int] NOT NULL,
	[ClaArticuloNuevo] [int] NOT NULL,
	[FechaInicioCambio] [datetime] NULL,
	[FechaFinalCambio] [datetime] NULL,
	[FactorConversion] [numeric](22, 2) NULL,
	[ClaUnidadNueva] [int] NULL,
	[ClaUnidadOriginal] [int] NULL,
	[FechaUltimaMod] [datetime] NULL DEFAULT (getdate()),
	[NombrePcMod] [varchar](64) NULL DEFAULT (host_name()),
	[ClaUsuarioMod] [int] NULL DEFAULT ((0)),
 CONSTRAINT [PK_ArtCatArtSustitutoOrig] PRIMARY KEY CLUSTERED 
(
	[ClaUbicacion] ASC,
	[ClaArticuloOriginal] ASC,
	[ClaArticuloNuevo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ArtCatCaracteristica]    Script Date: 26/08/2020 01:22:26 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ArtCatCaracteristica](
	[ClaTipoInventario] [int] NOT NULL,
	[ClaCaracteristica] [int] NOT NULL,
	[NomCaracteristica] [varchar](100) NOT NULL,
	[NomCaracteristicaIngles] [varchar](100) NULL,
	[NomCaracteristicaOtroIdioma] [varchar](100) NULL,
	[ClaTipoCaracteristica] [int] NOT NULL,
	[EsPorUbicacion] [tinyint] NOT NULL,
	[Separador] [varchar](5) NULL,
	[Observaciones] [varchar](100) NULL,
	[BajaLogica] [int] NOT NULL,
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL,
	[NombrePcMod] [varchar](64) NOT NULL,
	[ClaUsuarioMod] [int] NOT NULL,
	[ClaGrupoCaracteristica] [int] NULL,
 CONSTRAINT [PKArtCatCaracteristica] PRIMARY KEY CLUSTERED 
(
	[ClaTipoInventario] ASC,
	[ClaCaracteristica] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ArtCatClasifGeneral]    Script Date: 26/08/2020 01:22:26 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ArtCatClasifGeneral](
	[ClaTipoInventario] [int] NOT NULL,
	[ClaClasifGeneral] [int] NOT NULL,
	[NomClasifGeneral] [varchar](100) NOT NULL,
	[NomClasifGeneralIngles] [varchar](100) NULL,
	[NomClasifGeneralOtroIdioma] [varchar](100) NULL,
	[BajaLogica] [int] NOT NULL,
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL,
	[NombrePcMod] [varchar](64) NOT NULL,
	[ClaUsuarioMod] [int] NOT NULL,
	[ClaTipoSolicitud] [int] NOT NULL,
	[AplicaPesoTeorico] [tinyint] NOT NULL,
	[AplicaUniProd] [tinyint] NOT NULL,
	[AplicaFactor] [tinyint] NOT NULL,
	[AplicaMarca] [tinyint] NOT NULL,
	[EsMaquinado] [int] NULL,
 CONSTRAINT [PKArtCatClasifGeneral] PRIMARY KEY CLUSTERED 
(
	[ClaTipoInventario] ASC,
	[ClaClasifGeneral] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ArtCatClasifSolicitudArt]    Script Date: 26/08/2020 01:22:26 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ArtCatClasifSolicitudArt](
	[ClaTipoInventario] [int] NOT NULL,
	[ClaClasifSolicitudArt] [int] NOT NULL,
	[NomClasifSolicitudArt] [varchar](100) NOT NULL,
	[BajaLogica] [int] NOT NULL,
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL,
	[NombrePcMod] [varchar](64) NOT NULL,
	[ClaUsuarioMod] [int] NOT NULL,
 CONSTRAINT [PKArtCatClasifSolicitudArt] PRIMARY KEY CLUSTERED 
(
	[ClaTipoInventario] ASC,
	[ClaClasifSolicitudArt] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ArtCatClaveCruda]    Script Date: 26/08/2020 01:22:26 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ArtCatClaveCruda](
	[ClaTipoInventario] [int] NOT NULL,
	[ClaClaveCruda] [int] NOT NULL,
	[NomClaveCruda] [varchar](250) NOT NULL,
	[NomClaveCrudaIngles] [varchar](250) NULL,
	[NomClaveCrudaOtroIdioma] [varchar](250) NULL,
	[BajaLogica] [int] NOT NULL,
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL,
	[NombrePcMod] [varchar](64) NOT NULL,
	[ClaUsuarioMod] [int] NOT NULL,
 CONSTRAINT [PKArtCatClaveCruda] PRIMARY KEY CLUSTERED 
(
	[ClaTipoInventario] ASC,
	[ClaClaveCruda] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ArtCatComplejidad]    Script Date: 26/08/2020 01:22:26 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ArtCatComplejidad](
	[ClaComplejidad] [int] NOT NULL,
	[NomComplejidad] [varchar](100) NOT NULL,
	[BajaLogica] [int] NOT NULL,
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL,
	[NombrePcMod] [varchar](64) NOT NULL,
	[ClaUsuarioMod] [int] NOT NULL,
 CONSTRAINT [PKArtCatComplejidad] PRIMARY KEY CLUSTERED 
(
	[ClaComplejidad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ArtCatConfiguracion]    Script Date: 26/08/2020 01:22:26 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ArtCatConfiguracion](
	[ClaConfiguracion] [int] NOT NULL,
	[NomConfiguracion] [varchar](100) NOT NULL,
	[BajaLogica] [int] NOT NULL,
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL,
	[NombrePcMod] [varchar](64) NOT NULL,
	[ClaUsuarioMod] [int] NOT NULL,
 CONSTRAINT [PKArtCatConfiguracion] PRIMARY KEY CLUSTERED 
(
	[ClaConfiguracion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ArtCatDependencia]    Script Date: 26/08/2020 01:22:26 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ArtCatDependencia](
	[ClaTipoInventario] [int] NOT NULL,
	[ClaDependencia] [int] NOT NULL,
	[NomDependencia] [varchar](250) NOT NULL,
	[ClaCaracteristica1] [int] NULL,
	[ClaCaracteristica2] [int] NULL,
	[ClaCaracteristica3] [int] NULL,
	[ClaCaracteristica4] [int] NULL,
	[ClaCaracteristica5] [int] NULL,
	[ClaCaracteristicaDep1] [int] NULL,
	[ClaCaracteristicaDep2] [int] NULL,
	[ClaCaracteristicaDep3] [int] NULL,
	[ClaCaracteristicaDep4] [int] NULL,
	[ClaCaracteristicaDep5] [int] NULL,
	[BajaLogica] [int] NOT NULL,
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL,
	[NombrePcMod] [varchar](64) NOT NULL,
	[ClaUsuarioMod] [int] NOT NULL,
 CONSTRAINT [PKArtCatDependencia] PRIMARY KEY CLUSTERED 
(
	[ClaTipoInventario] ASC,
	[ClaDependencia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ArtCatEspecificaEmpaqueAce]    Script Date: 26/08/2020 01:22:26 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ArtCatEspecificaEmpaqueAce](
	[ClaEspecificaEmpaqueAce] [int] NOT NULL,
	[ClaArticulo] [int] NOT NULL,
	[ClaTipoInventario] [int] NULL,
	[ClaTransporte] [int] NOT NULL,
	[ClaGpoEmpaque] [int] NULL,
	[ClaEmpaque] [int] NULL,
	[ClaTipoEmpaque] [int] NOT NULL,
	[BajaLogica] [tinyint] NOT NULL,
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL,
	[NombrePcMod] [varchar](64) NOT NULL,
	[ClaUsuarioMod] [int] NOT NULL,
 CONSTRAINT [PK_ArtCatEspecificaEmpaqueAce] PRIMARY KEY CLUSTERED 
(
	[ClaEspecificaEmpaqueAce] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ArtCatFamilia]    Script Date: 26/08/2020 01:22:26 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ArtCatFamilia](
	[ClaTipoInventario] [int] NOT NULL,
	[ClaFamilia] [int] NOT NULL,
	[ClaveFamilia] [int] NOT NULL,
	[NomFamilia] [varchar](100) NOT NULL,
	[NomFamiliaIngles] [varchar](100) NULL,
	[NomFamiliaOtroIdioma] [varchar](100) NULL,
	[BajaLogica] [int] NOT NULL,
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL,
	[NombrePcMod] [varchar](64) NOT NULL,
	[ClaUsuarioMod] [int] NOT NULL,
	[EsAgrupado] [int] NULL,
 CONSTRAINT [PKArtCatFamilia] PRIMARY KEY CLUSTERED 
(
	[ClaTipoInventario] ASC,
	[ClaFamilia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UQArtCatFamilia] UNIQUE NONCLUSTERED 
(
	[ClaTipoInventario] ASC,
	[ClaveFamilia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ArtCatFamilia_Respaldo17Sep2010]    Script Date: 26/08/2020 01:22:26 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ArtCatFamilia_Respaldo17Sep2010](
	[ClaTipoInventario] [int] NOT NULL,
	[ClaFamilia] [int] NOT NULL,
	[ClaveFamilia] [int] NOT NULL,
	[NomFamilia] [varchar](100) NOT NULL,
	[NomFamiliaIngles] [varchar](100) NULL,
	[NomFamiliaOtroIdioma] [varchar](100) NULL,
	[BajaLogica] [int] NOT NULL,
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL,
	[NombrePcMod] [varchar](64) NOT NULL,
	[ClaUsuarioMod] [int] NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ArtCatFamiliaAce]    Script Date: 26/08/2020 01:22:26 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ArtCatFamiliaAce](
	[ClaTipoInventario] [int] NOT NULL,
	[ClaFamilia] [int] NOT NULL,
	[NomCorto] [varchar](5) NULL,
	[EsProducidoAcerias] [tinyint] NOT NULL DEFAULT ((0)),
	[ClaveAutomatizacion] [int] NULL,
	[EsCapturaGrado] [tinyint] NOT NULL DEFAULT ((0)),
	[EsCapturaCalibre] [tinyint] NOT NULL DEFAULT ((0)),
	[EsCapturaPresentacion] [tinyint] NOT NULL DEFAULT ((0)),
	[EsCapturaDefecto] [tinyint] NOT NULL DEFAULT ((0)),
	[ClaGrupoCosteo] [int] NULL,
	[EsPt] [tinyint] NOT NULL DEFAULT ((0)),
	[EsCertificado] [tinyint] NOT NULL DEFAULT ((0)),
	[ClaUsuarioIns] [int] NOT NULL,
	[FechaIns] [datetime] NOT NULL DEFAULT (getdate()),
	[BajaLogica] [tinyint] NOT NULL DEFAULT ((0)),
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL DEFAULT (getdate()),
	[NombrePcMod] [varchar](64) NOT NULL DEFAULT (host_name()),
	[ClaUsuarioMod] [int] NOT NULL,
 CONSTRAINT [PK_ArtCatFamiliaAce] PRIMARY KEY CLUSTERED 
(
	[ClaTipoInventario] ASC,
	[ClaFamilia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ArtCatFormatoSolicitud]    Script Date: 26/08/2020 01:22:26 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ArtCatFormatoSolicitud](
	[ClaTipoInventario] [int] NOT NULL,
	[ClaFormatoSolicitud] [int] NOT NULL,
	[NomFormatoSolicitud] [varchar](100) NOT NULL,
	[NomFormatoSolicitudIngles] [varchar](100) NULL,
	[NomFormatoSolicitudOtroIdioma] [varchar](100) NULL,
	[BajaLogica] [int] NOT NULL,
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL,
	[NombrePcMod] [varchar](64) NOT NULL,
	[ClaUsuarioMod] [int] NOT NULL,
 CONSTRAINT [PKArtCatFormatoSolicitud] PRIMARY KEY CLUSTERED 
(
	[ClaTipoInventario] ASC,
	[ClaFormatoSolicitud] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ArtCatGpoCosteo]    Script Date: 26/08/2020 01:22:26 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ArtCatGpoCosteo](
	[ClaTipoInventario] [int] NOT NULL,
	[ClaGpoCosteo] [int] NOT NULL,
	[NomGpoCosteo] [varchar](100) NOT NULL,
	[BajaLogica] [int] NOT NULL,
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL,
	[NombrePcMod] [varchar](64) NOT NULL,
	[ClaUsuarioMod] [int] NOT NULL,
 CONSTRAINT [PKArtCatGpoCosteo] PRIMARY KEY CLUSTERED 
(
	[ClaTipoInventario] ASC,
	[ClaGpoCosteo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ArtCatGpoFamilia]    Script Date: 26/08/2020 01:22:26 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ArtCatGpoFamilia](
	[ClaTipoInventario] [int] NOT NULL,
	[ClaGpoFamilia] [int] NOT NULL,
	[NomGpoFamilia] [varchar](100) NOT NULL,
	[BajaLogica] [int] NOT NULL,
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL,
	[NombrePcMod] [varchar](64) NOT NULL,
	[ClaUsuarioMod] [int] NOT NULL,
 CONSTRAINT [PKArtCatGpoFamilia] PRIMARY KEY CLUSTERED 
(
	[ClaTipoInventario] ASC,
	[ClaGpoFamilia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ArtCatGpoFamiliaDet]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ArtCatGpoFamiliaDet](
	[ClaTipoInventario] [int] NOT NULL,
	[ClaGpoFamiliaDet] [int] NOT NULL,
	[NomGpoFamiliaDet] [varchar](100) NOT NULL,
	[ClaGpoFamilia] [int] NOT NULL,
	[BajaLogica] [int] NOT NULL,
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL,
	[NombrePcMod] [varchar](64) NOT NULL,
	[ClaUsuarioMod] [int] NOT NULL,
 CONSTRAINT [PKArtCatGpoFamiliaDet] PRIMARY KEY CLUSTERED 
(
	[ClaTipoInventario] ASC,
	[ClaGpoFamiliaDet] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ArtCatGpoProcesoProd]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ArtCatGpoProcesoProd](
	[ClaTipoInventario] [int] NOT NULL,
	[ClaGpoProcesoProd] [int] NOT NULL,
	[NomGpoProcesoProd] [varchar](100) NOT NULL,
	[BajaLogica] [int] NOT NULL,
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL,
	[NombrePcMod] [varchar](64) NOT NULL,
	[ClaUsuarioMod] [int] NOT NULL,
 CONSTRAINT [PKArtCatGpoProcesoProd] PRIMARY KEY CLUSTERED 
(
	[ClaTipoInventario] ASC,
	[ClaGpoProcesoProd] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ArtCatGpoUnidad]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ArtCatGpoUnidad](
	[ClaTipoInventario] [int] NOT NULL,
	[ClaGpoUnidad] [int] NOT NULL,
	[NomGpoUnidad] [varchar](100) NULL,
	[BajaLogica] [int] NOT NULL,
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL,
	[NombrePcMod] [varchar](64) NOT NULL,
	[ClaUsuarioMod] [int] NOT NULL,
 CONSTRAINT [PKArtCatGpoUnidad] PRIMARY KEY CLUSTERED 
(
	[ClaTipoInventario] ASC,
	[ClaGpoUnidad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ArtCatGrupoCaracteristica]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ArtCatGrupoCaracteristica](
	[ClaGrupoCaracteristica] [int] NOT NULL,
	[Descripcion] [varchar](150) NOT NULL,
	[BajaLogica] [tinyint] NOT NULL DEFAULT ((0)),
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL DEFAULT (getdate()),
	[ClaUsuarioMod] [int] NOT NULL DEFAULT ((0)),
	[NombrePcMod] [varchar](64) NOT NULL DEFAULT (host_name()),
 CONSTRAINT [PK_ArtCatGrupoCaracteristica] PRIMARY KEY CLUSTERED 
(
	[ClaGrupoCaracteristica] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ArtCatMarca]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ArtCatMarca](
	[ClaTipoInventario] [int] NOT NULL,
	[ClaMarca] [int] NOT NULL,
	[NomMarca] [varchar](100) NOT NULL,
	[BajaLogica] [int] NOT NULL,
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL,
	[NombrePcMod] [varchar](64) NOT NULL,
	[ClaUsuarioMod] [int] NOT NULL,
 CONSTRAINT [PKArtCatMarca] PRIMARY KEY CLUSTERED 
(
	[ClaTipoInventario] ASC,
	[ClaMarca] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ArtCatMotivoAfectacion]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ArtCatMotivoAfectacion](
	[ClaTipoInventario] [int] NOT NULL,
	[ClaMotivoAfectacion] [int] NOT NULL,
	[NomMotivoAfectacion] [varchar](100) NOT NULL,
	[ClaTipoAfectacion] [int] NOT NULL,
	[BajaLogica] [int] NOT NULL,
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL,
	[NombrePcMod] [varchar](64) NOT NULL,
	[ClaUsuarioMod] [int] NOT NULL,
	[EsReservado] [int] NULL,
 CONSTRAINT [PKArtCatMotivoAfectacion] PRIMARY KEY CLUSTERED 
(
	[ClaTipoInventario] ASC,
	[ClaMotivoAfectacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ArtCatNorma]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ArtCatNorma](
	[ClaTipoInventario] [int] NOT NULL,
	[ClaNorma] [int] NOT NULL,
	[NomNorma] [varchar](100) NOT NULL,
	[BajaLogica] [int] NOT NULL,
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL,
	[NombrePcMod] [varchar](64) NOT NULL,
	[ClaUsuarioMod] [int] NULL,
 CONSTRAINT [PKArtCatNorma] PRIMARY KEY CLUSTERED 
(
	[ClaTipoInventario] ASC,
	[ClaNorma] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ArtCatPlantilla]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ArtCatPlantilla](
	[ClaTipoInventario] [int] NOT NULL,
	[ClaPlantilla] [int] NOT NULL,
	[NomPlantilla] [varchar](250) NOT NULL,
	[NomPlantillaIngles] [varchar](250) NULL,
	[NomPlantillaOtroIdioma] [varchar](250) NULL,
	[BajaLogica] [int] NOT NULL,
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL,
	[NombrePcMod] [varchar](64) NOT NULL,
	[ClaUsuarioMod] [int] NOT NULL,
	[ClaUNSPC1] [int] NULL,
	[ClaUNSPC2] [int] NULL,
	[ClaUNSPC3] [int] NULL,
	[ClaUNSPC4] [int] NULL,
	[Prefijo] [varchar](250) NULL,
	[PrefijoIngles] [varchar](250) NULL,
	[PrefijoOtroIdioma] [varchar](250) NULL,
	[EsDisponibleUso] [int] NULL DEFAULT ((1)),
 CONSTRAINT [PKArtCatPlantilla] PRIMARY KEY CLUSTERED 
(
	[ClaTipoInventario] ASC,
	[ClaPlantilla] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ArtCatPrefijoClave]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ArtCatPrefijoClave](
	[ClaTipoInventario] [int] NOT NULL,
	[ClaPrefijoClave] [int] NOT NULL,
	[NomPrefijoClave] [varchar](100) NOT NULL,
	[Prefijo] [varchar](4) NULL,
	[Folio] [int] NULL,
	[BajaLogica] [int] NOT NULL,
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL,
	[NombrePcMod] [varchar](64) NOT NULL,
	[ClaUsuarioMod] [int] NOT NULL,
	[ClaveAutomaticaSN] [tinyint] NULL,
	[FolioInicial] [int] NULL,
	[FolioFinal] [int] NULL,
 CONSTRAINT [PKArtCatPrefijoClave] PRIMARY KEY CLUSTERED 
(
	[ClaTipoInventario] ASC,
	[ClaPrefijoClave] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ArtCatPreguntaSolicitud]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ArtCatPreguntaSolicitud](
	[ClaTipoInventario] [int] NOT NULL,
	[ClaPreguntaSolicitud] [int] NOT NULL,
	[NomPreguntaSolicitud] [varchar](100) NOT NULL,
	[NomPreguntaSolicitudIngles] [varchar](100) NULL,
	[NomPreguntaSolicitudOtroIdioma] [varchar](100) NULL,
	[ClaTipoPregunta] [int] NOT NULL,
	[ClaSeccionSolicitud] [int] NOT NULL,
	[BajaLogica] [int] NOT NULL,
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL,
	[NombrePcMod] [varchar](64) NOT NULL,
	[ClaUsuarioMod] [int] NOT NULL,
 CONSTRAINT [PKArtCatPreguntaSolicitud] PRIMARY KEY CLUSTERED 
(
	[ClaTipoInventario] ASC,
	[ClaPreguntaSolicitud] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ArtCatProteccionEmpaque]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ArtCatProteccionEmpaque](
	[ClaTipoInventario] [int] NOT NULL,
	[ClaProteccionEmpaque] [int] NOT NULL,
	[NomProteccionEmpaque] [varchar](100) NOT NULL,
	[BajaLogica] [int] NOT NULL,
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL,
	[NombrePcMod] [varchar](64) NOT NULL,
	[ClaUsuarioMod] [int] NOT NULL,
 CONSTRAINT [PKArtCatProteccionEmpaque] PRIMARY KEY CLUSTERED 
(
	[ClaTipoInventario] ASC,
	[ClaProteccionEmpaque] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ArtCatSeccionSolicitud]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ArtCatSeccionSolicitud](
	[ClaSeccionSolicitud] [int] NOT NULL,
	[NomSeccionSolicitud] [varchar](100) NOT NULL,
	[SolicitudDesarrolloSN] [tinyint] NOT NULL,
	[BajaLogica] [int] NOT NULL,
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL,
	[NombrePcMod] [varchar](64) NOT NULL,
	[ClaUsuarioMod] [int] NOT NULL,
 CONSTRAINT [PKArtCatSeccionSolicitud] PRIMARY KEY CLUSTERED 
(
	[ClaSeccionSolicitud] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ArtCatSubfamilia]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ArtCatSubfamilia](
	[ClaTipoInventario] [int] NOT NULL,
	[ClaFamilia] [int] NOT NULL,
	[ClaSubfamilia] [int] NOT NULL,
	[ClaveSubfamilia] [int] NOT NULL,
	[NomSubfamilia] [varchar](100) NOT NULL,
	[NomSubfamiliaIngles] [varchar](100) NULL,
	[NomSubfamiliaOtroIdioma] [varchar](100) NULL,
	[BajaLogica] [int] NOT NULL,
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL,
	[NombrePcMod] [varchar](64) NOT NULL,
	[ClaUsuarioMod] [int] NOT NULL,
 CONSTRAINT [PKArtCatSubfamilia] PRIMARY KEY CLUSTERED 
(
	[ClaTipoInventario] ASC,
	[ClaFamilia] ASC,
	[ClaSubfamilia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UQArtCatSubfamilia] UNIQUE NONCLUSTERED 
(
	[ClaTipoInventario] ASC,
	[ClaFamilia] ASC,
	[ClaveSubfamilia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ArtCatSubfamiliaRespaldo]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ArtCatSubfamiliaRespaldo](
	[ClaTipoInventario] [int] NOT NULL,
	[ClaFamilia] [int] NOT NULL,
	[ClaSubfamilia] [int] NOT NULL,
	[ClaveSubfamilia] [int] NOT NULL,
	[NomSubfamilia] [varchar](100) NOT NULL,
	[NomSubfamiliaIngles] [varchar](100) NULL,
	[NomSubfamiliaOtroIdioma] [varchar](100) NULL,
	[BajaLogica] [int] NOT NULL,
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL,
	[NombrePcMod] [varchar](64) NOT NULL,
	[ClaUsuarioMod] [int] NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ArtCatTipoAfectacion]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ArtCatTipoAfectacion](
	[ClaTipoAfectacion] [int] NOT NULL,
	[NomTipoAfectacion] [varchar](100) NOT NULL,
	[BajaLogica] [int] NOT NULL,
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL,
	[NombrePcMod] [varchar](64) NOT NULL,
	[ClaUsuarioMod] [int] NOT NULL,
 CONSTRAINT [PKArtCatTipoAfectacion] PRIMARY KEY CLUSTERED 
(
	[ClaTipoAfectacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ArtCatTipoArticulo]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ArtCatTipoArticulo](
	[ClaTipoInventario] [int] NOT NULL,
	[ClaTipoArticulo] [int] NOT NULL,
	[NomTipoArticulo] [varchar](100) NOT NULL,
	[BajaLogica] [int] NOT NULL,
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL,
	[NombrePcMod] [varchar](64) NOT NULL,
	[ClaUsuarioMod] [int] NOT NULL,
 CONSTRAINT [PKArtCatTipoArticulo] PRIMARY KEY CLUSTERED 
(
	[ClaTipoInventario] ASC,
	[ClaTipoArticulo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ArtCatTipoCaracteristica]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ArtCatTipoCaracteristica](
	[ClaTipoCaracteristica] [int] NOT NULL,
	[NomTipoCaracteristica] [varchar](100) NOT NULL,
	[BajaLogica] [int] NOT NULL,
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL,
	[NombrePcMod] [varchar](64) NOT NULL,
	[ClaUsuarioMod] [int] NOT NULL,
 CONSTRAINT [PKArtCatTipoCaracteristica] PRIMARY KEY CLUSTERED 
(
	[ClaTipoCaracteristica] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ArtCatTipoCodigoBar]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ArtCatTipoCodigoBar](
	[ClaTipoInventario] [int] NOT NULL,
	[ClaTipoCodigoBar] [int] NOT NULL,
	[NomTipoCodigoBar] [varchar](100) NOT NULL,
	[BajaLogica] [int] NOT NULL,
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL,
	[NombrePcMod] [varchar](64) NOT NULL,
	[ClaUsuarioMod] [int] NOT NULL,
 CONSTRAINT [PKArtCatTipoCodigoBar] PRIMARY KEY CLUSTERED 
(
	[ClaTipoInventario] ASC,
	[ClaTipoCodigoBar] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ArtCatTipoPregunta]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ArtCatTipoPregunta](
	[ClaTipoPregunta] [int] NOT NULL,
	[NomTipoPregunta] [varchar](100) NOT NULL,
	[BajaLogica] [int] NOT NULL,
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL,
	[NombrePcMod] [varchar](64) NOT NULL,
	[ClaUsuarioMod] [int] NOT NULL,
 CONSTRAINT [PKArtCatTipoPregunta] PRIMARY KEY CLUSTERED 
(
	[ClaTipoPregunta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ArtCatTipoSolicitud]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ArtCatTipoSolicitud](
	[ClaTipoSolicitud] [int] NOT NULL,
	[NomTipoSolicitud] [varchar](100) NOT NULL,
	[BajaLogica] [int] NOT NULL,
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL,
	[NombrePcMod] [varchar](64) NOT NULL,
	[ClaUsuarioMod] [int] NOT NULL,
 CONSTRAINT [PKArtCatTipoSolicitud] PRIMARY KEY CLUSTERED 
(
	[ClaTipoSolicitud] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ArtCatUnidad]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ArtCatUnidad](
	[ClaTipoInventario] [int] NOT NULL,
	[ClaUnidad] [int] NOT NULL,
	[NomUnidad] [varchar](100) NOT NULL,
	[NomCortoUnidad] [varchar](20) NOT NULL,
	[BajaLogica] [int] NOT NULL,
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL,
	[NombrePcMod] [varchar](64) NOT NULL,
	[ClaUsuarioMod] [int] NOT NULL,
	[ClaGpoUnidad] [int] NOT NULL DEFAULT ((1)),
	[EsUniBase] [int] NOT NULL DEFAULT ((0)),
	[EsUniProd] [int] NOT NULL DEFAULT ((0)),
	[EsUniCaract] [int] NOT NULL DEFAULT ((0)),
	[EsUniConversion] [int] NULL,
	[NomCortoUnidadIngles] [varchar](20) NULL,
	[NomCortoUnidadOtroIdioma] [varchar](20) NULL,
 CONSTRAINT [PKArtCatUnidad] PRIMARY KEY CLUSTERED 
(
	[ClaTipoInventario] ASC,
	[ClaUnidad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ArtCatUNSPC1]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ArtCatUNSPC1](
	[ClaUNSPC1] [int] NOT NULL,
	[NomUNSPC1] [varchar](250) NOT NULL,
	[NomUNSPC1Ingles] [varchar](250) NULL,
	[NomUNSPC1OtroIdioma] [varchar](250) NULL,
	[BajaLogica] [int] NOT NULL,
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL,
	[NombrePcMod] [varchar](64) NOT NULL,
	[ClaUsuarioMod] [int] NOT NULL,
	[Codigo] [int] NOT NULL,
 CONSTRAINT [PKArtCatUNSPC1] PRIMARY KEY CLUSTERED 
(
	[ClaUNSPC1] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ArtCatUNSPC2]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ArtCatUNSPC2](
	[ClaUNSPC1] [int] NOT NULL,
	[ClaUNSPC2] [int] NOT NULL,
	[NomUNSPC2] [varchar](250) NOT NULL,
	[NomUNSPC2Ingles] [varchar](250) NULL,
	[NomUNSPC2OtroIdioma] [varchar](250) NULL,
	[BajaLogica] [int] NOT NULL,
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL,
	[NombrePcMod] [varchar](64) NOT NULL,
	[ClaUsuarioMod] [int] NOT NULL,
	[Codigo] [int] NOT NULL,
 CONSTRAINT [PKArtCatUNSPC2] PRIMARY KEY CLUSTERED 
(
	[ClaUNSPC1] ASC,
	[ClaUNSPC2] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ArtCatUNSPC3]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ArtCatUNSPC3](
	[ClaUNSPC1] [int] NOT NULL,
	[ClaUNSPC2] [int] NOT NULL,
	[ClaUNSPC3] [int] NOT NULL,
	[NomUNSPC3] [varchar](250) NOT NULL,
	[NomUNSPC3Ingles] [varchar](250) NULL,
	[NomUNSPC3OtroIdioma] [varchar](250) NULL,
	[BajaLogica] [int] NOT NULL,
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL,
	[NombrePcMod] [varchar](64) NOT NULL,
	[ClaUsuarioMod] [int] NOT NULL,
	[Codigo] [int] NOT NULL,
 CONSTRAINT [PKArtCatUNSPC3] PRIMARY KEY CLUSTERED 
(
	[ClaUNSPC1] ASC,
	[ClaUNSPC2] ASC,
	[ClaUNSPC3] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ArtCatUNSPC4]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ArtCatUNSPC4](
	[ClaUNSPC1] [int] NOT NULL,
	[ClaUNSPC2] [int] NOT NULL,
	[ClaUNSPC3] [int] NOT NULL,
	[ClaUNSPC4] [int] NOT NULL,
	[NomUNSPC4] [varchar](250) NOT NULL,
	[NomUNSPC4Ingles] [varchar](250) NULL,
	[NomUNSPC4OtroIdioma] [varchar](250) NULL,
	[BajaLogica] [int] NOT NULL,
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL,
	[NombrePcMod] [varchar](64) NOT NULL,
	[ClaUsuarioMod] [int] NOT NULL,
	[Codigo] [int] NOT NULL,
 CONSTRAINT [PKArtCatUNSPC4] PRIMARY KEY CLUSTERED 
(
	[ClaUNSPC1] ASC,
	[ClaUNSPC2] ASC,
	[ClaUNSPC3] ASC,
	[ClaUNSPC4] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ArtCatValor]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ArtCatValor](
	[ClaTipoInventario] [int] NOT NULL,
	[ClaCaracteristica] [int] NOT NULL,
	[ClaValor] [int] NOT NULL,
	[NomValor] [varchar](250) NOT NULL,
	[NumValor] [numeric](22, 7) NULL,
	[NumValor2] [numeric](22, 7) NULL,
	[ClaUnidad] [int] NULL,
	[OrdenConsulta] [int] NULL,
	[EtiquetaDesc] [varchar](250) NOT NULL,
	[EtiquetaDescIngles] [varchar](250) NULL,
	[EtiquetaDescOtroIdioma] [varchar](250) NULL,
	[BajaLogica] [int] NOT NULL,
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL,
	[NombrePcMod] [varchar](64) NOT NULL,
	[ClaUsuarioMod] [int] NOT NULL,
	[RutaImagen] [varchar](100) NULL,
	[EtiquetaCertif] [varchar](250) NULL,
 CONSTRAINT [PKArtCatValor] PRIMARY KEY CLUSTERED 
(
	[ClaTipoInventario] ASC,
	[ClaCaracteristica] ASC,
	[ClaValor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ArtCfgPermisoMostrarControl]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ArtCfgPermisoMostrarControl](
	[ClaveControl] [int] NOT NULL,
	[ClaveUbicacion] [int] NOT NULL,
	[NombreControl] [varchar](30) NULL,
	[BajaLogica] [int] NULL,
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL,
	[ClaUsuarioMod] [int] NULL,
	[NombrePcMod] [varchar](64) NULL,
 CONSTRAINT [PKArtCfgPermisosMostrarControl] PRIMARY KEY CLUSTERED 
(
	[ClaveControl] ASC,
	[ClaveUbicacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ArtRelArticuloArchivo]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ArtRelArticuloArchivo](
	[ClaTipoInventario] [int] NOT NULL,
	[ClaArticulo] [int] NOT NULL,
	[ClaArchivo] [int] NOT NULL,
	[RutaArchivo] [varchar](250) NOT NULL,
	[Comentarios] [varchar](250) NOT NULL,
	[FechaUltimaMod] [datetime] NOT NULL,
	[NombrePcMod] [varchar](64) NOT NULL,
	[ClaUsuarioMod] [int] NOT NULL,
 CONSTRAINT [PKArtRelArticuloArchivo] PRIMARY KEY CLUSTERED 
(
	[ClaTipoInventario] ASC,
	[ClaArticulo] ASC,
	[ClaArchivo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ArtRelArticuloCarValor]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ArtRelArticuloCarValor](
	[ClaTipoInventario] [int] NOT NULL,
	[ClaArticulo] [int] NOT NULL,
	[ClaCaracteristica] [int] NOT NULL,
	[ClaValor] [int] NOT NULL,
	[FechaUltimaMod] [datetime] NOT NULL,
	[NombrePcMod] [varchar](64) NOT NULL,
	[ClaUsuarioMod] [int] NOT NULL,
	[BajaLogica] [int] NOT NULL,
	[FechaBajaLogica] [datetime] NULL,
	[Certificado] [int] NULL,
 CONSTRAINT [PKArtRelArticuloCarValor] PRIMARY KEY CLUSTERED 
(
	[ClaTipoInventario] ASC,
	[ClaArticulo] ASC,
	[ClaCaracteristica] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ArtRelArticuloCarValorUb]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ArtRelArticuloCarValorUb](
	[ClaTipoInventario] [int] NOT NULL,
	[ClaArticulo] [int] NOT NULL,
	[ClaUbicacion] [int] NOT NULL,
	[ClaCaracteristica] [int] NOT NULL,
	[ClaValor] [int] NOT NULL,
	[FechaUltimaMod] [datetime] NOT NULL,
	[NombrePcMod] [varchar](64) NOT NULL,
	[ClaUsuarioMod] [int] NOT NULL,
 CONSTRAINT [PKArtRelArticuloCarValorUb] PRIMARY KEY CLUSTERED 
(
	[ClaTipoInventario] ASC,
	[ClaArticulo] ASC,
	[ClaUbicacion] ASC,
	[ClaCaracteristica] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ArtRelArticuloCodigoBar]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ArtRelArticuloCodigoBar](
	[ClaTipoInventario] [int] NOT NULL,
	[ClaArticulo] [int] NOT NULL,
	[ClaCodigoBar] [int] NOT NULL,
	[ClaTipoEmpaque] [int] NULL,
	[ClaMaterial] [int] NULL,
	[ClaTipoCodigoBar] [int] NOT NULL,
	[CodigoBar] [varchar](100) NOT NULL,
	[FechaUltimaMod] [datetime] NOT NULL,
	[NombrePcMod] [varchar](64) NOT NULL,
	[ClaUsuarioMod] [int] NOT NULL,
	[BajaLogica] [int] NOT NULL,
	[FechaBajaLogica] [datetime] NULL,
 CONSTRAINT [PKArtRelArticuloCodigoBar] PRIMARY KEY CLUSTERED 
(
	[ClaTipoInventario] ASC,
	[ClaArticulo] ASC,
	[ClaCodigoBar] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ArtRelArticuloEquivalente]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ArtRelArticuloEquivalente](
	[ClaTipoInventario1] [int] NOT NULL,
	[ClaArticulo1] [int] NOT NULL,
	[ClaTipoInventario2] [int] NOT NULL,
	[ClaArticulo2] [int] NOT NULL,
	[FactorConversion1] [numeric](22, 7) NOT NULL,
	[FactorConversion2] [numeric](22, 7) NOT NULL,
	[BajaLogica] [int] NOT NULL,
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL,
	[NombrePcMod] [varchar](64) NOT NULL,
	[ClaUsuarioMod] [int] NOT NULL,
 CONSTRAINT [PKArtRelArticuloEquivalente] PRIMARY KEY CLUSTERED 
(
	[ClaTipoInventario1] ASC,
	[ClaArticulo1] ASC,
	[ClaTipoInventario2] ASC,
	[ClaArticulo2] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ArtRelArticuloPais]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ArtRelArticuloPais](
	[ClaTipoInventario] [int] NOT NULL,
	[ClaArticulo] [int] NOT NULL,
	[ClaPais] [int] NOT NULL,
	[BajaLogica] [int] NOT NULL,
	[FechaBajaLogica] [datetime] NULL,
	[FechaIns] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL,
	[NombrePcMod] [varchar](64) NOT NULL,
	[ClaUsuarioMod] [int] NOT NULL,
 CONSTRAINT [PKArtRelArticuloPais] PRIMARY KEY CLUSTERED 
(
	[ClaTipoInventario] ASC,
	[ClaArticulo] ASC,
	[ClaPais] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ArtRelConfiguracionTipoInv]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ArtRelConfiguracionTipoInv](
	[ClaConfiguracion] [int] NOT NULL,
	[ClaTipoInventario] [int] NOT NULL,
	[nValor1] [numeric](22, 7) NULL,
	[nValor2] [numeric](22, 7) NULL,
	[sValor1] [varchar](100) NULL,
	[sValor2] [varchar](100) NULL,
	[dValor1] [datetime] NULL,
	[dValor2] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL,
	[NombrePcMod] [varchar](64) NOT NULL,
	[ClaUsuarioMod] [int] NOT NULL,
 CONSTRAINT [PKArtRelConfiguracionTipoInv] PRIMARY KEY CLUSTERED 
(
	[ClaConfiguracion] ASC,
	[ClaTipoInventario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ArtRelDependenciaPlantilla]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ArtRelDependenciaPlantilla](
	[ClaTipoInventario] [int] NOT NULL,
	[ClaDependencia] [int] NOT NULL,
	[ClaPlantilla] [int] NOT NULL,
	[FechaUltimaMod] [datetime] NOT NULL,
	[NombrePcMod] [varchar](64) NOT NULL,
	[ClaUsuarioMod] [int] NOT NULL,
 CONSTRAINT [PKArtRelDependenciaPlantilla] PRIMARY KEY CLUSTERED 
(
	[ClaTipoInventario] ASC,
	[ClaDependencia] ASC,
	[ClaPlantilla] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ArtRelDependenciaValor]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ArtRelDependenciaValor](
	[IdRelValorDependencia] [int] NOT NULL,
	[ClaTipoInventario] [int] NOT NULL,
	[ClaDependencia] [int] NOT NULL,
	[ClaCaracteristica1] [int] NULL,
	[ClaValor1] [int] NULL,
	[ClaCaracteristica2] [int] NULL,
	[ClaValor2] [int] NULL,
	[ClaCaracteristica3] [int] NULL,
	[ClaValor3] [int] NULL,
	[ClaCaracteristica4] [int] NULL,
	[ClaValor4] [int] NULL,
	[ClaCaracteristica5] [int] NULL,
	[ClaValor5] [int] NULL,
	[ClaCaracteristicaDep1] [int] NULL,
	[ClaValorDep1] [int] NULL,
	[ClaCaracteristicaDep2] [int] NULL,
	[ClaValorDep2] [int] NULL,
	[ClaCaracteristicaDep3] [int] NULL,
	[ClaValorDep3] [int] NULL,
	[ClaCaracteristicaDep4] [int] NULL,
	[ClaValorDep4] [int] NULL,
	[ClaCaracteristicaDep5] [int] NULL,
	[ClaValorDep5] [int] NULL,
	[FechaUltimaMod] [datetime] NOT NULL,
	[NombrePcMod] [varchar](64) NOT NULL,
	[ClaUsuarioMod] [int] NOT NULL,
 CONSTRAINT [PKArtRelDependenciaValor] PRIMARY KEY CLUSTERED 
(
	[IdRelValorDependencia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ArtRelEstatusDiasPlazo]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ArtRelEstatusDiasPlazo](
	[ClaTipoInventario] [int] NOT NULL,
	[ClaClasifSolicitudArt] [int] NOT NULL,
	[ClaEstatusSolicitud] [int] NOT NULL,
	[DiasPlazo] [int] NULL,
	[FechaUltimaMod] [datetime] NOT NULL,
	[NombrePcMod] [varchar](64) NOT NULL,
	[ClaUsuarioMod] [int] NOT NULL,
 CONSTRAINT [PKArtRelEstatusDiasPlazo] PRIMARY KEY CLUSTERED 
(
	[ClaTipoInventario] ASC,
	[ClaClasifSolicitudArt] ASC,
	[ClaEstatusSolicitud] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ArtRelEstatusSolicitudPerfil]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ArtRelEstatusSolicitudPerfil](
	[ClaTipoInventario] [int] NOT NULL,
	[ClaEstatusSolicitud] [int] NOT NULL,
	[ClaPerfilUsuario] [int] NOT NULL,
	[FechaUltimaMod] [datetime] NOT NULL,
	[NombrePcMod] [varchar](64) NOT NULL,
	[ClaUsuarioMod] [int] NOT NULL,
 CONSTRAINT [PKArtRelEstatusPerfil] PRIMARY KEY CLUSTERED 
(
	[ClaTipoInventario] ASC,
	[ClaEstatusSolicitud] ASC,
	[ClaPerfilUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ArtRelFamiliaFormato]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ArtRelFamiliaFormato](
	[ClaTipoInventario] [int] NOT NULL,
	[ClaFamilia] [int] NOT NULL,
	[ClaFormatoSolicitud] [int] NOT NULL,
	[FechaUltimaMod] [datetime] NOT NULL,
	[NombrePcMod] [varchar](64) NOT NULL,
	[ClaUsuarioMod] [int] NOT NULL,
 CONSTRAINT [PKArtRelFamiliaFormato] PRIMARY KEY CLUSTERED 
(
	[ClaTipoInventario] ASC,
	[ClaFamilia] ASC,
	[ClaFormatoSolicitud] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ArtRelFamiliaUbicacion]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ArtRelFamiliaUbicacion](
	[IdRelFamiliaUbicacion] [int] NOT NULL,
	[ClaTipoInventario] [int] NOT NULL,
	[ClaUbicacion] [int] NOT NULL,
	[ClaFamilia] [int] NULL,
	[ClaPrefijoClave] [int] NULL,
	[BajaLogica] [int] NOT NULL,
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL,
	[NombrePcMod] [varchar](64) NOT NULL,
	[ClaUsuarioMod] [int] NOT NULL,
 CONSTRAINT [PKArtRelFamiliaUbicacion] PRIMARY KEY CLUSTERED 
(
	[IdRelFamiliaUbicacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ArtRelFamiliaUsuario]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ArtRelFamiliaUsuario](
	[ClaTipoInventario] [int] NOT NULL,
	[ClaFamilia] [int] NOT NULL,
	[ClaUsuario] [int] NOT NULL,
	[Inserta] [tinyint] NOT NULL,
	[Modifica] [tinyint] NOT NULL,
	[Autoriza] [tinyint] NOT NULL,
	[BajaLogica] [int] NOT NULL,
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL,
	[NombrePcMod] [varchar](64) NOT NULL,
	[ClaUsuarioMod] [int] NOT NULL,
	[ClaUbicacion] [int] NOT NULL,
	[Revisa] [int] NULL DEFAULT ((0)),
 CONSTRAINT [PKArtRelFamiliaUsuario] PRIMARY KEY CLUSTERED 
(
	[ClaTipoInventario] ASC,
	[ClaFamilia] ASC,
	[ClaUsuario] ASC,
	[ClaUbicacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ArtRelFormatoPregunta]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ArtRelFormatoPregunta](
	[ClaTipoInventario] [int] NOT NULL,
	[ClaFormatoSolicitud] [int] NOT NULL,
	[ClaPreguntaSolicitud] [int] NOT NULL,
	[Orden] [int] NULL,
	[FechaUltimaMod] [datetime] NOT NULL,
	[NombrePcMod] [varchar](64) NOT NULL,
	[ClaUsuarioMod] [int] NOT NULL,
 CONSTRAINT [PKArtRelFormatoPregunta] PRIMARY KEY CLUSTERED 
(
	[ClaTipoInventario] ASC,
	[ClaFormatoSolicitud] ASC,
	[ClaPreguntaSolicitud] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ArtRelFormatoSeccion]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ArtRelFormatoSeccion](
	[ClaTipoInventario] [int] NOT NULL,
	[ClaFormatoSolicitud] [int] NOT NULL,
	[ClaSeccionSolicitud] [int] NOT NULL,
	[Orden] [int] NULL,
	[FechaUltimaMod] [datetime] NOT NULL,
	[NombrePcMod] [varchar](64) NOT NULL,
	[ClaUsuarioMod] [int] NOT NULL,
 CONSTRAINT [PKArtRelFormatoSeccion] PRIMARY KEY CLUSTERED 
(
	[ClaTipoInventario] ASC,
	[ClaFormatoSolicitud] ASC,
	[ClaSeccionSolicitud] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ArtRelGpoFamiliaDetSubfamilia]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ArtRelGpoFamiliaDetSubfamilia](
	[IdRelGpoFamiliaDetSubfamilia] [int] IDENTITY(1,1) NOT NULL,
	[ClaTipoInventario] [int] NOT NULL,
	[ClaGpoFamilia] [int] NOT NULL,
	[ClaGpoFamiliaDet] [int] NULL,
	[ClaFamilia] [int] NOT NULL,
	[ClaSubfamilia] [int] NULL,
	[BajaLogica] [int] NOT NULL,
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL,
	[NombrePcMod] [varchar](64) NOT NULL,
	[ClaUsuarioMod] [int] NOT NULL,
 CONSTRAINT [PKArtRelGpoFamiliaDetSubfamilia] PRIMARY KEY CLUSTERED 
(
	[IdRelGpoFamiliaDetSubfamilia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UQArtRelGpoFamiliaDetSubfamilia] UNIQUE NONCLUSTERED 
(
	[ClaTipoInventario] ASC,
	[ClaGpoFamilia] ASC,
	[ClaGpoFamiliaDet] ASC,
	[ClaFamilia] ASC,
	[ClaSubfamilia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ArtRelOrgVtaResp]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ArtRelOrgVtaResp](
	[IdRelOrgVtaResp] [int] NOT NULL,
	[ClaTipoInventario] [int] NOT NULL,
	[ClaOrganizacionVentas] [int] NULL,
	[ClaUsuarioResponsable] [int] NOT NULL,
	[FechaUltimaMod] [datetime] NOT NULL,
	[NombrePcMod] [varchar](64) NOT NULL,
	[ClaUsuarioMod] [int] NOT NULL,
 CONSTRAINT [PKArtRelOrgVtaResp] PRIMARY KEY CLUSTERED 
(
	[IdRelOrgVtaResp] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ArtRelPlantillaCar]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ArtRelPlantillaCar](
	[ClaTipoInventario] [int] NOT NULL,
	[ClaPlantilla] [int] NOT NULL,
	[ClaCaracteristica] [int] NOT NULL,
	[EsPrincipal] [tinyint] NOT NULL,
	[EsRequerida] [tinyint] NOT NULL,
	[DefineClaveCrudaSN] [tinyint] NOT NULL,
	[OrdenDesc] [int] NULL,
	[OrdenDescIngles] [int] NULL,
	[OrdenDescOtroIdioma] [int] NULL,
	[OrdenCaptura] [int] NULL,
	[Separador] [varchar](5) NULL,
	[Sufijo] [varchar](45) NULL,
	[FechaUltimaMod] [datetime] NOT NULL,
	[NombrePcMod] [varchar](64) NOT NULL,
	[ClaUsuarioMod] [int] NOT NULL,
	[BajaLogica] [int] NOT NULL CONSTRAINT [DF_ArtRelPlantillaCar_BajaLogica]  DEFAULT ((0)),
	[FechaBajaLogica] [datetime] NULL,
	[Prefijo] [varchar](45) NULL,
	[PrefijoIdioma2] [varchar](45) NULL,
	[PrefijoIdioma3] [varchar](45) NULL,
	[SufijoIdioma2] [varchar](45) NULL,
	[SufijoIdioma3] [varchar](45) NULL,
 CONSTRAINT [PKArtRelPlantillaCar] PRIMARY KEY CLUSTERED 
(
	[ClaTipoInventario] ASC,
	[ClaPlantilla] ASC,
	[ClaCaracteristica] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ArtRelPlantillaCarBit]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ArtRelPlantillaCarBit](
	[ClaTipoInventario] [int] NULL,
	[ClaveFamilia] [int] NULL,
	[ClaCaracteristica] [int] NULL,
	[OrdenCaptura] [int] NULL,
	[OrdenDesc] [int] NULL,
	[Baja] [int] NULL,
	[FechaUltimaMod] [datetime] NULL,
	[Comentarios] [varchar](4000) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ArtRelPlantillaCarValor]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ArtRelPlantillaCarValor](
	[ClaTipoInventario] [int] NOT NULL,
	[ClaPlantilla] [int] NOT NULL,
	[ClaCaracteristica] [int] NOT NULL,
	[ClaValor] [int] NOT NULL,
	[FechaUltimaMod] [datetime] NOT NULL,
	[NombrePcMod] [varchar](64) NOT NULL,
	[ClaUsuarioMod] [int] NOT NULL,
	[BajaLogica] [int] NOT NULL,
	[FechaBajaLogica] [datetime] NULL,
 CONSTRAINT [PKArtRelPlantillaCarValor] PRIMARY KEY CLUSTERED 
(
	[ClaTipoInventario] ASC,
	[ClaPlantilla] ASC,
	[ClaCaracteristica] ASC,
	[ClaValor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ArtRelPlantillaFamSubfam]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ArtRelPlantillaFamSubfam](
	[IdPlantillaFamSubfam] [int] NOT NULL,
	[ClaTipoInventario] [int] NOT NULL,
	[ClaPlantilla] [int] NOT NULL,
	[ClaFamilia] [int] NOT NULL,
	[ClaSubfamilia] [int] NULL,
	[BajaLogica] [int] NOT NULL,
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL,
	[NombrePcMod] [varchar](64) NOT NULL,
	[ClaUsuarioMod] [int] NOT NULL,
	[ClaUnidadBase] [int] NULL,
	[EsPlantillaDescripcion] [int] NULL,
 CONSTRAINT [PKArtRelPlantillaFamSubfam] PRIMARY KEY CLUSTERED 
(
	[IdPlantillaFamSubfam] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UQArtRelPlantillaFamSubfam] UNIQUE NONCLUSTERED 
(
	[ClaTipoInventario] ASC,
	[ClaPlantilla] ASC,
	[ClaFamilia] ASC,
	[ClaSubfamilia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ArtRelSeccionPerfil]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ArtRelSeccionPerfil](
	[ClaTipoInventario] [int] NOT NULL,
	[ClaSeccionSolicitud] [int] NOT NULL,
	[ClaPerfilUsuario] [int] NOT NULL,
	[FechaUltimaMod] [datetime] NOT NULL,
	[NombrePcMod] [varchar](64) NOT NULL,
	[ClaUsuarioMod] [int] NOT NULL,
 CONSTRAINT [PKArtRelSeccionPerfil] PRIMARY KEY CLUSTERED 
(
	[ClaTipoInventario] ASC,
	[ClaSeccionSolicitud] ASC,
	[ClaPerfilUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ArtRelTipoMaterialCatProducto]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ArtRelTipoMaterialCatProducto](
	[ClaArticulo] [int] NOT NULL,
	[ClaTipoMaterial] [int] NOT NULL,
	[ClaUsuarioMod] [int] NOT NULL,
	[FechaUltimaMod] [datetime] NOT NULL DEFAULT (getdate()),
	[NombrePcMod] [varchar](64) NOT NULL DEFAULT (host_name()),
	[BajaLogica] [int] NOT NULL CONSTRAINT [DF_ArtRelTipoMaterialCatProducto_BajaLogica]  DEFAULT ((0)),
	[FechaBajaLogica] [datetime] NULL,
 CONSTRAINT [PK_FfccRelArticuloTipoMaterial] PRIMARY KEY CLUSTERED 
(
	[ClaArticulo] ASC,
	[ClaTipoMaterial] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ArtRelTipoSolicitudPerfil]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ArtRelTipoSolicitudPerfil](
	[ClaTipoInventario] [int] NOT NULL,
	[ClaTipoSolicitud] [int] NOT NULL,
	[ClaPerfilUsuario] [int] NOT NULL,
	[FechaUltimaMod] [datetime] NOT NULL,
	[NombrePcMod] [varchar](64) NOT NULL,
	[ClaUsuarioMod] [int] NOT NULL,
 CONSTRAINT [PKArtRelTipoSolicitudPerfil] PRIMARY KEY CLUSTERED 
(
	[ClaTipoSolicitud] ASC,
	[ClaPerfilUsuario] ASC,
	[ClaTipoInventario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ArtRelUbicacionResp]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ArtRelUbicacionResp](
	[IdRelUbicacionResp] [int] NOT NULL,
	[ClaTipoInventario] [int] NOT NULL,
	[ClaUbicacion] [int] NULL,
	[ClaUsuarioResponsable] [int] NOT NULL,
	[FechaUltimaMod] [datetime] NOT NULL,
	[NombrePcMod] [varchar](64) NOT NULL,
	[ClaUsuarioMod] [int] NOT NULL,
 CONSTRAINT [PKArtRelUbicacionResp] PRIMARY KEY CLUSTERED 
(
	[IdRelUbicacionResp] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ArtRelUnidadConversion]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ArtRelUnidadConversion](
	[ClaTipoInventario] [int] NOT NULL,
	[ClaUnidad1] [int] NOT NULL,
	[ClaUnidad2] [int] NOT NULL,
	[FactorConversion1] [numeric](22, 7) NOT NULL,
	[FactorConversion2] [numeric](22, 7) NOT NULL,
	[BajaLogica] [int] NOT NULL,
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL,
	[NombrePcMod] [varchar](64) NOT NULL,
	[ClaUsuarioMod] [int] NOT NULL,
 CONSTRAINT [PKArtRelUnidadConversion] PRIMARY KEY CLUSTERED 
(
	[ClaTipoInventario] ASC,
	[ClaUnidad1] ASC,
	[ClaUnidad2] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AviCatDestinatarioPreferencia]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AviCatDestinatarioPreferencia](
	[ClaUsuario] [int] NOT NULL,
	[ClaSistema] [int] NOT NULL,
	[ClaTipoPreferencia] [int] NOT NULL,
	[ClaTipoHorario] [int] NULL,
	[BajaLogica] [int] NOT NULL,
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL,
	[NombrePcMod] [varchar](64) NOT NULL,
 CONSTRAINT [PK_AviCatDestinatarioPreferencia] PRIMARY KEY CLUSTERED 
(
	[ClaSistema] ASC,
	[ClaUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AviCatSeguridad]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AviCatSeguridad](
	[ClaSistema] [int] NOT NULL,
	[ClaTipoAviso] [int] NOT NULL,
	[ClaUsuario] [int] NOT NULL,
	[BajaLogica] [int] NOT NULL,
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL,
	[NombrePcMod] [varchar](64) NOT NULL,
 CONSTRAINT [PK_AviCatSeguridad] PRIMARY KEY CLUSTERED 
(
	[ClaSistema] ASC,
	[ClaTipoAviso] ASC,
	[ClaUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AviCatTipoAviso]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AviCatTipoAviso](
	[ClaSistema] [int] NOT NULL,
	[ClaTipoAviso] [int] NOT NULL,
	[NombreTipoAviso] [varchar](255) NULL,
	[StoredProcedure] [varchar](80) NULL,
	[Asunto] [varchar](255) NULL,
	[TextoDefault] [varchar](5000) NULL,
	[BajaLogica] [int] NOT NULL DEFAULT ((0)),
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL DEFAULT (getdate()),
	[NombrePcMod] [varchar](64) NOT NULL DEFAULT (host_name()),
 CONSTRAINT [PK_AviCatTipoAviso] PRIMARY KEY CLUSTERED 
(
	[ClaSistema] ASC,
	[ClaTipoAviso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AviCatTipoAvisoDestinatario]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AviCatTipoAvisoDestinatario](
	[ClaSistema] [int] NOT NULL,
	[ClaTipoAviso] [int] NOT NULL,
	[ClaUbicacion] [int] NOT NULL,
	[ClaUsuario] [int] NOT NULL,
	[EsConCopia] [int] NULL,
	[BajaLogica] [int] NOT NULL DEFAULT ((0)),
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL DEFAULT (getdate()),
	[NombrePcMod] [varchar](64) NOT NULL DEFAULT (host_name()),
	[ClaUsuarioIns] [int] NULL,
	[FechaIns] [datetime] NULL,
	[ClaUsuarioMod] [int] NULL,
 CONSTRAINT [PK_AviCatTipoAvisoDestinatario] PRIMARY KEY CLUSTERED 
(
	[ClaUbicacion] ASC,
	[ClaSistema] ASC,
	[ClaTipoAviso] ASC,
	[ClaUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AviCatTipoHorario]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AviCatTipoHorario](
	[ClaTipoHorario] [int] NOT NULL,
	[NombreTipoHorario] [varchar](50) NULL,
	[ClaHorario] [int] NULL,
	[BajaLogica] [int] NOT NULL,
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL,
	[NombrePcMod] [varchar](64) NOT NULL,
 CONSTRAINT [PK_AviCatTipoHorario] PRIMARY KEY CLUSTERED 
(
	[ClaTipoHorario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[AviCatTipoPreferencia]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[AviCatTipoPreferencia](
	[ClaTipoPreferencia] [int] NOT NULL,
	[NombreTipoPreferencia] [varchar](150) NULL,
	[BajaLogica] [int] NOT NULL DEFAULT ((0)),
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL DEFAULT (getdate()),
	[NombrePcMod] [varchar](64) NOT NULL DEFAULT (host_name()),
 CONSTRAINT [PK_AviCatTipoPreferencia] PRIMARY KEY CLUSTERED 
(
	[ClaTipoPreferencia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[BKP_FP3241_ExpCatIncoterm]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[BKP_FP3241_ExpCatIncoterm](
	[ClaIncoterm] [int] NOT NULL,
	[NombreIncoterm] [varchar](50) NULL,
	[DescIncoterm] [varchar](200) NULL,
	[BajaLogica] [tinyint] NULL,
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL,
	[ClaUsuarioMod] [int] NULL,
	[NombrePcMod] [varchar](64) NULL,
	[ContieneEmbarque] [tinyint] NULL,
	[ContieneTrafico] [tinyint] NULL,
	[ContienePedido] [tinyint] NULL,
	[EnviarAgrupado] [tinyint] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[bkplarManCatArea]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[bkplarManCatArea](
	[ClaArea] [int] NOT NULL,
	[ClaveArea] [int] NOT NULL,
	[NombreArea] [varchar](100) NOT NULL,
	[ClaDepartamento] [int] NULL,
	[AcumulaSN] [tinyint] NULL,
	[ServicioSN] [tinyint] NULL,
	[BajaLogica] [int] NOT NULL,
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL,
	[NombrePcMod] [varchar](64) NOT NULL,
	[ClaUsuarioMod] [int] NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[bkplarManCatDepartamento]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[bkplarManCatDepartamento](
	[ClaDepartamento] [int] NOT NULL,
	[ClaveDepartamento] [int] NOT NULL,
	[NombreDepartamento] [varchar](100) NOT NULL,
	[ClaTipoDepartamento] [int] NOT NULL,
	[BajaLogica] [int] NOT NULL,
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL,
	[NombrePcMod] [varchar](64) NOT NULL,
	[ClaUsuarioMod] [int] NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CalmCatComprador]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CalmCatComprador](
	[ClaUbicacion] [int] NOT NULL,
	[ClaComprador] [int] NOT NULL,
	[NombreComprador] [char](30) NULL,
	[BajaLogica] [int] NOT NULL CONSTRAINT [DF_CalmCatComprador_BajaLogica]  DEFAULT ((0)),
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL CONSTRAINT [DF_CalmCatComprador_FechaUltimaMod]  DEFAULT (getdate()),
	[FechaIns] [datetime] NULL CONSTRAINT [DF_CalmCatComprador_FechaIns]  DEFAULT (getdate()),
 CONSTRAINT [PK_CalmCatComprador] PRIMARY KEY CLUSTERED 
(
	[ClaUbicacion] ASC,
	[ClaComprador] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CalmCatProveedor]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CalmCatProveedor](
	[ClaUbicacion] [int] NOT NULL,
	[ClaTipoProveedor] [int] NOT NULL,
	[ClaProveedor] [int] NOT NULL,
	[RazonSocial] [varchar](60) NULL,
	[Cup] [int] NULL,
	[ClaPais] [int] NULL,
	[BajaLogica] [int] NOT NULL CONSTRAINT [DF_CalmCatProveedor_BajaLogica]  DEFAULT ((0)),
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL CONSTRAINT [DF_CalmCatProveedor_FechaUltimaMod]  DEFAULT (getdate()),
	[FechaIns] [datetime] NULL CONSTRAINT [DF_CalmCatProveedor_FechaIns]  DEFAULT (getdate()),
	[Contacto] [varchar](100) NULL,
	[Fax] [varchar](20) NULL,
	[Email] [varchar](250) NULL,
	[RazonSocialFiscal] [varchar](60) NULL,
	[AduanaSeccion] [varchar](50) NULL,
	[NomAduana] [varchar](50) NULL,
	[Patente] [int] NULL,
	[ClaEstado] [int] NULL,
	[ClaMunicipio] [int] NULL,
	[ClaIva] [int] NULL,
 CONSTRAINT [PK_CalmCatProveedor] PRIMARY KEY CLUSTERED 
(
	[ClaUbicacion] ASC,
	[ClaTipoProveedor] ASC,
	[ClaProveedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CalmRelAreaMan]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CalmRelAreaMan](
	[ClaEmpresa] [int] NULL,
	[ClaUbicacion] [int] NULL,
	[ClaDepartamentoCalm] [int] NULL,
	[ClaAreaCalm] [int] NULL,
	[ClaAreaMan] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CalmRelDeptoMan]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CalmRelDeptoMan](
	[ClaEmpresa] [int] NULL,
	[ClaUbicacion] [int] NULL,
	[ClaDepartamentoCalm] [int] NULL,
	[ClaDepartamentoMan] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CalmZCatUnidadCalm]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CalmZCatUnidadCalm](
	[ClaUnidadCalm] [int] NOT NULL,
	[ClaUbicacion] [int] NOT NULL,
	[NombreUnidadCalm] [char](30) NULL,
	[BajaLogica] [int] NULL CONSTRAINT [DF_CalmZCatUnidadCalm_BajaLogica]  DEFAULT ((0)),
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NULL CONSTRAINT [DF_CalmZCatUnidadCalm_FechaUltimaMod]  DEFAULT (getdate()),
	[NombrePcMod] [varchar](64) NULL,
	[ClaUsuarioMod] [int] NULL,
	[FechaIns] [datetime] NULL CONSTRAINT [DF_CalmZCatUnidadCalm_FechaIns]  DEFAULT (getdate()),
	[ClaUsuarioIns] [int] NULL,
 CONSTRAINT [PK_CalmZCatUnidadCalm] PRIMARY KEY CLUSTERED 
(
	[ClaUnidadCalm] ASC,
	[ClaUbicacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CexCatAduana]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CexCatAduana](
	[ClaAduana] [int] NOT NULL,
	[Descripcion] [varchar](100) NULL,
	[DescripcionIngles] [varchar](100) NULL,
	[DescripcionIdioma2] [varchar](100) NULL,
	[ClaPais] [int] NULL,
	[ClaEstado] [int] NULL,
	[ClaCiudad] [int] NULL,
	[BajaLogica] [tinyint] NOT NULL DEFAULT ((0)),
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL DEFAULT (getdate()),
	[ClaUsuarioMod] [int] NOT NULL,
	[NombrePcMod] [varchar](64) NOT NULL DEFAULT (host_name()),
	[EsExtranjero] [int] NULL,
 CONSTRAINT [PK_CexCatAduana] PRIMARY KEY CLUSTERED 
(
	[ClaAduana] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CexCatAduanaCopy]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CexCatAduanaCopy](
	[ClaAduana] [int] NOT NULL,
	[cla_AduSec] [char](10) NOT NULL,
	[nom_seccion] [char](40) NOT NULL,
	[descripcion] [varchar](50) NULL,
	[estatus] [int] NOT NULL,
	[fecha_ultimo_cambio] [datetime] NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CexCatAduanaNew]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CexCatAduanaNew](
	[ClaAduanaAnterior] [int] NULL,
	[ClaAduana] [int] NOT NULL,
	[Descripcion] [varchar](100) NULL,
	[DescripcionIngles] [varchar](100) NULL,
	[DescripcionIdioma2] [varchar](100) NULL,
	[ClaPais] [int] NULL,
	[ClaEstado] [int] NULL,
	[ClaCiudad] [int] NULL,
	[BajaLogica] [tinyint] NOT NULL,
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL,
	[ClaUsuarioMod] [int] NOT NULL,
	[NombrePcMod] [varchar](64) NOT NULL,
	[EsExtranjero] [int] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CexCatAduanaOriginalResp]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CexCatAduanaOriginalResp](
	[ClaAduana] [int] NOT NULL,
	[Descripcion] [varchar](100) NULL,
	[DescripcionIngles] [varchar](100) NULL,
	[DescripcionIdioma2] [varchar](100) NULL,
	[ClaPais] [int] NULL,
	[ClaEstado] [int] NULL,
	[ClaCiudad] [int] NULL,
	[BajaLogica] [tinyint] NOT NULL,
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL,
	[ClaUsuarioMod] [int] NOT NULL,
	[NombrePcMod] [varchar](64) NOT NULL,
	[EsExtranjero] [int] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CexCatAduanaWt]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CexCatAduanaWt](
	[ClaEmpresa] [int] NOT NULL,
	[ClaAduana] [int] NOT NULL,
	[NomAduana] [varchar](100) NULL,
	[ClaPaisCon] [int] NULL,
	[ClaEstadoCon] [int] NULL,
	[ClaMunicipioCon] [int] NULL,
	[BajaLogica] [tinyint] NOT NULL DEFAULT ((0)),
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL DEFAULT (getdate()),
	[ClaUsuarioMod] [int] NOT NULL,
	[NombrePcMod] [varchar](64) NOT NULL DEFAULT (host_name()),
	[EsExtranjero] [int] NULL,
 CONSTRAINT [PK_CexCatAduanaWt] PRIMARY KEY CLUSTERED 
(
	[ClaEmpresa] ASC,
	[ClaAduana] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CexCatAgenteAduanal]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CexCatAgenteAduanal](
	[ClaAgenteAduanal] [int] NOT NULL,
	[ClaCUP] [int] NOT NULL,
	[NomAgenteAduanal] [varchar](300) NULL,
	[Telefono] [varchar](30) NULL,
	[ClaPais] [int] NULL,
	[ClaEstado] [int] NULL,
	[ClaMunicipio] [int] NULL,
	[ClaColonia] [int] NULL,
	[Calle] [varchar](50) NULL,
	[NoExterior] [varchar](20) NULL,
	[NoInterior] [varchar](20) NULL,
	[CodigoPostal] [varchar](20) NULL,
	[BajaLogica] [tinyint] NOT NULL DEFAULT ((0)),
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL DEFAULT (getdate()),
	[ClaUsuarioMod] [int] NOT NULL,
	[NombrePcMod] [varchar](64) NOT NULL DEFAULT (host_name()),
 CONSTRAINT [PK_CexCatAgenteAduanal] PRIMARY KEY CLUSTERED 
(
	[ClaAgenteAduanal] ASC,
	[ClaCUP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CexCatAgenteAduanalCopy]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CexCatAgenteAduanalCopy](
	[ClaAgenteAduanal] [int] NOT NULL,
	[ClaCUP] [int] NOT NULL,
	[NomAgenteAduanal] [varchar](300) NULL,
	[Telefono] [varchar](30) NULL,
	[ClaPais] [int] NULL,
	[ClaEstado] [int] NULL,
	[ClaMunicipio] [int] NULL,
	[ClaColonia] [int] NULL,
	[Calle] [varchar](50) NULL,
	[NoExterior] [varchar](20) NULL,
	[NoInterior] [varchar](20) NULL,
	[CodigoPostal] [varchar](20) NULL,
	[BajaLogica] [tinyint] NOT NULL,
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL,
	[ClaUsuarioMod] [int] NOT NULL,
	[NombrePcMod] [varchar](64) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CexCatAgenteAduanalCopyCUP]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CexCatAgenteAduanalCopyCUP](
	[ClaAgenteAduanal] [int] NOT NULL,
	[ClaCUP] [int] NOT NULL,
	[NomAgenteAduanal] [varchar](300) NULL,
	[Telefono] [varchar](30) NULL,
	[ClaPais] [int] NULL,
	[ClaEstado] [int] NULL,
	[ClaMunicipio] [int] NULL,
	[ClaColonia] [int] NULL,
	[Calle] [varchar](50) NULL,
	[NoExterior] [varchar](20) NULL,
	[NoInterior] [varchar](20) NULL,
	[CodigoPostal] [varchar](20) NULL,
	[BajaLogica] [tinyint] NOT NULL,
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL,
	[ClaUsuarioMod] [int] NOT NULL,
	[NombrePcMod] [varchar](64) NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CexCatAgenteAduanalWt]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CexCatAgenteAduanalWt](
	[ClaEmpresa] [int] NOT NULL,
	[ClaAgenteAduanal] [int] NOT NULL,
	[ClaCUP] [int] NOT NULL,
	[NomAgenteAduanal] [varchar](300) NULL,
	[Telefono] [varchar](30) NULL,
	[ClaPais] [int] NULL,
	[ClaEstado] [int] NULL,
	[ClaMunicipio] [int] NULL,
	[ClaColonia] [int] NULL,
	[Calle] [varchar](50) NULL,
	[NoExterior] [varchar](20) NULL,
	[NoInterior] [varchar](20) NULL,
	[CodigoPostal] [varchar](20) NULL,
	[BajaLogica] [tinyint] NOT NULL CONSTRAINT [DF__CexCatAge__BajaL__4CCC1742]  DEFAULT ((0)),
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL CONSTRAINT [DF__CexCatAge__Fecha__4DC03B7B]  DEFAULT (getdate()),
	[ClaUsuarioMod] [int] NOT NULL,
	[NombrePcMod] [varchar](64) NOT NULL CONSTRAINT [DF__CexCatAge__Nombr__4EB45FB4]  DEFAULT (host_name()),
 CONSTRAINT [PK_CexCatAgenteAduanalWt] PRIMARY KEY CLUSTERED 
(
	[ClaEmpresa] ASC,
	[ClaAgenteAduanal] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CexCatConcepto]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CexCatConcepto](
	[ClaConcepto] [int] NOT NULL,
	[Descripcion] [varchar](100) NULL,
	[DescripcionIngles] [varchar](100) NULL,
	[DescripcionIdioma2] [varchar](100) NULL,
	[BajaLogica] [tinyint] NOT NULL DEFAULT ((0)),
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL DEFAULT (getdate()),
	[ClaUsuarioMod] [int] NOT NULL,
	[NombrePcMod] [varchar](64) NOT NULL DEFAULT (host_name()),
	[PorcentajeRetencion] [numeric](22, 8) NULL,
	[EsAplicaIvaSN] [int] NULL,
 CONSTRAINT [PK_CexCatConcepto] PRIMARY KEY CLUSTERED 
(
	[ClaConcepto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CexCatConcepto_LengWt]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CexCatConcepto_LengWt](
	[ClaLenguaje] [int] NOT NULL,
	[ClaConcepto] [int] NOT NULL,
	[NomConcepto] [varchar](100) NULL,
 CONSTRAINT [PK_CexCatConcepto_LengWt] PRIMARY KEY CLUSTERED 
(
	[ClaConcepto] ASC,
	[ClaLenguaje] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CexCatConceptoWt]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CexCatConceptoWt](
	[ClaConcepto] [int] NOT NULL,
	[claempresa] [int] NOT NULL,
	[NomConcepto] [varchar](100) NULL,
	[CargoLogistica] [int] NOT NULL,
	[BajaLogica] [tinyint] NOT NULL,
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL,
	[ClaUsuarioMod] [int] NOT NULL,
	[NombrePcMod] [varchar](64) NOT NULL,
 CONSTRAINT [PK_CexCatConceptoWt] PRIMARY KEY CLUSTERED 
(
	[ClaConcepto] ASC,
	[claempresa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CexCatDatoLenguaje]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CexCatDatoLenguaje](
	[ClaLenguaje] [int] NOT NULL,
	[ClaDatoLenguaje] [int] NOT NULL,
	[ClaLlave] [int] NOT NULL,
	[NomDatoLenguaje] [varchar](250) NULL,
	[BajaLogica] [tinyint] NOT NULL,
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL,
	[ClaUsuarioMod] [int] NOT NULL,
	[NombrePcMod] [varchar](64) NOT NULL,
 CONSTRAINT [PK_CexCatDatoLenguaje] PRIMARY KEY CLUSTERED 
(
	[ClaLenguaje] ASC,
	[ClaDatoLenguaje] ASC,
	[ClaLlave] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CexCatDeAceroCuenta]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CexCatDeAceroCuenta](
	[ClaBanco] [int] NOT NULL,
	[NumCuenta] [varchar](50) NULL,
	[ClaMoneda] [int] NULL,
	[Descripcion] [varchar](250) NULL,
	[NomBanco] [varchar](50) NULL,
	[BajaLogica] [int] NULL,
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL DEFAULT (getdate()),
	[ClaUsuarioMod] [int] NOT NULL DEFAULT ((1)),
	[NombrePcMod] [varchar](64) NOT NULL DEFAULT (host_name()),
 CONSTRAINT [PK_CexCatDeAceroCuenta] PRIMARY KEY CLUSTERED 
(
	[ClaBanco] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CexCatEjemplo]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CexCatEjemplo](
	[ClaEjemplo] [int] NOT NULL,
	[NomEjemplo] [varchar](30) NULL,
	[CampoX] [int] NULL,
 CONSTRAINT [PK_CexCatEjemplo] PRIMARY KEY CLUSTERED 
(
	[ClaEjemplo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CexCatIncotermSufijos]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CexCatIncotermSufijos](
	[ClaIncotermSufijo] [int] NOT NULL,
	[DescripcionCorta] [varchar](50) NULL,
	[Descripcion] [varchar](250) NULL,
	[Observaciones] [varchar](500) NULL,
	[BajaLogica] [tinyint] NOT NULL DEFAULT ((0)),
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL DEFAULT (getdate()),
	[ClaUsuarioMod] [int] NOT NULL,
	[NombrePcMod] [varchar](64) NOT NULL DEFAULT (host_name()),
 CONSTRAINT [PK_CexCatIncotermSufijos] PRIMARY KEY CLUSTERED 
(
	[ClaIncotermSufijo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UQ_CexCatIncotermSufijos_ClaIncotermSufijo] UNIQUE NONCLUSTERED 
(
	[ClaIncotermSufijo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CexCatRegion]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CexCatRegion](
	[ClaRegion] [int] NOT NULL,
	[Descripcion] [varchar](100) NULL,
	[DescripcionIngles] [varchar](100) NULL,
	[DescripcionIdioma2] [varchar](100) NULL,
	[BajaLogica] [tinyint] NOT NULL DEFAULT ((0)),
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL DEFAULT (getdate()),
	[ClaUsuarioMod] [int] NOT NULL,
	[NombrePcMod] [varchar](64) NOT NULL DEFAULT (host_name()),
 CONSTRAINT [PK_CexCatRegion] PRIMARY KEY CLUSTERED 
(
	[ClaRegion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CexCatRegionWt]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CexCatRegionWt](
	[ClaEmpresa] [int] NOT NULL,
	[ClaRegion] [int] NOT NULL,
	[NomRegion] [varchar](100) NULL,
	[ClaNivelBusqueda] [int] NOT NULL,
	[BajaLogica] [tinyint] NOT NULL,
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL,
	[ClaUsuarioMod] [int] NOT NULL,
	[NombrePcMod] [varchar](64) NOT NULL,
 CONSTRAINT [PK_CexCatRegionWt] PRIMARY KEY CLUSTERED 
(
	[ClaEmpresa] ASC,
	[ClaRegion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CexCatSistemaPermitido]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CexCatSistemaPermitido](
	[ClaSistemaPermitido] [int] NOT NULL,
	[Descripcion] [varchar](100) NOT NULL,
	[Nombre] [varchar](50) NULL,
	[BajaLogica] [tinyint] NOT NULL DEFAULT ((0)),
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL DEFAULT (getdate()),
	[ClaUsuarioMod] [int] NOT NULL,
	[NombrePcMod] [varchar](64) NOT NULL DEFAULT (host_name()),
 CONSTRAINT [PK_CexCatSistemaPermitido] PRIMARY KEY CLUSTERED 
(
	[ClaSistemaPermitido] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CexCatSistemaPermitidoWt]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CexCatSistemaPermitidoWt](
	[ClaSistemaPermitido] [int] NOT NULL,
	[Descripcion] [varchar](100) NOT NULL,
	[NomSistemaPermitido] [varchar](50) NULL,
	[BajaLogica] [tinyint] NOT NULL,
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL,
	[ClaUsuarioMod] [int] NOT NULL,
	[NombrePcMod] [varchar](64) NOT NULL,
 CONSTRAINT [PK_CexCatSistemaPermitidoWt] PRIMARY KEY CLUSTERED 
(
	[ClaSistemaPermitido] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CexCatTipoImportacion]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CexCatTipoImportacion](
	[ClaTipoImportacion] [int] NOT NULL,
	[Descripcion] [varchar](100) NULL,
	[DescripcionIngles] [varchar](100) NULL,
	[DescripcionIdioma2] [varchar](100) NULL,
	[BajaLogica] [int] NOT NULL,
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL,
	[ClaUsuarioMod] [int] NOT NULL,
	[NombrePcMod] [varchar](64) NULL,
	[Sufijo] [varchar](5) NOT NULL,
 CONSTRAINT [PK_CexCatTipoImportacion] PRIMARY KEY CLUSTERED 
(
	[ClaTipoImportacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UQ_CexCatTipoImportacion_Sufijo] UNIQUE NONCLUSTERED 
(
	[Sufijo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CexCatTipoImportacion_LengWt]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CexCatTipoImportacion_LengWt](
	[ClaEmpresa] [int] NOT NULL,
	[ClaLenguaje] [int] NOT NULL,
	[ClaTipoImportacion] [int] NOT NULL,
	[NomTipoImportacion] [varchar](100) NULL,
 CONSTRAINT [PK_CexCatTipoImportacion_LengWt] PRIMARY KEY CLUSTERED 
(
	[ClaEmpresa] ASC,
	[ClaLenguaje] ASC,
	[ClaTipoImportacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CexCatTipoImportacionWt]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CexCatTipoImportacionWt](
	[ClaEmpresa] [int] NOT NULL,
	[ClaTipoImportacion] [int] NOT NULL,
	[NomTipoImportacion] [varchar](100) NULL,
	[BajaLogica] [tinyint] NOT NULL,
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL,
	[ClaUsuarioMod] [int] NOT NULL,
	[NombrePcMod] [varchar](64) NOT NULL,
	[Sufijo] [varchar](5) NOT NULL,
 CONSTRAINT [PK_CexCatTipoImportacionWt] PRIMARY KEY CLUSTERED 
(
	[ClaEmpresa] ASC,
	[ClaTipoImportacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CexCatTipoMaterial]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CexCatTipoMaterial](
	[ClaTipoMaterial] [int] NOT NULL,
	[Descripcion] [varchar](100) NULL,
	[DescripcionIngles] [varchar](100) NULL,
	[DescripcionIdioma2] [varchar](100) NULL,
	[BajaLogica] [int] NOT NULL,
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL,
	[ClaUsuarioMod] [int] NOT NULL,
	[NombrePcMod] [varchar](64) NULL,
 CONSTRAINT [PK_CexCatTipoMaterial] PRIMARY KEY CLUSTERED 
(
	[ClaTipoMaterial] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CexCatTipoMaterial_LengWt]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CexCatTipoMaterial_LengWt](
	[ClaLenguaje] [int] NOT NULL,
	[ClaTipoMaterial] [int] NOT NULL,
	[NomTipoMaterial] [varchar](100) NULL,
 CONSTRAINT [PK_CexCatTipoMaterial_LengWt] PRIMARY KEY CLUSTERED 
(
	[ClaTipoMaterial] ASC,
	[ClaLenguaje] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CexCatTipoMaterialWt]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CexCatTipoMaterialWt](
	[ClaTipoMaterial] [int] NOT NULL,
	[NomTipoMaterial] [varchar](100) NULL,
	[BajaLogica] [tinyint] NOT NULL DEFAULT ((0)),
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL DEFAULT (getdate()),
	[ClaUsuarioMod] [int] NOT NULL,
	[NombrePcMod] [varchar](64) NOT NULL DEFAULT (host_name()),
 CONSTRAINT [PK_CexCatTipoMaterialWt] PRIMARY KEY CLUSTERED 
(
	[ClaTipoMaterial] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CexCatTipoOperacion]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CexCatTipoOperacion](
	[ClaTipoOperacion] [int] NOT NULL,
	[Descripcion] [varchar](100) NULL,
	[DescripcionIngles] [varchar](100) NULL,
	[DescripcionIdioma2] [varchar](100) NULL,
	[BajaLogica] [tinyint] NOT NULL DEFAULT ((0)),
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL DEFAULT (getdate()),
	[ClaUsuarioMod] [int] NOT NULL,
	[NombrePcMod] [varchar](64) NOT NULL DEFAULT (host_name()),
 CONSTRAINT [PK_CexCatTipoOperacion] PRIMARY KEY CLUSTERED 
(
	[ClaTipoOperacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CexCatTipoOperacion_LengWt]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CexCatTipoOperacion_LengWt](
	[ClaLenguaje] [int] NOT NULL,
	[ClaTipoOperacion] [int] NOT NULL,
	[NomTipoOperacion] [varchar](100) NULL,
 CONSTRAINT [PK_CexCatTipoOperacion_LengWt] PRIMARY KEY CLUSTERED 
(
	[ClaTipoOperacion] ASC,
	[ClaLenguaje] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CexCatTipoOperacionWt]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CexCatTipoOperacionWt](
	[ClaTipoOperacion] [int] NOT NULL,
	[NomTipoOperacion] [varchar](100) NULL,
	[BajaLogica] [tinyint] NOT NULL DEFAULT ((0)),
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL DEFAULT (getdate()),
	[ClaUsuarioMod] [int] NOT NULL,
	[NombrePcMod] [varchar](64) NOT NULL DEFAULT (host_name()),
 CONSTRAINT [PK_CexCatTipoOperacionWt] PRIMARY KEY CLUSTERED 
(
	[ClaTipoOperacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CexCatTipoServicio]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CexCatTipoServicio](
	[ClaTipoServicio] [int] NOT NULL,
	[Descripcion] [varchar](100) NULL,
	[DescripcionIngles] [varchar](100) NULL,
	[DescripcionIdioma2] [varchar](100) NULL,
	[ClaTipoRegistro] [int] NOT NULL,
	[BajaLogica] [tinyint] NOT NULL DEFAULT ((0)),
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL DEFAULT (getdate()),
	[ClaUsuarioMod] [int] NOT NULL,
	[NombrePcMod] [varchar](64) NOT NULL DEFAULT (host_name()),
 CONSTRAINT [PK_CexCatTipoServicio] PRIMARY KEY CLUSTERED 
(
	[ClaTipoServicio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CexCatTipoServicio_LengWt]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CexCatTipoServicio_LengWt](
	[ClaLenguaje] [int] NOT NULL,
	[ClaTipoServicio] [int] NOT NULL,
	[NomTipoServicio] [varchar](100) NULL,
 CONSTRAINT [PK_CexCatTipoServicio_LengWt] PRIMARY KEY CLUSTERED 
(
	[ClaTipoServicio] ASC,
	[ClaLenguaje] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CexCatTipoServicioWt]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CexCatTipoServicioWt](
	[ClaTipoServicio] [int] NOT NULL,
	[NomTipoServicio] [varchar](100) NULL,
	[ClaTipoRegistro] [int] NOT NULL,
	[BajaLogica] [tinyint] NOT NULL DEFAULT ((0)),
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL DEFAULT (getdate()),
	[ClaUsuarioMod] [int] NOT NULL,
	[NombrePcMod] [varchar](64) NOT NULL DEFAULT (host_name()),
 CONSTRAINT [PK_CexCatTipoServicioWt] PRIMARY KEY CLUSTERED 
(
	[ClaTipoServicio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CexRelAduanaSeccion]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CexRelAduanaSeccion](
	[ClaAduanaSeccion] [int] NOT NULL,
	[ClaAduana] [int] NULL,
	[NumSeccion] [varchar](10) NOT NULL,
	[NombreSeccion] [varchar](250) NOT NULL,
	[BajaLogica] [int] NOT NULL DEFAULT ((0)),
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL DEFAULT (getdate()),
	[ClaUsuarioMod] [int] NOT NULL,
	[NombrePcMod] [varchar](64) NOT NULL DEFAULT (host_name()),
 CONSTRAINT [PK_CexRelAduanaSeccion] PRIMARY KEY CLUSTERED 
(
	[ClaAduanaSeccion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UQ_CexRelAduanaSeccion_NumSeccion] UNIQUE NONCLUSTERED 
(
	[NumSeccion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CexRelAduanaSeccionWt]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CexRelAduanaSeccionWt](
	[ClaEmpresa] [int] NOT NULL,
	[ClaAduanaSeccion] [int] NOT NULL,
	[ClaAduana] [int] NULL,
	[NumSeccion] [varchar](10) NOT NULL,
	[NombreSeccion] [varchar](250) NOT NULL,
	[BajaLogica] [tinyint] NOT NULL,
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL,
	[ClaUsuarioMod] [int] NOT NULL,
	[NombrePcMod] [varchar](64) NOT NULL,
 CONSTRAINT [PK_CexRelAduanaSeccionWt] PRIMARY KEY CLUSTERED 
(
	[ClaEmpresa] ASC,
	[ClaAduanaSeccion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CexRelAgenteAduana]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CexRelAgenteAduana](
	[ClaAduana] [int] NOT NULL,
	[ClaAgenteAduanal] [int] NOT NULL,
	[ClaCUP] [int] NOT NULL,
	[BajaLogica] [int] NOT NULL DEFAULT ((0)),
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL DEFAULT (getdate()),
	[ClaUsuarioMod] [int] NOT NULL,
	[NombrePcMod] [varchar](64) NOT NULL DEFAULT (host_name()),
	[ClaEmpresa] [int] NULL,
	[ClaRelAgenteAduana] [int] NULL,
 CONSTRAINT [PK_CexRelAgenteAduana] PRIMARY KEY CLUSTERED 
(
	[ClaAduana] ASC,
	[ClaAgenteAduanal] ASC,
	[ClaCUP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UQ_CexRelAgenteAduana_ClaRelAgenteAduana] UNIQUE NONCLUSTERED 
(
	[ClaRelAgenteAduana] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CexRelAgenteAduanaCopy]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CexRelAgenteAduanaCopy](
	[ClaAduana] [int] NOT NULL,
	[ClaAgenteAduanal] [int] NOT NULL,
	[ClaCUP] [int] NULL,
	[BajaLogica] [int] NOT NULL,
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL,
	[ClaUsuarioMod] [int] NOT NULL,
	[NombrePcMod] [varchar](64) NOT NULL,
	[ClaEmpresa] [int] NULL,
	[ClaRelAgenteAduana] [int] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CexRelAgenteAduanaCopyCUP]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CexRelAgenteAduanaCopyCUP](
	[ClaAduana] [int] NOT NULL,
	[ClaAgenteAduanal] [int] NOT NULL,
	[ClaCUP] [int] NULL,
	[BajaLogica] [int] NOT NULL,
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL,
	[ClaUsuarioMod] [int] NOT NULL,
	[NombrePcMod] [varchar](64) NOT NULL,
	[ClaEmpresa] [int] NULL,
	[ClaRelAgenteAduana] [int] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CexRelIncotermSufijos]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CexRelIncotermSufijos](
	[ClaIncoterm] [int] NOT NULL,
	[ClaIncotermSufijo] [int] NOT NULL,
	[BajaLogica] [int] NOT NULL DEFAULT ((0)),
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL DEFAULT (getdate()),
	[ClaUsuarioMod] [int] NOT NULL,
	[NombrePcMod] [varchar](64) NOT NULL DEFAULT (host_name()),
 CONSTRAINT [PK_CexRelIncotermSufijos] PRIMARY KEY CLUSTERED 
(
	[ClaIncoterm] ASC,
	[ClaIncotermSufijo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CfaCatEstatusAutorizacion]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CfaCatEstatusAutorizacion](
	[ClaEstatusAutorizacion] [int] NOT NULL,
	[NomEstatusAutorizacion] [varchar](64) NOT NULL,
	[BajaLogica] [tinyint] NOT NULL,
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL,
	[NombrePcMod] [varchar](64) NOT NULL,
	[ClaUsuarioMod] [int] NOT NULL,
 CONSTRAINT [PK_CfaCatEstatusAutorizacion] PRIMARY KEY CLUSTERED 
(
	[ClaEstatusAutorizacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CfaCatNodoDinamico]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CfaCatNodoDinamico](
	[ClaNodoDinamico] [int] NOT NULL,
	[Descripcion] [varchar](100) NOT NULL,
	[BajaLogica] [tinyint] NOT NULL DEFAULT ((0)),
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL DEFAULT (getdate()),
	[NombrePcMod] [varchar](64) NOT NULL DEFAULT (host_name()),
	[ClaUsuarioMod] [int] NOT NULL,
 CONSTRAINT [PK_CfaCatNodoDinamico] PRIMARY KEY CLUSTERED 
(
	[ClaNodoDinamico] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ChaCatGrupoArticulo]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ChaCatGrupoArticulo](
	[ClaGrupoArticulo] [int] NOT NULL,
	[ClaUbicacion] [tinyint] NOT NULL,
	[ClaTipoCal] [int] NOT NULL,
	[ClaGrupoReceta] [int] NOT NULL,
	[NombreGrupoArticulo] [varchar](40) NULL,
	[TipoNacImp] [varchar](1) NULL,
	[MermaRobo] [numeric](25, 3) NULL,
	[PorcentajeMerma] [numeric](25, 3) NULL,
	[FechaUltimaMod] [datetime] NOT NULL,
	[FechaIns] [datetime] NULL,
	[BajaLogica] [int] NULL,
	[FechaBajaLogica] [datetime] NULL,
 CONSTRAINT [PK_ChaCatGrupoArticulo] PRIMARY KEY CLUSTERED 
(
	[ClaGrupoArticulo] ASC,
	[ClaUbicacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[cmp_Recolector]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[cmp_Recolector](
	[ClaUbicacion] [int] NOT NULL,
	[id_recolector] [int] NOT NULL,
	[nombre] [varchar](200) NOT NULL,
	[apellido_paterno] [varchar](50) NULL,
	[apellido_materno] [varchar](50) NULL,
	[autofactura] [tinyint] NOT NULL,
	[pagar_peso_documentado] [tinyint] NOT NULL,
	[rollof] [tinyint] NOT NULL,
	[documentacion_pactada] [tinyint] NOT NULL,
	[cla_forma_pago] [tinyint] NOT NULL,
	[autorizado] [tinyint] NOT NULL,
	[vetado] [tinyint] NOT NULL,
	[rechazado] [tinyint] NOT NULL,
	[activo] [tinyint] NOT NULL,
	[nuevo] [tinyint] NOT NULL,
	[persona_moral] [tinyint] NOT NULL,
	[es_empresa] [tinyint] NOT NULL,
	[prestador_bienes] [tinyint] NOT NULL,
	[numero_credencial_ife] [varchar](13) NULL,
	[cla_otra_identificacion] [tinyint] NULL,
	[referencia_otra_identificacion] [varchar](100) NULL,
	[curp] [varchar](18) NULL,
	[rfc] [varchar](14) NULL,
	[razon_social] [varchar](200) NULL,
	[domicilio_fiscal_calle] [varchar](30) NOT NULL,
	[domicilio_fiscal_numero_exterior] [varchar](15) NOT NULL,
	[domicilio_fiscal_numero_interior] [varchar](15) NULL,
	[domicilio_fiscal_cp] [numeric](5, 0) NULL,
	[telefono] [varchar](30) NULL,
	[cla_pais] [int] NOT NULL,
	[cla_estado] [int] NOT NULL,
	[cla_ciudad] [int] NOT NULL,
	[cla_colonia] [int] NOT NULL,
	[cla_zona] [int] NOT NULL,
	[cla_region] [int] NOT NULL,
	[id_lista_precios] [int] NOT NULL,
	[cla_moneda] [int] NULL,
	[cla_tipo_recolector] [tinyint] NOT NULL,
	[pagar_boletas_por_fletes] [tinyint] NULL,
	[cla_usuario_ins] [int] NOT NULL,
	[cla_usuario_mod] [int] NOT NULL,
	[fecha_ins] [datetime] NOT NULL,
	[fecha_ult_mod] [datetime] NOT NULL,
	[nombre_pc] [varchar](15) NOT NULL,
	[version] [timestamp] NULL,
	[contrarecibo] [tinyint] NULL,
	[id_regimen_fiscal] [int] NULL,
	[cla_division_area] [int] NULL,
	[cla_region_area] [int] NULL,
	[cla_zona_area] [int] NULL,
	[cla_plaza_area] [int] NULL,
	[material_indexado] [int] NULL,
	[cla_cup] [int] NULL,
	[cla_tipo_proveedor] [tinyint] NULL,
	[domicilio_fiscal_entre_calles] [varchar](100) NULL,
	[domicilio_fiscal_cp_ext] [varchar](30) NULL,
	[esquema_mayorista] [int] NULL,
	[clabe_mayorista] [varchar](18) NULL,
	[cta_bancaria_mayorista] [varchar](16) NULL,
	[cla_banco_mayorista] [varchar](50) NULL,
	[sucursal] [varchar](5) NULL,
	[id_autorizacion_datos_pago] [int] NULL,
	[correo] [varchar](50) NULL,
 CONSTRAINT [PK_cmp_Recolector] PRIMARY KEY CLUSTERED 
(
	[ClaUbicacion] ASC,
	[id_recolector] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CmpCatAcuerdoUbicacion]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CmpCatAcuerdoUbicacion](
	[ClaAcuerdo] [int] NOT NULL,
	[ClaUbicacion] [int] NOT NULL,
	[BajaLogica] [int] NOT NULL,
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL,
	[ClaUsuarioMod] [int] NOT NULL,
	[NombrePcMod] [varchar](64) NOT NULL,
 CONSTRAINT [PK_CmpCatAcuerdoUbicacion] PRIMARY KEY CLUSTERED 
(
	[ClaAcuerdo] ASC,
	[ClaUbicacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CmpCatAlmacenUsuario]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CmpCatAlmacenUsuario](
	[ClaUbicacion] [int] NOT NULL,
	[ClaSubAlmacen] [int] NOT NULL,
	[ClaUsuario] [int] NOT NULL,
	[BajaLogica] [int] NOT NULL DEFAULT ((0)),
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL DEFAULT (getdate()),
	[NombrePcMod] [varchar](64) NOT NULL DEFAULT (host_name()),
	[ClaUsuarioMod] [int] NOT NULL,
 CONSTRAINT [PK_CmpCatAlmacenUsuario] PRIMARY KEY CLUSTERED 
(
	[ClaSubAlmacen] ASC,
	[ClaUbicacion] ASC,
	[ClaUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CmpCatCausaValeNegado]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CmpCatCausaValeNegado](
	[ClaCausaValeNegado] [int] NOT NULL,
	[Descripcion] [varchar](250) NOT NULL,
	[Responsable] [varchar](100) NOT NULL,
	[FechaUltimaMod] [datetime] NOT NULL DEFAULT (getdate()),
	[NombrePcMod] [varchar](64) NOT NULL DEFAULT (host_name()),
	[ClaUsuarioMod] [int] NOT NULL,
 CONSTRAINT [PK_CmpCatCausaValeNegado] PRIMARY KEY CLUSTERED 
(
	[ClaCausaValeNegado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CmpCatClasificacion]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CmpCatClasificacion](
	[ClaClasificacion] [int] NOT NULL,
	[NomClasificacion] [varchar](100) NULL,
	[DescClasificacion] [varchar](255) NULL,
	[Observaciones] [varchar](255) NULL,
	[BajaLogica] [int] NOT NULL DEFAULT ((0)),
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL DEFAULT (getdate()),
	[ClaUsuarioMod] [int] NOT NULL,
	[NombrePcMod] [varchar](64) NOT NULL DEFAULT (host_name()),
 CONSTRAINT [PK_CmpCatClasificacion] PRIMARY KEY CLUSTERED 
(
	[ClaClasificacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CmpCatClasificaObsoleto]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CmpCatClasificaObsoleto](
	[ClaClasificaObsoleto] [int] NOT NULL,
	[Descripcion] [varchar](50) NOT NULL,
	[BajaLogica] [int] NOT NULL DEFAULT ((0)),
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL DEFAULT (getdate()),
	[NombrePcMod] [varchar](64) NOT NULL DEFAULT (host_name()),
	[ClaUsuarioMod] [int] NOT NULL,
 CONSTRAINT [PK_CmpCatClasificaObsoleto] PRIMARY KEY CLUSTERED 
(
	[ClaClasificaObsoleto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CmpCatComprador]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CmpCatComprador](
	[ClaComprador] [int] NOT NULL,
	[NomComprador] [varchar](255) NOT NULL,
	[EsMultiUbicacion] [int] NOT NULL CONSTRAINT [DF__CmpCatCom__EsMul__49DB6755]  DEFAULT ((0)),
	[ClaUsuario] [int] NULL,
	[ClaUbicacionBase] [int] NULL,
	[Email] [varchar](255) NULL,
	[FirmaElectronica] [varbinary](max) NULL,
	[EsNegociadorAcu] [int] NOT NULL CONSTRAINT [DF__CmpCatCom__EsNeg__4ACF8B8E]  DEFAULT ((0)),
	[RecibeCopiaPedido] [int] NOT NULL CONSTRAINT [DF__CmpCatCom__Recib__4BC3AFC7]  DEFAULT ((0)),
	[BajaLogica] [int] NOT NULL CONSTRAINT [DF__CmpCatCom__BajaL__4CB7D400]  DEFAULT ((0)),
	[FechaBajaLogica] [datetime] NULL,
	[ClaUsuarioMod] [int] NOT NULL,
	[FechaUltimaMod] [datetime] NOT NULL CONSTRAINT [DF__CmpCatCom__Fecha__4DABF839]  DEFAULT (getdate()),
	[NombrePcMod] [varchar](64) NOT NULL CONSTRAINT [DF__CmpCatCom__Nombr__4EA01C72]  DEFAULT (host_name()),
 CONSTRAINT [PK_CmpCatComprador] PRIMARY KEY CLUSTERED 
(
	[ClaComprador] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CmpCatCompradorUbicacion]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CmpCatCompradorUbicacion](
	[ClaComprador] [int] NOT NULL,
	[ClaUbicacion] [int] NOT NULL,
	[BajaLogica] [int] NOT NULL DEFAULT ((0)),
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL DEFAULT (getdate()),
	[ClaUsuarioMod] [int] NOT NULL,
	[NombrePcMod] [varchar](64) NOT NULL DEFAULT (host_name()),
 CONSTRAINT [PK_CmpCatCompradorUbic] PRIMARY KEY CLUSTERED 
(
	[ClaComprador] ASC,
	[ClaUbicacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CmpCatConceptoGastoAd]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CmpCatConceptoGastoAd](
	[ClaUbicacion] [int] NOT NULL,
	[ClaConceptoGastoAd] [int] NOT NULL,
	[DescripcionGasto] [varchar](200) NULL,
	[ClaDireccionContable] [varchar](4) NULL,
	[ClaClasificacionCuenta] [int] NOT NULL,
	[ClaCRC] [int] NOT NULL,
	[ClaGrupoAsignacion] [int] NULL,
	[ClaGrupoProceso] [int] NULL,
	[ClaTipoGasto] [int] NULL,
	[GeneraIVA] [int] NOT NULL DEFAULT ((0)),
	[GeneraRetencion] [int] NOT NULL DEFAULT ((0)),
	[PorcentajeRetencion] [numeric](14, 4) NULL,
	[ClaCRCRet] [int] NULL,
	[ClaGrupoAsignacionRet] [int] NULL,
	[ClaTipoGastoRet] [int] NULL,
	[ClaTipoGastoProyRet] [int] NULL,
	[ClaTipoGastoProy] [int] NULL,
	[ClaDireccionRet] [char](4) NULL,
	[ClaTipoRegistro] [int] NULL,
	[ClaTipoRegistroRet] [int] NULL,
	[BajaLogica] [int] NOT NULL DEFAULT ((0)),
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL DEFAULT (getdate()),
	[NombrePcMod] [varchar](64) NOT NULL DEFAULT (host_name()),
	[ClaUsuarioMod] [int] NOT NULL,
	[ClaGrupoProcesoRet] [int] NULL,
 CONSTRAINT [PK_CmpCatConceptoGastoAd] PRIMARY KEY CLUSTERED 
(
	[ClaUbicacion] ASC,
	[ClaConceptoGastoAd] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CmpCatConceptoMaquinado]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CmpCatConceptoMaquinado](
	[ClaConceptoMaquinado] [int] NOT NULL,
	[NomConceptoMaquinado] [varchar](250) NULL,
	[BajaLogica] [int] NOT NULL,
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL,
	[ClaUsuarioMod] [int] NOT NULL,
	[NombrePcMod] [varchar](64) NOT NULL,
 CONSTRAINT [PK_CmpCatConceptoMaq] PRIMARY KEY CLUSTERED 
(
	[ClaConceptoMaquinado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CmpCatDestinoObsoleto]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CmpCatDestinoObsoleto](
	[ClaDestinoObsoleto] [int] NOT NULL,
	[NomDestinoObsoleto] [varchar](150) NOT NULL,
	[BajaLogica] [int] NOT NULL DEFAULT ((0)),
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL DEFAULT (getdate()),
	[NombrePcMod] [varchar](64) NOT NULL DEFAULT (host_name()),
	[ClaUsuarioMod] [int] NOT NULL,
 CONSTRAINT [PK_CmpCatDestinoObsoleto] PRIMARY KEY CLUSTERED 
(
	[ClaDestinoObsoleto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CmpCatEstadoACambioArt]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CmpCatEstadoACambioArt](
	[ClaEstadoACambioArt] [int] NOT NULL,
	[Descripcion] [varchar](250) NOT NULL,
	[BajaLogica] [int] NOT NULL DEFAULT ((0)),
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL DEFAULT (getdate()),
	[NombrePcMod] [varchar](64) NOT NULL DEFAULT (host_name()),
	[ClaUsuarioMod] [int] NOT NULL,
 CONSTRAINT [PK_CmpCatEstadoACambioArt] PRIMARY KEY CLUSTERED 
(
	[ClaEstadoACambioArt] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CmpCatEvento]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CmpCatEvento](
	[ClaGrupoEvento] [int] NOT NULL,
	[ClaEvento] [int] NOT NULL,
	[NomEvento] [varchar](250) NOT NULL,
	[BajaLogica] [int] NOT NULL DEFAULT ((0)),
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL DEFAULT (getdate()),
	[ClaUsuarioMod] [int] NOT NULL,
	[NombrePcMod] [varchar](64) NOT NULL DEFAULT (host_name()),
 CONSTRAINT [PK_CmpCatEvento] PRIMARY KEY CLUSTERED 
(
	[ClaGrupoEvento] ASC,
	[ClaEvento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CmpCatGrupoEvento]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CmpCatGrupoEvento](
	[ClaGrupoEvento] [int] NOT NULL,
	[NomGrupoEvento] [varchar](250) NOT NULL,
	[BajaLogica] [int] NOT NULL DEFAULT ((0)),
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL DEFAULT (getdate()),
	[ClaUsuarioMod] [int] NOT NULL,
	[NombrePcMod] [varchar](64) NOT NULL DEFAULT (host_name()),
 CONSTRAINT [PK_CmpCatGrupoEvento] PRIMARY KEY CLUSTERED 
(
	[ClaGrupoEvento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CmpCatIva]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CmpCatIva](
	[ClaIva] [int] NOT NULL,
	[NomIva] [varchar](50) NULL,
	[ValorIva] [numeric](14, 4) NOT NULL,
	[BajaLogica] [int] NOT NULL,
	[FechaBajaLogica] [int] NULL,
	[FechaUltimaMod] [datetime] NOT NULL,
	[ClaUsuarioMod] [int] NOT NULL,
	[NombrePcMod] [varchar](64) NOT NULL,
 CONSTRAINT [PK_CmpCatIva] PRIMARY KEY CLUSTERED 
(
	[ClaIva] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CmpCatModeloInventario]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CmpCatModeloInventario](
	[ClaModeloInventario] [int] NOT NULL,
	[NomModeloInventario] [varchar](250) NOT NULL,
	[BajaLogica] [int] NOT NULL,
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL,
	[ClaUsuarioMod] [int] NOT NULL,
	[NombrePcMod] [varchar](64) NOT NULL,
 CONSTRAINT [PK_CmpCatModeloInv] PRIMARY KEY CLUSTERED 
(
	[ClaModeloInventario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CmpCatMotivo]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CmpCatMotivo](
	[ClaMotivo] [int] NOT NULL,
	[ClaTipoMotivo] [int] NOT NULL,
	[NombreMotivo] [varchar](100) NOT NULL,
	[Descripcion] [varchar](250) NULL,
	[BajaLogica] [int] NOT NULL DEFAULT ((0)),
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL DEFAULT (getdate()),
	[NombrePcMod] [varchar](64) NOT NULL DEFAULT (host_name()),
	[ClaUsuarioMod] [int] NOT NULL,
 CONSTRAINT [PK_CmpCatMotivo] PRIMARY KEY CLUSTERED 
(
	[ClaMotivo] ASC,
	[ClaTipoMotivo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CmpCatMotivoIncremento]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CmpCatMotivoIncremento](
	[ClaMotivoIncremento] [int] NOT NULL,
	[NomMotivoIncremento] [varchar](250) NULL,
	[DescMotivoIncremento] [varchar](500) NOT NULL,
	[BajaLogica] [int] NOT NULL,
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL,
	[ClaUsuarioMod] [int] NOT NULL,
	[NombrePcMod] [varchar](64) NOT NULL,
 CONSTRAINT [PK_CmpCatMotivoInc] PRIMARY KEY CLUSTERED 
(
	[ClaMotivoIncremento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CmpCatOrigenNotaCredito]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CmpCatOrigenNotaCredito](
	[ClaOrigenNotaCredito] [int] NOT NULL,
	[Descripcion] [varchar](150) NOT NULL,
	[BajaLogica] [int] NOT NULL DEFAULT ((0)),
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL DEFAULT (getdate()),
	[NombrePcMod] [varchar](64) NOT NULL DEFAULT (host_name()),
	[ClaUsuarioMod] [int] NOT NULL,
 CONSTRAINT [PK_CmpCatOrigenNotaCredito] PRIMARY KEY CLUSTERED 
(
	[ClaOrigenNotaCredito] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CmpCatProveedorContacto]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CmpCatProveedorContacto](
	[IdContacto] [int] NOT NULL,
	[ClaUbicacion] [int] NOT NULL,
	[ClaCUP] [int] NOT NULL,
	[NomContacto] [varchar](150) NULL,
	[Puesto] [varchar](50) NULL,
	[Telefono] [varchar](50) NULL,
	[Email] [varchar](500) NULL,
	[Fax] [varchar](50) NULL,
	[TelefonoMovil] [varchar](50) NULL,
	[Radio] [varchar](50) NULL,
	[BajaLogica] [int] NOT NULL DEFAULT ((0)),
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL DEFAULT (getdate()),
	[ClaUsuarioMod] [int] NOT NULL,
	[NombrePcMod] [varchar](64) NOT NULL DEFAULT (host_name()),
	[ClaProveedor] [int] NULL,
	[ClaTipoProveedor] [int] NULL,
 CONSTRAINT [PK_CmpCatProveedorContacto] PRIMARY KEY CLUSTERED 
(
	[IdContacto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CmpCatProveedorRefComercial]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CmpCatProveedorRefComercial](
	[ClaCup] [int] NOT NULL,
	[ClaProveedor] [int] NULL,
	[ClaTipoProveedor] [int] NULL,
	[AniosAntiguedad] [numeric](14, 4) NULL,
	[ClaGiroProveedor] [int] NULL,
	[NumeroPersonal] [int] NULL,
	[Capital] [numeric](14, 4) NULL,
	[ClaMoneda] [int] NOT NULL,
	[CapitalSocialUSD] [numeric](14, 4) NULL,
	[VentasAnualesDolar] [numeric](14, 4) NULL,
	[EsDesgloseFormaPago] [int] NULL,
	[MontoDesgloseFormaPago] [int] NULL,
	[ClientesPrincipales] [varchar](100) NULL,
	[ContactoCentral] [varchar](100) NULL,
	[ClaEspecializacionProv] [int] NULL,
	[ComentariosEspeciales] [varchar](250) NULL,
	[PaginaInternet] [varchar](100) NULL,
	[PlazoPago] [int] NULL,
	[BajaLogica] [int] NOT NULL,
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL,
	[NombrePcMod] [varchar](64) NOT NULL,
	[ClaUsuarioMod] [int] NOT NULL,
 CONSTRAINT [PK_CmpCatProveedorRefComercial] PRIMARY KEY CLUSTERED 
(
	[ClaCup] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CmpCatProveedorRefFiscal]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CmpCatProveedorRefFiscal](
	[ClaCUP] [int] NOT NULL,
	[RegimenFiscal] [int] NULL,
	[RazonSocial] [int] NULL,
	[ApellidoPaterno] [varchar](50) NULL,
	[ApellidoMaterno] [varchar](50) NULL,
	[NombreFiscal] [varchar](150) NULL,
	[RFC] [varchar](30) NULL,
	[CURP] [varchar](20) NULL,
	[Calle] [varchar](50) NULL,
	[NumeroInterior] [varchar](15) NULL,
	[NumeroExterior] [varchar](15) NULL,
	[CodigoPostal] [int] NULL,
	[ClaColonia] [int] NULL,
	[ClaMunicipio] [int] NULL,
	[ClaEstado] [int] NULL,
	[ClaPais] [int] NULL,
	[ClaMoneda] [int] NULL,
	[EsTasaMultipleIva] [int] NULL,
	[ClaTipoPrestador] [int] NULL,
	[Telefono] [varchar](30) NULL,
	[BajaLogica] [int] NOT NULL,
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL,
	[NombrePcMod] [varchar](64) NOT NULL,
	[ClaUsuarioMod] [int] NOT NULL,
 CONSTRAINT [PK_CmpCatProveedorRefFiscal] PRIMARY KEY CLUSTERED 
(
	[ClaCUP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CmpCatProveedorRefLocal]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CmpCatProveedorRefLocal](
	[ClaUbicacion] [int] NOT NULL,
	[ClaCUP] [int] NOT NULL,
	[Nombre] [varchar](250) NOT NULL,
	[ClaTipoProveedor] [int] NULL,
	[ClaProveedor] [int] NULL,
	[ClaIva] [int] NULL,
	[Calle] [varchar](250) NOT NULL,
	[NumeroInterior] [varchar](25) NULL,
	[NumeroExterior] [varchar](25) NULL,
	[CodigoPostal] [varchar](25) NULL,
	[ClaColonia] [int] NULL,
	[ClaMunicipio] [int] NULL,
	[ClaEstado] [int] NULL,
	[ClaPais] [int] NULL,
	[EsActivo] [int] NULL,
	[EsPenalizable] [int] NULL DEFAULT ((0)),
	[BajaLogica] [int] NOT NULL DEFAULT ((0)),
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL DEFAULT (getdate()),
	[ClaUsuarioMod] [int] NOT NULL,
	[NombrePcMod] [varchar](64) NOT NULL DEFAULT (host_name()),
	[MotivoDesactivacion] [varchar](250) NULL,
	[ClaCalidadProv] [int] NULL,
	[ClaIncoterm] [int] NULL,
	[EsPagoCheque] [int] NOT NULL DEFAULT ((0)),
	[PlazoPago] [int] NULL,
	[EsGeneraPedidosImportacion] [int] NULL DEFAULT ((0)),
 CONSTRAINT [PK_CmpCatProveedorRefLocal] PRIMARY KEY CLUSTERED 
(
	[ClaUbicacion] ASC,
	[ClaCUP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CmpCatTipoDocumento]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CmpCatTipoDocumento](
	[ClaUbicacion] [int] NOT NULL,
	[ClaTipoDocumento] [int] NOT NULL,
	[NomTipoDocumento] [varchar](200) NULL,
	[EsUnico] [int] NOT NULL CONSTRAINT [DF__CmpCatTip__EsUni__5F808FB1]  DEFAULT ((0)),
	[EsRestringido] [int] NOT NULL CONSTRAINT [DF__CmpCatTip__EsRes__6074B3EA]  DEFAULT ((0)),
	[RutaAlmacenaArchivo] [varchar](2000) NOT NULL,
	[RutaAlmacenaHistorico] [varchar](2000) NOT NULL,
	[RutaMuestraArchivo] [varchar](2000) NULL,
	[RutaMuestraHistorico] [varchar](2000) NULL,
	[RutaPorAutorizar] [varchar](250) NULL,
	[BajaLogica] [int] NOT NULL CONSTRAINT [DF__CmpCatTip__BajaL__6168D823]  DEFAULT ((0)),
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL CONSTRAINT [DF__CmpCatTip__Fecha__625CFC5C]  DEFAULT (getdate()),
	[NombrePcMod] [varchar](64) NOT NULL CONSTRAINT [DF__CmpCatTip__Nombr__63512095]  DEFAULT (host_name()),
	[ClaUsuarioMod] [int] NOT NULL,
 CONSTRAINT [PK_CmpCatTipoDocumento] PRIMARY KEY CLUSTERED 
(
	[ClaUbicacion] ASC,
	[ClaTipoDocumento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CmpCatTipoMotivo]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CmpCatTipoMotivo](
	[ClaTipoMotivo] [int] NOT NULL,
	[NombreTipoMotivo] [varchar](250) NOT NULL,
	[BajaLogica] [int] NOT NULL DEFAULT ((0)),
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL DEFAULT (getdate()),
	[NombrePcMod] [varchar](64) NOT NULL,
	[ClaUsuarioMod] [int] NOT NULL,
 CONSTRAINT [PK_CmpCatTipoMotivo] PRIMARY KEY CLUSTERED 
(
	[ClaTipoMotivo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CmpCatTipoPenalizacion]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CmpCatTipoPenalizacion](
	[ClaTipoPenalizacion] [int] NOT NULL,
	[Descripcion] [varchar](250) NOT NULL,
	[BajaLogica] [int] NOT NULL DEFAULT ((0)),
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL DEFAULT (getdate()),
	[NombrePcMod] [varchar](250) NOT NULL DEFAULT (host_name()),
	[ClaUsuarioMod] [int] NOT NULL,
 CONSTRAINT [PK_CmpCatTipoPenalizacion] PRIMARY KEY CLUSTERED 
(
	[ClaTipoPenalizacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CmpCatTipoProveedor]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CmpCatTipoProveedor](
	[ClaTipoProveedor] [int] NOT NULL,
	[NombreTipoProveedor] [varchar](80) NOT NULL,
	[BajaLogica] [int] NOT NULL DEFAULT ((0)),
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NULL DEFAULT (getdate()),
	[ClaUsuarioMod] [int] NOT NULL,
	[NombrePcMod] [varchar](64) NOT NULL DEFAULT (host_name()),
 CONSTRAINT [PK_CmpCatTipoProveedor] PRIMARY KEY CLUSTERED 
(
	[ClaTipoProveedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CmpCatTipoReferencia]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CmpCatTipoReferencia](
	[ClaTipoReferencia] [int] NOT NULL,
	[NomTipoReferencia] [varchar](150) NOT NULL,
	[BajaLogica] [int] NOT NULL DEFAULT ((0)),
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL DEFAULT (getdate()),
	[NombrePcMod] [varchar](64) NOT NULL DEFAULT (host_name()),
	[ClaUsuarioMod] [int] NOT NULL,
 CONSTRAINT [PK_CmpCatTipoReferencia] PRIMARY KEY CLUSTERED 
(
	[ClaTipoReferencia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CmpCatTurno]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CmpCatTurno](
	[ClaUbicacion] [int] NOT NULL,
	[ClaTurno] [int] NOT NULL,
	[Descripcion] [varchar](100) NULL,
	[BajaLogica] [int] NOT NULL,
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL,
	[NombrePcMod] [varchar](64) NOT NULL,
	[ClaUsuarioMod] [int] NOT NULL,
	[HoraEntrada] [varchar](10) NULL,
	[HoraSalida] [varchar](10) NULL,
 CONSTRAINT [PK_CmpCatTurno] PRIMARY KEY CLUSTERED 
(
	[ClaUbicacion] ASC,
	[ClaTurno] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CmpCatValeNegadoPregunta]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CmpCatValeNegadoPregunta](
	[ClaValeNegadoPregunta] [int] NOT NULL,
	[Pregunta] [varchar](400) NOT NULL,
	[BajaLogica] [int] NOT NULL DEFAULT ((0)),
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL DEFAULT (getdate()),
	[NombrePcMod] [varchar](64) NOT NULL DEFAULT (host_name()),
	[ClaUsuarioMod] [int] NOT NULL,
 CONSTRAINT [PK_CmpCatValeNegadoPregunta] PRIMARY KEY CLUSTERED 
(
	[ClaValeNegadoPregunta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CmpEntradaDistCRC]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CmpEntradaDistCRC](
	[ClaUbicacion] [int] NOT NULL,
	[IdEntrada] [int] NOT NULL,
	[IdArticulo] [int] NOT NULL,
	[ClaDireccion] [int] NOT NULL,
	[ClaCrc] [int] NOT NULL,
	[CantidadSurtidaReq] [numeric](22, 8) NULL,
	[FechaUltimaMod] [datetime] NULL,
 CONSTRAINT [PK_CmpEntradaDistCRC] PRIMARY KEY CLUSTERED 
(
	[ClaUbicacion] ASC,
	[IdEntrada] ASC,
	[IdArticulo] ASC,
	[ClaDireccion] ASC,
	[ClaCrc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CmpEntradaDistCRCBkpEMD]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CmpEntradaDistCRCBkpEMD](
	[ClaUbicacion] [int] NOT NULL,
	[IdEntrada] [int] NOT NULL,
	[IdArticulo] [int] NOT NULL,
	[ClaDireccion] [int] NOT NULL,
	[ClaCrc] [int] NOT NULL,
	[CantidadSurtidaReq] [numeric](22, 8) NULL,
	[FechaUltimaMod] [datetime] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CmpRelCompradorFamilia]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CmpRelCompradorFamilia](
	[ClaCompradorFamilia] [int] NOT NULL,
	[ClaUbicacion] [int] NOT NULL,
	[ClaComprador] [int] NOT NULL,
	[ClaFamilia] [int] NOT NULL,
	[BajaLogica] [int] NOT NULL DEFAULT ((0)),
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL DEFAULT (getdate()),
	[ClaUsuarioMod] [int] NOT NULL,
	[NombrePcMod] [varchar](64) NOT NULL DEFAULT (host_name()),
 CONSTRAINT [PK_CmpRelCompradorFam] PRIMARY KEY CLUSTERED 
(
	[ClaCompradorFamilia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [Idx_Unico_CompradorFamilia] UNIQUE NONCLUSTERED 
(
	[ClaComprador] ASC,
	[ClaFamilia] ASC,
	[ClaUbicacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CmpRelDeptoUsuario]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CmpRelDeptoUsuario](
	[ClaUbicacion] [int] NOT NULL,
	[ClaDepartamento] [int] NOT NULL,
	[ClaUsuario] [int] NOT NULL,
	[BajaLogica] [int] NOT NULL DEFAULT ((0)),
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL DEFAULT (getdate()),
	[ClaUsuarioMod] [int] NOT NULL,
	[NombrePcMod] [varchar](64) NOT NULL DEFAULT (host_name()),
 CONSTRAINT [PK_CmpRelDeptoUsuario] PRIMARY KEY CLUSTERED 
(
	[ClaUbicacion] ASC,
	[ClaDepartamento] ASC,
	[ClaUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CmpRelSubSubAlmacenDep]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CmpRelSubSubAlmacenDep](
	[ClaUbicacion] [int] NOT NULL,
	[ClaDepartamento] [int] NOT NULL,
	[ClaAlmacen] [int] NOT NULL,
	[ClaSubAlmacen] [int] NOT NULL,
	[ClaSubSubAlmacen] [int] NOT NULL,
	[BajaLogica] [int] NOT NULL DEFAULT ((0)),
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL DEFAULT (getdate()),
	[NombrePcMod] [varchar](64) NOT NULL DEFAULT (host_name()),
	[ClaUsuarioMod] [int] NOT NULL,
 CONSTRAINT [PK_CmpRelSubSubAlmacenDep] PRIMARY KEY CLUSTERED 
(
	[ClaUbicacion] ASC,
	[ClaDepartamento] ASC,
	[ClaAlmacen] ASC,
	[ClaSubAlmacen] ASC,
	[ClaSubSubAlmacen] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CmpRelTipoProvMoneda]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CmpRelTipoProvMoneda](
	[ClaTipoProveedor] [int] NOT NULL,
	[ClaMoneda] [int] NOT NULL,
	[BajaLogica] [int] NOT NULL DEFAULT ((0)),
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL DEFAULT (getdate()),
	[NombrePcMod] [varchar](64) NOT NULL DEFAULT (host_name()),
	[ClaUsuarioMod] [int] NOT NULL,
 CONSTRAINT [PK_CmpRelTipoProvMoneda] PRIMARY KEY CLUSTERED 
(
	[ClaTipoProveedor] ASC,
	[ClaMoneda] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ConCatBeneficiario]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ConCatBeneficiario](
	[ClaEmpresa] [int] NOT NULL,
	[ClaBeneficiario] [int] NOT NULL,
	[ClaPolizaGrupo] [int] NOT NULL,
	[ClaTipoBeneficiario] [int] NOT NULL,
	[NumeroBeneficiario] [int] NOT NULL,
	[NombreBeneficiario] [char](80) NOT NULL,
	[ClaEstatusBeneficiario] [int] NOT NULL,
	[BajaLogica] [int] NOT NULL CONSTRAINT [DF_ConCatBeneficiario_BajaLogica]  DEFAULT ((0)),
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NULL CONSTRAINT [DF_ConCatBeneficiario_FechaUltimaMod]  DEFAULT (getdate()),
	[NombrePcMod] [varchar](64) NULL,
	[ClaUsuarioMod] [int] NULL,
	[FechaIns] [datetime] NULL CONSTRAINT [DF_ConCatBeneficiario_FechaIns]  DEFAULT (getdate()),
	[ClaUsuarioIns] [int] NULL,
	[ClaCUP] [int] NULL,
 CONSTRAINT [PK_ConCatBeneficiario] PRIMARY KEY CLUSTERED 
(
	[ClaEmpresa] ASC,
	[ClaBeneficiario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ConCatBeneTransfer]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ConCatBeneTransfer](
	[ClaEmpresa] [int] NOT NULL,
	[ClaBeneficiario] [int] NOT NULL,
	[VoBo] [int] NOT NULL,
	[ClaCuentaBanco] [int] NOT NULL,
	[CuentaMail] [varchar](60) NULL,
	[BajaLogica] [int] NULL,
	[FechaBajaLogica] [datetime] NULL,
	[NombrePcMod] [varchar](64) NULL,
	[FechaUltimaMod] [datetime] NOT NULL,
	[ClaUsuarioMod] [int] NULL,
	[FechaIns] [datetime] NULL,
	[ClaUsuarioIns] [int] NULL,
	[ReferenciaConvenio] [varchar](40) NULL,
	[ConceptoConvenio] [varchar](40) NULL,
	[ReferenciaBancaria] [varchar](40) NULL,
	[Referencia1] [varchar](40) NULL,
	[Referencia2] [varchar](40) NULL,
	[Referencia3] [varchar](40) NULL,
	[ClaDepartamento] [int] NULL,
 CONSTRAINT [PK_c_bene_dpto] PRIMARY KEY NONCLUSTERED 
(
	[ClaBeneficiario] ASC,
	[ClaCuentaBanco] ASC,
	[ClaEmpresa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ConCatClasificacionCuenta]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ConCatClasificacionCuenta](
	[ClaClasificacionCuenta] [int] NOT NULL,
	[NombreClasificacionCuenta] [char](30) NULL,
	[BajaLogica] [int] NOT NULL CONSTRAINT [DF_ConCatClasificacionCuenta_BajaLogica]  DEFAULT ((0)),
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL CONSTRAINT [DF_ConCatClasificacionCuenta_FechaUltimaMod]  DEFAULT (getdate()),
	[NombrePcMod] [varchar](64) NULL,
	[ClaUsuarioMod] [int] NULL,
	[FechaIns] [datetime] NULL CONSTRAINT [DF_ConCatClasificacionCuenta_FechaIns]  DEFAULT (getdate()),
	[ClaUsuarioIns] [int] NULL,
 CONSTRAINT [PK_ConCatClasificacionCuenta] PRIMARY KEY CLUSTERED 
(
	[ClaClasificacionCuenta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ConCatColoniaCon]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ConCatColoniaCon](
	[ClaPaisCon] [int] NOT NULL,
	[ClaEstadoCon] [int] NOT NULL,
	[ClaMunicipioCon] [int] NOT NULL,
	[ClaColoniaCon] [int] NOT NULL,
	[NombreColoniaCon] [varchar](80) NULL,
	[BajaLogica] [int] NOT NULL CONSTRAINT [DF_ConCatColoniaCon_BajaLogica]  DEFAULT ((0)),
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL CONSTRAINT [DF_ConCatColoniaCon_FechaUltimaMod]  DEFAULT (getdate()),
	[NombrePcMod] [varchar](64) NULL,
	[ClaUsuarioMod] [int] NULL,
	[FechaIns] [datetime] NULL CONSTRAINT [DF_ConCatColoniaCon_FechaIns]  DEFAULT (getdate()),
	[ClaUsuarioIns] [int] NULL,
	[CodigoPostal] [varchar](30) NULL,
 CONSTRAINT [PK_ConCatColoniaCon] PRIMARY KEY CLUSTERED 
(
	[ClaPaisCon] ASC,
	[ClaEstadoCon] ASC,
	[ClaMunicipioCon] ASC,
	[ClaColoniaCon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ConCatCrc]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ConCatCrc](
	[ClaCrc] [int] NOT NULL,
	[ClaClasificacionCrc] [int] NOT NULL,
	[ClaClasificacionCuenta] [int] NULL,
	[NombreCrc] [varchar](60) NULL,
	[ClaTipoCrc] [int] NULL,
	[ClaDireccionPadre] [int] NULL,
	[ClaCrcPadre] [int] NULL,
	[EsAutorizado] [int] NULL CONSTRAINT [DF_ConCatCrc_Autorizado]  DEFAULT ((0)),
	[BajaLogica] [int] NULL CONSTRAINT [DF_ConCatCrc_BajaLogica]  DEFAULT ((0)),
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NULL CONSTRAINT [DF_ConCatCrc_FechaUltimaMod]  DEFAULT (getdate()),
	[NombrePcMod] [varchar](64) NULL,
	[ClaUsuarioMod] [int] NULL,
	[FechaIns] [datetime] NULL,
	[ClaUsuarioIns] [int] NULL,
 CONSTRAINT [PK_ConCatCrc] PRIMARY KEY CLUSTERED 
(
	[ClaCrc] ASC,
	[ClaClasificacionCrc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ConCatCrcDireccion]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ConCatCrcDireccion](
	[ClaEmpresa] [int] NOT NULL,
	[ClaDireccion] [varchar](4) NOT NULL,
	[ClaCrc] [int] NOT NULL,
	[Responsable] [int] NULL,
	[BajaLogica] [int] NOT NULL,
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL DEFAULT (getdate()),
	[NombrePcMod] [varchar](64) NOT NULL DEFAULT (host_name()),
	[ClaUsuarioMod] [int] NOT NULL,
	[IdUsuarioResponsable] [int] NULL,
 CONSTRAINT [PKConCatDireccionCrc] PRIMARY KEY CLUSTERED 
(
	[ClaEmpresa] ASC,
	[ClaDireccion] ASC,
	[ClaCrc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ConCatCuenta]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ConCatCuenta](
	[ClaEmpresa] [int] NOT NULL,
	[ClaCuenta] [char](16) NOT NULL,
	[ClaClasificacionCuenta] [int] NOT NULL,
	[ClaTipoCtrlGasto] [int] NULL,
	[NombreCuenta] [char](40) NOT NULL,
	[ClaCuentaPadre] [char](16) NULL,
	[EsNivelAfectable] [int] NOT NULL,
	[BajaLogica] [int] NOT NULL CONSTRAINT [DF_ConCatCuenta_BajaLogica]  DEFAULT ((0)),
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL CONSTRAINT [DF_ConCatCuenta_FechaUltimaMod]  DEFAULT (getdate()),
	[NombrePcMod] [varchar](64) NULL,
	[ClaUsuarioMod] [int] NULL,
	[FechaIns] [datetime] NULL CONSTRAINT [DF_ConCatCuenta_FechaIns]  DEFAULT (getdate()),
	[ClaUsuarioIns] [int] NULL,
 CONSTRAINT [PK_ConCatCuenta] PRIMARY KEY CLUSTERED 
(
	[ClaEmpresa] ASC,
	[ClaCuenta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ConCatDepartamento]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ConCatDepartamento](
	[ClaDepartamento] [int] NOT NULL,
	[ClaEmpresa] [int] NOT NULL,
	[NomDepartamento] [varchar](50) NOT NULL,
	[BajaLogica] [int] NOT NULL DEFAULT ((0)),
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL DEFAULT (getdate()),
	[NombrePcMod] [varchar](64) NOT NULL DEFAULT (host_name()),
	[ClaUsuarioMod] [int] NOT NULL,
	[ClaBeneficiario] [int] NULL,
	[ClaDireccion] [char](4) NULL,
 CONSTRAINT [PKConCatDepartamento] PRIMARY KEY CLUSTERED 
(
	[ClaDepartamento] ASC,
	[ClaEmpresa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ConCatDireccion]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ConCatDireccion](
	[ClaDireccion] [char](4) NOT NULL,
	[ClaArea] [int] NULL,
	[NombreDireccion] [varchar](80) NULL,
	[ClaEmpresa] [int] NOT NULL,
	[ClaUbicacion] [int] NOT NULL,
	[EsAutorizado] [tinyint] NULL,
	[BajaLogica] [int] NOT NULL CONSTRAINT [DF_ConCatDireccion_BajaLogica]  DEFAULT ((0)),
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL CONSTRAINT [DF_ConCatDireccion_FechaUltimaMod]  DEFAULT (getdate()),
	[NombrePcMod] [varchar](64) NULL,
	[ClaUsuarioMod] [int] NULL,
	[FechaIns] [datetime] NULL CONSTRAINT [DF_ConCatDireccion_FechaIns]  DEFAULT (getdate()),
	[ClaUsuarioIns] [int] NULL,
 CONSTRAINT [PK_ConCatDireccion] PRIMARY KEY CLUSTERED 
(
	[ClaDireccion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ConCatDireccionCrcGasto]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ConCatDireccionCrcGasto](
	[ClaEmpresa] [int] NOT NULL,
	[ClaDireccion] [char](4) NOT NULL,
	[ClaClasificacionCuenta] [int] NOT NULL,
	[ClaCrc] [int] NOT NULL,
	[ClaTipoGasto] [varchar](4) NOT NULL,
	[ClaCuenta3] [char](16) NULL,
	[ClaCuenta4] [char](16) NULL,
	[EsAutorizado] [tinyint] NULL,
	[BajaLogica] [int] NOT NULL CONSTRAINT [DF_ConCatDireccionCrcGasto_BajaLogica]  DEFAULT ((0)),
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL CONSTRAINT [DF_ConCatDireccionCrcGasto_FechaUltimaMod]  DEFAULT (getdate()),
	[NombrePcMod] [varchar](64) NULL,
	[ClaUsuarioMod] [int] NULL,
	[FechaIns] [datetime] NULL CONSTRAINT [DF_ConCatDireccionCrcGasto_FechaIns]  DEFAULT (getdate()),
	[ClaUsuarioIns] [int] NULL,
 CONSTRAINT [PK_ConCatDireccionCrcGasto] PRIMARY KEY CLUSTERED 
(
	[ClaEmpresa] ASC,
	[ClaDireccion] ASC,
	[ClaClasificacionCuenta] ASC,
	[ClaCrc] ASC,
	[ClaTipoGasto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ConCatEmpresa]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ConCatEmpresa](
	[ClaEmpresa] [smallint] NOT NULL,
	[NombreEmpresa] [varchar](80) NOT NULL,
	[DescEmpresa] [varchar](100) NOT NULL,
	[ClaRfc] [varchar](20) NOT NULL,
	[NomBaseDatos] [varchar](50) NULL,
	[ClaEmpresaVtas] [smallint] NULL,
	[ClaMoneda] [smallint] NOT NULL,
	[BajaLogica] [int] NULL,
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NULL,
	[BaseDatosGP] [varchar](50) NULL,
	[Logotipo] [image] NULL,
	[DireccionFiscal] [varchar](255) NULL,
	[Telefono] [varchar](50) NULL,
 CONSTRAINT [PKConCatEmpresa] PRIMARY KEY NONCLUSTERED 
(
	[ClaEmpresa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ConCatEmpresadb]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ConCatEmpresadb](
	[ClaEmpresa] [int] NULL,
	[NombreBDConta] [varchar](20) NULL,
	[BajaLogica] [int] NULL,
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NULL,
	[FechaIns] [datetime] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ConCatEstadoCon]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ConCatEstadoCon](
	[ClaPaisCon] [int] NOT NULL,
	[ClaEstadoCon] [int] NOT NULL,
	[NombreEstadoCon] [varchar](40) NOT NULL,
	[BajaLogica] [int] NOT NULL CONSTRAINT [DF_ConCatEstadoCon_BajaLogica]  DEFAULT ((0)),
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL CONSTRAINT [DF_ConCatEstadoCon_FechaUltimaMod]  DEFAULT (getdate()),
	[NombrePcMod] [varchar](64) NULL,
	[ClaUsuarioMod] [int] NULL,
	[FechaIns] [datetime] NULL CONSTRAINT [DF_ConCatEstadoCon_FechaIns]  DEFAULT (getdate()),
	[ClaUsuarioIns] [int] NULL,
 CONSTRAINT [PK_ConCatEstadoCon] PRIMARY KEY CLUSTERED 
(
	[ClaPaisCon] ASC,
	[ClaEstadoCon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ConCatEstatusTramite]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ConCatEstatusTramite](
	[ClaEstatusTramite] [int] NOT NULL,
	[NomEstatusTramite] [varchar](50) NOT NULL,
	[NomEstatusExterno] [varchar](50) NOT NULL,
	[BajaLogica] [int] NOT NULL,
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL,
	[NombrePcMod] [varchar](50) NOT NULL,
	[ClaUsuarioMod] [int] NOT NULL,
	[EsCancelable] [bit] NULL,
 CONSTRAINT [PK_ConCatEstatusTramite] PRIMARY KEY CLUSTERED 
(
	[ClaEstatusTramite] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ConCatGpoAsigCrcDir]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ConCatGpoAsigCrcDir](
	[ClaEmpresa] [int] NOT NULL,
	[ClaDireccion] [varchar](4) NOT NULL,
	[ClaCrc] [int] NOT NULL,
	[ClaGrupoAsignacion] [int] NOT NULL,
	[BajaLogica] [int] NOT NULL DEFAULT ((0)),
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL DEFAULT (getdate()),
	[NombrePcMod] [varchar](64) NOT NULL DEFAULT (host_name()),
	[ClaUsuarioMod] [int] NOT NULL,
 CONSTRAINT [PKConCatGpoAsigCrcDir] PRIMARY KEY CLUSTERED 
(
	[ClaEmpresa] ASC,
	[ClaDireccion] ASC,
	[ClaCrc] ASC,
	[ClaGrupoAsignacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ConCatGpoPoliza]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ConCatGpoPoliza](
	[ClaGpoPoliza] [int] NOT NULL,
	[ClaDireccion] [int] NOT NULL,
	[NomGpoPoliza] [varchar](50) NOT NULL,
	[ClaGpoPolizaContrapartida] [int] NULL,
	[ClaTrabajadorEUNResponsable] [int] NOT NULL,
	[EsPorConfirmarResponsable] [tinyint] NOT NULL,
	[EsContrapartida] [tinyint] NOT NULL,
	[BajaLogica] [tinyint] NOT NULL,
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL,
	[ClaUsuarioMod] [int] NOT NULL,
	[NombrePcMod] [varchar](64) NOT NULL,
	[ClaBeneficiario] [int] NULL,
 CONSTRAINT [PK_ConCatGpoPoliza] PRIMARY KEY CLUSTERED 
(
	[ClaGpoPoliza] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ConCatGrupoAsignacion]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ConCatGrupoAsignacion](
	[ClaEmpresa] [int] NOT NULL,
	[ClaGrupoAsignacion] [int] NOT NULL,
	[NombreGrupoAsignacion] [char](40) NULL,
	[ClaTipoAsignacion] [int] NULL,
	[EsAutorizado] [tinyint] NULL,
	[BajaLogica] [int] NULL CONSTRAINT [DF_ConCatGrupoAsignacion_BajaLogica]  DEFAULT ((0)),
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NULL CONSTRAINT [DF_ConCatGrupoAsignacion_FechaUltimaMod]  DEFAULT (getdate()),
	[NombrePcMod] [varchar](64) NULL,
	[ClaUsuarioMod] [int] NULL,
	[FechaIns] [datetime] NULL CONSTRAINT [DF_ConCatGrupoAsignacion_FechaIns]  DEFAULT (getdate()),
	[ClaUsuarioIns] [int] NULL,
	[Referencia1] [char](18) NULL,
 CONSTRAINT [PK_ConCatGrupoAsignacion_1] PRIMARY KEY NONCLUSTERED 
(
	[ClaGrupoAsignacion] ASC,
	[ClaEmpresa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ConCatMunicipioCon]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ConCatMunicipioCon](
	[ClaPaisCon] [int] NOT NULL,
	[ClaEstadoCon] [int] NOT NULL,
	[ClaMunicipioCon] [int] NOT NULL,
	[NombreMunicipioCon] [varchar](40) NOT NULL,
	[BajaLogica] [int] NOT NULL CONSTRAINT [DF_ConCatMunicipioCon_BajaLogica]  DEFAULT ((0)),
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL CONSTRAINT [DF_ConCatMunicipioCon_FechaUltimaMod]  DEFAULT (getdate()),
	[NombrePcMod] [varchar](64) NULL,
	[ClaUsuarioMod] [int] NULL,
	[FechaIns] [datetime] NULL CONSTRAINT [DF_ConCatMunicipioCon_FechaIns]  DEFAULT (getdate()),
	[ClaUsuarioIns] [int] NULL,
	[PorcentajeIva] [numeric](5, 2) NULL,
 CONSTRAINT [PK_ConCatMunicipioCon] PRIMARY KEY CLUSTERED 
(
	[ClaPaisCon] ASC,
	[ClaEstadoCon] ASC,
	[ClaMunicipioCon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ConCatPaisCon]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ConCatPaisCon](
	[ClaPaisCon] [int] NOT NULL,
	[NombrePaisCon] [char](40) NOT NULL,
	[BajaLogica] [int] NOT NULL CONSTRAINT [DF_ConCatPaisCon_BajaLogica]  DEFAULT ((0)),
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL CONSTRAINT [DF_ConCatPaisCon_FechaUltimaMod]  DEFAULT (getdate()),
	[NombrePcMod] [varchar](64) NULL,
	[ClaUsuarioMod] [int] NULL,
	[FechaIns] [datetime] NULL CONSTRAINT [DF_ConCatPaisCon_FechaIns]  DEFAULT (getdate()),
	[ClaUsuarioIns] [int] NULL,
 CONSTRAINT [PK_ConCatPaisCon] PRIMARY KEY CLUSTERED 
(
	[ClaPaisCon] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ConCatParidad]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ConCatParidad](
	[FechaParidad] [datetime] NOT NULL,
	[ClaMoneda] [int] NOT NULL,
	[ParidadMonedaPeso] [numeric](19, 6) NULL,
	[ParidadMonedaDolar] [numeric](19, 6) NULL,
	[BajaLogica] [int] NOT NULL CONSTRAINT [DF_ConCatParidad_BajaLogica]  DEFAULT ((0)),
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL CONSTRAINT [DF_ConCatParidad_FechaUltimaMod]  DEFAULT (getdate()),
	[FechaIns] [datetime] NOT NULL CONSTRAINT [DF_ConCatParidad_FechaIns]  DEFAULT (getdate()),
	[ParidadDolarMon] [numeric](19, 6) NULL,
 CONSTRAINT [PK_ConCatParidad] PRIMARY KEY CLUSTERED 
(
	[FechaParidad] ASC,
	[ClaMoneda] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ConCatTipoCrc]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ConCatTipoCrc](
	[ClaTipoCrc] [int] NOT NULL,
	[NombreTipoCrc] [varchar](50) NULL,
	[BajaLogica] [int] NOT NULL,
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL,
	[FechaIns] [datetime] NULL,
	[UtilizaGpoAsignacion] [bit] NULL,
 CONSTRAINT [PK_ClaTipoCRC] PRIMARY KEY NONCLUSTERED 
(
	[ClaTipoCrc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ConCatTipoGasto]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ConCatTipoGasto](
	[ClaEmpresa] [int] NOT NULL,
	[ClaTipoGasto] [int] NOT NULL,
	[NombreTipoGasto] [varchar](40) NOT NULL,
	[EsAutorizado] [int] NULL,
	[BajaLogica] [int] NULL DEFAULT ((0)),
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NULL DEFAULT (getdate()),
	[NombrePcMod] [varchar](64) NULL,
	[ClaUsuarioMod] [int] NULL,
	[FechaIns] [datetime] NULL DEFAULT (getdate()),
	[ClaUsuarioIns] [int] NULL,
 CONSTRAINT [PK_ConCatTipoGasto_1] PRIMARY KEY CLUSTERED 
(
	[ClaEmpresa] ASC,
	[ClaTipoGasto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ConCatTipoGastoProyecto]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ConCatTipoGastoProyecto](
	[ClaTipoGasto] [int] NOT NULL,
	[ClaEmpresa] [int] NOT NULL,
	[NomTipoGasto] [varchar](50) NOT NULL,
	[BajaLogica] [int] NOT NULL CONSTRAINT [DF__ConCatTip__BajaL__1C53C870]  DEFAULT ((0)),
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL CONSTRAINT [DF__ConCatTip__Fecha__1D47ECA9]  DEFAULT (getdate()),
	[NombrePcMod] [varchar](64) NOT NULL CONSTRAINT [DF__ConCatTip__Nombr__1E3C10E2]  DEFAULT (host_name()),
	[ClaUsuarioMod] [int] NOT NULL,
 CONSTRAINT [PKConCatTipoGastoProyecto] PRIMARY KEY CLUSTERED 
(
	[ClaTipoGasto] ASC,
	[ClaEmpresa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ConCatTipoRegistro]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ConCatTipoRegistro](
	[ClaTipoRegistro] [int] NOT NULL,
	[NomTipoRegistro] [varchar](50) NOT NULL,
	[EsProveedor] [bit] NOT NULL CONSTRAINT [DF__ConCatTip__EsPro__1650D657]  DEFAULT ((0)),
	[EsControl] [bit] NOT NULL CONSTRAINT [DF__ConCatTip__EsCon__1744FA90]  DEFAULT ((0)),
	[BajaLogica] [int] NOT NULL CONSTRAINT [DF__ConCatTip__BajaL__18391EC9]  DEFAULT ((0)),
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL CONSTRAINT [DF__ConCatTip__Fecha__192D4302]  DEFAULT (getdate()),
	[NombrePcMod] [varchar](64) NOT NULL CONSTRAINT [DF__ConCatTip__Nombr__1A21673B]  DEFAULT (host_name()),
	[ClaUsuarioMod] [int] NOT NULL,
	[EsEnLineaEnCierre] [bit] NULL,
	[ClaFlujo] [int] NULL,
 CONSTRAINT [PKConCatTipoRegistro] PRIMARY KEY CLUSTERED 
(
	[ClaTipoRegistro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ConCatTipoTramite]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ConCatTipoTramite](
	[ClaTipoTramite] [int] NOT NULL,
	[NomTipoTramite] [varchar](80) NULL,
	[DescTipoTramite] [varchar](150) NULL,
	[EsPago] [bit] NOT NULL,
	[EsEnLinea] [bit] NOT NULL,
	[VigenciaEnLinea] [datetime] NULL,
	[EsReqComprobanteFiscal] [bit] NOT NULL,
	[ClaContabilidad] [int] NULL,
	[ClaTipoPoliza] [int] NULL,
	[ClaClasificacionPoliza] [int] NULL,
	[ClaEstatusTipoTramite] [int] NULL,
	[EsBloqueo] [bit] NULL,
	[EsManual] [bit] NULL,
	[BajaLogica] [int] NOT NULL,
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL,
	[NombrePcMod] [varchar](64) NOT NULL,
	[ClaUsuarioMod] [int] NOT NULL,
	[AutorizaCancelacion] [tinyint] NULL,
	[Comentarios] [varchar](255) NULL,
	[IdAutorizacion] [int] NULL,
	[EsRespetaFechaElaboracion] [tinyint] NULL,
 CONSTRAINT [PK_ConCatTipoTramite] PRIMARY KEY CLUSTERED 
(
	[ClaTipoTramite] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ConRelBeneficiarioDatosPago]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ConRelBeneficiarioDatosPago](
	[ClaEmpresa] [int] NOT NULL,
	[ClaBeneficiario] [int] NOT NULL,
	[ClaMoneda] [int] NOT NULL,
	[ClasificacionBeneficiario] [tinyint] NULL,
	[NumeroCuenta] [varchar](40) NULL,
	[NumeroBanco] [int] NULL,
	[EsAutorizado] [int] NULL,
	[BajaLogica] [int] NOT NULL CONSTRAINT [DF_ConRelBeneficiarioDatosPago_BajaLogica]  DEFAULT ((0)),
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL CONSTRAINT [DF_ConRelBeneficiarioDatosPago_FechaUltimaMod]  DEFAULT (getdate()),
	[NombrePcMod] [varchar](64) NULL,
	[ClaUsuarioMod] [int] NULL,
	[FechaIns] [datetime] NULL CONSTRAINT [DF_ConRelBeneficiarioDatosPago_FechaIns]  DEFAULT (getdate()),
	[ClaUsuarioIns] [int] NULL,
	[tipocuenta] [int] NULL,
 CONSTRAINT [PK_ConRelBeneficiarioDatosPago] PRIMARY KEY CLUSTERED 
(
	[ClaEmpresa] ASC,
	[ClaBeneficiario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CseCatPuntoControl]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CseCatPuntoControl](
	[claPuntoControl] [int] NOT NULL,
	[claTipoEvento] [int] NOT NULL,
	[nombrePuntoControl] [varchar](200) NOT NULL,
	[nombreCortoPuntoControl] [char](20) NOT NULL,
	[claPuntoControlDependo] [int] NULL,
	[orden] [int] NOT NULL,
	[diasDuracion] [int] NOT NULL,
	[diasTolerancia] [int] NOT NULL,
	[esBrincable] [int] NOT NULL,
	[esAutomatico] [int] NOT NULL,
	[claAlertaAtraso] [int] NULL,
	[claAlertaSuceso] [int] NULL,
	[leyendaRef1] [char](20) NULL,
	[leyendaRef2] [char](20) NULL,
	[leyendaRef3] [char](20) NULL,
	[leyendaRef4] [char](20) NULL,
	[leyendaRef5] [char](20) NULL,
	[claObjetoPantalla] [int] NULL,
	[BajaLogica] [int] NULL,
	[fechaIns] [datetime] NOT NULL,
	[fechaUltimaMod] [datetime] NOT NULL,
	[fechaBajaLogica] [datetime] NULL,
	[nombrePCMod] [varchar](64) NULL,
	[claUsuarioIns] [int] NOT NULL,
	[claUsuarioMod] [int] NOT NULL,
 CONSTRAINT [PK_cseCatPuntoControl] PRIMARY KEY CLUSTERED 
(
	[claPuntoControl] ASC,
	[claTipoEvento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CseCatTipoEvento]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CseCatTipoEvento](
	[claTipoEvento] [int] NOT NULL,
	[claSistema] [int] NOT NULL,
	[nombreTipoEvento] [varchar](200) NOT NULL,
	[leyendaRef1] [char](20) NULL,
	[leyendaRef2] [char](20) NULL,
	[leyendaRef3] [char](20) NULL,
	[leyendaRef4] [char](20) NULL,
	[leyendaRef5] [char](20) NULL,
	[leyendaRef6] [char](20) NULL,
	[leyendaRef7] [char](20) NULL,
	[leyendaRef8] [char](20) NULL,
	[leyendaRef9] [char](20) NULL,
	[leyendaRef10] [char](20) NULL,
	[claAlertaSuceso] [int] NULL,
	[claAlertaErrores] [int] NULL,
	[claObjetoPantalla] [int] NULL,
	[BajaLogica] [int] NOT NULL,
	[fechaIns] [datetime] NOT NULL,
	[fechaUltimaMod] [datetime] NOT NULL,
	[fechaBajaLogica] [datetime] NULL,
	[nombrePCMod] [char](20) NULL,
	[claUsuarioIns] [int] NOT NULL,
	[claUsuarioMod] [int] NOT NULL,
 CONSTRAINT [PK_cseCatTipoEvento] PRIMARY KEY CLUSTERED 
(
	[claTipoEvento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CtsCatGpoProceso]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CtsCatGpoProceso](
	[ClaGpoProceso] [int] NOT NULL,
	[DescGpoProceso] [varchar](60) NULL,
	[AfectableSN] [int] NULL,
 CONSTRAINT [PK_CtsCatGpoProceso] PRIMARY KEY CLUSTERED 
(
	[ClaGpoProceso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CtsTraMaterialGastosTons]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CtsTraMaterialGastosTons](
	[ClaUbicacion] [int] NOT NULL,
	[AnioMes] [int] NOT NULL,
	[ClaUbicacionOrigen] [int] NOT NULL,
	[ClaTipo] [int] NOT NULL,
	[ComprasNacImptPat] [int] NOT NULL,
	[KilosMaterial] [numeric](18, 2) NOT NULL,
	[ImporteMaterial] [numeric](18, 2) NOT NULL,
	[FechaUltimaMod] [datetime] NOT NULL,
 CONSTRAINT [PK_CtsTraMaterialGastosTons] PRIMARY KEY CLUSTERED 
(
	[ClaUbicacion] ASC,
	[AnioMes] ASC,
	[ClaUbicacionOrigen] ASC,
	[ClaTipo] ASC,
	[ComprasNacImptPat] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[CupCatEstatusProveedor]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CupCatEstatusProveedor](
	[ClaEstatusProveedor] [int] NOT NULL,
	[NomEstatusProveedor] [varchar](50) NULL,
	[BajaLogica] [tinyint] NOT NULL DEFAULT ((0)),
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL DEFAULT (getdate()),
	[NombrePcMod] [varchar](64) NOT NULL DEFAULT (host_name()),
	[ClaUsuarioMod] [int] NOT NULL DEFAULT ((0)),
 CONSTRAINT [PK_CupCatEstatusProveedor] PRIMARY KEY CLUSTERED 
(
	[ClaEstatusProveedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CupCatEstatusSolicitud]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CupCatEstatusSolicitud](
	[ClaEstatusSolicitud] [int] NOT NULL,
	[NomEstatusSolicitud] [varchar](50) NULL,
	[BajaLogica] [tinyint] NOT NULL DEFAULT ((0)),
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL DEFAULT (getdate()),
	[NombrePcMod] [varchar](64) NOT NULL DEFAULT (host_name()),
	[ClaUsuarioMod] [int] NOT NULL DEFAULT ((0)),
 CONSTRAINT [PK_CupCatEstatusSolicitud] PRIMARY KEY CLUSTERED 
(
	[ClaEstatusSolicitud] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CupCatProveedor]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CupCatProveedor](
	[ClaCup] [int] NOT NULL,
	[ClaveCup] [int] NULL,
	[RFC] [varchar](30) NOT NULL,
	[NomCup] [varchar](150) NOT NULL,
	[ApPaterno] [varchar](50) NULL,
	[ApMaterno] [varchar](50) NULL,
	[Curp] [varchar](18) NULL,
	[Calle] [varchar](50) NULL,
	[NoInt] [varchar](15) NULL,
	[NoExt] [varchar](15) NULL,
	[ClaColoniaCon] [int] NULL,
	[ClaMunicipioCon] [int] NULL,
	[ClaEstadoCon] [int] NULL,
	[ClaPaisCon] [int] NULL,
	[CodigoPostal] [varchar](20) NULL,
	[Telefono] [varchar](30) NULL,
	[EsExtranjero] [tinyint] NULL,
	[ClaTipoPersona] [int] NULL,
	[ClaTipoProveedor] [int] NULL,
	[DiasPago] [varchar](15) NULL,
	[PlazoPago] [int] NULL,
	[ClaIva] [int] NULL,
	[Dpp] [numeric](22, 2) NULL,
	[NomContacto] [varchar](150) NULL,
	[DireccionContacto] [varchar](250) NULL,
	[TelefonoContacto] [varchar](30) NULL,
	[EmailContacto] [varchar](60) NULL,
	[ClaEstatusProveedor] [int] NULL,
	[EsAutorizadoSat] [tinyint] NULL,
	[EsRevisado] [tinyint] NULL DEFAULT ((0)),
	[FechaValidacionFiscal] [datetime] NULL,
	[ResponsableFiscal] [varchar](150) NULL,
	[IdAutorizacion] [int] NULL,
	[BajaLogica] [tinyint] NOT NULL DEFAULT ((0)),
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL DEFAULT (getdate()),
	[NombrePcMod] [varchar](64) NOT NULL DEFAULT (host_name()),
	[ClaUsuarioMod] [int] NULL,
 CONSTRAINT [PK_CupCatProveedor] PRIMARY KEY CLUSTERED 
(
	[ClaCup] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CupCatTipoBloqueo]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CupCatTipoBloqueo](
	[ClaTipoBloqueo] [int] NOT NULL,
	[NomTipoBloqueo] [varchar](50) NULL,
	[BajaLogica] [tinyint] NOT NULL DEFAULT ((0)),
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL DEFAULT (getdate()),
	[NombrePcMod] [varchar](64) NOT NULL DEFAULT (host_name()),
	[ClaUsuarioMod] [int] NULL DEFAULT ((0)),
 CONSTRAINT [PK_CupCatTipoBloqueo] PRIMARY KEY CLUSTERED 
(
	[ClaTipoBloqueo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[CupCatTipoFactura]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[CupCatTipoFactura](
	[ClaTipoFactura] [int] NOT NULL,
	[NomTipoFactura] [varchar](50) NULL,
	[BajaLogica] [tinyint] NOT NULL DEFAULT ((0)),
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL DEFAULT (getdate()),
	[NombrePcMod] [varchar](64) NOT NULL DEFAULT (host_name()),
	[ClaUsuarioMod] [int] NOT NULL DEFAULT ((0)),
 CONSTRAINT [PK_CupCatTipoFactura] PRIMARY KEY CLUSTERED 
(
	[ClaTipoFactura] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ExpBitEnvioPedido]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ExpBitEnvioPedido](
	[ClaUbicacion] [int] NOT NULL,
	[IdPedido] [int] NOT NULL,
	[IdEnvio] [int] NOT NULL,
	[NumeroFactura] [varchar](50) NULL,
	[FechaFactura] [datetime] NULL,
	[NombrePcMod] [varchar](64) NULL,
	[ClaUsuarioMod] [int] NULL,
	[FechaUltimaMod] [datetime] NULL CONSTRAINT [DF_ExpTraEnvioPedido_FechaUltimaMod]  DEFAULT (getdate())
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ExpCatAeropuerto]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ExpCatAeropuerto](
	[ClaAeropuerto] [int] NOT NULL,
	[Codigo] [varchar](3) NULL,
	[Nombre] [varchar](150) NULL,
	[Descripcion] [varchar](200) NULL,
	[BajaLogica] [tinyint] NULL CONSTRAINT [DF_ExpCatAeropuerto_bajaLogica]  DEFAULT ((0)),
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NULL CONSTRAINT [DF_ExpCatAeropuerto_FechaUltimaMod]  DEFAULT (getdate()),
	[ClaUsuarioMod] [int] NULL,
	[NombrePcMod] [varchar](64) NULL,
	[ClaCiudad] [int] NULL,
	[ClaEstado] [int] NULL,
	[ClaPais] [int] NULL,
 CONSTRAINT [PK_ExpCatAeropuerto] PRIMARY KEY CLUSTERED 
(
	[ClaAeropuerto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ExpCatIncoterm]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ExpCatIncoterm](
	[ClaIncoterm] [int] NOT NULL,
	[NombreIncoterm] [varchar](50) NULL,
	[DescIncoterm] [varchar](200) NULL,
	[BajaLogica] [tinyint] NULL CONSTRAINT [DF_ExpCatIncoterm_bajaLogica]  DEFAULT ((0)),
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL CONSTRAINT [DF_ExpCatIncoterm_FechaUltimaMod]  DEFAULT (getdate()),
	[ClaUsuarioMod] [int] NULL,
	[NombrePcMod] [varchar](64) NULL CONSTRAINT [DF_ExpCatIncoterm_NombrePcMod]  DEFAULT (host_name()),
	[ContieneEmbarque] [tinyint] NULL DEFAULT ((0)),
	[ContieneTrafico] [tinyint] NULL DEFAULT ((0)),
	[ContienePedido] [tinyint] NULL DEFAULT ((0)),
	[EnviarAgrupado] [tinyint] NULL DEFAULT ((0)),
 CONSTRAINT [PK_expCatIncoterm] PRIMARY KEY CLUSTERED 
(
	[ClaIncoterm] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ExpCatLineaAerea]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ExpCatLineaAerea](
	[ClaLineaAerea] [int] NOT NULL,
	[Nombre] [varchar](60) NULL,
	[Descripcion] [varchar](200) NULL,
	[Contacto] [varchar](50) NULL,
	[Direccion] [varchar](100) NULL,
	[Telefono] [varchar](20) NULL,
	[Web] [varchar](250) NULL,
	[Email] [varchar](40) NULL,
	[NombreCorto] [varchar](20) NULL,
	[Guia] [varchar](20) NULL,
	[DigitoAerea] [int] NULL,
	[Pais] [varchar](100) NULL,
	[BajaLogica] [tinyint] NULL CONSTRAINT [DF_ExpCatLineaAerea_bajaLogica]  DEFAULT ((0)),
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NULL CONSTRAINT [DF_ExpCatLineaAerea_FechaUltimaMod]  DEFAULT (getdate()),
	[ClaUsuarioMod] [int] NULL,
	[NombrePcMod] [varchar](64) NULL,
 CONSTRAINT [PK_ExpCatLineaAerea] PRIMARY KEY CLUSTERED 
(
	[ClaLineaAerea] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ExpCatLineaMaritima]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ExpCatLineaMaritima](
	[ClaLineaMaritima] [int] NOT NULL,
	[Nombre] [varchar](30) NULL,
	[Descripcion] [varchar](200) NULL,
	[Contacto] [varchar](50) NULL,
	[Direccion] [varchar](100) NULL,
	[Telefono] [varchar](20) NULL,
	[Web] [varchar](250) NULL,
	[Email] [varchar](30) NULL,
	[NombreCorto] [varchar](20) NULL,
	[Guia] [varchar](20) NULL,
	[DiasLibresDemora] [int] NULL,
	[BajaLogica] [tinyint] NULL CONSTRAINT [DF_ExpCatLineaMaritima_bajaLogica]  DEFAULT ((0)),
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NULL CONSTRAINT [DF_ExpCatLineaMaritima_FechaUltimaMod]  DEFAULT (getdate()),
	[ClaUsuarioMod] [int] NULL,
	[NombrePcMod] [varchar](64) NULL,
 CONSTRAINT [PK_ExpCatLineaMaritima] PRIMARY KEY CLUSTERED 
(
	[ClaLineaMaritima] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ExpCatNombreBarco]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ExpCatNombreBarco](
	[ClaLineaMaritima] [int] NOT NULL,
	[ClaBarco] [int] NOT NULL,
	[NombreBarco] [varchar](100) NOT NULL,
	[Descripcion] [varchar](200) NULL,
	[BajaLogica] [int] NULL,
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NULL,
	[ClaUsuarioMod] [int] NULL,
	[NombrePcMod] [varchar](100) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ExpCatPrimaSeguro]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ExpCatPrimaSeguro](
	[ClaPrimaSeguro] [int] NOT NULL,
	[Nombre] [varchar](50) NULL,
	[Descripcion] [varchar](200) NULL,
	[CantidadPrima] [float] NULL,
	[BajaLogica] [tinyint] NULL,
	[fechaBajaLogica] [datetime] NULL,
 CONSTRAINT [PK_ExpCatPrimaSeguro] PRIMARY KEY CLUSTERED 
(
	[ClaPrimaSeguro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ExpCatPuertoFrontera]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ExpCatPuertoFrontera](
	[ClaPuertoFrontera] [int] NOT NULL,
	[Nombre] [varchar](30) NULL,
	[Descripcion] [varchar](200) NULL,
	[BajaLogica] [tinyint] NULL CONSTRAINT [DF_ExpCatPuertoFrontera_bajaLogica]  DEFAULT ((0)),
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NULL CONSTRAINT [DF_ExpCatPuertoFrontera_FechaUltimaMod]  DEFAULT (getdate()),
	[ClaUsuarioMod] [int] NULL,
	[NombrePcMod] [varchar](64) NULL,
	[ClaPais] [int] NULL,
	[ClaEstado] [int] NULL,
	[ClaCiudad] [int] NULL,
 CONSTRAINT [PK_expCatPuertoFrontera] PRIMARY KEY CLUSTERED 
(
	[ClaPuertoFrontera] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ExpCatRegimen]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ExpCatRegimen](
	[ClaRegimen] [int] NOT NULL,
	[TipoRegimen] [int] NOT NULL,
	[Nombre] [varchar](20) NULL,
	[Descripcion] [varchar](50) NULL,
	[Porcentaje] [numeric](18, 2) NULL,
	[BajaLogica] [tinyint] NULL CONSTRAINT [DF_ExpCatRegimen_bajaLogica]  DEFAULT ((0)),
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NULL CONSTRAINT [DF_ExpCatRegimen_FechaUltimaMod]  DEFAULT (getdate()),
	[ClaUsuarioMod] [int] NULL,
	[NombrePcMod] [varchar](64) NULL,
 CONSTRAINT [PK_ExpCatRegimen] PRIMARY KEY CLUSTERED 
(
	[ClaRegimen] ASC,
	[TipoRegimen] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ExpCatSemaforo]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ExpCatSemaforo](
	[ClaSemaforo] [int] NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Descripcion] [varchar](50) NOT NULL,
	[BajaLogica] [int] NOT NULL,
	[FechaBajaLogica] [datetime] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ExpCatTipoAgrupacion]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ExpCatTipoAgrupacion](
	[ClaTipoAgrupacion] [int] NOT NULL,
	[Nombre] [varchar](30) NULL,
	[Descripcion] [varchar](200) NULL,
	[BajaLogica] [tinyint] NULL CONSTRAINT [DF_ExpCatTipoAgrupacion_BajaLogica]  DEFAULT ((0)),
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NULL CONSTRAINT [DF_ExpCatTipoAgrupacion_FechaUltimaMod]  DEFAULT (getdate()),
	[ClaUsuarioMod] [int] NULL,
	[NombrePcMod] [varchar](64) NULL,
 CONSTRAINT [PK_ExpCatTipoAgrupacion] PRIMARY KEY CLUSTERED 
(
	[ClaTipoAgrupacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ExpCatTipoCarga]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ExpCatTipoCarga](
	[ClaTipoCarga] [int] NOT NULL,
	[Nombre] [varchar](50) NULL,
	[NombreIngles] [varchar](50) NULL,
	[Descripcion] [varchar](200) NULL,
	[EsContenedor] [int] NOT NULL CONSTRAINT [DF__ExpCatTip__EsCon__76040256]  DEFAULT ((0)),
	[BajaLogica] [tinyint] NULL CONSTRAINT [DF_ExpCatTipoCarga_bajaLogica]  DEFAULT ((0)),
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NULL CONSTRAINT [DF_ExpCatTipoCarga_FechaUltimaMod]  DEFAULT (getdate()),
	[ClaUsuarioMod] [int] NULL,
	[NombrePcMod] [varchar](64) NULL,
	[ConsiderarPeso] [int] NULL,
	[ConsiderarDimension] [int] NULL,
 CONSTRAINT [PK_ExpCatTipoCarga] PRIMARY KEY CLUSTERED 
(
	[ClaTipoCarga] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ExpCatTipoDimension]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ExpCatTipoDimension](
	[ClaTipoDimension] [int] NOT NULL,
	[Nombre] [varchar](50) NULL,
	[Descripcion] [varchar](200) NULL,
	[BajaLogica] [bit] NULL CONSTRAINT [DF_ExpCatTipoDimension_bajaLogica]  DEFAULT ((0)),
	[FechaBajaLogica] [datetime] NULL,
 CONSTRAINT [PK_ExpCatTipoDimension] PRIMARY KEY CLUSTERED 
(
	[ClaTipoDimension] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ExpCatTipoExportacion]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ExpCatTipoExportacion](
	[ClaTipoExportacion] [int] NOT NULL,
	[Nombre] [varchar](80) NULL,
	[Descripcion] [varchar](200) NULL,
	[BajaLogica] [int] NOT NULL,
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL DEFAULT (getdate()),
	[NombrePcMod] [varchar](64) NOT NULL DEFAULT (host_name()),
	[ClaUsuarioMod] [int] NOT NULL,
 CONSTRAINT [PK_ExpCatTipoExportacion] PRIMARY KEY CLUSTERED 
(
	[ClaTipoExportacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ExpCatTipoImportacion]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ExpCatTipoImportacion](
	[ClaTipoImportacion] [int] NOT NULL,
	[Descripcion] [varchar](50) NULL,
	[BajaLogica] [int] NOT NULL DEFAULT ((0)),
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL DEFAULT (getdate()),
	[NombrePcMod] [varchar](64) NOT NULL DEFAULT (host_name()),
	[ClaUsuarioMod] [int] NOT NULL,
 CONSTRAINT [PK_ExpCatTipoImportacion] PRIMARY KEY CLUSTERED 
(
	[ClaTipoImportacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ExpCatTipoPeso]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ExpCatTipoPeso](
	[ClaTipoPeso] [int] NOT NULL,
	[Nombre] [varchar](50) NULL,
	[Descripcion] [varchar](200) NULL,
	[BajaLogica] [bit] NULL CONSTRAINT [DF_ExpCatTipoPeso_bajaLogica]  DEFAULT ((0)),
	[FechaBajaLogica] [datetime] NULL,
 CONSTRAINT [PK_ExpCatTipoPeso] PRIMARY KEY CLUSTERED 
(
	[ClaTipoPeso] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ExpCatTipoServicio]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ExpCatTipoServicio](
	[ClaTipoServicio] [int] NOT NULL,
	[Nombre] [varchar](20) NULL,
	[Descripcion] [varchar](200) NULL,
	[ClaBarco] [int] NULL,
	[BajaLogica] [tinyint] NULL CONSTRAINT [DF_ExpCatTipoServicio_bajaLogica]  DEFAULT ((0)),
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NULL CONSTRAINT [DF_ExpCatTipoServicio_FechaUltimaMod]  DEFAULT (getdate()),
	[ClaUsuarioMod] [int] NULL,
	[NombrePcMod] [varchar](64) NULL,
 CONSTRAINT [PK_ExpCatTipoServicio] PRIMARY KEY CLUSTERED 
(
	[ClaTipoServicio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ExpCatTipoTransporte]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ExpCatTipoTransporte](
	[ClaTipoTransporte] [int] NOT NULL,
	[Nombre] [varchar](50) NULL,
	[Descripcion] [varchar](200) NULL,
	[BajaLogica] [bit] NULL,
	[FechaBajaLogica] [datetime] NULL,
 CONSTRAINT [PK_ExpCatTipoTransporte] PRIMARY KEY CLUSTERED 
(
	[ClaTipoTransporte] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ExpCatViaEmbarque]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ExpCatViaEmbarque](
	[ClaViaEmbarque] [int] NOT NULL,
	[Nombre] [varchar](20) NULL,
	[NombreIngles] [varchar](50) NULL,
	[Descripcion] [varchar](200) NULL,
	[Dias] [int] NULL,
	[BajaLogica] [tinyint] NULL CONSTRAINT [DF_ExpCatViaEmbarque_bajaLogica]  DEFAULT ((0)),
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NULL CONSTRAINT [DF_ExpCatViaEmbarque_FechaUltimaMod]  DEFAULT (getdate()),
	[ClaUsuarioMod] [int] NULL,
	[NombrePcMod] [varchar](64) NULL,
 CONSTRAINT [PK_expCatViaEmbarque] PRIMARY KEY CLUSTERED 
(
	[ClaViaEmbarque] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ExpRelIncotermPais]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ExpRelIncotermPais](
	[ClaIncoterm] [int] NOT NULL,
	[ClaPais] [int] NOT NULL,
	[BajaLogica] [int] NULL CONSTRAINT [DF_ExpRelIncotermPais_BajaLogica]  DEFAULT ((0)),
	[FechaBajaLogica] [datetime] NULL,
	[ClaUsuarioMod] [int] NULL,
	[NombrePcMod] [varchar](50) NULL,
 CONSTRAINT [PK_ExpRelIncotermPais] PRIMARY KEY CLUSTERED 
(
	[ClaIncoterm] ASC,
	[ClaPais] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ExpRelIncPFronPais]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ExpRelIncPFronPais](
	[ClaRelacion] [int] NOT NULL,
	[ClaIncoterm] [int] NOT NULL,
	[ClaPuertoFrontera] [int] NOT NULL,
	[ClaPais] [int] NOT NULL,
	[BajaLogica] [int] NULL CONSTRAINT [DF__ExpRelIncPFronPais__BajaL__14E87C29]  DEFAULT ((0)),
	[FechaBajaLogica] [datetime] NULL CONSTRAINT [DF__ExpRelIncPFronPais__Fecha__15DCA062]  DEFAULT (getdate()),
	[NombrePcMod] [varchar](64) NOT NULL CONSTRAINT [DF__ExpRelIncPFronPais__Nombr__16D0C49B]  DEFAULT (host_name()),
	[ClaUsuarioMod] [int] NULL,
	[FechaUltimaMod] [datetime] NULL CONSTRAINT [DF_ExpRelIncPFronPais_FechaUltimaMod]  DEFAULT (getdate()),
 CONSTRAINT [PK_ExpRelIncPFronPais] PRIMARY KEY CLUSTERED 
(
	[ClaRelacion] ASC,
	[ClaIncoterm] ASC,
	[ClaPuertoFrontera] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ExpTraEnvio]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ExpTraEnvio](
	[IdEnvio] [int] IDENTITY(1,1) NOT NULL,
	[ReferenciaProveedor] [varchar](20) NULL,
	[GastosAdicionales] [numeric](18, 8) NULL,
	[ClaMoneda] [int] NULL,
	[NumeroFactura] [varchar](20) NULL,
	[ClaTipoCarga] [tinyint] NULL,
	[CantidadCarga] [numeric](18, 8) NULL,
	[ClaTipoPeso] [int] NULL,
	[Peso] [numeric](18, 8) NULL,
	[ClaTipoDimension] [int] NULL,
	[Largo] [numeric](10, 2) NULL,
	[Ancho] [numeric](10, 2) NULL,
	[Alto] [numeric](10, 2) NULL,
	[ClaEstatus] [int] NULL,
	[FechaEntregaPlanta] [datetime] NULL,
	[FechaRecoleccion] [datetime] NULL,
	[ClaTransportistaInternacional] [int] NULL,
	[FechaCreacion] [datetime] NULL,
	[DatosEntregaEnvio] [varchar](250) NULL,
	[FechaEstimadaEntrega] [datetime] NULL,
	[ClaTipoRegistro] [int] NULL,
	[ClaAgenteAduanal] [int] NULL,
	[FechaUltimaMod] [datetime] NULL,
	[NombrePcMod] [varchar](64) NULL,
	[ClaUsuarioMod] [int] NULL,
	[FacturaXEnvio] [int] NULL,
	[ImporteFactura] [numeric](18, 8) NULL,
	[ClaPuertoFrontera] [int] NULL,
	[FechaPromesaEntrega] [datetime] NULL,
 CONSTRAINT [PK_expTraEnvio] PRIMARY KEY CLUSTERED 
(
	[IdEnvio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ExpTraEnvioDet]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ExpTraEnvioDet](
	[ClaUbicacion] [int] NOT NULL,
	[IdPedido] [int] NOT NULL,
	[IdEnvio] [int] NOT NULL,
	[FolioArticulo] [int] NOT NULL,
	[IdParcialidad] [int] NOT NULL,
	[GuiaEmbarque] [varchar](50) NULL,
	[Cantidad] [numeric](18, 8) NULL,
	[CantSurtida] [numeric](18, 8) NULL,
	[CantEnEmbarques] [numeric](18, 8) NULL,
	[EsActivo] [bit] NULL,
	[FechaUltimaMod] [datetime] NULL,
	[NombrePcMod] [varchar](64) NULL,
	[ClaUsuarioMod] [int] NULL,
	[ImporteFactura] [numeric](18, 8) NULL,
 CONSTRAINT [PK_ExpTraEnvioDet] PRIMARY KEY CLUSTERED 
(
	[ClaUbicacion] ASC,
	[IdPedido] ASC,
	[IdEnvio] ASC,
	[FolioArticulo] ASC,
	[IdParcialidad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[FfccCatCarro]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FfccCatCarro](
	[ClaCarro] [int] NOT NULL,
	[Placa] [varchar](15) NOT NULL,
	[ClaFerroviaria] [int] NULL,
	[ClaTipoCarro] [int] NOT NULL,
	[EsEquipoPropio] [int] NULL,
	[BajaLogica] [int] NOT NULL,
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL,
	[NombrePcMod] [varchar](64) NOT NULL,
	[ClaUsuarioMod] [int] NOT NULL,
 CONSTRAINT [PK_FfccCatCarro] PRIMARY KEY CLUSTERED 
(
	[ClaCarro] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[FfccCatConfiguracion]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FfccCatConfiguracion](
	[ClaConfiguracion] [int] NOT NULL,
	[DescConfiguracion] [varchar](250) NOT NULL,
	[Valor1] [int] NULL,
	[Valor2] [int] NULL,
	[Valor3] [int] NULL,
	[Svalor1] [varchar](250) NULL,
	[Svalor2] [varchar](250) NULL,
	[Svalor3] [varchar](250) NULL,
	[Numero1] [float] NULL,
	[Numero2] [float] NULL,
	[Numero3] [float] NULL,
	[Fecha1] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL DEFAULT (getdate()),
	[NombrePcMod] [varchar](64) NOT NULL DEFAULT (host_name()),
	[ClaUsuarioMod] [int] NOT NULL,
	[BajaLogica] [int] NOT NULL DEFAULT ((0)),
	[FechaBajaLogica] [datetime] NULL,
 CONSTRAINT [PK_FfccCatConfiguracion] PRIMARY KEY CLUSTERED 
(
	[ClaConfiguracion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[FfccCatFerroviaria]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FfccCatFerroviaria](
	[ClaFerroviaria] [int] NOT NULL,
	[Abrev] [varchar](10) NULL,
	[NombreCortoFerroviaria] [varchar](15) NULL,
	[NumeroCliente] [varchar](20) NULL,
	[Email] [varchar](50) NULL,
	[ClaAvisoServicioCliente] [int] NULL,
	[EsComunicacionCorreo] [int] NULL,
	[ClaAvisoSolicitudAsignacion] [int] NULL,
	[ClaAvisoDocumentacion] [int] NULL,
	[ClaAvisoLiberacion] [int] NULL,
	[ClaAvisoReutilizacion] [int] NULL,
	[ClaAvisoServicioDiverso] [int] NULL,
	[ClaAvisoConfirmaPreFacturaFletes] [int] NULL,
	[ClaAvisoConfirmaPreFacturaDemoras] [int] NULL,
	[ClaAvisoRechazoFactura] [int] NULL,
	[ClaAvisoOtrosServicios] [int] NULL,
	[ClaAvisoAsignacionPedido] [int] NULL,
	[ClaAvisoAsignacionCarros] [int] NULL,
	[ClaAvisoConfirmaDocumenta] [int] NULL,
	[ClaAvisoConfirmaLibera] [int] NULL,
	[ClaAvisoConfirmaReutiliza] [int] NULL,
	[ClaAvisoProblemas] [int] NULL,
	[ClaAvisoConfirmaServicioDiverso] [int] NULL,
	[EsTraficoNacional] [int] NULL,
	[HoraCorteDemoraInicio] [int] NULL,
	[HoraCorteDemoraFin] [int] NULL,
	[CostoDemora] [numeric](19, 2) NULL,
	[CostoDerechoPiso] [numeric](19, 2) NULL,
	[HorasLimiteDemora] [int] NULL,
	[HorasLimiteReutiliza] [int] NULL,
	[TieneCarros] [int] NULL,
	[FechaAlta] [datetime] NULL,
	[DiasAntesSolicitud] [int] NULL,
	[EsCredito] [int] NULL,
	[ClaMedioConfirmacion] [int] NULL,
	[EsOperacionServiciosPorSistema] [int] NULL,
	[AplicaReutilizacion] [int] NULL,
	[PortalFerroviaria] [varchar](200) NULL,
	[EsActivo] [int] NULL,
	[BajaLogica] [int] NULL,
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NULL,
	[ClaUsuarioMod] [int] NULL,
	[ContactoAnteFFCC] [varchar](60) NULL,
	[PorcentajeDescuento] [numeric](19, 2) NULL,
	[DireccionFTP] [varchar](700) NULL,
	[UsuarioFTP] [varchar](100) NULL,
	[PasswordFTP] [varchar](30) NULL,
	[NombrePcMod] [varchar](64) NULL,
 CONSTRAINT [PK_FfccCatFerroviaria] PRIMARY KEY CLUSTERED 
(
	[ClaFerroviaria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[FfccCatPool]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FfccCatPool](
	[ClaUbicacion] [int] NOT NULL,
	[ClaPool] [int] NOT NULL,
	[NombrePool] [varchar](50) NOT NULL,
	[ClaOrigen] [int] NOT NULL,
	[ClaDestino] [int] NOT NULL,
	[EsActivo] [int] NOT NULL CONSTRAINT [DF__FfccCatPo__EsAct__1C722D53]  DEFAULT ((1)),
	[BajaLogica] [int] NOT NULL CONSTRAINT [DF__FfccCatPo__BajaL__1D66518C]  DEFAULT ((0)),
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL CONSTRAINT [DF__FfccCatPo__Fecha__1E5A75C5]  DEFAULT (getdate()),
	[NombrePcMod] [varchar](64) NOT NULL CONSTRAINT [DF__FfccCatPo__Nombr__1F4E99FE]  DEFAULT (host_name()),
	[ClaUsuarioMod] [int] NOT NULL,
 CONSTRAINT [PK_FfccCatPool] PRIMARY KEY CLUSTERED 
(
	[ClaUbicacion] ASC,
	[ClaPool] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[FfccCatSegmentoPorRutadpc]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FfccCatSegmentoPorRutadpc](
	[ClaRuta] [int] NOT NULL,
	[Orden] [int] NOT NULL,
	[ClaSegmento] [int] NOT NULL,
	[Kms] [numeric](19, 2) NOT NULL,
	[ClaFerroviaria] [int] NOT NULL,
	[ClaPaisOrigen] [int] NOT NULL,
	[ClaEstadoOrigen] [int] NOT NULL,
	[ClaCiudadOrigen] [int] NOT NULL,
	[ClaPaisDestino] [int] NOT NULL,
	[ClaEstadoDestino] [int] NOT NULL,
	[ClaCiudadDestino] [int] NOT NULL,
	[BajaLogica] [int] NOT NULL CONSTRAINT [DF_FFCCCatSegmentoPorRuta_BajaLogica]  DEFAULT ((0)),
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL CONSTRAINT [DF_FFCCCatSegmentoPorRuta_FechaUltimaMod]  DEFAULT (getdate()),
	[NombrePcMod] [varchar](64) NOT NULL CONSTRAINT [DF_FFCCCatSegmentoPorRuta_NombrePcMod]  DEFAULT (host_name()),
	[ClaUsuarioMod] [int] NOT NULL,
	[ClaSegmentoRel] [int] NULL,
	[Pagable] [int] NOT NULL CONSTRAINT [DF_FfccCatSegmentoPorRuta_Pagable]  DEFAULT ((0)),
 CONSTRAINT [PK_FfccSegmentoRuta] PRIMARY KEY CLUSTERED 
(
	[ClaRuta] ASC,
	[ClaSegmento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[FfccCatUbicacion]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FfccCatUbicacion](
	[ClaUbicacion] [int] NOT NULL,
	[NombreUbicacion] [varchar](55) NULL,
	[ClaTipoUbicacion] [int] NULL,
	[EsExterno] [int] NULL,
	[ClaEmpresa] [int] NULL,
	[ClaCliente] [int] NULL,
	[NombreCorto] [varchar](20) NULL,
	[ClaCiudadBase] [int] NULL,
	[ClaPais] [int] NULL,
	[ClaEstado] [int] NULL,
	[AplicaFactorCubicaje] [int] NULL,
	[ClaUbicacionVentas] [int] NULL,
	[Direccion] [varchar](400) NULL,
	[Colonia] [varchar](40) NULL,
	[Poblacion] [varchar](40) NULL,
	[CodigoPostal] [varchar](10) NULL,
	[Telefonos] [varchar](20) NULL,
	[Fax] [varchar](20) NULL,
	[Rfc] [varchar](15) NULL,
	[Email] [varchar](50) NULL,
	[UbicacionKilometrica] [varchar](30) NULL,
	[BajaLogica] [int] NOT NULL CONSTRAINT [DF__FfccCatUb__BajaL__41C3AD93]  DEFAULT ((0)),
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL CONSTRAINT [DF__FfccCatUb__Fecha__42B7D1CC]  DEFAULT (getdate()),
	[NombrePcMod] [varchar](64) NOT NULL,
	[ClaUsuarioMod] [int] NOT NULL,
	[FechaIns] [datetime] NULL,
	[CriterioCalculoDemora] [int] NULL CONSTRAINT [DF_FfccCatUbicacion_CriterioCalculoDemora]  DEFAULT ((1)),
	[MargenHorasDemorasPiso] [int] NULL,
	[EsConSistema] [int] NOT NULL CONSTRAINT [DF__FfccCatUb__EsCon__07A38FA4]  DEFAULT ((0)),
	[EsDomingoDiaHabil] [int] NOT NULL CONSTRAINT [DF__FfccCatUb__EsDom__0897B3DD]  DEFAULT ((0)),
 CONSTRAINT [PK_FfccCatUbicacion] PRIMARY KEY CLUSTERED 
(
	[ClaUbicacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[FisCatInformacionFiscalEmpresa]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FisCatInformacionFiscalEmpresa](
	[ClaInformacionFiscalEmpresa] [int] NOT NULL,
	[ClaEmpresa] [int] NOT NULL,
	[NombreCalle] [varchar](200) NOT NULL,
	[NumeroExterior] [varchar](20) NOT NULL,
	[NumeroInterior] [varchar](20) NULL,
	[CaracteristicaDomicilioFiscal] [varchar](200) NULL,
	[ClaPaisCon] [int] NOT NULL,
	[ClaveActividadFiscal] [varchar](200) NULL,
	[CodigoPostal] [varchar](10) NULL,
	[ClaColoniaCon] [int] NOT NULL,
	[CorreoElectronico] [varchar](20) NULL,
	[ClaEstadoCon] [int] NOT NULL,
	[EntreCalles] [varchar](200) NULL,
	[EsNacional] [tinyint] NOT NULL,
	[FechaAlta] [datetime] NULL,
	[ClaMunicipioCon] [int] NULL,
	[NombreRazonSocial] [varchar](200) NOT NULL,
	[ReferenciaAdicional] [varchar](250) NULL,
	[Telefono] [varchar](50) NULL,
	[TipoVialidad] [varchar](250) NULL,
	[RFC] [varchar](20) NULL,
	[BancoBeneficiario] [int] NULL,
	[BajaLogica] [tinyint] NOT NULL CONSTRAINT [DF_FisCatInformacionFiscalEmpresa_BajaLogica]  DEFAULT ((0)),
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL CONSTRAINT [DF_FisCatInformacionFiscalEmpresa_FechaUltimaMod]  DEFAULT (getdate()),
	[NombrePcMod] [varchar](64) NOT NULL CONSTRAINT [DF_FisCatInformacionFiscalEmpresa_NombrePcMod]  DEFAULT (host_name()),
	[ClaUsuarioMod] [int] NOT NULL,
 CONSTRAINT [PK_FisCatInformacionFiscalEmpresa] PRIMARY KEY CLUSTERED 
(
	[ClaInformacionFiscalEmpresa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[FisCatIva]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FisCatIva](
	[ClaIva] [int] NOT NULL,
	[NomIva] [varchar](10) NOT NULL,
	[PctIva] [int] NOT NULL,
	[BajaLogica] [int] NOT NULL,
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL,
	[NombrePcMod] [varchar](64) NULL,
	[ClaUsuarioMod] [int] NOT NULL,
 CONSTRAINT [PK_FisCatIva] PRIMARY KEY CLUSTERED 
(
	[ClaIva] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[FisCatTipoPersona]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FisCatTipoPersona](
	[ClaTipoPersona] [int] NOT NULL,
	[NomTipoPersona] [varchar](50) NOT NULL,
	[BajaLogica] [int] NOT NULL DEFAULT ((0)),
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL DEFAULT (getdate()),
	[NombrePcMod] [varchar](64) NOT NULL DEFAULT (host_name()),
	[ClaUsuarioMod] [int] NOT NULL,
 CONSTRAINT [PKFisCatTipoPersona] PRIMARY KEY CLUSTERED 
(
	[ClaTipoPersona] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[FisCatTipoProveedor]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FisCatTipoProveedor](
	[clatipoproveedor] [int] NOT NULL,
	[nomTipoProveedor] [varchar](20) NOT NULL,
	[requierecurp_sn] [int] NULL DEFAULT ((0)),
	[bajaLogica] [int] NOT NULL,
	[fechabajalogica] [datetime] NULL,
	[fechaultimamod] [datetime] NULL DEFAULT (getdate()),
	[nombrepcmod] [varchar](64) NULL DEFAULT (host_name()),
	[clausuariomod] [int] NULL,
 CONSTRAINT [PK_FisCatTipoProveedor] PRIMARY KEY NONCLUSTERED 
(
	[clatipoproveedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[FleCatAbreviacion]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FleCatAbreviacion](
	[Abreviacion] [varchar](6) NOT NULL,
	[Descripcion] [varchar](30) NULL,
 CONSTRAINT [PK_FleCatAbreviacion] PRIMARY KEY CLUSTERED 
(
	[Abreviacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[FleCatAgregadoDeduccion]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FleCatAgregadoDeduccion](
	[ClaUbicacion] [int] NOT NULL,
	[ClaConceptoAgregadoDeduccion] [int] NOT NULL,
	[NomFleCatAgregadoDeduccion] [varchar](200) NULL,
	[IdTipoConcepto] [int] NULL,
	[EsConAfectacion] [tinyint] NULL,
	[EsConDiscrepancia] [tinyint] NULL,
	[FechaUltimaMod] [datetime] NULL,
	[NombrePcMod] [varchar](50) NULL,
	[ClaUsuarioMod] [int] NULL,
	[BajaLogica] [tinyint] NULL,
	[FechaBajaLogica] [datetime] NULL,
	[EsConAfectacionReporte] [int] NULL,
 CONSTRAINT [PK_FleCatAgregadoDeduccion] PRIMARY KEY CLUSTERED 
(
	[ClaUbicacion] ASC,
	[ClaConceptoAgregadoDeduccion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[FleCatChofer]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FleCatChofer](
	[ClaChofer] [int] NOT NULL,
	[NomChofer] [varchar](50) NOT NULL,
	[BajaLogica] [tinyint] NOT NULL,
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL,
	[NombrePcMod] [varchar](64) NOT NULL,
	[ClaUsuarioMod] [int] NOT NULL,
 CONSTRAINT [PK_FleCatChofer] PRIMARY KEY CLUSTERED 
(
	[ClaChofer] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[FleCatCriterioPagoTarifa]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FleCatCriterioPagoTarifa](
	[ClaCriterioPagoTarifa] [int] NOT NULL,
	[DescCriterioPagoTarifa] [varchar](100) NOT NULL,
	[ClaGrupoTransporte] [int] NOT NULL,
	[BajaLogica] [int] NOT NULL,
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL,
	[NombrePcMod] [varchar](64) NOT NULL,
	[ClaUsuarioMod] [int] NOT NULL,
 CONSTRAINT [PK_FleCatCriterioPagoTarifaFfcc] PRIMARY KEY CLUSTERED 
(
	[ClaCriterioPagoTarifa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[FleCatDistEntreCiudades]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FleCatDistEntreCiudades](
	[ClaUbicacion] [int] NOT NULL,
	[ClaCiudadOrigen] [int] NOT NULL,
	[ClaCiudadDestino] [int] NOT NULL,
	[KmsDistancia] [numeric](22, 4) NULL,
	[EsConTransbordo] [tinyint] NULL,
	[kmsTramoMontanoso] [numeric](22, 4) NULL,
	[FechaUltimaMod] [datetime] NULL,
	[NombrePcMod] [varchar](50) NULL,
	[ClaUsuarioMod] [int] NULL,
	[BajaLogica] [tinyint] NULL,
	[FechaBajaLogica] [datetime] NULL,
 CONSTRAINT [PK_FleCatDistEntreCiudades] PRIMARY KEY CLUSTERED 
(
	[ClaUbicacion] ASC,
	[ClaCiudadOrigen] ASC,
	[ClaCiudadDestino] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[FleCatDistEntreZipCodes]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FleCatDistEntreZipCodes](
	[ClaUbicacion] [int] NOT NULL,
	[ZipCodeOrigen] [int] NOT NULL,
	[ZipCodeDestino] [int] NOT NULL,
	[MillasDistancia] [numeric](22, 4) NULL,
	[FechaUltimaMod] [datetime] NULL,
	[NombrePcMod] [varchar](50) NULL,
	[ClaUsuarioMod] [int] NULL,
	[BajaLogica] [tinyint] NULL,
	[FechaBajaLogica] [datetime] NULL,
 CONSTRAINT [PK_FleCatDistEntreZipCodes] PRIMARY KEY CLUSTERED 
(
	[ClaUbicacion] ASC,
	[ZipCodeOrigen] ASC,
	[ZipCodeDestino] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[FleCatEjeTransporte]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FleCatEjeTransporte](
	[ClaEjeTransporte] [int] NOT NULL,
	[NomEjeTransporte] [varchar](50) NOT NULL,
	[ClaTransporte] [int] NOT NULL,
	[PesoBrutoMaximo] [numeric](22, 4) NOT NULL,
	[BajaLogica] [tinyint] NOT NULL,
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL,
	[NombrePcMod] [varchar](64) NOT NULL,
	[ClaUsuarioMod] [int] NOT NULL,
 CONSTRAINT [PK_FleCatEjeTransporte] PRIMARY KEY CLUSTERED 
(
	[ClaEjeTransporte] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[FleCatGrupoTransporte]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FleCatGrupoTransporte](
	[ClaGrupoTransporte] [int] NOT NULL,
	[NomFleCatGrupoTransporte] [varchar](200) NULL,
	[FechaUltimaMod] [datetime] NULL,
	[NombrePcMod] [varchar](50) NULL,
	[ClaUsuarioMod] [int] NULL,
	[BajaLogica] [tinyint] NULL,
	[FechaBajaLogica] [datetime] NULL,
 CONSTRAINT [PK_FleCatGrupoTransporte] PRIMARY KEY CLUSTERED 
(
	[ClaGrupoTransporte] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[FleCatListaNegraChofer]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FleCatListaNegraChofer](
	[ClaUbicacion] [int] NOT NULL,
	[ClaChofer] [int] NOT NULL,
	[Nombre] [varchar](200) NULL,
	[Motivo] [varchar](200) NULL,
	[BajaLogica] [tinyint] NULL,
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NULL,
	[NombrePcMod] [varchar](50) NULL,
	[ClaUsuarioMod] [int] NULL,
 CONSTRAINT [PK_FleCatListaNegraChofer] PRIMARY KEY CLUSTERED 
(
	[ClaUbicacion] ASC,
	[ClaChofer] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[FleCatListaNegraTransp]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FleCatListaNegraTransp](
	[ClaUbicacion] [int] NOT NULL,
	[ClaTransportista] [int] NOT NULL,
	[ClaCUP] [varchar](50) NOT NULL,
	[Motivo] [varchar](200) NULL,
	[BajaLogica] [tinyint] NULL,
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NULL,
	[NombrePcMod] [varchar](50) NULL,
	[ClaUsuarioMod] [int] NULL,
 CONSTRAINT [PK_FleCatListaNegraTransp] PRIMARY KEY CLUSTERED 
(
	[ClaUbicacion] ASC,
	[ClaTransportista] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[FleCatRangoLtl]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FleCatRangoLtl](
	[ClaUbicacion] [int] NOT NULL,
	[Orden] [int] NOT NULL,
	[RangoInicial] [numeric](22, 4) NULL,
	[RangoFinal] [numeric](22, 4) NULL,
	[FechaUltimaMod] [datetime] NULL,
	[NombrePcMod] [varchar](50) NULL,
	[ClaUsuarioMod] [int] NULL,
	[BajaLogica] [tinyint] NULL,
	[FechaBajaLogica] [datetime] NULL,
 CONSTRAINT [PK_FleCatRangoLtl] PRIMARY KEY CLUSTERED 
(
	[ClaUbicacion] ASC,
	[Orden] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[FleCatTipoBoleta]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FleCatTipoBoleta](
	[ClaUbicacion] [int] NOT NULL,
	[ClaTipoBoleta] [int] NOT NULL,
	[EsConDiscrepanciaDefault] [tinyint] NULL,
	[NomFleCatTipoBoleta] [varchar](200) NULL,
	[ConfigurarSP] [tinyint] NULL,
	[LoginSp] [int] NULL,
	[SystemId] [int] NULL,
	[FechaUltimaMod] [datetime] NULL,
	[NombrePcMod] [varchar](50) NULL,
	[ClaUsuarioMod] [int] NULL,
	[BajaLogica] [tinyint] NULL,
	[FechaBajaLogica] [datetime] NULL,
	[NombreSp] [varchar](200) NULL,
 CONSTRAINT [PK_FleCatTipoBoleta] PRIMARY KEY CLUSTERED 
(
	[ClaUbicacion] ASC,
	[ClaTipoBoleta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[FleCatTipoCambioTabular]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FleCatTipoCambioTabular](
	[ClaUbicacion] [int] NOT NULL,
	[ClaTipoCambio] [int] NOT NULL,
	[Descripcion] [varchar](200) NULL,
	[FechaUltimaMod] [datetime] NULL,
	[NombrePcMod] [varchar](50) NULL,
	[ClaUsuarioMod] [int] NULL,
 CONSTRAINT [PK_FleCatTipoCambioTabular] PRIMARY KEY CLUSTERED 
(
	[ClaUbicacion] ASC,
	[ClaTipoCambio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[FleCatTipoConcepto]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FleCatTipoConcepto](
	[IdTipoConcepto] [int] NOT NULL,
	[ClaUbicacion] [int] NOT NULL,
	[NomTipoConcepto] [varchar](200) NULL,
	[FechaUltimaMod] [datetime] NULL,
	[NombrePcMod] [varchar](50) NULL,
	[ClaUsuarioMod] [int] NULL,
	[BajaLogica] [tinyint] NULL,
	[FechaBajaLogica] [tinyint] NULL,
 CONSTRAINT [PK_FleCatTipoConcepto] PRIMARY KEY CLUSTERED 
(
	[IdTipoConcepto] ASC,
	[ClaUbicacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[FleCatTipoConvenio]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FleCatTipoConvenio](
	[ClaUbicacion] [int] NOT NULL,
	[ClaTipoConvenio] [int] NOT NULL,
	[NomFleCatTipoConvenio] [varchar](200) NULL,
	[PermiteCapturaManual] [tinyint] NULL,
	[FechaUltimaMod] [datetime] NULL,
	[NombrePcMod] [varchar](50) NULL,
	[ClaUsuarioMod] [int] NULL,
	[BajaLogica] [tinyint] NULL,
	[FechaBajaLogica] [datetime] NULL,
 CONSTRAINT [PK_FleCatTipoConvenio] PRIMARY KEY CLUSTERED 
(
	[ClaUbicacion] ASC,
	[ClaTipoConvenio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[FleCatTipoDestino]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FleCatTipoDestino](
	[ClaTipoDestino] [int] NOT NULL,
	[NomTipoDestino] [varchar](200) NULL,
	[FechaUltimaMod] [datetime] NULL,
	[NombrePcMod] [varchar](50) NULL,
	[ClaUsuarioMod] [int] NULL,
	[BajaLogica] [tinyint] NULL,
	[FechaBajaLogica] [datetime] NULL,
 CONSTRAINT [PK_FleCatTipoDestino] PRIMARY KEY CLUSTERED 
(
	[ClaTipoDestino] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[FleCatTipoGastoFamilia]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FleCatTipoGastoFamilia](
	[ClaTipoGastoFamilia] [int] NOT NULL,
	[NomTipoGastoFamilia] [varchar](200) NULL,
	[FechaUltimaMod] [datetime] NULL,
	[NombrePcMod] [varchar](50) NULL,
	[ClaUsuarioMod] [int] NULL,
	[BajaLogica] [tinyint] NULL,
	[FechaBajaLogica] [datetime] NULL,
 CONSTRAINT [PK_FleCatTipoGastoFamilia] PRIMARY KEY CLUSTERED 
(
	[ClaTipoGastoFamilia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[FleCatTipoTabular]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FleCatTipoTabular](
	[ClaUbicacion] [int] NOT NULL,
	[ClaTipoTabular] [int] NOT NULL,
	[NomFleCatTipoTabular] [varchar](200) NULL,
	[FechaUltimaMod] [datetime] NULL,
	[NombrePcMod] [varchar](50) NULL,
	[ClaUsuarioMod] [int] NULL,
	[BajaLogica] [tinyint] NULL,
	[FechaBajaLogica] [datetime] NULL,
 CONSTRAINT [PK_FleCatTipoTabular] PRIMARY KEY CLUSTERED 
(
	[ClaUbicacion] ASC,
	[ClaTipoTabular] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[FleCatTipoViaje]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FleCatTipoViaje](
	[IdTipoViaje] [int] NOT NULL,
	[ClaUbicacion] [int] NOT NULL,
	[NomFleCatTipoViaje] [varchar](200) NULL,
	[FechaUltimaMod] [datetime] NULL,
	[NombrePcMod] [varchar](50) NULL,
	[ClaUsuarioMod] [int] NULL,
 CONSTRAINT [PK_FleCatTipoViajeVw] PRIMARY KEY CLUSTERED 
(
	[IdTipoViaje] ASC,
	[ClaUbicacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[FleCatTipoZonaFletes]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FleCatTipoZonaFletes](
	[ClaUbicacion] [int] NOT NULL,
	[ClaTipoZona] [int] NOT NULL,
	[FechaUltimaMod] [datetime] NULL,
	[NombrePcMod] [varchar](50) NULL,
	[ClaUsuarioMod] [int] NULL,
	[BajaLogica] [tinyint] NULL,
	[FechaBajaLogica] [datetime] NULL,
	[NomFleCatTipoZonaFletes] [varchar](200) NULL,
 CONSTRAINT [PK_FleCatTipoZonaFletes] PRIMARY KEY CLUSTERED 
(
	[ClaUbicacion] ASC,
	[ClaTipoZona] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[FleCatTransporte]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FleCatTransporte](
	[ClaTransporte] [int] NOT NULL,
	[ClaGrupoTransporte] [int] NULL,
	[NomFleCatTransporte] [varchar](200) NULL,
	[Capacidad] [numeric](13, 5) NULL,
	[Largo] [numeric](13, 5) NULL,
	[Alto] [numeric](13, 5) NULL,
	[Fondo] [numeric](13, 5) NULL,
	[Cubicaje] [decimal](22, 4) NULL,
	[FechaUltimaMod] [datetime] NULL,
	[NombrePcMod] [varchar](50) NULL,
	[ClaUsuarioMod] [int] NULL,
	[BajaLogica] [tinyint] NULL,
	[FechaBajaLogica] [datetime] NULL,
	[KmsMaximos] [numeric](22, 4) NULL,
	[EsContenedor] [tinyint] NULL,
	[EsAplicableCubicaje] [tinyint] NULL,
 CONSTRAINT [PK_FleCatTransporte] PRIMARY KEY CLUSTERED 
(
	[ClaTransporte] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[FleCatTransporteDistancia]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FleCatTransporteDistancia](
	[ClaUbicacion] [int] NOT NULL,
	[ClaTransporte] [int] NOT NULL,
	[DistanciaMaxKms] [decimal](10, 4) NULL,
	[FechaUltimaMod] [datetime] NULL,
	[NombrePcMod] [varchar](50) NULL,
	[ClaUsuarioMod] [int] NULL,
	[BajaLogica] [tinyint] NULL,
	[FechaBajaLogica] [datetime] NULL,
 CONSTRAINT [PK_FleCatTransporteDistancia] PRIMARY KEY CLUSTERED 
(
	[ClaUbicacion] ASC,
	[ClaTransporte] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[FleCatTransportista]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FleCatTransportista](
	[ClaUbicacion] [int] NOT NULL,
	[ClaTransportista] [int] NOT NULL,
	[ClaBeneficiario] [int] NULL,
	[NumTransportista] [int] NULL,
	[Nombre] [varchar](200) NULL,
	[Abreviacion] [varchar](100) NULL,
	[CobroPrimaCombustible] [tinyint] NULL,
	[PorcCobroPrimaCombustible] [numeric](13, 5) NULL,
	[EsNacional] [tinyint] NULL,
	[PlazoParaPago] [int] NULL,
	[ClaGrupoTransporte] [int] NULL,
	[PorcDPPP] [numeric](13, 5) NULL,
	[PorcIVA] [numeric](13, 5) NULL,
	[PorcRetencion] [numeric](13, 5) NULL,
	[DescuentoProntoPago] [numeric](13, 5) NULL,
	[Calle] [varchar](200) NULL,
	[Colonia] [varchar](200) NULL,
	[ClaCiudad] [int] NULL,
	[ClaEstado] [int] NULL,
	[ClaPais] [int] NULL,
	[Telefono1] [varchar](200) NULL,
	[Telefono2] [varchar](200) NULL,
	[FechaUltimaMod] [datetime] NULL,
	[NombrePcMod] [varchar](64) NULL,
	[ClaUsuarioMod] [int] NULL,
	[BajaLogica] [tinyint] NULL,
	[FechaBajaLogica] [datetime] NULL,
	[Fax] [varchar](200) NULL,
	[Web] [varchar](200) NULL,
	[ClaCUP] [int] NULL,
	[ClaCuentaCUP] [int] NULL,
	[Direccion] [varchar](200) NULL,
	[EsConContrato] [tinyint] NULL,
	[CarroFFCCConvenio] [tinyint] NULL,
	[EsDedicado] [tinyint] NULL,
 CONSTRAINT [PK_FleCatTransportista] PRIMARY KEY CLUSTERED 
(
	[ClaUbicacion] ASC,
	[ClaTransportista] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[FleCatTransportista_FP265895]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FleCatTransportista_FP265895](
	[ClaUbicacion] [int] NOT NULL,
	[ClaTransportista] [int] NOT NULL,
	[ClaBeneficiario] [int] NULL,
	[NumTransportista] [int] NULL,
	[Nombre] [varchar](200) NULL,
	[Abreviacion] [varchar](100) NULL,
	[CobroPrimaCombustible] [tinyint] NULL,
	[PorcCobroPrimaCombustible] [numeric](13, 5) NULL,
	[EsNacional] [tinyint] NULL,
	[PlazoParaPago] [int] NULL,
	[ClaGrupoTransporte] [int] NULL,
	[PorcDPPP] [numeric](13, 5) NULL,
	[PorcIVA] [numeric](13, 5) NULL,
	[PorcRetencion] [numeric](13, 5) NULL,
	[DescuentoProntoPago] [numeric](13, 5) NULL,
	[Calle] [varchar](200) NULL,
	[Colonia] [varchar](200) NULL,
	[ClaCiudad] [int] NULL,
	[ClaEstado] [int] NULL,
	[ClaPais] [int] NULL,
	[Telefono1] [varchar](200) NULL,
	[Telefono2] [varchar](200) NULL,
	[FechaUltimaMod] [datetime] NULL,
	[NombrePcMod] [varchar](64) NULL,
	[ClaUsuarioMod] [int] NULL,
	[BajaLogica] [tinyint] NULL,
	[FechaBajaLogica] [datetime] NULL,
	[Fax] [varchar](200) NULL,
	[Web] [varchar](200) NULL,
	[ClaCUP] [int] NULL,
	[ClaCuentaCUP] [int] NULL,
	[Direccion] [varchar](200) NULL,
	[EsConContrato] [tinyint] NULL,
	[CarroFFCCConvenio] [tinyint] NULL,
 CONSTRAINT [PK_FleCatTransportista_265895 ] PRIMARY KEY CLUSTERED 
(
	[ClaUbicacion] ASC,
	[ClaTransportista] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[FleCatZipCode]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FleCatZipCode](
	[ZipCode] [varchar](10) NOT NULL,
	[NomZipCode] [varchar](200) NULL,
	[ClaCiudad] [int] NULL,
	[FechaUltimaMod] [datetime] NULL,
	[NombrePcMod] [varchar](50) NULL,
	[ClaUsuarioMod] [int] NULL,
	[BajaLogica] [tinyint] NULL,
	[FechaBajaLogica] [datetime] NULL,
	[ClaPais] [int] NULL,
 CONSTRAINT [PK_FleCatZipCode] PRIMARY KEY CLUSTERED 
(
	[ZipCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[FleCatZonaFletes]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FleCatZonaFletes](
	[ClaUbicacion] [int] NOT NULL,
	[ClaZona] [int] NOT NULL,
	[ClaTipoZona] [int] NULL,
	[NomFleCatZonasFletes] [varchar](200) NULL,
	[FechaUltimaMod] [datetime] NULL,
	[NombrePcMod] [varchar](50) NULL,
	[ClaUsuarioMod] [int] NULL,
	[BajaLogica] [tinyint] NULL,
	[FechaBajaLogica] [datetime] NULL,
 CONSTRAINT [PK_FleCatZonasFletes] PRIMARY KEY CLUSTERED 
(
	[ClaUbicacion] ASC,
	[ClaZona] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[FleCatZonaFletesDet]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FleCatZonaFletesDet](
	[ClaUbicacion] [int] NOT NULL,
	[ClaDetalleZona] [int] NOT NULL,
	[ClaZona] [int] NOT NULL,
	[ClaCiudad] [int] NULL,
	[NumZipCode] [int] NULL,
	[ClaEstado] [int] NULL,
	[ClaPais] [int] NULL,
	[Nivel] [int] NULL,
	[FechaUltimaMod] [datetime] NULL,
	[NombrePcMod] [varchar](50) NULL,
	[ClaUsuarioMod] [int] NULL,
	[BajaLogica] [tinyint] NULL,
	[FechaBajaLogica] [datetime] NULL,
 CONSTRAINT [PK_FleCatZonaFletesDet] PRIMARY KEY CLUSTERED 
(
	[ClaUbicacion] ASC,
	[ClaDetalleZona] ASC,
	[ClaZona] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[FleTraCubicajeProducto]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FleTraCubicajeProducto](
	[ClaUbicacion] [int] NOT NULL,
	[ClaTransporte] [int] NOT NULL,
	[FolProducto] [int] NOT NULL,
	[FactorCubicaje] [numeric](22, 4) NULL,
	[BajaLogica] [tinyint] NULL,
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NULL,
	[NombrePcMod] [varchar](50) NULL,
	[ClaUsuarioMod] [int] NULL,
 CONSTRAINT [PK_FleTraCubicajePorProducto] PRIMARY KEY CLUSTERED 
(
	[ClaUbicacion] ASC,
	[ClaTransporte] ASC,
	[FolProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[FleTraFuelSurchargeCamion]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FleTraFuelSurchargeCamion](
	[ClaUbicacion] [int] NOT NULL,
	[CostoGalonRangoInicial] [numeric](22, 4) NOT NULL,
	[CostoGalonRangoFinal] [numeric](22, 4) NOT NULL,
	[CuotaPorMilla] [numeric](22, 4) NULL,
	[FechaUltimaMod] [datetime] NULL,
	[NombrePcMod] [varchar](50) NULL,
	[ClaUsuarioMod] [int] NULL,
	[BajaLogica] [tinyint] NULL,
	[FechaBajaLogica] [datetime] NULL,
 CONSTRAINT [PK_FleTraFuelSurchargeCamion] PRIMARY KEY CLUSTERED 
(
	[ClaUbicacion] ASC,
	[CostoGalonRangoInicial] ASC,
	[CostoGalonRangoFinal] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[FP_253037_ArtRelPlantillaCar]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[FP_253037_ArtRelPlantillaCar](
	[ClaTipoInventario] [int] NOT NULL,
	[ClaPlantilla] [int] NOT NULL,
	[ClaCaracteristica] [int] NOT NULL,
	[EsPrincipal] [tinyint] NOT NULL,
	[EsRequerida] [tinyint] NOT NULL,
	[DefineClaveCrudaSN] [tinyint] NOT NULL,
	[OrdenDesc] [int] NULL,
	[OrdenDescIngles] [int] NULL,
	[OrdenDescOtroIdioma] [int] NULL,
	[OrdenCaptura] [int] NULL,
	[Separador] [varchar](5) NULL,
	[Sufijo] [varchar](45) NULL,
	[FechaUltimaMod] [datetime] NOT NULL,
	[NombrePcMod] [varchar](64) NOT NULL,
	[ClaUsuarioMod] [int] NOT NULL,
	[BajaLogica] [int] NOT NULL,
	[FechaBajaLogica] [datetime] NULL,
	[Prefijo] [varchar](45) NULL,
	[PrefijoIdioma2] [varchar](45) NULL,
	[PrefijoIdioma3] [varchar](45) NULL,
	[SufijoIdioma2] [varchar](45) NULL,
	[SufijoIdioma3] [varchar](45) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[IMP_TEST_REPORTE_SERVICIOS]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[IMP_TEST_REPORTE_SERVICIOS](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Schema] [varchar](10) NOT NULL,
	[Objeto] [varchar](100) NOT NULL,
	[Tipo] [varchar](20) NOT NULL,
	[FechaUltimaMod] [datetime] NOT NULL DEFAULT (getdate())
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[IMP_TEST_REPORTE_SERVICIOS_COLUMNAS]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[IMP_TEST_REPORTE_SERVICIOS_COLUMNAS](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Schema] [varchar](10) NOT NULL,
	[Tabla] [varchar](100) NOT NULL,
	[Columna] [varchar](100) NOT NULL,
	[FechaUltimaMod] [datetime] NOT NULL DEFAULT (getdate())
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[IMP_TEST_REPORTE_SERVICIOS_PARAMETROS]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[IMP_TEST_REPORTE_SERVICIOS_PARAMETROS](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Schema] [varchar](10) NOT NULL,
	[Objeto] [varchar](100) NOT NULL,
	[Orden] [int] NULL,
	[Parametro] [varchar](50) NULL,
	[TipoDato] [varchar](30) NULL,
	[Modo] [varchar](10) NULL,
	[ErrorNum] [int] NOT NULL,
	[ErrorMsg] [varchar](80) NOT NULL,
	[FechaUltimaMod] [datetime] NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[InaCatAgrupadorFamilia]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[InaCatAgrupadorFamilia](
	[ClaUbicacion] [int] NOT NULL,
	[ClaTipoInventario] [int] NOT NULL,
	[ClaAgrupador] [int] NOT NULL,
	[NomAgrupadorFamilia] [varchar](50) NULL,
	[Orden] [int] NULL,
	[BajaLogica] [tinyint] NULL DEFAULT ((0)),
	[FechaBajaLogica] [datetime] NULL,
	[ClaUsuarioMod] [int] NULL,
	[FechaUltimaMod] [datetime] NULL DEFAULT (getdate()),
	[NombrePCMod] [varchar](50) NULL,
 CONSTRAINT [PKInaCatAgrupadorFamilia] PRIMARY KEY CLUSTERED 
(
	[ClaUbicacion] ASC,
	[ClaTipoInventario] ASC,
	[ClaAgrupador] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[InaCatAreaFisico]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[InaCatAreaFisico](
	[ClaAreaFisico] [int] NOT NULL,
	[ClaUbicacion] [int] NOT NULL,
	[ClaTipoInventario] [int] NOT NULL,
	[NomAreaFisico] [varchar](50) NULL,
	[BajaLogica] [tinyint] NULL DEFAULT ((0)),
	[FechaBajaLogica] [datetime] NULL,
	[ClaUsuarioMod] [int] NULL,
	[FechaUltimaMod] [datetime] NULL DEFAULT (getdate()),
	[NombrePCMod] [varchar](50) NULL,
 CONSTRAINT [PKInaCatAreaFisico] PRIMARY KEY CLUSTERED 
(
	[ClaAreaFisico] ASC,
	[ClaUbicacion] ASC,
	[ClaTipoInventario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[InaCatEstatusBoletaInv]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[InaCatEstatusBoletaInv](
	[ClaUbicacion] [int] NOT NULL,
	[ClaTipoInventario] [int] NOT NULL,
	[ClaEstatusBoleta] [int] NOT NULL,
	[NomEstatusBoletaInv] [varchar](50) NULL,
	[BajaLogica] [tinyint] NULL,
	[FechaBajaLogica] [datetime] NULL,
	[ClaUsuarioMod] [int] NULL,
	[FechaUltimaMod] [datetime] NULL DEFAULT (getdate()),
	[NombrePCMod] [varchar](50) NULL,
 CONSTRAINT [PKInaCatEstatusBoletaInv] PRIMARY KEY CLUSTERED 
(
	[ClaUbicacion] ASC,
	[ClaTipoInventario] ASC,
	[ClaEstatusBoleta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[InaCatEstatusInvFisico]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[InaCatEstatusInvFisico](
	[ClaTipoInventario] [int] NOT NULL,
	[ClaEstatusInventarioFisico] [int] NOT NULL,
	[NomEstatusInvFisico] [varchar](50) NULL,
	[BajaLogica] [tinyint] NULL DEFAULT ((0)),
	[FechaBajaLogica] [datetime] NULL,
	[ClaUsuarioMod] [int] NULL,
	[FechaUltimaMod] [datetime] NULL DEFAULT (getdate()),
	[NombrePCMod] [varchar](50) NULL,
 CONSTRAINT [PKInaCatEstatusInvFisico] PRIMARY KEY CLUSTERED 
(
	[ClaTipoInventario] ASC,
	[ClaEstatusInventarioFisico] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[InaCatInvFisico]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[InaCatInvFisico](
	[ClaUbicacion] [int] NOT NULL,
	[ClaTipoInventario] [int] NOT NULL,
	[ClaInventarioFisico] [int] NOT NULL,
	[ClaMovimientoInventario] [int] NULL,
	[ClaBoletaInventarioFinal] [int] NULL,
	[ClaBoletaInventarioInicial] [int] NULL,
	[ClaEstatusInventarioFisico] [int] NULL DEFAULT ((1)),
	[ClaFotoInventarioAnualFinal] [int] NULL,
	[EsOficial] [int] NULL,
	[FechaCierre] [datetime] NULL,
	[FechaPreCierrre] [datetime] NULL,
	[FechaUltimaComparativa] [datetime] NULL,
	[NombreInventarioFisico] [varchar](50) NULL,
	[BajaLogica] [tinyint] NULL DEFAULT ((0)),
	[FechaBajaLogica] [datetime] NULL,
	[ClaUsuarioMod] [int] NULL,
	[FechaUltimaMod] [datetime] NULL DEFAULT (getdate()),
	[NombrePCMod] [varchar](50) NULL,
 CONSTRAINT [PKInaCatInvFisico] PRIMARY KEY CLUSTERED 
(
	[ClaUbicacion] ASC,
	[ClaTipoInventario] ASC,
	[ClaInventarioFisico] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[InaCatTipoTara]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[InaCatTipoTara](
	[ClaUbicacion] [int] NOT NULL,
	[ClaTipoInventario] [int] NOT NULL,
	[ClaTipoTara] [int] NOT NULL,
	[NomTipoTara] [varchar](50) NULL,
	[PesoTeorico] [numeric](22, 4) NULL,
	[BajaLogica] [tinyint] NULL DEFAULT ((0)),
	[FechaBajaLogica] [datetime] NULL,
	[ClaUsuarioMod] [int] NULL,
	[FechaUltimaMod] [datetime] NULL DEFAULT (getdate()),
	[NombrePCMod] [varchar](50) NULL,
 CONSTRAINT [PKInaCatTipoTara] PRIMARY KEY CLUSTERED 
(
	[ClaUbicacion] ASC,
	[ClaTipoInventario] ASC,
	[ClaTipoTara] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[InaCatUsoFisico]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[InaCatUsoFisico](
	[ClaUsoFisico] [int] NOT NULL,
	[ClaTipoInventario] [int] NOT NULL,
	[NomUsoFisico] [varchar](50) NULL,
	[BajaLogica] [tinyint] NULL DEFAULT ((0)),
	[FechaBajaLogica] [datetime] NULL,
	[ClaUsuarioMod] [int] NULL,
	[FechaUltimaMod] [datetime] NULL DEFAULT (getdate()),
	[NombrePCMod] [varchar](50) NULL,
 CONSTRAINT [PK_InaCatUsoFisico] PRIMARY KEY CLUSTERED 
(
	[ClaUsoFisico] ASC,
	[ClaTipoInventario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[InvCatAbreviacion]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[InvCatAbreviacion](
	[Abreviacion] [varchar](5) NOT NULL,
	[Descripcion] [varchar](30) NULL,
PRIMARY KEY CLUSTERED 
(
	[Abreviacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[InvCatAgrupadorInventarioFisico]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[InvCatAgrupadorInventarioFisico](
	[ClaAgrupadorInventarioFisico] [int] NOT NULL,
	[NombreAgrupadorInventarioFisico] [varchar](50) NULL,
	[BajaLogica] [int] NULL,
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL,
	[NombrePcMod] [varchar](64) NULL,
	[ClaUsuarioMod] [int] NULL,
	[FechaIns] [datetime] NULL,
	[ClaUsuarioIns] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ClaAgrupadorInventarioFisico] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[InvCatAlmacen]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[InvCatAlmacen](
	[ClaAlmacen] [int] NOT NULL,
	[ClaTipoInventario] [int] NOT NULL,
	[ClaUbicacion] [int] NOT NULL,
	[NomAlmacen] [varchar](50) NOT NULL,
	[PermiteExistenciaNegativa] [tinyint] NULL CONSTRAINT [DF__InvCatAlm__Permi__3D958C01]  DEFAULT ((0)),
	[UltimoNivelAfectable] [tinyint] NULL,
	[BajaLogica] [tinyint] NULL CONSTRAINT [DF__InvCatAlm__BajaL__3E89B03A]  DEFAULT ((0)),
	[FechaBajaLogica] [datetime] NULL CONSTRAINT [DF__InvCatAlm__Fecha__3F7DD473]  DEFAULT (getdate()),
	[FechaUltimaMod] [datetime] NOT NULL CONSTRAINT [DF__InvCatAlm__Fecha__4071F8AC]  DEFAULT (getdate()),
	[ClaUsuarioMod] [int] NOT NULL,
	[NombrePcMod] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ClaAlmacen] ASC,
	[ClaTipoInventario] ASC,
	[ClaUbicacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[InvCatAreaInventarioFisico]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[InvCatAreaInventarioFisico](
	[ClaAreaInventarioFisico] [int] NOT NULL,
	[NombreAreaInventarioFisico] [varchar](50) NULL,
	[BajaLogica] [int] NOT NULL,
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL,
	[FechaIns] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ClaAreaInventarioFisico] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[InvCatEstilos]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[InvCatEstilos](
	[ClaEstilo] [int] NOT NULL,
	[ClaUbicacion] [int] NOT NULL,
	[ClaTipoInventario] [int] NOT NULL,
	[ClaReporte] [int] NULL,
	[NomEstilos] [varchar](50) NOT NULL,
	[BajaLogica] [tinyint] NULL CONSTRAINT [DF__InvCatEst__BajaL__425A411E]  DEFAULT ((0)),
	[FechaBajaLogica] [datetime] NULL CONSTRAINT [DF__InvCatEst__Fecha__434E6557]  DEFAULT (getdate()),
	[FechaUltimaMod] [datetime] NOT NULL CONSTRAINT [DF__InvCatEst__Fecha__44428990]  DEFAULT (getdate()),
	[ClaUsuarioMod] [int] NOT NULL,
	[NombrePcMod] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ClaEstilo] ASC,
	[ClaUbicacion] ASC,
	[ClaTipoInventario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[InvCatGrupoTMA]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[InvCatGrupoTMA](
	[ClaGrupoTMA] [int] NOT NULL,
	[ClaTipoInventario] [int] NOT NULL,
	[ClaTipoTramite] [int] NULL,
	[NomGrupoTMA] [varchar](50) NOT NULL,
	[MaximaDiferencia] [numeric](22, 4) NULL,
	[NumeroObjeto] [int] NOT NULL,
	[PorcentajeTolerancia] [numeric](22, 4) NOT NULL,
	[SignificadoEntero1] [varchar](20) NULL,
	[SignificadoEntero2] [varchar](20) NULL,
	[SignificadoEntero3] [varchar](20) NULL,
	[SignificadoEntero4] [varchar](20) NULL,
	[SignificadoEntero5] [varchar](20) NULL,
	[SignificadoEntero6] [varchar](20) NULL,
	[SignificadoEntero7] [varchar](20) NULL,
	[SignificadoEntero8] [varchar](20) NULL,
	[SignificadoEntero9] [varchar](20) NULL,
	[SignificadoEntero10] [varchar](20) NULL,
	[SignificadoTexto1] [varchar](20) NULL,
	[SignificadoTexto2] [varchar](20) NULL,
	[SignificadoTexto3] [varchar](20) NULL,
	[SignificadoTexto4] [varchar](20) NULL,
	[SignificadoTexto5] [varchar](20) NULL,
	[SignificadoTexto6] [varchar](20) NULL,
	[SignificadoTexto7] [varchar](20) NULL,
	[SignificadoTexto8] [varchar](20) NULL,
	[SignificadoTexto9] [varchar](20) NULL,
	[SignificadoTexto10] [varchar](20) NULL,
	[BajaLogica] [tinyint] NULL CONSTRAINT [DF__InvCatGru__BajaL__462AD202]  DEFAULT ((0)),
	[FechaBajaLogica] [datetime] NULL CONSTRAINT [DF__InvCatGru__Fecha__471EF63B]  DEFAULT (getdate()),
	[FechaUltimaMod] [datetime] NOT NULL CONSTRAINT [DF__InvCatGru__Fecha__48131A74]  DEFAULT (getdate()),
	[ClaUsuarioMod] [int] NOT NULL,
	[NombrePcMod] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ClaGrupoTMA] ASC,
	[ClaTipoInventario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[InvCatGrupoTMA2]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[InvCatGrupoTMA2](
	[ClaGrupoTMA2] [int] NOT NULL,
	[ClaTipoInventario] [int] NOT NULL,
	[NomGrupoTMA2] [varchar](50) NOT NULL,
	[EsBascula] [tinyint] NOT NULL CONSTRAINT [DF__InvCatGru__EsBas__49FB62E6]  DEFAULT ((0)),
	[BajaLogica] [tinyint] NULL CONSTRAINT [DF__InvCatGru__BajaL__4AEF871F]  DEFAULT ((0)),
	[FechaBajaLogica] [datetime] NULL CONSTRAINT [DF__InvCatGru__Fecha__4BE3AB58]  DEFAULT (getdate()),
	[FechaUltimaMod] [datetime] NOT NULL CONSTRAINT [DF__InvCatGru__Fecha__4CD7CF91]  DEFAULT (getdate()),
	[ClaUsuarioMod] [int] NOT NULL,
	[NombrePcMod] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ClaGrupoTMA2] ASC,
	[ClaTipoInventario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[InvCatListaInvDet]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[InvCatListaInvDet](
	[ClaLista] [int] NOT NULL,
	[ClaUbicacion] [int] NOT NULL,
	[IdRenglon] [int] NOT NULL,
	[ClaTipoInventario] [int] NOT NULL,
	[ClaArticulo] [int] NULL,
	[ClaUnidadConteo] [int] NULL,
	[FactorConversion] [numeric](22, 4) NULL,
	[BajaLogica] [int] NULL,
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL,
	[ClaUsuarioMod] [int] NOT NULL,
	[NombrePcMod] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ClaLista] ASC,
	[ClaUbicacion] ASC,
	[IdRenglon] ASC,
	[ClaTipoInventario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[InvCatListaInvEnc]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[InvCatListaInvEnc](
	[ClaLista] [int] NOT NULL,
	[ClaUbicacion] [int] NOT NULL,
	[ClaTipoInventario] [int] NOT NULL,
	[ClaAlmacen] [int] NULL,
	[ClaSeccion] [int] NULL,
	[ClaSubAlmacen] [int] NULL,
	[ClaSubSubAlmacen] [int] NULL,
	[NomListaInvEnc] [varchar](50) NULL,
	[PermiteFactorConversion] [tinyint] NULL,
	[PermiteReferencia] [tinyint] NULL,
	[PermiteUnidad] [tinyint] NULL,
	[BajaLogica] [tinyint] NULL,
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL,
	[ClaUsuarioMod] [int] NOT NULL,
	[NombrePcMod] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ClaLista] ASC,
	[ClaUbicacion] ASC,
	[ClaTipoInventario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[InvCatMotivosInv]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[InvCatMotivosInv](
	[ClaMotivoInventario] [int] NOT NULL,
	[ClaTipoInventario] [int] NOT NULL,
	[ClaUbicacion] [int] NOT NULL,
	[ClaTipoMotivo] [int] NULL,
	[NomMotivosInv] [varchar](50) NULL,
	[BajaLogica] [tinyint] NULL CONSTRAINT [DF__InvCatMot__BajaL__593DA676]  DEFAULT ((0)),
	[FechaBajaLogica] [datetime] NULL CONSTRAINT [DF__InvCatMot__Fecha__5A31CAAF]  DEFAULT (getdate()),
	[FechaUltimaMod] [datetime] NOT NULL CONSTRAINT [DF__InvCatMot__Fecha__5B25EEE8]  DEFAULT (getdate()),
	[ClaUsuarioMod] [int] NOT NULL,
	[NombrePcMod] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ClaMotivoInventario] ASC,
	[ClaTipoInventario] ASC,
	[ClaUbicacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[InvCatSeccion]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[InvCatSeccion](
	[ClaSeccion] [int] NOT NULL,
	[ClaUbicacion] [int] NOT NULL,
	[ClaAlmacen] [int] NOT NULL,
	[ClaSubAlmacen] [int] NOT NULL,
	[ClaSubSubAlmacen] [int] NOT NULL,
	[ClaTipoInventario] [int] NOT NULL,
	[NomSeccion] [varchar](50) NULL,
	[PermiteExistenciaNegativa] [tinyint] NULL,
	[UltimoNivelAfectable] [tinyint] NULL,
	[BajaLogica] [tinyint] NULL,
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL,
	[ClaUsuarioMod] [int] NOT NULL,
	[NombrePcMod] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ClaAlmacen] ASC,
	[ClaSubAlmacen] ASC,
	[ClaSubSubAlmacen] ASC,
	[ClaSeccion] ASC,
	[ClaTipoInventario] ASC,
	[ClaUbicacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[InvCatSubAlmacen]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[InvCatSubAlmacen](
	[ClaSubAlmacen] [int] NOT NULL,
	[ClaAlmacen] [int] NOT NULL,
	[ClaTipoInventario] [int] NOT NULL,
	[ClaUbicacion] [int] NOT NULL,
	[NomSubAlmacen] [varchar](50) NOT NULL,
	[PermiteExistenciaNegativa] [tinyint] NULL CONSTRAINT [DF__InvCatSub__Permi__61D2EC77]  DEFAULT ((0)),
	[UltimoNivelAfectable] [tinyint] NULL,
	[BajaLogica] [tinyint] NULL CONSTRAINT [DF__InvCatSub__BajaL__62C710B0]  DEFAULT ((0)),
	[FechaBajaLogica] [datetime] NULL CONSTRAINT [DF__InvCatSub__Fecha__63BB34E9]  DEFAULT (getdate()),
	[FechaUltimaMod] [datetime] NOT NULL CONSTRAINT [DF__InvCatSub__Fecha__64AF5922]  DEFAULT (getdate()),
	[ClaUsuarioMod] [int] NOT NULL,
	[NombrePcMod] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ClaAlmacen] ASC,
	[ClaSubAlmacen] ASC,
	[ClaTipoInventario] ASC,
	[ClaUbicacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[InvCatSubSubAlmacen]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[InvCatSubSubAlmacen](
	[ClaSubSubAlmacen] [int] NOT NULL,
	[ClaSubAlmacen] [int] NOT NULL,
	[ClaAlmacen] [int] NOT NULL,
	[ClaUbicacion] [int] NOT NULL,
	[ClaTipoInventario] [int] NOT NULL,
	[NomSubSubAlmacen] [varchar](50) NOT NULL,
	[PermiteExistenciaNegativa] [tinyint] NULL CONSTRAINT [DF__InvCatSub__Permi__6697A194]  DEFAULT ((0)),
	[UltimoNivelAfectable] [tinyint] NULL,
	[BajaLogica] [tinyint] NULL CONSTRAINT [DF__InvCatSub__BajaL__678BC5CD]  DEFAULT ((0)),
	[FechaBajaLogica] [datetime] NULL CONSTRAINT [DF__InvCatSub__Fecha__687FEA06]  DEFAULT (getdate()),
	[FechaUltimaMod] [datetime] NOT NULL CONSTRAINT [DF__InvCatSub__Fecha__69740E3F]  DEFAULT (getdate()),
	[ClaUsuarioMod] [int] NOT NULL,
	[NombrePcMod] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ClaAlmacen] ASC,
	[ClaSubAlmacen] ASC,
	[ClaSubSubAlmacen] ASC,
	[ClaTipoInventario] ASC,
	[ClaUbicacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[InvCatTiempoOriDest]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[InvCatTiempoOriDest](
	[ClaGrupoTransporte] [int] NOT NULL,
	[ClaUbicacionDestino] [int] NOT NULL,
	[ClaUbicacionOrigen] [int] NOT NULL,
	[ClaTipoInventario] [int] NOT NULL,
	[TiempoEstimado] [numeric](22, 4) NULL,
	[TiempoMaximo] [numeric](22, 4) NULL,
	[BajaLogica] [tinyint] NULL,
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL,
	[ClaUsuarioMod] [int] NOT NULL,
	[NombrePcMod] [varchar](50) NOT NULL,
 CONSTRAINT [PKInvCatTiempoOriDest] PRIMARY KEY CLUSTERED 
(
	[ClaGrupoTransporte] ASC,
	[ClaUbicacionDestino] ASC,
	[ClaUbicacionOrigen] ASC,
	[ClaTipoInventario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[InvCatTipoClaveMov]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[InvCatTipoClaveMov](
	[ClaUbicacion] [int] NOT NULL,
	[ClaTipoInventario] [int] NOT NULL,
	[ClaTipoClaveMovimiento] [int] NOT NULL,
	[NomTipoClaveMovimiento] [varchar](50) NULL,
	[BajaLogica] [tinyint] NULL,
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NULL,
	[ClaUsuarioMod] [int] NULL,
	[NombrePcMod] [varchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[ClaUbicacion] ASC,
	[ClaTipoInventario] ASC,
	[ClaTipoClaveMovimiento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[InvCatTipoInv]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[InvCatTipoInv](
	[ClaTipoInventario] [int] NOT NULL,
	[NomTipoInv] [varchar](50) NOT NULL,
	[BajaLogica] [tinyint] NULL CONSTRAINT [DF__InvCatTip__BajaL__72095440]  DEFAULT ((0)),
	[FechaBajaLogica] [datetime] NULL CONSTRAINT [DF__InvCatTip__Fecha__72FD7879]  DEFAULT (getdate()),
	[FechaUltimaMod] [datetime] NOT NULL CONSTRAINT [DF__InvCatTip__Fecha__73F19CB2]  DEFAULT (getdate()),
	[ClaUsuarioMod] [int] NOT NULL,
	[NombrePcMod] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ClaTipoInventario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[InvCatTipoMotivos]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[InvCatTipoMotivos](
	[ClaTipoMotivo] [int] NOT NULL,
	[ClaTipoInventario] [int] NOT NULL,
	[NomTipoMotivos] [varchar](75) NULL,
	[BajaLogica] [tinyint] NULL CONSTRAINT [DF__InvCatTip__BajaL__75D9E524]  DEFAULT ((0)),
	[FechaBajaLogica] [datetime] NULL CONSTRAINT [DF__InvCatTip__Fecha__76CE095D]  DEFAULT (getdate()),
	[FechaUltimaMod] [datetime] NOT NULL CONSTRAINT [DF__InvCatTip__Fecha__77C22D96]  DEFAULT (getdate()),
	[ClaUsuarioMod] [int] NOT NULL,
	[NombrePcMod] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ClaTipoMotivo] ASC,
	[ClaTipoInventario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[InvCatTipoTaraInventarioFisico]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[InvCatTipoTaraInventarioFisico](
	[ClaUbicacion] [int] NOT NULL,
	[ClaTipoTaraInventarioFisico] [int] NOT NULL,
	[NombreTipoTaraInventarioFisico] [char](50) NULL,
	[PesoKgs] [float] NULL,
	[BajaLogica] [int] NOT NULL,
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL,
	[FechaIns] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ClaUbicacion] ASC,
	[ClaTipoTaraInventarioFisico] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[InvCatTMA]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[InvCatTMA](
	[ClaTMA] [int] NOT NULL,
	[ClaTipoInventario] [int] NOT NULL,
	[ClaGrupoTMA] [int] NOT NULL,
	[ClaveTMA] [varchar](10) NOT NULL,
	[ClaGrupoTMA2] [int] NOT NULL,
	[ClaArticuloCuentaPuente] [int] NULL,
	[ClaTMAContraparte] [int] NULL,
	[ClaTMAEntrada] [int] NULL,
	[ClaTMASalida] [int] NULL,
	[NomTMA] [varchar](75) NULL,
	[AfectaCuentaPuente] [tinyint] NULL,
	[EntradaOSalida] [int] NULL,
	[EsCuentaPuente] [tinyint] NULL,
	[EsMercanciaEnTransito] [tinyint] NULL,
	[RequiereArticuloActivo] [tinyint] NULL,
	[SignificadoEntero1] [varchar](10) NULL,
	[SignificadoEntero2] [varchar](10) NULL,
	[SignificadoEntero3] [varchar](10) NULL,
	[SignificadoEntero4] [varchar](10) NULL,
	[SignificadoEntero5] [varchar](10) NULL,
	[SignificadoEntero6] [varchar](10) NULL,
	[SignificadoTexto1] [varchar](10) NULL,
	[SignificadoTexto2] [varchar](10) NULL,
	[BajaLogica] [tinyint] NULL CONSTRAINT [DF__InvCatTMA__BajaL__79AA7608]  DEFAULT ((0)),
	[FechaBajaLogica] [datetime] NULL CONSTRAINT [DF__InvCatTMA__Fecha__7A9E9A41]  DEFAULT (getdate()),
	[FechaUltimaMod] [datetime] NOT NULL CONSTRAINT [DF__InvCatTMA__Fecha__7B92BE7A]  DEFAULT (getdate()),
	[ClaUsuarioMod] [int] NOT NULL,
	[NombrePcMod] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ClaTMA] ASC,
	[ClaTipoInventario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[InvCatUsoInventarioFisico]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[InvCatUsoInventarioFisico](
	[ClaUbicacion] [int] NOT NULL,
	[ClaUsoInventarioFisico] [int] NOT NULL,
	[NombreUsoInventarioFisico] [char](80) NULL,
	[BajaLogica] [int] NOT NULL,
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL,
	[FechaIns] [datetime] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ClaUbicacion] ASC,
	[ClaUsoInventarioFisico] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[InvRelAgrupadorFamilias]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[InvRelAgrupadorFamilias](
	[ClaUbicacion] [int] NOT NULL,
	[ClaFamilia] [int] NOT NULL,
	[ClaAgrupadorInventarioFisico] [int] NULL,
	[PorcentajeMaxTeoricoReal] [float] NULL,
	[BajaLogica] [int] NULL,
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL,
	[NombrePcMod] [varchar](64) NULL,
	[ClaUsuarioMod] [int] NULL,
	[FechaIns] [datetime] NULL,
	[ClaUsuarioIns] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ClaUbicacion] ASC,
	[ClaFamilia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[InvRelListaInvResp]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[InvRelListaInvResp](
	[ClaLista] [int] NOT NULL,
	[ClaUbicacion] [int] NOT NULL,
	[ClaUsuario] [int] NOT NULL,
	[ClaTipoInventario] [int] NOT NULL,
	[BajaLogica] [tinyint] NULL,
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL,
	[ClaUsuarioMod] [int] NOT NULL,
	[NombrePcMod] [varchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ClaLista] ASC,
	[ClaUbicacion] ASC,
	[ClaUsuario] ASC,
	[ClaTipoInventario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[InvRelProductoPesajeReal]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[InvRelProductoPesajeReal](
	[ClaUbicacion] [int] NOT NULL,
	[ClaProducto] [int] NOT NULL,
	[BajaLogica] [int] NOT NULL,
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL,
	[FechaIns] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ClaUbicacion] ASC,
	[ClaProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[InvRelTipoInventarioUsuario]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[InvRelTipoInventarioUsuario](
	[IdTipoInventarioUsuario] [int] IDENTITY(1,1) NOT NULL,
	[IdUsuario] [int] NOT NULL,
	[ClaSistema] [int] NOT NULL,
	[ClaUbicacion] [int] NOT NULL,
	[ClaTipoInventario] [int] NOT NULL,
	[BajaLogica] [tinyint] NULL CONSTRAINT [DF__InvRelTip__BajaL__014B97D0]  DEFAULT ((0)),
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL CONSTRAINT [DF__InvRelTip__Fecha__023FBC09]  DEFAULT (getdate()),
	[ClaUsuarioMod] [int] NULL,
	[NombrePcMod] [varchar](50) NOT NULL CONSTRAINT [DF__InvRelTip__Nombr__0333E042]  DEFAULT (host_name()),
PRIMARY KEY CLUSTERED 
(
	[IdTipoInventarioUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[lararea]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[lararea](
	[ClaArea] [int] NOT NULL,
	[ClaveArea] [int] NOT NULL,
	[NombreArea] [varchar](100) NOT NULL,
	[ClaDepartamento] [int] NULL,
	[AcumulaSN] [tinyint] NULL,
	[ServicioSN] [tinyint] NULL,
	[BajaLogica] [int] NOT NULL,
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL,
	[NombrePcMod] [varchar](64) NOT NULL,
	[ClaUsuarioMod] [int] NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LarCatarea]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LarCatarea](
	[ClaArea] [int] NOT NULL,
	[ClaveArea] [int] NOT NULL,
	[NombreArea] [varchar](100) NOT NULL,
	[ClaDepartamento] [int] NULL,
	[AcumulaSN] [tinyint] NULL,
	[ServicioSN] [tinyint] NULL,
	[BajaLogica] [int] NOT NULL,
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL,
	[NombrePcMod] [varchar](64) NOT NULL,
	[ClaUsuarioMod] [int] NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[LarCatDepartamento]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[LarCatDepartamento](
	[ClaDepartamento] [int] NOT NULL,
	[ClaveDepartamento] [int] NOT NULL,
	[NombreDepartamento] [varchar](100) NOT NULL,
	[ClaTipoDepartamento] [int] NOT NULL,
	[BajaLogica] [int] NOT NULL,
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL,
	[NombrePcMod] [varchar](64) NOT NULL,
	[ClaUsuarioMod] [int] NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ManCatArea]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ManCatArea](
	[ClaArea] [int] NOT NULL,
	[ClaveArea] [int] NOT NULL,
	[NombreArea] [varchar](100) NOT NULL,
	[ClaDepartamento] [int] NULL,
	[AcumulaSN] [tinyint] NULL,
	[ServicioSN] [tinyint] NULL,
	[BajaLogica] [int] NOT NULL,
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL,
	[NombrePcMod] [varchar](64) NOT NULL,
	[ClaUsuarioMod] [int] NOT NULL,
 CONSTRAINT [PKManCatArea] PRIMARY KEY CLUSTERED 
(
	[ClaArea] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ManCatArea_Repaldo]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ManCatArea_Repaldo](
	[ClaArea] [int] NOT NULL,
	[ClaveArea] [int] NOT NULL,
	[NombreArea] [varchar](100) NOT NULL,
	[ClaDepartamento] [int] NOT NULL,
	[AcumulaSN] [tinyint] NULL,
	[ServicioSN] [tinyint] NULL,
	[BajaLogica] [int] NOT NULL,
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL,
	[NombrePcMod] [varchar](64) NOT NULL,
	[ClaUsuarioMod] [int] NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ManCatArticuloDimension]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ManCatArticuloDimension](
	[ClaArticulo] [int] NOT NULL,
	[DiametroMtsInd] [numeric](18, 4) NULL,
	[LargoMtsInd] [numeric](18, 4) NULL,
	[AltoMtsInd] [numeric](18, 4) NULL,
	[AnchoMtsInd] [numeric](18, 4) NULL,
	[PesoTaraKgsInd] [numeric](18, 4) NULL,
	[DiametroMtsAgrup] [numeric](18, 4) NULL,
	[LargoMtsAgrup] [numeric](18, 4) NULL,
	[AltoMtsAgrup] [numeric](18, 4) NULL,
	[AnchoMtsAgrup] [numeric](18, 4) NULL,
	[PesoTaraKgsAgrup] [numeric](18, 4) NULL,
	[Comentarios] [varchar](250) NULL,
	[FechaUltimaMod] [datetime] NOT NULL,
	[NombrePcMod] [varchar](64) NOT NULL,
	[ClaUsuarioMod] [int] NOT NULL,
 CONSTRAINT [PKManCatArticuloDimension] PRIMARY KEY CLUSTERED 
(
	[ClaArticulo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ManCatDatosPorPlanta]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ManCatDatosPorPlanta](
	[ClaUbicacion] [int] NOT NULL,
	[ClaProducto] [int] NOT NULL,
	[ClaGrupoCosteo] [int] NULL,
	[FechaUltimaMod] [datetime] NULL,
	[BajaLogica] [int] NULL,
	[FechaBajaLogica] [datetime] NULL,
	[FechaIns] [datetime] NULL,
 CONSTRAINT [PK_ManCatDatosPorPlanta] PRIMARY KEY CLUSTERED 
(
	[ClaUbicacion] ASC,
	[ClaProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ManCatDatoTecnico]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ManCatDatoTecnico](
	[ClaTecnologia] [int] NOT NULL,
	[ClaDatoTecnico] [int] NOT NULL,
	[NomDatoTecnico] [varchar](100) NOT NULL,
	[BajaLogica] [int] NOT NULL,
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL,
	[NombrePcMod] [varchar](64) NOT NULL,
	[ClaUsuarioMod] [int] NOT NULL,
 CONSTRAINT [PKManCatDatoTecnico] PRIMARY KEY CLUSTERED 
(
	[ClaTecnologia] ASC,
	[ClaDatoTecnico] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ManCatDepartamento]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ManCatDepartamento](
	[ClaDepartamento] [int] NOT NULL,
	[ClaveDepartamento] [int] NOT NULL,
	[NombreDepartamento] [varchar](100) NOT NULL,
	[ClaTipoDepartamento] [int] NOT NULL,
	[BajaLogica] [int] NOT NULL,
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL,
	[NombrePcMod] [varchar](64) NOT NULL,
	[ClaUsuarioMod] [int] NOT NULL,
 CONSTRAINT [PKManCatDepartamento] PRIMARY KEY CLUSTERED 
(
	[ClaDepartamento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ManCatEmpaque]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ManCatEmpaque](
	[ClaGpoEmpaque] [int] NOT NULL,
	[ClaTipoEmpaque] [int] NOT NULL,
	[ClaEmpaque] [int] NOT NULL,
	[NomEmpaque] [varchar](100) NOT NULL,
	[BajaLogica] [int] NOT NULL,
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL,
	[NombrePcMod] [varchar](64) NOT NULL,
	[ClaUsuarioMod] [int] NOT NULL,
	[ClaTransporte] [int] NULL,
 CONSTRAINT [PK_ManCatEmpaque] PRIMARY KEY CLUSTERED 
(
	[ClaGpoEmpaque] ASC,
	[ClaTipoEmpaque] ASC,
	[ClaEmpaque] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ManCatFamilia]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ManCatFamilia](
	[ClaFamilia] [int] NOT NULL,
	[NombreFamilia] [char](30) NULL,
	[BajaLogica] [int] NOT NULL,
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL,
	[FechaIns] [datetime] NULL,
 CONSTRAINT [PK_ManCatFamilia] PRIMARY KEY CLUSTERED 
(
	[ClaFamilia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ManCatFamNvosArt]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ManCatFamNvosArt](
	[ClaFamilia] [int] NOT NULL,
	[ClaSubFamilia] [int] NOT NULL,
	[ClaTipoUbicacion] [int] NULL,
	[BajaLogica] [int] NOT NULL,
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL,
	[NombrePcMod] [varchar](64) NOT NULL,
	[ClaUsuarioMod] [int] NOT NULL,
 CONSTRAINT [PKManCatFamNvosArt] PRIMARY KEY CLUSTERED 
(
	[ClaFamilia] ASC,
	[ClaSubFamilia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ManCatGpoEmpaque]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ManCatGpoEmpaque](
	[ClaGpoEmpaque] [int] NOT NULL,
	[NomGpoEmpaque] [varchar](100) NOT NULL,
	[BajaLogica] [int] NOT NULL,
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL,
	[NombrePcMod] [varchar](64) NOT NULL,
	[ClaUsuarioMod] [int] NOT NULL,
 CONSTRAINT [PKManCatGpoEmpaque] PRIMARY KEY CLUSTERED 
(
	[ClaGpoEmpaque] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ManCatGpoMaquina]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ManCatGpoMaquina](
	[ClaPlanta] [int] NOT NULL,
	[ClaGpoMaquina] [varchar](30) NOT NULL,
	[NomGpoMaquina] [varchar](100) NOT NULL,
	[ClaTecnologia] [int] NOT NULL,
	[Velocidad] [numeric](18, 4) NULL,
	[ClaTipoVTVel] [int] NULL,
	[ClaUnidadVTVel] [int] NULL,
	[TiempoInherente] [numeric](18, 4) NULL,
	[ClaTipoVTTiempo] [int] NULL,
	[ClaUnidadVTTiempo] [int] NULL,
	[BajaLogica] [int] NOT NULL,
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL,
	[NombrePcMod] [varchar](64) NOT NULL,
	[ClaUsuarioMod] [int] NOT NULL,
 CONSTRAINT [PKManCatGpoMaquina] PRIMARY KEY CLUSTERED 
(
	[ClaPlanta] ASC,
	[ClaGpoMaquina] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ManCatMaquina]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ManCatMaquina](
	[ClaPlanta] [int] NOT NULL,
	[ClaMaquina] [varchar](30) NOT NULL,
	[NomMaquina] [varchar](100) NOT NULL,
	[ClaGpoMaquina] [varchar](30) NOT NULL,
	[ClaArea] [int] NOT NULL,
	[ClaTipoReporteProd] [int] NOT NULL,
	[PorcMaxEfic] [numeric](18, 4) NULL,
	[NumLinInst] [int] NULL,
	[GeneraEntAutSN] [tinyint] NULL,
	[Comentarios] [varchar](250) NULL,
	[BajaLogica] [int] NOT NULL,
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL,
	[NombrePcMod] [varchar](64) NOT NULL,
	[ClaUsuarioMod] [int] NOT NULL,
 CONSTRAINT [PKManCatMaquina] PRIMARY KEY CLUSTERED 
(
	[ClaPlanta] ASC,
	[ClaMaquina] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ManCatMaterial]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ManCatMaterial](
	[ClaMaterial] [int] NOT NULL,
	[NomMaterial] [varchar](100) NOT NULL,
	[EsEtiqueta] [tinyint] NOT NULL,
	[BajaLogica] [int] NOT NULL,
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL,
	[NombrePcMod] [varchar](64) NOT NULL,
	[ClaUsuarioMod] [int] NOT NULL,
 CONSTRAINT [PKManCatMaterial] PRIMARY KEY CLUSTERED 
(
	[ClaMaterial] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ManCatNoDesperdicios]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ManCatNoDesperdicios](
	[ClaArticulo] [int] NOT NULL,
	[BajaLogica] [int] NOT NULL,
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL,
	[NombrePcMod] [varchar](64) NOT NULL,
	[ClaUsuarioMod] [int] NOT NULL,
 CONSTRAINT [PKManCatNoDesperdicios] PRIMARY KEY CLUSTERED 
(
	[ClaArticulo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ManCatProducto]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ManCatProducto](
	[ClaProducto] [int] NOT NULL,
	[ClaveProducto] [char](20) NULL,
	[ClaFamilia] [int] NULL,
	[ClaSubFamilia] [int] NULL,
	[ClaTipoProducto] [int] NULL,
	[PesoTeorico] [float] NULL,
	[ClaUnidadProduccion] [int] NULL,
	[ClaUnidadVenta] [int] NULL,
	[ClaGrupoEstadistico] [int] NULL,
	[NombreProducto] [char](250) NULL,
	[NombreCorto] [char](250) NULL,
	[FactorProduccionVentas] [float] NULL,
	[FactorCubicaje] [float] NULL,
	[FactorPesoVolumen] [float] NULL,
	[EsCuna] [tinyint] NULL CONSTRAINT [DF_ManCatProducto_EsCuna]  DEFAULT ((0)),
	[ClaGrupoCosteo] [int] NULL,
	[EsControlPorLote] [tinyint] NOT NULL CONSTRAINT [DF_ManCatProducto_EsControlPorLote]  DEFAULT ((0)),
	[FechaUltimaMod] [datetime] NULL CONSTRAINT [DF_ManCatProducto_FechaUltimaMod]  DEFAULT (getdate()),
	[NombrePcMod] [varchar](64) NULL,
	[ClaUsuarioMod] [int] NULL,
	[FechaIns] [datetime] NULL CONSTRAINT [DF_ManCatProducto_FechaIns]  DEFAULT (getdate()),
	[ClaUsuarioIns] [int] NULL,
	[BajaLogica] [int] NOT NULL CONSTRAINT [DF_ManCatProducto_BajaLogica]  DEFAULT ((0)),
	[FechaBajaLogica] [datetime] NULL,
	[LoteMinimo] [float] NULL,
	[ClaArea] [int] NULL,
 CONSTRAINT [PK_ManCatProducto] PRIMARY KEY CLUSTERED 
(
	[ClaProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ManCatTecnologia]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ManCatTecnologia](
	[ClaTecnologia] [int] NOT NULL,
	[NomTecnologia] [varchar](100) NOT NULL,
	[BajaLogica] [int] NOT NULL,
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL,
	[NombrePcMod] [varchar](64) NOT NULL,
	[ClaUsuarioMod] [int] NOT NULL,
 CONSTRAINT [PKManCatTecnologia] PRIMARY KEY CLUSTERED 
(
	[ClaTecnologia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ManCatTipoDepartamento]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ManCatTipoDepartamento](
	[ClaTipoDepartamento] [int] NOT NULL,
	[NombreTipoDepartamento] [varchar](100) NOT NULL,
	[BajaLogica] [int] NOT NULL,
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL,
	[NombrePcMod] [varchar](64) NOT NULL,
	[ClaUsuarioMod] [int] NULL,
 CONSTRAINT [PKManCatTipoDepartamento] PRIMARY KEY CLUSTERED 
(
	[ClaTipoDepartamento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ManCatTipoEmpaque]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ManCatTipoEmpaque](
	[ClaTipoEmpaque] [int] NOT NULL,
	[NomTipoEmpaque] [varchar](100) NOT NULL,
	[BajaLogica] [int] NOT NULL,
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL,
	[NombrePcMod] [varchar](64) NOT NULL,
	[ClaUsuarioMod] [int] NOT NULL,
 CONSTRAINT [PKManCatTipoEmpaque] PRIMARY KEY CLUSTERED 
(
	[ClaTipoEmpaque] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ManCatTipoReporteProd]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ManCatTipoReporteProd](
	[ClaTipoReporteProd] [int] NOT NULL,
	[NomTipoReporteProd] [varchar](100) NOT NULL,
	[BajaLogica] [int] NOT NULL,
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL,
	[NombrePcMod] [varchar](64) NOT NULL,
	[ClaUsuarioMod] [int] NOT NULL,
 CONSTRAINT [PKManCatTipoReporteProd] PRIMARY KEY CLUSTERED 
(
	[ClaTipoReporteProd] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ManCatTipoVT]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ManCatTipoVT](
	[ClaTipoVT] [int] NOT NULL,
	[NomTipoVT] [varchar](100) NOT NULL,
	[BajaLogica] [int] NOT NULL,
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL,
	[NombrePcMod] [varchar](64) NOT NULL,
	[ClaUsuarioMod] [int] NOT NULL,
 CONSTRAINT [PKManCatTipoVT] PRIMARY KEY CLUSTERED 
(
	[ClaTipoVT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ManCatUnidadVT]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ManCatUnidadVT](
	[ClaTipoVT] [int] NOT NULL,
	[ClaUnidadVT] [int] NOT NULL,
	[NomUnidad] [varchar](100) NOT NULL,
	[BajaLogica] [int] NOT NULL,
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL,
	[NombrePcMod] [varchar](64) NOT NULL,
	[ClaUsuarioMod] [int] NOT NULL,
 CONSTRAINT [PKManCatUnidad] PRIMARY KEY CLUSTERED 
(
	[ClaTipoVT] ASC,
	[ClaUnidadVT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ManRelDepartamentoArea]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ManRelDepartamentoArea](
	[ClaUbicacion] [int] NOT NULL,
	[ClaDepartamento] [int] NOT NULL,
	[ClaArea] [int] NOT NULL,
	[BajaLogica] [int] NULL,
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NULL,
	[NombrePcMod] [varchar](64) NULL,
	[ClaUsuarioMod] [int] NULL,
 CONSTRAINT [PK_ManRelDepartamentoArea] PRIMARY KEY CLUSTERED 
(
	[ClaUbicacion] ASC,
	[ClaDepartamento] ASC,
	[ClaArea] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[manreldepartamentoarealar]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[manreldepartamentoarealar](
	[ClaUbicacion] [int] NOT NULL,
	[ClaDepartamento] [int] NOT NULL,
	[ClaArea] [int] NOT NULL,
	[BajaLogica] [int] NULL,
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NULL,
	[NombrePcMod] [varchar](64) NULL,
	[ClaUsuarioMod] [int] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ManRelUbicacionArea]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ManRelUbicacionArea](
	[ClaUbicacion] [int] NOT NULL,
	[ClaArea] [int] NOT NULL,
	[BajaLogica] [int] NOT NULL,
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL,
	[NombrePcMod] [varchar](64) NOT NULL,
	[ClaUsuarioMod] [int] NOT NULL,
 CONSTRAINT [PKManRelUbicacionArea] PRIMARY KEY CLUSTERED 
(
	[ClaUbicacion] ASC,
	[ClaArea] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[MtoCatOT]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[MtoCatOT](
	[ClaTipoOT] [int] NOT NULL,
	[ClaOT] [int] NOT NULL,
	[NomTipoOT] [varchar](100) NOT NULL,
	[ClaUbicacion] [int] NOT NULL,
	[ClaEstatus] [int] NOT NULL,
	[NomEstatus] [varchar](50) NOT NULL,
	[BajaLogica] [int] NOT NULL,
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NULL,
	[ClaUsuarioMod] [int] NULL,
	[NombrePcMod] [varchar](50) NULL,
 CONSTRAINT [PK_MtoCatOT] PRIMARY KEY CLUSTERED 
(
	[ClaTipoOT] ASC,
	[ClaOT] ASC,
	[ClaUbicacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[NomCatArea]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NomCatArea](
	[ClaEmpresa] [int] NOT NULL,
	[ClaUbicacion] [int] NOT NULL,
	[ClaNomina] [int] NOT NULL,
	[ClaDepartamento] [int] NOT NULL,
	[ClaArea] [int] NOT NULL,
	[NomArea] [varchar](73) NULL,
	[Estatus] [int] NULL,
	[Usuario] [int] NULL,
	[BajaLogica] [int] NULL,
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NULL,
	[NombrePcMod] [varchar](64) NULL,
	[ClaUsuarioMod] [int] NULL,
 CONSTRAINT [PK_NomCatArea] PRIMARY KEY CLUSTERED 
(
	[ClaArea] ASC,
	[ClaDepartamento] ASC,
	[ClaUbicacion] ASC,
	[ClaEmpresa] ASC,
	[ClaNomina] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[NomCatDatosTimbrado]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NomCatDatosTimbrado](
	[ClaTrabajador] [int] NULL,
	[ClaNomina] [int] NULL,
	[ClaUbicacion] [int] NULL,
	[ClaEmpresa] [int] NULL,
	[NumeroCuenta] [varchar](20) NULL,
	[SalarioDiario] [numeric](15, 3) NULL,
	[ClaBanco] [int] NULL,
	[BajaLogica] [int] NULL,
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NULL,
	[NombrePcMod] [varchar](64) NULL,
	[ClaUsuarioMod] [int] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[NomCatDepartamento]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NomCatDepartamento](
	[ClaDepartamento] [int] NOT NULL,
	[ClaUbicacion] [int] NOT NULL,
	[ClaEmpresa] [int] NOT NULL,
	[ClaNomina] [int] NOT NULL,
	[NomDepartamento] [varchar](40) NULL,
	[DepartamentoDesc] [varchar](25) NULL,
	[Estatus] [int] NULL,
	[BajaLogica] [int] NOT NULL DEFAULT ((0)),
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL,
	[NombrePcMod] [varchar](64) NOT NULL,
	[ClaUsuarioMod] [int] NOT NULL,
 CONSTRAINT [PK_NomCatDepartamento] PRIMARY KEY CLUSTERED 
(
	[ClaDepartamento] ASC,
	[ClaUbicacion] ASC,
	[ClaEmpresa] ASC,
	[ClaNomina] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[NomCatIncapacidad]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NomCatIncapacidad](
	[ClaIncapacidad] [char](20) NOT NULL,
	[ClaTrabajador] [int] NOT NULL,
	[ClaNomina] [int] NOT NULL,
	[ClaUbicacion] [int] NOT NULL,
	[ClaEmpresa] [int] NOT NULL,
	[ClaMotivo] [int] NULL,
	[ClaKardex] [char](1) NULL,
	[FechaInicio] [smalldatetime] NOT NULL,
	[DiasIncapacidad] [int] NOT NULL,
	[FechaFinal] [smalldatetime] NOT NULL,
	[FolioAlta] [char](20) NULL,
	[FechaAlta] [smalldatetime] NULL,
	[Usuario] [int] NOT NULL,
	[FechaUltimaMod] [datetime] NOT NULL,
	[ClaReporte] [int] NULL,
	[FechaIns] [datetime] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[NomCatInfonavit]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NomCatInfonavit](
	[ClaEmpresa] [int] NOT NULL,
	[ClaUbicacion] [int] NOT NULL,
	[ClaNomina] [int] NOT NULL,
	[ClaTrabajador] [int] NOT NULL,
	[CreditoInfonavit] [varchar](10) NOT NULL,
	[FechaAltaInfonavit] [datetime] NULL,
	[FechaBajaInfonavit] [datetime] NULL,
	[ClaDescuento] [int] NULL,
	[InfonavitFactor] [numeric](15, 3) NULL,
	[VSM] [numeric](15, 3) NULL,
	[ImporteMensual] [numeric](15, 3) NULL,
	[DescuentoSegDanos] [int] NULL,
	[FechaUltRecalculo] [datetime] NULL,
	[FechaIns] [datetime] NULL,
	[BajaLogica] [int] NULL,
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NULL,
	[NombrePcMod] [varchar](64) NULL,
	[ClaUsuarioMod] [int] NULL,
 CONSTRAINT [NomCatInfonavit_PK] PRIMARY KEY CLUSTERED 
(
	[ClaEmpresa] ASC,
	[ClaUbicacion] ASC,
	[ClaNomina] ASC,
	[ClaTrabajador] ASC,
	[CreditoInfonavit] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[NomCatKardex]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NomCatKardex](
	[ClaKardex] [char](1) NOT NULL,
	[ClaEmpresa] [int] NOT NULL,
	[ClaUbicacion] [int] NOT NULL,
	[DesKardex] [char](40) NULL,
	[RepartoUtilidades] [int] NOT NULL,
	[RequierePase] [int] NOT NULL,
	[RequiereMotivo] [int] NOT NULL,
	[ClaGrupoEst] [int] NULL,
	[NatKardex] [int] NOT NULL,
	[Estatus] [int] NOT NULL,
	[FechaUltimaMod] [datetime] NOT NULL,
	[Usuario] [int] NOT NULL,
	[programada] [int] NULL,
	[turno12horas] [int] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[NomCatLiqImss]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NomCatLiqImss](
	[ClaEmpresa] [int] NOT NULL,
	[ClaUbicacion] [int] NOT NULL,
	[ClaLiqImss] [int] NOT NULL,
	[NumLiqImss] [varchar](20) NULL,
	[NomLiqImss] [varchar](30) NULL,
	[Estatus] [int] NOT NULL,
	[NumGuia] [varchar](5) NULL,
	[GradoRiesgo] [numeric](19, 2) NULL,
	[Delegacion] [varchar](25) NULL,
	[SubDelegacion] [varchar](25) NULL,
	[LiqDefault] [int] NULL,
	[BajaLogica] [int] NOT NULL DEFAULT ((0)),
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NULL,
	[NombrePcMod] [varchar](64) NOT NULL,
	[ClaUsuarioMod] [int] NOT NULL,
 CONSTRAINT [PK_NomCatLiqImss] PRIMARY KEY CLUSTERED 
(
	[ClaEmpresa] ASC,
	[ClaUbicacion] ASC,
	[ClaLiqImss] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[NomCatMotivo]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NomCatMotivo](
	[ClaMotivo] [int] NOT NULL,
	[ClaKardex] [varchar](1) NULL,
	[ClaEmpresa] [int] NOT NULL,
	[ClaUbicacion] [int] NOT NULL,
	[NombreMotivo] [varchar](40) NULL,
	[BajaLogica] [int] NULL,
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NULL,
	[NombrePcMod] [varchar](64) NULL,
	[ClaUsuarioMod] [int] NULL,
 CONSTRAINT [NomCatMotivo_PK] PRIMARY KEY CLUSTERED 
(
	[ClaEmpresa] ASC,
	[ClaUbicacion] ASC,
	[ClaMotivo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[NomCatPuesto]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NomCatPuesto](
	[ClaEmpresa] [int] NOT NULL,
	[ClaUbicacion] [int] NOT NULL,
	[ClaNomina] [int] NOT NULL,
	[ClaPuesto] [int] NOT NULL,
	[NombrePuesto] [varchar](64) NULL,
	[BajaLogica] [int] NULL,
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NULL,
	[NombrePcMod] [varchar](64) NULL,
	[ClaUsuarioMod] [int] NULL,
 CONSTRAINT [PK_NomCatPuesto] PRIMARY KEY CLUSTERED 
(
	[ClaEmpresa] ASC,
	[ClaUbicacion] ASC,
	[ClaNomina] ASC,
	[ClaPuesto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[NomCatPuestoNivel]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NomCatPuestoNivel](
	[ClaPuestoNivel] [int] NOT NULL,
	[NomPuestoNivel] [varchar](50) NOT NULL,
	[Abreviatura] [varchar](15) NULL,
	[BajaLogica] [int] NOT NULL CONSTRAINT [DF_NomCatPuestoNivel_BajaLogica]  DEFAULT ((0)),
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL CONSTRAINT [DF_NomCatPuestoNivel_FechaUltimaMod]  DEFAULT (getdate()),
	[NombrePcMod] [varchar](64) NOT NULL CONSTRAINT [DF_NomCatPuestoNivel_NombrePcMod]  DEFAULT (host_name()),
	[ClaUsuarioMod] [int] NULL,
 CONSTRAINT [PK_NomCatPuestoNivel] PRIMARY KEY CLUSTERED 
(
	[ClaPuestoNivel] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[NomCatTrabajador]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NomCatTrabajador](
	[ClaTrabajador] [int] NOT NULL,
	[ClaTrabajadorEUN] [int] NULL,
	[ClaNomina] [int] NOT NULL,
	[ClaUbicacion] [int] NOT NULL,
	[ClaEmpresa] [int] NOT NULL,
	[ClaDepartamento] [int] NULL,
	[ClaArea] [int] NULL,
	[NombreTrabajador] [char](20) NULL,
	[ApellidoPaterno] [char](20) NULL,
	[ApellidoMaterno] [char](20) NULL,
	[RFC] [varchar](20) NULL,
	[NSS] [varchar](15) NULL,
	[CUP] [varchar](20) NULL,
	[ClaGrupoAsignacion] [int] NULL,
	[ClaCrc] [int] NULL,
	[ClaJefe] [int] NULL,
	[ClaJefeEUN] [int] NULL,
	[EsActivo] [int] NULL,
	[BajaLogica] [int] NULL CONSTRAINT [DF__NomCatTra__BajaL__796A7EE6]  DEFAULT ((0)),
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL CONSTRAINT [DF__NomCatTra__Fecha__7A5EA31F]  DEFAULT (getdate()),
	[NombrePcMod] [varchar](64) NULL,
	[ClaUsuarioMod] [int] NULL,
	[FechaIns] [datetime] NULL CONSTRAINT [DF__NomCatTra__Fecha__7B52C758]  DEFAULT (getdate()),
	[ClaUsuarioIns] [int] NULL,
	[Foto] [image] NULL,
	[FechaNacimiento] [datetime] NULL,
	[ClaPais] [int] NULL,
	[ClaEstado] [int] NULL,
	[ClaMunicipio] [int] NULL,
	[FechaIngreso] [datetime] NULL,
	[Telefono] [char](15) NULL,
	[ClaPuesto] [int] NULL,
	[ClaEntidad] [varchar](1) NULL,
	[EstadoISN] [int] NULL,
	[SalarioDiario] [numeric](15, 3) NULL,
	[NumeroCuenta] [varchar](20) NULL,
	[ClaBanco] [int] NULL,
	[ClaLiqImss] [int] NULL,
	[Direccion] [varchar](40) NULL,
	[CodPostal] [varchar](10) NULL,
	[ClaColonia] [int] NULL,
	[GrupoSeguro] [varchar](1) NULL,
 CONSTRAINT [PK_NomCatTrabajador] PRIMARY KEY CLUSTERED 
(
	[ClaTrabajador] ASC,
	[ClaNomina] ASC,
	[ClaUbicacion] ASC,
	[ClaEmpresa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[NomCatTrabajadorAdi]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NomCatTrabajadorAdi](
	[ClaEmpresa] [int] NOT NULL,
	[ClaUbicacion] [int] NOT NULL,
	[ClaNomina] [int] NOT NULL,
	[ClaTrabajador] [int] NOT NULL,
	[NumCurp] [varchar](35) NULL,
	[BajaLogica] [int] NULL,
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NULL,
	[NombrePcMod] [varchar](64) NULL,
	[ClaUsuarioMod] [int] NULL,
 CONSTRAINT [NomCatTrabajadorAdi_PK] PRIMARY KEY CLUSTERED 
(
	[ClaEmpresa] ASC,
	[ClaUbicacion] ASC,
	[ClaNomina] ASC,
	[ClaTrabajador] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[NomCatTurno]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NomCatTurno](
	[ClaUbicacion] [int] NOT NULL,
	[ClaTurno] [int] NOT NULL,
	[Descripcion] [char](20) NOT NULL,
	[HoraEntrada] [datetime] NULL,
	[HoraSalida] [datetime] NULL,
	[BajaLogica] [int] NULL,
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NULL,
	[ClaUsuarioMod] [int] NULL,
	[NombrePcMod] [int] NULL,
 CONSTRAINT [PK_NomCatTurno] PRIMARY KEY CLUSTERED 
(
	[ClaUbicacion] ASC,
	[ClaTurno] ASC,
	[Descripcion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[NomTraAsistencia]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NomTraAsistencia](
	[ClaTrabajador] [int] NOT NULL,
	[ClaNomina] [int] NOT NULL,
	[ClaUbicacion] [int] NOT NULL,
	[ClaEmpresa] [int] NULL,
	[FechaAsistencia] [smalldatetime] NOT NULL,
	[ClaKardex] [char](1) NULL,
	[ModKardex] [char](1) NULL,
	[FechaUltimaMod] [datetime] NOT NULL,
	[HorasNormales] [float] NULL,
	[HorasExtras] [float] NULL,
	[HorasVacaciones] [float] NULL,
	[ModNormales] [float] NULL,
	[ModExtras] [float] NULL,
	[ModVacaciones] [float] NULL,
	[ModComida] [float] NULL,
	[ModCapacitacion] [float] NULL,
	[HorasComida] [float] NULL,
	[HorasCapacitacion] [float] NULL,
	[ClaTurno] [int] NULL,
	[ClaMotivo] [int] NULL,
	[Afectado] [int] NOT NULL,
	[Estatus] [int] NOT NULL,
	[Usuario] [int] NULL,
	[UsuarioAutoriza] [int] NULL,
	[EntradaPlanta] [datetime] NULL,
	[EntradaArea] [datetime] NULL,
	[SalidaComida] [datetime] NULL,
	[EntradaComida] [datetime] NULL,
	[SalidaArea] [datetime] NULL,
	[SalidaPlanta] [datetime] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[NomTraCambioSalario]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NomTraCambioSalario](
	[ClaEmpresa] [int] NOT NULL,
	[ClaUbicacion] [int] NOT NULL,
	[ClaNomina] [int] NOT NULL,
	[ClaTrabajador] [int] NOT NULL,
	[ClaFechaCambio] [datetime] NOT NULL,
	[SalarioDiario] [numeric](15, 3) NULL,
	[ClaCategoria] [int] NULL,
	[FolioAprobAum] [int] NULL,
	[Estatus] [int] NULL,
	[BajaLogica] [int] NULL,
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NULL,
	[NombrePcMod] [varchar](64) NULL,
	[ClaUsuarioMod] [int] NULL,
 CONSTRAINT [NomTraCambioSalario_PK] PRIMARY KEY CLUSTERED 
(
	[ClaEmpresa] ASC,
	[ClaUbicacion] ASC,
	[ClaNomina] ASC,
	[ClaTrabajador] ASC,
	[ClaFechaCambio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[NomTraPeriodoWizard]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[NomTraPeriodoWizard](
	[ClaEtapa] [int] NOT NULL,
	[Especial] [int] NOT NULL,
	[ClaPeriodo] [int] NOT NULL,
	[AnoPeriodo] [int] NOT NULL,
	[ClaNomina] [int] NOT NULL,
	[ClaUbicacion] [int] NOT NULL,
	[ClaEmpresa] [int] NOT NULL,
	[FechaEtapa] [smalldatetime] NULL,
	[DesEtapa] [char](150) NULL,
	[CantAfectado] [float] NULL,
	[EstatusEtapa] [int] NULL,
	[Usuario] [int] NOT NULL,
	[Estatus] [int] NOT NULL,
	[FechaUltimaMod] [datetime] NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[OInCatCategoria]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[OInCatCategoria](
	[ClaCategoria] [int] NOT NULL,
	[NombreCategoria] [varchar](50) NOT NULL,
	[CategoriaExterna] [varchar](50) NULL,
	[ClaUbicacion] [int] NULL,
	[FechaRegistro] [datetime] NULL,
	[BajaLogica] [int] NULL,
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NULL,
	[ClaUsuarioMod] [int] NULL,
	[NombrePcMod] [varchar](50) NULL,
 CONSTRAINT [PK_OInCatCategoria] PRIMARY KEY CLUSTERED 
(
	[ClaCategoria] ASC,
	[NombreCategoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[OInCatClasificacionArticuloABC]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[OInCatClasificacionArticuloABC](
	[ClaClasificacionArticuloABC] [int] NOT NULL,
	[ClaUbicacion] [int] NOT NULL,
	[ClaveArticulo] [int] NOT NULL,
	[ClaArticulo] [int] NOT NULL,
	[ClaClasificacionSalida] [int] NOT NULL,
	[ClaClasificacionValor] [int] NOT NULL,
	[ClaClasificacionFrecuencia] [int] NOT NULL,
	[ClaCategoria] [int] NOT NULL,
	[BajaLogica] [int] NULL,
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NULL,
	[ClaUsuarioMod] [int] NULL,
	[NombrePcMod] [varchar](50) NULL,
 CONSTRAINT [PK_OInCatClasificacionArticuloABC] PRIMARY KEY CLUSTERED 
(
	[ClaClasificacionArticuloABC] ASC,
	[ClaUbicacion] ASC,
	[ClaveArticulo] ASC,
	[ClaArticulo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[OInCatClasificacionFrecuencia]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[OInCatClasificacionFrecuencia](
	[ClaClasificacionFrecuencia] [int] NOT NULL,
	[NomClasificacionFrecuencia] [char](5) NOT NULL,
	[DescClasificacionFrecuencia] [varchar](500) NULL,
	[ClaUsuarioMod] [int] NULL,
	[FechaUltimaMod] [datetime] NOT NULL,
	[NombrePcMod] [varchar](64) NOT NULL,
 CONSTRAINT [PK_OInClasificacionFrecuencia] PRIMARY KEY CLUSTERED 
(
	[ClaClasificacionFrecuencia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[OInCatClasificacionSalida]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[OInCatClasificacionSalida](
	[ClaClasificacionSalida] [int] NOT NULL,
	[NomClasificacionSalida] [char](5) NOT NULL,
	[DescClasificacionSalida] [varchar](500) NULL,
	[ClaUsuarioMod] [int] NULL,
	[FechaUltimaMod] [datetime] NOT NULL,
	[NombrePcMod] [varchar](64) NOT NULL,
 CONSTRAINT [PK_OInClasificacionSalida] PRIMARY KEY CLUSTERED 
(
	[ClaClasificacionSalida] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[OInCatClasificacionValor]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[OInCatClasificacionValor](
	[ClaClasificacionValor] [int] NOT NULL,
	[NomClasificacionValor] [char](5) NOT NULL,
	[DescClasificacionValor] [varchar](500) NULL,
	[ClaUsuarioMod] [int] NULL,
	[FechaUltimaMod] [datetime] NOT NULL,
	[NombrePcMod] [varchar](64) NULL,
 CONSTRAINT [PK_OInClasificacionValor] PRIMARY KEY CLUSTERED 
(
	[ClaClasificacionValor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PLDCatPoliticaInvProd]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PLDCatPoliticaInvProd](
	[ClaUbicacion] [int] NULL,
	[ClaArticulo] [int] NULL,
	[ClaTipoInventario] [int] NULL,
	[Segmento] [int] NULL,
	[ClaTipoManufactura] [int] NULL,
	[InventarioMetaKg] [numeric](22, 4) NULL,
	[InventarioMetaUni] [numeric](22, 4) NULL,
	[FechaIns] [datetime] NULL,
	[ClaUsuarioIns] [datetime] NULL,
	[FechaUltimaMod] [datetime] NULL,
	[ClaUsuarioMod] [int] NULL,
	[NombrePcMod] [varchar](64) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PLDCatTipoManufactura]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PLDCatTipoManufactura](
	[ClaTipoManufactura] [int] NULL,
	[Descripcion] [varchar](255) NULL,
	[FechaIns] [datetime] NULL,
	[ClaUsuarioIns] [int] NULL,
	[FechaUltimaMod] [datetime] NULL,
	[ClaUsuarioMod] [int] NULL,
	[NombrePcMod] [varchar](64) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PloCatArticuloCubicaje]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PloCatArticuloCubicaje](
	[ClaArticulo] [int] NOT NULL,
	[PesoTeoricoOrigen] [numeric](22, 7) NOT NULL,
	[LargoMts] [numeric](22, 4) NOT NULL,
	[AnchoMts] [numeric](22, 4) NOT NULL,
	[AltoMts] [numeric](22, 4) NOT NULL,
	[VolumenMts3] [numeric](22, 4) NOT NULL,
	[CantAgrupada] [numeric](22, 4) NULL,
	[PesoTarima] [numeric](22, 4) NOT NULL,
	[BajaLogica] [tinyint] NOT NULL DEFAULT ((0)),
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL DEFAULT (getdate()),
	[NombrePcMod] [varchar](64) NOT NULL DEFAULT (host_name()),
	[ClaUsuarioMod] [int] NOT NULL,
	[AltoTarima] [numeric](22, 4) NULL,
	[EsProductoPesado] [tinyint] NULL,
 CONSTRAINT [PK_PloCatArticuloCubicaje] PRIMARY KEY CLUSTERED 
(
	[ClaArticulo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PloCatMaquilador]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PloCatMaquilador](
	[ClaMaquilador] [int] NOT NULL,
	[NomMaquilador] [varchar](50) NOT NULL,
	[BajaLogica] [tinyint] NOT NULL,
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL,
	[NombrePcMod] [varchar](64) NOT NULL,
	[ClaUsuarioMod] [int] NOT NULL,
 CONSTRAINT [PK_PloCatMaquilador] PRIMARY KEY CLUSTERED 
(
	[ClaMaquilador] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PloCatRuta]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PloCatRuta](
	[ClaUbicacion] [int] NOT NULL,
	[ClaRuta] [int] NOT NULL,
	[NomRuta] [varchar](50) NOT NULL,
	[BajaLogica] [tinyint] NOT NULL DEFAULT ((0)),
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL DEFAULT (getdate()),
	[NombrePcMod] [varchar](64) NOT NULL DEFAULT (host_name()),
	[ClaUsuarioMod] [int] NOT NULL,
	[KmsCaculados] [numeric](22, 4) NULL,
 CONSTRAINT [PK_PloCatRuta] PRIMARY KEY CLUSTERED 
(
	[ClaUbicacion] ASC,
	[ClaRuta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PloCatRutaDet]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PloCatRutaDet](
	[ClaUbicacion] [int] NOT NULL,
	[ClaRuta] [int] NOT NULL,
	[Secuencia] [int] NOT NULL,
	[ClaCiudadOrigen] [int] NOT NULL,
	[ClaCiudadDestino] [int] NOT NULL,
	[BajaLogica] [tinyint] NOT NULL,
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL,
	[NombrePcMod] [varchar](64) NOT NULL,
	[ClaUsuarioMod] [int] NOT NULL,
 CONSTRAINT [PK_PloCatRutaDet] PRIMARY KEY CLUSTERED 
(
	[ClaUbicacion] ASC,
	[ClaRuta] ASC,
	[Secuencia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PloCatTipoArticulo]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PloCatTipoArticulo](
	[ClaTipoArticulo] [int] NOT NULL,
	[ClaUbicacion] [int] NOT NULL,
	[NomTipoArticulo] [varchar](50) NULL,
	[FechaUltimaMod] [datetime] NULL,
	[NombrePcMod] [varchar](64) NULL,
	[ClaUsuarioMod] [int] NULL,
 CONSTRAINT [PK_PloCatTipoProductoPta] PRIMARY KEY CLUSTERED 
(
	[ClaTipoArticulo] ASC,
	[ClaUbicacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PloCatTipoMercadoEmb]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PloCatTipoMercadoEmb](
	[ClaTipoMercado] [int] NOT NULL,
	[NomTipoMercado] [varchar](50) NOT NULL,
	[BajaLogica] [tinyint] NOT NULL DEFAULT ((0)),
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL DEFAULT (getdate()),
	[NombrePcMod] [varchar](64) NOT NULL DEFAULT (host_name()),
	[ClaUsuarioMod] [int] NOT NULL,
 CONSTRAINT [PK_PloCatTipoMercadoEmb] PRIMARY KEY CLUSTERED 
(
	[ClaTipoMercado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PloCatTipoReferencia]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PloCatTipoReferencia](
	[ClaTipoReferencia] [int] NOT NULL,
	[ClaReferenciaInventarios] [int] NULL,
	[NomTipoReferencia] [varchar](50) NOT NULL,
	[EsNumerica] [tinyint] NULL,
	[BajaLogica] [tinyint] NOT NULL,
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL,
	[NombrePcMod] [varchar](64) NOT NULL,
	[ClaUsuarioMod] [int] NOT NULL,
 CONSTRAINT [PK_PloCatTipoReferencia] PRIMARY KEY CLUSTERED 
(
	[ClaTipoReferencia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PloCatTipoViaje]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PloCatTipoViaje](
	[ClaTipoViaje] [int] NOT NULL,
	[NomTipoViaje] [varchar](50) NOT NULL,
	[BajaLogica] [tinyint] NOT NULL,
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL,
	[NombrePcMod] [varchar](64) NOT NULL,
	[ClaUsuarioMod] [int] NOT NULL,
 CONSTRAINT [PK_PloCatTipoViaje] PRIMARY KEY CLUSTERED 
(
	[ClaTipoViaje] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PloCfgArticulo]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PloCfgArticulo](
	[ClaArticulo] [int] NOT NULL,
	[ClaUbicacion] [int] NOT NULL,
	[ClaTipoArticulo] [int] NULL,
	[FechaUltimaMod] [datetime] NULL,
	[NombrePcMod] [varchar](64) NULL,
	[ClaUsuarioMod] [int] NULL,
 CONSTRAINT [PK_PloCfgArticuloUbi] PRIMARY KEY CLUSTERED 
(
	[ClaArticulo] ASC,
	[ClaUbicacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PloLogTransporte]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PloLogTransporte](
	[ClaTransporte] [int] NOT NULL,
	[LargoMts] [numeric](22, 4) NOT NULL,
	[AnchoMts] [numeric](22, 4) NOT NULL,
	[AltoMts] [numeric](22, 4) NOT NULL,
	[VolumenMts3] [numeric](22, 4) NOT NULL,
	[CapacidadKg] [numeric](22, 4) NOT NULL,
	[BajaLogica] [tinyint] NOT NULL DEFAULT ((0)),
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL DEFAULT (getdate()),
	[NombrePcMod] [varchar](64) NOT NULL DEFAULT (host_name()),
	[ClaUsuarioMod] [int] NOT NULL,
	[EsAplicableCubicaje] [tinyint] NULL,
 CONSTRAINT [PK_PloLogTransporte] PRIMARY KEY CLUSTERED 
(
	[ClaTransporte] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PloRelArtTranspCubicaje]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PloRelArtTranspCubicaje](
	[ClaArticulo] [int] NOT NULL,
	[ClaTransporte] [int] NOT NULL,
	[UnidadesPorTransporte] [numeric](22, 4) NOT NULL,
	[FactorCubicaje] [numeric](22, 4) NOT NULL DEFAULT ((1)),
	[BajaLogica] [tinyint] NOT NULL DEFAULT ((0)),
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL DEFAULT (getdate()),
	[NombrePcMod] [varchar](64) NOT NULL DEFAULT (host_name()),
	[ClaUsuarioMod] [int] NOT NULL,
 CONSTRAINT [PK_PloRelArticuloTransporteCubicaje] PRIMARY KEY CLUSTERED 
(
	[ClaArticulo] ASC,
	[ClaTransporte] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PloRelReferenciaProducto]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PloRelReferenciaProducto](
	[IdReferenciaProducto] [int] NOT NULL,
	[ClaUbicacion] [int] NOT NULL,
	[ClaTipoReferencia] [int] NULL,
	[ClaArticulo] [int] NULL,
	[ClaFamilia] [int] NULL,
	[ClaSubFamilia] [int] NULL,
	[Orden] [int] NULL,
	[FechaUltimaMod] [datetime] NOT NULL,
	[NombrePcMod] [varchar](64) NOT NULL,
	[ClaUsuarioMod] [int] NOT NULL,
 CONSTRAINT [PK_PloRelReferenciaProducto] PRIMARY KEY CLUSTERED 
(
	[IdReferenciaProducto] ASC,
	[ClaUbicacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PProCatCalidadProv]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PProCatCalidadProv](
	[ClaCalidadProv] [int] NOT NULL,
	[NomCalidadProv] [varchar](50) NULL,
	[BajaLogica] [int] NULL,
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NULL,
	[NombrePcMod] [varchar](50) NULL,
	[ClaUsuarioMod] [int] NULL,
 CONSTRAINT [PK_PProCatCalidadProv] PRIMARY KEY CLUSTERED 
(
	[ClaCalidadProv] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PProCatEspecializacionProv]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PProCatEspecializacionProv](
	[ClaEspecializacionProv] [int] NOT NULL,
	[NomEspecializacionProvVw] [varchar](50) NULL,
	[BajaLogica] [int] NULL,
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NULL,
	[NombrePcMod] [varchar](50) NULL,
	[ClaUsuarioMod] [int] NULL,
 CONSTRAINT [PK_PProCatEspecializacionProv] PRIMARY KEY CLUSTERED 
(
	[ClaEspecializacionProv] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PProCatGiroProveedor]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PProCatGiroProveedor](
	[ClaGiroProveedor] [int] NOT NULL,
	[NombreGiro] [varchar](50) NULL,
	[NombreGiroIngles] [varchar](50) NULL,
	[BajaLogica] [int] NULL,
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NULL,
	[NombrePcMod] [varchar](50) NULL,
	[ClaUsuarioMod] [int] NULL,
 CONSTRAINT [PK_PProCatGiroProveedor] PRIMARY KEY CLUSTERED 
(
	[ClaGiroProveedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PProCatGrupoProducto]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PProCatGrupoProducto](
	[ClaGrupoProducto] [int] NOT NULL,
	[descripcion] [varchar](80) NULL,
	[ClaTipoGrupoProducto] [int] NULL,
	[BajaLogica] [int] NULL,
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NULL,
	[NombrePcMod] [varchar](50) NULL,
	[ClaUsuarioMod] [int] NULL,
 CONSTRAINT [PK_PProCatGrupoProducto] PRIMARY KEY CLUSTERED 
(
	[ClaGrupoProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PProCatGrupoProductoDet]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PProCatGrupoProductoDet](
	[ClaGrupoProducto] [int] NOT NULL,
	[ClaUbicacion] [int] NOT NULL,
	[ClaFamilia] [int] NOT NULL,
	[ClaSubFamilia] [int] NOT NULL,
	[BajaLogica] [int] NULL,
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NULL,
	[NombrePcMod] [varchar](50) NULL,
	[ClaUsuarioMod] [int] NULL,
 CONSTRAINT [PK_PProCatGrupoProductoDet] PRIMARY KEY CLUSTERED 
(
	[ClaGrupoProducto] ASC,
	[ClaUbicacion] ASC,
	[ClaFamilia] ASC,
	[ClaSubFamilia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PProCatMarcaProv]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PProCatMarcaProv](
	[ClaMarca] [int] NOT NULL,
	[NombreMarca] [varchar](35) NULL,
	[BajaLogica] [int] NULL,
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NULL,
	[NombrePcMod] [varchar](50) NULL,
	[ClaUsuarioMod] [int] NULL,
 CONSTRAINT [PK_PProCatMarcaProv] PRIMARY KEY CLUSTERED 
(
	[ClaMarca] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PProCatProveedorRefComercial]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PProCatProveedorRefComercial](
	[ClaCup] [int] NOT NULL,
	[AniosAntiguedad] [numeric](14, 4) NULL,
	[ClaGiroProveedor] [int] NULL,
	[NumeroPersonal] [int] NULL,
	[Capital] [numeric](14, 4) NULL,
	[ClaMoneda] [int] NOT NULL,
	[CapitalSocialUSD] [numeric](14, 4) NULL,
	[VentasAnualesDolar] [numeric](14, 4) NULL,
	[EsDesgloseFormaPago] [int] NULL,
	[MontoDesgloseFormaPago] [int] NULL,
	[ClientesPrincipales] [varchar](100) NULL,
	[ContactoCentral] [varchar](100) NULL,
	[ClaEspecializacionProv] [int] NULL,
	[ComentariosEspeciales] [varchar](250) NULL,
	[PaginaInternet] [varchar](100) NULL,
	[PlazoPago] [int] NULL,
	[BajaLogica] [int] NOT NULL DEFAULT ((0)),
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL DEFAULT (getdate()),
	[NombrePcMod] [varchar](64) NOT NULL DEFAULT (host_name()),
	[ClaUsuarioMod] [int] NOT NULL,
 CONSTRAINT [PK_PProCatProveedorRefComercial] PRIMARY KEY CLUSTERED 
(
	[ClaCup] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PProCatProveedorRefComercial_bkp_emdeosio_20120410]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PProCatProveedorRefComercial_bkp_emdeosio_20120410](
	[ClaCup] [int] NOT NULL,
	[AniosAntiguedad] [numeric](14, 4) NULL,
	[ClaGiroProveedor] [int] NULL,
	[NumeroPersonal] [int] NULL,
	[Capital] [numeric](14, 4) NULL,
	[ClaMoneda] [int] NOT NULL,
	[CapitalSocialUSD] [numeric](14, 4) NULL,
	[VentasAnualesDolar] [numeric](14, 4) NULL,
	[EsDesgloseFormaPago] [int] NULL,
	[MontoDesgloseFormaPago] [int] NULL,
	[ClientesPrincipales] [varchar](100) NULL,
	[ContactoCentral] [varchar](100) NULL,
	[ClaEspecializacionProv] [int] NULL,
	[ComentariosEspeciales] [varchar](250) NULL,
	[PaginaInternet] [varchar](100) NULL,
	[PlazoPago] [int] NULL,
	[BajaLogica] [int] NOT NULL,
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL,
	[NombrePcMod] [varchar](64) NOT NULL,
	[ClaUsuarioMod] [int] NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PProCatProveedorUbicacion]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PProCatProveedorUbicacion](
	[ClaUbicacion] [int] NOT NULL,
	[ClaCUP] [int] NOT NULL,
	[Nombre] [varchar](250) NOT NULL,
	[ClaTipoProveedor] [int] NOT NULL,
	[ClaProveedor] [int] NOT NULL,
	[ClaIva] [int] NULL,
	[Calle] [varchar](250) NOT NULL,
	[NumeroInterior] [varchar](25) NULL,
	[NumeroExterior] [varchar](25) NULL,
	[CodigoPostal] [varchar](25) NULL,
	[ClaColonia] [int] NULL,
	[ClaMunicipio] [int] NULL,
	[ClaEstado] [int] NULL,
	[ClaPais] [int] NULL,
	[EsActivo] [int] NULL,
	[EsPenalizable] [int] NULL DEFAULT ((0)),
	[BajaLogica] [int] NOT NULL DEFAULT ((0)),
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL DEFAULT (getdate()),
	[ClaUsuarioMod] [int] NOT NULL,
	[NombrePcMod] [varchar](64) NOT NULL DEFAULT (host_name()),
	[MotivoDesactivacion] [varchar](250) NULL,
	[ClaCalidadProv] [int] NULL,
	[ClaIncoterm] [int] NULL,
	[EsPagoCheque] [int] NOT NULL DEFAULT ((0)),
	[PlazoPago] [int] NULL,
 CONSTRAINT [PK_PProCatProveedorUbicacion] PRIMARY KEY CLUSTERED 
(
	[ClaUbicacion] ASC,
	[ClaTipoProveedor] ASC,
	[ClaProveedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PProCatProveedorUbicacion_bkp_emdeosio_20120410]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PProCatProveedorUbicacion_bkp_emdeosio_20120410](
	[ClaUbicacion] [int] NOT NULL,
	[ClaCUP] [int] NOT NULL,
	[Nombre] [varchar](250) NULL,
	[ClaTipoProveedor] [int] NULL,
	[ClaProveedor] [int] NULL,
	[ClaIva] [int] NULL,
	[Calle] [varchar](250) NULL,
	[NumeroInterior] [varchar](25) NULL,
	[NumeroExterior] [varchar](25) NULL,
	[CodigoPostal] [varchar](25) NULL,
	[ClaColonia] [int] NULL,
	[ClaMunicipio] [int] NULL,
	[ClaEstado] [int] NULL,
	[ClaPais] [int] NULL,
	[EsActivo] [int] NULL,
	[EsPenalizable] [int] NULL,
	[BajaLogica] [int] NULL,
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NULL,
	[ClaUsuarioMod] [int] NULL,
	[NombrePcMod] [varchar](64) NULL,
	[MotivoDesactivacion] [varchar](250) NULL,
	[ClaCalidadProv] [int] NULL,
	[ClaIncoterm] [int] NULL,
	[EsPagoCheque] [int] NULL,
	[PlazoPago] [int] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PProCatTipoPrestadorServicios]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PProCatTipoPrestadorServicios](
	[ClaTipoPrestador] [int] NOT NULL,
	[NombrePrestador] [varchar](50) NULL,
	[RequiereCupSn] [int] NULL,
	[MostrarSn] [int] NULL,
	[NombreIngles] [varchar](30) NULL,
	[BajaLogica] [int] NULL,
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NULL,
	[NombrePcMod] [varchar](50) NULL,
	[ClaUsuarioMod] [int] NULL,
 CONSTRAINT [PK_PProCatTipoPrestadorServicios] PRIMARY KEY CLUSTERED 
(
	[ClaTipoPrestador] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PProRelCiudadProv]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[PProRelCiudadProv](
	[ClaProveedor] [int] NULL,
	[ClaTipoProveedor] [int] NULL,
	[ClaCUP] [int] NULL,
	[ClaPais] [int] NULL,
	[ClaEstado] [int] NULL,
	[ClaMunicipio] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[PProRelGrupoProductoProv]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PProRelGrupoProductoProv](
	[ClaCUP] [int] NOT NULL,
	[ClaGrupoProducto] [int] NOT NULL,
	[BajaLogica] [int] NULL,
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NULL,
	[NombrePcMod] [varchar](50) NULL,
	[ClaUsuarioMod] [int] NULL,
 CONSTRAINT [PK_PProRelGrupoProductoProv] PRIMARY KEY CLUSTERED 
(
	[ClaCUP] ASC,
	[ClaGrupoProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PProRelProveedorMarca]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PProRelProveedorMarca](
	[ClaCUP] [int] NOT NULL,
	[ClaMarca] [int] NOT NULL,
	[BajaLogica] [int] NULL,
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NULL,
	[NombrePcMod] [varchar](50) NULL,
	[ClaUsuarioMod] [int] NULL,
 CONSTRAINT [PK_PProRelProveedorMarca] PRIMARY KEY CLUSTERED 
(
	[ClaCUP] ASC,
	[ClaMarca] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[PProvCatProveedorContacto]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[PProvCatProveedorContacto](
	[IdContacto] [int] NOT NULL,
	[ClaUbicacion] [int] NOT NULL,
	[ClaCUP] [int] NULL,
	[ClaProveedor] [int] NULL,
	[ClaTipoProveedor] [int] NULL,
	[NomContacto] [varchar](80) NULL,
	[Puesto] [varchar](50) NULL,
	[Telefono] [varchar](30) NULL,
	[Email] [varchar](50) NULL,
	[Fax] [varchar](30) NULL,
	[TelefonoMovil] [varchar](30) NULL,
	[Radio] [varchar](30) NULL,
	[BajaLogica] [int] NULL,
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NULL,
	[ClaUsuarioMod] [int] NULL,
	[NombrePcMod] [varchar](30) NULL,
 CONSTRAINT [PK_PProvCatProveedorContacto] PRIMARY KEY CLUSTERED 
(
	[IdContacto] ASC,
	[ClaUbicacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RmaCatSituacion]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RmaCatSituacion](
	[ClaSituacion] [int] NOT NULL,
	[NomSituacion] [varchar](100) NOT NULL,
	[EsEuaCanada] [tinyint] NOT NULL DEFAULT ((0)),
	[EsTraspaso] [tinyint] NOT NULL DEFAULT ((0)),
	[BajaLogica] [int] NOT NULL DEFAULT ((0)),
	[FechaBajaLogica] [datetime] NULL DEFAULT (NULL),
	[FechaUltimaMod] [datetime] NOT NULL DEFAULT (getdate()),
	[NombrePcMod] [varchar](64) NOT NULL DEFAULT (host_name()),
	[ClaUsuarioMod] [int] NOT NULL,
	[EsAfectaKgs] [tinyint] NOT NULL DEFAULT ((0)),
	[EsAfectaImporte] [tinyint] NOT NULL DEFAULT ((0)),
 CONSTRAINT [PK_RmaCatSituacion] PRIMARY KEY CLUSTERED 
(
	[ClaSituacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[RmaCatSituacionMotivo]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[RmaCatSituacionMotivo](
	[ClaSituacionMotivo] [int] NOT NULL,
	[ClaSituacion] [int] NOT NULL,
	[NomMotivo] [varchar](100) NOT NULL,
	[EsCalidad] [tinyint] NOT NULL DEFAULT ((0)),
	[EsAutorizado] [tinyint] NOT NULL DEFAULT ((0)),
	[EsVentas] [tinyint] NOT NULL DEFAULT ((0)),
	[BajaLogica] [int] NOT NULL DEFAULT ((0)),
	[FechaBajaLogica] [datetime] NULL DEFAULT (NULL),
	[FechaUltimaMod] [datetime] NOT NULL DEFAULT (getdate()),
	[NombrePcMod] [varchar](64) NOT NULL DEFAULT (host_name()),
	[ClaUsuarioMod] [int] NOT NULL,
 CONSTRAINT [PK_RmaCatSituacionMotivo] PRIMARY KEY CLUSTERED 
(
	[ClaSituacionMotivo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TesCatBanco]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TesCatBanco](
	[ClaBanco] [int] NOT NULL,
	[ClaGrupoFinanciero] [int] NULL,
	[NomBanco] [varchar](50) NOT NULL,
	[ClaContacto] [int] NULL,
	[ClaEstatus] [int] NOT NULL,
	[BajaLogica] [int] NOT NULL DEFAULT ((0)),
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL DEFAULT (getdate()),
	[NombrePcMod] [varchar](64) NOT NULL DEFAULT (host_name()),
	[ClaUsuarioMod] [int] NULL,
 CONSTRAINT [PK_TesCatBanco] PRIMARY KEY NONCLUSTERED 
(
	[ClaBanco] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TesCatCuentaBeneficiario]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TesCatCuentaBeneficiario](
	[ClaCuentaBeneficiario] [int] NOT NULL,
	[ClaEmpresa] [int] NOT NULL,
	[ClaBeneficiario] [int] NOT NULL,
	[ClaDepartamento] [int] NOT NULL,
	[ClaTipoBeneficiario] [int] NOT NULL,
	[ClaCUP] [int] NULL,
	[DiasPago] [varchar](50) NULL,
	[ClaMoneda] [int] NULL,
	[ClaBanco] [int] NULL,
	[ClaTipoCuentaBanco] [int] NULL,
	[NumCuentaBancaria] [varchar](50) NULL,
	[NumSucursal] [int] NULL,
	[NumAba] [varchar](50) NULL,
	[CP] [varchar](50) NULL,
	[ConFFC] [int] NULL,
	[BancoFFC] [varchar](50) NULL,
	[NombreBeneficiarioFFC] [varchar](50) NULL,
	[CuentaFFC] [varchar](50) NULL,
	[SubCuentaFFC] [varchar](50) NULL,
	[ClaEstatus] [int] NULL,
	[ClaCuentaCUP] [int] NULL,
	[ClaCuentaBeneficiarioPadre] [int] NULL,
	[FechaUltimaMod] [datetime] NULL,
	[NombrePcMod] [varchar](64) NULL,
	[ClaUsuarioMod] [int] NULL,
	[PagarUSASN] [int] NULL,
 CONSTRAINT [PK_TesCatCuentaBeneficiario] PRIMARY KEY CLUSTERED 
(
	[ClaCuentaBeneficiario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TesCatCuentaCUP]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TesCatCuentaCUP](
	[ClaCuentaCUP] [int] NOT NULL,
	[ClaCUP] [int] NOT NULL,
	[TipoCuentaCUP] [int] NULL,
	[NumCuentaCUP] [varchar](50) NOT NULL,
	[NomBanco] [varchar](50) NULL,
	[BajaLogica] [int] NOT NULL,
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL,
	[NombrePcMod] [varchar](64) NOT NULL,
	[ClaUsuarioMod] [int] NOT NULL,
	[NombreBeneficiario] [varchar](250) NULL,
	[ClaMoneda] [int] NULL,
	[ClaseBanco] [int] NULL,
	[ClaPais] [int] NULL,
	[NumSucursal] [int] NULL,
	[ClaDeptoContable] [int] NULL,
	[AbaSwift] [varchar](15) NULL,
	[ChipParticipant] [int] NULL,
	[ClaBanco] [int] NULL,
	[Clabe] [numeric](18, 0) NULL,
	[ClaEstatusCuentaCup] [int] NULL,
	[CuentaHabienteFFC] [varchar](80) NULL,
	[EsCuentaFFC] [tinyint] NULL,
	[NombreBancoFFC] [varchar](40) NULL,
	[NomEstatusCuentaCUP] [varchar](150) NULL,
	[NumCuentaFFC] [varchar](40) NULL,
	[ReferenciaBancaria] [varchar](40) NULL,
	[SubCuentaFFC] [varchar](40) NULL,
	[SucursalPlaza] [int] NULL,
 CONSTRAINT [PK_TesCatCuentaCUP] PRIMARY KEY CLUSTERED 
(
	[ClaCuentaCUP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TesCatCUP]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TesCatCUP](
	[ClaCUP] [int] NOT NULL,
	[RFC] [varchar](30) NOT NULL,
	[Nombre] [varchar](150) NOT NULL,
	[ApPaterno] [varchar](50) NULL,
	[ApMaterno] [varchar](50) NULL,
	[BajaLogica] [int] NOT NULL CONSTRAINT [DF__TesCatCUP__BajaL__4EDF483D]  DEFAULT ((0)),
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL CONSTRAINT [DF__TesCatCUP__Fecha__4FD36C76]  DEFAULT (getdate()),
	[NombrePcMod] [varchar](64) NOT NULL CONSTRAINT [DF__TesCatCUP__Nombr__50C790AF]  DEFAULT (host_name()),
	[ClaUsuarioMod] [int] NOT NULL,
	[TipoPersona] [tinyint] NULL,
	[Curp] [varchar](18) NULL,
	[DiasPago] [varchar](20) NULL,
	[CuentaMail] [varchar](60) NULL,
	[Estatus] [tinyint] NULL,
	[Calle] [varchar](50) NULL,
	[NoInt] [varchar](15) NULL,
	[NoExt] [varchar](15) NULL,
	[ClaColonia] [int] NULL,
	[ClaMunicipioDelegacion] [int] NULL,
	[ClaEstado] [int] NULL,
	[ClaPais] [int] NULL,
	[CodigoPostal] [varchar](20) NULL,
	[Telefono] [varchar](30) NULL,
	[FechaDonativo] [smalldatetime] NULL,
	[AutorizaCheque] [tinyint] NULL,
	[VigenciaCheque] [int] NULL,
	[FechaAlta] [datetime] NULL,
	[ClaTipoActividad] [int] NULL,
	[ClaTipoProveedor] [int] NULL,
 CONSTRAINT [PKTesCatCUP] PRIMARY KEY CLUSTERED 
(
	[ClaCUP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TesCatCUPDatosPago]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TesCatCUPDatosPago](
	[ClaCupDatosPago] [int] NOT NULL,
	[ClaCup] [int] NOT NULL,
	[NombreTitular] [varchar](250) NOT NULL,
	[NombreCUP] [varchar](250) NOT NULL,
	[ClaPaisCon] [int] NOT NULL,
	[ClaMoneda] [int] NOT NULL,
	[CuentaBancaria] [varchar](50) NOT NULL,
	[ClaBanco] [int] NULL,
	[ClaEstatus] [int] NOT NULL,
	[ClaTipoCuentaCup] [int] NULL,
	[NumSucursal] [int] NULL,
	[CLABE] [varchar](18) NULL,
	[ClaRoutingCode] [varchar](15) NULL,
	[EsWire] [tinyint] NOT NULL CONSTRAINT [TesCatCUPDatosPago_EsWire]  DEFAULT ((0)),
	[EsACH] [tinyint] NOT NULL CONSTRAINT [TesCatCUPDatosPago_EsACH]  DEFAULT ((0)),
	[ClaSwift] [int] NULL,
	[ClaBancoINTermediario] [int] NULL,
	[EsSwift] [tinyint] NOT NULL CONSTRAINT [TesCatCUPDatosPago_EsSwift]  DEFAULT ((0)),
	[ClaMunicipioCon] [int] NULL,
	[ClaEstadoCon] [int] NULL,
	[EsACHDiferenteWIRE] [tinyint] NOT NULL CONSTRAINT [TesCatCUPDatosPago_EsCuentaACH]  DEFAULT ((0)),
	[CuentaBancariaACH] [varchar](50) NULL,
	[ACHAba] [varchar](15) NULL,
	[EsCuentaFFC] [tinyint] NOT NULL CONSTRAINT [TesCatCUPDatosPago_EsCuentaFFC]  DEFAULT ((0)),
	[NombreBancoFFC] [varchar](40) NULL,
	[NumCuentaFFC] [varchar](40) NULL,
	[CuentaHabienteFFC] [varchar](80) NULL,
	[SubCuentaFFC] [varchar](40) NULL,
	[FechaUltimaAutorizacion] [datetime] NULL,
	[FechaAlta] [datetime] NOT NULL CONSTRAINT [TesCatCUPDatosPago_FechaAlta]  DEFAULT (getdate()),
	[ClaUsuarioAlta] [int] NOT NULL,
	[ClaEmpresaAlta] [int] NOT NULL,
	[ClaDepartamentoAlta] [int] NOT NULL,
	[FechaCancelacion] [datetime] NULL,
	[ClaCupDatosPago_L] [int] NULL,
	[EsCuentaEnviada_L] [tinyint] NULL CONSTRAINT [TesCatCUPDatosPago_EsEnviada_L]  DEFAULT ((0)),
	[EsBancoIntermediarioDefault] [tinyint] NOT NULL CONSTRAINT [TesCatCUPDatosPago_EsBancoIntermediarioDefault]  DEFAULT ((0)),
	[BajaLogica] [tinyint] NOT NULL CONSTRAINT [TesCatCUPDatosPago_BajaLogica]  DEFAULT ((0)),
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL CONSTRAINT [TesCatCUPDatosPago_FechaUltimaMod]  DEFAULT (getdate()),
	[NombrePcMod] [varchar](64) NOT NULL CONSTRAINT [TesCatCUPDatosPago_NombrePcMod]  DEFAULT (host_name()),
	[ClaUsuarioMod] [int] NOT NULL,
 CONSTRAINT [PK_TesCatCUPDatosPago] PRIMARY KEY CLUSTERED 
(
	[ClaCupDatosPago] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TesCatEstatusCuentaDatosPago]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TesCatEstatusCuentaDatosPago](
	[ClaEstatus] [int] NULL,
	[NomEstatus] [varchar](500) NULL,
	[BajaLogica] [int] NULL,
	[FechaBajaLogica] [int] NULL,
	[NombrePcMod] [varchar](64) NULL,
	[ClaUsuarioMod] [int] NULL,
	[FechaUltimaMod] [datetime] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TesCatFormaPago]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TesCatFormaPago](
	[ClaFormaPago] [int] NOT NULL,
	[NomFormaPago] [varchar](50) NOT NULL,
	[BajaLogica] [int] NOT NULL,
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL,
	[NombrePcMod] [varchar](64) NOT NULL,
	[ClaUsuarioMod] [int] NOT NULL,
 CONSTRAINT [PK_TesCatFormaPago] PRIMARY KEY CLUSTERED 
(
	[ClaFormaPago] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TesCatMoneda]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TesCatMoneda](
	[ClaMoneda] [int] NOT NULL,
	[NombreMoneda] [varchar](30) NULL,
	[NombreCortoMoneda] [varchar](5) NOT NULL,
	[BajaLogica] [int] NOT NULL CONSTRAINT [DF_TesCatMoneda_BajaLogica]  DEFAULT ((0)),
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL CONSTRAINT [DF_TesCatMoneda_FechaUltimaMod]  DEFAULT (getdate()),
	[NombrePcMod] [varchar](64) NULL,
	[ClaUsuarioMod] [int] NULL,
	[FechaIns] [datetime] NULL CONSTRAINT [DF_TesCatMoneda_FechaIns]  DEFAULT (getdate()),
	[ClaUsuarioIns] [int] NULL,
	[ClaMonedaVentas] [int] NULL,
	[NombreImprimir] [varchar](20) NULL,
	[NomMonedaEn] [varchar](30) NULL,
 CONSTRAINT [PK_TesCatMoneda] PRIMARY KEY CLUSTERED 
(
	[ClaMoneda] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TesRelCUPDatosPagoDepto]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TesRelCUPDatosPagoDepto](
	[ClaCupDatosPago] [int] NOT NULL,
	[ClaEmpresa] [int] NOT NULL,
	[ClaDepartamento] [int] NOT NULL,
	[ClaBene] [int] NOT NULL,
	[EsEnviada_L] [tinyint] NULL CONSTRAINT [TesRelCUPDatosPagoDepto_EsEnviada_L]  DEFAULT ((0)),
	[ReferenciaConvenio] [varchar](40) NULL,
	[ConceptoConvenio] [varchar](40) NULL,
	[ReferenciaBancaria] [varchar](40) NULL,
	[Referencia1] [varchar](40) NULL,
	[Referencia2] [varchar](40) NULL,
	[Referencia3] [varchar](40) NULL,
	[BajaLogica] [tinyint] NOT NULL CONSTRAINT [TesRelCUPDatosPagoDepto_BajaLogica]  DEFAULT ((0)),
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL CONSTRAINT [TesRelCUPDatosPagoDepto_FechaUltimaMod]  DEFAULT (getdate()),
	[NombrePcMod] [varchar](64) NULL CONSTRAINT [TesRelCUPDatosPagoDepto_NombrePcMod]  DEFAULT (host_name()),
	[ClaUsuarioMod] [int] NOT NULL,
	[ClaTipoReferencia] [int] NULL,
	[ClaTipoBene] [int] NOT NULL,
	[NumBene] [int] NULL,
	[ClaEstatus] [int] NULL,
 CONSTRAINT [PK_TesRelCUPDatosPagoDepto] PRIMARY KEY CLUSTERED 
(
	[ClaCupDatosPago] ASC,
	[ClaEmpresa] ASC,
	[ClaDepartamento] ASC,
	[ClaBene] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TiBitGeneral]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TiBitGeneral](
	[ObjectType] [sysname] NULL,
	[Objeto] [sysname] NULL,
	[hostname] [nvarchar](max) NULL,
	[Fecha] [datetime] NULL,
	[ComandoSQL] [nvarchar](max) NULL,
	[ServerName] [sysname] NULL,
	[DatabaseName] [sysname] NULL,
	[LoginName] [sysname] NULL,
	[UserName] [sysname] NULL,
	[SpId] [sysname] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TiBitObjeto]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TiBitObjeto](
	[FechaBitacora] [datetime] NOT NULL,
	[IdObjeto] [int] NOT NULL,
	[ClaSistema] [int] NULL,
	[Nombre] [varchar](50) NULL,
	[Comando] [varchar](200) NULL,
	[Parametros] [varchar](300) NULL,
	[Menu] [tinyint] NULL,
	[EnMantenimiento] [tinyint] NULL,
	[ClaTipoObjeto] [int] NULL,
	[NombreModificable] [tinyint] NULL,
	[Observaciones] [varchar](200) NULL,
	[Permiso1] [tinyint] NULL,
	[Permiso2] [tinyint] NULL,
	[Permiso3] [tinyint] NULL,
	[Permiso4] [tinyint] NULL,
	[Permiso5] [tinyint] NULL,
	[Permiso6] [tinyint] NULL,
	[Permiso7] [tinyint] NULL,
	[Permiso8] [tinyint] NULL,
	[BajaLogica] [int] NULL,
	[FechaBajaLogica] [datetime] NULL,
	[FechaIns] [datetime] NULL,
	[ClaUsuarioIns] [int] NULL,
	[FechaUltimaMod] [datetime] NULL,
	[ClaUsuarioMod] [int] NULL,
	[NombrePcMod] [varchar](64) NULL,
 CONSTRAINT [PK_TiBitObjeto] PRIMARY KEY CLUSTERED 
(
	[FechaBitacora] ASC,
	[IdObjeto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TiBitPermiso]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TiBitPermiso](
	[FechaBitacora] [datetime] NOT NULL,
	[IdUsuario] [int] NOT NULL,
	[idObjeto] [int] NOT NULL,
	[FechaInicial] [datetime] NULL,
	[FechaFinal] [datetime] NULL,
	[Permiso1] [tinyint] NULL,
	[Permiso2] [tinyint] NULL,
	[Permiso3] [tinyint] NULL,
	[Permiso4] [tinyint] NULL,
	[Permiso5] [tinyint] NULL,
	[Permiso6] [tinyint] NULL,
	[Permiso7] [tinyint] NULL,
	[Permiso8] [tinyint] NULL,
	[FechaUltimaMod] [datetime] NULL,
	[ClaUsuarioMod] [int] NULL,
	[NombrePcMod] [varchar](64) NULL,
 CONSTRAINT [PK_TiBitPermiso_1] PRIMARY KEY CLUSTERED 
(
	[FechaBitacora] ASC,
	[IdUsuario] ASC,
	[idObjeto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TiBitPermisoUbicacion]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TiBitPermisoUbicacion](
	[FechaBitacora] [datetime] NOT NULL,
	[IdUsuario] [int] NOT NULL,
	[IdObjeto] [int] NOT NULL,
	[ClaUbicacion] [int] NOT NULL,
	[FechaInicial] [datetime] NULL,
	[FechaFinal] [datetime] NULL,
	[Permiso1] [tinyint] NULL,
	[Permiso2] [tinyint] NULL,
	[Permiso3] [tinyint] NULL,
	[Permiso4] [tinyint] NULL,
	[Permiso5] [tinyint] NULL,
	[Permiso6] [tinyint] NULL,
	[Permiso7] [tinyint] NULL,
	[Permiso8] [tinyint] NULL,
	[FechaUltimaMod] [datetime] NULL,
	[ClaUsuarioMod] [int] NULL,
	[NombrePcMod] [varchar](64) NULL,
 CONSTRAINT [PK_TiBitPermisoUbicacion_1] PRIMARY KEY CLUSTERED 
(
	[FechaBitacora] ASC,
	[IdUsuario] ASC,
	[IdObjeto] ASC,
	[ClaUbicacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TiBitReferencia]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TiBitReferencia](
	[IdUsuario] [int] NOT NULL,
	[IdPerfilReferenciado] [int] NOT NULL,
	[FechaInicial] [datetime] NULL,
	[FechaFinal] [datetime] NULL,
	[ClaUbicacion] [int] NOT NULL,
	[Orden] [int] NOT NULL,
	[FechaUltimaMod] [datetime] NOT NULL,
	[ClaUsuarioMod] [int] NULL,
	[NombrePcMod] [varchar](64) NULL,
 CONSTRAINT [PK_TiBitReferencia] PRIMARY KEY CLUSTERED 
(
	[IdUsuario] ASC,
	[IdPerfilReferenciado] ASC,
	[ClaUbicacion] ASC,
	[FechaUltimaMod] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TiCatAgrupadorCol]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TiCatAgrupadorCol](
	[ClaAgrupadorCol] [int] NOT NULL,
	[NombAgrupadorCol] [varchar](30) NULL,
	[BajaLogica] [int] NOT NULL,
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NULL,
	[NombrePcMod] [varchar](64) NULL,
 CONSTRAINT [PK_TiCatAgrupadorCol] PRIMARY KEY CLUSTERED 
(
	[ClaAgrupadorCol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TiCatAplicacion]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TiCatAplicacion](
	[ClaUbicacion] [int] NOT NULL,
	[IdAplicacion] [varchar](50) NOT NULL,
	[Orden] [int] NOT NULL,
	[ServidorUrl] [varchar](150) NOT NULL,
	[ServidorAlias] [varchar](200) NOT NULL,
	[BajaLogica] [int] NOT NULL DEFAULT ((0)),
	[FechaBajaLogica] [datetime] NULL DEFAULT (NULL),
	[ClaObjeto] [int] NULL,
	[ServidorActualizacion] [nvarchar](150) NULL,
	[FechaUltimaMod] [datetime] NULL DEFAULT (getdate()),
	[EsWT] [int] NOT NULL DEFAULT ((0)),
 CONSTRAINT [PK_TiCatAplicacion] PRIMARY KEY CLUSTERED 
(
	[ClaUbicacion] ASC,
	[IdAplicacion] ASC,
	[Orden] ASC,
	[EsWT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TiCatBaseDeDatos]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TiCatBaseDeDatos](
	[ClaBaseDeDatos] [int] NOT NULL,
	[ClaServidor] [int] NOT NULL,
	[NombreBaseDeDatos] [varchar](50) NOT NULL,
	[Usuario] [varchar](50) NOT NULL,
	[Contrasena] [varchar](50) NOT NULL,
	[BajaLogica] [int] NOT NULL CONSTRAINT [DF__TiCatBase__BajaL__05A3D694]  DEFAULT ((0)),
	[FechaBajaLogica] [datetime] NULL,
	[FechaIns] [datetime] NULL,
	[ClaUsuarioIns] [int] NULL,
	[FechaUltimaMod] [datetime] NOT NULL CONSTRAINT [DF_TiCatBaseDeDatos_FechaUltimaMod]  DEFAULT (getdate()),
	[ClaUsuarioMod] [int] NULL,
	[NombrePcMod] [varchar](64) NULL,
 CONSTRAINT [PK_TiCatBaseDeDatos] PRIMARY KEY CLUSTERED 
(
	[ClaBaseDeDatos] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TiCatBoton]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TiCatBoton](
	[ClaBoton] [int] NOT NULL,
	[NombreBoton] [varchar](150) NULL,
	[ToolTipText] [varchar](50) NULL,
	[Imagen] [image] NULL,
	[Mensaje1] [varchar](1000) NULL,
	[Mensaje2] [varchar](1000) NULL,
	[Orden] [int] NULL,
	[ClaTipoAplicacion] [int] NULL,
	[BajaLogica] [int] NOT NULL,
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL,
	[NombrePcMod] [varchar](64) NULL,
	[ClaUsuarioMod] [int] NULL,
	[FechaIns] [datetime] NULL,
	[ClaUsuarioIns] [int] NULL,
	[AccesoRapido] [varchar](10) NULL,
 CONSTRAINT [PK_TiCatBoton] PRIMARY KEY CLUSTERED 
(
	[ClaBoton] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TiCatClasificacionEstatus]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TiCatClasificacionEstatus](
	[ClaClasificacionEstatus] [int] NOT NULL,
	[NombreClasificacionEstatus] [varchar](150) NULL,
	[BajaLogica] [int] NOT NULL CONSTRAINT [DF_TiCatClasificacionEstatus_BajaLogica]  DEFAULT ((0)),
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL CONSTRAINT [DF_TiCatClasificacionEstatus_FechaUltimaMod]  DEFAULT (getdate()),
	[NombrePcMod] [varchar](64) NULL,
	[ClaUsuarioMod] [int] NULL,
	[FechaIns] [datetime] NULL CONSTRAINT [DF_TiCatClasificacionEstatus_FechaIns]  DEFAULT (getdate()),
	[ClaUsuarioIns] [int] NULL,
 CONSTRAINT [PK_TiCatClasificacionEstatus] PRIMARY KEY CLUSTERED 
(
	[ClaClasificacionEstatus] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TiCatConexion]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TiCatConexion](
	[IdAplicacion] [varchar](50) NOT NULL,
	[ClaUbicacion] [int] NOT NULL,
	[IdConexion] [varchar](100) NOT NULL,
	[NombreServidor] [varchar](50) NOT NULL,
	[NombreBaseDeDatos] [varchar](50) NOT NULL,
	[Usuario] [varchar](50) NULL,
	[Password] [varchar](50) NULL,
	[ParametrosExtra] [varchar](250) NULL,
	[EsDefault] [int] NOT NULL,
	[BajaLogica] [int] NOT NULL,
	[FechaBajaLogica] [datetime] NULL,
	[ClaUsuarioMod] [int] NOT NULL,
	[FechaUltimaMod] [datetime] NOT NULL,
	[NombrePcMod] [varchar](64) NOT NULL,
 CONSTRAINT [PK_TiCatConexion] PRIMARY KEY CLUSTERED 
(
	[IdAplicacion] ASC,
	[ClaUbicacion] ASC,
	[IdConexion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TiCatConfiguracion]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TiCatConfiguracion](
	[ClaUbicacion] [int] NOT NULL,
	[ClaSistema] [int] NOT NULL,
	[ClaConfiguracion] [int] NOT NULL,
	[NombreConfiguracion] [varchar](80) NULL,
	[sValor1] [varchar](400) NULL,
	[sValor2] [varchar](400) NULL,
	[nValor1] [numeric](25, 3) NULL,
	[nValor2] [numeric](25, 3) NULL,
	[dValor1] [datetime] NULL,
	[dValor2] [datetime] NULL,
	[BajaLogica] [int] NOT NULL CONSTRAINT [DF_TiCatConfiguracion_BajaLogica]  DEFAULT ((0)),
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL CONSTRAINT [DF_TiCatConfiguracion_FechaUltimaMod]  DEFAULT (getdate()),
	[NombrePcMod] [varchar](64) NOT NULL CONSTRAINT [DF_TiCatConfiguracion_NombrePcMod]  DEFAULT (host_name()),
	[ClaUsuarioMod] [int] NOT NULL,
 CONSTRAINT [PK_TiCatConfiguracion] PRIMARY KEY CLUSTERED 
(
	[ClaUbicacion] ASC,
	[ClaSistema] ASC,
	[ClaConfiguracion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TiCatControlVisual]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TiCatControlVisual](
	[ClaControlVisual] [int] NOT NULL,
	[NombreControlVisual] [varchar](30) NOT NULL,
	[BajaLogica] [int] NOT NULL,
	[FechabajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL,
	[NombrePcMod] [varchar](64) NOT NULL,
	[ClaUsuarioMod] [int] NOT NULL,
 CONSTRAINT [PK_TiCatControlVisual] PRIMARY KEY CLUSTERED 
(
	[ClaControlVisual] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TiCatEmpresa]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TiCatEmpresa](
	[ClaEmpresa] [smallint] NOT NULL,
	[NombreEmpresa] [varchar](20) NULL,
	[DescEmpresa] [varchar](100) NULL,
	[BajaLogica] [int] NOT NULL CONSTRAINT [DF_TiCatEmpresa_BajaLogica]  DEFAULT ((0)),
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL CONSTRAINT [DF_TiCatEmpresa_FechaUltimaMod]  DEFAULT (getdate()),
	[FechaIns] [datetime] NULL,
	[Prefijo] [varchar](3) NULL,
	[ClaEmpresaContabiliza] [int] NULL,
 CONSTRAINT [PK_TiCatEmpresa] PRIMARY KEY CLUSTERED 
(
	[ClaEmpresa] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TiCatEnfoque]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TiCatEnfoque](
	[ClaEnfoque] [int] NOT NULL,
	[NombreEnfoque] [varchar](50) NULL,
	[BajaLogica] [int] NULL,
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NULL,
	[FechaIns] [datetime] NULL,
	[ClaTipoInventario] [int] NOT NULL,
	[NombrePcMod] [varchar](64) NOT NULL,
	[ClaUsuarioMod] [int] NOT NULL,
 CONSTRAINT [PKTiCatEnfoque] PRIMARY KEY CLUSTERED 
(
	[ClaTipoInventario] ASC,
	[ClaEnfoque] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TiCatEstatus]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TiCatEstatus](
	[ClaClasificacionEstatus] [int] NOT NULL,
	[ClaEstatus] [int] NOT NULL,
	[NombreEstatus] [varchar](150) NULL,
	[BajaLogica] [int] NOT NULL CONSTRAINT [DF_TiCatEstatus_BajaLogica]  DEFAULT ((0)),
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL CONSTRAINT [DF_TiCatEstatus_FechaUltimaMod]  DEFAULT (getdate()),
	[NombrePcMod] [varchar](64) NULL,
	[ClaUsuarioMod] [int] NULL,
	[FechaIns] [datetime] NULL CONSTRAINT [DF_TiCatEstatus_FechaIns]  DEFAULT (getdate()),
	[ClaUsuarioIns] [int] NULL,
	[NombreIngles] [varchar](150) NULL,
 CONSTRAINT [PK_TiCatEstatus] PRIMARY KEY CLUSTERED 
(
	[ClaClasificacionEstatus] ASC,
	[ClaEstatus] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TiCatFolios]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TiCatFolios](
	[ClaUbicacion] [int] NOT NULL,
	[ClaSistema] [int] NOT NULL,
	[ClaFolio] [int] NOT NULL,
	[NomFolio] [varchar](80) NULL,
	[UltimoFolioUsado] [int] NULL,
	[sValor1] [varchar](100) NULL,
	[sValor2] [varchar](100) NULL,
	[nValor1] [numeric](13, 3) NULL,
	[nValor2] [numeric](13, 3) NULL,
	[dValor1] [datetime] NULL,
	[dValor2] [datetime] NULL,
	[BajaLogica] [int] NULL,
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NULL,
 CONSTRAINT [PK_TiCatFolio] PRIMARY KEY CLUSTERED 
(
	[ClaUbicacion] ASC,
	[ClaSistema] ASC,
	[ClaFolio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TiCatHorario]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TiCatHorario](
	[ClaHorario] [int] NOT NULL,
	[NombreHorario] [varchar](50) NULL,
	[ClaPeriodo] [int] NULL,
	[InicioPeriodo] [int] NULL,
	[FinPeriodo] [int] NULL,
	[IntervaloPeriodo] [int] NULL,
	[DiasSemana] [varchar](50) NULL,
	[HoraInicio] [int] NULL,
	[HoraFin] [int] NULL,
	[IntervaloHoras] [int] NULL,
	[BajaLogica] [int] NOT NULL,
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL,
	[FechaIns] [datetime] NULL,
 CONSTRAINT [PK_TiCatHorario] PRIMARY KEY CLUSTERED 
(
	[ClaHorario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TiCatIdioma]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TiCatIdioma](
	[ClaIdioma] [char](15) NOT NULL,
	[NombreIdioma] [varchar](30) NULL,
	[BajaLogica] [int] NOT NULL,
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL,
	[NombrePcMod] [varchar](64) NULL,
	[ClaUsuarioMod] [int] NULL,
 CONSTRAINT [PK_TiCatIdioma] PRIMARY KEY CLUSTERED 
(
	[ClaIdioma] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TiCatMascara]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TiCatMascara](
	[ClaMascara] [int] NOT NULL,
	[ClaTipoDato] [int] NULL,
	[DescMascara] [varchar](100) NULL,
	[BajaLogica] [int] NULL,
	[FechaBajaLogica] [datetime] NULL,
	[FechaIns] [datetime] NULL,
	[ClaUsuarioIns] [int] NULL,
	[FechaUltimaMod] [datetime] NULL,
	[ClaUsuarioMod] [int] NULL,
	[NombrePcMod] [varchar](64) NULL,
 CONSTRAINT [PK_TiCatMascara] PRIMARY KEY CLUSTERED 
(
	[ClaMascara] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TiCatOpcionAutenticacion]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TiCatOpcionAutenticacion](
	[ClaOpcionAutenticacion] [int] NOT NULL,
	[NivelSeguridad] [int] NOT NULL,
	[NomOpcionAutenticacion] [varchar](150) NOT NULL,
	[Orden] [int] NOT NULL,
	[BajaLogica] [int] NOT NULL,
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL,
	[ClaUsuarioMod] [int] NULL,
	[NombrePcMod] [varchar](64) NULL,
 CONSTRAINT [PK_TiOpcionAutenticacion] PRIMARY KEY CLUSTERED 
(
	[ClaOpcionAutenticacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TiCatPeriodo]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TiCatPeriodo](
	[ClaPeriodo] [int] NOT NULL,
	[NombrePeriodo] [varchar](50) NULL,
	[BajaLogica] [int] NOT NULL,
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL,
	[FechaIns] [datetime] NULL,
 CONSTRAINT [PK_TiCatPeriodo] PRIMARY KEY CLUSTERED 
(
	[ClaPeriodo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TiCatPreferencia]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TiCatPreferencia](
	[ClaUbicacion] [int] NOT NULL,
	[ClaSistema] [int] NOT NULL,
	[IdUsuario] [int] NOT NULL,
	[IdPreferencia] [int] NOT NULL,
	[ValorPreferencia] [varchar](100) NULL,
 CONSTRAINT [PKTiCatPreferencia] PRIMARY KEY CLUSTERED 
(
	[ClaUbicacion] ASC,
	[ClaSistema] ASC,
	[IdUsuario] ASC,
	[IdPreferencia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TiCatRegla]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TiCatRegla](
	[ClaRegla] [int] NOT NULL,
	[ClaTipoDato] [int] NOT NULL,
	[DescRegla] [varchar](50) NULL,
	[BajaLogica] [int] NULL,
	[FechaBajaLogica] [datetime] NULL,
	[FechaIns] [datetime] NULL,
	[ClaUsuarioIns] [int] NULL,
	[FechaUltimaMod] [datetime] NULL,
	[ClaUsuarioMod] [int] NULL,
	[NombrePcMod] [varchar](64) NULL,
 CONSTRAINT [PK_TiCatRegla] PRIMARY KEY CLUSTERED 
(
	[ClaRegla] ASC,
	[ClaTipoDato] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TiCatServidor]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TiCatServidor](
	[ClaServidor] [int] NOT NULL,
	[ClaUbicacion] [int] NOT NULL,
	[NombreServidor] [varchar](50) NOT NULL,
	[DescripcionServidor] [varchar](50) NOT NULL,
	[IpAddress] [varchar](50) NOT NULL,
	[BajaLogica] [int] NOT NULL CONSTRAINT [DF__TiCatServ__BajaL__7EF6D905]  DEFAULT ((0)),
	[FechaBajaLogica] [datetime] NULL,
	[FechaIns] [datetime] NULL,
	[ClaUsuarioIns] [int] NULL,
	[FechaUltimaMod] [datetime] NOT NULL CONSTRAINT [DF_TiCatServidor_FechaUltimaMod]  DEFAULT (getdate()),
	[ClaUsuarioMod] [int] NULL,
	[NombrePcMod] [varchar](64) NULL,
 CONSTRAINT [PK_TiCatServidor] PRIMARY KEY CLUSTERED 
(
	[ClaServidor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UQ_TiCatServidor_NombreServidor] UNIQUE NONCLUSTERED 
(
	[NombreServidor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TiCatSistema]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TiCatSistema](
	[ClaSistema] [int] NOT NULL,
	[NombreSistema] [varchar](50) NULL,
	[NombrePrefijo] [varchar](4) NULL,
	[ContactoTi] [varchar](50) NULL,
	[EsSistema] [int] NULL,
	[EsComponente] [int] NULL,
	[EsInterno] [int] NULL,
	[PerfilCorreo] [varchar](50) NULL,
	[BajaLogica] [int] NOT NULL CONSTRAINT [DF_TiCatSistema_BajaLogica]  DEFAULT ((0)),
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL CONSTRAINT [DF_TiCatSistema_FechaUltimaMod]  DEFAULT (getdate()),
	[FechaIns] [datetime] NULL CONSTRAINT [DF_TiCatSistema_FechaIns]  DEFAULT (getdate()),
	[ClaTipoSistema] [int] NULL,
	[ClaEstatusSistema] [int] NULL,
	[ClaGerenteResponsable] [int] NULL,
 CONSTRAINT [PK_TiCatSistema] PRIMARY KEY CLUSTERED 
(
	[ClaSistema] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UQ_TiCatSistema_NombreSistema] UNIQUE NONCLUSTERED 
(
	[NombreSistema] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TiCatTipoDato]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TiCatTipoDato](
	[ClaTipoDato] [int] NOT NULL,
	[DescTipo] [varchar](50) NOT NULL,
	[TipoRepresentacion] [int] NOT NULL,
	[TipoDatoSql] [int] NOT NULL,
	[BajaLogica] [int] NULL,
	[FechaBajaLogica] [datetime] NULL,
	[FechaIns] [datetime] NULL,
	[ClaUsuarioIns] [int] NULL,
	[FechaUltimaMod] [datetime] NULL,
	[ClaUsuarioMod] [int] NULL,
	[NombrePcMod] [varchar](64) NULL,
 CONSTRAINT [PK_TiCatTipoDato] PRIMARY KEY CLUSTERED 
(
	[ClaTipoDato] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TiCatTipoObjeto]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TiCatTipoObjeto](
	[ClaTipoObjeto] [int] NOT NULL,
	[Nombre] [varchar](100) NOT NULL,
	[DescrPermiso1] [varchar](20) NULL,
	[DescrPermiso2] [varchar](20) NULL,
	[DescrPermiso3] [varchar](20) NULL,
	[DescrPermiso4] [varchar](20) NULL,
	[DescrPermiso5] [varchar](20) NULL,
	[DescrPermiso6] [varchar](20) NULL,
	[DescrPermiso7] [varchar](20) NULL,
	[DescrPermiso8] [varchar](20) NULL,
	[BajaLogica] [int] NOT NULL,
	[FechaBajaLogica] [datetime] NULL,
	[FechaIns] [datetime] NOT NULL,
	[ClaUsuarioIns] [int] NULL,
	[FechaUltimaMod] [datetime] NOT NULL,
	[ClaUsuarioMod] [int] NULL,
	[NombrePcMod] [varchar](64) NULL,
 CONSTRAINT [PK_TipoObjeto] PRIMARY KEY CLUSTERED 
(
	[ClaTipoObjeto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TiCatTipoPreferencia]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TiCatTipoPreferencia](
	[IdPreferencia] [int] NOT NULL,
	[NomTipoPreferencia] [varchar](50) NULL,
 CONSTRAINT [PKTiCatTipoPreferencia] PRIMARY KEY CLUSTERED 
(
	[IdPreferencia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TiCatTipoUbicacion]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TiCatTipoUbicacion](
	[ClaTipoUbicacion] [int] NOT NULL,
	[NombreTipoUbicacion] [char](30) NULL,
	[UsaCuentaPuente] [int] NOT NULL CONSTRAINT [DF_TiCatTipoUbicacion_UsaCuentaPuente]  DEFAULT ((0)),
	[BajaLogica] [int] NOT NULL CONSTRAINT [DF_TiCatTipoUbicacion_BajaLogica]  DEFAULT ((0)),
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL CONSTRAINT [DF_TiCatTipoUbicacion_FechaUltimaMod]  DEFAULT (getdate()),
	[FechaIns] [datetime] NULL,
 CONSTRAINT [PK_TiCatTipoUbicacion] PRIMARY KEY CLUSTERED 
(
	[ClaTipoUbicacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TiCatUbicacion]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TiCatUbicacion](
	[ClaUbicacion] [int] NOT NULL,
	[NombreUbicacion] [char](50) NULL,
	[ClaTipoUbicacion] [int] NULL,
	[ClaEmpresa] [int] NOT NULL,
	[ClaCliente] [int] NULL,
	[NombreCorto] [varchar](15) NULL,
	[ClaCiudadBase] [int] NULL,
	[ClaPais] [int] NULL,
	[ClaEstado] [int] NULL,
	[ClaUbicacionVentas] [int] NOT NULL,
	[Direccion] [char](40) NULL,
	[Colonia] [char](40) NULL,
	[Poblacion] [char](40) NULL,
	[CodigoPostal] [char](10) NULL,
	[Telefonos] [char](20) NULL,
	[Fax] [char](20) NULL,
	[ClaTipoUbicacionVentas] [int] NULL,
	[EmpresaFacturar] [varchar](50) NULL,
	[AplicaFactorCubicaje] [int] NULL,
	[PctToleranciaEmb] [float] NULL,
	[BajaLogica] [int] NOT NULL CONSTRAINT [DF_TiCatUbicacion_BajaLogica]  DEFAULT ((0)),
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL CONSTRAINT [DF_TiCatUbicacion_FechaUltimaMod]  DEFAULT (getdate()),
	[FechaIns] [datetime] NULL,
 CONSTRAINT [PK_TiCatUbicacion] PRIMARY KEY CLUSTERED 
(
	[ClaUbicacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TiCatUbicacionesCostos]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TiCatUbicacionesCostos](
	[ClaUbicacion] [int] NULL,
	[ClaEnfoque] [int] NULL,
	[NombreEnfoque] [varchar](50) NULL,
	[EsPatio] [int] NULL,
	[TipoPatio] [int] NULL,
 CONSTRAINT [PK_TiCatUbicacionesCostos] UNIQUE NONCLUSTERED 
(
	[ClaUbicacion] ASC,
	[ClaEnfoque] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TiCatUsuario]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TiCatUsuario](
	[IdUsuario] [int] NULL,
	[ClaEmpleado] [int] NULL,
	[NombrePerfil] [varchar](100) NULL,
	[NombreUsuario] [varchar](50) NULL,
	[ApellidoPaterno] [varchar](50) NULL,
	[ApellidoMaterno] [varchar](50) NULL,
	[FechaNacimiento] [datetime] NULL,
	[Email] [varchar](50) NULL,
	[EmailAlterno] [varchar](50) NULL,
	[LoginUserName] [varchar](20) NULL,
	[TelefonoCasa] [varchar](20) NULL,
	[TelefonoOficina] [varchar](20) NULL,
	[TelefonoCelular] [varchar](20) NULL,
	[Puesto] [varchar](50) NULL,
	[IdEmpleadoJefe] [int] NULL,
	[ClaCrc] [int] NULL,
	[Dominio] [varchar](50) NULL,
	[Bloqueado] [tinyint] NULL,
	[ClaUbicacionDefault] [int] NULL,
	[Perfil] [tinyint] NULL,
	[NombreModificable] [tinyint] NULL,
	[AutenticacionActiveD] [tinyint] NULL,
	[IntentosFallidosPrincipal] [int] NULL,
	[FechaUltIntentoPrincipal] [datetime] NULL,
	[DispositivoMovil] [varchar](20) NULL,
	[BajaLogica] [int] NULL,
	[FechaBajaLogica] [datetime] NULL,
	[FechaIns] [datetime] NULL,
	[ClaUsuarioIns] [int] NULL,
	[FechaUltimaMod] [datetime] NULL,
	[ClaUsuarioMod] [int] NULL,
	[NombrePcMod] [varchar](64) NULL,
	[ClaPuesto] [int] NULL,
	[BajaNomina] [int] NULL,
	[Rfc] [varchar](13) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TiCSTrabajadores]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TiCSTrabajadores](
	[cla_empresa] [int] NOT NULL,
	[cla_ubicacion] [int] NOT NULL,
	[cla_nomina] [int] NOT NULL,
	[Num_trabajador] [int] NOT NULL,
	[cla_llaveEUN] [int] NULL,
	[ClaTrabajador] [int] NULL,
	[nom_trabajador] [varchar](20) NULL,
	[apellido_paterno] [varchar](20) NULL,
	[apellido_materno] [varchar](20) NULL,
	[FechaNacimiento] [datetime] NULL,
	[telefono] [varchar](15) NULL,
	[rfc] [varchar](15) NULL,
	[crc] [int] NULL,
	[BajaLogica] [int] NULL,
	[fecha_ultimo_cambio] [datetime] NULL,
	[Modificado_sn] [int] NULL,
 CONSTRAINT [PK_TiCSTrabajadores] PRIMARY KEY CLUSTERED 
(
	[cla_empresa] ASC,
	[cla_ubicacion] ASC,
	[cla_nomina] ASC,
	[Num_trabajador] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TiCSUbicacionesNominas]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TiCSUbicacionesNominas](
	[cla_empresa] [int] NOT NULL,
	[cla_ubicacion] [int] NOT NULL,
	[nom_ubicacion] [varchar](80) NULL,
	[exp_ubicacion] [varchar](250) NULL,
	[es_uni_neg] [int] NULL,
	[nom_corto] [char](15) NULL,
	[nom_db] [char](20) NULL,
	[nom_usuario] [char](20) NULL,
	[password] [char](20) NULL,
	[servidor] [char](30) NULL,
	[nom_dbreal] [char](30) NULL,
	[directorio] [char](50) NULL,
	[activo] [int] NULL,
 CONSTRAINT [PK_TiCSUbicacionesNominas] PRIMARY KEY CLUSTERED 
(
	[cla_empresa] ASC,
	[cla_ubicacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TiRelAgrupadorColUbicacion]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TiRelAgrupadorColUbicacion](
	[ClaAgrupadorCol] [int] NOT NULL,
	[IdUbicacion] [int] NOT NULL,
	[BajaLogica] [int] NOT NULL,
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL,
	[NombrePcMod] [varchar](64) NOT NULL,
 CONSTRAINT [PK_TiRelAgrupadorColUbicacion] PRIMARY KEY CLUSTERED 
(
	[ClaAgrupadorCol] ASC,
	[IdUbicacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TiRelAgrupadorColUsuario]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TiRelAgrupadorColUsuario](
	[ClaAgrupadorCol] [int] NOT NULL,
	[IdUsuario] [int] NOT NULL,
	[BajaLogica] [int] NOT NULL,
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL,
	[NombrePcMod] [varchar](64) NOT NULL,
 CONSTRAINT [PK_TiRelAgrupadorColUsuario] PRIMARY KEY CLUSTERED 
(
	[ClaAgrupadorCol] ASC,
	[IdUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TiRelEnfoqueUbicacion]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TiRelEnfoqueUbicacion](
	[ClaEnfoque] [int] NOT NULL,
	[ClaUbicacion] [int] NOT NULL,
	[BajaLogica] [int] NULL,
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NULL,
	[FechaIns] [datetime] NULL,
 CONSTRAINT [PK_TiRelEnfoqueUbicacion] PRIMARY KEY CLUSTERED 
(
	[ClaEnfoque] ASC,
	[ClaUbicacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TiSysUbicacion]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TiSysUbicacion](
	[claEmpresa] [int] NULL,
	[claubicacion] [int] NULL,
	[nomubicacion] [varchar](100) NULL,
	[expubicacion] [varchar](250) NULL,
	[esunineg] [int] NULL,
	[nomcorto] [varchar](100) NULL,
	[nombd] [varchar](100) NULL,
	[nomusuario] [varchar](100) NULL,
	[password] [varchar](100) NULL,
	[servidor] [varchar](100) NULL,
	[nombdreal] [varchar](100) NULL,
	[directorio] [varchar](250) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TiTraAsociacionReferencial]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TiTraAsociacionReferencial](
	[IdCatalogoPadre] [int] NOT NULL,
	[IdColumnaPadre] [int] NOT NULL,
	[IdColumnaLlavePadre] [int] NULL,
	[IdCatalogoHijo] [int] NOT NULL,
	[IdColumnaHijo] [int] NOT NULL,
	[EdicionMinima] [int] NULL,
	[Autofiltrado] [bit] NULL,
	[BajaLogica] [int] NULL,
	[FechaBajaLogica] [datetime] NULL,
	[FechaIns] [datetime] NULL,
	[ClaUsuarioIns] [int] NULL,
	[FechaUltimaMod] [datetime] NULL,
	[ClaUsuarioMod] [int] NULL,
	[NombrePcMod] [varchar](64) NULL,
	[ClaAlterna] [int] NULL,
	[MostrarClaveDescripcion] [bit] NULL,
 CONSTRAINT [PK_TiTraAsociacionReferencial] PRIMARY KEY CLUSTERED 
(
	[IdCatalogoHijo] ASC,
	[IdColumnaHijo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TiTraAsociacionReferencialDet]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TiTraAsociacionReferencialDet](
	[IdCatalogoPadre] [int] NOT NULL,
	[IdColumnaPadre] [int] NOT NULL,
	[IdCatalogoHijo] [int] NOT NULL,
	[IdColumnaHijo] [int] NOT NULL,
	[BajaLogica] [int] NULL,
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NULL,
	[ClaUsuarioMod] [int] NULL,
	[NombrePcMod] [varchar](64) NULL,
 CONSTRAINT [PK_TiTraAsociacionReferencialDet_1] PRIMARY KEY CLUSTERED 
(
	[IdCatalogoHijo] ASC,
	[IdColumnaHijo] ASC,
	[IdCatalogoPadre] ASC,
	[IdColumnaPadre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TiTraCatalogo]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TiTraCatalogo](
	[IdCatalogo] [int] NOT NULL,
	[Titulo] [varchar](100) NOT NULL,
	[DescCatalogo] [varchar](50) NOT NULL,
	[Comentarios] [varchar](100) NULL,
	[EnMantenimiento] [tinyint] NULL,
	[ClaModulo] [int] NOT NULL,
	[ClaSistema] [int] NOT NULL,
	[TablaFisica] [varchar](50) NOT NULL,
	[Owner] [varchar](50) NULL,
	[EsBase] [tinyint] NULL,
	[ClaUbicacionDefault] [int] NULL,
	[UbicacionDefault] [varchar](50) NULL,
	[ClaConexionDefault] [int] NULL,
	[PasswordRegistro] [varchar](50) NULL,
	[ClaObjeto] [int] NULL,
	[VerBajasLogicas] [bit] NULL,
	[TipoVisorDefault] [tinyint] NOT NULL,
	[TieneFechaIns] [tinyint] NOT NULL,
	[TieneClaUsuarioIns] [tinyint] NOT NULL,
	[TieneFechaUltimaMod] [tinyint] NOT NULL,
	[TieneClaUsuarioMod] [tinyint] NOT NULL,
	[TieneNombrePcMod] [tinyint] NOT NULL,
	[BajaLogica] [int] NULL,
	[FechaBajaLogica] [datetime] NULL,
	[FechaIns] [datetime] NULL,
	[ClaUsuarioIns] [int] NULL,
	[FechaUltimaMod] [datetime] NULL,
	[ClaUsuarioMod] [int] NULL,
	[NombrePcMod] [varchar](64) NULL,
	[Alto] [int] NULL,
	[ancho] [int] NULL,
	[VerSeccionAgrupador] [bit] NULL,
	[VerStatusBar] [bit] NULL,
	[VerColumnaBajaLogica] [bit] NULL,
	[Autofiltrado] [bit] NULL,
	[AccionGuardado] [int] NULL,
 CONSTRAINT [PK_TiTraCatalogo] PRIMARY KEY CLUSTERED 
(
	[IdCatalogo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TiTraCatalogoEvento]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TiTraCatalogoEvento](
	[IdCatalogo] [int] NOT NULL,
	[IdColumna] [int] NOT NULL,
	[ClaEvento] [int] NOT NULL,
	[ComandoEjecucion] [varchar](250) NOT NULL,
	[ParametrosComando] [varchar](250) NOT NULL,
	[FechaUltimaMod] [datetime] NULL,
	[BajaLogica] [int] NOT NULL,
	[FechaBajaLogica] [datetime] NULL,
 CONSTRAINT [PK_TiTraCatalogoEvento] PRIMARY KEY CLUSTERED 
(
	[IdCatalogo] ASC,
	[IdColumna] ASC,
	[ClaEvento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TiTraCatalogoIdioma]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TiTraCatalogoIdioma](
	[ClaIdioma] [char](15) NOT NULL,
	[IdCatalogo] [int] NOT NULL,
	[Titulo] [varchar](100) NULL,
	[DescCatalogo] [varchar](50) NULL,
	[Comentarios] [varchar](100) NULL,
	[BajaLogica] [int] NOT NULL,
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL,
	[NombrePcMod] [varchar](64) NULL,
	[ClaUsuarioMod] [int] NULL,
 CONSTRAINT [PK_TiTraCatalogoIdioma] PRIMARY KEY CLUSTERED 
(
	[ClaIdioma] ASC,
	[IdCatalogo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TiTraColumna]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TiTraColumna](
	[IdCatalogo] [int] NOT NULL,
	[IdColumna] [int] NOT NULL,
	[Posicion] [int] NOT NULL,
	[LlavePrimaria] [tinyint] NOT NULL,
	[EsDescripcion] [tinyint] NULL,
	[Etiqueta] [varchar](50) NOT NULL,
	[NombreFisico] [varchar](50) NOT NULL,
	[NombreLogico] [varchar](150) NOT NULL,
	[ClaObjeto] [int] NULL,
	[Visible] [tinyint] NULL,
	[Insertar] [tinyint] NULL,
	[Editar] [tinyint] NULL,
	[Longitud] [int] NULL,
	[Decimales] [int] NULL,
	[LargoTabla] [int] NULL,
	[LargoForma] [int] NULL,
	[Alto] [int] NULL,
	[PermitirNulos] [tinyint] NULL,
	[ValorDefault] [sql_variant] NULL,
	[Consecutivo] [tinyint] NULL,
	[ClaMascara] [int] NULL,
	[ClaTipoDato] [int] NOT NULL,
	[VerificaDuplicados] [bit] NULL,
	[BajaLogica] [int] NULL,
	[FechaBajaLogica] [datetime] NULL,
	[FechaIns] [datetime] NULL,
	[ClaUsuarioIns] [int] NULL,
	[FechaUltimaMod] [datetime] NULL,
	[ClaUsuarioMod] [int] NULL,
	[NombrePcMod] [varchar](64) NULL,
	[ClaControlVisual] [int] NULL,
	[Formula] [varchar](500) NULL,
	[FormulaRequerido] [varchar](500) NULL,
	[OrdenDespliegue] [int] NULL,
 CONSTRAINT [PK_TiTraColumna] PRIMARY KEY CLUSTERED 
(
	[IdColumna] ASC,
	[IdCatalogo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TiTraColumnaAccion]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TiTraColumnaAccion](
	[IdCatalogo] [int] NOT NULL,
	[IdColumna] [int] NOT NULL,
	[IdColumnaAfectar] [int] NOT NULL,
	[Valor] [varchar](50) NOT NULL,
	[FechaUltimaMod] [datetime] NULL,
	[BajaLogica] [int] NOT NULL,
	[FechaBajaLogica] [datetime] NULL,
	[ClaUsuarioMod] [int] NULL,
	[NombrePcMod] [varchar](64) NULL,
 CONSTRAINT [PK_TiTraColumnaAccion] PRIMARY KEY CLUSTERED 
(
	[IdCatalogo] ASC,
	[IdColumna] ASC,
	[IdColumnaAfectar] ASC,
	[Valor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TiTraColumnaCompara]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TiTraColumnaCompara](
	[IdCatalogo] [int] NOT NULL,
	[IdColumna] [int] NOT NULL,
	[IdColumnaCompara] [int] NOT NULL,
	[Criterio] [varchar](20) NOT NULL,
	[BajaLogica] [int] NOT NULL,
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL,
	[NombrePcMod] [varchar](64) NOT NULL,
	[ClaUsuarioMod] [int] NOT NULL,
 CONSTRAINT [PK_TiTraColumnaCompara] PRIMARY KEY CLUSTERED 
(
	[IdCatalogo] ASC,
	[IdColumna] ASC,
	[IdColumnaCompara] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TiTraColumnaDependencia]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TiTraColumnaDependencia](
	[IdCatalogo] [int] NOT NULL,
	[IdColumnaDependiente] [int] NOT NULL,
	[Origen] [int] NOT NULL,
	[Dependencia] [int] NOT NULL,
	[NombrePcMod] [varchar](50) NULL,
	[FechaUltimaMod] [datetime] NULL,
	[BajaLogica] [int] NOT NULL,
	[FechaBajaLogica] [datetime] NULL,
 CONSTRAINT [PK_TiTraColumnaDependencia] PRIMARY KEY CLUSTERED 
(
	[IdCatalogo] ASC,
	[IdColumnaDependiente] ASC,
	[Origen] ASC,
	[Dependencia] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TiTraColumnaFiltro]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TiTraColumnaFiltro](
	[IdCatalogo] [int] NOT NULL,
	[IdColumna] [int] NOT NULL,
	[Criterio] [varchar](50) NOT NULL,
	[Requerido] [bit] NULL,
	[ValorInicial] [varchar](50) NULL,
	[Orden] [int] NULL,
	[Visible] [bit] NULL,
	[Formula] [varchar](500) NULL,
	[FormulaVisible] [varchar](500) NULL,
	[FormulaEditable] [varchar](500) NULL,
	[FormulaRequerido] [varchar](500) NULL,
	[Editable] [bit] NULL,
	[AccionDeCambio] [int] NULL,
	[BajaLogica] [int] NULL,
	[FechaBajaLogica] [datetime] NULL,
	[FechaIns] [datetime] NULL,
	[ClaUsuarioIns] [int] NULL,
	[FechaUltimaMod] [datetime] NULL,
	[ClaUsuarioMod] [int] NULL,
	[NombrePcMod] [varchar](64) NULL,
	[ComandoParametros] [varchar](500) NULL,
	[ClaComponente] [int] NULL,
	[Pregunta] [varchar](250) NULL,
 CONSTRAINT [PK_TiTraColumnaFiltro] PRIMARY KEY CLUSTERED 
(
	[IdCatalogo] ASC,
	[IdColumna] ASC,
	[Criterio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TiTraColumnaIdioma]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TiTraColumnaIdioma](
	[ClaIdioma] [char](15) NOT NULL,
	[IdCatalogo] [int] NOT NULL,
	[IdColumna] [int] NOT NULL,
	[Etiqueta] [varchar](50) NULL,
	[BajaLogica] [int] NOT NULL,
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL,
	[NombrePcMod] [varchar](64) NULL,
	[ClaUsuarioMod] [int] NULL,
 CONSTRAINT [PK_TiTraColumnaIdioma] PRIMARY KEY CLUSTERED 
(
	[ClaIdioma] ASC,
	[IdCatalogo] ASC,
	[IdColumna] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TiTraConexionCatalogo]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TiTraConexionCatalogo](
	[IdCatalogo] [int] NOT NULL,
	[IdUbicacion] [int] NOT NULL,
	[NombreUbicacion] [varchar](50) NULL,
	[NombreServidor] [varchar](50) NOT NULL,
	[IpAddress] [varchar](50) NULL,
	[NombreBaseDatos] [varchar](50) NOT NULL,
	[Usuario] [varchar](30) NOT NULL,
	[Contrasena] [varchar](30) NULL,
	[BajaLogica] [int] NULL,
	[FechaBajaLogica] [datetime] NULL,
	[FechaIns] [datetime] NULL,
	[ClaUsuarioIns] [int] NULL,
	[FechaUltimaMod] [datetime] NULL,
	[ClaUsuarioMod] [int] NULL,
	[NombrePcMod] [varchar](64) NULL,
 CONSTRAINT [PK_TiTraConexionCatalogo] PRIMARY KEY CLUSTERED 
(
	[IdCatalogo] ASC,
	[IdUbicacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TiTraConfiguracion]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TiTraConfiguracion](
	[NumIntentosMaxContrasena] [int] NOT NULL,
	[NumIntentosMaxHuella] [int] NOT NULL,
	[TiempoExpiracion] [bigint] NOT NULL,
	[FechaUltimaMod] [datetime] NOT NULL,
	[ClaUsuarioMod] [int] NULL,
	[NombrePcMod] [varchar](64) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TiTraItem]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TiTraItem](
	[IdItem] [int] NOT NULL,
	[IdMenu] [int] NOT NULL,
	[IdItemPadre] [int] NULL,
	[Nombre] [varchar](60) NULL,
	[AbrirEnNuevaVentana] [tinyint] NULL,
	[Orden] [int] NOT NULL,
	[ClaTipoItem] [int] NOT NULL,
	[ComandoEjecucion] [varchar](250) NULL,
	[ClaComponente] [int] NULL,
	[ParametrosComando] [varchar](250) NULL,
	[UrlIcono] [varchar](250) NULL,
	[Icono] [image] NULL,
	[ClaTipoAplicacion] [int] NULL,
	[ClaObjetoSeguridad] [int] NULL,
	[ClaUbicacionEjecucion] [int] NULL,
	[ClaUbicacionValida] [int] NULL,
	[HeredaDatosObjetoSeguridad] [tinyint] NULL,
	[Comentarios] [varchar](250) NULL,
	[BajaLogica] [tinyint] NULL,
	[FechaIns] [datetime] NULL,
	[ClaUsuarioIns] [int] NULL,
	[FechaUltimaMod] [datetime] NULL,
	[ClaUsuarioMod] [int] NULL,
	[NombrePcMod] [varchar](64) NULL,
	[FechaBajaLogica] [datetime] NULL,
 CONSTRAINT [PK_TiTraItem] PRIMARY KEY CLUSTERED 
(
	[IdItem] ASC,
	[IdMenu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TiTraItemUbicacion]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TiTraItemUbicacion](
	[IdMenu] [int] NOT NULL,
	[IdItem] [int] NOT NULL,
	[ClaUbicacion] [int] NOT NULL,
	[NoValida] [tinyint] NULL,
	[Valida] [tinyint] NULL,
	[BajaLogica] [tinyint] NULL,
	[FechaIns] [datetime] NULL,
	[ClaUsuarioIns] [int] NULL,
	[FechaUltimaMod] [datetime] NULL,
	[ClaUsuarioMod] [int] NULL,
	[NombrePcMod] [varchar](64) NULL,
 CONSTRAINT [PK_TiTraItemUbicacion] PRIMARY KEY CLUSTERED 
(
	[IdMenu] ASC,
	[IdItem] ASC,
	[ClaUbicacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TiTraMenu]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TiTraMenu](
	[IdMenu] [int] NOT NULL,
	[Titulo] [varchar](250) NULL,
	[Comentarios] [varchar](200) NULL,
	[ClaFormatoMenu] [int] NULL,
	[ClaFormatoItem] [int] NULL,
	[ClaFormatoAreaTrabajo] [int] NULL,
	[ClaUbicacionDefault] [int] NOT NULL,
	[ClaUbicacionValida] [int] NOT NULL,
	[ClaGrupoMenu] [int] NOT NULL,
	[ClaSubgrupoMenu] [int] NOT NULL,
	[OrientacionMenu] [tinyint] NOT NULL,
	[PasswordRegistro] [varbinary](50) NULL,
	[BajaLogica] [tinyint] NULL,
	[FechaIns] [datetime] NULL,
	[ClaUsuarioIns] [int] NULL,
	[FechaUltimaMod] [datetime] NULL,
	[ClaUsuarioMod] [int] NULL,
	[NombrePcMod] [varchar](64) NULL,
	[FechaBajaLogica] [datetime] NULL,
	[ClaTipoAplicacion] [int] NULL,
 CONSTRAINT [PK_TiTraMenu] PRIMARY KEY CLUSTERED 
(
	[IdMenu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TiTraMenuUbicacion]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TiTraMenuUbicacion](
	[IdMenu] [int] NOT NULL,
	[ClaUbicacion] [int] NOT NULL,
	[NoValida] [tinyint] NULL,
	[Valida] [tinyint] NULL,
	[BajaLogica] [tinyint] NULL,
	[FechaIns] [datetime] NULL,
	[ClaUsuarioIns] [int] NULL,
	[FechaUltimaMod] [datetime] NULL,
	[ClaUsuarioMod] [int] NULL,
	[NombrePcMod] [varchar](64) NULL,
 CONSTRAINT [PK_TiTraMenuUbicacion] PRIMARY KEY CLUSTERED 
(
	[IdMenu] ASC,
	[ClaUbicacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TiTraMenuUsuario]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TiTraMenuUsuario](
	[IdMenu] [int] NOT NULL,
	[ClaUsuario] [int] NOT NULL,
	[Orden] [int] NOT NULL,
	[BajaLogica] [tinyint] NULL,
	[FechaIns] [datetime] NULL,
	[ClaUsuarioIns] [int] NULL,
	[FechaUltimaMod] [datetime] NULL,
	[ClaUsuarioMod] [int] NULL,
	[NombrePcMod] [varchar](64) NULL,
	[FechaBajaLogica] [datetime] NULL,
 CONSTRAINT [PK_TiTraMenuUsuario] PRIMARY KEY CLUSTERED 
(
	[IdMenu] ASC,
	[ClaUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TiTraObjeto]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TiTraObjeto](
	[IdObjeto] [int] NOT NULL,
	[ClaSistema] [int] NOT NULL,
	[Nombre] [varchar](50) NOT NULL,
	[Comando] [varchar](200) NULL,
	[Parametros] [varchar](300) NULL,
	[Menu] [tinyint] NOT NULL,
	[EnMantenimiento] [tinyint] NULL,
	[ClaTipoObjeto] [int] NOT NULL,
	[NombreModificable] [tinyint] NOT NULL,
	[Observaciones] [varchar](200) NULL,
	[Permiso1] [tinyint] NOT NULL,
	[Permiso2] [tinyint] NOT NULL,
	[Permiso3] [tinyint] NOT NULL,
	[Permiso4] [tinyint] NOT NULL,
	[Permiso5] [tinyint] NOT NULL,
	[Permiso6] [tinyint] NOT NULL,
	[Permiso7] [tinyint] NOT NULL,
	[Permiso8] [tinyint] NOT NULL,
	[BajaLogica] [int] NOT NULL,
	[FechaBajaLogica] [datetime] NULL,
	[FechaIns] [datetime] NOT NULL,
	[ClaUsuarioIns] [int] NULL,
	[FechaUltimaMod] [datetime] NOT NULL,
	[ClaUsuarioMod] [int] NULL,
	[NombrePcMod] [varchar](64) NULL,
 CONSTRAINT [PK_Sistema_Objeto] PRIMARY KEY CLUSTERED 
(
	[IdObjeto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TiTraObjetoColumna]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TiTraObjetoColumna](
	[IdObjeto] [int] NOT NULL,
	[Orden] [int] NOT NULL,
	[IdUsuario] [int] NOT NULL,
	[ClaCriterio] [int] NOT NULL,
	[Valor] [varchar](20) NOT NULL,
	[PasswordRegistro] [varchar](50) NULL,
	[FechaUltimaMod] [datetime] NULL,
	[BajaLogica] [int] NOT NULL,
	[FechaBajaLogica] [datetime] NULL,
	[ClaUsuarioMod] [int] NULL,
	[NombrePcMod] [varchar](64) NULL,
 CONSTRAINT [PK_TiTraObjetoColumna] PRIMARY KEY CLUSTERED 
(
	[IdObjeto] ASC,
	[Orden] ASC,
	[IdUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TiTraParametrosUsuario]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TiTraParametrosUsuario](
	[ClaUsuario] [int] NOT NULL,
	[IdMenuDefault] [int] NULL,
	[PosibilidadModificarMenus] [tinyint] NULL,
	[OrientacionMenus] [tinyint] NOT NULL,
	[BajaLogica] [tinyint] NULL,
	[FechaIns] [datetime] NULL,
	[ClaUsuarioIns] [int] NULL,
	[FechaUltimaMod] [datetime] NULL,
	[ClaUsuarioMod] [int] NULL,
	[NombrePcMod] [varchar](64) NULL,
 CONSTRAINT [PK_TiTraParametrosUsuario] PRIMARY KEY CLUSTERED 
(
	[ClaUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TiTraPermiso]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TiTraPermiso](
	[IdUsuario] [int] NOT NULL,
	[idObjeto] [int] NOT NULL,
	[FechaInicial] [datetime] NULL,
	[FechaFinal] [datetime] NULL,
	[Permiso1] [tinyint] NULL,
	[Permiso2] [tinyint] NULL,
	[Permiso3] [tinyint] NULL,
	[Permiso4] [tinyint] NULL,
	[Permiso5] [tinyint] NULL,
	[Permiso6] [tinyint] NULL,
	[Permiso7] [tinyint] NULL,
	[Permiso8] [tinyint] NULL,
	[FechaUltimaMod] [datetime] NOT NULL,
	[ClaUsuarioMod] [int] NULL,
	[NombrePcMod] [varchar](64) NULL,
 CONSTRAINT [PK_TiTraPermiso] PRIMARY KEY CLUSTERED 
(
	[IdUsuario] ASC,
	[idObjeto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TiTraPermisoUbicacion]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TiTraPermisoUbicacion](
	[IdUsuario] [int] NOT NULL,
	[IdObjeto] [int] NOT NULL,
	[ClaUbicacion] [int] NOT NULL,
	[FechaInicial] [datetime] NULL,
	[FechaFinal] [datetime] NULL,
	[Permiso1] [tinyint] NULL,
	[Permiso2] [tinyint] NULL,
	[Permiso3] [tinyint] NULL,
	[Permiso4] [tinyint] NULL,
	[Permiso5] [tinyint] NULL,
	[Permiso6] [tinyint] NULL,
	[Permiso7] [tinyint] NULL,
	[Permiso8] [tinyint] NULL,
	[FechaUltimaMod] [datetime] NOT NULL,
	[ClaUsuarioMod] [int] NULL,
	[NombrePcMod] [varchar](64) NULL,
 CONSTRAINT [PK_TiTraPermisoUbicacion] PRIMARY KEY CLUSTERED 
(
	[IdUsuario] ASC,
	[IdObjeto] ASC,
	[ClaUbicacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TiTraReferencia]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TiTraReferencia](
	[IdUsuario] [int] NOT NULL,
	[IdPerfilReferenciado] [int] NOT NULL,
	[FechaInicial] [datetime] NULL,
	[FechaFinal] [datetime] NULL,
	[ClaUbicacion] [int] NOT NULL,
	[Orden] [int] NOT NULL,
	[FechaUltimaMod] [datetime] NOT NULL CONSTRAINT [DF_TiTraReferencia_FechaUltimaMod]  DEFAULT (getdate()),
	[ClaUsuarioMod] [int] NULL,
	[NombrePcMod] [varchar](64) NULL,
 CONSTRAINT [PK_TiTraReferencia] PRIMARY KEY CLUSTERED 
(
	[IdUsuario] ASC,
	[IdPerfilReferenciado] ASC,
	[ClaUbicacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TiTraReglaColumna]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TiTraReglaColumna](
	[IdColumna] [int] NOT NULL,
	[IdCatalogo] [int] NOT NULL,
	[ClaTipoRegla] [int] NULL,
	[ClaTipoDato] [int] NULL,
	[RangoInicio] [sql_variant] NULL,
	[RangoInicioIncluyente] [tinyint] NULL,
	[RangoFin] [sql_variant] NULL,
	[RangoFinIncluyente] [tinyint] NULL,
	[BajaLogica] [int] NULL,
	[FechaBajaLogica] [datetime] NULL,
	[FechaIns] [datetime] NULL,
	[ClaUsuarioIns] [int] NULL,
	[FechaUltimaMod] [datetime] NULL,
	[ClaUsuarioMod] [int] NULL,
	[NombrePcMod] [varchar](64) NULL,
 CONSTRAINT [PK_TiTraReglaColumna] PRIMARY KEY CLUSTERED 
(
	[IdColumna] ASC,
	[IdCatalogo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TiTraRenglonValidacion]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TiTraRenglonValidacion](
	[IdCatalogo] [int] NOT NULL,
	[ClaTipoValidacion] [int] NOT NULL,
	[ClaUbicacion] [int] NOT NULL,
	[StoredProcedure] [varchar](50) NOT NULL,
	[Servername] [varchar](50) NOT NULL,
	[Db] [varchar](50) NOT NULL,
	[Owner] [varchar](50) NOT NULL,
	[LoginName] [varchar](50) NOT NULL,
	[Password] [varchar](50) NOT NULL,
	[BajaLogica] [int] NOT NULL,
	[FechaBajaLogica] [datetime] NULL,
	[FechaIns] [datetime] NOT NULL,
	[ClaUsuarioIns] [int] NULL,
	[FechaUltimaMod] [datetime] NOT NULL,
	[ClaUsuarioMod] [int] NULL,
	[NombrePcMod] [varchar](64) NULL,
 CONSTRAINT [PK_TiTraRenglonValidacion] PRIMARY KEY CLUSTERED 
(
	[IdCatalogo] ASC,
	[ClaTipoValidacion] ASC,
	[ClaUbicacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TiTraRenglonValidacionDet]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TiTraRenglonValidacionDet](
	[IdCatalogo] [int] NOT NULL,
	[IdColumna] [int] NOT NULL,
	[ClaTipoValidacion] [int] NOT NULL,
	[Orden] [int] NOT NULL,
	[BajaLogica] [int] NOT NULL,
	[FechaBajaLogica] [datetime] NULL,
	[FechaIns] [datetime] NOT NULL,
	[ClaUsuarioIns] [int] NULL,
	[FechaUltimaMod] [datetime] NOT NULL,
	[ClaUsuarioMod] [int] NULL,
	[NombrePcMod] [varchar](64) NULL,
 CONSTRAINT [PK_TiTraRenglonValidacionDet] PRIMARY KEY CLUSTERED 
(
	[IdCatalogo] ASC,
	[IdColumna] ASC,
	[ClaTipoValidacion] ASC,
	[Orden] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TiTraSesion]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TiTraSesion](
	[LoginUserName] [varchar](20) NULL,
	[NombrePcMod] [varchar](64) NULL,
	[IdSesion] [varbinary](50) NOT NULL,
	[DEAPrincipal] [varbinary](8000) NOT NULL,
	[FechaIns] [datetime] NULL,
 CONSTRAINT [PK_TiTraSesion] PRIMARY KEY CLUSTERED 
(
	[IdSesion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TiTraUbicacionCatalogo]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TiTraUbicacionCatalogo](
	[IdCatalogo] [int] NOT NULL,
	[ClaUbicacion] [int] NOT NULL,
	[ClaServidor] [int] NOT NULL,
	[ClaBd] [int] NOT NULL,
	[BajaLogica] [int] NULL,
	[FechaBajaLogica] [datetime] NULL,
	[FechaIns] [datetime] NULL,
	[ClaUsuarioIns] [int] NULL,
	[FechaUltimaMod] [datetime] NULL,
	[ClaUsuarioMod] [int] NULL,
	[NombrePcMod] [varchar](64) NULL,
 CONSTRAINT [PK_TiTraUbicacionCatalogo] PRIMARY KEY CLUSTERED 
(
	[IdCatalogo] ASC,
	[ClaUbicacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TiTraUsuario]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TiTraUsuario](
	[IdUsuario] [int] NOT NULL,
	[ClaEmpleado] [int] NULL,
	[NombrePerfil] [varchar](100) NULL,
	[NombreUsuario] [varchar](50) NULL,
	[ApellidoPaterno] [varchar](50) NULL,
	[ApellidoMaterno] [varchar](50) NULL,
	[FechaNacimiento] [datetime] NULL,
	[Email] [varchar](50) NULL,
	[EmailAlterno] [varchar](50) NULL,
	[LoginUserName] [varchar](20) NULL,
	[TelefonoCasa] [varchar](20) NULL,
	[TelefonoOficina] [varchar](20) NULL,
	[TelefonoCelular] [varchar](20) NULL,
	[Puesto] [varchar](50) NULL,
	[IdEmpleadoJefe] [int] NULL,
	[ClaCrc] [int] NULL,
	[Dominio] [varchar](50) NULL,
	[Bloqueado] [tinyint] NOT NULL CONSTRAINT [DF_TiTraUsuarioBbloqueado]  DEFAULT ((0)),
	[ClaUbicacionDefault] [int] NOT NULL,
	[Perfil] [tinyint] NOT NULL,
	[NombreModificable] [tinyint] NULL CONSTRAINT [DF_TiTraUsuarioNombreModificable]  DEFAULT ((1)),
	[AutenticacionActiveD] [tinyint] NOT NULL CONSTRAINT [Autenticacion]  DEFAULT ((0)),
	[IntentosFallidosPrincipal] [int] NULL,
	[FechaUltIntentoPrincipal] [datetime] NULL,
	[DispositivoMovil] [varchar](20) NULL,
	[BajaLogica] [int] NOT NULL CONSTRAINT [DF__TiTraUsuario__baja___0169315C]  DEFAULT ((0)),
	[FechaBajaLogica] [datetime] NULL,
	[FechaIns] [datetime] NOT NULL CONSTRAINT [DF_TiTraUsuario_FechaIns]  DEFAULT (getdate()),
	[ClaUsuarioIns] [int] NULL,
	[FechaUltimaMod] [datetime] NOT NULL CONSTRAINT [DF_TiTraUsuario_FechaUltimaMod]  DEFAULT (getdate()),
	[ClaUsuarioMod] [int] NULL,
	[NombrePcMod] [varchar](64) NULL,
	[ClaPuesto] [int] NULL,
	[BajaNomina] [int] NULL DEFAULT ((0)),
	[Rfc] [varchar](13) NULL,
 CONSTRAINT [PK_Usuario] PRIMARY KEY CLUSTERED 
(
	[IdUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TiTraUsuarioBitacora]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TiTraUsuarioBitacora](
	[IdUsuario] [int] NOT NULL,
	[ClaEmpleado] [int] NULL,
	[NombrePerfil] [varchar](100) NULL,
	[NombreUsuario] [varchar](50) NULL,
	[ApellidoPaterno] [varchar](50) NULL,
	[ApellidoMaterno] [varchar](50) NULL,
	[FechaNacimiento] [datetime] NULL,
	[Email] [varchar](50) NULL,
	[EmailAlterno] [varchar](50) NULL,
	[LoginUserName] [varchar](20) NULL,
	[TelefonoCasa] [varchar](20) NULL,
	[TelefonoOficina] [varchar](20) NULL,
	[TelefonoCelular] [varchar](20) NULL,
	[Puesto] [varchar](50) NULL,
	[IdEmpleadoJefe] [int] NULL,
	[ClaCrc] [int] NULL,
	[Dominio] [varchar](50) NULL,
	[Bloqueado] [tinyint] NOT NULL,
	[ClaUbicacionDefault] [int] NOT NULL,
	[Perfil] [tinyint] NOT NULL,
	[NombreModificable] [tinyint] NULL,
	[AutenticacionActiveD] [tinyint] NOT NULL,
	[IntentosFallidosPrincipal] [int] NULL,
	[FechaUltIntentoPrincipal] [datetime] NULL,
	[DispositivoMovil] [varchar](20) NULL,
	[BajaLogica] [int] NOT NULL,
	[FechaBajaLogica] [datetime] NULL,
	[FechaIns] [datetime] NOT NULL,
	[ClaUsuarioIns] [int] NULL,
	[FechaUltimaMod] [datetime] NOT NULL,
	[ClaUsuarioMod] [int] NULL,
	[NombrePcMod] [varchar](64) NULL,
	[ClaPuesto] [int] NULL,
	[BajaNomina] [int] NULL,
	[Rfc] [varchar](13) NULL,
	[Fecha_Ultimo_Cambio] [datetime] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TiTraUsuarioContrasena]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TiTraUsuarioContrasena](
	[IdUsuario] [int] NOT NULL,
	[Contrasena] [varbinary](50) NULL,
	[ContrasenaExtra1] [varbinary](50) NULL,
	[ContrasenaExtra2] [varbinary](50) NULL,
	[HuellaUtiliza] [tinyint] NOT NULL,
	[TokenUtiliza] [int] NULL,
	[BlackberryUtiliza] [int] NULL,
	[OpcionesMultiples] [int] NULL,
	[IntentosMaximosContrasena] [int] NULL,
	[IntentosMaximosHuella] [int] NULL,
	[TiempoExpiracion] [bigint] NULL,
	[CambiarContrasenaPrincipal] [tinyint] NULL,
	[HuellaDefault] [tinyint] NOT NULL,
	[HuellaObligatoria] [tinyint] NOT NULL,
	[InfoHuella1] [binary](400) NULL,
	[InfoHuella2] [binary](400) NULL,
	[IntentosFallidosExtra1] [int] NULL,
	[IntentosFallidosExtra2] [int] NULL,
	[IntentosFallidosHuella] [int] NULL,
	[FechaUltIntentoExtra1] [datetime] NULL,
	[FechaUltIntentoExtra2] [datetime] NULL,
	[FechaUltIntentoHuella] [datetime] NULL,
	[BloqueoExtra1] [tinyint] NOT NULL,
	[BloqueoExtra2] [tinyint] NOT NULL,
	[BloqueoExtraHuella] [tinyint] NOT NULL,
	[BajaLogica] [int] NOT NULL,
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL,
	[ClaUsuarioMod] [int] NULL,
	[NombrePcMod] [varchar](64) NULL,
 CONSTRAINT [PK_TiTraUsuarioContrasena] PRIMARY KEY CLUSTERED 
(
	[IdUsuario] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TiTraUsuarioContrasenaJsu]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TiTraUsuarioContrasenaJsu](
	[IdUsuario] [int] NOT NULL,
	[Contrasena] [varbinary](50) NULL,
	[ContrasenaExtra1] [varbinary](50) NULL,
	[ContrasenaExtra2] [varbinary](50) NULL,
	[HuellaUtiliza] [tinyint] NOT NULL,
	[TokenUtiliza] [int] NULL,
	[BlackberryUtiliza] [int] NULL,
	[OpcionesMultiples] [int] NULL,
	[IntentosMaximosContrasena] [int] NULL,
	[IntentosMaximosHuella] [int] NULL,
	[TiempoExpiracion] [bigint] NULL,
	[CambiarContrasenaPrincipal] [tinyint] NULL,
	[HuellaDefault] [tinyint] NOT NULL,
	[HuellaObligatoria] [tinyint] NOT NULL,
	[InfoHuella1] [binary](400) NULL,
	[InfoHuella2] [binary](400) NULL,
	[IntentosFallidosExtra1] [int] NULL,
	[IntentosFallidosExtra2] [int] NULL,
	[IntentosFallidosHuella] [int] NULL,
	[FechaUltIntentoExtra1] [datetime] NULL,
	[FechaUltIntentoExtra2] [datetime] NULL,
	[FechaUltIntentoHuella] [datetime] NULL,
	[BloqueoExtra1] [tinyint] NOT NULL,
	[BloqueoExtra2] [tinyint] NOT NULL,
	[BloqueoExtraHuella] [tinyint] NOT NULL,
	[BajaLogica] [int] NOT NULL,
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL,
	[ClaUsuarioMod] [int] NULL,
	[NombrePcMod] [varchar](64) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TiTraUsuarioDireccion]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TiTraUsuarioDireccion](
	[IdUsuarioDireccion] [int] NOT NULL,
	[IdUsuario] [int] NOT NULL,
	[Direccion] [varchar](17) NULL,
	[Mac] [tinyint] NULL,
	[BajaLogica] [int] NOT NULL,
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL,
	[ClaUsuarioMod] [int] NULL,
	[NombrePcMod] [varchar](64) NULL,
 CONSTRAINT [PK_TiTraUsuarioDireccion] PRIMARY KEY CLUSTERED 
(
	[IdUsuarioDireccion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TiTraUsuarioJsu]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TiTraUsuarioJsu](
	[IdUsuario] [int] NOT NULL,
	[ClaEmpleado] [int] NULL,
	[NombrePerfil] [varchar](100) NULL,
	[NombreUsuario] [varchar](50) NULL,
	[ApellidoPaterno] [varchar](50) NULL,
	[ApellidoMaterno] [varchar](50) NULL,
	[FechaNacimiento] [datetime] NULL,
	[Email] [varchar](50) NULL,
	[EmailAlterno] [varchar](50) NULL,
	[LoginUserName] [varchar](20) NULL,
	[TelefonoCasa] [varchar](20) NULL,
	[TelefonoOficina] [varchar](20) NULL,
	[TelefonoCelular] [varchar](20) NULL,
	[Puesto] [varchar](50) NULL,
	[IdEmpleadoJefe] [int] NULL,
	[ClaCrc] [int] NULL,
	[Dominio] [varchar](50) NULL,
	[Bloqueado] [tinyint] NOT NULL,
	[ClaUbicacionDefault] [int] NOT NULL,
	[Perfil] [tinyint] NOT NULL,
	[NombreModificable] [tinyint] NULL,
	[AutenticacionActiveD] [tinyint] NOT NULL,
	[IntentosFallidosPrincipal] [int] NULL,
	[FechaUltIntentoPrincipal] [datetime] NULL,
	[DispositivoMovil] [varchar](20) NULL,
	[BajaLogica] [int] NOT NULL,
	[FechaBajaLogica] [datetime] NULL,
	[FechaIns] [datetime] NOT NULL,
	[ClaUsuarioIns] [int] NULL,
	[FechaUltimaMod] [datetime] NOT NULL,
	[ClaUsuarioMod] [int] NULL,
	[NombrePcMod] [varchar](64) NULL,
	[ClaPuesto] [int] NULL,
	[BajaNomina] [int] NULL,
	[Rfc] [varchar](13) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TiTraUsuarioSistema]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TiTraUsuarioSistema](
	[IdUsuario] [int] NULL,
	[ClaSistema] [int] NULL,
	[ClaUbicacion] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[TiTraUsuarioUbicacion]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TiTraUsuarioUbicacion](
	[IdUsuario] [int] NOT NULL,
	[ClaUbicacion] [int] NOT NULL,
	[BajaLogica] [int] NOT NULL CONSTRAINT [DF__TiTraUsuarioUbicacion__baja___07220AB2]  DEFAULT ((0)),
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL CONSTRAINT [DF_TiTraUsuarioUbicacion_FechaUltimaMod]  DEFAULT (getdate()),
	[ClaUsuarioMod] [int] NULL,
	[NombrePcMod] [varchar](64) NULL,
 CONSTRAINT [PK_TiTraUsuarioUbicacion] PRIMARY KEY CLUSTERED 
(
	[IdUsuario] ASC,
	[ClaUbicacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TiTraUsuarioUbicacionJsu]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TiTraUsuarioUbicacionJsu](
	[IdUsuario] [int] NOT NULL,
	[ClaUbicacion] [int] NOT NULL,
	[BajaLogica] [int] NOT NULL,
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL,
	[ClaUsuarioMod] [int] NULL,
	[NombrePcMod] [varchar](64) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[TiTraValor]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[TiTraValor](
	[IdColumna] [int] NOT NULL,
	[IdCatalogo] [int] NOT NULL,
	[IdListaValor] [int] NOT NULL,
	[Valor] [varchar](max) NOT NULL,
	[BajaLogica] [int] NULL,
	[FechaBajaLogica] [datetime] NULL,
	[FechaIns] [datetime] NULL,
	[ClaUsuarioIns] [int] NULL,
	[FechaUltimaMod] [datetime] NULL,
	[ClaUsuarioMod] [int] NULL,
	[NombrePcMod] [varchar](64) NULL,
 CONSTRAINT [PK_TiTraValor] PRIMARY KEY CLUSTERED 
(
	[IdColumna] ASC,
	[IdCatalogo] ASC,
	[IdListaValor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[VtaCatAgente]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[VtaCatAgente](
	[ClaAgente] [int] NOT NULL,
	[ClaAgenteLegacy] [int] NULL,
	[IdUsuario] [int] NULL,
	[NomAgente] [varchar](50) NOT NULL,
	[ApellidoPaterno] [varchar](50) NULL,
	[ApellidoMaterno] [varchar](50) NULL,
	[Email] [varchar](250) NULL,
	[EsComisionista] [tinyint] NULL,
	[EsPagoPorProveedor] [tinyint] NULL,
	[NSS] [varchar](11) NULL,
	[ClaCup] [int] NULL,
	[ClaCuentaCUP] [int] NULL,
	[FechaIns] [datetime] NOT NULL,
	[TelefonoCasa] [varchar](20) NULL,
	[TelefonoCelular] [varchar](20) NULL,
	[Orden] [int] NULL,
	[ClaTipoAgente] [int] NULL,
	[BajaLogica] [tinyint] NOT NULL DEFAULT ((0)),
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL DEFAULT (getdate()),
	[NombrePcMod] [varchar](64) NOT NULL DEFAULT (host_name()),
	[ClaUsuarioMod] [int] NOT NULL,
 CONSTRAINT [PK_VtaCatAgente] PRIMARY KEY CLUSTERED 
(
	[ClaAgente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[VtaCatCiudad]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[VtaCatCiudad](
	[ClaCiudad] [int] NOT NULL,
	[ClaEstado] [int] NOT NULL,
	[NombreCiudad] [varchar](30) NULL,
	[Ficticio] [int] NOT NULL CONSTRAINT [DF_VtaCatCiudad_Ficticio]  DEFAULT ((0)),
	[BajaLogica] [int] NOT NULL CONSTRAINT [DF_VtaCatCiudad_BajaLogica]  DEFAULT ((0)),
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL CONSTRAINT [DF_VtaCatCiudad_FechaUltimaMod]  DEFAULT (getdate()),
	[FechaIns] [datetime] NULL,
	[PorcentajeIva] [numeric](5, 2) NULL,
	[NombreEstado] [varchar](40) NULL,
	[ClaPais] [int] NULL,
	[NombrePais] [varchar](50) NULL,
	[ClaRegion] [int] NULL,
 CONSTRAINT [PK_VtaCatCiudad_1] PRIMARY KEY CLUSTERED 
(
	[ClaCiudad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[VtaCatCliente]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[VtaCatCliente](
	[ClaCliente] [int] NOT NULL,
	[ClaTipoCliente] [int] NOT NULL,
	[ClaClasifCliente] [int] NOT NULL,
	[ClaCiudad] [int] NOT NULL,
	[ClaEmpresa] [int] NULL,
	[NombreCliente] [varchar](60) NULL,
	[Telefono] [varchar](20) NULL,
	[Colonia] [varchar](50) NULL,
	[ZonaPostal] [varchar](10) NULL,
	[Direccion] [varchar](50) NULL,
	[Rfc] [varchar](20) NULL,
	[BajaLogica] [int] NOT NULL CONSTRAINT [DF_VtaCatCliente_BajaLogica]  DEFAULT ((0)),
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL CONSTRAINT [DF_VtaCatCliente_FechaUltimaMod]  DEFAULT (getdate()),
	[FechaIns] [datetime] NULL,
	[ClaOrganizacion] [int] NULL,
	[ClaClasifClienteV] [int] NULL,
	[ClaGiroComercial] [int] NULL,
	[ClaClienteAgrupador] [int] NULL,
	[NumeroCedulaFiscal] [varchar](20) NULL,
	[PlazoVarillaAlambron] [int] NULL,
	[PorcentajeIva] [float] NULL,
	[ClaCargoFinanciero] [float] NULL,
	[FechaAltaLogica] [datetime] NULL,
	[EstatusLegal] [int] NULL,
	[FechaUltimaNegociacion] [datetime] NULL,
	[FechaAltaReal] [datetime] NULL,
	[FechaLimiteCreditoActual] [datetime] NULL,
	[ImporteLimiteCreditoActual] [float] NULL,
	[PlazoMallasAlambres] [int] NULL,
	[ClaMoneda] [int] NULL,
	[TipoPersona] [int] NULL,
	[TipoCliente] [int] NULL,
	[ClaGiroIndustria] [int] NULL,
 CONSTRAINT [PK_VtaCatCliente] PRIMARY KEY CLUSTERED 
(
	[ClaCliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[VtaCatClienteCuentaCu]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[VtaCatClienteCuentaCu](
	[ClaClienteCta] [int] NOT NULL,
	[ClaClienteUnico] [int] NOT NULL,
	[NombreClienteUnico] [varchar](150) NOT NULL,
	[Calle] [varchar](60) NULL,
	[NumExterior] [varchar](15) NULL,
	[NumInterior] [varchar](15) NULL,
	[Colonia] [varchar](50) NULL,
	[ClaCiudad] [int] NOT NULL,
	[CodigoPostal] [varchar](15) NULL,
	[Telefono] [varchar](20) NULL,
	[Fax] [varchar](20) NULL,
	[NomPropietario] [varchar](60) NULL,
	[Email] [varchar](50) NULL,
	[EmailPagos] [varchar](50) NULL,
	[Contacto] [varchar](60) NULL,
	[ContactoPago] [varchar](60) NULL,
	[ContactoPago2] [varchar](60) NULL,
	[TipoFax] [smallint] NULL,
	[FaxPagos] [varchar](20) NULL,
	[FechaIns] [datetime] NOT NULL,
	[FechaBajaLogica] [datetime] NULL,
	[BajaLogica] [smallint] NOT NULL,
	[ClaUsuario] [int] NULL,
	[ClaAgente] [int] NOT NULL,
	[RefBancaria] [varchar](16) NULL,
	[PctParcialidad] [float] NULL,
	[TonelajeMax] [float] NULL,
	[TasaIva] [float] NOT NULL,
	[EsFacturarDolares] [tinyint] NOT NULL,
	[EsPagamosComision] [tinyint] NOT NULL,
	[EsCancFabEmbarcada] [tinyint] NOT NULL,
	[EsSurtirSinExcederse] [tinyint] NOT NULL,
	[ClaGiro] [int] NULL,
	[ClaGiroComercial] [int] NULL,
	[ClaMedioEmbarque] [int] NULL,
	[ClaClasifCliente] [int] NULL,
	[ClaClasifClienteV] [int] NULL,
	[ClaMoneda] [int] NULL,
	[TipoTopeListapre] [smallint] NULL,
	[CasadoCia] [varchar](3) NULL,
	[ProductosFabrica] [varchar](50) NULL,
	[NotasEmbarque] [varchar](250) NULL,
	[Comentarios] [varchar](250) NULL,
	[ClaCargoFinanciero] [smallint] NULL,
	[ClaTipoGarantia] [int] NULL,
	[ObsGarantias] [varchar](250) NULL,
	[ImpCapContable] [float] NULL,
	[NomEmpFiliales] [varchar](250) NULL,
	[FechaUltNegIntmor] [datetime] NULL,
	[EsAutXdeptoCre] [tinyint] NOT NULL,
	[EstatusLegal] [tinyint] NOT NULL,
	[EstatusBloqueo] [tinyint] NOT NULL,
	[NomQuienBloqueo] [varchar](30) NULL,
	[FechaLimcreAct] [datetime] NULL,
	[ImpLimcreActual] [float] NULL,
	[FechaLimcreAnt] [datetime] NULL,
	[ImpLimcreAnt] [float] NULL,
	[EsLigarLimcre] [tinyint] NOT NULL,
	[EsLimcreIndividual] [tinyint] NOT NULL,
	[PlazoMallasAlambres] [int] NULL,
	[PlazoVarillaAlambron] [int] NULL,
	[FechaUltimaMod] [datetime] NULL,
	[EsCertificadoExcepcion] [tinyint] NOT NULL,
	[FechaVenceCertificado] [datetime] NULL,
	[EsCargarImpuestosVta] [tinyint] NOT NULL,
	[EsEnviarDocFiscalXMail] [tinyint] NOT NULL,
 CONSTRAINT [PKVtaCatClienteCuentaCu] PRIMARY KEY CLUSTERED 
(
	[ClaClienteCta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[VtaCatClienteFilial]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[VtaCatClienteFilial](
	[ClaUbicacionOrigen] [int] NOT NULL,
	[ClaUbicacionDestino] [int] NOT NULL,
	[ClaEmpresaOrigen] [int] NULL,
	[ClaEmpresaDestino] [int] NULL,
	[ClaClienteFilial] [int] NULL,
	[ClaListaPrecio] [bigint] NULL,
	[ClaConsignado] [int] NULL,
	[FechaUltimaMod] [datetime] NULL,
 CONSTRAINT [PK_VtaCatClienteFilial] PRIMARY KEY CLUSTERED 
(
	[ClaUbicacionOrigen] ASC,
	[ClaUbicacionDestino] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[VtaCatClienteUnicoCu]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[VtaCatClienteUnicoCu](
	[ClaClienteUnico] [int] NOT NULL,
	[RegimenFiscal] [smallint] NOT NULL,
	[RegimenFiscalTipo] [smallint] NOT NULL,
	[TipoVentaEnajenacion] [smallint] NOT NULL,
	[Rfc] [varchar](50) NOT NULL,
	[Curp] [varchar](18) NULL,
	[NombreRazonSocial] [varchar](150) NOT NULL,
	[ApellidoPaterno] [varchar](50) NULL,
	[ApellidoMaterno] [varchar](50) NULL,
	[FechaIns] [datetime] NOT NULL,
	[Calle] [varchar](60) NULL,
	[NumExterior] [varchar](15) NULL,
	[NumInterior] [varchar](15) NULL,
	[ClaPais] [int] NULL,
	[ClaEstado] [int] NULL,
	[ClaMunicipio] [int] NULL,
	[ClaColonia] [int] NULL,
	[CodigoPostal] [varchar](15) NULL,
	[Lada] [varchar](5) NULL,
	[Telefono] [varchar](20) NULL,
	[Fax] [varchar](20) NULL,
	[Email] [varchar](50) NULL,
	[CuentaBanco] [varchar](16) NULL,
	[BajaLogica] [smallint] NOT NULL,
	[FechaBajaLogica] [datetime] NULL,
	[EsRfcSolicitado] [tinyint] NOT NULL,
	[FechaSolicitudRfc] [datetime] NULL,
	[EsDocumentoFiscalLista] [tinyint] NOT NULL,
	[FechaDocumentoFiscal] [datetime] NULL,
	[ObservacionDocumentoFiscal] [varchar](250) NULL,
	[FechaUltimaMod] [datetime] NULL,
 CONSTRAINT [PK_VtaCatClienteUnicoCu] PRIMARY KEY CLUSTERED 
(
	[ClaClienteUnico] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[VtaCatConsignado]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[VtaCatConsignado](
	[ClaConsignado] [int] NOT NULL,
	[NombreConsignado] [varchar](50) NULL,
	[ClaCiudad] [int] NULL,
	[Direccion] [varchar](50) NULL,
	[Colonia] [varchar](50) NULL,
	[ZonaPostal] [varchar](50) NULL,
	[Telefono] [varchar](20) NULL,
	[BajaLogica] [int] NOT NULL CONSTRAINT [DF_VtaCatConsignado_BajaLogica]  DEFAULT ((0)),
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL CONSTRAINT [DF_VtaCatConsignado_FechaUltimaMod]  DEFAULT (getdate()),
	[FechaIns] [datetime] NULL,
 CONSTRAINT [PK_VtaCatConsignado] PRIMARY KEY CLUSTERED 
(
	[ClaConsignado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[VtaCatEstado]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[VtaCatEstado](
	[ClaEstado] [int] NOT NULL,
	[ClaPais] [int] NOT NULL,
	[NombreEstado] [varchar](30) NULL,
	[Ficticio] [int] NOT NULL CONSTRAINT [DF_VtaCatEstado_Ficticio]  DEFAULT ((0)),
	[BajaLogica] [int] NOT NULL CONSTRAINT [DF_VtaCatEstado_BajaLogica]  DEFAULT ((0)),
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL CONSTRAINT [DF_VtaCatEstado_FechaUltimaMod]  DEFAULT (getdate()),
	[FechaIns] [datetime] NULL,
 CONSTRAINT [PK_VtaCatEstado_1] PRIMARY KEY CLUSTERED 
(
	[ClaEstado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[VtaCatEstatusFabricacion]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[VtaCatEstatusFabricacion](
	[ClaEstatus] [int] NOT NULL,
	[Descripcion] [varchar](30) NULL,
	[DescripcionIngles] [varchar](30) NULL,
	[BajaLogica] [int] NOT NULL DEFAULT ((0)),
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL DEFAULT (getdate()),
	[NombrePcMod] [varchar](64) NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[VtaCatFormaPago]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[VtaCatFormaPago](
	[ClaFormaPago] [int] NOT NULL,
	[NombreFormaPago] [varchar](30) NULL,
	[BajaLogica] [int] NOT NULL,
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL,
	[FechaIns] [datetime] NULL,
	[DiasPlazoNormal] [int] NULL,
	[EsContado] [smallint] NULL,
	[TipoEstadistica] [smallint] NULL,
	[EsCartaCredito] [smallint] NULL,
	[EsUtilizaFecha] [smallint] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[VtaCatGiroComercial]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[VtaCatGiroComercial](
	[ClaGiroComercial] [int] NOT NULL,
	[NombreGiroComercial] [varchar](40) NOT NULL,
	[ClaRiesgo] [int] NULL,
	[BajaLogica] [int] NOT NULL DEFAULT ((0)),
	[FechaBajaLogica] [datetime] NULL,
	[FechaIns] [datetime] NOT NULL DEFAULT (getdate()),
	[ClaUsuarioIns] [int] NULL DEFAULT ((1)),
	[FechaUltimaMod] [datetime] NULL DEFAULT (getdate()),
	[ClaUsuarioMod] [int] NULL DEFAULT (user_id()),
	[NombrePCMod] [varchar](64) NOT NULL DEFAULT (host_name()),
 CONSTRAINT [PK_VtaCatGiroComercial] PRIMARY KEY CLUSTERED 
(
	[ClaGiroComercial] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[VtaCatGrupoEstadistico]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[VtaCatGrupoEstadistico](
	[ClaGrupoEstadistico] [int] NOT NULL,
	[NivelActual] [int] NOT NULL,
	[NombreGrupoEstadistico] [varchar](30) NULL,
	[Nivel01] [int] NULL,
	[Nivel02] [int] NULL,
	[Nivel03] [int] NULL,
	[Nivel04] [int] NULL,
	[BajaLogica] [int] NOT NULL DEFAULT ((0)),
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL DEFAULT (getdate()),
	[NombrePcMod] [varchar](64) NULL,
	[NombreGrupoEstadisticoCorto] [varchar](15) NULL,
	[NombreGrupoEstadisticoIngles] [varchar](30) NULL,
	[ClaTipoProducto] [int] NULL,
	[ClaTipoEstadistico] [int] NULL,
	[ClaMargenVenta] [int] NULL,
 CONSTRAINT [PK_VtaCatGrupoEstadistico_1] PRIMARY KEY CLUSTERED 
(
	[ClaGrupoEstadistico] ASC,
	[NivelActual] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[VtaCatOrganizacion]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[VtaCatOrganizacion](
	[ClaOrganizacion] [int] NOT NULL,
	[NombreOrganizacion] [varchar](30) NULL,
	[Nivel] [int] NULL,
	[ClaDireccion] [int] NULL,
	[ClaSubDireccion] [int] NULL,
	[ClaZona] [int] NULL,
	[ClaAgente] [int] NULL,
	[ClaEmpresa] [int] NULL,
	[ClaUbicacion] [int] NULL,
	[ClaGrupoRegional] [int] NULL,
	[BajaLogica] [int] NOT NULL CONSTRAINT [DF_VtaCatOrganizacion_BajaLogica]  DEFAULT ((0)),
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL CONSTRAINT [DF_VtaCatOrganizacion_FechaUltimaMod]  DEFAULT (getdate()),
	[FechaIns] [datetime] NULL,
	[NombreTitular] [varchar](50) NULL,
	[ClaGrupo] [int] NULL,
	[ClaPais] [int] NULL,
	[IdOrden] [int] NULL,
	[ClaAgrupador] [int] NULL,
	[ClaAgenteAgrupador] [int] NULL,
	[NivelActual] [int] NOT NULL CONSTRAINT [DF_VtaCatOrganizacion_NivelActual]  DEFAULT ((0)),
	[Email] [varchar](250) NULL,
 CONSTRAINT [PK_VtaCatOrganizacion] PRIMARY KEY CLUSTERED 
(
	[ClaOrganizacion] ASC,
	[NivelActual] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[VtaCatPais]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[VtaCatPais](
	[ClaPais] [int] NOT NULL,
	[NombrePais] [varchar](50) NULL,
	[Ficticio] [int] NOT NULL CONSTRAINT [DF_VtaCatPais_Ficticio]  DEFAULT ((0)),
	[BajaLogica] [int] NOT NULL CONSTRAINT [DF_VtaCatPais_BajaLogica]  DEFAULT ((0)),
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL CONSTRAINT [DF_VtaCatPais_FechaUltimaMod]  DEFAULT (getdate()),
	[FechaIns] [datetime] NULL,
	[ClaMoneda] [int] NULL,
	[ClaIdioma] [int] NOT NULL CONSTRAINT [DF_VtaCatPais_ClaIdioma]  DEFAULT ((1)),
 CONSTRAINT [PK_VtaCatPais] PRIMARY KEY CLUSTERED 
(
	[ClaPais] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[VtaCatProductoFactura]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[VtaCatProductoFactura](
	[ClaProducto] [int] NOT NULL,
	[ClaIdioma] [int] NOT NULL,
	[ClaUnidadVenta] [int] NULL,
	[NombreProductoFactura] [varchar](22) NULL,
	[Calibre] [varchar](6) NULL,
	[Disenio] [varchar](10) NULL,
	[Alto] [varchar](5) NULL,
	[Largo] [varchar](5) NULL,
	[FechaUltimaMod] [datetime] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[VtaCatTipoMercado]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[VtaCatTipoMercado](
	[ClaTipoMercado] [int] NOT NULL,
	[NombreTipoMercado] [varchar](35) NULL,
	[BajaLogica] [int] NOT NULL CONSTRAINT [DF_VtaCatTipoMercado_BajaLogica_1]  DEFAULT ((0)),
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL CONSTRAINT [DF_VtaCatTipoMercado_FechaUltimaMod]  DEFAULT (getdate()),
	[FechaIns] [datetime] NULL CONSTRAINT [DF_VtaCatTipoMercado_FechaIns]  DEFAULT (getdate()),
 CONSTRAINT [PK_VtaCatTipoMercado_1] PRIMARY KEY CLUSTERED 
(
	[ClaTipoMercado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[VtaCatUnidadVenta]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[VtaCatUnidadVenta](
	[ClaUnidadVenta] [int] NOT NULL,
	[NombreUnidadVenta] [varchar](30) NOT NULL,
	[NombreUnidadEdi] [varchar](3) NULL,
	[FechaUltimaMod] [datetime] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [DTSch].[DtCatMenu]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [DTSch].[DtCatMenu](
	[ClaMenu] [int] NOT NULL,
	[ClaOpcion] [int] NOT NULL,
	[ClaMenuPadre] [int] NOT NULL,
	[EtiquetaDefault] [varchar](150) NOT NULL,
	[TipoElemento] [smallint] NULL,
	[Orden] [smallint] NULL,
	[Estilo] [varchar](50) NULL,
	[EsMovil] [int] NULL,
	[EsMultiUbicacion] [int] NULL,
	[BajaLogica] [int] NOT NULL DEFAULT ((0)),
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL DEFAULT (getdate()),
	[ClaUsuarioMod] [int] NOT NULL DEFAULT ((0)),
	[NombrePcMod] [varchar](64) NOT NULL DEFAULT (host_name()),
	[CheckSec] [int] NULL,
 CONSTRAINT [PK_DtCatMenu] PRIMARY KEY CLUSTERED 
(
	[ClaMenu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [DTSch].[DtCatMenuLenguaje]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [DTSch].[DtCatMenuLenguaje](
	[ClaMenu] [int] NOT NULL,
	[Cultura] [varchar](5) NOT NULL,
	[Etiqueta] [varchar](250) NOT NULL,
	[BajaLogica] [int] NOT NULL DEFAULT ((0)),
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL DEFAULT (getdate()),
	[ClaUsuarioMod] [int] NOT NULL DEFAULT ((0)),
	[NombrePcMod] [varchar](64) NOT NULL DEFAULT (host_name()),
 CONSTRAINT [PK_DtCatMenuLenguaje] PRIMARY KEY CLUSTERED 
(
	[ClaMenu] ASC,
	[Cultura] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [DTSch].[DtCatOpcion]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [DTSch].[DtCatOpcion](
	[ClaOpcion] [int] NOT NULL,
	[ClaAplicacion] [varchar](50) NOT NULL,
	[PathRelativo] [varchar](250) NOT NULL,
	[Parametros] [varchar](250) NULL,
	[ClaObjetoSeg] [int] NULL,
	[Imagen] [varbinary](max) NULL,
	[ExtImagen] [varchar](4) NULL,
	[Comentarios] [varchar](150) NULL,
	[BajaLogica] [int] NOT NULL DEFAULT ((0)),
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL DEFAULT (getdate()),
	[ClaUsuarioMod] [int] NOT NULL DEFAULT ((0)),
	[NombrePcMod] [varchar](64) NOT NULL DEFAULT (host_name()),
	[ClaUbicacion] [int] NULL,
 CONSTRAINT [PK_MenuOpciones] PRIMARY KEY CLUSTERED 
(
	[ClaOpcion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [DTSch].[DtRelMenuPerfil]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [DTSch].[DtRelMenuPerfil](
	[ClaAplicacion] [varchar](50) NOT NULL,
	[ClaAppOrden] [smallint] NOT NULL,
	[ClaUbicacion] [int] NOT NULL,
	[ClaPerfil] [int] NOT NULL,
	[ClaMenu] [int] NOT NULL,
	[Tooltip] [varchar](250) NULL,
	[IconoId] [int] NULL,
	[BajaLogica] [int] NOT NULL DEFAULT ((0)),
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL DEFAULT (getdate()),
	[ClaUsuarioMod] [int] NOT NULL DEFAULT ((0)),
	[NombrePcMod] [varchar](64) NOT NULL DEFAULT (host_name()),
 CONSTRAINT [PK_DtRelMenuPerfil] PRIMARY KEY CLUSTERED 
(
	[ClaAplicacion] ASC,
	[ClaAppOrden] ASC,
	[ClaUbicacion] ASC,
	[ClaPerfil] ASC,
	[ClaMenu] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  View [dbo].[ConCatTipoGastoVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	 CREATE VIEW [dbo].[ConCatTipoGastoVw]  
AS  
SELECT     ClaEmpresa, ClaTipoGasto, NombreTipoGasto, EsAutorizado, BajaLogica, FechaBajaLogica, FechaUltimaMod, NombrePcMod,   
                      ClaUsuarioMod, FechaIns, ClaUsuarioIns  
FROM         dbo.ConCatTipoGasto  
  
	 

GO
/****** Object:  View [dbo].[ConCatDireccionCrcGastoVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	 CREATE VIEW [dbo].[ConCatDireccionCrcGastoVw]  
AS  
SELECT     ClaEmpresa, ClaDireccion, ClaClasificacionCuenta, ClaCrc, ClaTipoGasto, ClaCuenta3, ClaCuenta4, EsAutorizado, BajaLogica, FechaBajaLogica,   
                      FechaUltimaMod, NombrePcMod, ClaUsuarioMod, FechaIns, ClaUsuarioIns  
FROM         dbo.ConCatDireccionCrcGasto  
	 

GO
/****** Object:  View [dbo].[FfccRelDirCrcTipoGastoVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[FfccRelDirCrcTipoGastoVw]  
AS  
SELECT  DCG.ClaDireccion, DCG.ClaCrc AS ClaCrc, CONVERT(INT, DCG.ClaTipoGasto) AS ClaTipoGasto, CTG.NombreTipoGasto,  
  CTG.BajaLogica, CTG.FechaBajaLogica  
FROM    TiCatalogo.dbo.ConCatDireccionCrcGastoVw AS DCG INNER JOIN  
        TiCatalogo.dbo.ConCatTipoGastoVw AS CTG ON DCG.ClaEmpresa = CTG.ClaEmpresa AND DCG.ClaTipoGasto = CTG.ClaTipoGasto  
WHERE ISNULL(CTG.EsAutorizado,0) = 1  
AND ISNULL(DCG.ClaClasificacionCuenta,0) = 0  
AND DCG.BajaLogica=0
GROUP BY DCG.ClaDireccion, DCG.ClaCrc, DCG.ClaTipoGasto, CTG.NombreTipoGasto, CTG.BajaLogica, CTG.FechaBajaLogica  
GO
/****** Object:  View [dbo].[ArtCatArtSustitutoOrigVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[ArtCatArtSustitutoOrigVw]
AS
 
 SELECT ClaUbicacion,
		ClaArticuloOriginal,
		ClaArticuloNuevo,		
		FechaInicioCambio,
		FechaFinalCambio,
		FactorConversion,
		ClaUnidadNueva,
		ClaUnidadOriginal,
		FechaUltimaMod,
		NombrePcMod,
		ClaUsuarioMod
FROM dbo.ArtCatArtSustitutoOrig	

GO
/****** Object:  View [dbo].[ArtCatArticuloVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


 
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--*----
--*Objeto:		Vista: ArtCatArticuloVw
--*Autor:		TiGeneraScriptVistaProc - DCSHGARCIALAP
--*Fecha:		Feb 16 2010  8:12AM
--*Objetivo:	Generar la vista para tabla ArtCatArticulo
--*Entrada:
--*Salida:
--*Precondiciones:
--*Revisiones:
--*Modificacion: FP 2540  
--*Autor: Eunice Castañeda 
--*Se agrega el campo ClaClienteArt para que muestre el Cliente asignado al artículo
--*----	

CREATE VIEW [dbo].[ArtCatArticuloVw]
AS
SELECT	ClaTipoInventario,
		ClaArticulo,
		ClaveArticulo,
		CodigoArticulo,
		NomArticulo,
		NomArticuloIngles,
		NomArticuloOtroIdioma,
		ClaClasifGeneral,
		ClaFamilia,
		ClaSubfamilia,
		ClaPlantilla,
		ClaMarca,
		ClaTipoArticulo,
		ClaGpoProcesoProd,
		ClaGpoCosteo,
		ClaGpoEstadistico,
		ClaUNSPC1,
		ClaUNSPC2,
		ClaUNSPC3,
		ClaUNSPC4,
		ClaUnidadBase,
		ClaUnidadProd,
		FactorConversion,
		PesoTeoricoKgs,
		Comentarios,
		ClaEstatusVobo,
		FechaIns,
		ClaUsuarioIns,
		BajaLogica,
		FechaBajaLogica,
		FechaUltimaMod,
		NombrePcMod,
		ClaUsuarioMod,
		ClaPrefijoClave,
		ClaClaveCruda,
		ClaArticuloInsumo,
		Referencia,
		ClaEmpaqueInd,
		ClaEmpaqueAgrup,
		ClaUbicacionIns,
		ClaGpoEmpaque,
		EsObsoleto,
		EsExcentoIVA,
		VolumenAlto,
		VolumenAncho,
		VolumenLargo,
		ClaUnidadVolumen,
		ClaComplejidad,
		EsHomologado,
		PesoTeoricoKgsMin,
		PesoTeoricoKgsMax,
		ClaEmpresaCodigoBar,
		FactorCubicaje,
		ClaProteccionEmpaque,
		EsDisponibleCopia,
		EsDisponibleUso,
		EsCambioHistorial,
		ClaveArticuloCorta = CASE ClaTipoInventario       
		   WHEN 1 THEN NULL      
		   WHEN 2 THEN CONVERT(VARCHAR,(ClaveArticulo - FLOOR(CAST(ClaveArticulo AS BIGINT) / 10000000000) * 10000000000))  
		   ELSE NULL   
		   END  ,
		ClaAgrupador,
		ClaClienteArt  = isnull(ClaClienteArt , 0 ) 
FROM	dbo.ArtCatArticulo WITH (NOLOCK)

-------------
--*** FIN ***
------------- 




GO
/****** Object:  View [dbo].[ArtCatArticuloSustitutoVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE VIEW [dbo].[ArtCatArticuloSustitutoVw]
AS
 
 SELECT		AAS.ClaUbicacion,
			AAS.ClaArticuloOriginal,
			AAS.ClaArticuloNuevo,
			ClaveArticuloOriginal  = ORI.ClaveArticuloCorta,
			DescripcionArtOriginal = ORI.NomArticulo,
			ClaveArticuloNuevo     = NUE.ClaveArticuloCorta,
			DescripcionArtNuevo    = NUE.NomArticulo,
			AAS.FechaInicioCambio,
			AAS.FechaFinalCambio,
			AAS.FactorConversion,
			AAS.ClaUnidadNueva,
			AAS.ClaUnidadOriginal,
			AAS.FechaUltimaMod,
			AAS.NombrePcMod,
			AAS.ClaUsuarioMod
FROM	    dbo.ArtCatArtSustitutoOrigVw	AAS
INNER JOIN  dbo.ArtCatArticuloVw			ORI ON (AAS.ClaArticuloOriginal = ORI.ClaArticulo AND ORI.ClaTipoInventario = 2)	
INNER JOIN  dbo.ArtCatArticuloVw			NUE ON (AAS.ClaArticuloNuevo	= NUE.ClaArticulo AND NUE.ClaTipoInventario = 2)	
   


GO
/****** Object:  View [dbo].[FfccCatTipoMaterial]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[FfccCatTipoMaterial] AS  
SELECT ClaTipoMaterial
, NombreTipoMaterial
, NombreTipoMaterialEmpresa
, STCC
, EsPeligroso
, EsActivo
, BajaLogica
, FechaBajaLogica
, FechaUltimaMod
, NombrePcMod
, ClaUsuarioMod
, ClaTipoGastoFamilia
 FROM FFCC.FFCCSch.FFCCCatTipoMaterial WITH(NOLOCK)


GO
/****** Object:  View [dbo].[FfccCatTipoMaterialVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--*----
CREATE VIEW [dbo].[FfccCatTipoMaterialVw]  AS  
	SELECT	ClaTipoMaterial, 
		NombreTipoMaterial, 
		NombreTipoMaterialEmpresa, 
		STCC, 
		EsPeligroso, 
		ClaTipoGastoFamilia,
		EsActivo, 
		BajaLogica, 
		FechaBajaLogica, 
		FechaUltimaMod, 
		NombrePcMod, 
		ClaUsuarioMod 
	FROM TiCatalogo.dbo.FfccCatTipoMaterial 


GO
/****** Object:  View [dbo].[ConCatBeneficiarioVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE View [dbo].[ConCatBeneficiarioVw]
AS
SELECT	ClaEmpresa,
		ClaBeneficiario,
		ClaCUP,
		ClaPolizaGrupo,
		ClaTipoBeneficiario,
		NumeroBeneficiario,
		NombreBeneficiario,
		ClaEstatusBeneficiario,
		BajaLogica,
		FechaBajaLogica,
		FechaUltimaMod,
		NombrePcMod,
		ClaUsuarioMod,
		FechaIns,
		ClaUsuarioIns
FROM	ConCatBeneficiario

GO
/****** Object:  View [dbo].[FleCatBeneficiarioFletesConCupVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[FleCatBeneficiarioFletesConCupVw]
AS

SELECT 
                 T.ClaUbicacion,
                T.ClaTransportista,
                T.ClaBeneficiario,
                T.NumTransportista,
                T.Nombre,
                T.Abreviacion,
                T.CobroPrimaCombustible,
                T.PorcCobroPrimaCombustible,
                T.EsNacional,
                T.PlazoParaPago,
                T.ClaGrupoTransporte,
                T.PorcDPPP,
                T.PorcIVA,
                T.PorcRetencion,
                T.DescuentoProntoPago,
                T.Direccion,
                T.ClaCiudad,
                T.ClaEstado,
                T.ClaPais,
                T.Telefono1,
                T.Telefono2,
                T.ClaCUP,
		T.ClaCuentaCUP,
                T.FechaUltimaMod,
                T.NombrePcMod,
                T.ClaUsuarioMod,
                T.BajaLogica,
                T.FechaBajaLogica
FROM FleCatTransportista T  
left JOIN ConCatBeneficiarioVw BF ON T.ClaBeneficiario = BF.ClaBeneficiario



GO
/****** Object:  View [dbo].[ConCatMunicipioConVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[ConCatMunicipioConVw]
AS
SELECT      ClaPaisCon, 
			ClaEstadoCon, 
			ClaMunicipioCon, 
			NombreMunicipioCon, 
			BajaLogica, 
			FechaBajaLogica, 
			FechaUltimaMod, 
			NombrePcMod, 
			ClaUsuarioMod, 
			FechaIns, 
			ClaUsuarioIns
FROM        ConCatMunicipioCon


GO
/****** Object:  View [dbo].[ConCatEstadoConVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[ConCatEstadoConVw]
AS
SELECT      ClaPaisCon, 
			ClaEstadoCon, 
			NombreEstadoCon, 
			BajaLogica, 
			FechaBajaLogica, 
			FechaUltimaMod, 
			NombrePcMod, 
			ClaUsuarioMod, 
			FechaIns, 
			ClaUsuarioIns
FROM        ConCatEstadoCon


GO
/****** Object:  View [dbo].[ConCatColoniaConVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE view [dbo].[ConCatColoniaConVw] as
SELECT     ClaPaisCon, 
ClaEstadoCon, 
ClaMunicipioCon, 
ClaColoniaCon, 
NombreColoniaCon, 
CodigoPostal, 
BajaLogica, 
FechaBajaLogica, 
FechaUltimaMod, 
NombrePcMod, 
ClaUsuarioMod, 
FechaIns, 
ClaUsuarioIns
FROM         dbo.ConCatColoniaCon WITH (NOLOCK)


GO
/****** Object:  View [dbo].[CmpCatProveedorContactoVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CmpCatProveedorContactoVw]    
AS    
SELECT [IdContacto]    
      ,[ClaUbicacion]    
      ,[ClaCUP]    
      ,[ClaProveedor]    
      ,[ClaTipoProveedor]    
      ,[NomContacto]    
      ,[Puesto]    
      ,[Telefono]    
      ,[Email]    
      ,[Fax]    
   ,[TelefonoMovil]    
   ,[Radio]    
      ,[BajaLogica]    
      ,[FechaBajaLogica]    
      ,[FechaUltimaMod]    
      ,[ClaUsuarioMod]    
      ,[NombrePcMod]    
  FROM [TiCatalogo]..[CmpCatProveedorContacto]

GO
/****** Object:  View [dbo].[CmpCatProveedorRefLocalVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[CmpCatProveedorRefLocalVw]     
AS      
SELECT [ClaUbicacion]      
  ,[ClaCUP]      
  ,[Nombre]      
  ,[ClaTipoProveedor]      
  ,[ClaProveedor]      
  ,[ClaIva]      
  ,[Calle]      
  ,[NumeroInterior]      
  ,[NumeroExterior]      
  ,[CodigoPostal]      
  ,[ClaColonia]      
  ,[ClaMunicipio]      
  ,[ClaEstado]      
  ,[ClaPais]      
  ,[EsActivo]      
  ,[EsPenalizable]      
  ,[MotivoDesactivacion]     
  ,[ClaCalidadProv]  
  ,[ClaIncoterm]  
  ,[EsPagoCheque]  
  ,[PlazoPago]  
  ,[EsGeneraPedidosImportacion]  
  ,[BajaLogica]      
  ,[FechaBajaLogica]      
  ,[FechaUltimaMod]      
  ,[ClaUsuarioMod]      
  ,[NombrePcMod]      
  FROM TiCatalogo.dbo.CmpCatProveedorRefLocal
GO
/****** Object:  View [dbo].[ConCatPaisConVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	 
	 CREATE VIEW [dbo].[ConCatPaisConVw]  
AS  
SELECT     ClaPaisCon, NombrePaisCon, BajaLogica, FechaBajaLogica, FechaUltimaMod, NombrePcMod, ClaUsuarioMod, FechaIns, ClaUsuarioIns  
FROM         dbo.ConCatPaisCon  
	 
	 
	 

GO
/****** Object:  View [dbo].[CmpCatProveedorVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[CmpCatProveedorVw]
as
select 		LOC.ClaUbicacion,
			LOC.ClaProveedor,
			LOC.ClaTipoProveedor,
			LOC.ClaCUP,     
			LOC.Nombre,
			Direccion = isnull(LOC.Calle,'') + ' ' + isnull(LOC.NumeroInterior,'') + ' ' + isnull(LOC.NumeroExterior,'') 
			+ isnull(COL.NombreColoniaCon,'') + isnull(MUN.NombreMunicipioCon,'') + isnull(EST.NombreEstadoCon,'')
			 + ' ' + isnull(PAI.NombrePaisCon,'') + ' ' + isnull(LOC.CodigoPostal,''),
			CON.NomContacto,
			CON.Telefono,
			CON.Fax,
			CON.TelefonoMovil,
			CON.Email,
			CON.FechaUltimaMod,
			CON.BajaLogica,
			CON.FechaBajaLogica

from		TiCatalogo..CmpCatProveedorRefLocalVw	LOC WITH (nolock) 
INNER JOIN	TiCatalogo..CmpCatProveedorContactoVw	CON  WITH (nolock)  on (	CON.ClaCUP			= LOC.ClaCUP)
LEFT JOIN	TiCatalogo..ConCatMunicipioConVw			MUN on (	MUN.ClaPaisCon		= LOC.ClaPais
															and		MUN.ClaEstadoCon	= LOC.ClaEstado
															and		MUN.ClaMunicipioCon = LOC.ClaMunicipio)
LEFT JOIN	TiCatalogo..ConCatColoniaConVw			COL	 WITH (nolock) on (	COL.ClaPaisCon		= LOC.ClaPais
															and		COL.ClaEstadoCon	= LOC.ClaEstado
															and		COL.ClaMunicipioCon = LOC.ClaMunicipio
															and		COL.ClaColoniaCon	= LOC.ClaColonia)
LEFT JOIN	TiCatalogo..ConCatEstadoConVw			EST  WITH (nolock) on (	EST.ClaPaisCon		= LOC.ClaPais
															and		EST.ClaEstadoCon	= LOC.ClaEstado)
LEFT JOIN	TiCatalogo..ConCatPaisConVw				PAI  WITH (nolock) on (	PAI.ClaPaisCon		= LOC.ClaPais)

GO
/****** Object:  View [dbo].[TesCatCUPVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW  [dbo].[TesCatCUPVw]  
AS  
SELECT ClaCUP,  
  RFC,  
  Nombre,  
  ApPaterno,  
  ApMaterno,  
  BajaLogica,  
  FechaBajaLogica,  
  FechaUltimaMod,  
  NombrePcMod,  
  ClaUsuarioMod,  
  TipoPersona,  
  Curp,   
  DiasPago,   
  CuentaMail,   
  Estatus,   
  Calle,   
  NoInt,   
  NoExt,   
  ClaColonia,    
  ClaMunicipioDelegacion,   
  ClaEstado,   
  ClaPais,   
  CodigoPostal,   
  Telefono,   
  FechaDonativo,   
  AutorizaCheque,   
  VigenciaCheque,    
  FechaAlta,
  ClaTipoActividad,
  ClaTipoProveedor
FROM TesCatCUP  
GO
/****** Object:  View [dbo].[FleCatTransportistaVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--*----
--*Objeto:		Vista: FleCatTransportistaVw
--*Autor:		TiGeneraScriptVistaProc - LFVERASLAP
--*Fecha:		Oct 12 2009  4:23PM
--*Objetivo:	        Gerar la vista para tabla FleCatTransportista
--*Entrada:
--*Salida:
--*Precondiciones:
--*Revisiones:
--*----	
CREATE VIEW [dbo].[FleCatTransportistaVw]
AS
SELECT	ClaUbicacion,
		ClaTransportista,
		ClaBeneficiario,
		ClaCUP,
		ClaCuentaCUP,
		NumTransportista,
		Nombre,
		Abreviacion,
		CobroPrimaCombustible,
		PorcCobroPrimaCombustible,
		EsNacional,
		PlazoParaPago,
		ClaGrupoTransporte,
		PorcDPPP,
		PorcIVA,
		PorcRetencion,
		DescuentoProntoPago,
		Direccion,
            Calle,
            Colonia,
		ClaCiudad,
		ClaEstado,
		ClaPais,
		Telefono1,
		Telefono2,
            Fax,
            Web,
		FechaUltimaMod,
		EsConContrato,
		NombrePcMod,
		ClaUsuarioMod,
		BajaLogica,
		FechaBajaLogica,
		EsDedicado,
		CarroFFCCConvenio
FROM	TiCatalogo.dbo.FleCatTransportista WITH (NOLOCK)
-------------
--*** FIN ***
-------------

GO
/****** Object:  View [dbo].[CexCatAgenteAduanalVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[CexCatAgenteAduanalVw]
as
SELECT [ClaAgenteAduanal]      
      ,[ClaCUP]      
      ,[NomAgenteAduanal]         
      ,[Telefono]
      ,ClaPais  
      ,[ClaEstado]      
      ,[ClaMunicipio]      
      ,[ClaColonia]      
      ,[Calle]      
      ,[NoExterior]    
      ,[NoInterior]
      ,CodigoPostal
      ,[BajaLogica]      
      ,[FechaBajaLogica]      
      ,[FechaUltimaMod]      
      ,[ClaUsuarioMod]      
      ,[NombrePcMod]
FROM dbo.CexCatAgenteAduanal

GO
/****** Object:  View [dbo].[CexCatPrestadorServicioVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CexCatPrestadorServicioVw]
AS
SELECT	ClaPrestadorServicio	= ClaTransportista,
		fle.ClaCUP,
		ClaTipoServicio = CASE WHEN EsNacional = 1 THEN 3 ELSE 1 END,
		fle.Nombre,
		NombreCompleto = LTRIM(RTRIM(tes.Nombre)) + ' ' + LTRIM(RTRIM(tes.ApPaterno)) + ' ' + LTRIM(RTRIM(tes.ApMaterno)),
		tes.ClaColonia, 
		tes.ClaMunicipioDelegacion, 
		tes.ClaEstado,
		tes.ClaPais,
		tes.CodigoPostal,
		tes.Calle,
		tes.NoExt,
		Telefono = fle.Telefono1,
		tes.RFC,
		fle.BajaLogica,
		fle.FechaBajaLogica,
		fle.FechaUltimaMod,
		fle.NombrePcMod,
		fle.ClaUsuarioMod
FROM dbo.FleCatTransportistaVw fle
	INNER JOIN dbo.TesCatCUPVw tes ON tes.ClaCUP = fle.ClaCUP
WHERE ClaUbicacion = 6 
UNION
SELECT	ClaPrestadorServicio = ClaAgenteAduanal,
		aa.ClaCUP,
		ClaTipoServicio = 2,
		Nombre = aa.NomAgenteAduanal,
		--NombreCompleto = LTRIM(RTRIM(Nombre)) + ' ' + LTRIM(RTRIM(ApPaterno)) + ' ' + LTRIM(RTRIM(ApMaterno)),
		NombreCompleto = NomAgenteAduanal,
		tes.ClaColonia, 
		tes.ClaMunicipioDelegacion, 
		tes.ClaEstado,
		tes.ClaPais,
		tes.CodigoPostal,
		tes.Calle,
		tes.NoExt,
		aa.Telefono,
		tes.RFC,
		aa.BajaLogica,
		aa.FechaBajaLogica,
		aa.FechaUltimaMod,
		aa.NombrePcMod,
		aa.ClaUsuarioMod
FROM dbo.CexCatAgenteAduanalVw aa
	INNER JOIN dbo.TesCatCUPVw tes ON tes.ClaCUP = aa.ClaCUP
GO
/****** Object:  View [dbo].[TiCatConfiguracionVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--*----
--*Objeto:		Vista: TiCatConfiguracionVw
--*Autor:		TiGeneraScriptVistaProc - DCSHGARCIALAP
--*Fecha:		Feb 18 2010  4:28PM
--*Objetivo:	Generar la vista para tabla TiCatConfiguracion
--*Entrada:
--*Salida:
--*Precondiciones:
--*Revisiones:
--*----	

CREATE VIEW [dbo].[TiCatConfiguracionVw]
AS
SELECT	ClaUbicacion,
		ClaSistema,
		ClaConfiguracion,
		NombreConfiguracion,
		sValor1,
		sValor2,
		nValor1,
		nValor2,
		dValor1,
		dValor2,
		BajaLogica,
		FechaBajaLogica,
		FechaUltimaMod,
		NombrePcMod,
		ClaUsuarioMod
FROM	TiCatalogo.dbo.TiCatConfiguracion WITH (NOLOCK)

-------------
--*** FIN ***
-------------


GO
/****** Object:  View [dbo].[CmpCatArticuloubicacionVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CmpCatArticuloubicacionVw]  
AS              
  
  
SELECT  UBI.ClaUbicacion,              
   ClaArticulo      = ART.ClaArticulo,    
   ART.ClaveArticulo,  
   DescArticulo     = ART.ClaveArticulo + ' - '+ ART.NomArticulo,              
   ClaFamilia      = ART.ClaFamilia,              
   ClaSubFamilia     = ART.ClaSubfamilia,  
   ClaUnidad     = ART.ClaUnidadBase,                           
   UBI.ComprarEnMultiplosDe,          
   UBI.EsStock,                     
   BajaLogica      = ART.BajaLogica,              
   FechaUltimaMod     = ART.FechaUltimaMod ,  
   ClaTipoGasto = UBI.Clatipogasto   
FROM  TiCatalogo..ArtCatArticuloVw  ART WITH(NOLOCK)              
INNER JOIN Operacion.cmp.CmpCTraTransitorioArtUbicacionVw UBI WITH(NOLOCK) on( ART.ClaArticulo  =  UBI.ClaArticulo)    
INNER JOIN TiCatalogo..TiCatConfiguracionVw CON WITH(NOLOCK) on( CON.ClaUbicacion  =   UBI.ClaUbicacion            
AND   CON.ClaConfiguracion   = 10    
AND   CON.ClaSistema     = 25             
AND   CON.nValor1      = ART.ClaTipoInventario)

GO
/****** Object:  View [dbo].[FfccRelDireccionCrcVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[FfccRelDireccionCrcVw]
AS
SELECT	CONVERT(INT, DCG.ClaDireccion) AS ClaDireccion, DCG.ClaCrc AS ClaCRC, CCC.NombreCrc, CCC.BajaLogica, CCC.FechaBajaLogica
FROM	TiCatalogo.dbo.ConCatDireccionCrcGastoVw AS DCG 
INNER JOIN TiCatalogo.dbo.ConCatCrc AS CCC ON DCG.ClaCrc = CCC.ClaCrc
WHERE	CCC.ClaClasificacionCrc = 0
AND ISNULL(CCC.EsAutorizado,0) = 1
AND ISNULL(DCG.ClaClasificacionCuenta,0) = 0
AND ISNULL(DCG.EsAutorizado,0) = 1
GROUP BY DCG.ClaDireccion, DCG.ClaCrc, CCC.NombreCrc, CCC.BajaLogica, CCC.FechaBajaLogica


GO
/****** Object:  View [dbo].[ConCatGrupoAsignacionVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	 
	 
	 CREATE VIEW [dbo].[ConCatGrupoAsignacionVw]  
AS  
SELECT     ClaEmpresa, ClaGrupoAsignacion, NombreGrupoAsignacion, ClaTipoAsignacion, Referencia1, EsAutorizado, isnull(BajaLogica,0) as BajaLogica, FechaBajaLogica,   
  FechaUltimaMod, NombrePcMod, ClaUsuarioMod, FechaIns, ClaUsuarioIns  
FROM         dbo.ConCatGrupoAsignacion  
	 
	 
	 

GO
/****** Object:  View [dbo].[ConCatGpoAsigCrcDirVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	 
	 create VIEW [dbo].[ConCatGpoAsigCrcDirVw]  
AS  
SELECT ClaEmpresa, ClaDireccion, ClaCrc, ClaGrupoAsignacion, BajaLogica, FechaBajaLogica, FechaUltimaMod, NombrePcMod, ClaUsuarioMod  
FROM dbo.ConCatGpoAsigCrcDir  
	 
	 

GO
/****** Object:  View [dbo].[FfccRelDirCrcGpoAsigVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[FfccRelDirCrcGpoAsigVw]
AS
SELECT  DCA.ClaDireccion, DCA.ClaCrc AS ClaCrc, DCA.ClaGrupoAsignacion, CGA.NombreGrupoAsignacion,
		DCA.BajaLogica, DCA.FechaBajaLogica
FROM    TiCatalogo.dbo.ConCatGpoAsigCrcDirVw AS DCA INNER JOIN
        TiCatalogo.dbo.ConCatGrupoAsignacionVw AS CGA ON 
							(	DCA.ClaEmpresa = CGA.ClaEmpresa
							AND DCA.ClaGrupoAsignacion = CGA.ClaGrupoAsignacion)



GO
/****** Object:  View [dbo].[AceCatAcabadorVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
create View [dbo].[AceCatAcabadorVw]  AS 
SELECT  
	ClaUbicacion,
	ClaAcabador,
	ClaveAcabador,
	AcabadorDesc,
	BajaLogica,
	ClaUsuarioIns,
	ClaUsuarioMod,
	FechaIns,
	FechaUltimaMod,
	NombrePcMod
FROM  TiCatalogo.dbo.AceCatAcabador

GO
/****** Object:  View [dbo].[AceCatAlmacenVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[AceCatAlmacenVw]
AS
SELECT	ClaAlmacen,
		AlmacenDesc,
		BajaLogica,
		FechaBajaLogica,
		FechaUltimaMod,
		NombrePcMod,
		ClaUsuarioMod
FROM	TiCatalogo.dbo.AceCatAlmacen WITH(NOLOCK)
 

GO
/****** Object:  View [dbo].[AceCatAreaVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[AceCatAreaVw]
AS
SELECT	ClaArea,
		ClaUbicacion,
		NomArea,
		BajaLogica,
		ClaUsuarioIns,
		ClaUsuarioMod,
		FechaIns,
		FechaUltimaMod,
		NombrePcMod
FROM	TiCatalogo.dbo.AceCatArea WITH(NOLOCK)
 

GO
/****** Object:  View [dbo].[AceCatBandaVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

 
 
CREATE VIEW [dbo].[AceCatBandaVw]
AS
SELECT ClaBanda
,NomBanda
,BajaLogica
,ClaUsuarioIns
,ClaUsuarioMod
,FechaIns
,FechaUltimaMod
,NombrePcMod
,FolioSincro
FROM  [dbo].[AceCatBanda]
 

GO
/****** Object:  View [dbo].[AceCatCalGradoVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
 
Create view [dbo].[AceCatCalGradoVw]   AS
Select  
       ClaGrado          ,
      NomGrado          ,
      ClaGrupoChatarra  ,
      EsActivo          ,
      DeAcero           ,
      ClaUsuarioIns     ,
      FechaIns          ,
      ClaUsuarioMod     ,
      FechaUltimaMod    ,
      NombrePcMod       
From  dbo.AceCatCalGrado    With(nolock)

GO
/****** Object:  View [dbo].[AceCatCalibreVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE View [dbo].[AceCatCalibreVw]  AS 
SELECT  
	ClaCalibre,
	NomCalibre,
	Medidamm,
	AreaNominal,
	TonHora,
	KgsPunta,
	KgsCola,
	KgsEspira,
	BajaLogica,
	MinPm,
	MaxPm,
	MinEl,
	MaxEl,
	SepPCObjetivo,
	VelObjetivo,
	PesoPq,
	ClaUsuarioIns,
	ClaUsuarioMod,
	FechaIns,
	FechaUltimaMod,
	NombrePcMod
FROM  TiCatalogo.dbo.AceCatCalibre

GO
/****** Object:  View [dbo].[AceCatCapacidadMolinoCalibreVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
Create View [dbo].[AceCatCapacidadMolinoCalibreVw]  AS 
SELECT  
	ClaUbicacion,
	ClaGrupoProduccion,
	ClaCalibre,
	ClaMolino,
	TonHrCargaCaliente,
	TonHrCargaFrio,
	ClaUsuarioIns,
	FechaIns,
	FechaUltimaMod,
	NombrePcMod
FROM  TiCatalogo.dbo.AceCatCapacidadMolinoCalibre

GO
/****** Object:  View [dbo].[AceCatCausaDesviacionVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

 
 
 
 
 
 
CREATE VIEW [dbo].[AceCatCausaDesviacionVw]
AS
SELECT ClaCausaDesviacion
      ,NomCortoCausaDesviacion
      ,NomCausaDesviacion
      ,ClaTipoElemento
      ,EsQuimico
      ,BajaLogica
      ,ClaUsuarioIns
      ,FechaBajaLogica
      ,FechaIns
      ,FechaUltimaMod
      ,NombrePcMod
      ,ClaUsuarioMod
 FROM dbo.AceCatCausaDesviacion WITH (NOLOCK)
 

GO
/****** Object:  View [dbo].[AceCatCausaReclasificacionVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[AceCatCausaReclasificacionVw]
AS
SELECT ClaCausaReclasificacion, 
		NomCausaReclasificacion,
		BajaLogica,
		FechaBajaLogica,
		FechaUltimaMod,
		NombrePcMod,
		ClaUsuarioMod
FROM dbo.AceCatCausaReclasificacion  WITH (NOLOCK)
;

GO
/****** Object:  View [dbo].[AceCatClienteEspecialVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[AceCatClienteEspecialVw]
	AS
SELECT [ClaClienteUnico]
      ,[EsImprimeCalidad]
      ,[ClaUsuarioIns]
      ,[FechaIns]
      ,[BajaLogica]
      ,[FechaBajaLogica]
      ,[FechaUltimaMod]
      ,[NombrePcMod]
      ,[ClaUsuarioMod]
  FROM [dbo].[AceCatClienteEspecial]  with (nolock)

GO
/****** Object:  View [dbo].[AceCatDefectoVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

 
CREATE VIEW [dbo].[AceCatDefectoVw]
AS
SELECT ClaTipoInventario
      ,ClaFamilia
      ,ClaDefecto
      ,NomDefecto
      ,EsCalidadInterna
      ,EsCalidadSuperficial
      ,BajaLogica
      ,ClaUsuarioIns
      ,FechaBajaLogica
      ,FechaIns
      ,FechaUltimaMod
      ,NombrePcMod
      ,ClaUsuarioMod
FROM dbo.AceCatDefecto WITH (NOLOCK)
 

GO
/****** Object:  View [dbo].[AceCatElementoQuimicoVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[AceCatElementoQuimicoVw]
AS
SELECT ClaElementoQuimico
      ,NomElemento
      ,BajaLogica
      ,FechaBajaLogica
      ,FechaUltimaMod
      ,NombrePcMod
      ,ClaUsuarioMod
	  ,EsFormula
  FROM [dbo].[AceCatElementoQuimico] WITH (NOLOCK)

GO
/****** Object:  View [dbo].[AceCatEspecificacionQuimicaBAKVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[AceCatEspecificacionQuimicaBAKVw]
AS
SELECT [ClaGrado]
      ,[ClaEspecificacionQuimica]
	  ,[ClaEstatusVigencia]	
      ,[FechaInicioVigencia]
      ,[FechaFinVigencia]
      ,[Observaciones]
      ,[ClaUsuarioIns]
      ,[FechaIns]
      ,[EsRestablecer]
      ,[BajaLogica]
      ,[FechaBajaLogica]
      ,[FechaUltimaMod]
      ,[NombrePcMod]
      ,[ClaUsuarioMod]
  FROM [dbo].[AceCatEspecificacionQuimica]  WITH (NOLOCK)

GO
/****** Object:  View [dbo].[AceCatEspecificacionQuimicaVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[AceCatEspecificacionQuimicaVw]
AS
SELECT [ClaGrado]
      ,[ClaEspecificacionQuimica]
	  ,[ClaTipoEspecificacion]
	  ,[ClaUbicacion]
	  ,[ClaEstatusVigencia]	
      ,[FechaInicioVigencia]
      ,[FechaFinVigencia]
      ,[Observaciones]
      ,[ClaUsuarioIns]
      ,[FechaIns]
      ,[EsRestablecer]
      ,[BajaLogica]
      ,[FechaBajaLogica]
      ,[FechaUltimaMod]
      ,[NombrePcMod]
      ,[ClaUsuarioMod]
  FROM [dbo].[AceCatEspecificacionQuimica]  WITH (NOLOCK)

GO
/****** Object:  View [dbo].[AceCatEstatusVigenciaVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[AceCatEstatusVigenciaVw]
AS
SELECT ClaEstatusVigencia
      ,Descripcion
      ,BajaLogica
      ,FechaBajaLogica
      ,FechaUltimaMod
      ,ClaUsuarioMod
      ,NombrePcMod
FROM dbo.AceCatEstatusVigencia WITH (NOLOCK)

GO
/****** Object:  View [dbo].[AceCatGpoCalibreVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
Create View [dbo].[AceCatGpoCalibreVw]  AS 
SELECT  
	ClaUbicacion,
	ClaGpoCalibre,
	NomGpoCalibre,
	BajaLogica,
	ClaUsuarioIns,
	ClaUsuarioMod,
	FechaIns,
	FechaUltimaMod,
	NombrePc
FROM  TiCatalogo.dbo.AceCatGpoCalibre

GO
/****** Object:  View [dbo].[AceCatGradoFormulaVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[AceCatGradoFormulaVw]
AS
SELECT	ClaGrado,
		Formula1,
		Formula2,
		Formula3,
		Formula4,
		Formula5,
		ClaUsuarioMod,
		FechaUltimaMod,
		NombrePcMod
FROM	TiCatalogo.dbo.AceCatGradoFormula WITH(NOLOCK)
 

GO
/****** Object:  View [dbo].[AceCatGradoVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[AceCatGradoVw]
AS
SELECT ClaGrado
	,NomCortoGrado
	,NomGrado
	,ClaGrupoRecetaChatarra
	,ClaGrupoUsoTipico
	,ClaveAutomatizacion
	,EsDeAcero
	,EsVarilla
	,BajaLogica
	,FechaBajaLogica
	,FechaUltimaMod
	,NombrePcMod
	,ClaUsuarioMod
  FROM dbo.AceCatGrado WITH (NOLOCK)

GO
/****** Object:  View [dbo].[AceCatGrupoCarbonoVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
 
Create view [dbo].[AceCatGrupoCarbonoVw]	AS
Select  
	 ClaUbicacion      ,
	 ClaGrupoCarbono   ,
	 NombreGpoCarbono  ,
	 BajaLogica        ,
	 ClaUsuarioIns     ,
	 ClaUsuarioMod     ,
	 FechaIns          ,
	 FechaUltimaMod    ,
	 NombrePcMod       
From	dbo.AceCatGrupoCarbono    With(nolock)

GO
/****** Object:  View [dbo].[AceCatGrupoCosteoVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[AceCatGrupoCosteoVw]
AS
SELECT	ClaGrupoCosteo,
		GrupoCosteoDesc,
		ClaAlmacen,
		ClaUsuarioIns,
		FechaIns,
		BajaLogica,
		FechaBajaLogica,
		FechaUltimaMod,
		NombrePcMod,
		ClaUsuarioMod
FROM	TiCatalogo.dbo.AceCatGrupoCosteo WITH(NOLOCK)
 

GO
/****** Object:  View [dbo].[AceCatGrupoFamiliaVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[AceCatGrupoFamiliaVw]
AS
SELECT	ClaGrupoFamilia,
		ClaveFamilia,
		EsSegunda,
		BajaLogica,
		FechaBajaLogica,
		FechaUltimaMod,
		NombrePcMod,
		ClaUsuarioMod
FROM	TiCatalogo.dbo.AceCatGrupoFamilia WITH(NOLOCK)
 

GO
/****** Object:  View [dbo].[AceCatGrupoProduccionVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[AceCatGrupoProduccionVw]
AS
SELECT	ClaGrupoProduccion,
		NomGrupoProduccion,
		NomCortoGpoProd,
		ClaFamilia,
		ClaUbicacion,
		ClaUsuarioIns,
		BajaLogica,
		FechaIns,
		FechaBajaLogica,
		FechaUltimaMod,
		NombrePcMod,
		ClaUsuarioMod
FROM	TiCatalogo.dbo.AceCatGrupoProduccion WITH(NOLOCK)
 

GO
/****** Object:  View [dbo].[AceCatGrupoRecetaChatarraVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

 
CREATE VIEW [dbo].[AceCatGrupoRecetaChatarraVw]
AS
SELECT ClaGrupoRecetaChatarra
      ,NomGrupoChatarra
      ,ClaveAutomatizacion
      ,ClaUsuarioIns
      ,BajaLogica
      ,FechaBajaLogica
      ,FechaIns
      ,FechaUltimaMod
      ,NombrePcMod
      ,ClaUsuarioMod
  FROM dbo.AceCatGrupoRecetaChatarra WITH (NOLOCK)
 

GO
/****** Object:  View [dbo].[AceCatGrupoTrabajoVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[AceCatGrupoTrabajoVw]
AS
SELECT	ClaGrupoTrabajo,
		ClaUbicacion,
		NomGrupoTrabajo,
		EsActivo,
		ClaArea,
		ClaUsuarioIns,
		ClaUsuarioMod,
		FechaIns,
		FechaUltimaMod,
		NombrePcMod
FROM	TiCatalogo.dbo.AceCatGrupoTrabajo WITH(NOLOCK)
 

GO
/****** Object:  View [dbo].[AceCatGrupoUsoTipicoVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[AceCatGrupoUsoTipicoVw]
AS
SELECT ClaGrupoUsoTipico
      ,NomGrupoUsoTipico
      ,BajaLogica
      ,ClaUsuarioIns
      ,FechaBajaLogica
      ,FechaIns
      ,FechaUltimaMod
      ,NombrePcMod
      ,ClaUsuarioMod
  FROM [dbo].[AceCatGrupoUsoTipico] WITH (NOLOCK)
 

GO
/****** Object:  View [dbo].[AceCatHornoAfinoVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[AceCatHornoAfinoVw]
as
Select	ClaHornoAfino,
		ClaveHornoAfino,
		NomHornoAfino,
		ClaUbicacion,
		BajaLogica,
		ClaUsuarioIns,
		ClaUsuarioMod,
		FechaIns,
		FechaUltimaMod,
		NombrePcMod,
		ClaveAutomatizacion,
		FolioSincro
From	TiCatalogo.dbo.AceCatHornoAfino WITH(NOLOCK)
 

GO
/****** Object:  View [dbo].[AceCatHornoFusionVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[AceCatHornoFusionVw]
AS
SELECT	ClaHornoFusion,
		ClaUbicacion,
		ClaveAlfanumerica,
		EsDeAcero,
		NomHornoFusion,
		BajaLogica,
		ClaOrigen,
		ClaUsuarioIns,
		ClaUsuarioMod,
		FechaIns,
		FechaUltimaMod,
		NombrePcMod,
		ClaveAutomatizacion,
		FolioSincro
FROM	TiCatalogo.dbo.AceCatHornoFusion WITH(NOLOCK)
 

GO
/****** Object:  View [dbo].[AceCatMaquinaCCVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[AceCatMaquinaCCVw]
as
Select	ClaMaquinaCC,
		ClaveMaquinaCC,
		NomMaquinaCC,
		ClaUbicacion,
		BajaLogica,
		ClaveAutomatizacion,
		ClaUsuarioIns,
		ClaUsuarioMod,
		FechaUltimaMod,
		FechaIns,
		NombrePcMod,
		FolioSincro
From	TiCatalogo.dbo.AceCatMaquinaCC WITH(NOLOCK)
 

GO
/****** Object:  View [dbo].[AceCatMaterialMPVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[AceCatMaterialMPVw]
AS
SELECT	ClaUbicacion,
		ClaMaterialMP,
		NomMaterialMP,
		ClaTipoMateriaPrima,
		ClaProveedor,
		ClaTipoCompra,
		ClaTipoProveedor,
		BajaLogica,
		FechaBajaLogica,
		FechaUltimaMod,
		NombrePcMod,
		ClaUsuarioMod
FROM	dbo.AceCatMaterialMP WITH(NOLOCK)

GO
/****** Object:  View [dbo].[AceCatMaterialVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[AceCatMaterialVw]
AS
SELECT	ClaMaterial,
		ClaUbicacion,
		NomMaterial,
		TipoAdicAdit,
		PrecioCompra,
		FacConvKg,
		ConsFijoVar,
		UdsCompra,
		BajaLogica,
		ClaUsuarioIns,
		FechaIns,
		ClaUsuarioMod,
		FechaUltimaMod,
		NombrePcMod,
		ClaUnidad,
		ClaveAutomatizacion,
		ClaMaterialConsecutivo,
		ClaTipoReceta,
		ClaFamiliaMaterial,
		ClaUnidadPresentacion,
		ClaUnidadCompras,
		FacConvPresentacionCompras,
		FacConvPresentacionKilos,
		FolMaterial,
		LugarAfectacionInventario,
		EsGranel,
		EsEditable,
		ExistenciaMinimaUnidadCompras,
		ExistenciaMaximaUnidadCompras,
		PuntoReordenUnidadCompras,
		EsPermitidoLocFueraPeps,
		FechaBajaLogica
FROM	TiCatalogo.dbo.AceCatMaterial WITH(NOLOCK)
 

GO
/****** Object:  View [dbo].[AceCatModoAplicacionAAVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[AceCatModoAplicacionAAVw]
AS
SELECT	ClaModoAplicacionAA,
		NomModoAplicacionAA,
		ClaUsuarioIns,
		ClaUsuarioMod,
		FechaIns,
		FechaUltimaMod,
		NombrePcMod,
		ClaveAutomatizacion,
		BajaLogica,
		FechaBajaLogica
FROM	TiCatalogo.dbo.AceCatModoAplicacionAA WITH(NOLOCK)
 

GO
/****** Object:  View [dbo].[AceCatMolinoVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[AceCatMolinoVw]
AS
SELECT	ClaMolino,
		NomMolino,
		BajaLogica,
		ClaUsuarioIns,
		ClaUsuarioMod,
		FechaIns,
		FechaUltimaMod,
		NombrePcMod,
		ClaveAlfanumerica,
		NumCartuchos,
		ClaUbicacion,
		ClaveAutomatizacion,
		EsDeAcero,
		FolioSincro
FROM	TiCatalogo.dbo.AceCatMolino WITH(NOLOCK)
 

GO
/****** Object:  View [dbo].[AceCatMotivoEntradaVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[AceCatMotivoEntradaVw]
AS
SELECT	ClaMotivoEntrada,
		NomMotivoEntrada,
		BajaLogica,
		ClaTipoCompra,
		EsRequeridaBasculaCertificada,
		EsValidaReuso,
		EsCargaDescarga,
		EsExterna,
		EsMostrarVigilancia,
		ClaAlmacen,
		EsMostrarFfcc,
		ClaUsuarioIns,
		ClaUsuarioMod,
		FechaIns,
		FechaUltimaMod,
		NombrePcMod,
		FechaBajaLogica
FROM	TiCatalogo.dbo.AceCatMotivoEntrada WITH(NOLOCK)
 

GO
/****** Object:  View [dbo].[AceCatPrefProgGradoVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE View [dbo].[AceCatPrefProgGradoVw]  AS 
SELECT  
      ClaUbicacion,
      ClaGrado,
      ClaGradoPrincipalDesvio,
      ClaGrupoCarbono,
      OrdenCalidad,
      EsProgDespuesParo,
      ClaOrdenProg,
      GradosEspeciales,
      RequiereEnfriamiento,
      PqComprada,
      LeadTime,
      ClaUsuarioIns,
      ClaUsuarioMod,
      FechaIns,
      FechaUltimaMod,
      NombrePcMod
FROM  TiCatalogo.dbo.AceCatPrefProgGrado

GO
/****** Object:  View [dbo].[AceCatPrefProgProductoVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
Create View [dbo].[AceCatPrefProgProductoVw]  AS 
SELECT  
	ClaUbicacion,
	ClaArticulo,
	ClaMolino,
	ClaHorno,
	ClaAcabador,
	ClaTurnoPreferido,
	EsCargaFria,
	EsCampaniaUnica,
	ClaUsuarioIns,
	ClaUsuarioMod,
	FechaIns,
	FechaUltimaMod,
	NombrePcMod
FROM  TiCatalogo.dbo.AceCatPrefProgProducto

GO
/****** Object:  View [dbo].[AceCatProductoVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE view [dbo].[AceCatProductoVw]	AS
Select  
	 ClaArticulo             ,
	 ClaveArticuloPta        ,
	 ClaveArticuloVta        ,
	 NomArticulo             ,
	 NomArticuloCorto        ,
	 ClaFamilia              ,
	 ClaSubFamilia           ,
	 ClaUnidad               ,
	 ClaUnidadVta            ,
	 ClaCalibre              ,
	 ClaGrado                ,
	 ClaGrupoProduccion      ,
	 ClaGrupoCosteo          ,
	 ClaGpoEstadistico       ,
	 ClaTipoArticulo         ,
	 ClaAlmacen              ,
	 ClaTipoLongitudVarilla  ,
	 ClaFamiliaUso           ,
	 ClaFamiliaDesperdicio   ,
	 KgMetro                 ,
	 KgMetroAlambron         ,
	 FactorCubicaje          ,
	 PesoTeoricoKgs          ,
	 PesoTeoricoKgsVta       ,
	 EsControlLote           ,
	 EsCuna                  ,
	 BajaLogica              ,
	 ClaUsuarioIns           ,
	 ClaUsuarioMod           ,
	 FechaIns                ,
	 FechaUltimaMod          ,
	 NombrePcMod             
From	dbo.AceCatProducto    With(nolock)

GO
/****** Object:  View [dbo].[AceCatProveedorVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[AceCatProveedorVw]
AS
SELECT	ClaProveedor,
		ClaTipoProveedor,
		ClaTipoCompra,
		NomProveedor,
		Direccion,
		Poblacion,
		Telefono,
		Fax,
		TelCelular,
		TelParticular,
		Contacto,
		NumeroCuenta,
		FechaDato,
		PreoxiM3,
		ConoxiM3,
		VisiDeseadas,
		DiasVisi,
		Cumplimiento,
		Kilos,
		ClaZona,
		CiudadLab,
		Patio1M2,
		Patio2M2,
		NumTrailer,
		NumTorton,
		NumPrensas,
		NumCaiman,
		Notebook,
		Iva,
		ClaCiudad,
		EstatusTransmision,
		FaxAutomatico,
		Ubicacion1,
		Ubicacion2,
		ComentInstal,
		SucCta,
		BancoCta,
		CtaEmail,
		PlazaCtaBco,
		ClaRegion,
		CtaContable,
		CtaAnticipo,
		Regimen,
		Rfc,
		ApPaterno,
		ApMaterno,
		NombreFiscal,
		Calle,
		Numero,
		Colonia,
		Cp,
		Municipio,
		Estado,
		TelFiscal,
		NombreGral,
		ApPatGral,
		ApMatGral,
		NumGral,
		ColGral,
		CpGral,
		TitGral,
		Cup,
		ClaBene,
		ClaUsuarioIns,
		ClaUsuarioMod,
		FechaIns,
		FechaUltimaMod,
		NombrePcMod,
		BajaLogica,
		FechaBajaLogica
FROM	TiCatalogo.dbo.AceCatProveedor WITH(NOLOCK)
 

GO
/****** Object:  View [dbo].[AceCatRolTurnoVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[AceCatRolTurnoVw]
AS
SELECT	ClaGrupoTrabajo,
		ClaUbicacion,
		ClaTurno,
		Fecha,
		AsociadoA,
		ClaTurnoAuxiliar,
		ClaUsuarioIns,
		ClaUsuarioMod,
		FechaIns,
		FechaUltimaMod,
		NombrePcMod
FROM	TiCatalogo.dbo.AceCatRolTurno WITH(NOLOCK)
 

GO
/****** Object:  View [dbo].[AceCatSeccionInvVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[AceCatSeccionInvVw]
as
Select	ClaSeccionInv,
		ClaUbicacion,
		ClaUbicacionInv,
		ClaSubAlmacen,
		ClaAlmacen,
		NomSeccionInv,
		BajaLogica,
		ClaveAutomatizacion,
		ClaUsuarioIns,
		ClaUsuarioMod,
		FechaIns,
		FechaUltimaMod,
		NombrePcMod,
		FolioSincro
From	TiCatalogo.dbo.AceCatSeccionInv WITH(NOLOCK)
 

GO
/****** Object:  View [dbo].[AceCatSubAlmacenVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[AceCatSubAlmacenVw]
as
Select	ClaAlmacen,
		ClaUbicacion,
		ClaSubAlmacen,
		NomSubAlmacen,
		BajaLogica,
		ClaveAutomatizacion,
		ClaUsuarioIns,
		ClaUsuarioMod,
		FechaIns,
		FechaUltimaMod,
		NombrePcMod,
		FolioSincro
From	TiCatalogo.dbo.AceCatSubAlmacen WITH(NOLOCK)
 

GO
/****** Object:  View [dbo].[AceCatSubAreaVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[AceCatSubAreaVw]
AS
SELECT	ClaSubArea,
		ClaUbicacion,
		NomSubArea,
		BajaLogica,
		ClaArea,
		ClaUsuarioIns,
		ClaUsuarioMod,
		FechaIns,
		FechaUltimaMod,
		NombrePcMod,
		ClaveAutomatizacion
FROM	TiCatalogo.dbo.AceCatSubArea WITH(NOLOCK)
 

GO
/****** Object:  View [dbo].[AceCatTarifaHorariaVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
Create View [dbo].[AceCatTarifaHorariaVw]  AS 
SELECT  
	ClaUbicacion,
	ClaAnio,
	ClaPeriodo,
	FechaInicial,
	FechaFinal,
	Dia1HrInicial,
	Dia1HrFinal,
	Dia2HrInicial,
	Dia2HrFinal,
	Dia3HrInicial,
	Dia3HrFinal,
	Dia4HrInicial,
	Dia4HrFinal,
	Dia5HrInicial,
	Dia5HrFinal,
	Dia6HrInicial,
	Dia6HrFinal,
	Dia7HrInicial,
	Dia7HrFinal,
	ClaUsuarioIns,
	ClaUsuarioMod,
	FechaIns,
	FechaUltimaMod,
	NombrePcMod
FROM  TiCatalogo.dbo.AceCatTarifaHoraria

GO
/****** Object:  View [dbo].[AceCatTipoElementoVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

 
CREATE VIEW [dbo].[AceCatTipoElementoVw]
AS
SELECT ClaTipoElemento
      ,NomTipoElemento
      ,BajaLogica
      ,ClaUsuarioIns
      ,FechaBajaLogica
      ,FechaIns
      ,FechaUltimaMod
      ,NombrePcMod
      ,ClaUsuarioMod
  FROM dbo.AceCatTipoElemento WITH (NOLOCK)
 

GO
/****** Object:  View [dbo].[AceCatTipoEspecificacionVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[AceCatTipoEspecificacionVw]
as
Select	ClaTipoEspecificacion,
		NomTipoEspecificacion,
		BajaLogica,
		FechaBajaLogica,
		FechaUltimaMod,
		NombrePcMod,
		ClaUsuarioMod
From	dbo.AceCatTipoEspecificacion WITH(NOLOCK)

GO
/****** Object:  View [dbo].[AceCatTipoPersonalVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[AceCatTipoPersonalVw]
AS
SELECT	ClaUbicacion,
		ClaTipoPersonal,
		ClaSubArea,
		ClaArea,
		NomTipoPersonal,
		BajaLogica,
		ClaUsuarioIns,
		ClaUsuarioMod,
		FechaIns,
		FechaUltimaMod,
		NombrePcMod
FROM	TiCatalogo.dbo.AceCatTipoPersonal WITH(NOLOCK)
 

GO
/****** Object:  View [dbo].[AceCatTipoRecetaVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[AceCatTipoRecetaVw]
AS
SELECT	ClaTipoReceta,
		ClaUbicacion,
		NomTipoReceta,
		NomCortoTipoReceta,
		ClaUsuarioIns,
		ClaUsuarioMod,
		FechaIns,
		FechaUltimaMod,
		NombrePcMod,
		ClaveAutomatizacion
FROM	TiCatalogo.dbo.AceCatTipoReceta WITH(NOLOCK)
 

GO
/****** Object:  View [dbo].[AceCatTipoVersionArticuloVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--*----
--*Objeto:		Vista: AceCatTipoVersionArticuloVw
--*Autor:		TiGeneraScriptVistaProc - DCSJABARRONH
--*Fecha:		Mar  7 2013 11:33AM
--*Objetivo:	Gerar la vista para una tabla especifica
--*Entrada:
--*Salida:
--*Precondiciones:
--*Revisiones:
--*----	
 
CREATE VIEW [dbo].[AceCatTipoVersionArticuloVw]
as
Select	ClaTipoVersionArticulo,
		NomTipoVersionArticulo,
		BajaLogica,
		FechaBajaLogica,
		FechaUltimaMod,
		NombrePcMod,
		ClaUsuarioMod
From	dbo.AceCatTipoVersionArticulo (NOLOCK)
 
-------------
--*** FIN ***
-------------

GO
/****** Object:  View [dbo].[AceCatTrabajadorVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[AceCatTrabajadorVw]
AS
SELECT	ClaTrabajador,
		NomTrabajador,
		ClaUsuarioSeguridad,
		ClaUbicacion,
		ClaTipoPersonal,
		ClaUsuarioIns,
		ClaUsuarioMod,
		FechaIns,
		FechaUltimaMod,
		NombrePcMod,
		Estatus,
		FolioSincro
FROM	TiCatalogo.dbo.AceCatTrabajador WITH(NOLOCK)
 

GO
/****** Object:  View [dbo].[AceCatTurnoVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[AceCatTurnoVw]
AS
SELECT	ClaUbicacion,
		ClaTurno,
		NomTurno,
		HoraInicio,
		HoraFin,
		ClaUsuarioIns,
		ClaUsuarioMod,
		FechaIns,
		FechaUltimaMod,
		NombrePcMod
FROM	TiCatalogo.dbo.AceCatTurno WITH(NOLOCK)
 

GO
/****** Object:  View [dbo].[AceCatUbicacionInvVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[AceCatUbicacionInvVw]
as
Select	ClaUbicacionInv,
		ClaUbicacion,
		ClaSubAlmacen,
		ClaAlmacen,
		NomUbicacionInv,
		BajaLogica,
		ClaveAutomatizacion,
		ClaUsuarioIns,
		ClaUsuarioMod,
		FechaIns,
		FechaUltimaMod,
		NombrePcMod,
		FolioSincro
From	TiCatalogo.dbo.AceCatUbicacionInv WITH(NOLOCK)
 

GO
/****** Object:  View [dbo].[AceCatVarillaLongitudVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

 
CREATE VIEW [dbo].[AceCatVarillaLongitudVw]
AS
SELECT	ClaVarillaLongitud, 
		DescVarillaLongitud, 
		LongitudMetros, 
		Activo, 
		ClaUsuarioIns, 
		ClaUsuarioMod, 
		FechaIns, 
		FechaUltimaMod, 
		NombrePcMod, 
		BajaLogica, 
		FechaBajaLogica
FROM dbo.AceCatVarillaLongitud WITH (NOLOCK)
 
 

GO
/****** Object:  View [dbo].[AceCatVarillaPrePresentacionVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

 
CREATE VIEW [dbo].[AceCatVarillaPrePresentacionVw]
AS 
SELECT	ClaVarillaPrePresentacion,
		NomVarillaPrePresentacion, 
		Activo, 
		ClaUsuarioIns, 
		ClaUsuarioMod, 
		FechaIns, 
		FechaUltimaMod, 
		NombrePcMod, 
		BajaLogica, 
		FechaBajaLogica
FROM [dbo].[AceCatVarillaPrePresentacion] WITH (NOLOCK)
 

GO
/****** Object:  View [dbo].[AceCatVersionArticuloVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--*----
--*Objeto:		Vista: AceCatVersionArticuloVw
--*Autor:		TiGeneraScriptVistaProc - DCSJABARRONH
--*Fecha:		Mar  7 2013 11:34AM
--*Objetivo:	Gerar la vista para una tabla especifica
--*Entrada:
--*Salida:
--*Precondiciones:
--*Revisiones:
--*----	
 
CREATE VIEW [dbo].[AceCatVersionArticuloVw]
as
Select	ClaUbicacion,
		ClaArticulo,
		ClaVersionArticulo,
		NomVersionArticulo,
		ClaTipoVersionArticulo,
		ClaUnidad,
		PesoTeoricoKgs,
		SepPuntaColaSeg,
		VelocidadMtsSeg,
		ClaveAutomatizacion,
		EsProducidaEnDeacero,
		EsLocal,
		FactorCubicaje,
		BajaLogica,
		FechaBajaLogica,
		FechaUltimaMod,
		NombrePcMod,
		ClaUsuarioMod
From	dbo.AceCatVersionArticulo (NOLOCK)
 
-------------
--*** FIN ***
-------------

GO
/****** Object:  View [dbo].[AceCatVersionVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
Create View [dbo].[AceCatVersionVw]  AS 
SELECT  
	ClaArticulo,
	ClaVersion,
	ClaUbicacion,
	VersionDesc,
	ClaUnidad,
	ClaTipoVersion,
	PesoTeorico,
	VelMtsSeg,
	SepPyCSeg,
	EsDeacero,
	EsLocal,
	FactorCubicaje,
	NumPiezasSubAtado,
	NumSubAtadoXAtado,
	ClaEquivalenciaScada,
	Densidad,
	ClaOrigen,
	ClaveAutomatizacion,
	BajaLogica,
	ClaUsuarioIns,
	ClaUsuarioMod,
	FechaIns,
	FechaUltimaMod,
	NombrePcMod
FROM  TiCatalogo.dbo.AceCatVersion

GO
/****** Object:  View [dbo].[AceCfgProgConfiguracionVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
 
Create view [dbo].[AceCfgProgConfiguracionVw]	AS
Select  
	 ClaUbicacion         ,
	 ClaConfiguracion     ,
	 NombreConfiguracion  ,
	 Aplica               ,
	 valor1               ,
	 valor2               ,
	 valor3               ,
	 string1              ,
	 string2              ,
	 string3              ,
	 numero1              ,
	 numero2              ,
	 numero3              ,
	 ConfUsuario          ,
	 ClaUsuarioIns        ,
	 ClaUsuarioMod        ,
	 FechaIns             ,
	 FechaUltimaMod       ,
	 NombrePcMod          
From	dbo.AceCfgProgConfiguracion    With(nolock)

GO
/****** Object:  View [dbo].[AceCTraMatrizCambioDetVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
Create View [dbo].[AceCTraMatrizCambioDetVw]  AS 
SELECT  
	ClaUbicacion,
	ClaTipoMatriz,
	ClaTipoMatrizCambio,
	ClaOrigen,
	ClaDestino,
	Costo,
	Tiempo,
	BajaLogica,
	ClaUsuarioIns,
	ClaUsuarioMod,
	FechaIns,
	FechaUltimaMod,
	NombrePcMod
FROM  TiCatalogo.dbo.AceCTraMatrizCambioDet

GO
/****** Object:  View [dbo].[AceCTraMatrizCambioEncVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
Create View [dbo].[AceCTraMatrizCambioEncVw]  AS 
SELECT  
	ClaUbicacion,
	ClaTipoMatriz,
	ClaTipoMatrizCambio,
	NomMatrizCambio,
	EsDefault,
	BajaLogica,
	ClaUsuarioIns,
	ClaUsuarioMod,
	FechaIns,
	FechaUltimaMod,
	NombrePcMod
FROM  TiCatalogo.dbo.AceCTraMatrizCambioEnc

GO
/****** Object:  View [dbo].[AceRelEspecificacionElementoVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[AceRelEspecificacionElementoVw]
	AS 
SELECT [ClaGrado]
      ,[ClaEspecificacionQuimica]
      ,[ClaElementoQuimico]
      ,[ValorMin]
      ,[ValorMax]
      ,[Formula]
      ,[EsDesviacion]
      ,[FechaUltimaMod]
      ,[NombrePcMod]
      ,[ClaUsuarioMod]
  FROM [dbo].[AceRelEspecificacionElemento]  WITH (NOLOCK)

GO
/****** Object:  View [dbo].[AceTmpCalProductoVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

 
/*************************		AceTmpCalProductoVw		*********************************/
CREATE VIEW [dbo].[AceTmpCalProductoVw]
AS
SELECT  ClaCalProducto, 
        ClaProductoPlanta ,
        ClaProductoVentas ,
        ClaAlmacen ,
        ClaGrupoCosteo ,
        ClaFamilia ,
        ClaCalibre ,
        ClaGrado ,
        DescProducto ,
        KgMetro ,
        ClaTipoLongitudVarilla ,
        KgMetroAlambron ,
        PesoTeorico ,
        ClaUnidad ,
        ControlPorLote ,
        Activo ,
        Cuna ,
        TipoProducto ,
        FolioSolicitud ,
        ClaFamiliaVentas ,
        FactorCubicaje ,
        ClaSubfamilia ,
        PesoTeoricoVenta ,
        ClaGrupoEstadistico ,
        TipoEntsal ,
        ClaUnidadVentas ,
        Construccion ,
        ClaFamiliaProducir ,
        ClaFamiliaDesperdicio ,
        MatCorte ,
        ClaUsuarioIns ,
        ClaUsuarioMod ,
        FechaIns ,
        FechaUltimaMod ,
        NombrePc ,
        ClaGrupoProduccion ,
        FolioSincro ,
        NombreCorto,
		BajaLogica, 
		FechaBajaLogica
FROM  dbo.AceTmpCalProducto
 
 

GO
/****** Object:  View [dbo].[AceTmpEspecificacionMecanicaVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/**********************************************************************************************/
CREATE VIEW [dbo].[AceTmpEspecificacionMecanicaVw]
AS
SELECT ClaGrado ,
        Observaciones ,
        MinRt ,
        MaxRt ,
        MinRa ,
        MaxRa ,
        MinEl ,
        MaxEl ,
        MinFl ,
        MaxFl ,
        ClaUsuarioIns ,
        ClaUsuarioMod ,
        FechaIns ,
        FechaUltimaMod ,
        NombrePc ,
        ClaEspecificacionMecanica ,
        FechaInicioConfiguracion ,
        FolProducto
FROM  [dbo].[AceTmpEspecificacionMecanica]
 
 

GO
/****** Object:  View [dbo].[AceTmpEspecificacionTensionVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

 
/****** Object:  View [dbo].[AceTmpEspecificacionMecanicaVw]    Script Date: 02/28/2012 10:46:06 ******/
/**********************************************************************************************/
CREATE VIEW [dbo].[AceTmpEspecificacionTensionVw]
AS
SELECT  ClaArticulo,
        MinRt,
        MaxRt,
        ClaPlanta,
		ClaUsuarioIns,
		ClaUsuarioMod,
		FechaIns,
		FechaUltimaMod,
		NombrePcMod
FROM  dbo.AceTmpEspecificacionTension
 
 

GO
/****** Object:  View [dbo].[AceTmpPresentacionVarillaVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

 
/**********************************************************************************************/
CREATE VIEW [dbo].[AceTmpPresentacionVarillaVw]
AS
SELECT  ClaPresentacionVarilla,
		DescPresentacionVarilla,
		Activo,
		ClaveAutomatizacion,
		ClaVarillaLongitud,
		ClaVarillaPrePresentacion,
		ClaUsuarioIns,
		ClaUsuarioMod,
		FechaIns,
		FechaUltimaMod,
		NombrePcMod
FROM  dbo.AceTmpPresentacionVarilla
 
 

GO
/****** Object:  View [dbo].[AcuCTraAcuerdoDetVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-------------------------------------------------------------------------------------
/*----
Objeto:				AcuCTraAcuerdoVw
Autor:				EMDEOSIO
Fecha:				05/01/2010
Objetivo:			Generar la vista para una tabla especifica
Modificacion:		----------------------------------
Fecha Ultima Modificacion:	--------------------------
Modifica:			----------------------------------
*/	
CREATE VIEW [dbo].[AcuCTraAcuerdoDetVw]      
AS      
SELECT     ClaAcuerdo,     
     ClaArticulo,     
     ClaUbicacion,     
     DiasPlanta,     
     DiasEmbarque,     
     PrecioNeto,     
     ClaUnidad,     
     BajaLogica,     
     FechaBajaLogica,     
     FechaUltimaMod,       
     NombrePcMod,     
     ClaUsuarioMod  
FROM      dbo.AcuTraAcuerdoDet  

GO
/****** Object:  View [dbo].[AcuRelAcuerdoUbicacionVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE VIEW [dbo].[AcuRelAcuerdoUbicacionVw]
AS
SELECT     ClaAcuerdo, ClaUbicacion, BajaLogica, FechaBajaLogica, FechaUltimaMod, ClaUsuarioMod, NombrePcMod
FROM         dbo.AcuRelAcuerdoUbicacion



GO
/****** Object:  View [dbo].[AcuTraAcuerdoDetVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*----    
Objeto:    AcuTraAcuerdoVw    
Autor:    EMDEOSIO    
Fecha:    05/01/2010    
Objetivo:   Generar la vista para una tabla especifica    
Modificacion:  ----------------------------------    
Fecha Ultima Modificacion: --------------------------    
Modifica:   ----------------------------------    
*/     
CREATE VIEW [dbo].[AcuTraAcuerdoDetVw]          
AS          
SELECT     ClaAcuerdo,         
     ClaArticulo,         
     ClaUbicacion,  
     ClaveArticulo,         
     DiasPlanta,         
     DiasEmbarque,         
     PrecioNeto,         
     ClaUnidad,         
     BajaLogica,         
     FechaBajaLogica,         
     FechaUltimaMod,           
     NombrePcMod,         
     ClaUsuarioMod      
FROM      dbo.AcuTraAcuerdoDet 


GO
/****** Object:  View [dbo].[AcuTraAcuerdoVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[AcuTraAcuerdoVw]  
AS  
SELECT     ClaAcuerdo, NomAcuerdo, ClaCUP, ClaProveedor, ClaTipoProveedor, Objetivo, DescAcuerdo, DescPenal, CalidadEspecif, SoporteTecnico, Garantias, ConveniosRelac,   
                      Comentarios, Descuento, ClaPaisOrigenProveedor, DiasPlazoPago, NomResponsable, FechaInicio, FechaTermino, ClaMoneda, ClaIncoterm, BajaLogica,   
                      FechaBajaLogica, FechaUltimaMod, ClaUsuarioMod, NombrePcMod  
FROM         dbo.AcuTraAcuerdo  



GO
/****** Object:  View [dbo].[AfTraProyectoVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE VIEW [dbo].[AfTraProyectoVw]
as
SELECT ClaEmpresa
	,IdProyecto
	,ClaDireccion
	,NombreProyecto
	,ClaEstatus
	,BajaLogica
	,FechaBajaLogica
	,FechaUltimaMod
	,ClaUsuarioMod
	,NombrePcMod
FROM dbo.AfTraProyecto WITH (NOLOCK)

GO
/****** Object:  View [dbo].[AgCatDiasTransitoVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--*----
--*Objeto:		Vista: AgCatDiasTransitoVw
--*Autor:		SChavez
--*Fecha:		18 ENE 2011
--*Objetivo:	Generar la vista para tabla AgCatDiasTransito
--*Entrada:
--*Salida:
--*Precondiciones:
--*Revisiones:
--*----	



CREATE VIEW [dbo].[AgCatDiasTransitoVw]
AS
SELECT	ClaUbicacionOrigen,
		ClaUbicacionDestino,
		DiasTransito,
		BajaLogica,
		FechaBajaLogica,
		NombrePcMod,
		FechaUltimaMod,
		ClaUsuarioMod,
		FechaIns,
		ClaUsuarioIns
FROM	TiCatalogo.dbo.AgCatDiasTransito WITH (NOLOCK)

-------------
--*** FIN ***
-------------


GO
/****** Object:  View [dbo].[AgCatTecnologiaExclusivaVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--*----
--*Objeto:		Vista: AgCatTecnologiaExclusivaVw
--*Autor:		TiGeneraScriptVistaProc - DCSHGARCIALAP
--*Fecha:		Feb 16 2010  8:19AM
--*Objetivo:	Generar la vista para tabla ArtCatGpoUnidad
--*Entrada:
--*Salida:
--*Precondiciones:
--*Revisiones:
--*----	

CREATE VIEW [dbo].[AgCatTecnologiaExclusivaVw]
AS
	SELECT	ClaArticulo,
			ClaUbicacion,
			ClaUbicacionElabora,
			ClaFamilia,
			ClaSubfamilia,
			DiasTransito,
			Multiplo,
			FechaUltimaMod,
			NombrePcMod,
			ClaUsuarioMod,
			FechaIns,
			ClaUsuarioIns,
			BajaLogica,
			FechaBajaLogica
FROM	TiCatalogo.dbo.AgCatTecnologiaExclusiva WITH (NOLOCK)

-------------
--*** FIN ***
-------------


GO
/****** Object:  View [dbo].[AlmCTraCostoPromMesArticuloVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*----    
Objeto:    AlmCTraCostoPromMesArticuloVw    
Autor:    EMDEOSIO    
Fecha:    05/01/2010    
Objetivo:   Generar la vista para una tabla especifica    
Modificacion:  ----------------------------------    
Fecha Ultima Modificacion: --------------------------    
Modifica:   ----------------------------------    
*/     
CREATE VIEW [dbo].[AlmCTraCostoPromMesArticuloVw]      
as      
select     
 ClaUbicacion,       
 ClaArticulo,       
 AnioMes,       
 PrecioMn,    
 BajaLogica,    
 FechaBajaLogica,    
 FechaUltimaMod,    
 NombrePcMod,    
 ClaUsuarioMod    
from       ticatalogo.dbo.AlmTraCostoPromMesArticulo 


GO
/****** Object:  View [dbo].[AlmRelAfectaSubdeptoVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
      
        
CREATE VIEW [dbo].[AlmRelAfectaSubdeptoVw] AS         
        
SELECT  ClaUbicacion,         
   ClaDepartamento,         
   ClaSubDepartamento ,         
   ClaProyecto,         
   ClaCRC,         
   ClaGrupoAsignacion,         
   ClaDireccion,         
   ClaClasificacionCuenta,         
   BajaLogica,           
   FechaBajaLogica,         
   FechaUltimaMod,         
   ClaUsuarioMod,         
   NombrePcMod          
FROM        dbo.AlmRelAfectaSubDepto 
GO
/****** Object:  View [dbo].[AlmTraDiaCierreVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
FECHA: 		2012-10-03
AUTOR:		EMDEOSIO
COMENTARIOS:	Vista que se expondrá para revisar a los sistemas NET 
		la fecha de cierre en el SII de Almacen Legacy
*/
CREATE VIEW [dbo].[AlmTraDiaCierreVw]
AS SELECT 
ClaUbicacion,
AnioMes,
FechaCierre,
BajaLogica,
FechaBajaLogica,
FechaUltimaMod,
NombrePcMod
	
FROM 
	dbo.AlmTraDiaCierre

GO
/****** Object:  View [dbo].[AmpCatProveedorLegacyVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[AmpCatProveedorLegacyVw] 
AS
SELECT	ClaUbicacion,
	ClaProveedor,
	ClaTipoProveedor,
	NomProveedor,
	Direccion,
	Poblacion,
	ClaCup,
	BajaLogica,
	FechaBajaLogica,
	FechaUltimaMod,
	ClaUsuarioMod,
	NombrePcMod,
	ClaMoneda,
	ApellidoPaterno,
	ApellidoMaterno,
	EsCuentaIndustrial,
	EsMaterialIndexado,
	EsRollOff,
	ClaCupProveedorEntrega,
	ClaPlaza,
	ClaDivision,
	ClaRegion,
	ClaZonaFacturacion,
	ClaZona,
	ClaEsquemaProveedor,
	ClaClasifProveedor,
	MotivoEliminacion
FROM	AmpCatProveedorLegacy

GO
/****** Object:  View [dbo].[AmpCatProveedorVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[AmpCatProveedorVw] 
AS
SELECT	ClaUbicacion,
	ClaProveedor,
	ClaTipoProveedor,
	NomProveedor,
	Direccion,
	Poblacion,
	ClaCup,
	BajaLogica,
	FechaBajaLogica,
	FechaUltimaMod,
	ClaUsuarioMod,
	NombrePcMod,
	ClaMoneda,
	ApellidoPaterno,
	ApellidoMaterno,
	EsCuentaIndustrial,
	EsMaterialIndexado,
	EsRollOff,
	ClaCupProveedorEntrega,
	ClaPlaza,
	ClaDivision,
	ClaRegion,
	ClaZonaFacturacion,
	ClaZona,
	ClaEsquemaProveedor,
	ClaClasifProveedor,
	MotivoEliminacion
FROM	AmpCatProveedor

GO
/****** Object:  View [dbo].[AmpCatVehiculoVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[AmpCatVehiculoVw] 
AS
SELECT	ClaUbicacion,
	ClaVehiculo,
	Placas,
	ClaTransportista,
	ClaProveedor,
	EsTransportistaProv,
	BajaLogica,
	FechaUltimaMod,
	ClaUsuarioMod,
	NombrePcMod,
	FechaBajaLogica,
	ClaTransporte
FROM	AmpCatVehiculo

GO
/****** Object:  View [dbo].[ArtCatAgrupadoresCostoIntVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--*----
--*Objeto:		Vista: ArtCatAgrupadoresCostoIntVw
--*Autor:		JAHS
--*Fecha:		Dec 30 2012  2:29AM
--*Objetivo:	Generar la vista para tabla ArtCatAgrupadoresCostoInt
--*Entrada:
--*Salida:
--*Precondiciones:
--*Revisiones:
--*----	

CREATE VIEW [dbo].[ArtCatAgrupadoresCostoIntVw] AS

SELECT     ClaAgrupador,
           ClaveAgrupador,
           NomAgrupador,
           BajaLogica,
           FechaBajaLogica,
           FechaUltimaMod,
           ClaUsuarioMod,
           NombrePcMod,
	   ClaFamilia
FROM       dbo.ArtCatAgrupadoresCostoInt WITH (NOLOCK)


GO
/****** Object:  View [dbo].[ArtCatArticuloAceVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--*----
--*Objeto:		Vista: ArtCatArticuloAceVw
--*Autor:		CJMT
--*Fecha:		Dic 05
--*Objetivo:	Generar la vista para tabla ArtCatArticuloAce
--*Entrada:
--*Salida:
--*Precondiciones:
--*Revisiones:
--*----	

CREATE VIEW [dbo].[ArtCatArticuloAceVw]
	AS 
SELECT [ClaArticulo]
      ,[ClaTipoInventario]
      ,[ClaGrado]
      ,[ClaGrupoProduccion]
      ,[KgMetro]
      ,[ClaFamiliaUso]
      ,[ClaFamiliaDesperdicio]
      ,[EsCuna]
      ,[ClaAlmacen]
      ,[EsControlLote]
      ,[BajaLogica]
      ,[FechaBajaLogica]
      ,[FechaUltimaMod]
      ,[NombrePcMod]
      ,[ClaUsuarioMod]
  FROM [dbo].[ArtCatArticuloAce]   WITH (NOLOCK)

-------------
--*** FIN ***
-------------


GO
/****** Object:  View [dbo].[ArtCatCaracteristicaVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--*----
--*Objeto:		Vista: ArtCatCaracteristicaVw
--*Autor:		TiGeneraScriptVistaProc - DCSHGARCIALAP
--*Fecha:		Feb 16 2010  8:12AM
--*Objetivo:	Generar la vista para tabla ArtCatCaracteristica
--*Entrada:
--*Salida:
--*Precondiciones:
--*Revisiones:
--*----	

CREATE VIEW [dbo].[ArtCatCaracteristicaVw]
AS
SELECT	ClaTipoInventario,
		ClaCaracteristica,
		NomCaracteristica,
		NomCaracteristicaIngles,
		NomCaracteristicaOtroIdioma,
		ClaTipoCaracteristica,
		EsPorUbicacion,
		Separador,
		Observaciones,
		BajaLogica,
		FechaBajaLogica,
		FechaUltimaMod,
		NombrePcMod,
		ClaUsuarioMod,
		ClaGrupoCaracteristica
FROM	TiCatalogo.dbo.ArtCatCaracteristica WITH (NOLOCK)

-------------
--*** FIN ***
-------------


GO
/****** Object:  View [dbo].[ArtCatClasifGeneralVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[ArtCatClasifGeneralVw]
AS   
SELECT	ClaTipoInventario,
		ClaClasifGeneral,
		NomClasifGeneral,
		NomClasifGeneralIngles,
		NomClasifGeneralOtroIdioma,
		BajaLogica,
		FechaBajaLogica,
		FechaUltimaMod,
		NombrePcMod,
		ClaUsuarioMod,
		ClaTipoSolicitud,
		AplicaPesoTeorico,
		AplicaUniProd,
		AplicaFactor,
		AplicaMarca,
		EsMaquinado
FROM	TiCatalogo.dbo.ArtCatClasifGeneral WITH (NOLOCK)

-------------
--*** FIN ***
-------------


GO
/****** Object:  View [dbo].[ArtCatClasifSolicitudArtVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--*----
--*Objeto:		Vista: ArtCatClasifSolicitudArtVw
--*Autor:		TiGeneraScriptVistaProc - DCSHGARCIALAP
--*Fecha:		Feb 16 2010  8:13AM
--*Objetivo:	Generar la vista para tabla ArtCatClasifSolicitudArt
--*Entrada:
--*Salida:
--*Precondiciones:
--*Revisiones:
--*----	

CREATE VIEW [dbo].[ArtCatClasifSolicitudArtVw]
AS
SELECT	ClaTipoInventario,
		ClaClasifSolicitudArt,
		NomClasifSolicitudArt,
		BajaLogica,
		FechaBajaLogica,
		FechaUltimaMod,
		NombrePcMod,
		ClaUsuarioMod
FROM	TiCatalogo.dbo.ArtCatClasifSolicitudArt WITH (NOLOCK)

-------------
--*** FIN ***
-------------


GO
/****** Object:  View [dbo].[ArtCatClaveCrudaVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--*----
--*Objeto:		Vista: ArtCatClaveCrudaVw
--*Autor:		TiGeneraScriptVistaProc - DCSHGARCIALAP
--*Fecha:		Feb 16 2010  8:13AM
--*Objetivo:	Generar la vista para tabla ArtCatClaveCruda
--*Entrada:
--*Salida:
--*Precondiciones:
--*Revisiones:
--*----	

CREATE VIEW [dbo].[ArtCatClaveCrudaVw]
AS
SELECT	ClaTipoInventario,
		ClaClaveCruda,
		NomClaveCruda,
		NomClaveCrudaIngles,
		NomClaveCrudaOtroIdioma,
		BajaLogica,
		FechaBajaLogica,
		FechaUltimaMod,
		NombrePcMod,
		ClaUsuarioMod
FROM	TiCatalogo.dbo.ArtCatClaveCruda WITH (NOLOCK)

-------------
--*** FIN ***
-------------


GO
/****** Object:  View [dbo].[ArtCatComplejidadVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--*----
--*Objeto:		Vista: ArtCatComplejidadVw
--*Autor:		TiGeneraScriptVistaProc - LFVERASLAP
--*Fecha:		Jun 16 2009  9:04AM
--*Objetivo:	        Gerar la vista para tabla ArtCatComplejidad
--*Entrada:
--*Salida:
--*Precondiciones:
--*Revisiones:
--*----	

CREATE VIEW [dbo].[ArtCatComplejidadVw]
AS
SELECT	ClaComplejidad,
		NomComplejidad,
		BajaLogica,
		FechaBajaLogica,
		FechaUltimaMod,
		NombrePcMod,
		ClaUsuarioMod
FROM	TiCatalogo.dbo.ArtCatComplejidad WITH (NOLOCK)

-------------
--*** FIN ***
-------------


GO
/****** Object:  View [dbo].[ArtCatConfiguracionVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--*----
--*Objeto:		Vista: ArtCatConfiguracionVw
--*Autor:		TiGeneraScriptVistaProc - DCSHGARCIALAP
--*Fecha:		Feb 16 2010  8:17AM
--*Objetivo:	Generar la vista para tabla ArtCatConfiguracion
--*Entrada:
--*Salida:
--*Precondiciones:
--*Revisiones:
--*----	

CREATE VIEW [dbo].[ArtCatConfiguracionVw]
AS
SELECT	ClaConfiguracion,
		NomConfiguracion,
		BajaLogica,
		FechaBajaLogica,
		FechaUltimaMod,
		NombrePcMod,
		ClaUsuarioMod
FROM	TiCatalogo.dbo.ArtCatConfiguracion WITH (NOLOCK)

-------------
--*** FIN ***
-------------


GO
/****** Object:  View [dbo].[ArtCatDependenciaVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--*----
--*Objeto:		Vista: ArtCatDependenciaVw
--*Autor:		TiGeneraScriptVistaProc - DCSHGARCIALAP
--*Fecha:		Feb 16 2010  8:17AM
--*Objetivo:	Generar la vista para tabla ArtCatDependencia
--*Entrada:
--*Salida:
--*Precondiciones:
--*Revisiones:
--*----	

CREATE VIEW [dbo].[ArtCatDependenciaVw]
AS
SELECT	ClaTipoInventario,
		ClaDependencia,
		NomDependencia,
		ClaCaracteristica1,
		ClaCaracteristica2,
		ClaCaracteristica3,
		ClaCaracteristica4,
		ClaCaracteristica5,
		ClaCaracteristicaDep1,
		ClaCaracteristicaDep2,
		ClaCaracteristicaDep3,
		ClaCaracteristicaDep4,
		ClaCaracteristicaDep5,
		BajaLogica,
		FechaBajaLogica,
		FechaUltimaMod,
		NombrePcMod,
		ClaUsuarioMod
FROM	TiCatalogo.dbo.ArtCatDependencia WITH (NOLOCK)

-------------
--*** FIN ***
-------------


GO
/****** Object:  View [dbo].[ArtCatEspecificaEmpaqueAceVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--*----
--*Objeto:		Vista: ArtCatEspecificaEmpaqueAceVw
--*Autor:		CJMT
--*Fecha:		Dic 05
--*Objetivo:	Generar la vista para tabla ArtCatEspecificaEmpaqueAce
--*Entrada:
--*Salida:
--*Precondiciones:
--*Revisiones:
--*----	

CREATE VIEW [dbo].[ArtCatEspecificaEmpaqueAceVw]
	AS
SELECT [ClaEspecificaEmpaqueAce]
      ,[ClaArticulo]
      ,[ClaTipoInventario]
      ,[ClaTransporte]
      ,[ClaGpoEmpaque]
      ,[ClaEmpaque]
      ,[ClaTipoEmpaque]
      ,[BajaLogica]
      ,[FechaBajaLogica]
      ,[FechaUltimaMod]
      ,[NombrePcMod]
      ,[ClaUsuarioMod]
  FROM [dbo].[ArtCatEspecificaEmpaqueAce]    WITH (NOLOCK)


-------------
--*** FIN ***
-------------


GO
/****** Object:  View [dbo].[ArtCatFamiliaAceVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--*----
--*Objeto:		Vista: ArtCatFamiliaAceVw
--*Autor:		CJMT
--*Fecha:		Dic 05
--*Objetivo:	Generar la vista para tabla ArtCatFamiliaAce
--*Entrada:
--*Salida:
--*Precondiciones:
--*Revisiones:
--*----	

CREATE  VIEW [dbo].[ArtCatFamiliaAceVw]
	AS
SELECT [ClaFamilia]
      ,[ClaTipoInventario]
	  ,[NomCorto]		
      ,[EsProducidoAcerias]
      ,[ClaveAutomatizacion]
      ,[EsCapturaGrado]
      ,[EsCapturaCalibre]
      ,[EsCapturaPresentacion]
      ,[EsCapturaDefecto]
      ,[ClaGrupoCosteo]
	  ,[EsPt]
	  ,[EsCertificado]
      ,[ClaUsuarioIns]
      ,[FechaIns]
      ,[BajaLogica]
      ,[FechaBajaLogica]
      ,[FechaUltimaMod]
      ,[NombrePcMod]
      ,[ClaUsuarioMod]
  FROM [dbo].[ArtCatFamiliaAce]   WITH (NOLOCK)


-------------
--*** FIN ***
-------------


GO
/****** Object:  View [dbo].[ArtCatFamiliaVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--*----
--*Objeto:		Vista: ArtCatFamiliaVw
--*Autor:		TiGeneraScriptVistaProc - DCSHGARCIALAP
--*Fecha:		Feb 16 2010  8:17AM
--*Objetivo:	Generar la vista para tabla ArtCatFamilia
--*Entrada:
--*Salida:
--*Precondiciones:
--*Revisiones:
--*----	

create view  [dbo].[ArtCatFamiliaVw] 
AS	
	SELECT	ClaTipoInventario,
			ClaFamilia,
			ClaveFamilia,
			NomFamilia,
			NomFamiliaIngles,
			NomFamiliaOtroIdioma,
			BajaLogica,
			FechaBajaLogica,
			FechaUltimaMod,
			NombrePcMod,
			ClaUsuarioMod,
			EsAgrupado
	FROM	TiCatalogo.dbo.ArtCatFamilia WITH (NOLOCK)
-------------
--*** FIN ***
-------------



GO
/****** Object:  View [dbo].[ArtCatFormatoSolicitudVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--*----
--*Objeto:		Vista: ArtCatFormatoSolicitudVw
--*Autor:		TiGeneraScriptVistaProc - DCSHGARCIALAP
--*Fecha:		Feb 16 2010  8:18AM
--*Objetivo:	Generar la vista para tabla ArtCatFormatoSolicitud
--*Entrada:
--*Salida:
--*Precondiciones:
--*Revisiones:
--*----	

CREATE VIEW [dbo].[ArtCatFormatoSolicitudVw]
AS
SELECT	ClaTipoInventario,
		ClaFormatoSolicitud,
		NomFormatoSolicitud,
		NomFormatoSolicitudIngles,
		NomFormatoSolicitudOtroIdioma,
		BajaLogica,
		FechaBajaLogica,
		FechaUltimaMod,
		NombrePcMod,
		ClaUsuarioMod
FROM	TiCatalogo.dbo.ArtCatFormatoSolicitud WITH (NOLOCK)

-------------
--*** FIN ***
-------------


GO
/****** Object:  View [dbo].[ArtCatGpoCosteoVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--*----
--*Objeto:		Vista: ArtCatGpoCosteoVw
--*Autor:		TiGeneraScriptVistaProc - LFVERASLAP
--*Fecha:		Jun 10 2009  4:50PM
--*Objetivo:	        Gerar la vista para tabla ArtCatGpoCosteo
--*Entrada:
--*Salida:
--*Precondiciones:
--*Revisiones:
--*----	

CREATE VIEW [dbo].[ArtCatGpoCosteoVw]
AS
SELECT	ClaTipoInventario,
		ClaGpoCosteo,
		NomGpoCosteo,
		BajaLogica,
		FechaBajaLogica,
		FechaUltimaMod,
		NombrePcMod,
		ClaUsuarioMod
FROM	TiCatalogo.dbo.ArtCatGpoCosteo WITH (NOLOCK)

-------------
--*** FIN ***
-------------

GO
/****** Object:  View [dbo].[ArtCatGpoFamiliaDetVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--*----
--*Objeto:		Vista: ArtCatGpoFamiliaDetVw
--*Autor:		TiGeneraScriptVistaProc - DCSHGARCIALAP
--*Fecha:		Oct 06 2010
--*Objetivo:	Generar la vista para tabla ArtCatGpoFamiliaDet
--*Entrada:
--*Salida:
--*Precondiciones:
--*Revisiones:
--*----	

CREATE VIEW [dbo].[ArtCatGpoFamiliaDetVw]
AS
SELECT	ClaTipoInventario,
		ClaGpoFamiliaDet,
		NomGpoFamiliaDet,
		ClaGpoFamilia,
		BajaLogica,
		FechaBajaLogica,
		FechaUltimaMod,
		NombrePcMod,
		ClaUsuarioMod
FROM	TiCatalogo.dbo.ArtCatGpoFamiliaDet WITH (NOLOCK)

-------------
--*** FIN ***
-------------


GO
/****** Object:  View [dbo].[ArtCatGpoFamiliaVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--*----
--*Objeto:		Vista: ArtCatGpoFamiliaVw
--*Autor:		TiGeneraScriptVistaProc - DCSHGARCIALAP
--*Fecha:		Oct 06 2010
--*Objetivo:	Generar la vista para tabla ArtCatGpoFamilia
--*Entrada:
--*Salida:
--*Precondiciones:
--*Revisiones:
--*----	

CREATE VIEW [dbo].[ArtCatGpoFamiliaVw]
AS
SELECT	ClaTipoInventario,
		ClaGpoFamilia,
		NomGpoFamilia,
		BajaLogica,
		FechaBajaLogica,
		FechaUltimaMod,
		NombrePcMod,
		ClaUsuarioMod
FROM	TiCatalogo.dbo.ArtCatGpoFamilia WITH (NOLOCK)

-------------
--*** FIN ***
-------------


GO
/****** Object:  View [dbo].[ArtCatGpoProcesoProdVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--*----
--*Objeto:		Vista: ArtCatGpoProcesoProdVw
--*Autor:		TiGeneraScriptVistaProc - DCSHGARCIALAP
--*Fecha:		Feb 16 2010  8:18AM
--*Objetivo:	Generar la vista para tabla ArtCatGpoProcesoProd
--*Entrada:
--*Salida:
--*Precondiciones:
--*Revisiones:
--*----	

CREATE VIEW [dbo].[ArtCatGpoProcesoProdVw]
AS
SELECT	ClaTipoInventario,
		ClaGpoProcesoProd,
		NomGpoProcesoProd,
		BajaLogica,
		FechaBajaLogica,
		FechaUltimaMod,
		NombrePcMod,
		ClaUsuarioMod
FROM	TiCatalogo.dbo.ArtCatGpoProcesoProd WITH (NOLOCK)

-------------
--*** FIN ***
-------------


GO
/****** Object:  View [dbo].[ArtCatGpoUnidadVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--*----
--*Objeto:		Vista: ArtCatGpoUnidadVw
--*Autor:		TiGeneraScriptVistaProc - DCSHGARCIALAP
--*Fecha:		Feb 16 2010  8:19AM
--*Objetivo:	Generar la vista para tabla ArtCatGpoUnidad
--*Entrada:
--*Salida:
--*Precondiciones:
--*Revisiones:
--*----	

CREATE VIEW [dbo].[ArtCatGpoUnidadVw]
AS
SELECT	ClaTipoInventario,
		ClaGpoUnidad,
		NomGpoUnidad,
		BajaLogica,
		FechaBajaLogica,
		FechaUltimaMod,
		NombrePcMod,
		ClaUsuarioMod
FROM	TiCatalogo.dbo.ArtCatGpoUnidad WITH (NOLOCK)

-------------
--*** FIN ***
-------------


GO
/****** Object:  View [dbo].[ArtCatGrupoCaracteristicaVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--*----
--*Objeto:		Vista: ArtCatGrupoCaracteristicaVw
--*Autor:		CJMT
--*Fecha:		Dic 05
--*Objetivo:	Generar la vista para tabla ArtCatGrupoCaracteristica
--*Entrada:
--*Salida:
--*Precondiciones:
--*Revisiones:
--*----	

CREATE VIEW [dbo].[ArtCatGrupoCaracteristicaVw]
AS
SELECT	ClaGrupoCaracteristica,
		Descripcion,
		BajaLogica,
		FechaBajaLogica,
		FechaUltimaMod,
		NombrePcMod,
		ClaUsuarioMod
FROM	[dbo].[ArtCatGrupoCaracteristica] WITH (NOLOCK)

-------------
--*** FIN ***
-------------


GO
/****** Object:  View [dbo].[ArtCatMarcaVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--*----
--*Objeto:		Vista: ArtCatMarcaVw
--*Autor:		TiGeneraScriptVistaProc - DCSHGARCIALAP
--*Fecha:		Feb 16 2010  8:19AM
--*Objetivo:	Generar la vista para tabla ArtCatMarca
--*Entrada:
--*Salida:
--*Precondiciones:
--*Revisiones:
--*----	

CREATE VIEW [dbo].[ArtCatMarcaVw]
AS
SELECT	ClaTipoInventario,
		ClaMarca,
		NomMarca,
		BajaLogica,
		FechaBajaLogica,
		FechaUltimaMod,
		NombrePcMod,
		ClaUsuarioMod
FROM	TiCatalogo.dbo.ArtCatMarca WITH (NOLOCK)

-------------
--*** FIN ***
-------------


GO
/****** Object:  View [dbo].[ArtCatMotivoAfectacionVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--*----
--*Objeto:		Vista: ArtCatMotivoAfectacionVw
--*Autor:		TiGeneraScriptVistaProc - DCSHGARCIALAP
--*Fecha:		Feb 16 2010  8:19AM
--*Objetivo:	Generar la vista para tabla ArtCatMotivoAfectacion
--*Entrada:
--*Salida:
--*Precondiciones:
--*Revisiones:
--*----	

CREATE VIEW [dbo].[ArtCatMotivoAfectacionVw]
AS
SELECT	ClaTipoInventario,
		ClaMotivoAfectacion,
		NomMotivoAfectacion,
		ClaTipoAfectacion,
		BajaLogica,
		FechaBajaLogica,
		FechaUltimaMod,
		NombrePcMod,
		ClaUsuarioMod,
		EsReservado
FROM	TiCatalogo.dbo.ArtCatMotivoAfectacion WITH (NOLOCK)
-------------
--*** FIN ***
-------------


GO
/****** Object:  View [dbo].[ArtCatNormaVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--*----
--*Objeto:		Vista: ArtCatNormaVw
--*Autor:		TiGeneraScriptVistaProc - DCSHGARCIALAP
--*Fecha:		Feb 16 2010  8:19AM
--*Objetivo:	Generar la vista para tabla ArtCatNorma
--*Entrada:
--*Salida:
--*Precondiciones:
--*Revisiones:
--*----	

CREATE VIEW [dbo].[ArtCatNormaVw]
AS
SELECT	ClaTipoInventario,
		ClaNorma,
		NomNorma,
		BajaLogica,
		FechaBajaLogica,
		FechaUltimaMod,
		NombrePcMod,
		ClaUsuarioMod
FROM	TiCatalogo.dbo.ArtCatNorma WITH (NOLOCK)

-------------
--*** FIN ***
-------------


GO
/****** Object:  View [dbo].[ArtCatPlantillaVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[ArtCatPlantillaVw]
AS  
SELECT	ClaTipoInventario,
		ClaPlantilla,
		NomPlantilla,
		NomPlantillaIngles,
		NomPlantillaOtroIdioma,
		ClaUNSPC1,
		ClaUNSPC2,
		ClaUNSPC3,
		ClaUNSPC4,
		Prefijo,
		PrefijoIngles,
		PrefijoOtroIdioma,
		EsDisponibleUso,
		BajaLogica,
		FechaBajaLogica,
		FechaUltimaMod,
		NombrePcMod,
		ClaUsuarioMod
FROM	TiCatalogo.dbo.ArtCatPlantilla WITH (NOLOCK)

-------------
--*** FIN ***
-------------


GO
/****** Object:  View [dbo].[ArtCatPrefijoClaveVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--*----
--*Objeto:		Vista: ArtCatPrefijoClaveVw
--*Autor:		TiGeneraScriptVistaProc - DCSHGARCIALAP
--*Fecha:		Feb 16 2010  8:20AM
--*Objetivo:	Generar la vista para tabla ArtCatPrefijoClave
--*Entrada:
--*Salida:
--*Precondiciones:
--*Revisiones:
--*----	

CREATE VIEW [dbo].[ArtCatPrefijoClaveVw]
AS
SELECT	ClaTipoInventario,
		ClaPrefijoClave,
		NomPrefijoClave,
		Prefijo,
		Folio,
		BajaLogica,
		FechaBajaLogica,
		FechaUltimaMod,
		NombrePcMod,
		ClaUsuarioMod,
		ClaveAutomaticaSN,
		FolioInicial,
		FolioFinal
FROM	TiCatalogo.dbo.ArtCatPrefijoClave WITH (NOLOCK)

-------------
--*** FIN ***
-------------


GO
/****** Object:  View [dbo].[ArtCatPreguntaSolicitudVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--*----
--*Objeto:		Vista: ArtCatPreguntaSolicitudVw
--*Autor:		TiGeneraScriptVistaProc - DCSHGARCIALAP
--*Fecha:		Feb 16 2010  8:20AM
--*Objetivo:	Generar la vista para tabla ArtCatPreguntaSolicitud
--*Entrada:
--*Salida:
--*Precondiciones:
--*Revisiones:
--*----	

CREATE VIEW [dbo].[ArtCatPreguntaSolicitudVw]
AS
SELECT	ClaTipoInventario,
		ClaPreguntaSolicitud,
		NomPreguntaSolicitud,
		NomPreguntaSolicitudIngles,
		NomPreguntaSolicitudOtroIdioma,
		ClaTipoPregunta,
		ClaSeccionSolicitud,
		BajaLogica,
		FechaBajaLogica,
		FechaUltimaMod,
		NombrePcMod,
		ClaUsuarioMod
FROM	TiCatalogo.dbo.ArtCatPreguntaSolicitud WITH (NOLOCK)

-------------
--*** FIN ***
-------------


GO
/****** Object:  View [dbo].[ArtCatProteccionEmpaqueVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--*----
--*Objeto:		Vista: ArtCatProteccionEmpaqueVw
--*Autor:		TiGeneraScriptVistaProc - DCSHGARCIALAP
--*Fecha:		Feb 16 2010  8:12AM
--*Objetivo:	Generar la vista para tabla ArtCatProteccionEmpaque
--*Entrada:
--*Salida:
--*Precondiciones:
--*Revisiones:
--*----	

CREATE VIEW [dbo].[ArtCatProteccionEmpaqueVw]
AS
SELECT	ClaTipoInventario,
		ClaProteccionEmpaque,
		NomProteccionEmpaque,
		BajaLogica,
		FechaBajaLogica,
		FechaUltimaMod,
		NombrePcMod,
		ClaUsuarioMod
FROM	TiCatalogo.dbo.ArtCatProteccionEmpaque WITH (NOLOCK)

-------------
--*** FIN ***
-------------


GO
/****** Object:  View [dbo].[ArtCatSeccionCmbPreguntasVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
-- select * from [dbo].ArtCatSeccionCmbPreguntasVw

create View [dbo].[ArtCatSeccionCmbPreguntasVw]
as
Select	ClaSeccionSolicitud,
		NomSeccionSolicitud,
		SolicitudDesarrolloSN,
		BajaLogica,
		FechaBajaLogica,
		FechaUltimaMod,
		NombrePcMod,
		ClaUsuarioMod
From	TiCatalogo.dbo.ArtCatSeccionSolicitud
Where	SolicitudDesarrolloSN=1


GO
/****** Object:  View [dbo].[ArtCatSeccionSolicitudVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--*----
--*Objeto:		Vista: ArtCatSeccionSolicitudVw
--*Autor:		TiGeneraScriptVistaProc - DCSHGARCIALAP
--*Fecha:		Feb 16 2010  8:20AM
--*Objetivo:	Generar la vista para tabla ArtCatSeccionSolicitud
--*Entrada:
--*Salida:
--*Precondiciones:
--*Revisiones:
--*----	

CREATE VIEW [dbo].[ArtCatSeccionSolicitudVw]
AS
SELECT	ClaSeccionSolicitud,
		NomSeccionSolicitud,
		SolicitudDesarrolloSN,
		BajaLogica,
		FechaBajaLogica,
		FechaUltimaMod,
		NombrePcMod,
		ClaUsuarioMod
FROM	TiCatalogo.dbo.ArtCatSeccionSolicitud WITH (NOLOCK)

-------------
--*** FIN ***
-------------


GO
/****** Object:  View [dbo].[ArtCatSubfamiliaVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--*----
--*Objeto:		Vista: ArtCatSubfamiliaVw
--*Autor:		TiGeneraScriptVistaProc - DCSHGARCIALAP
--*Fecha:		Feb 16 2010  8:21AM
--*Objetivo:	Generar la vista para tabla ArtCatSubfamilia
--*Entrada:
--*Salida:
--*Precondiciones:
--*Revisiones:
--*----	

CREATE VIEW [dbo].[ArtCatSubfamiliaVw]
AS
SELECT	ClaTipoInventario,
		ClaFamilia,
		ClaSubfamilia,
		ClaveSubfamilia,
		NomSubfamilia,
		NomSubfamiliaIngles,
		NomSubfamiliaOtroIdioma,
		BajaLogica,
		FechaBajaLogica,
		FechaUltimaMod,
		NombrePcMod,
		ClaUsuarioMod
FROM	TiCatalogo.dbo.ArtCatSubfamilia WITH (NOLOCK)

-------------
--*** FIN ***
-------------


GO
/****** Object:  View [dbo].[ArtCatTipoAfectacionVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--*----
--*Objeto:		Vista: ArtCatTipoAfectacionVw
--*Autor:		TiGeneraScriptVistaProc - DCSHGARCIALAP
--*Fecha:		Feb 16 2010  8:21AM
--*Objetivo:	Generar la vista para tabla ArtCatTipoAfectacion
--*Entrada:
--*Salida:
--*Precondiciones:
--*Revisiones:
--*----	

CREATE VIEW [dbo].[ArtCatTipoAfectacionVw]
AS
SELECT	ClaTipoAfectacion,
		NomTipoAfectacion,
		BajaLogica,
		FechaBajaLogica,
		FechaUltimaMod,
		NombrePcMod,
		ClaUsuarioMod
FROM	TiCatalogo.dbo.ArtCatTipoAfectacion WITH (NOLOCK)

-------------
--*** FIN ***
-------------


GO
/****** Object:  View [dbo].[ArtCatTipoArticuloVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--*----
--*Objeto:		Vista: ArtCatTipoArticuloVw
--*Autor:		TiGeneraScriptVistaProc - DCSHGARCIALAP
--*Fecha:		Feb 16 2010  8:21AM
--*Objetivo:	Generar la vista para tabla ArtCatTipoArticulo
--*Entrada:
--*Salida:
--*Precondiciones:
--*Revisiones:
--*----	

CREATE VIEW [dbo].[ArtCatTipoArticuloVw]
AS
SELECT	ClaTipoInventario,
		ClaTipoArticulo,
		NomTipoArticulo,
		BajaLogica,
		FechaBajaLogica,
		FechaUltimaMod,
		NombrePcMod,
		ClaUsuarioMod
FROM	TiCatalogo.dbo.ArtCatTipoArticulo WITH (NOLOCK)

-------------
--*** FIN ***
-------------


GO
/****** Object:  View [dbo].[ArtCatTipoCaracteristicaVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--*----
--*Objeto:		Vista: ArtCatTipoCaracteristicaVw
--*Autor:		TiGeneraScriptVistaProc - DCSHGARCIALAP
--*Fecha:		Feb 16 2010  8:22AM
--*Objetivo:	Generar la vista para tabla ArtCatTipoCaracteristica
--*Entrada:
--*Salida:
--*Precondiciones:
--*Revisiones:
--*----	

CREATE VIEW [dbo].[ArtCatTipoCaracteristicaVw]
AS
SELECT	ClaTipoCaracteristica,
		NomTipoCaracteristica,
		BajaLogica,
		FechaBajaLogica,
		FechaUltimaMod,
		NombrePcMod,
		ClaUsuarioMod
FROM	TiCatalogo.dbo.ArtCatTipoCaracteristica WITH (NOLOCK)

-------------
--*** FIN ***
-------------


GO
/****** Object:  View [dbo].[ArtCatTipoCodigoBarVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--*----
--*Objeto:		Vista: ArtCatTipoCodigoBarVw
--*Autor:		TiGeneraScriptVistaProc - DCSHGARCIALAP
--*Fecha:		Feb 16 2010  8:22AM
--*Objetivo:	Generar la vista para tabla ArtCatTipoCodigoBar
--*Entrada:
--*Salida:
--*Precondiciones:
--*Revisiones:
--*----	

CREATE VIEW [dbo].[ArtCatTipoCodigoBarVw]
AS
SELECT	ClaTipoInventario,
		ClaTipoCodigoBar,
		NomTipoCodigoBar,
		BajaLogica,
		FechaBajaLogica,
		FechaUltimaMod,
		NombrePcMod,
		ClaUsuarioMod
FROM	TiCatalogo.dbo.ArtCatTipoCodigoBar WITH (NOLOCK)

-------------
--*** FIN ***
-------------


GO
/****** Object:  View [dbo].[ArtCatTipoPreguntaVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--*----
--*Objeto:		Vista: ArtCatTipoPreguntaVw
--*Autor:		TiGeneraScriptVistaProc - DCSHGARCIALAP
--*Fecha:		Feb 16 2010  8:22AM
--*Objetivo:	Generar la vista para tabla ArtCatTipoPregunta
--*Entrada:
--*Salida:
--*Precondiciones:
--*Revisiones:
--*----	

CREATE VIEW [dbo].[ArtCatTipoPreguntaVw]
AS
SELECT	ClaTipoPregunta,
		NomTipoPregunta,
		BajaLogica,
		FechaBajaLogica,
		FechaUltimaMod,
		NombrePcMod,
		ClaUsuarioMod
FROM	TiCatalogo.dbo.ArtCatTipoPregunta WITH (NOLOCK)

-------------
--*** FIN ***
-------------


GO
/****** Object:  View [dbo].[ArtCatTipoSolicitudVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--*----
--*Objeto:		Vista: ArtCatTipoSolicitudVw
--*Autor:		TiGeneraScriptVistaProc - DCSHGARCIALAP
--*Fecha:		Feb 16 2010  8:22AM
--*Objetivo:	Generar la vista para tabla ArtCatTipoSolicitud
--*Entrada:
--*Salida:
--*Precondiciones:
--*Revisiones:
--*----	

CREATE VIEW [dbo].[ArtCatTipoSolicitudVw]
AS
SELECT	ClaTipoSolicitud,
		NomTipoSolicitud,
		BajaLogica,
		FechaBajaLogica,
		FechaUltimaMod,
		NombrePcMod,
		ClaUsuarioMod
FROM	TiCatalogo.dbo.ArtCatTipoSolicitud WITH (NOLOCK)

-------------
--*** FIN ***
-------------


GO
/****** Object:  View [dbo].[ArtCatUnidadVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ArtCatUnidadVw]
AS  
SELECT	ClaTipoInventario,
		ClaUnidad,
		NomUnidad,
		NomCortoUnidad,
		BajaLogica,
		FechaBajaLogica,
		FechaUltimaMod,
		NombrePcMod,
		ClaUsuarioMod,
		ClaGpoUnidad,
		EsUniBase,
		EsUniProd,
		EsUniCaract,
		EsUniConversion,
		NomCortoUnidadIngles,
		NomCortoUnidadOtroIdioma
 FROM	TiCatalogo.dbo.ArtCatUnidad WITH (NOLOCK)
GO
/****** Object:  View [dbo].[ArtCatUNSPC1Vw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[ArtCatUNSPC1Vw]
AS  
SELECT	ClaUNSPC1,
		Codigo,	
		NomUNSPC1,
		NomUNSPC1Ingles,
		NomUNSPC1OtroIdioma,
		BajaLogica,
		FechaBajaLogica,
		FechaUltimaMod,
		NombrePcMod,
		ClaUsuarioMod
FROM	TiCatalogo.dbo.ArtCatUNSPC1 WITH (NOLOCK)

-------------
--*** FIN ***
-------------


GO
/****** Object:  View [dbo].[ArtCatUNSPC2Vw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[ArtCatUNSPC2Vw]
AS  
SELECT	ClaUNSPC1,
		ClaUNSPC2,
		Codigo,
		NomUNSPC2,
		NomUNSPC2Ingles,
		NomUNSPC2OtroIdioma,
		BajaLogica,
		FechaBajaLogica,
		FechaUltimaMod,
		NombrePcMod,
		ClaUsuarioMod
FROM	TiCatalogo.dbo.ArtCatUNSPC2 WITH (NOLOCK)

-------------
--*** FIN ***
-------------


GO
/****** Object:  View [dbo].[ArtCatUNSPC3Vw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[ArtCatUNSPC3Vw]
AS
SELECT	ClaUNSPC1,
		ClaUNSPC2,
		ClaUNSPC3,
		Codigo,
		NomUNSPC3,
		NomUNSPC3Ingles,
		NomUNSPC3OtroIdioma,
		BajaLogica,
		FechaBajaLogica,
		FechaUltimaMod,
		NombrePcMod,
		ClaUsuarioMod
FROM	TiCatalogo.dbo.ArtCatUNSPC3 WITH (NOLOCK)

-------------
--*** FIN ***
-------------


GO
/****** Object:  View [dbo].[ArtCatUNSPC4Vw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[ArtCatUNSPC4Vw]
AS
SELECT	ClaUNSPC1,
		ClaUNSPC2,
		ClaUNSPC3,
		ClaUNSPC4,
		Codigo,
		NomUNSPC4,
		NomUNSPC4Ingles,
		NomUNSPC4OtroIdioma,
		BajaLogica,
		FechaBajaLogica,
		FechaUltimaMod,
		NombrePcMod,
		ClaUsuarioMod
FROM	TiCatalogo.dbo.ArtCatUNSPC4 WITH (NOLOCK)

-------------
--*** FIN ***
-------------


GO
/****** Object:  View [dbo].[ArtCatValorVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--*----
--*Objeto:		Vista: ArtCatValorVw
--*Autor:		TiGeneraScriptVistaProc - DCSHGARCIALAP
--*Fecha:		Feb 16 2010  8:24AM
--*Objetivo:	Generar la vista para tabla ArtCatValor
--*Entrada:
--*Salida:
--*Precondiciones:
--*Revisiones:
--*----	

CREATE VIEW [dbo].[ArtCatValorVw]
AS
SELECT	ClaTipoInventario,
		ClaCaracteristica,
		ClaValor,
		NomValor,
		NumValor,
		NumValor2,
		ClaUnidad,
		OrdenConsulta,
		EtiquetaDesc,
		EtiquetaDescIngles,
		EtiquetaDescOtroIdioma,
		BajaLogica,
		FechaBajaLogica,
		FechaUltimaMod,
		NombrePcMod,
		ClaUsuarioMod,
		RutaImagen,
		EtiquetaCertif
FROM	TiCatalogo.dbo.ArtCatValor WITH (NOLOCK)

-------------
--*** FIN ***
-------------  
GO
/****** Object:  View [dbo].[ArtCfgPermisoMostrarControlVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--*----
--*Objeto:		Vista: ArtCfgPermisoMostrarControlVw
--*Autor:		JAHS
--*Fecha:		Ene 03 2012  6:00PM
--*Objetivo:	Generar la vista para tabla ArtCfgPermisoMostrarControl
--*Entrada:
--*Salida:
--*Precondiciones:
--*Revisiones:
--*----	

CREATE VIEW [dbo].[ArtCfgPermisoMostrarControlVw] AS

SELECT     ClaveControl,
           ClaveUbicacion,
           NombreControl,
           BajaLogica,
           FechaBajaLogica,
           FechaUltimaMod,
           ClaUsuarioMod,
           NombrePcMod
FROM       dbo.ArtCfgPermisoMostrarControl WITH (NOLOCK)


GO
/****** Object:  View [dbo].[ArtRelArticuloArchivoVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--*----
--*Objeto:		Vista: ArtRelArticuloArchivoVw
--*Autor:		TiGeneraScriptVistaProc - DCSHGARCIALAP
--*Fecha:		Feb 16 2010  8:24AM
--*Objetivo:	Generar la vista para tabla ArtRelArticuloArchivo
--*Entrada:
--*Salida:
--*Precondiciones:
--*Revisiones:
--*----	

CREATE VIEW [dbo].[ArtRelArticuloArchivoVw]
AS
SELECT	ClaTipoInventario,
		ClaArticulo,
		ClaArchivo,
		RutaArchivo,
		Comentarios,
		FechaUltimaMod,
		NombrePcMod,
		ClaUsuarioMod
FROM	TiCatalogo.dbo.ArtRelArticuloArchivo WITH (NOLOCK)

-------------
--*** FIN ***
-------------


GO
/****** Object:  View [dbo].[ArtRelArticuloCarValorUbVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--*----
--*Objeto:		Vista: ArtRelArticuloCarValorUbVw
--*Autor:		TiGeneraScriptVistaProc - DCSHGARCIALAP
--*Fecha:		Feb 16 2010  8:25AM
--*Objetivo:	Generar la vista para tabla ArtRelArticuloCarValorUb
--*Entrada:
--*Salida:
--*Precondiciones:
--*Revisiones:
--*----	

CREATE VIEW [dbo].[ArtRelArticuloCarValorUbVw]
AS
SELECT	ClaTipoInventario,
		ClaArticulo,
		ClaUbicacion,
		ClaCaracteristica,
		ClaValor,
		FechaUltimaMod,
		NombrePcMod,
		ClaUsuarioMod
FROM	TiCatalogo.dbo.ArtRelArticuloCarValorUb WITH (NOLOCK)

-------------
--*** FIN ***
-------------


GO
/****** Object:  View [dbo].[ArtRelArticuloCarValorVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--*----
--*Objeto:		Vista: ArtRelArticuloCarValorVw
--*Autor:		TiGeneraScriptVistaProc - DCSHGARCIALAP
--*Fecha:		Feb 16 2010  8:25AM
--*Objetivo:	Generar la vista para tabla ArtRelArticuloCarValor
--*Entrada:
--*Salida:
--*Precondiciones:
--*Revisiones:
--*----	

CREATE VIEW [dbo].[ArtRelArticuloCarValorVw]
AS
SELECT	ClaTipoInventario,
		ClaArticulo,
		ClaCaracteristica,
		ClaValor,
		BajaLogica,
		FechaBajaLogica,
		FechaUltimaMod,
		NombrePcMod,
		ClaUsuarioMod , Certificado
FROM	TiCatalogo.dbo.ArtRelArticuloCarValor WITH (NOLOCK)

-------------
--*** FIN ***
-------------
 

GO
/****** Object:  View [dbo].[ArtRelArticuloCodigoBarVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--*----
--*Objeto:		Vista: ArtRelArticuloCodigoBarVw
--*Autor:		TiGeneraScriptVistaProc - DCSHGARCIALAP
--*Fecha:		Feb 16 2010  8:25AM
--*Objetivo:	Generar la vista para tabla ArtRelArticuloCodigoBar
--*Entrada:
--*Salida:
--*Precondiciones:
--*Revisiones:
--*----	

CREATE VIEW [dbo].[ArtRelArticuloCodigoBarVw]
AS
SELECT	ClaTipoInventario,
		ClaArticulo,
		ClaCodigoBar,
		ClaTipoEmpaque,
		ClaMaterial,
		ClaTipoCodigoBar,
		CodigoBar,
		BajaLogica,
		FechaBajaLogica,
		FechaUltimaMod,
		NombrePcMod,
		ClaUsuarioMod
FROM	TiCatalogo.dbo.ArtRelArticuloCodigoBar WITH (NOLOCK)

-------------
--*** FIN ***
-------------


GO
/****** Object:  View [dbo].[ArtRelArticuloEquivalenteVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--*----
--*Objeto:		Vista: ArtRelArticuloEquivalenteVw
--*Autor:		TiGeneraScriptVistaProc - DCSHGARCIALAP
--*Fecha:		Feb 16 2010  8:25AM
--*Objetivo:	Generar la vista para tabla ArtRelArticuloEquivalente
--*Entrada:
--*Salida:
--*Precondiciones:
--*Revisiones:
--*----	

CREATE VIEW [dbo].[ArtRelArticuloEquivalenteVw]
AS
SELECT	ClaTipoInventario1,
		ClaArticulo1,
		ClaTipoInventario2,
		ClaArticulo2,
		FactorConversion1,
		FactorConversion2,
		BajaLogica,
		FechaBajaLogica,
		FechaUltimaMod,
		NombrePcMod,
		ClaUsuarioMod
FROM	TiCatalogo.dbo.ArtRelArticuloEquivalente WITH (NOLOCK)

-------------
--*** FIN ***
-------------


GO
/****** Object:  View [dbo].[ArtRelArticuloPaisVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--*----
--*Objeto:		Vista: ArtRelArticuloPaisVw
--*Autor:		TiGeneraScriptVistaProc - DCSHGARCIALAP
--*Fecha:		Feb 16 2010  8:26AM
--*Objetivo:	Generar la vista para tabla ArtRelArticuloPais
--*Entrada:
--*Salida:
--*Precondiciones:
--*Revisiones:
--*----	

CREATE VIEW [dbo].[ArtRelArticuloPaisVw]
AS
SELECT	ClaTipoInventario,
		ClaArticulo,
		ClaPais,
		BajaLogica,
		FechaBajaLogica,
		FechaIns,
		FechaUltimaMod,
		NombrePcMod,
		ClaUsuarioMod
FROM	TiCatalogo.dbo.ArtRelArticuloPais WITH (NOLOCK)

-------------
--*** FIN ***
-------------


GO
/****** Object:  View [dbo].[ArtRelConfiguracionTipoInvVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--*----
--*Objeto:		Vista: ArtRelConfiguracionTipoInvVw
--*Autor:		TiGeneraScriptVistaProc - DCSHGARCIALAP
--*Fecha:		Feb 16 2010  8:26AM
--*Objetivo:	Generar la vista para tabla ArtRelConfiguracionTipoInv
--*Entrada:
--*Salida:
--*Precondiciones:
--*Revisiones:
--*----	

CREATE VIEW [dbo].[ArtRelConfiguracionTipoInvVw]
AS
SELECT	ClaConfiguracion,
		ClaTipoInventario,
		nValor1,
		nValor2,
		sValor1,
		sValor2,
		dValor1,
		dValor2,
		FechaUltimaMod,
		NombrePcMod,
		ClaUsuarioMod
FROM	TiCatalogo.dbo.ArtRelConfiguracionTipoInv WITH (NOLOCK)

-------------
--*** FIN ***
-------------


GO
/****** Object:  View [dbo].[ArtRelDependenciaPlantillaVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--*----
--*Objeto:		Vista: ArtRelDependenciaPlantillaVw
--*Autor:		TiGeneraScriptVistaProc - DCSHGARCIALAP
--*Fecha:		Feb 16 2010  8:27AM
--*Objetivo:	Generar la vista para tabla ArtRelDependenciaPlantilla
--*Entrada:
--*Salida:
--*Precondiciones:
--*Revisiones:
--*----	

CREATE VIEW [dbo].[ArtRelDependenciaPlantillaVw]
AS
SELECT	ClaTipoInventario,
		ClaDependencia,
		ClaPlantilla,
		FechaUltimaMod,
		NombrePcMod,
		ClaUsuarioMod
FROM	TiCatalogo.dbo.ArtRelDependenciaPlantilla WITH (NOLOCK)

-------------
--*** FIN ***
-------------


GO
/****** Object:  View [dbo].[ArtRelDependenciaValorVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--*----
--*Objeto:		Vista: ArtRelDependenciaValorVw
--*Autor:		TiGeneraScriptVistaProc - DCSHGARCIALAP
--*Fecha:		Feb 16 2010  8:27AM
--*Objetivo:	Generar la vista para tabla ArtRelDependenciaValor
--*Entrada:
--*Salida:
--*Precondiciones:
--*Revisiones:
--*----	

CREATE VIEW [dbo].[ArtRelDependenciaValorVw]
AS
SELECT	IdRelValorDependencia,
		ClaTipoInventario,
		ClaDependencia,
		ClaCaracteristica1,
		ClaValor1,
		ClaCaracteristica2,
		ClaValor2,
		ClaCaracteristica3,
		ClaValor3,
		ClaCaracteristica4,
		ClaValor4,
		ClaCaracteristica5,
		ClaValor5,
		ClaCaracteristicaDep1,
		ClaValorDep1,
		ClaCaracteristicaDep2,
		ClaValorDep2,
		ClaCaracteristicaDep3,
		ClaValorDep3,
		ClaCaracteristicaDep4,
		ClaValorDep4,
		ClaCaracteristicaDep5,
		ClaValorDep5,
		FechaUltimaMod,
		NombrePcMod,
		ClaUsuarioMod
FROM	TiCatalogo.dbo.ArtRelDependenciaValor WITH (NOLOCK)

-------------
--*** FIN ***
-------------


GO
/****** Object:  View [dbo].[ArtRelEstatusDiasPlazoVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--*----
--*Objeto:		Vista: ArtRelEstatusDiasPlazoVw
--*Autor:		TiGeneraScriptVistaProc - DCSHGARCIALAP
--*Fecha:		Feb 16 2010  8:27AM
--*Objetivo:	Generar la vista para tabla ArtRelEstatusDiasPlazo
--*Entrada:
--*Salida:
--*Precondiciones:
--*Revisiones:
--*----	

CREATE VIEW [dbo].[ArtRelEstatusDiasPlazoVw]
AS
SELECT	ClaTipoInventario,
		ClaClasifSolicitudArt,
		ClaEstatusSolicitud,
		DiasPlazo,
		FechaUltimaMod,
		NombrePcMod,
		ClaUsuarioMod
FROM	TiCatalogo.dbo.ArtRelEstatusDiasPlazo WITH (NOLOCK)

-------------
--*** FIN ***
-------------


GO
/****** Object:  View [dbo].[ArtRelEstatusSolicitudPerfilVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--*----
--*Objeto:		Vista: ArtRelEstatusSolicitudPerfilVw
--*Autor:		TiGeneraScriptVistaProc - DCSHGARCIALAP
--*Fecha:		Feb 16 2010  8:28AM
--*Objetivo:	Generar la vista para tabla ArtRelEstatusSolicitudPerfil
--*Entrada:
--*Salida:
--*Precondiciones:
--*Revisiones:
--*----	

CREATE VIEW [dbo].[ArtRelEstatusSolicitudPerfilVw]
AS
SELECT	ClaTipoInventario,
		ClaEstatusSolicitud,
		ClaPerfilUsuario,
		FechaUltimaMod,
		NombrePcMod,
		ClaUsuarioMod
FROM	TiCatalogo.dbo.ArtRelEstatusSolicitudPerfil WITH (NOLOCK)

-------------
--*** FIN ***
-------------


GO
/****** Object:  View [dbo].[ArtRelFamiliaFormatoVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--*----
--*Objeto:		Vista: ArtRelFamiliaFormatoVw
--*Autor:		TiGeneraScriptVistaProc - DCSHGARCIALAP
--*Fecha:		Feb 16 2010  8:28AM
--*Objetivo:	Generar la vista para tabla ArtRelFamiliaFormato
--*Entrada:
--*Salida:
--*Precondiciones:
--*Revisiones:
--*----	

CREATE VIEW [dbo].[ArtRelFamiliaFormatoVw]
AS
SELECT	ClaTipoInventario,
		ClaFamilia,
		ClaFormatoSolicitud,
		FechaUltimaMod,
		NombrePcMod,
		ClaUsuarioMod
FROM	TiCatalogo.dbo.ArtRelFamiliaFormato WITH (NOLOCK)

-------------
--*** FIN ***
-------------


GO
/****** Object:  View [dbo].[ArtRelFamiliaUbicacionVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--*----
--*Objeto:		Vista: ArtRelFamiliaUbicacionVw
--*Autor:		TiGeneraScriptVistaProc - DCSHGARCIALAP
--*Fecha:		Feb 16 2010  8:28AM
--*Objetivo:	Generar la vista para tabla ArtRelFamiliaUbicacion
--*Entrada:
--*Salida:
--*Precondiciones:
--*Revisiones:
--*----	

CREATE VIEW [dbo].[ArtRelFamiliaUbicacionVw]
AS
SELECT	IdRelFamiliaUbicacion,
		ClaTipoInventario,
		ClaUbicacion,
		ClaFamilia,
		ClaPrefijoClave,
		BajaLogica,
		FechaBajaLogica,
		FechaUltimaMod,
		NombrePcMod,
		ClaUsuarioMod
FROM	TiCatalogo.dbo.ArtRelFamiliaUbicacion WITH (NOLOCK)

-------------
--*** FIN ***
-------------


GO
/****** Object:  View [dbo].[ArtRelFamiliaUsuarioVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[ArtRelFamiliaUsuarioVw]
AS  
SELECT	ClaTipoInventario,
		ClaFamilia,
		ClaUsuario,
		ClaUbicacion,
		Inserta,
		Modifica,
		Autoriza,
		Revisa,
		BajaLogica,
		FechaBajaLogica,
		FechaUltimaMod,
		NombrePcMod,
		ClaUsuarioMod
	FROM	TiCatalogo.dbo.ArtRelFamiliaUsuario WITH (NOLOCK)

-------------
--*** FIN ***
-------------

GO
/****** Object:  View [dbo].[ArtRelFormatoPreguntaVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--*----
--*Objeto:		Vista: ArtRelFormatoPreguntaVw
--*Autor:		TiGeneraScriptVistaProc - DCSHGARCIALAP
--*Fecha:		Feb 16 2010  8:28AM
--*Objetivo:	Generar la vista para tabla ArtRelFormatoPregunta
--*Entrada:
--*Salida:
--*Precondiciones:
--*Revisiones:
--*----	

CREATE VIEW [dbo].[ArtRelFormatoPreguntaVw]
AS
SELECT	ClaTipoInventario,
		ClaFormatoSolicitud,
		ClaPreguntaSolicitud,
		Orden,
		FechaUltimaMod,
		NombrePcMod,
		ClaUsuarioMod
FROM	TiCatalogo.dbo.ArtRelFormatoPregunta WITH (NOLOCK)

-------------
--*** FIN ***
-------------


GO
/****** Object:  View [dbo].[ArtRelFormatoSeccionVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--*----
--*Objeto:		Vista: ArtRelFormatoSeccionVw
--*Autor:		TiGeneraScriptVistaProc - DCSHGARCIALAP
--*Fecha:		Feb 16 2010  8:29AM
--*Objetivo:	Generar la vista para tabla ArtRelFormatoSeccion
--*Entrada:
--*Salida:
--*Precondiciones:
--*Revisiones:
--*----	

CREATE VIEW [dbo].[ArtRelFormatoSeccionVw]
AS
SELECT	ClaTipoInventario,
		ClaFormatoSolicitud,
		ClaSeccionSolicitud,
		Orden,
		FechaUltimaMod,
		NombrePcMod,
		ClaUsuarioMod
FROM	TiCatalogo.dbo.ArtRelFormatoSeccion WITH (NOLOCK)

-------------
--*** FIN ***
-------------


GO
/****** Object:  View [dbo].[ArtRelGpoFamiliaDetSubfamiliaVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--*----
--*Objeto:		Vista: ArtRelGpoFamiliaDetSubfamiliaVw
--*Autor:		TiGeneraScriptVistaProc - DCSHGARCIALAP
--*Fecha:		Oct 06 2010
--*Objetivo:	Generar la vista para tabla ArtRelGpoFamiliaDetSubfamilia
--*Entrada:
--*Salida:
--*Precondiciones:
--*Revisiones:
--*----	

CREATE VIEW [dbo].[ArtRelGpoFamiliaDetSubfamiliaVw]
AS
SELECT	IdRelGpoFamiliaDetSubfamilia,
		ClaTipoInventario,
		ClaGpoFamilia,
		ClaGpoFamiliaDet,
		ClaFamilia,
		ClaSubfamilia,
		BajaLogica,
		FechaBajaLogica,
		FechaUltimaMod,
		NombrePcMod,
		ClaUsuarioMod
FROM	TiCatalogo.dbo.ArtRelGpoFamiliaDetSubfamilia WITH (NOLOCK)

-------------
--*** FIN ***
-------------


GO
/****** Object:  View [dbo].[ArtRelOrgVtaRespVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--*----
--*Objeto:		Vista: ArtRelOrgVtaRespVw
--*Autor:		TiGeneraScriptVistaProc - DCSHGARCIALAP
--*Fecha:		Feb 16 2010  8:29AM
--*Objetivo:	Generar la vista para tabla ArtRelOrgVtaResp
--*Entrada:
--*Salida:
--*Precondiciones:
--*Revisiones:
--*----	

CREATE VIEW [dbo].[ArtRelOrgVtaRespVw]
AS
SELECT	IdRelOrgVtaResp,
		ClaTipoInventario,
		ClaOrganizacionVentas,
		ClaUsuarioResponsable,
		FechaUltimaMod,
		NombrePcMod,
		ClaUsuarioMod
FROM	TiCatalogo.dbo.ArtRelOrgVtaResp WITH (NOLOCK)

-------------
--*** FIN ***
-------------


GO
/****** Object:  View [dbo].[ArtRelPlantillaCarValorVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--*----
--*Objeto:		Vista: ArtRelPlantillaCarValorVw
--*Autor:		TiGeneraScriptVistaProc - DCSHGARCIALAP
--*Fecha:		Feb 16 2010  8:29AM
--*Objetivo:	Generar la vista para tabla ArtRelPlantillaCarValor
--*Entrada:
--*Salida:
--*Precondiciones:
--*Revisiones:
--*----	

CREATE VIEW [dbo].[ArtRelPlantillaCarValorVw]
AS
SELECT	ClaTipoInventario,
		ClaPlantilla,
		ClaCaracteristica,
		ClaValor,
		BajaLogica,
		FechaBajaLogica,
		FechaUltimaMod,
		NombrePcMod,
		ClaUsuarioMod
FROM	TiCatalogo.dbo.ArtRelPlantillaCarValor WITH (NOLOCK)

-------------
--*** FIN ***
-------------


GO
/****** Object:  View [dbo].[ArtRelPlantillaCarVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[ArtRelPlantillaCarVw]
AS
SELECT	ClaTipoInventario,
		ClaPlantilla,
		ClaCaracteristica,
		EsPrincipal,
		EsRequerida,
		DefineClaveCrudaSN,
		OrdenDesc,
		OrdenDescIngles,
		OrdenDescOtroIdioma,
		OrdenCaptura,
		Separador,
		Prefijo,
		Sufijo,
		PrefijoIdioma2,
		PrefijoIdioma3,
		SufijoIdioma2,
		SufijoIdioma3,
		BajaLogica,
		FechaBajaLogica,
		FechaUltimaMod,
		NombrePcMod,
		ClaUsuarioMod
FROM	TiCatalogo.dbo.ArtRelPlantillaCar WITH (NOLOCK)

-------------
--*** FIN ***
-------------


GO
/****** Object:  View [dbo].[ArtRelPlantillaFamSubfamVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ArtRelPlantillaFamSubfamVw]
AS
SELECT	IdPlantillaFamSubfam,
		ClaTipoInventario,
		ClaPlantilla,
		ClaFamilia,
		ClaSubfamilia,
		ClaUnidadBase,
		EsPlantillaDescripcion,
		BajaLogica,
		FechaBajaLogica,
		FechaUltimaMod,
		NombrePcMod,
		ClaUsuarioMod
FROM	TiCatalogo.dbo.ArtRelPlantillaFamSubfam

-------------
--*** FIN ***
-------------


GO
/****** Object:  View [dbo].[ArtRelPlantillaFamSubfamVw_3abr2013]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO


CREATE VIEW [dbo].[ArtRelPlantillaFamSubfamVw_3abr2013]
AS
SELECT	IdPlantillaFamSubfam,
		ClaTipoInventario,
		ClaPlantilla,
		ClaFamilia,
		ClaSubfamilia,
		ClaUnidadBase,
		EsPlantillaDescripcion,
		BajaLogica,
		FechaBajaLogica,
		FechaUltimaMod,
		NombrePcMod,
		ClaUsuarioMod
FROM	TiCatalogo.dbo.ArtRelPlantillaFamSubfam WITH (NOLOCK)
WHERE	BajaLogica = 0

-------------
--*** FIN ***
-------------




GO
/****** Object:  View [dbo].[ArtRelSeccionPerfilVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--*----
--*Objeto:		Vista: ArtRelSeccionPerfilVw
--*Autor:		TiGeneraScriptVistaProc - DCSHGARCIALAP
--*Fecha:		Feb 16 2010  8:30AM
--*Objetivo:	Generar la vista para tabla ArtRelSeccionPerfil
--*Entrada:
--*Salida:
--*Precondiciones:
--*Revisiones:
--*----	

CREATE VIEW [dbo].[ArtRelSeccionPerfilVw]
AS
SELECT	ClaTipoInventario,
		ClaSeccionSolicitud,
		ClaPerfilUsuario,
		FechaUltimaMod,
		NombrePcMod,
		ClaUsuarioMod
FROM	TiCatalogo.dbo.ArtRelSeccionPerfil WITH (NOLOCK)

-------------
--*** FIN ***
-------------


GO
/****** Object:  View [dbo].[ArtRelTipoMaterialCatProductoVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[ArtRelTipoMaterialCatProductoVw]
AS
SELECT     ClaArticulo, ClaTipoMaterial, ClaUsuarioMod, FechaUltimaMod, NombrePcMod,BajaLogica
FROM         dbo.ArtRelTipoMaterialCatProducto  with (nolock)

GO
/****** Object:  View [dbo].[ArtRelTipoSolicitudPerfilVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--*----
--*Objeto:		Vista: ArtRelTipoSolicitudPerfilVw
--*Autor:		TiGeneraScriptVistaProc - DCSHGARCIALAP
--*Fecha:		Feb 16 2010  8:30AM
--*Objetivo:	Generar la vista para tabla ArtRelTipoSolicitudPerfil
--*Entrada:
--*Salida:
--*Precondiciones:
--*Revisiones:
--*----	

CREATE VIEW [dbo].[ArtRelTipoSolicitudPerfilVw]
AS
SELECT	ClaTipoInventario,
		ClaTipoSolicitud,
		ClaPerfilUsuario,
		FechaUltimaMod,
		NombrePcMod,
		ClaUsuarioMod
FROM	TiCatalogo.dbo.ArtRelTipoSolicitudPerfil WITH (NOLOCK)

-------------
--*** FIN ***
-------------


GO
/****** Object:  View [dbo].[ArtRelUbicacionRespVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--*----
--*Objeto:		Vista: ArtRelUbicacionRespVw
--*Autor:		TiGeneraScriptVistaProc - DCSHGARCIALAP
--*Fecha:		Feb 16 2010  8:31AM
--*Objetivo:	Generar la vista para tabla ArtRelUbicacionResp
--*Entrada:
--*Salida:
--*Precondiciones:
--*Revisiones:
--*----	

CREATE VIEW [dbo].[ArtRelUbicacionRespVw]
AS
SELECT	IdRelUbicacionResp,
		ClaTipoInventario,
		ClaUbicacion,
		ClaUsuarioResponsable,
		FechaUltimaMod,
		NombrePcMod,
		ClaUsuarioMod
FROM	TiCatalogo.dbo.ArtRelUbicacionResp WITH (NOLOCK)

-------------
--*** FIN ***
-------------


GO
/****** Object:  View [dbo].[ArtRelUnidadConversionVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--*----
--*Objeto:		Vista: ArtRelUnidadConversionVw
--*Autor:		TiGeneraScriptVistaProc - DCSHGARCIALAP
--*Fecha:		Feb 16 2010  8:31AM
--*Objetivo:	Generar la vista para tabla ArtRelUnidadConversion
--*Entrada:
--*Salida:
--*Precondiciones:
--*Revisiones:
--*----	

CREATE VIEW [dbo].[ArtRelUnidadConversionVw]
AS
SELECT	ClaTipoInventario,
		ClaUnidad1,
		ClaUnidad2,
		FactorConversion1,
		FactorConversion2,
		BajaLogica,
		FechaBajaLogica,
		FechaUltimaMod,
		NombrePcMod,
		ClaUsuarioMod
FROM	TiCatalogo.dbo.ArtRelUnidadConversion WITH (NOLOCK)

-------------
--*** FIN ***
-------------


GO
/****** Object:  View [dbo].[AviCatDestinatarioPreferenciaVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[AviCatDestinatarioPreferenciaVw]
AS
SELECT	ClaUsuario, ClaSistema, ClaTipoPreferencia, ClaTipoHorario, BajaLogica, FechaBajaLogica, FechaUltimaMod, NombrePcMod
FROM	dbo.AviCatDestinatarioPreferencia

GO
/****** Object:  View [dbo].[AviCatSeguridadVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[AviCatSeguridadVw]
AS
SELECT	ClaSistema, ClaTipoAviso, ClaUsuario, BajaLogica, FechaBajaLogica, FechaUltimaMod, NombrePcMod
FROM	dbo.AviCatSeguridad

GO
/****** Object:  View [dbo].[AviCatTipoAvisoDestinatarioVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[AviCatTipoAvisoDestinatarioVw]
AS
SELECT	ClaSistema, ClaTipoAviso, ClaUbicacion, ClaUsuario, EsConCopia, BajaLogica, FechaBajaLogica, FechaUltimaMod, NombrePcMod
FROM	dbo.AviCatTipoAvisoDestinatario

GO
/****** Object:  View [dbo].[AviCatTipoAvisoVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--*----
--*Objeto:		Vista: AviCatTipoAvisoVw
--*Autor:		TiGeneraScriptVistaProc - DCSHGARCIALAP
--*Fecha:		Feb 18 2010  4:27PM
--*Objetivo:	Generar la vista para tabla AviCatTipoAviso
--*Entrada:
--*Salida:
--*Precondiciones:
--*Revisiones:
--*----	

CREATE VIEW [dbo].[AviCatTipoAvisoVw]
AS
SELECT	ClaSistema,
		ClaTipoAviso,
		NombreTipoAviso,
		StoredProcedure,
		Asunto,
		TextoDefault,
		BajaLogica,
		FechaBajaLogica,
		FechaUltimaMod,
		NombrePcMod
FROM	TiCatalogo.dbo.AviCatTipoAviso WITH (NOLOCK)

-------------
--*** FIN ***
-------------


GO
/****** Object:  View [dbo].[AviCatTipoHorarioVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[AviCatTipoHorarioVw]
AS
SELECT	ClaTipoHorario, NombreTipoHorario, ClaHorario, BajaLogica, FechaBajaLogica, FechaUltimaMod, NombrePcMod
FROM	dbo.AviCatTipoHorario

GO
/****** Object:  View [dbo].[AviCatTipoPreferenciaVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[AviCatTipoPreferenciaVw]
AS
SELECT	ClaTipoPreferencia, NombreTipoPreferencia, BajaLogica, FechaBajaLogica, FechaUltimaMod, NombrePcMod
FROM	dbo.AviCatTipoPreferencia

GO
/****** Object:  View [dbo].[CalmCatCompradorVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[CalmCatCompradorVw]
AS
SELECT     ClaUbicacion, ClaComprador, NombreComprador, BajaLogica, FechaBajaLogica, FechaUltimaMod, FechaIns
FROM         dbo.CalmCatComprador


GO
/****** Object:  View [dbo].[CalmCatProveedorVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW  [dbo].[CalmCatProveedorVw]
AS
SELECT      ClaUbicacion, 
			ClaTipoProveedor, 
			RazonSocial, 
			ClaProveedor, 
			Cup, 
			ClaPais, 
			BajaLogica, 
			FechaBajaLogica, 
			FechaUltimaMod, 
			FechaIns,
			Fax,
			Contacto,
			Email,
			RazonSocialFiscal,
			AduanaSeccion,
			NomAduana,
			Patente
FROM        CalmCatProveedor

GO
/****** Object:  View [dbo].[CalmZCatUnidadCalmVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[CalmZCatUnidadCalmVw]
AS
SELECT     ClaUnidadCalm, ClaUbicacion, NombreUnidadCalm, BajaLogica, FechaBajaLogica, FechaUltimaMod, NombrePcMod, ClaUsuarioMod, FechaIns, 
           ClaUsuarioIns
FROM       CalmZCatUnidadCalm


GO
/****** Object:  View [dbo].[CexCatAduanaVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE  VIEW [dbo].[CexCatAduanaVw]
AS  SELECT ClaAduana
      ,Descripcion
	  ,DescripcionIngles
      ,DescripcionIdioma2
      ,ClaPais
      ,ClaEstado
      ,ClaCiudad
      ,BajaLogica
      ,FechaBajaLogica
      ,FechaUltimaMod
      ,ClaUsuarioMod
      ,NombrePcMod
	  ,Nombre = Descripcion
	  ,EsExtranjero
  FROM dbo.CexCatAduana

GO
/****** Object:  View [dbo].[CexCatConceptoVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CexCatConceptoVw]
as
SELECT [ClaConcepto]
      ,[Descripcion]
	  ,[DescripcionIngles]
      ,[DescripcionIdioma2]
      ,[BajaLogica]
      ,[FechaBajaLogica]
      ,[FechaUltimaMod]
      ,[ClaUsuarioMod]
      ,[NombrePcMod]
      ,[PorcentajeRetencion]
      ,[EsAplicaIvaSN]
FROM dbo.CexCatConcepto



GO
/****** Object:  View [dbo].[CexCatDeAceroCuentaVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[CexCatDeAceroCuentaVw]
AS
SELECT	ClaBanco, 
		NumCuenta, 
		ClaMoneda, 
		Descripcion, 
		NomBanco, 
		BajaLogica, 
		FechaBajaLogica,
		FechaUltimaMod,
		ClaUsuarioMod,
		NombrePcMod
FROM    dbo.CexCatDeAceroCuenta

GO
/****** Object:  View [dbo].[CexCatIncotermSufijosVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CexCatIncotermSufijosVw]
AS
SELECT ClaIncotermSufijo 
	,DescripcionCorta 
	,Descripcion 
	,Observaciones 
	,BajaLogica 
	,FechaBajaLogica         
	,FechaUltimaMod          
	,ClaUsuarioMod 
	,NombrePcMod
FROM dbo.CexCatIncotermSufijos
GO
/****** Object:  View [dbo].[CexCatRegionVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[CexCatRegionVw]
AS
SELECT [ClaRegion]
      ,[Descripcion]
      ,[DescripcionIngles]
      ,[DescripcionIdioma2]
      ,[BajaLogica]
      ,[FechaBajaLogica]
      ,[FechaUltimaMod]
      ,[ClaUsuarioMod]
      ,[NombrePcMod]
FROM dbo.CexCatRegion

GO
/****** Object:  View [dbo].[CexCatSistemaPermitidoVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[CexCatSistemaPermitidoVw]
AS
SELECT	ClaSistemaPermitido, 
		Descripcion, 
		Nombre, 
		BajaLogica, 
		FechaBajaLogica,
		FechaUltimaMod, 
		ClaUsuarioMod, 
		NombrePcMod
FROM dbo.CexCatSistemaPermitido

GO
/****** Object:  View [dbo].[CexCatTipoImportacionVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[CexCatTipoImportacionVw]
AS
SELECT [ClaTipoImportacion]
      ,[Descripcion]
      ,[DescripcionIngles]
      ,[DescripcionIdioma2]
      ,[BajaLogica]
      ,[FechaBajaLogica]
      ,[FechaUltimaMod]
      ,[ClaUsuarioMod]
      ,[NombrePcMod]
	  ,[Sufijo]
FROM dbo.CexCatTipoImportacion

GO
/****** Object:  View [dbo].[CexCatTipoMaterialVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[CexCatTipoMaterialVw]
AS
SELECT [ClaTipoMaterial]
      ,[Descripcion]
      ,[DescripcionIngles]
      ,[DescripcionIdioma2]
      ,[BajaLogica]
      ,[FechaBajaLogica]
      ,[FechaUltimaMod]
      ,[ClaUsuarioMod]
      ,[NombrePcMod]
FROM dbo.CexCatTipoMaterial

GO
/****** Object:  View [dbo].[CexCatTipoOperacionVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[CexCatTipoOperacionVw]
AS
SELECT [ClaTipoOperacion]
      ,[Descripcion]
      ,[DescripcionIngles]
      ,[DescripcionIdioma2]
      ,[BajaLogica]
      ,[FechaBajaLogica]
      ,[FechaUltimaMod]
      ,[ClaUsuarioMod]
      ,[NombrePcMod]
FROM dbo.CexCatTipoOperacion


GO
/****** Object:  View [dbo].[CexCatTipoServicioVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[CexCatTipoServicioVw]
AS  SELECT ClaTipoServicio	
   ,Descripcion
   ,DescripcionIngles
   ,DescripcionIdioma2
   ,ClaTipoRegistro
   ,BajaLogica
   ,FechaBajaLogica
   ,FechaUltimaMod
   ,ClaUsuarioMod
   ,NombrePcMod
FROM dbo.CexCatTipoServicio

GO
/****** Object:  View [dbo].[CexRelAduanaSeccionVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[CexRelAduanaSeccionVw]
AS
SELECT	ClaAduanaSeccion
		,ClaAduana
		,NumSeccion
		,NombreSeccion
		,BajaLogica
		,FechaBajaLogica
		,FechaUltimaMod
		,ClaUsuarioMod
		,NombrePcMod
FROM dbo.CexRelAduanaSeccion

GO
/****** Object:  View [dbo].[CexRelAgenteAduanaVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[CexRelAgenteAduanaVw]
AS
SELECT [ClaAduana] 
	  ,[ClaAgenteAduanal] 
	  ,[ClaCUP]
      ,[BajaLogica]
      ,[FechaBajaLogica]
      ,[FechaUltimaMod]
      ,[ClaUsuarioMod]
      ,[NombrePcMod]
	  ,[ClaEmpresa]
	  ,[ClaRelAgenteAduana]
FROM dbo.CexRelAgenteAduana

GO
/****** Object:  View [dbo].[CexRelIncotermSufijosVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CexRelIncotermSufijosVw]
AS
SELECT ClaIncoterm 
	,ClaIncotermSufijo 
	,BajaLogica  
	,FechaBajaLogica         
	,FechaUltimaMod          
	,ClaUsuarioMod 
	,NombrePcMod
FROM dbo.CexRelIncotermSufijos
GO
/****** Object:  View [dbo].[CfaCatEstatusAutorizacionVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE View [dbo].[CfaCatEstatusAutorizacionVw]
as
Select	ClaEstatusAutorizacion,
		NomEstatusAutorizacion,
		BajaLogica,
		FechaBajaLogica,
		FechaUltimaMod,
		NombrePcMod,
		ClaUsuarioMod
From	CS_6OPEROFIDB_LNKSVR.TiCatalogo.dbo.CfaCatEstatusAutorizacion--Vw (NOLOCK)



GO
/****** Object:  View [dbo].[CfaCatNodoDinamicoVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/******************************************************************************************************************************************
IIDEA Solutions© 2011
Sistema:               Componente de Flujos de Autorización
Nombre:                CfaCatNodoDinamicoVw
Descripción:     Vista que lista las descripciones de los nodos dinámicos disponibles
Entrada:               N/A
Salida:                N/A
Nota:                       
Autor:                      Pedro Padilla Gaytán
Fecha:                      20/Junio/2011
Comentarios:     N/A
******************************************************************************************************************************************/
CREATE VIEW [dbo].[CfaCatNodoDinamicoVw]
AS

      SELECT      ClaNodoDinamico,
                             Descripcion,
                             BajaLogica,
                             FechaBajaLogica,
                             FechaUltimaMod,
                             NombrePcMod,
                             ClaUsuarioMod
      FROM        TiCatalogo.dbo.CfaCatNodoDinamico WITH (NOLOCK)


GO
/****** Object:  View [dbo].[ChaCatGrupoArticuloVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	 
	 
	   
  
CREATE VIEW [dbo].[ChaCatGrupoArticuloVw]  
AS  
SELECT     ClaUbicacion, ClaGrupoArticulo, ClaTipoCal, ClaGrupoReceta, NombreGrupoArticulo, TipoNacImp, MermaRobo,   
                      PorcentajeMerma, FechaUltimaMod, FechaIns, BajaLogica, FechaBajaLogica  
FROM         dbo.ChaCatGrupoArticulo  
	 
	 
	 

GO
/****** Object:  View [dbo].[CmpCatAlmacenUsuarioVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW	[dbo].[CmpCatAlmacenUsuarioVw]
AS
SELECT [ClaSubAlmacen]
      ,[ClaUbicacion]
      ,[ClaUsuario]
      ,[BajaLogica]
      ,[FechaBajaLogica]
      ,[FechaUltimaMod]
      ,[NombrePcMod]
      ,[ClaUsuarioMod]
  FROM [TiCatalogo]..[CmpCatAlmacenUsuario]

GO
/****** Object:  View [dbo].[CmpCatCausaValeNegadoVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CmpCatCausaValeNegadoVw]
AS
SELECT [ClaCausaValeNegado]
      ,[Descripcion]
      ,[Responsable]
      ,[FechaUltimaMod]
      ,[NombrePcMod]
      ,[ClaUsuarioMod]
  FROM [TiCatalogo]..[CmpCatCausaValeNegado]

GO
/****** Object:  View [dbo].[CmpCatClasificacionVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CmpCatClasificacionVw]
AS
SELECT	ClaClasificacion,
		NomClasificacion,
		DescClasificacion,
		Observaciones,
		BajaLogica,
		FechaBajaLogica,
		FechaUltimaMod
FROM	TiCatalogo..CmpCatClasificacion

GO
/****** Object:  View [dbo].[CmpCatClasificaObsoletoVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CmpCatClasificaObsoletoVw]
AS
SELECT [ClaClasificaObsoleto]
      ,[Descripcion]
      ,[BajaLogica]
      ,[FechaBajaLogica]
      ,[FechaUltimaMod]
      ,[NombrePcMod]
      ,[ClaUsuarioMod]
  FROM [TiCatalogo]..[CmpCatClasificaObsoleto]

GO
/****** Object:  View [dbo].[CmpCatCompradorUbicacionVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CmpCatCompradorUbicacionVw]
AS
SELECT [ClaComprador]
      ,[ClaUbicacion]
      ,[BajaLogica]
      ,[FechaBajaLogica]
      ,[FechaUltimaMod]
      ,[ClaUsuarioMod]
      ,[NombrePcMod]
  FROM [TiCatalogo]..[CmpCatCompradorUbicacion]

GO
/****** Object:  View [dbo].[CmpCatCompradorVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CmpCatCompradorVw] 
AS    

SELECT  ClaComprador,    
  NomComprador,    
  EsMultiUbicacion,    
  ClaUsuario,    
  ClaUbicacionBase,    
  Email,    
  FirmaElectronica,   
  RecibeCopiaPedido,  
  EsNegociadorAcu,  
  BajaLogica,    
  FechaBajaLogica,    
  ClaUsuarioMod,    
  FechaUltimaMod,    
  NombrePcMod    
FROM TiCatalogo..CmpCatComprador

GO
/****** Object:  View [dbo].[CmpCatConceptoGastoAdVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CmpCatConceptoGastoAdVw]
AS
SELECT      ClaUbicacion, 
			ClaConceptoGastoAd, 
			DescripcionGasto, 
			ClaDireccionContable, 
			ClaClasificacionCuenta, 
			ClaCRC, 
			ClaGrupoAsignacion, 
			ClaGrupoProceso, 
            ClaTipoGasto, 
            GeneraIVA, 
            GeneraRetencion, 
            PorcentajeRetencion, 
            ClaCRCRet, 
            ClaGrupoAsignacionRet, 
            ClaTipoGastoRet, 
            ClaTipoGastoProyRet, 
            ClaTipoGastoProy, 
            ClaDireccionRet,
            ClaGrupoProcesoRet,
            ClaTipoRegistro,
			ClaTipoRegistroRet, 
            FechaUltimaMod, 
            NombrePcMod, 
            ClaUsuarioMod
FROM       dbo.CmpCatConceptoGastoAd


GO
/****** Object:  View [dbo].[CmpCatConceptoMaquinadoVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CmpCatConceptoMaquinadoVw]
AS 
	SELECT	ClaConceptoMaquinado,
			NomConceptoMaquinado,
			BajaLogica,
			FechaBajaLogica,
			FechaUltimaMod,
			ClaUsuarioMod,
			NombrePcMod
	FROM	TiCatalogo..CmpCatConceptoMaquinado

GO
/****** Object:  View [dbo].[CmpCatDepartamentoUbicacionVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CmpCatDepartamentoUbicacionVw]
AS

SELECT ClaUbicacion, 
	   IdDepartamento = ClaDepartamento,	
	   ClaDepartamento,
	   NomDepartamento, 
	   EsReservado, 
	   BajaLogica, 
	   FechaBajaLogica, 
	   FechaUltimaMod, 
	   ClaUsuarioMod, 
	   NombrePcMod
FROM Operacion.cmp.cmpcatdepartamentovw

GO
/****** Object:  View [dbo].[CmpCatDestinoObsoletoVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CmpCatDestinoObsoletoVw]
AS
SELECT [ClaDestinoObsoleto]
      ,[NomDestinoObsoleto]
      ,[BajaLogica]
      ,[FechaBajaLogica]
      ,[FechaUltimaMod]
      ,[NombrePcMod]
      ,[ClaUsuarioMod]
  FROM [TiCatalogo]..[CmpCatDestinoObsoleto]

GO
/****** Object:  View [dbo].[CmpCatEstadoACambioArtVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CmpCatEstadoACambioArtVw]
AS
SELECT [ClaEstadoACambioArt]
      ,[Descripcion]
      ,[BajaLogica]
      ,[FechaBajaLogica]
      ,[FechaUltimaMod]
      ,[NombrePcMod]
      ,[ClaUsuarioMod]
  FROM [TiCatalogo]..[CmpCatEstadoACambioArt]

GO
/****** Object:  View [dbo].[CmpCatEventoVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CmpCatEventoVw]  
AS  
SELECT [ClaGrupoEvento]  
      ,[ClaEvento]  
      ,[NomEvento]  
      ,[BajaLogica]  
      ,[FechaBajaLogica]  
      ,[FechaUltimaMod]  
      ,[ClaUsuarioMod]  
      ,[NombrePcMod]  
  FROM [TiCatalogo]..[CmpCatEvento]

GO
/****** Object:  View [dbo].[CmpCatGrupoEventoVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CmpCatGrupoEventoVw]
AS
SELECT [ClaGrupoEvento]
      ,[NomGrupoEvento]
      ,[BajaLogica]
      ,[FechaBajaLogica]
      ,[FechaUltimaMod]
      ,[ClaUsuarioMod]
      ,[NombrePcMod]
  FROM [TiCatalogo]..[CmpCatGrupoEvento]

GO
/****** Object:  View [dbo].[CmpCatIvaVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CmpCatIvaVw]
AS
	SELECT	ClaIva,
			NomIva,
			ValorIva,
			BajaLogica,
			FechaBajaLogica,
			FechaUltimaMod,
			ClaUsuarioMod,
			NombrePcMod
	FROM	TiCatalogo..CmpCatIva

GO
/****** Object:  View [dbo].[CmpCatMotivoVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CmpCatMotivoVw]
AS
SELECT [ClaMotivo]
      ,[ClaTipoMotivo]
      ,[NombreMotivo]
	  ,[Descripcion]
      ,[BajaLogica]
      ,[FechaBajaLogica]
      ,[FechaUltimaMod]
      ,[NombrePcMod]
      ,[ClaUsuarioMod]
  FROM [TiCatalogo]..[CmpCatMotivo]

GO
/****** Object:  View [dbo].[CmpCatOrigenNotaCreditoVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CmpCatOrigenNotaCreditoVw]
AS
SELECT [ClaOrigenNotaCredito]
      ,[Descripcion]
      ,[BajaLogica]
      ,[FechaBajaLogica]
      ,[FechaUltimaMod]
      ,[NombrePcMod]
      ,[ClaUsuarioMod]
  FROM [TiCatalogo]..[CmpCatOrigenNotaCredito]

GO
/****** Object:  View [dbo].[CmpCatProveedorRefComercialVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  VIEW [dbo].[CmpCatProveedorRefComercialVw]  
AS  
SELECT a.ClaCup
      ,b.ClaProveedor
      ,b.ClaTipoProveedor
      ,[AniosAntiguedad]  
      ,[ClaGiroProveedor]  
      ,[NumeroPersonal]  
      ,[Capital]  
      ,[ClaMoneda]  
      ,[CapitalSocialUSD]  
      ,[VentasAnualesDolar]  
      ,[EsDesgloseFormaPago]  
      ,[MontoDesgloseFormaPago]  
      ,[ClientesPrincipales]  
      ,[ContactoCentral]  
      ,[ClaEspecializacionProv]  
      ,[ComentariosEspeciales]  
      ,[PaginaInternet]  
      ,b.PlazoPago  
      ,a.BajaLogica
      ,a.FechaBajaLogica
      ,a.FechaUltimaMod
      ,a.NombrePcMod 
      ,a.ClaUsuarioMod              
  FROM TiCatalogo..PProCatProveedorRefComercial	a
  INNER JOIN ticatalogo.dbo.cmpcatproveedorreflocal	b
  ON (a.ClaCUP=b.clacup)

GO
/****** Object:  View [dbo].[CmpCatTipoDocumentoVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CmpCatTipoDocumentoVw]
AS
SELECT [ClaUbicacion]
      ,[ClaTipoDocumento]
      ,[NomTipoDocumento]
      ,[EsUnico]
      ,[EsRestringido]
      ,[RutaAlmacenaArchivo]
      ,[RutaAlmacenaHistorico]
      ,[RutaMuestraArchivo]
      ,[RutaMuestraHistorico]
      ,[RutaPorAutorizar]
      ,[BajaLogica]
      ,[FechaBajaLogica]
      ,[FechaUltimaMod]
      ,[NombrePcMod]
      ,[ClaUsuarioMod]
  FROM [TiCatalogo]..[CmpCatTipoDocumento]

GO
/****** Object:  View [dbo].[CmpCatTipoMotivoVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CmpCatTipoMotivoVw]
AS
SELECT [ClaTipoMotivo]
      ,[NombreTipoMotivo]
      ,[BajaLogica]
      ,[FechaBajaLogica]
      ,[FechaUltimaMod]
      ,[NombrePcMod]
      ,[ClaUsuarioMod]
  FROM [TiCatalogo]..[CmpCatTipoMotivo]

GO
/****** Object:  View [dbo].[CmpCatTipoPenalizacionVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CmpCatTipoPenalizacionVw]
AS
SELECT [ClaTipoPenalizacion]
      ,[Descripcion]
      ,[BajaLogica]
      ,[FechaBajaLogica]
      ,[FechaUltimaMod]
      ,[NombrePcMod]
      ,[ClaUsuarioMod]
  FROM [TiCatalogo]..[CmpCatTipoPenalizacion]

GO
/****** Object:  View [dbo].[CmpCatTipoProveedorVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CmpCatTipoProveedorVw]
AS
SELECT [ClaTipoProveedor]
      ,[NombreTipoProveedor]
      ,[BajaLogica]
      ,[FechaBajaLogica]
      ,[ClaUsuarioMod]
      ,[NombrePcMod]
  FROM [TiCatalogo]..[CmpCatTipoProveedor]

GO
/****** Object:  View [dbo].[CmpCatTipoReferenciaVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CmpCatTipoReferenciaVw]
AS	
SELECT [ClaTipoReferencia]
      ,[NomTipoReferencia]
      ,[BajaLogica]
      ,[FechaBajaLogica]
      ,[FechaUltimaMod]
      ,[NombrePcMod]
      ,[ClaUsuarioMod]
  FROM [TiCatalogo]..[CmpCatTipoReferencia]

GO
/****** Object:  View [dbo].[CmpCatTurnoVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CmpCatTurnoVw]
AS
SELECT [ClaUbicacion]
      ,[ClaTurno]
      ,[Descripcion]
	  ,[HoraEntrada]
      ,[HoraSalida]
      ,[BajaLogica]
      ,[FechaBajaLogica]
      ,[FechaUltimaMod]
      ,[NombrePcMod]
      ,[ClaUsuarioMod]
  FROM [TiCatalogo]..[CmpCatTurno]

GO
/****** Object:  View [dbo].[CmpCatValeNegadoPreguntaVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CmpCatValeNegadoPreguntaVw]
AS
SELECT [ClaValeNegadoPregunta]
      ,[Pregunta]
      ,[BajaLogica]
      ,[FechaBajaLogica]
      ,[FechaUltimaMod]
      ,[NombrePcMod]
      ,[ClaUsuarioMod]
  FROM [TiCatalogo]..[CmpCatValeNegadoPregunta]

GO
/****** Object:  View [dbo].[CmpEntradaDistCRCVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CmpEntradaDistCRCVw]  
AS  
  select ClaUbicacion,  
    IdEntrada,  
    IdArticulo,  
    ClaDireccion,  
    ClaCRC,  
    CantidadSurtidaReq,  
    FechaUltimaMod  
  FROM CmpEntradaDistCRC


GO
/****** Object:  View [dbo].[CmpPedidoDistCRCVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  VIEW [dbo].[CmpPedidoDistCRCVw] 
AS 
SELECT  ClaUbicacion
		,IdPedido
		,ClaTipoPedido 
		,IdArticulo
		,ClaDireccion
		,ClaCRC
		,ClaGrupoAsignacion
		,claTipoGasto
		,Pctje
        ,FechaUltimaMod
FROM	ticentral.ticatalogo.dbo.CmpPedidoDistCRC



GO
/****** Object:  View [dbo].[CmpRelCompradorFamiliaVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CmpRelCompradorFamiliaVw]
AS
SELECT ClaCompradorFamilia,
		[ClaUbicacion]
      ,[ClaComprador]
      ,[ClaFamilia]
      ,[BajaLogica]
      ,[FechaBajaLogica]
      ,[FechaUltimaMod]
      ,[ClaUsuarioMod]
      ,[NombrePcMod]
  FROM TiCatalogo..CmpRelCompradorFamilia

GO
/****** Object:  View [dbo].[CmpRelDeptoUsuarioVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CmpRelDeptoUsuarioVw]
AS
SELECT [ClaUbicacion]
      ,[ClaDepartamento]
      ,[ClaUsuario]
      ,[BajaLogica]
      ,[FechaBajaLogica]
      ,[FechaUltimaMod]
      ,[ClaUsuarioMod]
      ,[NombrePcMod]
  FROM [TiCatalogo]..[CmpRelDeptoUsuario]

GO
/****** Object:  View [dbo].[CmpRelSubSubAlmacenDepVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CmpRelSubSubAlmacenDepVw]
AS
SELECT [ClaUbicacion]
      ,[ClaDepartamento]
      ,[ClaAlmacen]
      ,[ClaSubAlmacen]
      ,[ClaSubSubAlmacen]
      ,[BajaLogica]
      ,[FechaBajaLogica]
      ,[FechaUltimaMod]
      ,[NombrePcMod]
      ,[ClaUsuarioMod]
  FROM [TiCatalogo]..[CmpRelSubSubAlmacenDep]

GO
/****** Object:  View [dbo].[CmpRelTipoProvMonedaVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CmpRelTipoProvMonedaVw]
AS
SELECT [ClaTipoProveedor]
      ,[ClaMoneda]
      ,[BajaLogica]
      ,[FechaBajaLogica]
      ,[FechaUltimaMod]
      ,[NombrePcMod]
      ,[ClaUsuarioMod]
  FROM [TiCatalogo]..[CmpRelTipoProvMoneda]

GO
/****** Object:  View [dbo].[ConCatBeneTransferVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[ConCatBeneTransferVw]
AS
SELECT  CBT.ClaEmpresa, CBT.ClaBeneficiario, CBT.ClaCuentaBanco, CBT.VoBo, CBT.CuentaMail,
        CBT.BajaLogica, CBT.FechaBajaLogica
FROM    TiCatalogo.dbo.ConCatBeneTransfer AS CBT 
INNER JOIN TiCatalogo.dbo.ConCatBeneficiario AS CCB
		ON CBT.ClaEmpresa = CCB.ClaEmpresa
	   AND CBT.ClaBeneficiario = CCB.ClaBeneficiario


GO
/****** Object:  View [dbo].[ConCatClasificacionCuentaVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[ConCatClasificacionCuentaVw]  
AS  
SELECT     ClaClasificacionCuenta, NombreClasificacionCuenta, BajaLogica, FechaBajaLogica, FechaUltimaMod, NombrePcMod, ClaUsuarioMod, FechaIns,   
                      ClaUsuarioIns  
FROM         dbo.ConCatClasificacionCuenta  


GO
/****** Object:  View [dbo].[ConCatCrcDireccionVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE View [dbo].[ConCatCrcDireccionVw]
AS
SELECT	ClaEmpresa,
		ClaDireccion,
		ClaCrc,
		Responsable,
		BajaLogica,
		FechaBajaLogica,
		FechaUltimaMod,
		NombrePcMod,
		ClaUsuarioMod,
		IdUsuarioResponsable
FROM	ConCatCrcDireccion (NOLOCK)


GO
/****** Object:  View [dbo].[ConCatCrcVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE View [dbo].[ConCatCrcVw]  
AS  
SELECT   ClaCrc,  
		 ClaClasificacionCrc,  
		 NombreCrc,  
		 ClaTipoCrc,  
		 ClaDireccionPadre,  
		 ClaCrcPadre,  
		 EsAutorizado,  
		 isnull(BajaLogica,0) as BajaLogica,  
		 FechaBajaLogica,  
		 FechaUltimaMod,  
		 NombrePcMod,  
		 ClaUsuarioMod,  
		 FechaIns,  
		 ClaUsuarioIns  
FROM     ConCatCrc  
WHERE    ClaClasificacionCrc = 0  
and      ClaCrc > 0  

GO
/****** Object:  View [dbo].[ConCatCuentaVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	 
	 CREATE VIEW [dbo].[ConCatCuentaVw]  
AS  
SELECT     ClaEmpresa, ClaCuenta, ClaClasificacionCuenta, ClaTipoCtrlGasto, NombreCuenta, ClaCuentaPadre, EsNivelAfectable, BajaLogica, FechaBajaLogica,   
                      FechaUltimaMod, NombrePcMod, ClaUsuarioMod, FechaIns, ClaUsuarioIns  
FROM         dbo.ConCatCuenta  

GO
/****** Object:  View [dbo].[ConCatDepartamentoVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	 
	 
	 CREATE View [dbo].[ConCatDepartamentoVw]  
as  
Select ClaDepartamento,  
  ClaEmpresa,  
  NomDepartamento,  
  ClaBeneficiario,  
  ClaDireccion,  
  BajaLogica,  
  FechaBajaLogica,  
  FechaUltimaMod,  
  NombrePCMod,  
  ClaUsuarioMod  
From TiCatalogo.dbo.ConCatDepartamento  
  
	 
	 

GO
/****** Object:  View [dbo].[ConCatDireccionVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	 
	 
	 
	 
	 CREATE View [dbo].[ConCatDireccionVw]  
as  
Select ClaDireccion,  
  ClaArea,  
  NombreDireccion,  
  ClaEmpresa,  
  ClaUbicacion,  
  EsAutorizado,  
  BajaLogica,  
  FechaBajaLogica,  
  FechaUltimaMod,  
  NombrePcMod,  
  ClaUsuarioMod,  
  FechaIns,  
  ClaUsuarioIns  
From TiCatalogo.dbo.ConCatDireccion  
	 

GO
/****** Object:  View [dbo].[ConCatEmpresadbVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	 
	 CREATE VIEW [dbo].[ConCatEmpresadbVw]  AS    
SELECT ClaEmpresa,NombreBDConta,BajaLogica,FechaBajaLogica,FechaUltimaMod,FechaIns  
FROM dbo.ConCatEmpresadb  
WITH (NOLOCK)  
  
	 
	 
	 

GO
/****** Object:  View [dbo].[ConCatEmpresaVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE view [dbo].[ConCatEmpresaVw]  as
Select ClaEmpresa, NombreEmpresa, DescEmpresa, ClaRfc, NomBaseDatos, ClaEmpresaVtas, ClaMoneda, BaseDatosGP, Logotipo,  
 DireccionFiscal, Telefono, BajaLogica, FechaBajaLogica, FechaUltimaMod 
from  ConCatEmpresa  


GO
/****** Object:  View [dbo].[ConCatEstatusTramiteVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE View [dbo].[ConCatEstatusTramiteVw]  
as  
Select 
	ClaEstatusTramite,  
	NomEstatusTramite,  
	NomEstatusExterno,  
	EsCancelable,  
	BajaLogica,  
	FechaBajaLogica,  
	FechaUltimaMod,  
	NombrePcMod,  
	ClaUsuarioMod  
From TiCatalogo.dbo.ConCatEstatusTramite
GO
/****** Object:  View [dbo].[ConCatGpoPolizaVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[ConCatGpoPolizaVw]
AS
SELECT       ClaGpoPoliza
			, ClaDireccion
			, NomGpoPoliza
			, ClaGpoPolizaContrapartida
			, ClaTrabajadorEUNResponsable
			, EsPorConfirmarResponsable
			, EsContrapartida
			, BajaLogica
			, FechaBajaLogica
			, FechaUltimaMod
			, ClaUsuarioMod
			, NombrePcMod 
			, ClaBeneficiario
FROM        [dbo].[ConCatGpoPoliza]
GO
/****** Object:  View [dbo].[ConCatParidadVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	 CREATE VIEW [dbo].[ConCatParidadVw]  AS    
SELECT  FechaParidad, ClaMoneda, ParidadMonedaPeso, ParidadMonedaDolar, ParidadDolarMon, BajaLogica, FechaBajaLogica,   
  FechaUltimaMod, FechaIns    
FROM    dbo.ConCatParidad    
WITH (NOLOCK)  
  
	 

GO
/****** Object:  View [dbo].[ConCatTipoCrcVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create view [dbo].[ConCatTipoCrcVw]  
as  
  
select ClaTipoCrc,  
 NombreTipoCrc,  
 UtilizaGpoAsignacion,  
 BajaLogica,  
 FechaBajaLogica,  
 FechaUltimaMod,  
 FechaIns  
from ConCatTipoCrc  

GO
/****** Object:  View [dbo].[ConCatTipoGastoProyectoVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/****** Object:  View [dbo].[ConCatTipoGastoProyectoVw]    Script Date: 06/02/2008 12:32:42 ******/  
CREATE VIEW [dbo].[ConCatTipoGastoProyectoVw]  
AS  
SELECT     ClaTipoGasto,ClaEmpresa,NomTipoGasto,BajaLogica,FechaBajaLogica ,
FechaUltimaMod,
NombrePcMod,
ClaUsuarioMod
FROM         TiCatalogo.dbo.ConCatTipoGastoProyecto  


GO
/****** Object:  View [dbo].[ConCatTipoRegistroVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

  
/****** Object:  View [dbo].[ConCatTipoRegistroVw]    Script Date: 06/02/2008 12:32:42 ******/  
CREATE VIEW [dbo].[ConCatTipoRegistroVw]  
AS  
SELECT ClaTipoRegistro, NomTipoRegistro, EsProveedor, EsControl, BajaLogica, FechaBajaLogica,
FechaUltimaMod,
NombrePcMod,
ClaUsuarioMod  
FROM         TiCatalogo.dbo.ConCatTipoRegistro


GO
/****** Object:  View [dbo].[ConCatTipoTramiteVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create View [dbo].[ConCatTipoTramiteVw]  
as  
Select ClaTipoTramite,  
  NomTipoTramite,  
  DescTipoTramite,  
  EsPago,  
  EsEnLinea,  
  VigenciaEnLinea,  
  EsReqComprobanteFiscal,  
  ClaContabilidad,  
  ClaTipoPoliza,  
  ClaClasificacionPoliza,  
  ClaEstatusTipoTramite,  
  EsBloqueo,  
  EsManual,  
  BajaLogica,  
  FechaBajaLogica,  
  FechaUltimaMod,  
  NombrePcMod,  
  ClaUsuarioMod  
From dbo.ConCatTipoTramite WITH (NOLOCK)

GO
/****** Object:  View [dbo].[ConRelBeneficiarioDatosPagoVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ConRelBeneficiarioDatosPagoVw]
AS
SELECT     ClaEmpresa, ClaBeneficiario, ClaMoneda, ClasificacionBeneficiario, NumeroCuenta, NumeroBanco, EsAutorizado, BajaLogica, FechaBajaLogica, 
                      FechaUltimaMod, NombrePcMod, ClaUsuarioMod, FechaIns, ClaUsuarioIns
FROM         dbo.ConRelBeneficiarioDatosPago

GO
/****** Object:  View [dbo].[CseCatPuntoControlVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--***********************************************************
--	TI DEACERO
--	GENERADOR:	TiServGeneraScriptVistaProc
--	FECHA:		Jan  7 2008  5:17PM
--	HOSTNAME:	XSANCHEZVISTA
--	TABLA:		CseCatPuntoControl
--************************************************************/

CREATE View [dbo].[CseCatPuntoControlVw]
as
Select	claPuntoControl,
		claTipoEvento,
		nombrePuntoControl,
		nombreCortoPuntoControl,
		claPuntoControlDependo,
		orden,
		diasDuracion,
		diasTolerancia,
		esBrincable,
		esAutomatico,
		claAlertaAtraso,
		claAlertaSuceso,
		leyendaRef1,
		leyendaRef2,
		leyendaRef3,
		leyendaRef4,
		leyendaRef5,
		claObjetoPantalla,
		BajaLogica,
		FechaBajaLogica,
		ClaUsuarioIns,
		ClaUsuarioMod
		FechaIns,
		FechaUltimaMod,
		NombrePcMod
From	CseCatPuntoControl WITH(NOLOCK) 

GO
/****** Object:  View [dbo].[CseCatTipoEventoVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--***********************************************************
--	TI DEACERO
--	GENERADOR:	TiServGeneraScriptVistaProc
--	FECHA:		Jan  7 2008  5:17PM
--	HOSTNAME:	XSANCHEZVISTA
--	TABLA:		CseCatTipoEvento
--************************************************************/

CREATE View [dbo].[CseCatTipoEventoVw]
as
Select	claTipoEvento,
		claSistema,
		nombreTipoEvento,
		leyendaRef1,
		leyendaRef2,
		leyendaRef3,
		leyendaRef4,
		leyendaRef5,
		leyendaRef6,
		leyendaRef7,
		leyendaRef8,
		leyendaRef9,
		leyendaRef10,
		claAlertaSuceso,
		claAlertaErrores,
		claObjetoPantalla,
		BajaLogica,
		FechaBajaLogica,
		ClaUsuarioIns,
		ClaUsuarioMod,
		FechaIns,
		FechaUltimaMod,
		NombrePcMod
From	dbo.CseCatTipoEvento WITH(NOLOCK) 



GO
/****** Object:  View [dbo].[CtsCatAgrupadorVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CtsCatAgrupadorVw]
AS
SELECT		id_agrupador				AS ClaAgrupador, 
			id_tipo_agrupador			AS ClaTipoAgrupador, 
			id_agrupador_padre			AS ClaAgrupadorPadre, 
			nivel						AS Nivel, 
			folio_origen				AS FolioOrigen,
            nombre						AS NombreAgrupador, 
			id_ubicacion				AS ClaUbicacion, 
			id_empresa					AS ClaEmpresa, 
			FechaUltimaMod,
			NULL						AS BajaLogica,
			NULL						AS FechaBajaLogica,
			NULL						AS FechaIns
FROM         costos_industrial.dbo.agrupador

GO
/****** Object:  View [dbo].[CtsCatElementoCostoVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CtsCatElementoCostoVw]
AS
SELECT		id_elemento_costo	AS ClaElementoCosto, 
			nombre				AS NombreElementoCosto, 
			fecha_ultimo_cambio AS FechaUltimaMod,
			0					AS BajaLogica,
			NULL				AS FechaBajaLogica,
			NULL				AS FechaIns
FROM         costos_industrial.dbo.elemento_costo

GO
/****** Object:  View [dbo].[CtsCatGpoProcesoVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[CtsCatGpoProcesoVw]		
AS SELECT	ClaGpoProceso    ,
			DescGpoProceso,
			AfectableSN

FROM		CtsCatGpoProceso

GO
/****** Object:  View [dbo].[CtsCatMaquinaVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CtsCatMaquinaVw]
AS
SELECT		id_maquina			AS ClaMaquina, 
			nombre				AS NombreMaquina, 
			id_crc				AS ClaCrc, 
			fecha_ultimo_cambio AS FechaUltimaMod, 
            id_grupo_maquina	AS ClaGrupoMaquina,
			NULL				AS BajaLogica,
			NULL				AS FechaBajaLogica,
			NULL				AS FechaIns
FROM         costos_industrial.dbo.maquina

GO
/****** Object:  View [dbo].[CtsCatProductoAgrupadorVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CtsCatProductoAgrupadorVw]
AS
SELECT		id_agrupador				AS ClaAgrupador, 
			id_producto					AS ClaProducto, 
			id_tipo_agrupador			AS ClaTipoAgrupador, 
			FechaUltimaMod,
			NULL						AS BajaLogica,
			NULL						AS FechaBajaLogica,
			NULL						AS FechaIns		
FROM         costos_industrial.dbo.producto_agrupador

GO
/****** Object:  View [dbo].[CtsCatProductoPTVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CtsCatProductoPTVw]
AS
SELECT		id_ubicacion AS ClaUbicacion, 
			periodo AS Periodo, 
			id_producto AS ClaProducto, 
			ProdPT AS ProductoPT, 
			BajaLogica, 
			FechaBajaLogica, 
			NULL AS FechaIns, 
			DATEADD(d, - 1, GETDATE()) AS FechaUltimaMod
FROM         costos_industrial.dbo.CtsCatProductoPT

GO
/****** Object:  View [dbo].[CtsCatTipoAgrupadorVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CtsCatTipoAgrupadorVw]
AS
SELECT		id_tipo_agrupador			AS ClaTipoAgrupador, 
			nombre_agrupador			AS NombreTipoAgrupador, 
			ultimo_nivel				AS UltimoNivel, 
			DATEADD(d,- 1,GETDATE())	AS FechaUltimaMod,
			NULL						AS BajaLogica,
			NULL						AS FechaBajaLogica,
			Null						AS FechaIns			
FROM         costos_industrial.dbo.tipo_agrupador

GO
/****** Object:  View [dbo].[CtsCatTipoCostoElementoCostoVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CtsCatTipoCostoElementoCostoVw]
AS
SELECT		id_elemento_costo		AS ClaElementoCosto, 
			id_tipo_costo			AS ClaTipoCosto,
			GETDATE()				AS FechaUltimaMod, 
			0						AS BajaLogica,
			NULL					AS FechaBajaLogica,
			NULL					AS FechaIns
FROM         costos_industrial.dbo.tipo_costo_elemento_costo

GO
/****** Object:  View [dbo].[CtsCatTipoDistVectorVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CtsCatTipoDistVectorVw]
AS
SELECT		id_tipo_distribucion_vector AS ClaTipoDistVector, 
			nombre						AS NombreTipoDistVector, 
			GETDATE()					AS FechaUltimaMod,
			0							AS BajaLogica, 
			NULL						AS FechaBajaLogica, 
			NULL						AS FechaIns
FROM         costos_industrial.dbo.tipo_distribucion_vector

GO
/****** Object:  View [dbo].[CtsCatTipoGastoVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CtsCatTipoGastoVw]
AS
SELECT      id_tipo_gasto		AS ClaTipoGasto, 
			volumen_sn			AS EsVolumen, 
			fecha_ultimo_cambio AS FechaUltimaMod, 
			0					AS BajaLogica, 
			NULL				AS FechaBajaLogica, 
			NULL				AS FechaIns
FROM         costos_industrial.dbo.tipo_gasto

GO
/****** Object:  View [dbo].[CtsCatTipoUnidadVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CtsCatTipoUnidadVw]
AS
SELECT		id_tipo_unidad				AS ClaTipoUnidad, 
			nombre						AS NombreTipoUnidad, 
			inicial_sn					AS EsInicial, 
			GETDATE()					AS FechaUltimaMod, 
			0							AS BajaLogica, 
			NULL						AS FechaBajaLogica, 
			NULL						AS FechaIns
FROM         costos_industrial.dbo.tipo_unidad

GO
/****** Object:  View [dbo].[CtsCatVectorVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[CtsCatVectorVw]
AS
SELECT		id_vector					AS ClaVector, 
			nombre						AS NombreVector, 
			descripcion					AS Descripcion, 
			id_tipo_distribucion_vector AS ClaTipoDistVector, 
			id_unidad					AS ClaUnidad, 
            id_tipo_vector				AS ClaTipoVector, 
			fecha_alta					AS FechaAlta, 
			fecha_ultimo_cambio			AS FechaUltimaMod,
			0							AS BajaLogica,
			NULL						AS FechaBajaLogica, 
			NULL						AS FechaIns
FROM         costos_industrial.dbo.vector

GO
/****** Object:  View [dbo].[CupCatEstatusProveedorVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	
-----------------------------------------------------------------------------------------------------------------------------------------
-- Objeto:          CupSch.CupCatEstatusProveedorVw
-- Autor:           GSG
-- Fecha:           30-Sep-2010
-- Objetivo:        Vista para el cátalogo CupCatEstatusProveedor
-- Entrada:			
-- Salida:			
-- Precondiciones:	
-- Retorno:			
-- Revisiones:		
------
CREATE VIEW [dbo].[CupCatEstatusProveedorVw]
AS
	SELECT [ClaEstatusProveedor]
		  ,[NomEstatusProveedor]
		  ,[BajaLogica]
		  ,[FechaBajaLogica]
		  ,[FechaUltimaMod]
		  ,[NombrePcMod]
		  ,[ClaUsuarioMod]
	  FROM [dbo].[CupCatEstatusProveedor]  (NOLOCK)

GO
/****** Object:  View [dbo].[CupCatEstatusSolicitudVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-----------------------------------------------------------------------------------------------------------------------------------------
-- Objeto:          CupSch.CupCatEstatusSolicitudVw
-- Autor:           GSG
-- Fecha:           03-Dic-2010
-- Objetivo:        Vista para el cátalogo CupCatEstatusSolicitudVw
-- Entrada:			
-- Salida:			
-- Precondiciones:	
-- Retorno:			
-- Revisiones:		
------
CREATE VIEW [dbo].[CupCatEstatusSolicitudVw]
AS
	SELECT  ClaEstatusSolicitud,
			NomEstatusSolicitud,
			BajaLogica,
			FechaBajaLogica,
			FechaUltimaMod,
			NombrePcMod,
			ClaUsuarioMod
	  FROM [dbo].[CupCatEstatusSolicitud] (NOLOCK)

GO
/****** Object:  View [dbo].[CupCatProveedorVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-----------------------------------------------------------------------------------------------------------------------------------------
-- Objeto:          CUPSch.CupCatProveedorVw
-- Autor:           EGRC
-- Fecha:           07-Sep-2010
-- Objetivo:        Vista para el cátalogo CupCatProveedor
-- Entrada:			
-- Salida:			
-- Precondiciones:	
-- Retorno:			
-- Revisiones:		
------
CREATE VIEW [dbo].[CupCatProveedorVw]
AS
	
SELECT		ClaCup, 
			ClaveCup, 
			RFC, 
			NomCup, 
			ApPaterno, 
			ApMaterno, 
			Curp, 
			Calle, 
			NoInt, 
			NoExt, 
			ClaColoniaCon, 
			ClaMunicipioCon, 
			ClaEstadoCon, 
			ClaPaisCon, 
            CodigoPostal, 
            Telefono, 
            EsExtranjero, 
            ClaTipoPersona, 
            ClaTipoProveedor, 
           -- ClaMetodoConexion, 
            DiasPago, 
            PlazoPago, 
            ClaIva, 
            Dpp, 
            NomContacto, 
            DireccionContacto, 
            TelefonoContacto, 
            EmailContacto, 
            ClaEstatusProveedor, 
            EsAutorizadoSat, 
            EsRevisado, 
		    ResponsableFiscal,
		    FechaValidacionFiscal,
            IdAutorizacion, 
            BajaLogica, 
            FechaBajaLogica, 
            FechaUltimaMod, 
            NombrePcMod, 
            ClaUsuarioMod
FROM        dbo.CupCatProveedor (NOLOCK)


GO
/****** Object:  View [dbo].[CupCatTipoBloqueoVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-----------------------------------------------------------------------------------------------------------------------------------------
-- Objeto:          CupSch.CupCatTipoBloqueoVw
-- Autor:           VHOI
-- Fecha:           30-Sep-2010
-- Objetivo:        Vista para el cátalogo CupCatTipoBloqueo
-- Entrada:			
-- Salida:			
-- Precondiciones:	
-- Retorno:			
-- Revisiones:		
------
CREATE VIEW [dbo].[CupCatTipoBloqueoVw]
AS
	
	SELECT	ClaTipoBloqueo
			,NomTipoBloqueo
			,BajaLogica
			,FechaBajaLogica
			,FechaUltimaMod
			,NombrePcMod
			,ClaUsuarioMod
	FROM	[dbo].CupCatTipoBloqueo  (NOLOCK)

GO
/****** Object:  View [dbo].[CupCatTipoFacturaVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-----------------------------------------------------------------------------------------------------------------------------------------
-- Objeto:          CupSch.CupCatTipoFacturaVw
-- Autor:           GSG
-- Fecha:           03-Dic-2010
-- Objetivo:        Vista para el cátalogo CupCatTipoFactura
-- Entrada:			
-- Salida:			
-- Precondiciones:	
-- Retorno:			
-- Revisiones:		
------
CREATE VIEW [dbo].[CupCatTipoFacturaVw]
AS
	
	SELECT	ClaTipoFactura,
			NomTipoFactura,
			BajaLogica,
			FechaBajaLogica,
			FechaUltimaMod,
			NombrePcMod,
			ClaUsuarioMod
	FROM	[dbo].CupCatTipoFactura   (NOLOCK)

GO
/****** Object:  View [dbo].[ExpCatAeropuertoVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ExpCatAeropuertoVw]
AS
SELECT     ClaAeropuerto, Codigo, Nombre, Descripcion, BajaLogica, FechaBajaLogica, FechaUltimaMod, ClaUsuarioMod, NombrePcMod
FROM          ExpCatAeropuerto

GO
/****** Object:  View [dbo].[ExpCatIncotermVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[ExpCatIncotermVw]
AS
SELECT     ClaIncoterm, NombreIncoterm, DescIncoterm, BajaLogica, FechaBajaLogica, FechaUltimaMod, ClaUsuarioMod, NombrePcMod
FROM          ExpCatIncoterm

GO
/****** Object:  View [dbo].[ExpCatLineaAereaVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[ExpCatLineaAereaVw]
AS
SELECT     ClaLineaAerea, Nombre, Descripcion, BajaLogica, FechaBajaLogica, Contacto, Direccion, Telefono, Web, Email, NombreCorto, Guia, DigitoAerea, Pais, 
                      FechaUltimaMod, ClaUsuarioMod, NombrePcMod
FROM          ExpCatLineaAerea

GO
/****** Object:  View [dbo].[ExpCatLineaMaritimaVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[ExpCatLineaMaritimaVw]
AS
SELECT     ClaLineaMaritima, Nombre, Descripcion, Contacto, Direccion, Telefono, Web, Email, NombreCorto, Guia, DiasLibresDemora, BajaLogica, 
                      FechaBajaLogica, FechaUltimaMod, ClaUsuarioMod, NombrePcMod
FROM          ExpCatLineaMaritima

GO
/****** Object:  View [dbo].[ExpCatNombreBarcoVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[ExpCatNombreBarcoVw]
AS
SELECT     ClaBarco,NombreBarco,ClaLineaMaritima,Descripcion , BajaLogica, FechaBajaLogica
FROM        ExpCatNombreBarco

GO
/****** Object:  View [dbo].[ExpCatPrimaSeguroVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[ExpCatPrimaSeguroVw]
AS
SELECT     ClaPrimaSeguro, Nombre, Descripcion, CantidadPrima, BajaLogica, fechaBajaLogica
FROM          ExpCatPrimaSeguro

GO
/****** Object:  View [dbo].[ExpCatPuertoFronteraVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ExpCatPuertoFronteraVw]
AS
SELECT     ClaPuertoFrontera, Nombre, Descripcion, BajaLogica, FechaBajaLogica, FechaUltimaMod, ClaUsuarioMod, NombrePcMod, ClaPais, ClaEstado, ClaCiudad
FROM         dbo.ExpCatPuertoFrontera


GO
/****** Object:  View [dbo].[ExpCatRegimenVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[ExpCatRegimenVw]
AS
SELECT     ClaRegimen, TipoRegimen, Nombre, Descripcion, Porcentaje, BajaLogica, FechaBajaLogica, FechaUltimaMod, ClaUsuarioMod, NombrePcMod
FROM          ExpCatRegimen

GO
/****** Object:  View [dbo].[ExpCatSemaforoVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[ExpCatSemaforoVw]
AS
SELECT     ClaSemaforo, Nombre,Descripcion , BajaLogica, FechaBajaLogica
FROM        ExpCatSemaforo

GO
/****** Object:  View [dbo].[ExpCatTipoAgrupacionVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[ExpCatTipoAgrupacionVw]
AS
SELECT     ClaTipoAgrupacion, Nombre, Descripcion, BajaLogica, FechaBajaLogica, FechaUltimaMod, ClaUsuarioMod, NombrePcMod
FROM          ExpCatTipoAgrupacion

GO
/****** Object:  View [dbo].[ExpCatTipoCargaVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[ExpCatTipoCargaVw]
AS
SELECT     ClaTipoCarga, Nombre, Descripcion, EsContenedor, BajaLogica, FechaBajaLogica, FechaUltimaMod, ClaUsuarioMod, NombrePcMod, NombreIngles
FROM          ExpCatTipoCarga

GO
/****** Object:  View [dbo].[ExpCatTipoDimensionVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[ExpCatTipoDimensionVw]
AS
SELECT     ClaTipoDimension, Nombre, Descripcion, BajaLogica, FechaBajaLogica
FROM          ExpCatTipoDimension

GO
/****** Object:  View [dbo].[ExpCatTipoExportacionVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[ExpCatTipoExportacionVw] 
AS
SELECT ClaTipoExportacion, Nombre, Descripcion, BajaLogica, FechaBajaLogica, FechaUltimaMod, NombrePcMod, ClaUsuarioMod
FROM  ExpCatTipoExportacion

GO
/****** Object:  View [dbo].[ExpCatTipoImportacionVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW	[dbo].[ExpCatTipoImportacionVw]
AS
SELECT ClaTipoImportacion, Descripcion, BajaLogica, FechaBajaLogica, FechaUltimaMod, NombrePcMod, ClaUsuarioMod  
FROM  ExpCatTipoImportacion

GO
/****** Object:  View [dbo].[ExpCatTipoPesoVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[ExpCatTipoPesoVw]
AS
SELECT     ClaTipoPeso, Nombre, Descripcion, BajaLogica, FechaBajaLogica
FROM          ExpCatTipoPeso

GO
/****** Object:  View [dbo].[ExpCatTipoServicioMaritimaVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[ExpCatTipoServicioMaritimaVw]
AS
SELECT     ClaTipoServicio, Nombre, Descripcion,ClaBarco, BajaLogica, FechaBajaLogica, FechaUltimaMod, ClaUsuarioMod, NombrePcMod
FROM          ExpCatTipoServicio

GO
/****** Object:  View [dbo].[ExpCatTipoServicioVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[ExpCatTipoServicioVw]
AS
SELECT     ClaTipoServicio, Nombre, Descripcion, BajaLogica, FechaBajaLogica, FechaUltimaMod, ClaUsuarioMod, NombrePcMod
FROM          ExpCatTipoServicio

GO
/****** Object:  View [dbo].[ExpCatTipoTransporteVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[ExpCatTipoTransporteVw]
AS
SELECT     ClaTipoTransporte, Nombre, Descripcion, BajaLogica, FechaBajaLogica
FROM          ExpCatTipoTransporte

GO
/****** Object:  View [dbo].[ExpCatViaEmbarqueVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[ExpCatViaEmbarqueVw]
AS
SELECT     ClaViaEmbarque, Nombre, Descripcion, Dias, BajaLogica, FechaBajaLogica, FechaUltimaMod, ClaUsuarioMod, NombrePcMod, NombreIngles
FROM       ExpCatViaEmbarque

GO
/****** Object:  View [dbo].[ExpRelIncotermPaisVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[ExpRelIncotermPaisVw] AS
SELECT      [ClaIncoterm],
            [ClaPais],
            [BajaLogica],
            [FechaBajaLogica],
            [ClaUsuarioMod],
            [NombrePcMod]
FROM		ExpRelIncotermPais

GO
/****** Object:  View [dbo].[ExpRelIncPFronPaisVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[ExpRelIncPFronPaisVw]
AS
SELECT     ClaRelacion, ClaIncoterm, ClaPuertoFrontera, ClaPais, BajaLogica, FechaBajaLogica, NombrePcMod, ClaUsuarioMod, FechaUltimaMod
FROM       ExpRelIncPFronPais


GO
/****** Object:  View [dbo].[ExpTraEnvioDetVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[ExpTraEnvioDetVw]
AS SELECT 
	[ClaUbicacion] ,
	[IdPedido] ,
	[IdEnvio]  ,
	[FolioArticulo] ,
	[IdParcialidad] ,
	[GuiaEmbarque] ,
	[Cantidad] ,
	[CantSurtida],
	[CantEnEmbarques],
	[EsActivo] ,
	[FechaUltimaMod],
	[NombrePcMod] ,
	[ClaUsuarioMod] ,
	[ImporteFactura]
FROM TiCatalogo.dbo.ExpTraEnvioDet

GO
/****** Object:  View [dbo].[ExpTraEnvioVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW  [dbo].[ExpTraEnvioVw]
AS SELECT
	[IdEnvio],
	[ReferenciaProveedor],
	[GastosAdicionales] ,
	[ClaMoneda],
	[NumeroFactura],
	[ClaTipoCarga] ,
	[CantidadCarga],
	[ClaTipoPeso] ,
	[Peso] ,
	[ClaTipoDimension],
	[Largo] ,
	[Ancho] ,
	[Alto] ,
	[ClaEstatus],
	[FechaEntregaPlanta],
	[FechaRecoleccion] ,
	[ClaTransportistaInternacional],
	[FechaCreacion] ,
	[DatosEntregaEnvio],
	[FechaEstimadaEntrega],
	[ClaTipoRegistro] ,
	[ClaAgenteAduanal],
	[FechaUltimaMod] ,
	[NombrePcMod] ,
	[ClaUsuarioMod] ,
	[FacturaXEnvio] ,
	[ImporteFactura],
	[ClaPuertoFrontera],
	[FechaPromesaEntrega] 
FROM   Ticatalogo.dbo.ExpTraEnvio

GO
/****** Object:  View [dbo].[FfccCatAgenciaAduanal]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[FfccCatAgenciaAduanal]    
AS    
SELECT  ClaAgenciaAduanal,  
		NombreAgenciaAduanal,  
		ClaPais,  
		Direccion,  
		RFC,  
		Telefono,  
		Email,  
		Contacto,  
		CIF,  
		Patente,  
		BajaLogica,  
		FechaBajaLogica,  
		FechaUltimaMod,  
		NombrePcMod,  
		ClaUsuarioMod,  
		NULL ClaEstado,
		NULL ClaCiudad
FROM	FFCC.FFCCSch.FfccCatAgenciaAduanal WITH(NOLOCK) 
GO
/****** Object:  View [dbo].[FfccCatAgenciaAduanalEDI]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[FfccCatAgenciaAduanalEDI] AS  
SELECT 	ClaAgenciaAduanal,
		NombreAgenciaAduanalEDI,
		BajaLogica,
		FechaBajaLogica,
		ClaUsuarioMod,
		FechaUltimaMod,
		NombrePcMod,
  DireccionEDI,
  CIF
FROM	FFCC.FFCCSch.FfccCatAgenciaAduanal WITH(NOLOCK)
WHERE NombreAgenciaAduanalEDI IS NOT NULL


GO
/****** Object:  View [dbo].[FfccCatCiudadEDI]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE VIEW [dbo].[FfccCatCiudadEDI] as
SELECT	ClaPais,
		ClaEstado,
		ClaCiudad,
		NombreCiudadEDI,
		BajaLogica,
		FechaBajaLogica,
		ClaUsuarioMod,
		FechaUltimaMod,
		NombrePcMod
FROM	FFCC.FFCCSch.FFCCCatCiudadEDI WITH(NOLOCK)
GO
/****** Object:  View [dbo].[FfccCatClaseTrafico]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[FfccCatClaseTrafico] AS  
SELECT ClaClaseTrafico
, NombreClaseTrafico
, BajaLogica
, FechaBajaLogica
, FechaUltimaMod
, NombrePcMod
, ClaUsuarioMod
 FROM FFCC.FFCCSch.FFCCCatClaseTrafico WITH(NOLOCK)


GO
/****** Object:  View [dbo].[FfccCatClienteEDI]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[FfccCatClienteEDI] as
SELECT	ClaCliente,
		NombreClienteEDI,
		BajaLogica,
		FechaBajaLogica,
		ClaUsuarioMod,
		FechaUltimaMod,
		NombrePcMod,
		CIF
FROM	FFCC.FFCCSch.FFCCCatClienteEDI WITH(NOLOCK)
GO
/****** Object:  View [dbo].[FfccCatClienteExcepcionVentas]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[FfccCatClienteExcepcionVentas]
AS
SELECT     ClaCliente, BajaLogica, FechaBajaLogica, FechaUltimaMod, NombrePcMod, ClaUsuarioMod
FROM       FFCC.FFCCSch.FFCCCatClienteExcepcionVentas WITH (NOLOCK)
GO
/****** Object:  View [dbo].[FfccCatConsignado]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW  [dbo].[FfccCatConsignado] AS    
 SELECT     
  ClaConsignado,    
  NombreConsignado,    
  ClaPais,    
  ClaEstado,    
  ClaCiudad,    
  Direccion,    
  Colonia,    
  ZonaPostal,    
  Telefono,    
  ClaConsignadoVta,    
  NombreContacto,    
  Email,
  BajaLogica,    
  FechaBajaLogica,    
  NombrePcMod,    
  ClaUsuarioMod,    
  FechaUltimaMod,    
  FechaIns  ,    
  NombreConsignadoEDI,  
  CIF,  
  ClaCUP,
  ClaMoneda,
  ClaFormaPago
FROM FFCC.FFCCSch.FFCCCatConsignado WITH (NOLOCK)
GO
/****** Object:  View [dbo].[FfccCatDireccionVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[FfccCatDireccionVw]
AS
SELECT	CONVERT(INT, ClaDireccion) AS ClaDireccion, ClaArea, NombreDireccion, ClaEmpresa, ClaUbicacion, EsAutorizado,
		BajaLogica, FechaBajaLogica, FechaUltimaMod, NombrePcMod, ClaUsuarioMod, FechaIns, ClaUsuarioIns
FROM	TiCatalogo.dbo.ConCatDireccion WITH (NOLOCK)
WHERE ISNULL(EsAutorizado,0) = 1




GO
/****** Object:  View [dbo].[FfccCatEmpresaEDI]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[FfccCatEmpresaEDI] AS  
SELECT ClaEmpresa,  
	ClaveEDI,  
	BajaLogica,  
	FechaBajaLogica,  
	ClaUsuarioMod,  
	FechaUltimaMod,  
	NombrePcMod,
	CIF
FROM FFCC.FFCCSch.FFCCCatEmpresaEDI WITH(NOLOCK)
GO
/****** Object:  View [dbo].[FfccCatEstacion]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[FfccCatEstacion]  AS  
SELECT	ClaEstacion, 
		NombreEstacion,
		BajaLogica, 
		FechaBajaLogica, 
		FechaUltimaMod, 
		NombrePcMod, 
		ClaUsuarioMod,
		NombreEstacionEDI, 
		ClaFerroviaria
FROM	FFCC.FFCCSch.FFCCCatEstacion WITH(NOLOCK)

GO
/****** Object:  View [dbo].[FfccCatEstadoEDI]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[FfccCatEstadoEDI] as
SELECT	ClaEstado,
		ClaPais,
		NombreEstadoEDI,
		BajaLogica,
		FechaBajaLogica,
		ClaUsuarioMod,
		FechaUltimaMod,
		NombrePcMod
FROM	FFCC.FFCCSch.FFCCCatEstadoEDI WITH(NOLOCK)
GO
/****** Object:  View [dbo].[FfccCatFerroviariaEnRuta]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[FfccCatFerroviariaEnRuta] AS  
SELECT ClaFerroviariaEnRuta
, NombreFerroviariaEnRuta
, EsOtros
, BajaLogica
, FechaBajaLogica
, FechaUltimaMod
, NombrePcMod
, ClaUsuarioMod
 FROM FFCC.FFCCSch.FFCCCatFerroviariaEnRuta WITH(NOLOCK)


GO
/****** Object:  View [dbo].[FfccCatFerroviariaVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE VIEW [dbo].[FfccCatFerroviariaVw] AS
SELECT [ClaFerroviaria]
,[Abrev]
,[NombreCortoFerroviaria]
,[NumeroCliente]
,[Email]
,[ClaAvisoServicioCliente]
,[EsComunicacionCorreo]
,[ClaAvisoSolicitudAsignacion]
,[ClaAvisoDocumentacion]
,[ClaAvisoLiberacion]
,[ClaAvisoReutilizacion]
,[ClaAvisoServicioDiverso]
,[ClaAvisoConfirmaPreFacturaFletes]
,[ClaAvisoConfirmaPreFacturaDemoras]
,[ClaAvisoRechazoFactura]
,[ClaAvisoOtrosServicios]
,[ClaAvisoAsignacionPedido]
,[ClaAvisoAsignacionCarros]
,[ClaAvisoConfirmaDocumenta]
,[ClaAvisoConfirmaLibera]
,[ClaAvisoConfirmaReutiliza]
,[ClaAvisoProblemas]
,[ClaAvisoConfirmaServicioDiverso]
,[EsTraficoNacional]
,[HoraCorteDemoraInicio]
,[HoraCorteDemoraFin]
,[CostoDemora]
,[CostoDerechoPiso]
,[HorasLimiteDemora]
,[HorasLimiteReutiliza]
,[TieneCarros]
,[FechaAlta]
,[DiasAntesSolicitud]
,[EsCredito]
,[ClaMedioConfirmacion]
,[EsOperacionServiciosPorSistema]
,[AplicaReutilizacion]
,[PortalFerroviaria]
,[EsActivo]
,[BajaLogica]
,[FechaBajaLogica]
,[FechaUltimaMod]
,[NombrePcMod]
,[ClaUsuarioMod]
,[ContactoAnteFFCC]
,[PorcentajeDescuento]
,[DireccionFTP]
,[UsuarioFTP]
,[PasswordFTP]
FROM [TiCatalogo].[dbo].[FfccCatFerroviaria]
GO
/****** Object:  View [dbo].[FfccCatNivelesAfectacionVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[FfccCatNivelesAfectacionVw] AS
SELECT 	ClaOrigen,
		ClaDestino,
		ClaDireccion,
		ClaCrc,
		ClaTipoGasto,
		ClaTipoRegistro,
		ClaTipoGastoProyecto,
		ClaGrupoAsignacion,
		BajaLogica,
		FechaBajaLogica,
		ClaUsuarioMod,
		FechaUltimaMod,
		NombrePcMod
FROM	FFCC.FFCCSch.FFCCCatNivelesAfectacion WITH(NOLOCK)

GO
/****** Object:  View [dbo].[FfccCatNumeroPublicacionTarifa]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[FfccCatNumeroPublicacionTarifa] AS  
SELECT ClaRuta
,ClaTipoMaterial
,NumeroPublicacionNacional
,NumeroPublicacionInternacional
,BajaLogica
,FechaBajaLogica
,ClaUsuarioMod
,FechaUltimaMod
,NombrePcMod
 FROM FFCC.FFCCSch.FFCCCatNumeroPublicacionTarifa WITH(NOLOCK)
GO
/****** Object:  View [dbo].[FfccCatPagadorFlete]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE  VIEW [dbo].[FfccCatPagadorFlete] AS  
SELECT ClaRuta
,ClaCliente
,ClaTipoMaterial
,ClaPagadorNacional
,ClaPagadorInternacional
,BajaLogica
,FechaBajaLogica
,FechaUltimaMod
,ClaUsuarioMod
,NombrePcMod
 FROM FFCC.FFCCSch.FFCCCatPagadorFlete WITH(NOLOCK)
GO
/****** Object:  View [dbo].[FfccCatPoolVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create view [dbo].[FfccCatPoolVw] as
SELECT [ClaUbicacion]
      ,[ClaPool]
      ,[NombrePool]
      ,[ClaOrigen]
      ,[ClaDestino]
      ,[EsActivo]
      ,[BajaLogica]
      ,[FechaBajaLogica]
      ,[FechaUltimaMod]
      ,[NombrePcMod]
      ,[ClaUsuarioMod]
  FROM [TiCatalogo].[dbo].[FfccCatPool]

GO
/****** Object:  View [dbo].[FfccCatPropietarioMercancia]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[FfccCatPropietarioMercancia] AS  
SELECT	ClaUbicacion
		,ClaCliente
		,ClaPropietarioMercancia
		,BajaLogica
		,FechaBajaLogica
		,ClaUsuarioMod
		,FechaUltimaMod
		,NombrePcMod
		,NombreNotificaDestino
FROM FFCC.FFCCSch.FFCCCatPropietarioMercancia WITH(NOLOCK)


GO
/****** Object:  View [dbo].[FFCCCatRuta]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[FFCCCatRuta] AS
SELECT	ClaRuta,   
		NombreRuta,   
		ClaOrigen,   
		ClaDestino,   
		EsActivo,   
		ClaClaseTrafico,   
		Kms,   
		EsPagaOrigen,   
		PesoPermitido,   
		ClaPuntoControlFrontera,   
		ClaAduanaNacional,   
		ClaAduanaInternacional,  
		Observaciones,   
		BajaLogica,   
		FechaBajaLogica,   
		FechaUltimaMod,   
		NombrePcMod,   
		ClaUsuarioMod, 
		ClaOtraAduana,   
		Tramo, 
		ClaTipoDocumentacion,  
		ClaTipoDestino   
		,[EsAplicaTransloader]  
		,[ClaTipoServTransloader]  
		,[ClaProveedorDescarga]  
		,[ClaProveedorTraslado]  
		--,ClaPropietario      
		--,ClaConsignado      
		--,ClaReconsignado      
		--,ClaEstacionOrigen     
		--,ClaEstacionDestino     
		--,ClaPagadorOrigen     
		--,ClaPagadorDestino     
		--,EsCambiaConsignadoCliente   
		--,ClaZonaViaPuertaOrigen    
		--,ClaZonaViaPuertaDestino    
FROM  FFCC.FFCCSch.FfccCatRuta
GO
/****** Object:  View [dbo].[FfccCatSegmentoPorRuta]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[FfccCatSegmentoPorRuta]
AS
SELECT	ClaRuta, 
		Orden, 
		ClaSegmento, 
		Kms, 
		ClaFerroviaria, 
		ClaPaisOrigen, 
		ClaEstadoOrigen, 
		ClaCiudadOrigen, 
		ClaPaisDestino, 
		ClaEstadoDestino, 
		ClaCiudadDestino,
		BajaLogica, 
		FechaBajaLogica, 
		FechaUltimaMod, 
		NombrePcMod, 
        ClaUsuarioMod,
		ClaSegmentoRel, 
		Pagable
FROM	FFCC.FFCCSch.FfccCatSegmentoPorRuta
GO
/****** Object:  View [dbo].[FfccCatTipoPagoEDI]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[FfccCatTipoPagoEDI] AS
SELECT	ClaTipoPago,
		ClaveEdi,
		Descripcion,
		BajaLogica,
		FechaBajaLogica,
		ClaUsuarioMod,
		FechaUltimaMod,
		NombrePcMod
FROM	FFCC.FFCCSch.FFCCCatTipoPagoEDI WITH(NOLOCK)
GO
/****** Object:  View [dbo].[FfccCatZonaViaPuerta]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[FfccCatZonaViaPuerta]  AS  
SELECT	ClaZonaViaPuerta, 
		NumeroZonaViaPuerta, 
		ClaUbicacion, 
		EsDefault, 
		BajaLogica, 
		FechaBajaLogica, 
		FechaUltimaMod, 
		NombrePcMod, 
		ClaUsuarioMod,
		ClaOtraUbicacion
FROM	FFCC.FFCCSch.FFCCCatZonaViaPuerta WITH(NOLOCK)

GO
/****** Object:  View [dbo].[FfccRelClienteUbicacion]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[FfccRelClienteUbicacion] AS  
SELECT ClaUbicacion
	   , ClaCliente
	   , BajaLogica
	   ,FechaBajaLogica
	   , FechaUltimaMod
	   , NombrePcMod
	   , ClaUsuarioMod
 FROM ffcc.FFCCSch.FfccRelClienteUbicacion WITH(NOLOCK) 
--WHERE BajaLogica = 0

GO
/****** Object:  View [dbo].[FfccRelConsignatarioUbicacion]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[FfccRelConsignatarioUbicacion] 
AS  
SELECT ClaUbicacion
      , ClaConsignatario
      , BajaLogica
	  , FechaBajaLogica
      , FechaUltimaMod
      , NombrePcMod
      , ClaUsuarioMod
      , ClaReconsignatario
 FROM FFCC.FFCCSch.FfccRelConsignatarioUbicacion WITH(NOLOCK)
GO
/****** Object:  View [dbo].[FfccRelEstacionCiudad]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[FfccRelEstacionCiudad] AS
SELECT	ClaEstacion, ClaPais, ClaEstado, ClaCiudad, BajaLogica, FechaBajaLogica,FechaUltimaMod, NombrePcMod, ClaUsuarioMod 
FROM FFCC.FFCCSch.FfccRelEstacionCiudad WITH(NOLOCK) 
--WHERE BajaLogica = 0
GO
/****** Object:  View [dbo].[FfccRelEstacionUbicacion]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[FfccRelEstacionUbicacion] AS  
SELECT ClaUbicacion
    , ClaEstacion
	,BajaLogica
	,FechaBajaLogica
    , FechaUltimaMod
    , NombrePcMod
    , ClaUsuarioMod
 FROM FFCC.FFCCSch.FfccRelEstacionUbicacion WITH(NOLOCK)


GO
/****** Object:  View [dbo].[FfccRelFerroviariaUbicacion]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[FfccRelFerroviariaUbicacion] AS  
SELECT ClaUbicacion
    , ClaFerroviaria
	,bajaLogica
	,FechaBajaLogica
    , FechaUltimaMod
    , NombrePcMod
    , ClaUsuarioMod
 FROM FFCC.FFCCSch.FfccRelFerroviariaUbicacion WITH(NOLOCK)
-- WHERE BajaLogica=0
GO
/****** Object:  View [dbo].[FfccRelGpoEstadTipoMaterial]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[FfccRelGpoEstadTipoMaterial]
AS
SELECT [ClaGrupoEstadistico]
      ,[ClaTipoMaterial]
      ,[FechaIns]
      ,[ClaUsuarioIns]
      ,[NombrePcMod]
FROM FFCC.FFCCSch.FfccRelGpoEstadTipoMaterial WITH(NOLOCK)
GO
/****** Object:  View [dbo].[FfccRelRutaFerroviaria]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[FfccRelRutaFerroviaria]
AS
SELECT     ClaRuta, 
	ClaFerroviaria, 
	BajaLogica, 
	FechaBajaLogica, 
	FechaUltimaMod, 
	NombrePcMod, 
	ClaUsuarioMod
FROM         FFCC.FFCCSch.FfccRelRutaFerroviaria WITH(NOLOCK)

GO
/****** Object:  View [dbo].[FfccRelTipoMaterialUbicacion]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[FfccRelTipoMaterialUbicacion] AS  
SELECT ClaUbicacion
    , ClaTipoMaterial
	,0 BajaLogica
	,NULL FechaBajaLogica
    , FechaUltimaMod
    , NombrePcMod
    , ClaUsuarioMod
FROM FFCC.FFCCSch.FfccRelTipoMaterialUbicacion WITH(NOLOCK)
GO
/****** Object:  View [dbo].[FisCatInformacionFiscalEmpresaVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[FisCatInformacionFiscalEmpresaVw] AS
SELECT ClaInformacionFiscalEmpresa, ClaEmpresa, NombreCalle, NumeroExterior, NumeroInterior, 
	CaracteristicaDomicilioFiscal, ClaPaisCon, ClaveActividadFiscal, CodigoPostal, 
	ClaColoniaCon, CorreoElectronico, ClaEstadoCon, EntreCalles, EsNacional, FechaAlta, 
	ClaMunicipioCon, NombreRazonSocial, ReferenciaAdicional, Telefono, TipoVialidad,
	RFC,BancoBeneficiario, BajaLogica, FechaBajaLogica, FechaUltimaMod, NombrePcMod, ClaUsuarioMod
FROM dbo.FisCatInformacionFiscalEmpresa

GO
/****** Object:  View [dbo].[FisCatIvaVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/****** Object:  View [dbo].[FisCatIvaVw]    Script Date: 06/30/2008 17:39:16 ******/  
CREATE VIEW [dbo].[FisCatIvaVw]  
AS  
SELECT ClaIva, NomIva, PctIva, BajaLogica, FechaBajaLogica,
FechaUltimaMod,
NombrePcMod,
ClaUsuarioMod  
FROM         TiCatalogo.dbo.FisCatIva   


GO
/****** Object:  View [dbo].[FisCatTipoPersonaVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-----------------------------------------------------------------------------------------------------------------------------------------
--*----
--*Objeto:		Vista: FisCatTipoPersonaVw  
--*Autor:		TiGeneraScriptVistaProc - DCSEGRUIZ  
--*Fecha:		May  7 2008 12:25PM  
--*Objetivo:	Generar la vista para una tabla especifica  
--*Entrada:  
--*Salida:  
--*Precondiciones:  
--*Revisiones:  
--*----

Create View [dbo].[FisCatTipoPersonaVw]  
as  
Select	ClaTipoPersona,    
		NomTipoPersona,    
		BajaLogica,    
		FechaBajaLogica,    
		FechaUltimaMod,    
		NombrePcMod,    
		ClaUsuarioMod  
From	TiCatalogo.dbo.FisCatTipoPersona    

-------------  
--*** FIN *** 
------------


GO
/****** Object:  View [dbo].[FisCatTipoProveedorVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[FisCatTipoProveedorVw]
AS
SELECT [clatipoproveedor]
      ,[nomTipoProveedor]
      ,[requierecurp_sn]
      ,[bajaLogica]
      ,[fechabajalogica]
      ,[fechaultimamod]
      ,[nombrepcmod]
      ,[clausuariomod]
  FROM [TiCatalogo].[dbo].[FisCatTipoProveedor]

GO
/****** Object:  View [dbo].[FleCatAbreviacionVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--*----
--*Objeto:		Vista: FleCatAbreviacionVw
--*Autor:		TiGeneraScriptVistaProc - LFVERASLAP
--*Fecha:		Oct 12 2009  4:23PM
--*Objetivo:	        Gerar la vista para tabla FleCatAbreviacion
--*Entrada:
--*Salida:
--*Precondiciones:
--*Revisiones:
--*----	

CREATE VIEW [dbo].[FleCatAbreviacionVw]
AS
SELECT	Abreviacion,
		Descripcion
FROM	TiCatalogo.dbo.FleCatAbreviacion WITH (NOLOCK)

-------------
--*** FIN ***
-------------

GO
/****** Object:  View [dbo].[FleCatAgregadoDeduccionVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--*----
--*Objeto:		Vista: FleCatAgregadoDeduccionVw
--*Autor:		TiGeneraScriptVistaProc - LFVERASLAP
--*Fecha:		Oct 12 2009  4:23PM
--*Objetivo:	        Gerar la vista para tabla FleCatAgregadoDeduccion
--*Entrada:
--*Salida:
--*Precondiciones:
--*Revisiones:
--*----	

CREATE VIEW [dbo].[FleCatAgregadoDeduccionVw]
AS
SELECT	ClaUbicacion,
		ClaConceptoAgregadoDeduccion,
		NomFleCatAgregadoDeduccion,
		IdTipoConcepto,
		EsConAfectacion,
		EsConDiscrepancia,
		FechaUltimaMod,
		NombrePcMod,
		ClaUsuarioMod,
		BajaLogica,
		FechaBajaLogica,
		EsConAfectacionReporte
FROM	TiCatalogo.dbo.FleCatAgregadoDeduccion WITH (NOLOCK)

-------------
--*** FIN ***
-------------

GO
/****** Object:  View [dbo].[FleCatBeneficiarioFletesVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[FleCatBeneficiarioFletesVw] as Select * from Sysobjects where type ='V' 
GO
/****** Object:  View [dbo].[FleCatChoferVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--*----
--*Objeto:		Vista: FleCatChoferVw
--*Autor:		TiGeneraScriptVistaProc - LFVERASLAP
--*Fecha:		Oct 12 2009  4:23PM
--*Objetivo:	        Gerar la vista para tabla FleCatChofer
--*Entrada:
--*Salida:
--*Precondiciones:
--*Revisiones:
--*----	

CREATE VIEW [dbo].[FleCatChoferVw]
AS
	SELECT	ClaChofer,
			NomChofer,
			BajaLogica,
			FechaBajaLogica,
			FechaUltimaMod,
			NombrePcMod,
			ClaUsuarioMod
	FROM	dbo.FleCatChofer WITH (NOLOCK)

-------------
--*** FIN ***
-------------

GO
/****** Object:  View [dbo].[FleCatCriterioPagoTarifaVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

 
CREATE VIEW [dbo].[FleCatCriterioPagoTarifaVw] AS
SELECT	ClaCriterioPagoTarifa,
		DescCriterioPagoTarifa,
		ClaGrupoTransporte,
		BajaLogica,
		FechaBajaLogica,
		FechaUltimaMod,
		NombrePcMod,
		ClaUsuarioMod
FROM 	TiCatalogo.dbo.FleCatCriterioPagoTarifa 
 

GO
/****** Object:  View [dbo].[FleCatDistEntreCiudadesVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--*----
--*Objeto:		Vista: FleCatDistEntreCiudadesVw
--*Autor:		TiGeneraScriptVistaProc - LFVERASLAP
--*Fecha:		Oct 12 2009  4:23PM
--*Objetivo:	        Gerar la vista para tabla FleCatDistEntreCiudades
--*Entrada:
--*Salida:
--*Precondiciones:
--*Revisiones:
--*----	

CREATE VIEW [dbo].[FleCatDistEntreCiudadesVw]
AS
SELECT	ClaUbicacion,
		ClaCiudadOrigen,
		ClaCiudadDestino,
		KmsDistancia,
		EsConTransbordo,
		kmsTramoMontanoso,
		FechaUltimaMod,
		NombrePcMod,
		ClaUsuarioMod,
		BajaLogica,
		FechaBajaLogica
FROM	TiCatalogo.dbo.FleCatDistEntreCiudades WITH (NOLOCK)

-------------
--*** FIN ***
-------------

GO
/****** Object:  View [dbo].[FleCatDistEntreZipCodesVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--*----
--*Objeto:	FleCatDistEntreZipCodesVw
--*Autor:       
--*Fecha:	3-Jul-2008
--*Objetivo:	
--*Revisiones:		
--*		Creacion de Vista- /001 - 3-Jul-2008
--*----
CREATE VIEW  [dbo].[FleCatDistEntreZipCodesVw] AS
	SELECT --ClaUbicacion,
			ZipCodeOrigen,
			ZipCodeDestino,
			MillasDistancia,
			FechaUltimaMod,
			NombrePcMod,
			ClaUsuarioMod,
			BajaLogica,
			FechaBajaLogica
	FROM dbo.FleCatDistEntreZipCodes WITH (NOLOCK)

GO
/****** Object:  View [dbo].[FleCatEjeTransporteVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--*----
--*Objeto:		Vista: FleCatEjeTransporteVw
--*Autor:		SChavez
--*Fecha:		25 MAR 2011
--*Objetivo:	        Gerar la vista para tabla FleCatEjeTransporte
--*Entrada:
--*Salida:
--*Precondiciones:
--*Revisiones:
--*----	

CREATE VIEW [dbo].[FleCatEjeTransporteVw]
AS
	SELECT	ClaEjeTransporte,
			NomEjeTransporte,
			ClaTransporte,
			PesoBrutoMaximo,
			BajaLogica,
			FechaBajaLogica,
			FechaUltimaMod,
			NombrePcMod,
			ClaUsuarioMod
	FROM	dbo.FleCatEjeTransporte WITH (NOLOCK)

-------------
--*** FIN ***
-------------

GO
/****** Object:  View [dbo].[FleCatGrupoTransporteVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--*----
--*Objeto:		Vista: FleCatGrupoTransporteVw
--*Autor:		TiGeneraScriptVistaProc - LFVERASLAP
--*Fecha:		Oct 12 2009  4:23PM
--*Objetivo:	        Gerar la vista para tabla FleCatGrupoTransporte
--*Entrada:
--*Salida:
--*Precondiciones:
--*Revisiones:
--*----	

CREATE VIEW [dbo].[FleCatGrupoTransporteVw]
AS
SELECT	ClaGrupoTransporte,
		NomFleCatGrupoTransporte,
		FechaUltimaMod,
		NombrePcMod,
		ClaUsuarioMod,
		BajaLogica,
		FechaBajaLogica
FROM	TiCatalogo.dbo.FleCatGrupoTransporte WITH (NOLOCK)

-------------
--*** FIN ***
-------------

GO
/****** Object:  View [dbo].[FleCatListaNegraChoferVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--*----
--*Objeto:		Vista: FleCatListaNegraChoferVw
--*Autor:		TiGeneraScriptVistaProc - LFVERASLAP
--*Fecha:		Oct 12 2009  4:23PM
--*Objetivo:	        Gerar la vista para tabla FleCatListaNegraChofer
--*Entrada:
--*Salida:
--*Precondiciones:
--*Revisiones:
--*----	

CREATE VIEW [dbo].[FleCatListaNegraChoferVw]
AS
SELECT	ClaUbicacion,
		ClaChofer,
		Nombre,
		Motivo,
		BajaLogica,
		FechaBajaLogica,
		FechaUltimaMod,
		NombrePcMod,
		ClaUsuarioMod
FROM	TiCatalogo.dbo.FleCatListaNegraChofer WITH (NOLOCK)

-------------
--*** FIN ***
-------------

GO
/****** Object:  View [dbo].[FleCatListaNegraTranspVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--*----
--*Objeto:		Vista: FleCatListaNegraTranspVw
--*Autor:		TiGeneraScriptVistaProc - LFVERASLAP
--*Fecha:		Oct 12 2009  4:23PM
--*Objetivo:	        Gerar la vista para tabla FleCatListaNegraTransp
--*Entrada:
--*Salida:
--*Precondiciones:
--*Revisiones:
--*----	

CREATE VIEW [dbo].[FleCatListaNegraTranspVw]
AS
SELECT	ClaUbicacion,
		ClaTransportista,
		ClaCUP,
		Motivo,
		BajaLogica,
		FechaBajaLogica,
		FechaUltimaMod,
		NombrePcMod,
		ClaUsuarioMod
FROM	TiCatalogo.dbo.FleCatListaNegraTransp WITH (NOLOCK)

-------------
--*** FIN ***
-------------

GO
/****** Object:  View [dbo].[FleCatRangoLtlVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--*----
--*Objeto:		Vista: FleCatRangoLtlVw
--*Autor:		TiGeneraScriptVistaProc - LFVERASLAP
--*Fecha:		Oct 12 2009  4:23PM
--*Objetivo:	        Gerar la vista para tabla FleCatRangoLtl
--*Entrada:
--*Salida:
--*Precondiciones:
--*Revisiones:
--*----	

CREATE VIEW [dbo].[FleCatRangoLtlVw]
AS
SELECT	ClaUbicacion,
		Orden,
		RangoInicial,
		RangoFinal,
		FechaUltimaMod,
		BajaLogica,
		FechaBajaLogica,
		NombrePcMod,
		ClaUsuarioMod
FROM	TiCatalogo.dbo.FleCatRangoLtl WITH (NOLOCK)

-------------
--*** FIN ***
-------------

GO
/****** Object:  View [dbo].[FleCatTipoBoletaVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--*----
--*Objeto:		Vista: FleCatTipoBoletaVw
--*Autor:		TiGeneraScriptVistaProc - LFVERASLAP
--*Fecha:		Oct 12 2009  4:23PM
--*Objetivo:	        Gerar la vista para tabla FleCatTipoBoleta
--*Entrada:
--*Salida:
--*Precondiciones:
--*Revisiones:
--*----	

CREATE VIEW [dbo].[FleCatTipoBoletaVw]
AS
SELECT	ClaUbicacion,
		ClaTipoBoleta,
		EsConDiscrepanciaDefault,
		NomFleCatTipoBoleta,
		ConfigurarSP,
		LoginSp,
		SystemId,
		FechaUltimaMod,
		NombrePcMod,
		ClaUsuarioMod,
		BajaLogica,
		FechaBajaLogica,
		NombreSp
FROM	TiCatalogo.dbo.FleCatTipoBoleta WITH (NOLOCK)

-------------
--*** FIN ***
-------------

GO
/****** Object:  View [dbo].[FleCatTipoConceptoVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--*----
--*Objeto:		Vista: FleCatTipoConceptoVw
--*Autor:		TiGeneraScriptVistaProc - LFVERASLAP
--*Fecha:		Oct 12 2009  4:23PM
--*Objetivo:	        Gerar la vista para tabla FleCatTipoConcepto
--*Entrada:
--*Salida:
--*Precondiciones:
--*Revisiones:
--*----	

CREATE VIEW [dbo].[FleCatTipoConceptoVw]
AS
SELECT	IdTipoConcepto,
		ClaUbicacion,
		NomTipoConcepto,
		FechaUltimaMod,
		NombrePcMod,
		ClaUsuarioMod,
		BajaLogica,
		FechaBajaLogica
FROM	TiCatalogo.dbo.FleCatTipoConcepto WITH (NOLOCK)

-------------
--*** FIN ***
-------------

GO
/****** Object:  View [dbo].[FleCatTipoConvenioVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--*----
--*Objeto:		Vista: FleCatTipoConvenioVw
--*Autor:		TiGeneraScriptVistaProc - LFVERASLAP
--*Fecha:		Oct 12 2009  4:23PM
--*Objetivo:	        Gerar la vista para tabla FleCatTipoConvenio
--*Entrada:
--*Salida:
--*Precondiciones:
--*Revisiones:
--*----	

CREATE VIEW [dbo].[FleCatTipoConvenioVw]
AS
SELECT	ClaUbicacion,
		ClaTipoConvenio,
		NomFleCatTipoConvenio,
		PermiteCapturaManual,
		FechaUltimaMod,
		NombrePcMod,
		ClaUsuarioMod,
		BajaLogica,
		FechaBajaLogica
FROM	TiCatalogo.dbo.FleCatTipoConvenio WITH (NOLOCK)

-------------
--*** FIN ***
-------------

GO
/****** Object:  View [dbo].[FleCatTipoDestinoVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--*----
--*Objeto:		Vista: FleCatTipoDestinoVw
--*Autor:		SChavez
--*Fecha:		20/05/2011
--*Objetivo:	        Generar la vista para tabla FleCatTipoDestino
--*Entrada:
--*Salida:
--*Precondiciones:
--*Revisiones:
--*----	

CREATE VIEW [dbo].[FleCatTipoDestinoVw]
AS
SELECT	ClaTipoDestino,
		NomTipoDestino,
		FechaUltimaMod,
		NombrePcMod,
		ClaUsuarioMod,
		BajaLogica,
		FechaBajaLogica
FROM	TiCatalogo.dbo.FleCatTipoDestino WITH (NOLOCK)

-------------
--*** FIN ***
-------------

GO
/****** Object:  View [dbo].[FleCatTipoGastoFamiliaVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--*----
--*Objeto:		Vista: FleCatTipoGastoFamiliaVw
--*Autor:		SChavez
--*Fecha:		20/05/2011
--*Objetivo:	        Generar la vista para tabla FleCatTipoGastoFamilia
--*Entrada:
--*Salida:
--*Precondiciones:
--*Revisiones:
--*----	

CREATE VIEW [dbo].[FleCatTipoGastoFamiliaVw]
AS
SELECT	ClaTipoGastoFamilia,
		NomTipoGastoFamilia,
		FechaUltimaMod,
		NombrePcMod,
		ClaUsuarioMod,
		BajaLogica,
		FechaBajaLogica
FROM	TiCatalogo.dbo.FleCatTipoGastoFamilia WITH (NOLOCK)

-------------
--*** FIN ***
-------------

GO
/****** Object:  View [dbo].[FleCatTipoTabularVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--*----
--*Objeto:		Vista: FleCatTipoTabularVw
--*Autor:		TiGeneraScriptVistaProc - LFVERASLAP
--*Fecha:		Oct 12 2009  4:23PM
--*Objetivo:	        Gerar la vista para tabla FleCatTipoTabular
--*Entrada:
--*Salida:
--*Precondiciones:
--*Revisiones:
--*----	

CREATE VIEW [dbo].[FleCatTipoTabularVw]
AS
SELECT	ClaUbicacion,
		ClaTipoTabular,
		NomFleCatTipoTabular,
		FechaUltimaMod,
		NombrePcMod,
		ClaUsuarioMod,
		BajaLogica,
		FechaBajaLogica
FROM	TiCatalogo.dbo.FleCatTipoTabular WITH (NOLOCK)

-------------
--*** FIN ***
-------------

GO
/****** Object:  View [dbo].[FleCatTipoViajeVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--*----
--*Objeto:		Vista: FleCatTipoViajeVw
--*Autor:		TiGeneraScriptVistaProc - LFVERASLAP
--*Fecha:		Oct 12 2009  4:23PM
--*Objetivo:	        Gerar la vista para tabla FleCatTipoViaje
--*Entrada:
--*Salida:
--*Precondiciones:
--*Revisiones:
--*----	

CREATE VIEW [dbo].[FleCatTipoViajeVw]
AS
SELECT	IdTipoViaje,
		ClaUbicacion,
		NomFleCatTipoViaje,
		FechaUltimaMod,
		NombrePcMod,
		ClaUsuarioMod
FROM	TiCatalogo.dbo.FleCatTipoViaje WITH (NOLOCK)

-------------
--*** FIN ***
-------------

GO
/****** Object:  View [dbo].[FleCatTipoZonaFletesVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--*----
--*Objeto:		Vista: FleCatTipoZonaFletesVw
--*Autor:		TiGeneraScriptVistaProc - LFVERASLAP
--*Fecha:		Oct 12 2009  4:23PM
--*Objetivo:	        Gerar la vista para tabla FleCatTipoZonaFletes
--*Entrada:
--*Salida:
--*Precondiciones:
--*Revisiones:
--*----	

CREATE VIEW [dbo].[FleCatTipoZonaFletesVw]
AS
SELECT	ClaUbicacion,
		ClaTipoZona,
		FechaUltimaMod,
		NombrePcMod,
		ClaUsuarioMod,
		BajaLogica,
		FechaBajaLogica,
		NomFleCatTipoZonaFletes
FROM	TiCatalogo.dbo.FleCatTipoZonaFletes WITH (NOLOCK)

-------------
--*** FIN ***
-------------

GO
/****** Object:  View [dbo].[FleCatTransporteDistanciaVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--*----
--*Objeto:		Vista: FleCatTransporteDistanciaVw
--*Autor:		TiGeneraScriptVistaProc - LFVERASLAP
--*Fecha:		Oct 12 2009  4:23PM
--*Objetivo:	        Gerar la vista para tabla FleCatTransporteDistancia
--*Entrada:
--*Salida:
--*Precondiciones:
--*Revisiones:
--*----	

CREATE VIEW [dbo].[FleCatTransporteDistanciaVw]
AS
SELECT	ClaUbicacion,
		ClaTransporte,
		DistanciaMaxKms,
		FechaUltimaMod,
		NombrePcMod,
		ClaUsuarioMod,
		BajaLogica,
		FechaBajaLogica
FROM	TiCatalogo.dbo.FleCatTransporteDistancia WITH (NOLOCK)

-------------
--*** FIN ***
-------------

GO
/****** Object:  View [dbo].[FleCatTransporteFfccVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	CREATE VIEW [dbo].[FleCatTransporteFfccVw]  
AS  
SELECT     ClaTransporte, ClaGrupoTransporte, NomFleCatTransporte, Cubicaje, Fondo, Alto, Largo, Capacidad, FechaUltimaMod, NombrePcMod, ClaUsuarioMod,   
                      BajaLogica, FechaBajaLogica  
FROM         dbo.FleCatTransporte  
WHERE     (ClaGrupoTransporte = 2)  
 
 
--USE [TiCatalogo]
 
 

GO
/****** Object:  View [dbo].[FleCatTransporteVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--*----
--*Objeto:		Vista: FleCatTransporteVw
--*Autor:		TiGeneraScriptVistaProc - LFVERASLAP
--*Fecha:		Oct 12 2009  4:23PM
--*Objetivo:	        Gerar la vista para tabla FleCatTransporte
--*Entrada:
--*Salida:
--*Precondiciones:
--*Revisiones:
--*----	

CREATE VIEW [dbo].[FleCatTransporteVw]
AS
SELECT	ClaTransporte,
		ClaGrupoTransporte,
		NomFleCatTransporte,
		Capacidad,
		Largo,
		Alto,
		Fondo,
		Cubicaje,
		FechaUltimaMod,
		NombrePcMod,
		ClaUsuarioMod,
		BajaLogica,
		FechaBajaLogica,
		KmsMaximos,
		EsContenedor,
		EsAplicableCubicaje
FROM	TiCatalogo.dbo.FleCatTransporte WITH (NOLOCK)

-------------
--*** FIN ***
-------------

GO
/****** Object:  View [dbo].[FleCatTransportistaConCupVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--*----
----*----
----*Objeto:		Vista: FleCatTransportistaConCupVw
----*Autor:		LFVERAS
----*Fecha:		Ene 21 2010 5:48PM
----*Objetivo:	        Gerar la vista para tabla FleCatTransportistaConCupVw
----*Entrada:
----*Salida:
----*Precondiciones:
----*Revisiones:       Luis Verastegui , se agrega validacion de ClaCUP y Join a TiCatUbicacion para empresa
----*----	

CREATE VIEW [dbo].[FleCatTransportistaConCupVw]
AS

SELECT 
                T.ClaUbicacion,
                T.ClaTransportista,
                T.ClaBeneficiario,
                T.NumTransportista,
                T.Nombre,
                T.Abreviacion,
                T.CobroPrimaCombustible,
                T.PorcCobroPrimaCombustible,
                T.EsNacional,
                T.PlazoParaPago,
                T.ClaGrupoTransporte,
                T.PorcDPPP,
                T.PorcIVA,
                T.PorcRetencion,
                T.DescuentoProntoPago,
                --T.Calle,
                --T.Colonia,
                T.ClaCiudad,
                T.ClaEstado,
                T.ClaPais,
                T.Telefono1,
                T.Telefono2,
                BF.ClaCUP,
                T.FechaUltimaMod,
                T.NombrePcMod,
                T.ClaUsuarioMod,
                T.BajaLogica,
                T.FechaBajaLogica
FROM  TiCatalogo.dbo.FleCatTransportista T
      INNER JOIN TiCatalogo.dbo.TiCatUbicacion U  WITH (NOLOCK) ON
	T.ClaUbicacion = U.ClaUbicacion
      INNER JOIN TiCatalogo.dbo.ConCatBeneficiario BF  WITH (NOLOCK) ON
	U.ClaEmpresa = BF.ClaEmpresa AND
	T.ClaBeneficiario = BF.ClaBeneficiario
WHERE ISNULL(BF.ClaCUP,0) != 0



GO
/****** Object:  View [dbo].[FleCatZipCodeVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--*----
--*Objeto:		Vista: FleCatZipCodeVw
--*Autor:		SChavez
--*Fecha:		02/12/2010
--*Objetivo:	        Gerar la vista para tabla FleCatZipCode
--*Entrada:
--*Salida:
--*Precondiciones:
--*Revisiones:
--*----	

CREATE VIEW [dbo].[FleCatZipCodeVw]
AS
SELECT	ZipCode,
		NomZipCode,
		ClaPais,
		FechaUltimaMod,
		NombrePcMod,
		ClaUsuarioMod,
		BajaLogica,
		FechaBajaLogica
FROM	TiCatalogo.dbo.FleCatZipCode WITH (NOLOCK)

-------------
--*** FIN ***
-------------

GO
/****** Object:  View [dbo].[FleCatZonaFletesDetVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--*----
--*Objeto:		Vista: FleCatZonaFletesDetVw
--*Autor:		TiGeneraScriptVistaProc - LFVERASLAP
--*Fecha:		Oct 12 2009  4:23PM
--*Objetivo:	        Gerar la vista para tabla FleCatZonaFletesDet
--*Entrada:
--*Salida:
--*Precondiciones:
--*Revisiones:
--*----	

CREATE VIEW [dbo].[FleCatZonaFletesDetVw]
AS
SELECT	ClaUbicacion,
		ClaDetalleZona,
		ClaZona,
		ClaCiudad,
		--NumZipCode,
		ClaEstado,
		ClaPais,
		Nivel,
		FechaUltimaMod,
		NombrePcMod,
		ClaUsuarioMod,
		BajaLogica,
		FechaBajaLogica
FROM	TiCatalogo.dbo.FleCatZonaFletesDet WITH (NOLOCK) 

-------------
--*** FIN ***
-------------

GO
/****** Object:  View [dbo].[FleCatZonaFletesVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--*----
--*Objeto:		Vista: FleCatZonaFletesVw
--*Autor:		TiGeneraScriptVistaProc - LFVERASLAP
--*Fecha:		Oct 12 2009  4:23PM
--*Objetivo:	        Gerar la vista para tabla FleCatZonaFletes
--*Entrada:
--*Salida:
--*Precondiciones:
--*Revisiones:
--*----	

CREATE VIEW [dbo].[FleCatZonaFletesVw]
AS
SELECT	ClaUbicacion,
		ClaZona,
		ClaTipoZona,
		NomFleCatZonasFletes,
		FechaUltimaMod,
		NombrePcMod,
		ClaUsuarioMod,
		BajaLogica,
		FechaBajaLogica
FROM	TiCatalogo.dbo.FleCatZonaFletes WITH (NOLOCK)

-------------
--*** FIN ***
-------------

GO
/****** Object:  View [dbo].[FleTraCubicajeProductoVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--*----
--*Objeto:		Vista: FleTraCubicajeProductoVw
--*Autor:		SChavez
--*Fecha:		11 05 2011
--*Objetivo:	        Gerar la vista para tabla FleTraCubicajeProducto
--*Entrada:
--*Salida:
--*Precondiciones:
--*Revisiones:
--*----	

CREATE VIEW [dbo].[FleTraCubicajeProductoVw]
AS
	SELECT	ClaUbicacion,
			ClaTransporte,
			FolProducto,
			FactorCubicaje,
			BajaLogica,
			FechaBajaLogica,
			FechaUltimaMod,
			NombrePcMod,
			ClaUsuarioMod
	FROM	TiCatalogo.dbo.FleTraCubicajeProducto WITH (NOLOCK)

-------------
--*** FIN ***
-------------

GO
/****** Object:  View [dbo].[FleTraFuelSurchargevw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW  [dbo].[FleTraFuelSurchargevw] AS  
SELECT  
ClaUbicacion,  
ClaTransportista,  
AnioMes,  
ClaTipoMaterialFfcc,  
Porcentaje,  
CuotaPorMilla,  
FechaUltimaMod ,  
NombrePcMod,  
ClaUsuarioMod  
FROM FFCC.FFCCSCH.FFCCTraFuelSurcharge WITH (NOLOCK)  







GO
/****** Object:  View [dbo].[InaCatAgrupadorFamiliaVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--*----
--*Objeto:	InaCatAgrupadorFamiliaVw
--*Autor:       Luis F Verastegui
--*Fecha:	30-Jul-2008
--*Objetivo:	Vista Catalogo Agrupador Familia Inventario Anual
--*Revisiones:		
--*		Creacion de Vista- /001 - 30-Jul-2008
--*----		

CREATE VIEW [dbo].[InaCatAgrupadorFamiliaVw]
AS
SELECT	ClaUbicacion,
		ClaTipoInventario,
		ClaAgrupador,
		NomAgrupadorFamilia,
		BajaLogica,
		FechaBajaLogica,
		ClaUsuarioMod,
		FechaUltimaMod,
		NombrePCMod
FROM	TiCatalogo.dbo.InaCatAgrupadorFamilia  WITH (NOLOCK)


GO
/****** Object:  View [dbo].[InaCatAreaFisicoVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--*----
--*Objeto:	InaCatAreaFisicoVw
--*Autor:       Nombre del autor
--*Fecha:
--*Objetivo:	Vista a Area
--*Revisiones:		
--*		Creacion de Vista- /001 - 21-May-2008
--*----		

CREATE VIEW [dbo].[InaCatAreaFisicoVw]
AS

	SELECT 	ClaAreaFisico,
		ClaUbicacion,
		ClaTipoInventario,
		NomAreaFisico,
		BajaLogica,
		FechaBajaLogica,
		ClaUsuarioMod,
		FechaUltimaMod,
		NombrePCMod
	FROM 	TiCatalogo.dbo.InaCatAreaFisico  WITH (NOLOCK)


GO
/****** Object:  View [dbo].[InaCatEstatusBoletaInvVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--*----
--*Objeto:	InaCatEstatusBoletaInvVw
--*Autor:       Luis F Verastegui
--*Fecha:	30-Jul-2008
--*Objetivo:	Vista Catalogo Estatus Boleta Inventario Anual
--*Revisiones:		
--*		Creacion de Vista- /001 - 30-Jul-2008
--*----		

CREATE VIEW [dbo].[InaCatEstatusBoletaInvVw]
AS
SELECT	ClaUbicacion,
		ClaTipoInventario,
		ClaEstatusBoleta,
		NomEstatusBoletaInv,
		BajaLogica,
		FechaBajaLogica,
		ClaUsuarioMod,
		FechaUltimaMod,
		NombrePCMod
FROM	TiCatalogo.dbo.InaCatEstatusBoletaInv  WITH (NOLOCK)

GO
/****** Object:  View [dbo].[InaCatEstatusInvFisicoVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--*----
--*Objeto:	InaCatEstatusInvFisicoVw
--*Autor:       Luis F Verastegui
--*Fecha:	30-Jul-2008
--*Objetivo:	Vista Catalogo Estatus Inventario Fisico Inventario Anual
--*Revisiones:		
--*		Creacion de Vista- /001 - 30-Jul-2008
--*----		

CREATE VIEW [dbo].[InaCatEstatusInvFisicoVw]
AS
SELECT		ClaTipoInventario,
		ClaEstatusInventarioFisico,
		NomEstatusInvFisico,
		BajaLogica,
		FechaBajaLogica,
		ClaUsuarioMod,
		FechaUltimaMod,
		NombrePCMod
FROM	TiCatalogo.dbo.InaCatEstatusInvFisico  WITH (NOLOCK)

GO
/****** Object:  View [dbo].[InaCatInvFisicoVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--*----
--*Objeto:	InaCatInvFisicoVw
--*Autor:       Luis F Verastegui
--*Fecha:	30-Jul-2008
--*Objetivo:	Vista Catalogo Inventario Fisico Inventario Anual
--*Revisiones:		
--*		Creacion de Vista- /001 - 30-Jul-2008
--*----		

CREATE VIEW [dbo].[InaCatInvFisicoVw]
AS
SELECT	ClaUbicacion,
		ClaTipoInventario,
		ClaInventarioFisico,
		ClaMovimientoInventario,
		ClaBoletaInventarioFinal,
		ClaBoletaInventarioInicial,
		ClaEstatusInventarioFisico,
		ClaFotoInventarioAnualFinal,
		EsOficial,
		FechaCierre,
		FechaPreCierrre,
		FechaUltimaComparativa,
		NombreInventarioFisico,
		BajaLogica,
		FechaBajaLogica,
		ClaUsuarioMod,
		FechaUltimaMod,
		NombrePCMod
FROM	TiCatalogo.dbo.InaCatInvFisico  WITH (NOLOCK)


GO
/****** Object:  View [dbo].[InaCatTipoTaraVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--*----
--*Objeto:	InaCatTipoTaraVw
--*Autor:       Luis F Verastegui
--*Fecha:	30-Jul-2008
--*Objetivo:	Vista Tipo Tara Inventario Anual
--*Revisiones:		
--*		Creacion de Vista- /001 - 30-Jul-2008
--*----	

CREATE VIEW [dbo].[InaCatTipoTaraVw]
AS

SELECT	ClaUbicacion,
		ClaTipoInventario,
		ClaTipoTara,
		NomTipoTara,
		PesoTeorico,
		BajaLogica,
		FechaBajaLogica,
		ClaUsuarioMod,
		FechaUltimaMod,
		NombrePCMod
FROM	TiCatalogo.dbo.InaCatTipoTara  WITH (NOLOCK)

GO
/****** Object:  View [dbo].[InaCatUsoFisicoVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--*----
--*Objeto:	InaCatUsoFisicoVw
--*Autor:       Nombre del autor
--*Fecha:
--*Objetivo:	Vista a Uso
--*Revisiones:		
--*		Creacion de Vista- /001 - 21-May-2008
--*----		

CREATE VIEW [dbo].[InaCatUsoFisicoVw]
AS
SELECT ClaUsoFisico,
	ClaTipoInventario,
	NomUsoFisico,
	BajaLogica,
	FechaBajaLogica,
	ClaUsuarioMod,
	FechaUltimaMod,
	NombrePCMod
FROM TiCatalogo..InaCatUsoFisico

GO
/****** Object:  View [dbo].[InvCatAgrupadorInventarioFisicoVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[InvCatAgrupadorInventarioFisicoVw]
AS
SELECT     ClaAgrupadorInventarioFisico, NombreAgrupadorInventarioFisico, BajaLogica, FechaBajaLogica, FechaUltimaMod, NombrePcMod, ClaUsuarioMod, 
                      FechaIns, ClaUsuarioIns
FROM         dbo.InvCatAgrupadorInventarioFisico
 

GO
/****** Object:  View [dbo].[InvCatAlmacenVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--*----
--*Objeto:	InvCatAlmacenVw
--*Autor:       Luis F Verastegui
--*Fecha:	14-Jul-2008
--*Objetivo:	Vista Almacen Inventarios
--*Revisiones:		
--*		Creacion de Vista- /001 - 14-Jul-2008
--*----		
CREATE VIEW [dbo].[InvCatAlmacenVw]
as
Select	ClaAlmacen,
		ClaTipoInventario,
		ClaUbicacion,
		NomAlmacen,
		PermiteExistenciaNegativa,
		UltimoNivelAfectable,
		BajaLogica,
		FechaBajaLogica,
		FechaUltimaMod,
		ClaUsuarioMod,
		NombrePcMod
From	TiCatalogo.dbo.InvCatAlmacen WITH (NOLOCK)
 

GO
/****** Object:  View [dbo].[InvCatAreaInventarioFisicoVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[InvCatAreaInventarioFisicoVw]
AS
SELECT     ClaAreaInventarioFisico, NombreAreaInventarioFisico, BajaLogica, FechaBajaLogica, FechaUltimaMod, FechaIns
FROM         dbo.InvCatAreaInventarioFisico
 

GO
/****** Object:  View [dbo].[InvCatEstilosVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--*----
--*Objeto:	InvCatEstilosVw
--*Autor:       Luis F Verastegui
--*Fecha:	14-Jul-2008
--*Objetivo:	Vista Estilos Inventarios
--*Revisiones:		
--*		Creacion de Vista- /001 - 14-Jul-2008
--*----	
CREATE VIEW [dbo].[InvCatEstilosVw]
as
Select	ClaEstilo,
		ClaUbicacion,
		ClaTipoInventario,
		ClaReporte,
		NomEstilos,
		BajaLogica,
		FechaBajaLogica,
		FechaUltimaMod,
		ClaUsuarioMod,
		NombrePcMod
From	TiCatalogo.dbo.InvCatEstilos WITH (NOLOCK)
 

GO
/****** Object:  View [dbo].[InvCatGrupoTMA2Vw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--*----
--*Objeto:	InvCatGrupoTMA2Vw
--*Autor:       Luis F Verastegui
--*Fecha:	14-Jul-2008
--*Objetivo:	Vista GrupoTMA2 Inventarios
--*Revisiones:		
--*		Creacion de Vista- /001 - 14-Jul-2008
--*----	
CREATE VIEW [dbo].[InvCatGrupoTMA2Vw]
as
Select	ClaGrupoTMA2,
		ClaTipoInventario,
		NomGrupoTMA2,
		EsBascula,
		BajaLogica,
		FechaBajaLogica,
		FechaUltimaMod,
		ClaUsuarioMod,
		NombrePcMod
From	TiCatalogo.dbo.InvCatGrupoTMA2 WITH (NOLOCK)
 

GO
/****** Object:  View [dbo].[InvCatGrupoTMAVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--*----
--*Objeto:	InvCatGrupoTMAVw
--*Autor:       Luis F Verastegui
--*Fecha:	14-Jul-2008
--*Objetivo:	Vista GrupoTMA Inventarios
--*Revisiones:		
--*		Creacion de Vista- /001 - 14-Jul-2008
--*----	
CREATE VIEW [dbo].[InvCatGrupoTMAVw]
as
Select	ClaGrupoTMA,
		ClaTipoInventario,
		ClaTipoTramite,
		NomGrupoTMA,
		MaximaDiferencia,
		NumeroObjeto,
		PorcentajeTolerancia,
		SignificadoEntero1,
		SignificadoEntero2,
		SignificadoEntero3,
		SignificadoEntero4,
		SignificadoEntero5,
		SignificadoEntero6,
		SignificadoEntero7,
		SignificadoEntero8,
		SignificadoEntero9,
		SignificadoEntero10,
		SignificadoTexto1,
		SignificadoTexto2,
		SignificadoTexto3,
		SignificadoTexto4,
		SignificadoTexto5,
		SignificadoTexto6,
		SignificadoTexto7,
		SignificadoTexto8,
		SignificadoTexto9,
		SignificadoTexto10,
		BajaLogica,
		FechaBajaLogica,
		FechaUltimaMod,
		ClaUsuarioMod,
		NombrePcMod
From	TiCatalogo.dbo.InvCatGrupoTMA WITH (NOLOCK)
 

GO
/****** Object:  View [dbo].[InvCatListaInvDetVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--*----
--*Objeto:	InvCatListaInvDetVw
--*Autor:       Luis F Verastegui
--*Fecha:	14-Jul-2008
--*Objetivo:	Vista Detalle Lista Inventarios
--*Revisiones:		
--*		Creacion de Vista- /001 - 14-Jul-2008
--*----	
CREATE VIEW [dbo].[InvCatListaInvDetVw]
as
Select	ClaLista,
		ClaUbicacion,
		IdRenglon,
		ClaTipoInventario,
		ClaArticulo,
		ClaUnidadConteo,
		FactorConversion,
		BajaLogica,
		FechaBajaLogica,
		FechaUltimaMod,
		ClaUsuarioMod,
		NombrePcMod
From	TiCatalogo.dbo.InvCatListaInvDet WITH (NOLOCK)
 

GO
/****** Object:  View [dbo].[InvCatListaInvEncVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--*----
--*Objeto:	InvCatListaInvEncVw
--*Autor:       Luis F Verastegui
--*Fecha:	14-Jul-2008
--*Objetivo:	Vista Encabezado Lista Inventarios
--*Revisiones:		
--*		Creacion de Vista- /001 - 14-Jul-2008
--*----	
CREATE VIEW [dbo].[InvCatListaInvEncVw]
as
Select	ClaLista,
		ClaUbicacion,
		ClaTipoInventario,
		ClaAlmacen,
		ClaSeccion,
		ClaSubAlmacen,
		ClaSubSubAlmacen,
		NomListaInvEnc,
		PermiteFactorConversion,
		PermiteReferencia,
		PermiteUnidad,
		BajaLogica,
		FechaBajaLogica,
		FechaUltimaMod,
		ClaUsuarioMod,
		NombrePcMod
From	TiCatalogo.dbo.InvCatListaInvEnc WITH (NOLOCK)
 

GO
/****** Object:  View [dbo].[InvCatMotivosInvVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--*----
--*Objeto:	InvCatMotivosInvVw
--*Autor:       Luis F Verastegui
--*Fecha:	14-Jul-2008
--*Objetivo:	Vista Motivos Inventarios
--*Revisiones:		
--*		Creacion de Vista- /001 - 14-Jul-2008
--*----	
CREATE VIEW [dbo].[InvCatMotivosInvVw]
as
Select	ClaMotivoInventario,
		ClaTipoInventario,
		ClaUbicacion,
		ClaTipoMotivo,
		NomMotivosInv,
		BajaLogica,
		FechaBajaLogica,
		FechaUltimaMod,
		ClaUsuarioMod,
		NombrePcMod
From	TiCatalogo.dbo.InvCatMotivosInv WITH (NOLOCK)
 

GO
/****** Object:  View [dbo].[InvCatSeccionVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--*----
--*Objeto:	InvCatSeccionVw
--*Autor:       Luis F Verastegui
--*Fecha:	14-Jul-2008
--*Objetivo:	Vista Seccion Inventarios
--*Revisiones:		
--*		Creacion de Vista- /001 - 14-Jul-2008
--*----		
CREATE VIEW [dbo].[InvCatSeccionVw]
as
Select	ClaSeccion,
		ClaUbicacion,
		ClaAlmacen,
		ClaSubAlmacen,
		ClaSubSubAlmacen,
		ClaTipoInventario,
		NomSeccion,
		PermiteExistenciaNegativa,
		UltimoNivelAfectable,
		BajaLogica,
		FechaBajaLogica,
		FechaUltimaMod,
		ClaUsuarioMod,
		NombrePcMod
From	TiCatalogo.dbo.InvCatSeccion WITH (NOLOCK)
 

GO
/****** Object:  View [dbo].[InvCatSubAlmacenVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--*----
--*Objeto:	InvCatSubAlmacenVw
--*Autor:       Luis F Verastegui
--*Fecha:	14-Jul-2008
--*Objetivo:	Vista SubAlmacen Inventarios
--*Revisiones:		
--*		Creacion de Vista- /001 - 14-Jul-2008
--*----	
CREATE VIEW [dbo].[InvCatSubAlmacenVw]
as
Select	ClaSubAlmacen,
		ClaAlmacen,
		ClaTipoInventario,
		ClaUbicacion,
		NomSubAlmacen,
		PermiteExistenciaNegativa,
		UltimoNivelAfectable,
		BajaLogica,
		FechaBajaLogica,
		FechaUltimaMod,
		ClaUsuarioMod,
		NombrePcMod
From	TiCatalogo.dbo.InvCatSubAlmacen WITH (NOLOCK)
 

GO
/****** Object:  View [dbo].[InvCatSubSubAlmacenVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--*----
--*Objeto:	InvCatSubSubAlmacenVw
--*Autor:       Luis F Verastegui
--*Fecha:	14-Jul-2008
--*Objetivo:	Vista SubSubAlmacen Inventarios
--*Revisiones:		
--*		Creacion de Vista- /001 - 14-Jul-2008
--*----	
CREATE VIEW [dbo].[InvCatSubSubAlmacenVw]
as
Select	ClaSubSubAlmacen,
		ClaSubAlmacen,
		ClaAlmacen,
		ClaUbicacion,
		ClaTipoInventario,
		NomSubSubAlmacen,
		PermiteExistenciaNegativa,
		UltimoNivelAfectable,
		BajaLogica,
		FechaBajaLogica,
		FechaUltimaMod,
		ClaUsuarioMod,
		NombrePcMod
From	TiCatalogo.dbo.InvCatSubSubAlmacen WITH (NOLOCK)
 

GO
/****** Object:  View [dbo].[InvCatTiempoOriDestVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--*----
--*Objeto:	InvCatTiempoOriDestVw
--*Autor:       Luis F Verastegui
--*Fecha:	14-Jul-2008
--*Objetivo:	Vista Tiempo Origen Destino Inventarios
--*Revisiones:		
--*		Creacion de Vista- /001 - 14-Jul-2008
--*----	
CREATE VIEW [dbo].[InvCatTiempoOriDestVw]
as
Select	ClaGrupoTransporte,
		ClaUbicacionDestino,
		ClaUbicacionOrigen,
		ClaTipoInventario,
		TiempoEstimado,
		TiempoMaximo,
		BajaLogica,
		FechaBajaLogica,
		FechaUltimaMod,
		ClaUsuarioMod,
		NombrePcMod
From	TiCatalogo.dbo.InvCatTiempoOriDest WITH (NOLOCK)
 

GO
/****** Object:  View [dbo].[InvCatTipoClaveMovVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--*----
--*Objeto:	InvCatTipoClaveMovVw
--*Autor:       Luis F Verastegui
--*Fecha:	14-Jul-2008
--*Objetivo:	Vista Tipo Clave Movimiento Inventarios
--*Revisiones:		
--*		Creacion de Vista- /001 - 14-Jul-2008
--*----	
CREATE VIEW [dbo].[InvCatTipoClaveMovVw]
as
Select	ClaUbicacion,
		ClaTipoInventario,
		ClaTipoClaveMovimiento,
		NomTipoClaveMovimiento,
		BajaLogica,
		FechaBajaLogica,
		FechaUltimaMod,
		ClaUsuarioMod,
		NombrePcMod
From	TiCatalogo.dbo.InvCatTipoClaveMov WITH (NOLOCK)
 

GO
/****** Object:  View [dbo].[InvCatTipoInvVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

 
--*----
--*Objeto:		Vista: InvCatTipoInvVw
--*Autor:		TiGeneraScriptVistaProc - DCSHGARCIALAP
--*Fecha:		Feb 17 2010  7:56AM
--*Objetivo:	Generar la vista para tabla InvCatTipoInv
--*Entrada:
--*Salida:
--*Precondiciones:
--*Revisiones:
--*----	
 
CREATE VIEW [dbo].[InvCatTipoInvVw]
AS
SELECT	ClaTipoInventario,
		NomTipoInv,
		BajaLogica,
		FechaBajaLogica,
		FechaUltimaMod,
		ClaUsuarioMod,
		NombrePcMod
FROM	TiCatalogo.dbo.InvCatTipoInv WITH (NOLOCK)
 
-------------
--*** FIN ***
-------------
 
 

GO
/****** Object:  View [dbo].[InvCatTipoMotivosVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--*----
--*Objeto:	InvCatTipoMotivosVw
--*Autor:       Luis F Verastegui
--*Fecha:	14-Jul-2008
--*Objetivo:	Vista Tipo Motivos Inventarios
--*Revisiones:		
--*		Creacion de Vista- /001 - 14-Jul-2008
--*----	
CREATE VIEW [dbo].[InvCatTipoMotivosVw]
as
Select	ClaTipoMotivo,
		ClaTipoInventario,
		NomTipoMotivos,
		BajaLogica,
		FechaBajaLogica,
		FechaUltimaMod,
		ClaUsuarioMod,
		NombrePcMod
From	TiCatalogo.dbo.InvCatTipoMotivos WITH (NOLOCK)
 

GO
/****** Object:  View [dbo].[InvCatTipoTaraInventarioFisicoVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[InvCatTipoTaraInventarioFisicoVw]
AS
SELECT     ClaUbicacion, ClaTipoTaraInventarioFisico, NombreTipoTaraInventarioFisico, PesoKgs, BajaLogica, FechaBajaLogica, FechaUltimaMod, 
                      FechaIns
FROM         dbo.InvCatTipoTaraInventarioFisico
 

GO
/****** Object:  View [dbo].[InvCatTMAVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--*----
--*Objeto:	InvCatTMAVw
--*Autor:       Luis F Verastegui
--*Fecha:	14-Jul-2008
--*Objetivo:	Vista TMA Inventarios
--*Revisiones:		
--*		Creacion de Vista- /001 - 14-Jul-2008
--*----	
CREATE VIEW [dbo].[InvCatTMAVw]
as
Select	ClaTMA,
		ClaTipoInventario,
		ClaGrupoTMA,
		ClaveTMA,
		ClaGrupoTMA2,
		ClaArticuloCuentaPuente,
		ClaTMAContraparte,
		ClaTMAEntrada,
		ClaTMASalida,
		NomTMA,
		AfectaCuentaPuente,
		EntradaOSalida,
		EsCuentaPuente,
		EsMercanciaEnTransito,
		RequiereArticuloActivo,
		SignificadoEntero1,
		SignificadoEntero2,
		SignificadoEntero3,
		SignificadoEntero4,
		SignificadoEntero5,
		SignificadoEntero6,
		SignificadoTexto1,
		SignificadoTexto2,
		BajaLogica,
		FechaBajaLogica,
		FechaUltimaMod,
		ClaUsuarioMod,
		NombrePcMod
From	TiCatalogo.dbo.InvCatTMA WITH (NOLOCK)
 

GO
/****** Object:  View [dbo].[InvCatUsoInventarioFisicoVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[InvCatUsoInventarioFisicoVw]
AS
SELECT     ClaUbicacion, ClaUsoInventarioFisico, NombreUsoInventarioFisico, BajaLogica, FechaBajaLogica, FechaUltimaMod, FechaIns
FROM         dbo.InvCatUsoInventarioFisico
 

GO
/****** Object:  View [dbo].[InvRelAgrupadorFamiliasVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[InvRelAgrupadorFamiliasVw]
AS
SELECT     ClaUbicacion, ClaFamilia, ClaAgrupadorInventarioFisico, PorcentajeMaxTeoricoReal, BajaLogica, FechaBajaLogica, FechaUltimaMod, NombrePcMod, 
                      ClaUsuarioMod, FechaIns, ClaUsuarioIns
FROM         dbo.InvRelAgrupadorFamilias
 

GO
/****** Object:  View [dbo].[InvRelListaInvRespVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--*----
--*Objeto:	InvRelListaInvRespVw
--*Autor:       Luis F Verastegui
--*Fecha:	12-Sep-2008
--*Objetivo:	Vista Lista Inventario Responsable
--*Revisiones:		
--*		Creacion de Vista- /001 - 12-Sep-2008
--*----		
CREATE VIEW [dbo].[InvRelListaInvRespVw]
AS
SELECT	ClaLista,
		ClaUbicacion,
		ClaUsuario,
		ClaTipoInventario,
		BajaLogica,
		FechaBajaLogica,
		FechaUltimaMod,
		ClaUsuarioMod,
		NombrePcMod
FROM	TiCatalogo.dbo.InvRelListaInvResp
 

GO
/****** Object:  View [dbo].[InvRelProductoPesajeRealVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[InvRelProductoPesajeRealVw]
AS
SELECT     ClaUbicacion, ClaProducto, BajaLogica, FechaBajaLogica, FechaUltimaMod, FechaIns
FROM         dbo.InvRelProductoPesajeReal
 

GO
/****** Object:  View [dbo].[InvTraReferenciaDetVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--*----
--*Objeto:	InvTraReferenciaDetVw
--*Autor:       Nombre del autor
--*Fecha:	28-May-2008
--*Objetivo:	Vista a Referencias Det
--*Revisiones:		
--*		Creacion de Vista- /001 - 28-May-2008
--*----		
CREATE VIEW [dbo].[InvTraReferenciaDetVw]
AS
 
	Select 	Distinct
		ClaUbicacion	= 1, 
		ClaReferencia 	= null, --Cla_Pedido,
		ClaArticulo 	= null, --Fol_Producto,
		ClaTipoInventario = 1
	--From 	[DCS-SUMINISTRO].operofi.operacion.t101_ren_pedido
	UNION 
 
	Select 	Distinct
		ClaUbicacion	= 1, 
		ClaReferencia 	= null,	--Cla_Pedido,
		ClaArticulo 	= null,	--Fol_Producto,
		ClaTipoInventario = 1
	--From 	[DCS-SUMINISTRO].operofi.operacion.t101_ren_pedido
 

GO
/****** Object:  View [dbo].[InvTraReferenciaEncVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--*----
--*Objeto:	InvTraReferenciaEncVw
--*Autor:       Nombre del autor
--*Fecha:	28-May-2008
--*Objetivo:	Vista a Referencias Enc
--*Revisiones:		
--*		Creacion de Vista- /001 - 28-May-2008
--*----		
CREATE VIEW [dbo].[InvTraReferenciaEncVw]
AS
 
	Select 	ClaUbicacion= 1,
		ClaReferencia = null	--cla_pedido
	--From 	[DCS-SUMINISTRO].operofi.operacion.t101_pedido
 

GO
/****** Object:  View [dbo].[ManCatAreaVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--*----
--*Objeto:		Vista: ManCatAreaVw
--*Autor:		TiGeneraScriptVistaProc - DCSHGARCIALAP
--*Fecha:		Feb 17 2010  7:57AM
--*Objetivo:	Generar la vista para tabla ManCatArea
--*Entrada:
--*Salida:
--*Precondiciones:
--*Revisiones:
--*----	

CREATE VIEW [dbo].[ManCatAreaVw]
AS
SELECT	ClaArea,
		ClaveArea,
		NombreArea,
		ClaDepartamento,
		AcumulaSN,
		ServicioSN,
		BajaLogica,
		FechaBajaLogica,
		FechaUltimaMod,
		NombrePcMod,
		ClaUsuarioMod
FROM	TiCatalogo.dbo.ManCatArea WITH (NOLOCK)

-------------
--*** FIN ***
-------------


GO
/****** Object:  View [dbo].[ManCatArticuloDimensionVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--*----
--*Objeto:		Vista: ManCatArticuloDimensionVw
--*Autor:		TiGeneraScriptVistaProc - DCSHGARCIALAP
--*Fecha:		Feb 17 2010  7:57AM
--*Objetivo:	Generar la vista para tabla ManCatArticuloDimension
--*Entrada:
--*Salida:
--*Precondiciones:
--*Revisiones:
--*----	

CREATE VIEW [dbo].[ManCatArticuloDimensionVw]
AS
SELECT	ClaArticulo,
		DiametroMtsInd,
		LargoMtsInd,
		AltoMtsInd,
		AnchoMtsInd,
		PesoTaraKgsInd,
		DiametroMtsAgrup,
		LargoMtsAgrup,
		AltoMtsAgrup,
		AnchoMtsAgrup,
		PesoTaraKgsAgrup,
		Comentarios,
		FechaUltimaMod,
		NombrePcMod,
		ClaUsuarioMod
FROM	TiCatalogo.dbo.ManCatArticuloDimension WITH (NOLOCK)

-------------
--*** FIN ***
-------------


GO
/****** Object:  View [dbo].[ManCatDatosPorPlantaVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	 
	 
	 CREATE VIEW [dbo].[ManCatDatosPorPlantaVw]  
AS  
SELECT  ClaUbicacion,   
  ClaProducto,   
  ClaGrupoCosteo,   
  FechaUltimaMod,   
  BajaLogica,   
  FechaBajaLogica,   
  FechaIns  
FROM    dbo.ManCatDatosPorPlanta  
	 
	 
	 
	 

GO
/****** Object:  View [dbo].[ManCatDatoTecnicoVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--*----
--*Objeto:		Vista: ManCatDatoTecnicoVw
--*Autor:		TiGeneraScriptVistaProc - DCSHGARCIALAP
--*Fecha:		Feb 17 2010  7:57AM
--*Objetivo:	Generar la vista para tabla ManCatDatoTecnico
--*Entrada:
--*Salida:
--*Precondiciones:
--*Revisiones:
--*----	

CREATE VIEW [dbo].[ManCatDatoTecnicoVw]
AS
SELECT	ClaTecnologia,
		ClaDatoTecnico,
		NomDatoTecnico,
		BajaLogica,
		FechaBajaLogica,
		FechaUltimaMod,
		NombrePcMod,
		ClaUsuarioMod
FROM	TiCatalogo.dbo.ManCatDatoTecnico WITH (NOLOCK)

-------------
--*** FIN ***
-------------


GO
/****** Object:  View [dbo].[ManCatDepartamentoVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--*----
--*Objeto:		Vista: ManCatDepartamentoVw
--*Autor:		TiGeneraScriptVistaProc - DCSHGARCIALAP
--*Fecha:		Feb 17 2010  7:57AM
--*Objetivo:	Generar la vista para tabla ManCatDepartamento
--*Entrada:
--*Salida:
--*Precondiciones:
--*Revisiones:
--*----	

CREATE VIEW [dbo].[ManCatDepartamentoVw]
AS
SELECT	ClaDepartamento,
		ClaveDepartamento,
		NombreDepartamento,
		ClaTipoDepartamento,
		BajaLogica,
		FechaBajaLogica,
		FechaUltimaMod,
		NombrePcMod,
		ClaUsuarioMod
FROM	TiCatalogo.dbo.ManCatDepartamento WITH (NOLOCK)

-------------
--*** FIN ***
-------------


GO
/****** Object:  View [dbo].[ManCatEmpaqueVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--*----
--*Objeto:		Vista: ManCatEmpaqueVw
--*Autor:		TiGeneraScriptVistaProc - DCSHGARCIALAP
--*Fecha:		Feb 17 2010  7:58AM
--*Objetivo:	Generar la vista para tabla ManCatEmpaque
--*Entrada:
--*Salida:
--*Precondiciones:
--*Revisiones:
--*----	

CREATE VIEW [dbo].[ManCatEmpaqueVw]
AS
SELECT	ClaGpoEmpaque,
		ClaTipoEmpaque,
		ClaEmpaque,
		NomEmpaque,
		ClaTransporte,
		BajaLogica,
		FechaBajaLogica,
		FechaUltimaMod,
		NombrePcMod,
		ClaUsuarioMod
FROM	TiCatalogo.dbo.ManCatEmpaque WITH (NOLOCK)

-------------
--*** FIN ***
-------------


GO
/****** Object:  View [dbo].[ManCatFamiliaVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ManCatFamiliaVw]
AS
SELECT     ClaFamilia, NombreFamilia, BajaLogica, FechaBajaLogica, FechaUltimaMod, FechaIns
FROM         dbo.ManCatFamilia


GO
/****** Object:  View [dbo].[ManCatFamNvosArtVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--*----
--*Objeto:		Vista: ManCatFamNvosArtVw
--*Autor:		TiGeneraScriptVistaProc - DCSHGARCIALAP
--*Fecha:		Feb 17 2010  7:58AM
--*Objetivo:	Generar la vista para tabla ManCatFamNvosArt
--*Entrada:
--*Salida:
--*Precondiciones:
--*Revisiones:
--*----	

CREATE VIEW [dbo].[ManCatFamNvosArtVw]
AS
SELECT	ClaFamilia,
		ClaSubFamilia,
		ClaTipoUbicacion,
		BajaLogica,
		FechaBajaLogica,
		FechaUltimaMod,
		NombrePcMod,
		ClaUsuarioMod
FROM	TiCatalogo.dbo.ManCatFamNvosArt WITH (NOLOCK)

-------------
--*** FIN ***
-------------


GO
/****** Object:  View [dbo].[ManCatGpoEmpaqueVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--*----
--*Objeto:		Vista: ManCatGpoEmpaqueVw
--*Autor:		TiGeneraScriptVistaProc - DCSHGARCIALAP
--*Fecha:		Feb 17 2010  7:58AM
--*Objetivo:	Generar la vista para tabla ManCatGpoEmpaque
--*Entrada:
--*Salida:
--*Precondiciones:
--*Revisiones:
--*----	

CREATE VIEW [dbo].[ManCatGpoEmpaqueVw]
AS
SELECT	ClaGpoEmpaque,
		NomGpoEmpaque,
		BajaLogica,
		FechaBajaLogica,
		FechaUltimaMod,
		NombrePcMod,
		ClaUsuarioMod
FROM	TiCatalogo.dbo.ManCatGpoEmpaque WITH (NOLOCK)

-------------
--*** FIN ***
-------------


GO
/****** Object:  View [dbo].[ManCatGpoMaquinaVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--*----
--*Objeto:		Vista: ManCatGpoMaquinaVw
--*Autor:		TiGeneraScriptVistaProc - DCSHGARCIALAP
--*Fecha:		Feb 17 2010  7:58AM
--*Objetivo:	Generar la vista para tabla ManCatGpoMaquina
--*Entrada:
--*Salida:
--*Precondiciones:
--*Revisiones:
--*----	

CREATE VIEW [dbo].[ManCatGpoMaquinaVw]
AS
SELECT	ClaPlanta,
		ClaGpoMaquina,
		NomGpoMaquina,
		ClaTecnologia,
		Velocidad,
		ClaTipoVTVel,
		ClaUnidadVTVel,
		TiempoInherente,
		ClaTipoVTTiempo,
		ClaUnidadVTTiempo,
		BajaLogica,
		FechaBajaLogica,
		FechaUltimaMod,
		NombrePcMod,
		ClaUsuarioMod
FROM	TiCatalogo.dbo.ManCatGpoMaquina WITH (NOLOCK)

-------------
--*** FIN ***
-------------


GO
/****** Object:  View [dbo].[ManCatMaquinaVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--*----
--*Objeto:		Vista: ManCatMaquinaVw
--*Autor:		TiGeneraScriptVistaProc - DCSHGARCIALAP
--*Fecha:		Feb 17 2010  7:59AM
--*Objetivo:	Generar la vista para tabla ManCatMaquina
--*Entrada:
--*Salida:
--*Precondiciones:
--*Revisiones:
--*----	

CREATE VIEW [dbo].[ManCatMaquinaVw]
AS
SELECT	ClaPlanta,
		ClaMaquina,
		NomMaquina,
		ClaGpoMaquina,
		ClaArea,
		ClaTipoReporteProd,
		PorcMaxEfic,
		NumLinInst,
		GeneraEntAutSN,
		Comentarios,
		BajaLogica,
		FechaBajaLogica,
		FechaUltimaMod,
		NombrePcMod,
		ClaUsuarioMod
FROM	TiCatalogo.dbo.ManCatMaquina WITH (NOLOCK)

-------------
--*** FIN ***
-------------


GO
/****** Object:  View [dbo].[ManCatMaterialVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--*----
--*Objeto:		Vista: ManCatMaterialVw
--*Autor:		TiGeneraScriptVistaProc - DCSHGARCIALAP
--*Fecha:		Feb 17 2010  7:59AM
--*Objetivo:	Generar la vista para tabla ManCatMaterial
--*Entrada:
--*Salida:
--*Precondiciones:
--*Revisiones:
--*----	

CREATE VIEW [dbo].[ManCatMaterialVw]
AS
SELECT	ClaMaterial,
		NomMaterial,
		EsEtiqueta,
		BajaLogica,
		FechaBajaLogica,
		FechaUltimaMod,
		NombrePcMod,
		ClaUsuarioMod
FROM	TiCatalogo.dbo.ManCatMaterial WITH (NOLOCK)

-------------
--*** FIN ***
-------------


GO
/****** Object:  View [dbo].[ManCatNoDesperdiciosVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--*----
--*Objeto:		Vista: ManCatNoDesperdiciosVw
--*Autor:		TiGeneraScriptVistaProc - DCSHGARCIALAP
--*Fecha:		Feb 17 2010  7:59AM
--*Objetivo:	Generar la vista para tabla ManCatNoDesperdicios
--*Entrada:
--*Salida:
--*Precondiciones:
--*Revisiones:
--*----	

CREATE VIEW [dbo].[ManCatNoDesperdiciosVw]
AS
SELECT	ClaArticulo,
		BajaLogica,
		FechaBajaLogica,
		FechaUltimaMod,
		NombrePcMod,
		ClaUsuarioMod
FROM	TiCatalogo.dbo.ManCatNoDesperdicios WITH (NOLOCK)

-------------
--*** FIN ***
-------------


GO
/****** Object:  View [dbo].[ManCatProductoVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[ManCatProductoVw] AS
SELECT   ClaProducto, ClaveProducto, ClaFamilia, ClaSubFamilia, ClaTipoProducto, PesoTeorico, ClaUnidadProduccion, ClaUnidadVenta, ClaGrupoEstadistico, 
                      NombreProducto, NombreCorto, FactorProduccionVentas, FactorCubicaje, FactorPesoVolumen, EsCuna, ClaGrupoCosteo, EsControlPorLote, 
                      FechaUltimaMod, NombrePcMod, ClaUsuarioMod, FechaIns, ClaUsuarioIns, BajaLogica, FechaBajaLogica,
			loteminimo,claarea
FROM         dbo.ManCatProducto

GO
/****** Object:  View [dbo].[ManCatTecnologiaVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--*----
--*Objeto:		Vista: ManCatTecnologiaVw
--*Autor:		TiGeneraScriptVistaProc - DCSHGARCIALAP
--*Fecha:		Feb 17 2010  7:59AM
--*Objetivo:	Generar la vista para tabla ManCatTecnologia
--*Entrada:
--*Salida:
--*Precondiciones:
--*Revisiones:
--*----	

CREATE VIEW [dbo].[ManCatTecnologiaVw]
AS
SELECT	ClaTecnologia,
		NomTecnologia,
		BajaLogica,
		FechaBajaLogica,
		FechaUltimaMod,
		NombrePcMod,
		ClaUsuarioMod
FROM	TiCatalogo.dbo.ManCatTecnologia WITH (NOLOCK)

-------------
--*** FIN ***
-------------


GO
/****** Object:  View [dbo].[ManCatTipoDepartamentoVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--*----
--*Objeto:		Vista: ManCatTipoDepartamentoVw
--*Autor:		TiGeneraScriptVistaProc - DCSHGARCIALAP
--*Fecha:		Feb 17 2010  7:57AM
--*Objetivo:	Generar la vista para tabla ManCatTipoDepartamento
--*Entrada:
--*Salida:
--*Precondiciones:
--*Revisiones:
--*----	

CREATE VIEW [dbo].[ManCatTipoDepartamentoVw]
AS
SELECT	ClaTipoDepartamento,
		NombreTipoDepartamento,
		BajaLogica,
		FechaBajaLogica,
		FechaUltimaMod,
		NombrePcMod,
		ClaUsuarioMod
FROM	TiCatalogo.dbo.ManCatTipoDepartamento WITH (NOLOCK)

-------------
--*** FIN ***
-------------


GO
/****** Object:  View [dbo].[ManCatTipoEmpaqueVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--*----
--*Objeto:		Vista: ManCatTipoEmpaqueVw
--*Autor:		TiGeneraScriptVistaProc - DCSHGARCIALAP
--*Fecha:		Feb 17 2010  8:00AM
--*Objetivo:	Generar la vista para tabla ManCatTipoEmpaque
--*Entrada:
--*Salida:
--*Precondiciones:
--*Revisiones:
--*----	

CREATE VIEW [dbo].[ManCatTipoEmpaqueVw]
AS
SELECT	ClaTipoEmpaque,
		NomTipoEmpaque,
		BajaLogica,
		FechaBajaLogica,
		FechaUltimaMod,
		NombrePcMod,
		ClaUsuarioMod
FROM	TiCatalogo.dbo.ManCatTipoEmpaque WITH (NOLOCK)

-------------
--*** FIN ***
-------------


GO
/****** Object:  View [dbo].[ManCatTipoReporteProdVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--*----
--*Objeto:		Vista: ManCatTipoReporteProdVw
--*Autor:		TiGeneraScriptVistaProc - DCSHGARCIALAP
--*Fecha:		Feb 17 2010  8:00AM
--*Objetivo:	Generar la vista para tabla ManCatTipoReporteProd
--*Entrada:
--*Salida:
--*Precondiciones:
--*Revisiones:
--*----	

CREATE VIEW [dbo].[ManCatTipoReporteProdVw]
AS
SELECT	ClaTipoReporteProd,
		NomTipoReporteProd,
		BajaLogica,
		FechaBajaLogica,
		FechaUltimaMod,
		NombrePcMod,
		ClaUsuarioMod
FROM	TiCatalogo.dbo.ManCatTipoReporteProd WITH (NOLOCK)

-------------
--*** FIN ***
-------------


GO
/****** Object:  View [dbo].[ManCatTipoVTVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--*----
--*Objeto:		Vista: ManCatTipoVTVw
--*Autor:		TiGeneraScriptVistaProc - DCSHGARCIALAP
--*Fecha:		Feb 17 2010  8:01AM
--*Objetivo:	Generar la vista para tabla ManCatTipoVT
--*Entrada:
--*Salida:
--*Precondiciones:
--*Revisiones:
--*----	

CREATE VIEW [dbo].[ManCatTipoVTVw]
AS
SELECT	ClaTipoVT,
		NomTipoVT,
		BajaLogica,
		FechaBajaLogica,
		FechaUltimaMod,
		NombrePcMod,
		ClaUsuarioMod
FROM	TiCatalogo.dbo.ManCatTipoVT WITH (NOLOCK)

-------------
--*** FIN ***
-------------


GO
/****** Object:  View [dbo].[ManCatUnidadVTVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--*----
--*Objeto:		Vista: ManCatUnidadVTVw
--*Autor:		TiGeneraScriptVistaProc - DCSHGARCIALAP
--*Fecha:		Feb 17 2010  8:01AM
--*Objetivo:	Generar la vista para tabla ManCatUnidadVT
--*Entrada:
--*Salida:
--*Precondiciones:
--*Revisiones:
--*----	

CREATE VIEW [dbo].[ManCatUnidadVTVw]
AS
SELECT	ClaTipoVT,
		ClaUnidadVT,
		NomUnidad,
		BajaLogica,
		FechaBajaLogica,
		FechaUltimaMod,
		NombrePcMod,
		ClaUsuarioMod
FROM	TiCatalogo.dbo.ManCatUnidadVT WITH (NOLOCK)

-------------
--*** FIN ***
-------------


GO
/****** Object:  View [dbo].[ManRelDepartamentoAreaVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
create view [dbo].[ManRelDepartamentoAreaVw]
as
	select	ClaUbicacion, ClaDepartamento, ClaArea, BajaLogica, FechaBajaLogica, 
			FechaUltimaMod, NombrePcMod, ClaUsuarioMod
	from	ManRelDepartamentoArea

GO
/****** Object:  View [dbo].[ManRelUbicacionAreaVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--*----
--*Objeto:		Vista: ManRelUbicacionAreaVw
--*Autor:		TiGeneraScriptVistaProc - DCSHGARCIALAP
--*Fecha:		Feb 17 2010  7:57AM
--*Objetivo:	Generar la vista para tabla ManRelUbicacionArea
--*Entrada:
--*Salida:
--*Precondiciones:
--*Revisiones:
--*----	

CREATE VIEW [dbo].[ManRelUbicacionAreaVw]
AS
SELECT	ClaUbicacion,
		ClaArea,
		BajaLogica,
		FechaBajaLogica,
		FechaUltimaMod,
		NombrePcMod,
		ClaUsuarioMod
FROM	TiCatalogo.dbo.ManRelUbicacionArea WITH (NOLOCK)

-------------
--*** FIN ***
-------------


GO
/****** Object:  View [dbo].[MtoCatOTVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[MtoCatOTVw]  
AS  
SELECT     ClaTipoOT, ClaOT, NomTipoOT, ClaUbicacion, ClaEstatus, NomEstatus, BajaLogica, FechaBajaLogica, FechaUltimaMod, ClaUsuarioMod, NombrePcMod  
FROM         ticatalogo.dbo.MtoCatOT  
  

GO
/****** Object:  View [dbo].[NomCatAreaVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create view [dbo].[NomCatAreaVw]
as
	select	ClaEmpresa, ClaUbicacion, ClaNomina, ClaDepartamento,ClaArea,
			NomArea, Estatus, Usuario, BajaLogica, FechaBajaLogica, 
			FechaUltimaMod, NombrePcMod, ClaUsuarioMod
	from	NomCatArea


GO
/****** Object:  View [dbo].[NomCatDatosTimbradoVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create view [dbo].[NomCatDatosTimbradoVw]
as
select	ClaTrabajador, ClaNomina, ClaUbicacion, ClaEmpresa, NumeroCuenta, 
		SalarioDiario, ClaBanco, BajaLogica, FechaBajaLogica,FechaUltimaMod,
		NombrePcMod, ClaUsuarioMod  
from	NomCatDatosTimbrado


GO
/****** Object:  View [dbo].[NomCatDepartamentoVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[NomCatDepartamentoVw]
AS
SELECT [ClaDepartamento]
      ,[ClaUbicacion]
      ,[ClaEmpresa]
      ,[ClaNomina]
      ,[NomDepartamento]
      ,[DepartamentoDesc]
      ,[Estatus]
      ,[BajaLogica]
      ,[FechaBajaLogica]
      ,[FechaUltimaMod]
      ,[NombrePcMod]
      ,[ClaUsuarioMod]
  FROM [TiCatalogo].[dbo].[NomCatDepartamento]
GO
/****** Object:  View [dbo].[NomCatIncapacidadVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[NomCatIncapacidadVw]
AS
	SELECT ClaIncapacidad
			,ClaTrabajador
			,ClaNomina
			,ClaUbicacion
			,ClaEmpresa
			,ClaMotivo
			,ClaKardex
			,FechaInicio
			,DiasIncapacidad
			,FechaFinal
			,FolioAlta
			,FechaAlta
			,Usuario
			,FechaUltimaMod
			,ClaReporte
			,FechaIns
	FROM dbo.NomCatIncapacidad


GO
/****** Object:  View [dbo].[NomCatInfonavitVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create view [dbo].[NomCatInfonavitVw]
as
	select	ClaEmpresa, ClaUbicacion, ClaNomina, ClaTrabajador, CreditoInfonavit,
			FechaAltaInfonavit, FechaBajaInfonavit, ClaDescuento, InfonavitFactor, VSM,
			ImporteMensual, DescuentoSegDanos, FechaUltRecalculo, FechaIns, BajaLogica,
			FechaBajaLogica, FechaUltimaMod, NombrePcMod, ClaUsuarioMod
	from	NomCatInfonavit 


GO
/****** Object:  View [dbo].[NomCatKardexVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- SELECT * FROM [dbo].[NomCatKardexVw]
CREATE VIEW [dbo].[NomCatKardexVw]
as
	SELECT	ClaKardex		
			,ClaEmpresa		
			,ClaUbicacion	
			,DesKardex		
			,RepartoUtilidades	
			,RequierePase		
			,RequiereMotivo		
			,ClaGrupoEst		
			,NatKardex			
			,Estatus			
			,FechaUltimaMod		
			,Usuario			
			,programada			
			,turno12horas		
	FROM	dbo.NomCatKardex a

GO
/****** Object:  View [dbo].[NomCatLiqImssVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[NomCatLiqImssVw]
AS
SELECT [ClaEmpresa]
      ,[ClaUbicacion]
      ,[ClaLiqImss]
      ,[NumLiqImss]
      ,[NomLiqImss]
      ,[Estatus]
      ,[NumGuia]
      ,[GradoRiesgo]
      ,[Delegacion]
      ,[SubDelegacion]
      ,[LiqDefault]
      ,[BajaLogica]
      ,[FechaBajaLogica]
      ,[FechaUltimaMod]
      ,[NombrePcMod]
      ,[ClaUsuarioMod]
  FROM [TiCatalogo].[dbo].[NomCatLiqImss]
GO
/****** Object:  View [dbo].[NomCatMotivoVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


create view [dbo].[NomCatMotivoVw]
as
select	ClaMotivo, ClaKardex, ClaEmpresa, ClaUbicacion, NombreMotivo,
		BajaLogica , FechaBajaLogica, FechaUltimaMod, NombrePcMod, ClaUsuarioMod 
from	NomCatMotivo 


GO
/****** Object:  View [dbo].[NomCatPuestoVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[NomCatPuestoVw]
AS
	SELECT	ClaEmpresa, ClaUbicacion, ClaNomina, ClaPuesto, NombrePuesto,
			BajaLogica, FechaBajaLogica, FechaUltimaMod, NombrePcMod, ClaUsuarioMod
	FROM	NomCatPuesto with(nolock)

GO
/****** Object:  View [dbo].[NomCatTrabajadorAdiVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create view [dbo].[NomCatTrabajadorAdiVw]
as
	select	ClaEmpresa, 
			ClaUbicacion,
			ClaNomina,
			ClaTrabajador,
			NumCurp,
			BajaLogica,
			FechaBajaLogica,
			FechaUltimaMod,
			NombrePcMod,
			ClaUsuarioMod
	from	NomCatTrabajadorAdi

GO
/****** Object:  View [dbo].[NomCatTrabajadorVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[NomCatTrabajadorVw]
AS
SELECT     ClaTrabajador, ClaTrabajadorEUN, ClaNomina, ClaUbicacion, ClaEmpresa, ClaDepartamento, ClaArea,
			NombreTrabajador = isnull(NombreTrabajador, ''),
			ApellidoPaterno	= isnull(ApellidoPaterno,''), 
			ApellidoMaterno = isnull(ApellidoMaterno,''), 
			RFC, NSS, GrupoSeguro, CUP, 
			  ClaGrupoAsignacion, ClaCrc, ClaJefe, ClaJefeEUN, EsActivo, BajaLogica, FechaBajaLogica, FechaUltimaMod, NombrePcMod, ClaUsuarioMod, FechaIns, 
			  ClaUsuarioIns, foto, FechaNacimiento, ClaPais, ClaEstado, ClaMunicipio, FechaIngreso, Telefono, ClaPuesto, ClaEntidad, EstadoISN, SalarioDiario,
			  NumeroCuenta , ClaBanco, ClaLiqImss, ClaColonia, Direccion, CodPostal
FROM         dbo.NomCatTrabajador

GO
/****** Object:  View [dbo].[NomCatTurnoVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[NomCatTurnoVw]  
AS  
SELECT     ClaUbicacion, ClaTurno, Descripcion, HoraEntrada, HoraSalida, BajaLogica, FechaBajaLogica, FechaUltimaMod, ClaUsuarioMod, NombrePcMod  
FROM         dbo.NomCatTurno  
  

GO
/****** Object:  View [dbo].[NomTraAsistenciaVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


--------------------------------------------------------------------------
CREATE VIEW [dbo].[NomTraAsistenciaVw]
AS
	SELECT	ClaTrabajador 
			,ClaNomina 
			,ClaUbicacion 
			,ClaEmpresa 
			,FechaAsistencia 
			,ClaKardex 
			,ModKardex 
			,FechaUltimaMod 
			,HorasNormales 
			,HorasExtras 
			,HorasVacaciones 
			,ModNormales 
			,ModExtras 
			,ModVacaciones 
			,ModComida 
			,ModCapacitacion 
			,HorasComida 
			,HorasCapacitacion 
			,ClaTurno 
			,ClaMotivo 
			,Afectado 
			,Estatus 
			,Usuario 
			,UsuarioAutoriza 
			,EntradaPlanta 
			,EntradaArea 
			,SalidaComida 
			,EntradaComida
			,SalidaArea 
			,SalidaPlanta
	FROM dbo.NomTraAsistencia

GO
/****** Object:  View [dbo].[NomTraCambioSalarioVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create view [dbo].[NomTraCambioSalarioVw]
as
	select	ClaEmpresa, ClaUbicacion, ClaNomina, ClaTrabajador, ClaFechaCambio,
			SalarioDiario, ClaCategoria, FolioAprobAum, Estatus, BajaLogica,
			FechaBajaLogica, FechaUltimaMod, NombrePcMod, ClaUsuarioMod
	from	NomTraCambioSalario

GO
/****** Object:  View [dbo].[NomTraPeriodoWizardVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- SELECT * FROM [dbo].[NomTraPeriodoWizardVw] where claEtapa = 7
CREATE VIEW [dbo].[NomTraPeriodoWizardVw]
as
	SELECT	ClaEtapa		
		,Especial		
		,ClaPeriodo		
		,AnoPeriodo		
		,ClaNomina		
		,ClaUbicacion	
		,ClaEmpresa		
		,FechaEtapa		
		,DesEtapa		
		,CantAfectado	
		,EstatusEtapa	
		,Usuario		
		,Estatus		
		,FechaUltimaMod 
	FROM	dbo.NomTraPeriodoWizard a

GO
/****** Object:  View [dbo].[OInCatCategoriaVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE VIEW [dbo].[OInCatCategoriaVw]  
AS  

SELECT     ClaCategoria AS IdCategoria, NombreCategoria, CategoriaExterna AS IdCategoriaExterna, ClaUbicacion, FechaRegistro, BajaLogica, FechaBajaLogica, 
                      FechaUltimaMod, ClaUsuarioMod, NombrePcMod
FROM         dbo.OInCatCategoria


GO
/****** Object:  View [dbo].[OInCatClasificacionArticuloABCVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[OInCatClasificacionArticuloABCVw]
AS
SELECT     dbo.OInCatClasificacionArticuloABC.*
FROM         dbo.OInCatClasificacionArticuloABC


GO
/****** Object:  View [dbo].[OInCatClasificacionFrecuenciaVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[OInCatClasificacionFrecuenciaVw]
AS
SELECT     dbo.OInCatClasificacionFrecuencia.*
FROM         dbo.OInCatClasificacionFrecuencia


GO
/****** Object:  View [dbo].[OInCatClasificacionSalidaVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[OInCatClasificacionSalidaVw]
AS
SELECT     dbo.OInCatClasificacionSalida.*
FROM         dbo.OInCatClasificacionSalida


GO
/****** Object:  View [dbo].[OInCatClasificacionValorVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[OInCatClasificacionValorVw]
AS
SELECT     dbo.OInCatClasificacionValor.*
FROM         dbo.OInCatClasificacionValor


GO
/****** Object:  View [dbo].[PLDCatPoliticaInvProdVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[PLDCatPoliticaInvProdVw]
AS
	SELECT	ClaUbicacion,
			ClaArticulo,
			ClaTipoInventario,
			Segmento,
			ClaTipoManufactura,
			InventarioMetaKg,
			InventarioMetaUni,
			FechaIns,
			ClaUsuarioIns,
			FechaUltimaMod,
			ClaUsuarioMod,
			NombrePcMod
	FROM PLDCatPoliticaInvProd

GO
/****** Object:  View [dbo].[PLDCatTipoManufacturaVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[PLDCatTipoManufacturaVw]
AS
	SELECT	ClaTipoManufactura,
			Descripcion,
			FechaIns,
			ClaUsuarioIns,
			FechaUltimaMod,
			ClaUsuarioMod,
			NombrePcMod
	FROM PLDCatTipoManufactura

GO
/****** Object:  View [dbo].[PloCatArticuloCubicajeVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--*----
--*Objeto:		Vista: PloCatArticuloCubicajeVw
--*Autor:		SChavez
--*Fecha:		16 DIC 2010
--*Objetivo:	        Generar la vista para tabla PloCatArticuloCubicaje
--*Revisiones:
--*			Creacion de Vista - /001 - 16 DIC 2010
--*----	

CREATE VIEW [dbo].[PloCatArticuloCubicajeVw]
AS

	SELECT	ClaArticulo,
			PesoTeoricoOrigen,
			LargoMts,
			AnchoMts,
			AltoMts,
			VolumenMts3,
			CantAgrupada,
			PesoTarima,
			BajaLogica,
			FechaBajaLogica,
			FechaUltimaMod,
			NombrePcMod,
			ClaUsuarioMod,
			EsProductoPesado,
			AltoTarima			
	FROM	TiCatalogo.dbo.PloCatArticuloCubicaje WITH (NOLOCK)

-------------
--*** FIN ***
-------------


GO
/****** Object:  View [dbo].[PloCatMaquiladorVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--*----
--*Objeto:		Vista: PloCatMaquiladorVw
--*Autor:		TiGeneraScriptVistaProc - LFVERASLAP
--*Fecha:		03 FEB 2010
--*Objetivo:	        Generar la vista para tabla PloCatMaquilador
--*Revisiones:
--*			Creacion de Vista - /001 - 03 FEB 2010
--*----	

CREATE VIEW [dbo].[PloCatMaquiladorVw]
AS

	SELECT	ClaMaquilador,
			NomMaquilador,
			BajaLogica,
			FechaBajaLogica,
			FechaUltimaMod,
			NombrePcMod,
			ClaUsuarioMod
	FROM	TiCatalogo.dbo.PloCatMaquilador WITH (NOLOCK)

-------------
--*** FIN ***
-------------


GO
/****** Object:  View [dbo].[PloCatRutaDetVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--*----
--*Objeto:		Vista: PloCatRutaDetVw
--*Autor:		TiGeneraScriptVistaProc - LFVERASLAP
--*Fecha:		25 MAY 2010
--*Objetivo:	        Generar la vista para tabla PloCatRutaDet
--*Revisiones:
--*			Creacion de Vista - /001 - 25 MAY 2010
--*----	

CREATE VIEW [dbo].[PloCatRutaDetVw]
AS

	SELECT	ClaUbicacion,
		ClaRuta,
		Secuencia,
		ClaCiudadOrigen,
		ClaCiudadDestino,
		BajaLogica,
		FechaBajaLogica,
		FechaUltimaMod,
		NombrePcMod,
		ClaUsuarioMod
	FROM	TiCatalogo.dbo.PloCatRutaDet WITH (NOLOCK)

-------------
--*** FIN ***
-------------


GO
/****** Object:  View [dbo].[PloCatRutaVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--*----
--*Objeto:		Vista: PloCatRutaVw
--*Autor:		TiGeneraScriptVistaProc - LFVERASLAP
--*Fecha:		25 MAY 2010
--*Objetivo:	        Generar la vista para tabla PloCatRuta
--*Revisiones:
--*			Creacion de Vista - /001 - 25 MAY 2010
--*----	

CREATE VIEW [dbo].[PloCatRutaVw]
AS

	SELECT	ClaUbicacion,
			ClaRuta,
			NomRuta,
			BajaLogica,
			FechaBajaLogica,
			FechaUltimaMod,
			NombrePcMod,
			ClaUsuarioMod
	FROM	TiCatalogo.dbo.PloCatRuta WITH (NOLOCK)

-------------
--*** FIN ***
-------------


GO
/****** Object:  View [dbo].[PloCatTipoArticuloVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--*----
--*Objeto:		Vista: PloCatTipoArticuloVw
--*Autor:		SChavez
--*Fecha:		03 FEB 2010
--*Objetivo:	        Generar la vista para tabla PloCatTipoArticulo
--*Revisiones:
--*			Creacion de Vista - /001 - 03 FEB 2010
--*----	

CREATE VIEW [dbo].[PloCatTipoArticuloVw]
AS

	SELECT	ClaTipoArticulo,
			ClaUbicacion,
			NomTipoArticulo,
			FechaUltimaMod,
			NombrePcMod,
			ClaUsuarioMod
	FROM	TiCatalogo.dbo.PloCatTipoArticulo WITH (NOLOCK)

-------------
--*** FIN ***
-------------


GO
/****** Object:  View [dbo].[PloCatTipoMercadoEmbVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--*----
--*Objeto:		Vista: PloCatTipoMercadoEmboVw
--*Autor:		TiGeneraScriptVistaProc - LFVERASLAP
--*Fecha:		03 FEB 2010
--*Objetivo:	        Generar la vista para tabla PloCatTipoMercadoEmb
--*Revisiones:
--*			Creacion de Vista - /001 - 03 FEB 2010
--*----	

CREATE VIEW [dbo].[PloCatTipoMercadoEmbVw]
AS

	SELECT	ClaTipoMercado,
			NomTipoMercado,
			BajaLogica,
			FechaBajaLogica,
			FechaUltimaMod,
			NombrePcMod,
			ClaUsuarioMod
	FROM	TiCatalogo.dbo.PloCatTipoMercadoEmb WITH (NOLOCK)

-------------
--*** FIN ***
-------------


GO
/****** Object:  View [dbo].[PloCatTipoReferenciaVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--*----
--*Objeto:		Vista: PloCatTipoReferenciaVw
--*Autor:		TiGeneraScriptVistaProc - LFVERASLAP
--*Fecha:		03 FEB 2010
--*Objetivo:	        Generar la vista para tabla PloCatTipoReferencia
--*Revisiones:
--*			Creacion de Vista - /001 - 03 FEB 2010
--*----	

CREATE VIEW [dbo].[PloCatTipoReferenciaVw]
AS
	
	SELECT	ClaTipoReferencia,
			ClaReferenciaInventarios,
			NomTipoReferencia,
			BajaLogica,
			EsNumerica,
			FechaBajaLogica,
			FechaUltimaMod,
			NombrePcMod,
			ClaUsuarioMod
	FROM	TiCatalogo.dbo.PloCatTipoReferencia WITH (NOLOCK)
	
-------------
--*** FIN ***
-------------


GO
/****** Object:  View [dbo].[PloCatTipoViajeVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--*----
--*Objeto:		Vista: PloCatTipoViajeVw
--*Autor:		TiGeneraScriptVistaProc - LFVERASLAP
--*Fecha:		03 FEB 2010
--*Objetivo:	        Generar la vista para tabla PloCatTipoViaje
--*Revisiones:
--*			Creacion de Vista - /001 - 03 FEB 2010
--*----	

CREATE VIEW [dbo].[PloCatTipoViajeVw]
AS

	SELECT	ClaTipoViaje,
			NomTipoViaje,
			BajaLogica,
			FechaBajaLogica,
			FechaUltimaMod,
			NombrePcMod,
			ClaUsuarioMod
	FROM	TiCatalogo.dbo.PloCatTipoViaje WITH (NOLOCK)

-------------
--*** FIN ***
-------------


GO
/****** Object:  View [dbo].[PloCfgArticuloVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--*----
--*Objeto:		Vista: PloCfgArticuloVw
--*Autor:		SChavez
--*Fecha:		03 FEB 2010
--*Objetivo:	        Generar la vista para tabla PloCfgArticulo
--*Revisiones:
--*			Creacion de Vista - /001 - 03 FEB 2010
--*----	

CREATE VIEW [dbo].[PloCfgArticuloVw]
AS

	SELECT	ClaArticulo,
			ClaUbicacion,
			ClaTipoArticulo,
			FechaUltimaMod,
			NombrePcMod,
			ClaUsuarioMod
	FROM	TiCatalogo.dbo.PloCfgArticulo WITH (NOLOCK)

-------------
--*** FIN ***
-------------


GO
/****** Object:  View [dbo].[PloLogTransporteVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--*----
--*Objeto:		Vista: PloLogTransporteVw
--*Autor:		SChavez
--*Fecha:		16 DIC 2010
--*Objetivo:	        Generar la vista para tabla PloCatArticuloCubicaje
--*Revisiones:
--*			Creacion de Vista - /001 - 16 DIC 2010
--*----	

CREATE VIEW [dbo].[PloLogTransporteVw]
AS

	SELECT	ClaTransporte,
			LargoMts,
			AnchoMts,
			AltoMts,
			VolumenMts3,
			CapacidadKg,
			EsAplicableCubicaje,
			BajaLogica,
			FechaBajaLogica,
			FechaUltimaMod,
			NombrePcMod,
			ClaUsuarioMod
	FROM	TiCatalogo.dbo.PloLogTransporte WITH (NOLOCK)

-------------
--*** FIN ***
-------------


GO
/****** Object:  View [dbo].[PloRelArtTranspCubicajeVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--*----
--*Objeto:		Vista: PloRelArtTranspCubicajeVw
--*Autor:		SChavez
--*Fecha:		16 DIC 2010
--*Objetivo:	        Generar la vista para tabla PloRelArtTranspCubicaje
--*Revisiones:
--*			Creacion de Vista - /001 - 16 DIC 2010
--*----	

CREATE VIEW [dbo].[PloRelArtTranspCubicajeVw]
AS

	SELECT	ClaArticulo,
			ClaTransporte,
			UnidadesPorTransporte,
			FactorCubicaje,
			BajaLogica,
			FechaBajaLogica,
			FechaUltimaMod,
			NombrePcMod,
			ClaUsuarioMod
	FROM	TiCatalogo.dbo.PloRelArtTranspCubicaje WITH (NOLOCK)

-------------
--*** FIN ***
-------------


GO
/****** Object:  View [dbo].[PloRelReferenciaProductoVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--*----
--*Objeto:		Vista: PloRelReferenciaProductoVw
--*Autor:		TiGeneraScriptVistaProc - LFVERASLAP
--*Fecha:		03 FEB 2010
--*Objetivo:	        Generar la vista para tabla PloRelReferenciaProducto
--*Revisiones:
--*			Creacion de Vista - /001 - 03 FEB 2010
--*----	

CREATE VIEW [dbo].[PloRelReferenciaProductoVw]
AS

	SELECT	IdReferenciaProducto,
			ClaUbicacion,
			ClaTipoReferencia,
			ClaArticulo,
			ClaFamilia,
			ClaSubFamilia,
			Orden,
			FechaUltimaMod,
			NombrePcMod,
			ClaUsuarioMod
	FROM	TiCatalogo.dbo.PloRelReferenciaProducto WITH (NOLOCK)

-------------
--*** FIN ***
-------------


GO
/****** Object:  View [dbo].[PolCatConfiguracionCuentaVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[PolCatConfiguracionCuentaVw]
AS
SELECT  IdCfgCuenta, ClaUbicacion, ClaTipoCuenta, ClaCRC, ClaDireccion, ClaGrupoAsignacion, ClaTipoGasto,
		ClaTipoGastoProyecto, ClaTipoRegistro, Descripcion, ClaIVA, ClaProveedor, ClaTipoProveedor,
		BajaLogica, FechaBajaLogica, ClaUsuarioMod, FechaUltimaMod, NombrePcMod
FROM    POL_LNKSVR.TiCatalogo.dbo.PolCatConfiguracionCuentaVw WITH (NOLOCK)

GO
/****** Object:  View [dbo].[PolCatTipoCuentaVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[PolCatTipoCuentaVw]
AS
SELECT	ClaTipoCuenta, NombreTipoCuenta, BajaLogica, FechaBajaLogica,
		ClaUsuarioMod, FechaUltimaMod, NombrePcMod
FROM POL_LNKSVR.TiCatalogo.dbo.PolCatTipoCuentaVw WITH (NOLOCK)

GO
/****** Object:  View [dbo].[PPCatTipoPrestadorVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

     /*  
Objeto:						[PProCatTipoPrestadorServiciosVw]      
Autor:						Edith de Osio  
FechaCreacion:				05/01/10
Fecha Ultima Modificaicion: --------------  
Modificacion:				--------------
Modificado por:				-------------- 
*/  
  CREATE VIEW [dbo].[PPCatTipoPrestadorVw]      
as      
 SELECT 
	ClaTipoPrestador,
	NombrePrestador,
	RequiereCupSn,
	MostrarSn,
	NombreIngles,
	BajaLogica,
	FechaBajaLogica,
	FechaUltimaMod,
	NombrePcMod,
	ClaUsuarioMod
    FROM   TiCatalogo.dbo.PProCatTipoPrestadorServicios  
    

GO
/****** Object:  View [dbo].[PProCatCalidadProvVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*  
Objeto:						PProCatCalidadProvVw      
Autor:						Edith de Osio  
FechaCreacion:				05/01/10
Fecha Ultima Modificaicion: --------------  
Modificacion:				--------------
Modificado por:				-------------- 
*/      
CREATE VIEW [dbo].[PProCatCalidadProvVw]
	AS    
	SELECT	
		ClaCalidadProv,
		NomCalidadProv, 
		BajaLogica,
		FechaBajaLogica,
		FechaUltimaMod,
		NombrePcMod,
		ClaUsuarioMod	   
	FROM	
			TiCatalogo.dbo.PProCatCalidadProv


GO
/****** Object:  View [dbo].[PproCatContactosVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[PproCatContactosVw]
AS
SELECT [ClaContacto]
	  ,[ClaCUP]
      ,[NomContacto]
      ,[Email]
      ,[Lada]
      ,[Telefono]
      ,[Fax]
      ,[ClaTipoContacto]
      ,[EsAdmin]
	  ,[IdUsuario] 
      ,[BajaLogica]
      ,[FechaBajaLogica]
      ,[FechaUltimaMod]
      ,[NombrePcMod]
      ,[ClaUsuarioMod]
  FROM [Pprov].[PproSch].[PproCatContactos]  with(nolock) 
GO
/****** Object:  View [dbo].[PProCatEspecializacionProvVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

 ----------------------------------------------------------------------
/*  
Objeto:						PProCatEspecializacionProvVw      
Autor:						Edith de Osio  
FechaCreacion:				05/01/10
Fecha Ultima Modificaicion: --------------  
Modificacion:				--------------
Modificado por:				-------------- 
*/      
  
CREATE VIEW [dbo].[PProCatEspecializacionProvVw]
AS     
SELECT	
		ClaEspecializacionProv,        
		NomEspecializacionProvVw,
		BajaLogica,
		FechaBajaLogica,
		FechaUltimaMod,
		NombrePcMod,
		ClaUsuarioMod	   
FROM	ticatalogo.dbo.PProCatEspecializacionProv

GO
/****** Object:  View [dbo].[PProCatGiroProveedorVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

 /*  
Objeto:						PProCatGiroProveedorVw      
Autor:						Edith de Osio  
FechaCreacion:				05/01/10
Fecha Ultima Modificaicion: --------------  
Modificacion:				--------------
Modificado por:				-------------- 
*/   
 CREATE VIEW  [dbo].[PProCatGiroProveedorVw] 
 AS      
 SELECT 
		ClaGiroProveedor,    
		NombreGiro,    
		NombreGiroIngles,    
     	BajaLogica,
		FechaBajaLogica,
		FechaUltimaMod,
		NombrePcMod,
		ClaUsuarioMod	   
 FROM   dbo.PProCatGiroProveedor  

GO
/****** Object:  View [dbo].[PProCatGrupoProductoDetVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

     /*  
Objeto:						[PProCatGrupoProductoDetVw]      
Autor:						Edith de Osio  
FechaCreacion:				05/01/10
Fecha Ultima Modificaicion: --------------  
Modificacion:				--------------
Modificado por:				-------------- 
*/  
  CREATE VIEW [dbo].[PProCatGrupoProductoDetVw]          
AS          
 SELECT ClaGrupoProducto,    
     ClaUbicacion,    
     ClaFamilia,    
     ClaSubFamilia ,
	BajaLogica,
	FechaBajaLogica,
	FechaUltimaMod,
	NombrePcMod,
	ClaUsuarioMod    
    FROM   dbo.PProCatGrupoProductoDet   

GO
/****** Object:  View [dbo].[PProCatGrupoProductoVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

 ---------------------------------------------
     /*  
Objeto:						[PProCatGrupoProductoVw]      
Autor:						Edith de Osio  
FechaCreacion:				05/01/10
Fecha Ultima Modificaicion: --------------  
Modificacion:				--------------
Modificado por:				-------------- 
*/  
CREATE VIEW [dbo].[PProCatGrupoProductoVw]          
AS          
 SELECT 
	ClaGrupoProducto,    
    Descripcion,    
    ClaTipoGrupoProducto,
	BajaLogica,
	FechaBajaLogica,
	FechaUltimaMod,
	NombrePcMod,
	ClaUsuarioMod     
 FROM   dbo.PProCatGrupoProducto  

GO
/****** Object:  View [dbo].[PProCatMarcaProvVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--------------------------------------------------------------------------
   /*  
Objeto:						[PProCatMarcaProvVw]      
Autor:						Edith de Osio  
FechaCreacion:				05/01/10
Fecha Ultima Modificaicion: --------------  
Modificacion:				--------------
Modificado por:				-------------- 
*/  
  CREATE VIEW [dbo].[PProCatMarcaProvVw]      
 AS      
 SELECT  distinct 
		ClaMarca,    
		NombreMarca,    
		BajaLogica,
		FechaBajaLogica,
		FechaUltimaMod,
		NombrePcMod,
		ClaUsuarioMod   
 FROM dbo.PProCatMarcaProv  

GO
/****** Object:  View [dbo].[PproCatProveedorAdiVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[PproCatProveedorAdiVw]
as
SELECT [ClaCup]
      ,[ClaPaisCon]
      ,[ClaEstadoCon]
      ,[ClaMunicipioCon]
      ,[ClaColoniaCon]
      ,[Calle]
      ,[NumExt]
      ,[NumInt]
      ,[BajaLogica]
      ,[FechaBajaLogica]
      ,[FechaUltimaMod]
      ,[NombrePcMod]
      ,[ClaUsuarioMod]
  FROM [PPROV].[PproSch].[PproCatProveedorAdi]
GO
/****** Object:  View [dbo].[PProCatProveedorRefComercialVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE view [dbo].[PProCatProveedorRefComercialVw]
as
select	ClaCup,
		AniosAntiguedad,
		ClaGiroProveedor,
		NumeroPersonal,
		Capital,
		ClaMoneda,
		CapitalSocialUSD,
		VentasAnualesDolar,
		EsDesgloseFormaPago,
		MontoDesgloseFormaPago,
		ClientesPrincipales,
		ContactoCentral,
		ClaEspecializacionProv,
		ComentariosEspeciales,
		PaginaInternet,
		PlazoPago,
		BajaLogica,
		FechaBajaLogica,
		FechaUltimaMod,
		NombrePcMod,
		ClaUsuarioMod 
from	TiCatalogo.dbo.PProCatProveedorRefComercial




GO
/****** Object:  View [dbo].[PproCatProveedorVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[PproCatProveedorVw]
as

SELECT [ClaProveedor]
      ,[ClaCup]
      ,[ClaTipoActividad]
      ,[ClaAgrupador]
      ,[SitioWeb]
      ,[ClaClasificacion]
      ,[Antiguedad]
      ,[ClientesPrincipales]
      ,[ContactoDeacero]
      ,[AntiguedadDeacero]
      ,[EsProveedorDeacero]
      ,[ClaEstatusProveedor]
	  ,[MotivoRechazo]
      ,[VentasAnuales]
      ,[NumeroPersonal]
      ,[CapitalSocial]
      ,[CapitalEnGiro]
      ,[FechaAutoriza]
      ,[IdUsuarioAut]
      ,[EsAutoInventario]
      ,[ClaClasifProv]
      ,[Referencia]
      ,[ComentariosEspeciales]
	  ,[PlazoPago]
      ,[ClaCalidadProv]
      ,[ClaEspecializacionProv]
      ,[ClaGiroProveedor]
	  ,[ClaMoneda]
      ,[BajaLogica]
      ,[FechaBajaLogica]
      ,[FechaUltimaMod]
      ,[NombrePcMod]
      ,[ClaUsuarioMod]
  FROM [Pprov].[PproSch].[PproCatProveedor]  WITH(NOLOCK)
GO
/****** Object:  View [dbo].[PProCatTipoPrestadorServiciosVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--------------------------
   /*    
Objeto:      [PProCatTipoPrestadorServiciosVw]        
Autor:      Edith de Osio    
FechaCreacion:    05/01/10  
Fecha Ultima Modificaicion: --------------    
Modificacion:    --------------  
Modificado por:    --------------   
*/    
  CREATE VIEW [dbo].[PProCatTipoPrestadorServiciosVw]        
 AS        
 SELECT   
ClaTipoPrestador,
NombrePrestador,
RequiereCupSn,
MostrarSn,
NombreIngles,
BajaLogica,
FechaBajaLogica,
FechaUltimaMod,
NombrePcMod,
ClaUsuarioMod
from dbo.PProCatTipoPrestadorServicios

GO
/****** Object:  View [dbo].[PProRelCiudadProvVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/*
Objeto:                 PProRelCiudadProvVw        
Autor:                  Edith de Osio    
FechaCreacion:          11/02/10  
COmentarios:            Se creó la vista y dado que su tabla origen no cuenta con campos de control,
                        al campo FechaUltimaMod se le asignó el getdate() para poder configurar la réplica,
                        ya que este campo es obligatorio                     
Fecha Ultima Modificacion:   --------------    
Modificacion:                --------------  
Modificado por:              --------------   
*/        
CREATE VIEW [dbo].[PProRelCiudadProvVw]
AS SELECT
      ClaProveedor,
      ClaTipoProveedor,
      ClaCUP,
      ClaPais,
      ClaEstado,
      ClaMunicipio,
      BajaLogica              = NULL,
      FechaBajaLogica         = NUll,
      FechaUltimaMod          = getdate (),
      NombrePcMod             = NULL,  
      ClaUsuarioMod           = NULL
FROM
      ticatalogo.dbo.PProRelCiudadProv

-----------
----FIN----
-----------



GO
/****** Object:  View [dbo].[PProRelGrupoProductoProvVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

------------------------------------------------------------------
       /*  
Objeto:						[PProRelGrupoProductoProvVw]      
Autor:						Edith de Osio  
FechaCreacion:				05/01/10
Fecha Ultima Modificaicion: --------------  
Modificacion:				--------------
Modificado por:				-------------- 
*/  
  CREATE VIEW [dbo].[PProRelGrupoProductoProvVw]            
AS            
 SELECT  
	ClaCUP,    
	ClaGrupoProducto,
	BajaLogica,
	FechaBajaLogica,
	FechaUltimaMod,
	NombrePcMod,
	ClaUsuarioMod   
 FROM dbo.PProRelGrupoProductoProv  

GO
/****** Object:  View [dbo].[PProRelProveedorMarcaVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*  
Objeto:						PProRelProveedorMarcaVw      
Autor:						Edith de Osio  
FechaCreacion:				05/01/10
Fecha Ultima Modificaicion: --------------  
Modificacion:				--------------
Modificado por:				-------------- 
*/      

CREATE VIEW [dbo].[PProRelProveedorMarcaVw]    
AS    
SELECT	ClaCUP,    
		ClaMarca,
		BajaLogica,
		FechaBajaLogica,
		FechaUltimaMod,
		NombrePcMod,
		ClaUsuarioMod	 
FROM	ticatalogo.dbo.PProRelProveedorMarca


GO
/****** Object:  View [dbo].[PProvCatProveedorContactoVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[PProvCatProveedorContactoVw]      
AS      
SELECT 
		[IdContacto]	
      ,	[ClaUbicacion]	
      ,	[ClaCUP]		
      ,	[ClaProveedor]  
      ,	[ClaTipoProveedor]
      ,	[NomContacto]    
      ,	[Puesto]   		
      ,	[Telefono]  	
      ,	[Email]   		
      ,	[Fax]
      ,	[TelefonoMovil]     
      , [Radio]  			
      ,	[BajaLogica]     	
      ,	[FechaBajaLogica] 	
      ,	[FechaUltimaMod]  	
      ,	[ClaUsuarioMod]   	
      ,	[NombrePcMod]    	
FROM 
	TiCatalogo.dbo.PProvCatProveedorContacto
  
GO
/****** Object:  View [dbo].[RmaCatSituacionMotivoVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE VIEW [dbo].[RmaCatSituacionMotivoVw]
AS
SELECT	ClaSituacionMotivo,
		ClaSituacion,
		NomMotivo,
		EsCalidad,
		EsAutorizado,
		EsVentas,
		BajaLogica,
		FechaBajaLogica,
		FechaUltimaMod,
		NombrePcMod,
		ClaUsuarioMod
FROM	TiCatalogo.dbo.RmaCatSituacionMotivo WITH(NOLOCK)

GO
/****** Object:  View [dbo].[RmaCatSituacionVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE VIEW [dbo].[RmaCatSituacionVw]
AS
SELECT	ClaSituacion,
		NomSituacion,
		EsEuaCanada,
		EsTraspaso,
		BajaLogica,
		FechaBajaLogica,
		FechaUltimaMod,
		NombrePcMod,
		ClaUsuarioMod,
		EsAfectaKgs,
		EsAfectaImporte
FROM	dbo.RmaCatSituacion WITH(NOLOCK)

GO
/****** Object:  View [dbo].[TesCatCuentaBeneficiarioVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[TesCatCuentaBeneficiarioVw]
AS
SELECT		 ClaCuentaBeneficiario
            ,ClaEmpresa
            ,ClaBeneficiario
            ,ClaDepartamento
            ,ClaTipoBeneficiario
            ,ClaCUP
            ,DiasPago
            ,ClaMoneda
            ,ClaBanco
            ,NumCuentaBancaria
            ,NumSucursal
            ,NumAba
            ,CP
            ,ConFFC
            ,BancoFFC
            ,NombreBeneficiarioFFC
            ,CuentaFFC
            ,SubCuentaFFC
            ,ClaCuentaCUP
            ,ClaCuentaBeneficiarioPadre
            ,FechaUltimaMod
            ,NombrePcMod
            ,ClaUsuarioMod
FROM		TesCatCuentaBeneficiario

GO
/****** Object:  View [dbo].[TesCatCuentaCUPVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
					  
					/*  
					--*----  
					--*Objeto:  Vista: TesCatCuentaCUPVw  
					--*Autor:  TiGeneraScriptVistaProc - DCSLMENDOZALAP  
					--*Fecha:  Mar 31 2008 11:59AM  
					--*Objetivo: Gerar la vista para una tabla especifica  
					--*Entrada:  
					--*Salida:  
					--*Precondiciones:  
					--*Revisiones:  
					--*----   
					-----------*/  
					CREATE VIEW [dbo].[TesCatCuentaCUPVw]  
					AS  
					  SELECT     ClaCuentaCUP
					    ,ClaCUP
					    ,TipoCuentaCUP
					    ,NumCuentaCUP
					    ,NomBanco
					    ,NombreBeneficiario
					    ,ClaMoneda
					    ,ClaseBanco
					    ,ClaPais
					    ,NumSucursal
					    ,ClaDeptoContable
					    ,ClaBanco
					    ,Clabe
					    ,SucursalPlaza
					    ,AbaSwift
					    ,ReferenciaBancaria
					    ,EsCuentaFFC
					    ,NombreBancoFFC
					    ,NumCuentaFFC
					    ,CuentaHabienteFFC
					    ,SubCuentaFFC
					    ,ChipParticipant
					    ,ClaEstatusCuentaCup
					    ,NomEstatusCuentaCUP
					    ,BajaLogica
					    ,FechaBajaLogica
					    ,FechaUltimaMod
					    ,NombrePcMod
					    ,ClaUsuarioMod
					  FROM         dbo.TesCatCuentaCUP  
					

GO
/****** Object:  View [dbo].[TesCatCUPDatosPagoVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[TesCatCUPDatosPagoVw]
AS
SELECT  ClaCupDatosPago,  
		ClaCup,  
		NombreTitular,
		NombreCUP,
		ClaBanco,  
		ClaPaisCon,  
		ClaMoneda,  
		CuentaBancaria,  
		ClaEstatus,  
		ClaTipoCuentaCup,  
		NumSucursal,  
		CLABE,  
		ClaRoutingCode,  
		EsWire,  
		EsACH,  
		ClaSwift,  
		ClaMunicipioCon,  
		ClaEstadoCon,  
		EsSwift,  
		ClaBancoIntermediario,  
		EsACHDiferenteWIRE,  
		CuentaBancariaACH,  
		ACHAba,  
		CASE WHEN EsWire = 1 THEN ClaRoutingCode ELSE NULL END AS Wire,
		CASE WHEN EsWire = 1 THEN CuentaBancaria ELSE NULL END AS CuentaBancariaWire,  
		EsCuentaFFC,  
		NombreBancoFFC,  
		NumCuentaFFC,  
		CuentaHabienteFFC,  
		SubCuentaFFC,  
		FechaUltimaAutorizacion,  
		ClaUsuarioAlta,  
		ClaEmpresaAlta,  
		ClaDepartamentoAlta,  
		FechaAlta,  
		FechaCancelacion,  
		EsBancoIntermediarioDefault,
		FechaUltimaMod,  
		NombrePcMod,  
		ClaUsuarioMod  
		FROM TiCatalogo.dbo.TesCatCUPDatosPago (NOLOCK)
GO
/****** Object:  View [dbo].[TesCatEstatusCuentaDatosPagoVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[TesCatEstatusCuentaDatosPagoVw]
as 
SELECT ClaEstatus,NomEstatus,BajaLogica,FechaBajaLogica,NombrePcMod,ClaUsuarioMod,FechaUltimaMod
 FROM dbo.TesCatEstatusCuentaDatosPago

GO
/****** Object:  View [dbo].[TesCatFormaPagoVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/****** Object:  View [dbo].[TesCatFormaPagoVw]    Script Date: 06/02/2008 12:32:42 ******/  
CREATE VIEW [dbo].[TesCatFormaPagoVw]  
AS  
SELECT     ClaFormaPago, NomFormaPago, BajaLogica, FechaBajaLogica,
FechaUltimaMod,
NombrePcMod,
ClaUsuarioMod    
FROM         TiCatalogo.dbo.TesCatFormaPago   


GO
/****** Object:  View [dbo].[TesCatMonedaVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	 CREATE VIEW [dbo].[TesCatMonedaVw]  AS    
SELECT  ClaMoneda, NombreMoneda, NombreCortoMoneda, BajaLogica, FechaBajaLogica, FechaUltimaMod, NombrePcMod,   
  ClaUsuarioMod, FechaIns, ClaUsuarioIns, ClaMonedaVentas, NombreImprimir  
FROM    dbo.TesCatMoneda    
WITH (NOLOCK)  
	 

GO
/****** Object:  View [dbo].[TesRelCUPDatosPagoDeptoVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[TesRelCUPDatosPagoDeptoVw]
AS
SELECT  	
	ClaCupDatosPago,
	ClaEmpresa,
	ClaDepartamento,
	ClaBene,
	ClaTipoBene,
	NumBene,
	ClaEstatus,	
	 CASE ClaEstatus WHEN 196 /*Rechazado*/ THEN 1 
	 WHEN 351 /*Cancelado*/ THEN 1
	 ELSE 0 END as BajaLogica,
	FechaUltimaMod,
	NombrePcMod,
	ClaUsuarioMod,
	ReferenciaConvenio,
	ConceptoConvenio,
	ReferenciaBancaria,
	Referencia1,
	Referencia2,
	Referencia3,
	ClaTipoReferencia
FROM TiCatalogo.dbo.TesRelCUPDatosPagoDepto (NOLOCK)


GO
/****** Object:  View [dbo].[TiCatAplicacionVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[TiCatAplicacionVw]
AS
SELECT     ClaUbicacion, IdAplicacion, Orden, ServidorUrl, ServidorAlias, ClaObjeto, ServidorActualizacion, BajaLogica, FechaBajaLogica
FROM       TiCatalogo.dbo.TiCatAplicacion
GO
/****** Object:  View [dbo].[TiCatClasificacionEstatusVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
CREATE VIEW [dbo].[TiCatClasificacionEstatusVw]
AS
SELECT     ClaClasificacionEstatus, NombreClasificacionEstatus, BajaLogica, FechaBajaLogica, FechaUltimaMod, NombrePcMod, ClaUsuarioMod, FechaIns, 
                      ClaUsuarioIns
FROM         dbo.TiCatClasificacionEstatus


GO
/****** Object:  View [dbo].[TiCatConexionVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[TiCatConexionVw]
AS
SELECT  IdAplicacion, 
		ClaUbicacion, 
		IdConexion, 
		NombreBaseDeDatos, 
		NombreServidor, 
		Usuario, 
		Password, 
		ParametrosExtra, 
		EsDefault, 
		BajaLogica, 
		FechaBajaLogica, 
		ClaUsuarioMod, 
		FechaUltimaMod, 
		NombrePcMod
FROM    dbo.TiCatConexion

GO
/****** Object:  View [dbo].[TiCatEmpresaVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	 
	 
	 CREATE View [dbo].[TiCatEmpresaVw]  
as  
Select  ClaEmpresa,  
  NombreEmpresa,  
  DescEmpresa,  
  Prefijo,  
  ClaEmpresaContabiliza,  
  BajaLogica,  
  FechaBajaLogica,  
  FechaUltimaMod,  
  FechaIns    
From TiCatalogo.dbo.TiCatEmpresa  
  
  
	 

GO
/****** Object:  View [dbo].[TiCatEnfoqueVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--*----
--*Objeto:		Vista: TiCatEnfoqueVw
--*Autor:		TiGeneraScriptVistaProc - DCSHGARCIALAP
--*Fecha:		Feb 18 2010  4:28PM
--*Objetivo:	Generar la vista para tabla TiCatEnfoque
--*Entrada:
--*Salida:
--*Precondiciones:
--*Revisiones:
--*----	

CREATE VIEW [dbo].[TiCatEnfoqueVw]
AS
SELECT	ClaEnfoque,
		NombreEnfoque,
		BajaLogica,
		FechaBajaLogica,
		FechaUltimaMod,
		FechaIns,
		ClaTipoInventario,
		NombrePcMod,
		ClaUsuarioMod
FROM	TiCatalogo.dbo.TiCatEnfoque WITH (NOLOCK)

-------------
--*** FIN ***
-------------


GO
/****** Object:  View [dbo].[TiCatEstatusVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[TiCatEstatusVw]
AS
SELECT      ClaClasificacionEstatus, 
			ClaEstatus, 
			NombreEstatus, 
			BajaLogica, 
			FechaBajaLogica, 
			FechaUltimaMod, 
			NombrePcMod, 
			ClaUsuarioMod, 
			FechaIns, 
			ClaUsuarioIns, 
			NombreIngles
FROM        TiCatEstatus  WITH (NOLOCK)


GO
/****** Object:  View [dbo].[TiCatFoliosVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 Create View [dbo].[TiCatFoliosVw] as
	Select ClaUbicacion, ClaSistema, ClaFolio, NomFolio, UltimoFolioUsado,
		sValor1, sValor2, nValor1, nValor2, dValor1, dValor2,
		BajaLogica, FechaBajaLogica, FechaUltimaMod
	From TiCatalogo.dbo.TiCatFolios
GO
/****** Object:  View [dbo].[TiCatHorarioVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[TiCatHorarioVw]
AS
SELECT	ClaHorario, NombreHorario, ClaPeriodo, InicioPeriodo, FinPeriodo, IntervaloPeriodo, DiasSemana, HoraInicio, HoraFin, IntervaloHoras, BajaLogica, FechaBajaLogica, FechaUltimaMod, FechaIns
FROM	dbo.TiCatHorario

GO
/****** Object:  View [dbo].[TiCatObjetoVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE VIEW [dbo].[TiCatObjetoVw]
AS
SELECT     TiTraObjeto.*
FROM         TiTraObjeto


GO
/****** Object:  View [dbo].[ticatperfilvw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  
  
CREATE VIEW [dbo].[ticatperfilvw]    
AS    
    
SELECT  IdUsuario AS ClaPerfil, NombrePerfil, ClaUbicacionDefault,    
         BajaLogica, FechaBajaLogica, FechaIns, ClaUsuarioIns, FechaUltimaMod, ClaUsuarioMod, NombrePcMod    
FROM         TICENTRAL.TiSeguridad.dbo.TiTraUsuario    
WHERE       isnull(Perfil,0) = 1 
GO
/****** Object:  View [dbo].[TiCatPeriodoVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[TiCatPeriodoVw]
AS
SELECT	ClaPeriodo, NombrePeriodo, BajaLogica, FechaBajaLogica, FechaUltimaMod, FechaIns
FROM	dbo.TiCatPeriodo

GO
/****** Object:  View [dbo].[TiCatSistemaVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE View [dbo].[TiCatSistemaVw]
as
Select	ClaSistema,
		NombreSistema,
		NombrePrefijo,
		ContactoTi,
		EsSistema,
		EsComponente,
		EsInterno,
		PerfilCorreo,
		BajaLogica,
		FechaBajaLogica,
		FechaUltimaMod,
		FechaIns,
		ClaGerenteResponsable
From	TiCatSistema



GO
/****** Object:  View [dbo].[TiCatTipoUbicacionVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--*----
--*Objeto:		Vista: TiCatTipoUbicacionVw
--*Autor:		TiGeneraScriptVistaProc - DCSHGARCIALAP
--*Fecha:		Feb 17 2010  8:01AM
--*Objetivo:	Generar la vista para tabla TiCatTipoUbicacion
--*Entrada:
--*Salida:
--*Precondiciones:
--*Revisiones:
--*----	

CREATE VIEW [dbo].[TiCatTipoUbicacionVw]
AS
SELECT	ClaTipoUbicacion,
		NombreTipoUbicacion,
		UsaCuentaPuente,
		BajaLogica,
		FechaBajaLogica,
		FechaUltimaMod,
		FechaIns
FROM	TiCatalogo.dbo.TiCatTipoUbicacion WITH (NOLOCK)

-------------
--*** FIN ***
-------------



GO
/****** Object:  View [dbo].[TiCatUbicacionesCostosVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create View [dbo].[TiCatUbicacionesCostosVw]
As
      Select ClaUbicacion,
            ClaEnfoque,
            NombreEnfoque,
            EsPatio,
            TipoPatio
      From TiCatUbicacionesCostos
GO
/****** Object:  View [dbo].[TiCatUbicacionVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[TiCatUbicacionVw]  AS  

SELECT  ClaUbicacion, 
		NombreUbicacion, 
		ClaTipoUbicacion, 
		ClaEmpresa, 
		ClaCliente, 
		NombreCorto, 
		ClaCiudadBase, 
		ClaPais, 
		ClaEstado, 
		AplicaFactorCubicaje, 
		ClaUbicacionVentas, 
		Direccion, 
		Colonia, 
		Poblacion, 
		CodigoPostal,
		Telefonos, 
		Fax, 
		ClaTipoUbicacionVentas,
		EmpresaFacturar,
		PctToleranciaEmb,
		BajaLogica, 
		FechaBajaLogica, 
		FechaUltimaMod, 
		FechaIns 
FROM    TiCatUbicacion   

WITH	(NOLOCK)  
WHERE	BajaLogica = 0  


GO
/****** Object:  View [dbo].[TiCatUsuarioVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[TiCatUsuarioVw]
AS
SELECT     IdUsuario, IdUsuario AS ClaUsuario, ClaEmpleado, NombrePerfil, NombreUsuario, ApellidoPaterno, ApellidoMaterno, FechaNacimiento, Rfc, Email, EmailAlterno, 
                      LoginUserName, TelefonoCasa, TelefonoOficina, TelefonoCelular, ClaPuesto, Puesto, IdEmpleadoJefe, ClaCrc, Dominio, Bloqueado, ClaUbicacionDefault, Perfil, 
                      NombreModificable, AutenticacionActiveD, IntentosFallidosPrincipal, FechaUltIntentoPrincipal, DispositivoMovil, BajaNomina, BajaLogica, FechaBajaLogica, 
                      FechaIns, ClaUsuarioIns, FechaUltimaMod, ClaUsuarioMod, NombrePcMod, ISNULL(NombreUsuario, '') + ' ' + ISNULL(ApellidoPaterno, '') 
                      + ' ' + ISNULL(ApellidoMaterno, '') AS NombreCompleto
FROM        TiCatalogo.dbo.TiCatUsuario

GO
/****** Object:  View [dbo].[TiCatUsuarioVw2]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[TiCatUsuarioVw2]
AS
SELECT     ClaEmpleado, NombreUsuario + ' ' + ApellidoPaterno + ' ' + ApellidoMaterno AS Usuario, BajaLogica, FechaBajaLogica, FechaUltimaMod, IdUsuario
FROM         dbo.TiTraUsuario

GO
/****** Object:  View [dbo].[TiRelEnfoqueUbicacionVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

--*----
--*Objeto:		Vista: TiRelEnfoqueUbicacionVw
--*Autor:		TiGeneraScriptVistaProc - DCSHGARCIALAP
--*Fecha:		Feb 18 2010  4:29PM
--*Objetivo:	Generar la vista para tabla TiRelEnfoqueUbicacion
--*Entrada:
--*Salida:
--*Precondiciones:
--*Revisiones:
--*----	

CREATE VIEW [dbo].[TiRelEnfoqueUbicacionVw]
AS
SELECT	ClaEnfoque,
		ClaUbicacion,
		BajaLogica,
		FechaBajaLogica,
		FechaUltimaMod,
		FechaIns
FROM	TiCatalogo.dbo.TiRelEnfoqueUbicacion WITH (NOLOCK)

-------------
--*** FIN ***
-------------

GO
/****** Object:  View [dbo].[TiSysUbicacionVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE VIEW [dbo].[TiSysUbicacionVw]
AS
SELECT [claEmpresa]
      ,[claubicacion]
      ,[nomubicacion]
      ,[expubicacion]
      ,[esunineg]
      ,[nomcorto]
      ,[nombd]
      ,[nomusuario]
      ,[password]
      ,[servidor]
      ,[nombdreal]
      ,[directorio]
FROM  [TiSysUbicacion]

GO
/****** Object:  View [dbo].[TiTraPermisoVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
	CREATE VIEW [dbo].[TiTraPermisoVw]  
	 AS  
	 SELECT  IdUsuario, idObjeto, FechaInicial, FechaFinal, Permiso1, Permiso2, Permiso3, Permiso4,   
	  Permiso5, Permiso6,Permiso7, Permiso8  
	 FROM CS_6OFGRALES_LNKSVR.TiSeguridad.[dbo].[TiTraPermiso] WITH(NOLOCK)


GO
/****** Object:  View [dbo].[TiTraReferenciaVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[TiTraReferenciaVw]    
AS    
SELECT IdUsuario, IdPerfilReferenciado, FechaInicial, FechaFinal, ClaUbicacion, Orden, FechaUltimaMod, ClaUsuarioMod,    
NombrePcMod,BajaLogica,    
FechaBajaLogica    
    
FROM CS4_LNKSRV.TiSeguridad.dbo.TiTraReferencia  
WHERE ISNULL(BajaLogica,0) = 0
GO
/****** Object:  View [dbo].[TiTraUsuarioUbicacionVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
		CREATE VIEW [dbo].[TiTraUsuarioUbicacionVw]  
		AS  
		SELECT [IdUsuario]  
			  ,[ClaUbicacion]  
			  ,[BajaLogica]  
			  ,[FechaBajaLogica]  
			  ,[FechaUltimaMod]  
			  ,[ClaUsuarioMod]  
			  ,[NombrePcMod]  
		  FROM CS_6OFGRALES_LNKSVR.TiSeguridad.[dbo].[TiTraUsuarioUbicacion] WITH(NOLOCK)


GO
/****** Object:  View [dbo].[VtaCatAgenteVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VtaCatAgenteVw]
AS
SELECT     ClaAgente, NombreOrganizacion AS NombreAgente, ClaZona, ClaDireccion, ClaSubDireccion, ClaGrupoRegional, ClaOrganizacion, ClaEmpresa, 
                      BajaLogica, FechaBajaLogica, FechaUltimaMod, FechaIns
FROM         dbo.VtaCatOrganizacion
WHERE     (Nivel = 60)


GO
/****** Object:  View [dbo].[VtaCatCiudadVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



create VIEW  [dbo].[VtaCatCiudadVw] AS
	
	SELECT  ClaCiudad, 
		NombreCiudad,
		Ficticio,
		ClaEstado,
		NombreEstado,
		ClaPais, 
		NombrePais,
		PorcentajeIva,
		BajaLogica,
		FechaBajaLogica,
		FechaUltimaMod,
		FechaIns,
		ClaRegion     	
	FROM dbo.VtaCatCiudad WITH (NOLOCK)
GO
/****** Object:  View [dbo].[VtaCatClienteCuentaCuVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



--*Objeto:	VtaCatClienteCuentaCuVw
--*Autor:	Maria de Jesus Sepulveda Lerma
--*Fecha:	Jun-2011
--*Objetivo:	Vista para ver los datos de Clientes de Ventas - Micro Sitio
--*Entrada:	
--*Salida:	
--*Revisiones:		
--*

CREATE VIEW [dbo].[VtaCatClienteCuentaCuVw] 
AS
SELECT	ClaClienteCta,
	ClaClienteUnico,
	NombreClienteUnico,
	Calle,
	NumExterior,
	NumInterior,
	Colonia,
	ClaCiudad,
	CodigoPostal,
	Telefono,
	Fax,
	NomPropietario,
	Email,
	EmailPagos,
	Contacto,
	ContactoPago,
	ContactoPago2,
	TipoFax,
	FaxPagos,
	FechaIns,
	FechaBajaLogica,
	BajaLogica,
	ClaUsuario,
	ClaAgente,
	RefBancaria,
	PctParcialidad,
	TonelajeMax,
	TasaIva,
	EsFacturarDolares,
	EsPagamosComision,
	EsCancFabEmbarcada,
	EsSurtirSinExcederse,
	ClaGiro,
	ClaGiroComercial,
	ClaMedioEmbarque,
	ClaClasifCliente,
	ClaClasifClienteV,
	ClaMoneda,
	TipoTopeListapre,
	CasadoCia,
	ProductosFabrica,
	NotasEmbarque,
	Comentarios,
	ClaCargoFinanciero,
	ClaTipoGarantia,
	ObsGarantias,
	ImpCapContable,
	NomEmpFiliales,
	FechaUltNegIntmor,
	EsAutXdeptoCre,
	EstatusLegal,
	EstatusBloqueo,
	NomQuienBloqueo,
	FechaLimcreAct,
	ImpLimcreActual,
	FechaLimcreAnt,
	ImpLimcreAnt,
	EsLigarLimcre,
	EsLimcreIndividual,
	PlazoMallasAlambres,
	PlazoVarillaAlambron,
	FechaUltimaMod,
	EsCertificadoExcepcion,
	FechaVenceCertificado,
	EsCargarImpuestosVta,
	EsEnviarDocFiscalXMail
FROM	VtaCatClienteCuentaCu

GO
/****** Object:  View [dbo].[VtaCatClienteFilialVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--*----
--*Objeto:		Vista: VtaCatClienteFilialVw
--*Autor:		
--*Fecha:		
--*Objetivo:		Generar la vista para tabla VtaCatClienteFilial
--*Entrada:
--*Salida:
--*Precondiciones:
--*Revisiones:
--*----	

CREATE VIEW [dbo].[VtaCatClienteFilialVw]
AS
SELECT	ClaUbicacionOrigen,
	ClaUbicacionDestino,
	ClaEmpresaOrigen,
	ClaEmpresaDestino,
	ClaClienteFilial,
	ClaListaPrecio,
	ClaConsignado,
	FechaUltimaMod
FROM	TiCatalogo.dbo.VtaCatClienteFilial WITH (NOLOCK)

-------------
--*** FIN ***
-------------

GO
/****** Object:  View [dbo].[VtaCatClienteUnicoCuVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[VtaCatClienteUnicoCuVw]
AS
SELECT  ClaClienteUnico,
      RegimenFiscal,
      RegimenFiscalTipo,
      TipoVentaEnajenacion,
      Rfc,
      Curp,
      NombreRazonSocial,
      ApellidoPaterno,
      ApellidoMaterno,
      FechaIns,
      Calle,
      NumExterior,
      NumInterior,
      ClaPais,
      ClaEstado,
      ClaMunicipio,
      ClaColonia,
      CodigoPostal,
      Lada,
      Telefono,
      Fax,
      Email,
      CuentaBanco,
      BajaLogica,
      FechaBajaLogica,
      EsRfcSolicitado,
      FechaSolicitudRfc,
      EsDocumentoFiscalLista,
      FechaDocumentoFiscal,
      ObservacionDocumentoFiscal,
      FechaUltimaMod 
FROM         dbo.VtaCatClienteUnicoCu


GO
/****** Object:  View [dbo].[VtaCatClienteVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--*----
--*Objeto:		Vista: VtaCatClienteVw
--*Autor:		TiGeneraScriptVistaProc - DCSHGARCIALAP
--*Fecha:		Feb 18 2010  4:30PM
--*Objetivo:	Generar la vista para tabla VtaCatCliente
--*Entrada:
--*Salida:
--*Precondiciones:
--*Revisiones:
--*----	

CREATE VIEW [dbo].[VtaCatClienteVw]
AS
SELECT	ClaCliente,
		ClaTipoCliente,
		ClaClasifCliente,
		ClaCiudad,
		ClaEmpresa,
		NombreCliente,
		Telefono,
		Colonia,
		ZonaPostal,
		Direccion,
		Rfc,
		BajaLogica,
		FechaBajaLogica,
		FechaUltimaMod,
		FechaIns,
		ClaOrganizacion,
		ClaClasifClienteV,
		ClaGiroComercial,
		ClaClienteAgrupador,
		NumeroCedulaFiscal,
		PlazoVarillaAlambron,
		PorcentajeIva,
		ClaCargoFinanciero,
		FechaAltaLogica,
		EstatusLegal,
		FechaUltimaNegociacion,
		FechaAltaReal,
		FechaLimiteCreditoActual,
		ImporteLimiteCreditoActual,
		PlazoMallasAlambres,
		ClaMoneda,
		TipoPersona,
		TipoCliente,
		ClaGiroIndustria
FROM	TiCatalogo.dbo.VtaCatCliente WITH (NOLOCK)

-------------
--*** FIN ***
-------------


GO
/****** Object:  View [dbo].[VtaCatConsignadoVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VtaCatConsignadoVw]
AS
SELECT     ClaConsignado, NombreConsignado, ClaCiudad, Direccion, Colonia, ZonaPostal, Telefono, BajaLogica, 
		FechaBajaLogica, FechaUltimaMod, FechaIns
FROM         dbo.VtaCatConsignado
GO
/****** Object:  View [dbo].[VtaCatDireccionVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VtaCatDireccionVw]
AS
SELECT     ClaDireccion, NombreOrganizacion AS NombreDireccion, BajaLogica, FechaBajaLogica, FechaUltimaMod, FechaIns
FROM         dbo.VtaCatOrganizacion
WHERE     (Nivel = 20)


GO
/****** Object:  View [dbo].[VtaCatEstadoVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE VIEW [dbo].[VtaCatEstadoVw]  AS  
SELECT ClaEstado, ClaPais, NombreEstado, Ficticio, BajaLogica, FechaBajaLogica, FechaUltimaMod, FechaIns  
FROM   dbo.VtaCatEstado  
WITH (NOLOCK)
GO
/****** Object:  View [dbo].[VtaCatEstatusFabricacionVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[VtaCatEstatusFabricacionVw]
AS
 
SELECT	ClaEstatus, Descripcion, DescripcionIngles, BajaLogica, FechaBajaLogica, FechaUltimaMod, NombrePcMod
FROM 	dbo.VtaCatEstatusFabricacion
 

GO
/****** Object:  View [dbo].[VtaCatFormaPagoVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VtaCatFormaPagoVw]

AS

SELECT     ClaFormaPago, NombreFormaPago, BajaLogica, FechaBajaLogica, FechaUltimaMod, FechaIns, DiasPlazoNormal, EsContado, TipoEstadistica, 

                      EsCartaCredito, EsUtilizaFecha

FROM         dbo.VtaCatFormaPago



GO
/****** Object:  View [dbo].[VtaCatGrupoEstadisticoVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


--*----
--*Objeto:		Vista: VtaCatGrupoEstadisticoVw
--*Autor:		TiGeneraScriptVistaProc - DCSHGARCIALAP
--*Fecha:		Feb 18 2010  4:30PM
--*Objetivo:	Generar la vista para tabla VtaCatGrupoEstadistico
--*Entrada:
--*Salida:
--*Precondiciones:
--*Revisiones:
--*----	

CREATE VIEW [dbo].[VtaCatGrupoEstadisticoVw]
AS
SELECT	ClaGrupoEstadistico,
		NivelActual,
		NombreGrupoEstadistico,
		Nivel01,
		Nivel02,
		Nivel03,
		Nivel04,
		BajaLogica,
		FechaBajaLogica,
		FechaUltimaMod,
		NombrePcMod,
		NombreGrupoEstadisticoCorto,
		NombreGrupoEstadisticoIngles,
		ClaTipoProducto,
		ClaTipoEstadistico,
		ClaMargenVenta
FROM	deaofinet.TiCatalogo.dbo.VtaCatGrupoEstadistico WITH (NOLOCK)

-------------
--*** FIN ***
-------------



GO
/****** Object:  View [dbo].[VtaCatOrganizacionVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--*----
--*Objeto:		Vista: VtaCatOrganizacionVw
--*Autor:		TiGeneraScriptVistaProc - DCSHGARCIALAP
--*Fecha:		Feb 18 2010  4:30PM
--*Objetivo:	Generar la vista para tabla VtaCatOrganizacion
--*Entrada:
--*Salida:
--*Precondiciones:
--*Revisiones:
--*----	

CREATE VIEW [dbo].[VtaCatOrganizacionVw]
AS
SELECT	ClaOrganizacion,
		NombreOrganizacion,
		Nivel,
		ClaDireccion,
		ClaSubDireccion,
		ClaZona,
		ClaAgente,
		ClaEmpresa,
		ClaUbicacion,
		ClaGrupoRegional,
		BajaLogica,
		FechaBajaLogica,
		FechaUltimaMod,
		FechaIns,
		NombreTitular,
		ClaGrupo,
		ClaPais,
		IdOrden,
		ClaAgrupador,
		ClaAgenteAgrupador,
		NivelActual,
		Email
FROM	TiCatalogo.dbo.VtaCatOrganizacion WITH (NOLOCK)

-------------
--*** FIN ***
-------------


GO
/****** Object:  View [dbo].[VtaCatPaisVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--*----
--*Objeto:		Vista: VtaCatPaisVw
--*Autor:		TiGeneraScriptVistaProc - DCSHGARCIALAP
--*Fecha:		Feb 18 2010  4:31PM
--*Objetivo:	Generar la vista para tabla VtaCatPais
--*Entrada:
--*Salida:
--*Precondiciones:
--*Revisiones:
--*----	

CREATE VIEW [dbo].[VtaCatPaisVw]
AS
SELECT	ClaPais,
		NombrePais,
		Ficticio,
		BajaLogica,
		FechaBajaLogica,
		FechaUltimaMod,
		FechaIns,
		ClaMoneda,
		ClaIdioma
FROM	TiCatalogo.dbo.VtaCatPais WITH (NOLOCK)

-------------
--*** FIN ***
-------------


GO
/****** Object:  View [dbo].[VtaCatProductoFacturaVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[VtaCatProductoFacturaVw]
AS
SELECT  ClaProducto, 
		ClaIdioma, 
		ClaUnidadVenta, 
		NombreProductoFactura, 
		Calibre,
		Disenio,
		Alto,
		Largo,
		FechaUltimaMod
FROM    dbo.VtaCatProductoFactura 


GO
/****** Object:  View [dbo].[VtaCatSubDireccionVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VtaCatSubDireccionVw]
AS
SELECT     ClaSubDireccion, ClaDireccion, NombreOrganizacion AS NombreSubDireccion, BajaLogica, FechaBajaLogica, FechaUltimaMod, FechaIns
FROM         dbo.VtaCatOrganizacion
WHERE     (Nivel = 30)

GO
/****** Object:  View [dbo].[VtaCatTipoMercadoVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VtaCatTipoMercadoVw]
AS
SELECT     ClaTipoMercado, NombreTipoMercado, BajaLogica, FechaBajaLogica, FechaUltimaMod, FechaIns
FROM         dbo.VtaCatTipoMercado

GO
/****** Object:  View [dbo].[VtaCatUnidadVentaVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [dbo].[VtaCatUnidadVentaVw]
AS
SELECT  ClaUnidadVenta, 
		NombreUnidadVenta, 
		NombreUnidadEdi,
		FechaUltimaMod
FROM    dbo.VtaCatUnidadVenta 

GO
/****** Object:  View [DTSch].[DtCatOpcionVw]    Script Date: 26/08/2020 01:22:27 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [DTSch].[DtCatOpcionVw]
AS
SELECT [ClaOpcion]
      ,[ClaAplicacion]
      ,[PathRelativo]
      ,[Parametros]
      ,[ClaObjetoSeg]
      ,[Imagen]
      ,[ExtImagen]
      ,[Comentarios]
      ,[BajaLogica]
      ,[FechaBajaLogica]
      ,[FechaUltimaMod]
      ,[ClaUsuarioMod]
      ,[NombrePcMod]
      ,[ClaUbicacion]
  FROM [TiCatalogo].[DTSch].[DtCatOpcion]

GO
ALTER TABLE [dbo].[AceCatBanda] ADD  DEFAULT (getdate()) FOR [FechaIns]
GO
ALTER TABLE [dbo].[AceCatBanda] ADD  DEFAULT (getdate()) FOR [FechaUltimaMod]
GO
ALTER TABLE [dbo].[AceCatCausaDesviacion] ADD  DEFAULT ((0)) FOR [BajaLogica]
GO
ALTER TABLE [dbo].[AceCatCausaDesviacion] ADD  DEFAULT (getdate()) FOR [FechaUltimaMod]
GO
ALTER TABLE [dbo].[AceCatCausaDesviacion] ADD  DEFAULT (host_name()) FOR [NombrePcMod]
GO
ALTER TABLE [dbo].[AceCatCausaDesviacion] ADD  DEFAULT ((6)) FOR [ClaUbicacion]
GO
ALTER TABLE [dbo].[AceCatCausaReclasificacion] ADD  DEFAULT ((0)) FOR [BajaLogica]
GO
ALTER TABLE [dbo].[AceCatCausaReclasificacion] ADD  DEFAULT (getdate()) FOR [FechaUltimaMod]
GO
ALTER TABLE [dbo].[AceCatCausaReclasificacion] ADD  DEFAULT (host_name()) FOR [NombrePcMod]
GO
ALTER TABLE [dbo].[AceCatClienteEspecial] ADD  DEFAULT ((0)) FOR [EsImprimeCalidad]
GO
ALTER TABLE [dbo].[AceCatClienteEspecial] ADD  DEFAULT ((0)) FOR [BajaLogica]
GO
ALTER TABLE [dbo].[AceCatClienteEspecial] ADD  DEFAULT (getdate()) FOR [FechaUltimaMod]
GO
ALTER TABLE [dbo].[AceCatClienteEspecial] ADD  DEFAULT (host_name()) FOR [NombrePcMod]
GO
ALTER TABLE [dbo].[AceCatDefecto] ADD  DEFAULT ((0)) FOR [BajaLogica]
GO
ALTER TABLE [dbo].[AceCatDefecto] ADD  DEFAULT (getdate()) FOR [FechaUltimaMod]
GO
ALTER TABLE [dbo].[AceCatDefecto] ADD  DEFAULT (host_name()) FOR [NombrePcMod]
GO
ALTER TABLE [dbo].[AceCatDefecto] ADD  DEFAULT ((6)) FOR [ClaUbicacion]
GO
ALTER TABLE [dbo].[AceCatMaterialMP] ADD  DEFAULT ((0)) FOR [BajaLogica]
GO
ALTER TABLE [dbo].[AceCatMaterialMP] ADD  DEFAULT (getdate()) FOR [FechaUltimaMod]
GO
ALTER TABLE [dbo].[AceCatMaterialMP] ADD  DEFAULT (host_name()) FOR [NombrePcMod]
GO
ALTER TABLE [dbo].[AceCatModoAplicacionAA] ADD  DEFAULT (getdate()) FOR [FechaUltimaMod]
GO
ALTER TABLE [dbo].[AceCatModoAplicacionAA] ADD  DEFAULT (host_name()) FOR [NombrePcMod]
GO
ALTER TABLE [dbo].[AceCatModoAplicacionAA] ADD  DEFAULT ((0)) FOR [BajaLogica]
GO
ALTER TABLE [dbo].[AceCatMotivoEntrada] ADD  DEFAULT ((0)) FOR [BajaLogica]
GO
ALTER TABLE [dbo].[AceCatMotivoEntrada] ADD  DEFAULT ((0)) FOR [EsRequeridaBasculaCertificada]
GO
ALTER TABLE [dbo].[AceCatMotivoEntrada] ADD  DEFAULT ((0)) FOR [EsValidaReuso]
GO
ALTER TABLE [dbo].[AceCatMotivoEntrada] ADD  DEFAULT ((0)) FOR [EsCargaDescarga]
GO
ALTER TABLE [dbo].[AceCatMotivoEntrada] ADD  DEFAULT ((0)) FOR [EsExterna]
GO
ALTER TABLE [dbo].[AceCatMotivoEntrada] ADD  DEFAULT ((0)) FOR [EsMostrarVigilancia]
GO
ALTER TABLE [dbo].[AceCatMotivoEntrada] ADD  DEFAULT ((0)) FOR [EsMostrarFfcc]
GO
ALTER TABLE [dbo].[AceCatMotivoEntrada] ADD  DEFAULT (getdate()) FOR [FechaIns]
GO
ALTER TABLE [dbo].[AceCatMotivoEntrada] ADD  DEFAULT (getdate()) FOR [FechaUltimaMod]
GO
ALTER TABLE [dbo].[AceCatMotivoEntrada] ADD  DEFAULT (host_name()) FOR [NombrePcMod]
GO
ALTER TABLE [dbo].[AceCatProveedor] ADD  DEFAULT (getdate()) FOR [FechaIns]
GO
ALTER TABLE [dbo].[AceCatProveedor] ADD  DEFAULT (getdate()) FOR [FechaUltimaMod]
GO
ALTER TABLE [dbo].[AceCatProveedor] ADD  DEFAULT (host_name()) FOR [NombrePcMod]
GO
ALTER TABLE [dbo].[AceCatProveedor] ADD  DEFAULT ((0)) FOR [BajaLogica]
GO
ALTER TABLE [dbo].[AceCatTipoReceta] ADD  DEFAULT (getdate()) FOR [FechaUltimaMod]
GO
ALTER TABLE [dbo].[AceCatTipoReceta] ADD  DEFAULT (host_name()) FOR [NombrePcMod]
GO
ALTER TABLE [dbo].[AceCatVarillaLongitud] ADD  DEFAULT (getdate()) FOR [FechaUltimaMod]
GO
ALTER TABLE [dbo].[AceCatVarillaLongitud] ADD  DEFAULT (host_name()) FOR [NombrePcMod]
GO
ALTER TABLE [dbo].[AceCatVarillaLongitud] ADD  DEFAULT ((0)) FOR [BajaLogica]
GO
ALTER TABLE [dbo].[AceCatVarillaPrePresentacion] ADD  DEFAULT (getdate()) FOR [FechaUltimaMod]
GO
ALTER TABLE [dbo].[AceCatVarillaPrePresentacion] ADD  DEFAULT (host_name()) FOR [NombrePcMod]
GO
ALTER TABLE [dbo].[AceCatVarillaPrePresentacion] ADD  DEFAULT ((0)) FOR [BajaLogica]
GO
ALTER TABLE [dbo].[AceTmpCalProducto] ADD  DEFAULT (getdate()) FOR [FechaUltimaMod]
GO
ALTER TABLE [dbo].[AceTmpCalProducto] ADD  DEFAULT (host_name()) FOR [NombrePc]
GO
ALTER TABLE [dbo].[AceTmpCalProducto] ADD  DEFAULT ((0)) FOR [BajaLogica]
GO
ALTER TABLE [dbo].[AceTmpEspecificacionTension] ADD  DEFAULT (getdate()) FOR [FechaUltimaMod]
GO
ALTER TABLE [dbo].[AceTmpEspecificacionTension] ADD  DEFAULT (host_name()) FOR [NombrePcMod]
GO
ALTER TABLE [dbo].[AceTmpPresentacionVarilla] ADD  DEFAULT (getdate()) FOR [FechaUltimaMod]
GO
ALTER TABLE [dbo].[AceTmpPresentacionVarilla] ADD  DEFAULT (host_name()) FOR [NombrePcMod]
GO
ALTER TABLE [dbo].[AgCatDiasTransito] ADD  DEFAULT ((0)) FOR [BajaLogica]
GO
ALTER TABLE [dbo].[ArtCatEspecificaEmpaqueAce] ADD  DEFAULT ((0)) FOR [BajaLogica]
GO
ALTER TABLE [dbo].[ArtCatEspecificaEmpaqueAce] ADD  DEFAULT (getdate()) FOR [FechaUltimaMod]
GO
ALTER TABLE [dbo].[ArtCatEspecificaEmpaqueAce] ADD  DEFAULT (host_name()) FOR [NombrePcMod]
GO
ALTER TABLE [dbo].[AviCatDestinatarioPreferencia] ADD  DEFAULT ((0)) FOR [BajaLogica]
GO
ALTER TABLE [dbo].[AviCatDestinatarioPreferencia] ADD  DEFAULT (getdate()) FOR [FechaUltimaMod]
GO
ALTER TABLE [dbo].[AviCatDestinatarioPreferencia] ADD  DEFAULT (host_name()) FOR [NombrePcMod]
GO
ALTER TABLE [dbo].[AviCatSeguridad] ADD  DEFAULT ((0)) FOR [BajaLogica]
GO
ALTER TABLE [dbo].[AviCatSeguridad] ADD  DEFAULT (getdate()) FOR [FechaUltimaMod]
GO
ALTER TABLE [dbo].[AviCatSeguridad] ADD  DEFAULT (host_name()) FOR [NombrePcMod]
GO
ALTER TABLE [dbo].[AviCatTipoHorario] ADD  DEFAULT ((0)) FOR [BajaLogica]
GO
ALTER TABLE [dbo].[AviCatTipoHorario] ADD  DEFAULT (getdate()) FOR [FechaUltimaMod]
GO
ALTER TABLE [dbo].[AviCatTipoHorario] ADD  DEFAULT (host_name()) FOR [NombrePcMod]
GO
ALTER TABLE [dbo].[CfaCatEstatusAutorizacion] ADD  DEFAULT ((0)) FOR [BajaLogica]
GO
ALTER TABLE [dbo].[CfaCatEstatusAutorizacion] ADD  DEFAULT (getdate()) FOR [FechaUltimaMod]
GO
ALTER TABLE [dbo].[CfaCatEstatusAutorizacion] ADD  DEFAULT (host_name()) FOR [NombrePcMod]
GO
ALTER TABLE [dbo].[CmpCatAcuerdoUbicacion] ADD  DEFAULT ((0)) FOR [BajaLogica]
GO
ALTER TABLE [dbo].[CmpCatAcuerdoUbicacion] ADD  DEFAULT (getdate()) FOR [FechaUltimaMod]
GO
ALTER TABLE [dbo].[CmpCatAcuerdoUbicacion] ADD  DEFAULT (host_name()) FOR [NombrePcMod]
GO
ALTER TABLE [dbo].[CmpCatConceptoMaquinado] ADD  DEFAULT ((0)) FOR [BajaLogica]
GO
ALTER TABLE [dbo].[CmpCatConceptoMaquinado] ADD  DEFAULT (getdate()) FOR [FechaUltimaMod]
GO
ALTER TABLE [dbo].[CmpCatConceptoMaquinado] ADD  DEFAULT (host_name()) FOR [NombrePcMod]
GO
ALTER TABLE [dbo].[CmpCatIva] ADD  DEFAULT ((0)) FOR [BajaLogica]
GO
ALTER TABLE [dbo].[CmpCatIva] ADD  DEFAULT (getdate()) FOR [FechaUltimaMod]
GO
ALTER TABLE [dbo].[CmpCatIva] ADD  DEFAULT (host_name()) FOR [NombrePcMod]
GO
ALTER TABLE [dbo].[CmpCatModeloInventario] ADD  DEFAULT ((0)) FOR [BajaLogica]
GO
ALTER TABLE [dbo].[CmpCatModeloInventario] ADD  DEFAULT (getdate()) FOR [FechaUltimaMod]
GO
ALTER TABLE [dbo].[CmpCatModeloInventario] ADD  DEFAULT (host_name()) FOR [NombrePcMod]
GO
ALTER TABLE [dbo].[CmpCatMotivoIncremento] ADD  DEFAULT ((0)) FOR [BajaLogica]
GO
ALTER TABLE [dbo].[CmpCatMotivoIncremento] ADD  DEFAULT (getdate()) FOR [FechaUltimaMod]
GO
ALTER TABLE [dbo].[CmpCatMotivoIncremento] ADD  DEFAULT (host_name()) FOR [NombrePcMod]
GO
ALTER TABLE [dbo].[CmpCatProveedorRefComercial] ADD  DEFAULT ((0)) FOR [BajaLogica]
GO
ALTER TABLE [dbo].[CmpCatProveedorRefComercial] ADD  DEFAULT (getdate()) FOR [FechaUltimaMod]
GO
ALTER TABLE [dbo].[CmpCatProveedorRefComercial] ADD  DEFAULT (host_name()) FOR [NombrePcMod]
GO
ALTER TABLE [dbo].[CmpCatProveedorRefFiscal] ADD  DEFAULT ((0)) FOR [BajaLogica]
GO
ALTER TABLE [dbo].[CmpCatProveedorRefFiscal] ADD  DEFAULT (getdate()) FOR [FechaUltimaMod]
GO
ALTER TABLE [dbo].[CmpCatProveedorRefFiscal] ADD  DEFAULT (host_name()) FOR [NombrePcMod]
GO
ALTER TABLE [dbo].[CmpCatTurno] ADD  DEFAULT ((0)) FOR [BajaLogica]
GO
ALTER TABLE [dbo].[CmpCatTurno] ADD  DEFAULT (getdate()) FOR [FechaUltimaMod]
GO
ALTER TABLE [dbo].[CmpCatTurno] ADD  DEFAULT (host_name()) FOR [NombrePcMod]
GO
ALTER TABLE [dbo].[CseCatPuntoControl] ADD  CONSTRAINT [DF_CseCatPuntoControl_esBajaLogica]  DEFAULT ((0)) FOR [BajaLogica]
GO
ALTER TABLE [dbo].[CseCatPuntoControl] ADD  CONSTRAINT [DF_CseCatPuntoControl_fechaIns]  DEFAULT (getdate()) FOR [fechaIns]
GO
ALTER TABLE [dbo].[CseCatPuntoControl] ADD  CONSTRAINT [DF_CseCatPuntoControl_fechaUltimaMod]  DEFAULT (getdate()) FOR [fechaUltimaMod]
GO
ALTER TABLE [dbo].[CseCatPuntoControl] ADD  CONSTRAINT [DF_CseCatPuntoControl_nombrePC]  DEFAULT (host_name()) FOR [nombrePCMod]
GO
ALTER TABLE [dbo].[ExpTraEnvio] ADD  CONSTRAINT [DF__ExpTraEnv__Fecha__5C050488]  DEFAULT (getdate()) FOR [FechaCreacion]
GO
ALTER TABLE [dbo].[FfccCatCarro] ADD  CONSTRAINT [DF__FfccCatCa__EsEqu__6F9F86DC]  DEFAULT ((0)) FOR [EsEquipoPropio]
GO
ALTER TABLE [dbo].[FfccCatCarro] ADD  CONSTRAINT [DF__FfccCatCa__BajaL__7093AB15]  DEFAULT ((0)) FOR [BajaLogica]
GO
ALTER TABLE [dbo].[FfccCatCarro] ADD  CONSTRAINT [DF__FfccCatCa__Fecha__7187CF4E]  DEFAULT (getdate()) FOR [FechaUltimaMod]
GO
ALTER TABLE [dbo].[FfccCatCarro] ADD  CONSTRAINT [DF__FfccCatCa__Nombr__727BF387]  DEFAULT (host_name()) FOR [NombrePcMod]
GO
ALTER TABLE [dbo].[FleCatChofer] ADD  DEFAULT ((0)) FOR [BajaLogica]
GO
ALTER TABLE [dbo].[FleCatChofer] ADD  DEFAULT (getdate()) FOR [FechaUltimaMod]
GO
ALTER TABLE [dbo].[FleCatChofer] ADD  DEFAULT (host_name()) FOR [NombrePcMod]
GO
ALTER TABLE [dbo].[FleCatEjeTransporte] ADD  DEFAULT ((0)) FOR [BajaLogica]
GO
ALTER TABLE [dbo].[FleCatEjeTransporte] ADD  DEFAULT (getdate()) FOR [FechaUltimaMod]
GO
ALTER TABLE [dbo].[FleCatEjeTransporte] ADD  DEFAULT (host_name()) FOR [NombrePcMod]
GO
ALTER TABLE [dbo].[IMP_TEST_REPORTE_SERVICIOS_PARAMETROS] ADD  DEFAULT (getdate()) FOR [FechaUltimaMod]
GO
ALTER TABLE [dbo].[InvCatAgrupadorInventarioFisico] ADD  CONSTRAINT [DF_InvCatAgrupadoresInventarioFisico_BajaLogica]  DEFAULT ((0)) FOR [BajaLogica]
GO
ALTER TABLE [dbo].[InvCatAgrupadorInventarioFisico] ADD  CONSTRAINT [DF_InvCatAgrupadoresInventarioFisico_FechaUltimaMod]  DEFAULT (getdate()) FOR [FechaUltimaMod]
GO
ALTER TABLE [dbo].[InvCatAgrupadorInventarioFisico] ADD  CONSTRAINT [DF_InvCatAgrupadoresInventarioFisico_FechaIns]  DEFAULT (getdate()) FOR [FechaIns]
GO
ALTER TABLE [dbo].[InvCatAreaInventarioFisico] ADD  CONSTRAINT [DF_Table_1_BajaLogica]  DEFAULT ((0)) FOR [BajaLogica]
GO
ALTER TABLE [dbo].[InvCatAreaInventarioFisico] ADD  CONSTRAINT [DF_Table_1_FechaUltimaMod]  DEFAULT (getdate()) FOR [FechaUltimaMod]
GO
ALTER TABLE [dbo].[InvCatAreaInventarioFisico] ADD  CONSTRAINT [DF_Table_1_FechaIns]  DEFAULT (getdate()) FOR [FechaIns]
GO
ALTER TABLE [dbo].[InvCatListaInvDet] ADD  CONSTRAINT [DF__InvCatLis__BajaL__4EC01803]  DEFAULT ((0)) FOR [BajaLogica]
GO
ALTER TABLE [dbo].[InvCatListaInvDet] ADD  CONSTRAINT [DF__InvCatLis__Fecha__4FB43C3C]  DEFAULT (getdate()) FOR [FechaBajaLogica]
GO
ALTER TABLE [dbo].[InvCatListaInvDet] ADD  CONSTRAINT [DF__InvCatLis__Fecha__50A86075]  DEFAULT (getdate()) FOR [FechaUltimaMod]
GO
ALTER TABLE [dbo].[InvCatListaInvEnc] ADD  CONSTRAINT [DF__InvCatLis__Permi__5290A8E7]  DEFAULT ((0)) FOR [PermiteFactorConversion]
GO
ALTER TABLE [dbo].[InvCatListaInvEnc] ADD  CONSTRAINT [DF__InvCatLis__Permi__5384CD20]  DEFAULT ((0)) FOR [PermiteReferencia]
GO
ALTER TABLE [dbo].[InvCatListaInvEnc] ADD  CONSTRAINT [DF__InvCatLis__Permi__5478F159]  DEFAULT ((0)) FOR [PermiteUnidad]
GO
ALTER TABLE [dbo].[InvCatListaInvEnc] ADD  CONSTRAINT [DF__InvCatLis__BajaL__556D1592]  DEFAULT ((0)) FOR [BajaLogica]
GO
ALTER TABLE [dbo].[InvCatListaInvEnc] ADD  CONSTRAINT [DF__InvCatLis__Fecha__566139CB]  DEFAULT (getdate()) FOR [FechaBajaLogica]
GO
ALTER TABLE [dbo].[InvCatListaInvEnc] ADD  CONSTRAINT [DF__InvCatLis__Fecha__57555E04]  DEFAULT (getdate()) FOR [FechaUltimaMod]
GO
ALTER TABLE [dbo].[InvCatSeccion] ADD  CONSTRAINT [DF__InvCatSec__Permi__5D0E375A]  DEFAULT ((0)) FOR [PermiteExistenciaNegativa]
GO
ALTER TABLE [dbo].[InvCatSeccion] ADD  CONSTRAINT [DF__InvCatSec__BajaL__5E025B93]  DEFAULT ((0)) FOR [BajaLogica]
GO
ALTER TABLE [dbo].[InvCatSeccion] ADD  CONSTRAINT [DF__InvCatSec__Fecha__5EF67FCC]  DEFAULT (getdate()) FOR [FechaBajaLogica]
GO
ALTER TABLE [dbo].[InvCatSeccion] ADD  CONSTRAINT [DF__InvCatSec__Fecha__5FEAA405]  DEFAULT (getdate()) FOR [FechaUltimaMod]
GO
ALTER TABLE [dbo].[InvCatTiempoOriDest] ADD  CONSTRAINT [DF__InvCatTie__BajaL__6B5C56B1]  DEFAULT ((0)) FOR [BajaLogica]
GO
ALTER TABLE [dbo].[InvCatTiempoOriDest] ADD  CONSTRAINT [DF__InvCatTie__Fecha__6C507AEA]  DEFAULT (getdate()) FOR [FechaBajaLogica]
GO
ALTER TABLE [dbo].[InvCatTiempoOriDest] ADD  CONSTRAINT [DF__InvCatTie__Fecha__6D449F23]  DEFAULT (getdate()) FOR [FechaUltimaMod]
GO
ALTER TABLE [dbo].[InvCatTipoClaveMov] ADD  CONSTRAINT [DF__InvCatTip__Fecha__6F2CE795]  DEFAULT (getdate()) FOR [FechaBajaLogica]
GO
ALTER TABLE [dbo].[InvCatTipoClaveMov] ADD  CONSTRAINT [DF__InvCatTip__Fecha__70210BCE]  DEFAULT (getdate()) FOR [FechaUltimaMod]
GO
ALTER TABLE [dbo].[InvCatTipoTaraInventarioFisico] ADD  CONSTRAINT [DF_ManCatTipoTara_BajaLogica]  DEFAULT ((0)) FOR [BajaLogica]
GO
ALTER TABLE [dbo].[InvCatTipoTaraInventarioFisico] ADD  CONSTRAINT [DF_ManCatTipoTara_FechaUltimaMod]  DEFAULT (getdate()) FOR [FechaUltimaMod]
GO
ALTER TABLE [dbo].[InvCatTipoTaraInventarioFisico] ADD  CONSTRAINT [DF_ManCatTipoTara_FechaIns]  DEFAULT (getdate()) FOR [FechaIns]
GO
ALTER TABLE [dbo].[InvCatUsoInventarioFisico] ADD  CONSTRAINT [DF_InvCatUso_BajaLogica]  DEFAULT ((0)) FOR [BajaLogica]
GO
ALTER TABLE [dbo].[InvCatUsoInventarioFisico] ADD  CONSTRAINT [DF_InvCatUso_FechaUltimaMod]  DEFAULT (getdate()) FOR [FechaUltimaMod]
GO
ALTER TABLE [dbo].[InvCatUsoInventarioFisico] ADD  CONSTRAINT [DF_InvCatUso_FechaIns]  DEFAULT (getdate()) FOR [FechaIns]
GO
ALTER TABLE [dbo].[InvRelAgrupadorFamilias] ADD  CONSTRAINT [DF_InvCatAgrupadorFamilias_BajaLogica]  DEFAULT ((0)) FOR [BajaLogica]
GO
ALTER TABLE [dbo].[InvRelAgrupadorFamilias] ADD  CONSTRAINT [DF_InvCatAgrupadorFamilias_FechaUltimaMod]  DEFAULT (getdate()) FOR [FechaUltimaMod]
GO
ALTER TABLE [dbo].[InvRelAgrupadorFamilias] ADD  CONSTRAINT [DF_InvCatAgrupadorFamilias_FechaIns]  DEFAULT (getdate()) FOR [FechaIns]
GO
ALTER TABLE [dbo].[InvRelListaInvResp] ADD  CONSTRAINT [DF__InvRelLis__BajaL__7D7B06EC]  DEFAULT ((0)) FOR [BajaLogica]
GO
ALTER TABLE [dbo].[InvRelListaInvResp] ADD  CONSTRAINT [DF__InvRelLis__Fecha__7E6F2B25]  DEFAULT (getdate()) FOR [FechaBajaLogica]
GO
ALTER TABLE [dbo].[InvRelListaInvResp] ADD  CONSTRAINT [DF__InvRelLis__Fecha__7F634F5E]  DEFAULT (getdate()) FOR [FechaUltimaMod]
GO
ALTER TABLE [dbo].[InvRelProductoPesajeReal] ADD  CONSTRAINT [DF__InvRelPro__BajaL__37C5420D]  DEFAULT ((0)) FOR [BajaLogica]
GO
ALTER TABLE [dbo].[InvRelProductoPesajeReal] ADD  CONSTRAINT [DF__InvRelPro__Fecha__38B96646]  DEFAULT (getdate()) FOR [FechaUltimaMod]
GO
ALTER TABLE [dbo].[InvRelProductoPesajeReal] ADD  CONSTRAINT [DF__InvRelPro__Fecha__39AD8A7F]  DEFAULT (getdate()) FOR [FechaIns]
GO
ALTER TABLE [dbo].[ManCatFamilia] ADD  CONSTRAINT [DF_ManCatFamilia_BajaLogica]  DEFAULT ((0)) FOR [BajaLogica]
GO
ALTER TABLE [dbo].[ManCatFamilia] ADD  CONSTRAINT [DF_ManCatFamilia_FechaUltimaMod]  DEFAULT (getdate()) FOR [FechaUltimaMod]
GO
ALTER TABLE [dbo].[OInCatClasificacionFrecuencia] ADD  CONSTRAINT [DF__OInClasif__Fecha__113584D1]  DEFAULT (getdate()) FOR [FechaUltimaMod]
GO
ALTER TABLE [dbo].[OInCatClasificacionFrecuencia] ADD  CONSTRAINT [DF__OInClasif__Nombr__1229A90A]  DEFAULT (host_name()) FOR [NombrePcMod]
GO
ALTER TABLE [dbo].[OInCatClasificacionSalida] ADD  CONSTRAINT [DF__OInClasif__Fecha__09946309]  DEFAULT (getdate()) FOR [FechaUltimaMod]
GO
ALTER TABLE [dbo].[OInCatClasificacionSalida] ADD  CONSTRAINT [DF__OInClasif__Nombr__0A888742]  DEFAULT (host_name()) FOR [NombrePcMod]
GO
ALTER TABLE [dbo].[OInCatClasificacionValor] ADD  CONSTRAINT [DF__OInCatCla__Fecha__2A01329B]  DEFAULT (getdate()) FOR [FechaUltimaMod]
GO
ALTER TABLE [dbo].[OInCatClasificacionValor] ADD  CONSTRAINT [DF__OInCatCla__Nombr__2AF556D4]  DEFAULT (host_name()) FOR [NombrePcMod]
GO
ALTER TABLE [dbo].[PloCatMaquilador] ADD  DEFAULT ((0)) FOR [BajaLogica]
GO
ALTER TABLE [dbo].[PloCatMaquilador] ADD  DEFAULT (getdate()) FOR [FechaUltimaMod]
GO
ALTER TABLE [dbo].[PloCatMaquilador] ADD  DEFAULT (host_name()) FOR [NombrePcMod]
GO
ALTER TABLE [dbo].[PloCatRutaDet] ADD  DEFAULT ((0)) FOR [BajaLogica]
GO
ALTER TABLE [dbo].[PloCatRutaDet] ADD  DEFAULT (getdate()) FOR [FechaUltimaMod]
GO
ALTER TABLE [dbo].[PloCatRutaDet] ADD  DEFAULT (host_name()) FOR [NombrePcMod]
GO
ALTER TABLE [dbo].[PloCatTipoReferencia] ADD  DEFAULT ((0)) FOR [BajaLogica]
GO
ALTER TABLE [dbo].[PloCatTipoReferencia] ADD  DEFAULT (getdate()) FOR [FechaUltimaMod]
GO
ALTER TABLE [dbo].[PloCatTipoReferencia] ADD  DEFAULT (host_name()) FOR [NombrePcMod]
GO
ALTER TABLE [dbo].[PloCatTipoViaje] ADD  DEFAULT ((0)) FOR [BajaLogica]
GO
ALTER TABLE [dbo].[PloCatTipoViaje] ADD  DEFAULT (getdate()) FOR [FechaUltimaMod]
GO
ALTER TABLE [dbo].[PloCatTipoViaje] ADD  DEFAULT (host_name()) FOR [NombrePcMod]
GO
ALTER TABLE [dbo].[PloRelReferenciaProducto] ADD  DEFAULT (getdate()) FOR [FechaUltimaMod]
GO
ALTER TABLE [dbo].[PloRelReferenciaProducto] ADD  DEFAULT (host_name()) FOR [NombrePcMod]
GO
ALTER TABLE [dbo].[TiBitObjeto] ADD  CONSTRAINT [DF_TiBitObjeto_FechaBitacora]  DEFAULT (getdate()) FOR [FechaBitacora]
GO
ALTER TABLE [dbo].[TiBitPermiso] ADD  CONSTRAINT [DF_TiBitPermiso_FechaBitacora]  DEFAULT (getdate()) FOR [FechaBitacora]
GO
ALTER TABLE [dbo].[TiBitPermisoUbicacion] ADD  CONSTRAINT [DF_TiBitPermisoUbicacion_FechaBitacora]  DEFAULT (getdate()) FOR [FechaBitacora]
GO
ALTER TABLE [dbo].[TiCatAgrupadorCol] ADD  CONSTRAINT [DF_TiCatAgrupadorCol_BajaLogica]  DEFAULT ((0)) FOR [BajaLogica]
GO
ALTER TABLE [dbo].[TiCatAgrupadorCol] ADD  CONSTRAINT [DF_TiCatAgrupadorCol_FechaUltimaMod]  DEFAULT (getdate()) FOR [FechaUltimaMod]
GO
ALTER TABLE [dbo].[TiCatAgrupadorCol] ADD  CONSTRAINT [DF_TiCatAgrupadorCol_NombrePcMod]  DEFAULT (host_name()) FOR [NombrePcMod]
GO
ALTER TABLE [dbo].[TiCatBoton] ADD  CONSTRAINT [DF_TiCatBoton_BajaLogica]  DEFAULT ((0)) FOR [BajaLogica]
GO
ALTER TABLE [dbo].[TiCatBoton] ADD  CONSTRAINT [DF_TiCatBoton_FechaUltimaMod]  DEFAULT (getdate()) FOR [FechaUltimaMod]
GO
ALTER TABLE [dbo].[TiCatBoton] ADD  CONSTRAINT [DF_TiCatBoton_FechaIns]  DEFAULT (getdate()) FOR [FechaIns]
GO
ALTER TABLE [dbo].[TiCatControlVisual] ADD  CONSTRAINT [DF_TiCatControlVisual_BajaLogica]  DEFAULT ((0)) FOR [BajaLogica]
GO
ALTER TABLE [dbo].[TiCatControlVisual] ADD  CONSTRAINT [DF_TiCatControlVisual_FechaUltimaMod]  DEFAULT (getdate()) FOR [FechaUltimaMod]
GO
ALTER TABLE [dbo].[TiCatControlVisual] ADD  CONSTRAINT [DF_TiCatControlVisual_NombrePcMod]  DEFAULT (host_name()) FOR [NombrePcMod]
GO
ALTER TABLE [dbo].[TiCatControlVisual] ADD  CONSTRAINT [DF_TiCatControlVisual_ClaUsuarioMod]  DEFAULT (user_id()) FOR [ClaUsuarioMod]
GO
ALTER TABLE [dbo].[TiCatHorario] ADD  DEFAULT ((0)) FOR [BajaLogica]
GO
ALTER TABLE [dbo].[TiCatIdioma] ADD  DEFAULT ((0)) FOR [BajaLogica]
GO
ALTER TABLE [dbo].[TiCatIdioma] ADD  DEFAULT (getdate()) FOR [FechaUltimaMod]
GO
ALTER TABLE [dbo].[TiCatMascara] ADD  DEFAULT ((0)) FOR [BajaLogica]
GO
ALTER TABLE [dbo].[TiCatMascara] ADD  DEFAULT (NULL) FOR [FechaBajaLogica]
GO
ALTER TABLE [dbo].[TiCatMascara] ADD  DEFAULT (getdate()) FOR [FechaIns]
GO
ALTER TABLE [dbo].[TiCatMascara] ADD  DEFAULT (getdate()) FOR [FechaUltimaMod]
GO
ALTER TABLE [dbo].[TiCatOpcionAutenticacion] ADD  CONSTRAINT [DF_TiOpcionAutenticacion_BajaLogica]  DEFAULT ((0)) FOR [BajaLogica]
GO
ALTER TABLE [dbo].[TiCatOpcionAutenticacion] ADD  CONSTRAINT [DF_TiOpcionAutenticacion_FechaUltimaMod]  DEFAULT (getdate()) FOR [FechaUltimaMod]
GO
ALTER TABLE [dbo].[TiCatOpcionAutenticacion] ADD  CONSTRAINT [DF_TiOpcionAutenticacion_NombrePcMod]  DEFAULT (host_name()) FOR [NombrePcMod]
GO
ALTER TABLE [dbo].[TiCatRegla] ADD  DEFAULT ((0)) FOR [BajaLogica]
GO
ALTER TABLE [dbo].[TiCatRegla] ADD  DEFAULT (NULL) FOR [FechaBajaLogica]
GO
ALTER TABLE [dbo].[TiCatRegla] ADD  DEFAULT (getdate()) FOR [FechaIns]
GO
ALTER TABLE [dbo].[TiCatRegla] ADD  DEFAULT (getdate()) FOR [FechaUltimaMod]
GO
ALTER TABLE [dbo].[TiCatTipoDato] ADD  DEFAULT ((1)) FOR [TipoRepresentacion]
GO
ALTER TABLE [dbo].[TiCatTipoDato] ADD  DEFAULT ((23)) FOR [TipoDatoSql]
GO
ALTER TABLE [dbo].[TiCatTipoDato] ADD  DEFAULT ((0)) FOR [BajaLogica]
GO
ALTER TABLE [dbo].[TiCatTipoDato] ADD  DEFAULT (NULL) FOR [FechaBajaLogica]
GO
ALTER TABLE [dbo].[TiCatTipoDato] ADD  DEFAULT (getdate()) FOR [FechaIns]
GO
ALTER TABLE [dbo].[TiCatTipoDato] ADD  DEFAULT (getdate()) FOR [FechaUltimaMod]
GO
ALTER TABLE [dbo].[TiCatTipoObjeto] ADD  CONSTRAINT [DF__TiCat_t__baja___740F363E]  DEFAULT ((0)) FOR [BajaLogica]
GO
ALTER TABLE [dbo].[TiCatTipoObjeto] ADD  CONSTRAINT [DF_TiCatTipoObjeto_FechaIns]  DEFAULT (getdate()) FOR [FechaIns]
GO
ALTER TABLE [dbo].[TiCatTipoObjeto] ADD  CONSTRAINT [DF_TiCatTipoObjeto_FechaUltimaMod]  DEFAULT (getdate()) FOR [FechaUltimaMod]
GO
ALTER TABLE [dbo].[TiCatTipoObjeto] ADD  CONSTRAINT [DF_TiCatTipoObjeto_NombrePcMod]  DEFAULT (host_name()) FOR [NombrePcMod]
GO
ALTER TABLE [dbo].[TiRelAgrupadorColUbicacion] ADD  CONSTRAINT [DF_TiRelAgrupadorColUbicacion_BajaLogica]  DEFAULT ((0)) FOR [BajaLogica]
GO
ALTER TABLE [dbo].[TiRelAgrupadorColUbicacion] ADD  CONSTRAINT [DF_TiRelAgrupadorColUbicacion_FechaUltimaMod]  DEFAULT (getdate()) FOR [FechaUltimaMod]
GO
ALTER TABLE [dbo].[TiRelAgrupadorColUbicacion] ADD  CONSTRAINT [DF_TiRelAgrupadorColUbicacion_NombrePcMod]  DEFAULT (host_name()) FOR [NombrePcMod]
GO
ALTER TABLE [dbo].[TiRelAgrupadorColUsuario] ADD  CONSTRAINT [DF_TiRelAgrupadorColUsuario_BajaLogica]  DEFAULT ((0)) FOR [BajaLogica]
GO
ALTER TABLE [dbo].[TiRelAgrupadorColUsuario] ADD  CONSTRAINT [DF_TiRelAgrupadorColUsuario_FechaUltimaMod]  DEFAULT (getdate()) FOR [FechaUltimaMod]
GO
ALTER TABLE [dbo].[TiRelAgrupadorColUsuario] ADD  CONSTRAINT [DF_TiRelAgrupadorColUsuario_NombrePcMod]  DEFAULT (host_name()) FOR [NombrePcMod]
GO
ALTER TABLE [dbo].[TiTraAsociacionReferencial] ADD  CONSTRAINT [DF_TiTraAsociacionReferencial_Autofiltrado]  DEFAULT ((1)) FOR [Autofiltrado]
GO
ALTER TABLE [dbo].[TiTraAsociacionReferencial] ADD  CONSTRAINT [DF__TiTraAsoc__BajaL__0CBAE877]  DEFAULT ((0)) FOR [BajaLogica]
GO
ALTER TABLE [dbo].[TiTraAsociacionReferencial] ADD  CONSTRAINT [DF__TiTraAsoc__Fecha__0DAF0CB0]  DEFAULT (NULL) FOR [FechaBajaLogica]
GO
ALTER TABLE [dbo].[TiTraAsociacionReferencial] ADD  CONSTRAINT [DF__TiTraAsoc__Fecha__0EA330E9]  DEFAULT (getdate()) FOR [FechaIns]
GO
ALTER TABLE [dbo].[TiTraAsociacionReferencial] ADD  CONSTRAINT [DF__TiTraAsoc__Fecha__0F975522]  DEFAULT (getdate()) FOR [FechaUltimaMod]
GO
ALTER TABLE [dbo].[TiTraAsociacionReferencial] ADD  CONSTRAINT [DF_TiTraAsociacionReferencial_MostrarClaveDescripcion]  DEFAULT ((0)) FOR [MostrarClaveDescripcion]
GO
ALTER TABLE [dbo].[TiTraAsociacionReferencialDet] ADD  CONSTRAINT [DF__TiTraAsocDet__BajaL__0CBAE877]  DEFAULT ((0)) FOR [BajaLogica]
GO
ALTER TABLE [dbo].[TiTraAsociacionReferencialDet] ADD  CONSTRAINT [DF__TiTraAsocDet__Fecha__0DAF0CB0]  DEFAULT (NULL) FOR [FechaBajaLogica]
GO
ALTER TABLE [dbo].[TiTraAsociacionReferencialDet] ADD  CONSTRAINT [DF__TiTraAsocDet__Fecha__0F975522]  DEFAULT (getdate()) FOR [FechaUltimaMod]
GO
ALTER TABLE [dbo].[TiTraCatalogo] ADD  CONSTRAINT [DF_TiTraCatalogo_EnMantenimiento]  DEFAULT ((0)) FOR [EnMantenimiento]
GO
ALTER TABLE [dbo].[TiTraCatalogo] ADD  CONSTRAINT [DF__TiTraCata__EsBas__117F9D94]  DEFAULT ((0)) FOR [EsBase]
GO
ALTER TABLE [dbo].[TiTraCatalogo] ADD  CONSTRAINT [DF__TiTraCata__TipoV__1273C1CD]  DEFAULT ((1)) FOR [TipoVisorDefault]
GO
ALTER TABLE [dbo].[TiTraCatalogo] ADD  CONSTRAINT [DF__TiTraCata__Tiene__1367E606]  DEFAULT ((0)) FOR [TieneFechaIns]
GO
ALTER TABLE [dbo].[TiTraCatalogo] ADD  CONSTRAINT [DF__TiTraCata__Tiene__145C0A3F]  DEFAULT ((0)) FOR [TieneClaUsuarioIns]
GO
ALTER TABLE [dbo].[TiTraCatalogo] ADD  CONSTRAINT [DF__TiTraCata__Tiene__15502E78]  DEFAULT ((0)) FOR [TieneFechaUltimaMod]
GO
ALTER TABLE [dbo].[TiTraCatalogo] ADD  CONSTRAINT [DF__TiTraCata__Tiene__164452B1]  DEFAULT ((0)) FOR [TieneClaUsuarioMod]
GO
ALTER TABLE [dbo].[TiTraCatalogo] ADD  CONSTRAINT [DF__TiTraCata__Tiene__173876EA]  DEFAULT ((0)) FOR [TieneNombrePcMod]
GO
ALTER TABLE [dbo].[TiTraCatalogo] ADD  CONSTRAINT [DF__TiTraCata__BajaL__182C9B23]  DEFAULT ((0)) FOR [BajaLogica]
GO
ALTER TABLE [dbo].[TiTraCatalogo] ADD  CONSTRAINT [DF__TiTraCata__Fecha__1920BF5C]  DEFAULT (NULL) FOR [FechaBajaLogica]
GO
ALTER TABLE [dbo].[TiTraCatalogo] ADD  CONSTRAINT [DF__TiTraCata__Fecha__1A14E395]  DEFAULT (getdate()) FOR [FechaIns]
GO
ALTER TABLE [dbo].[TiTraCatalogo] ADD  CONSTRAINT [DF__TiTraCata__Fecha__1B0907CE]  DEFAULT (getdate()) FOR [FechaUltimaMod]
GO
ALTER TABLE [dbo].[TiTraCatalogo] ADD  CONSTRAINT [DF_TiTraCatalogo_VerSeccionAgrupador]  DEFAULT ((0)) FOR [VerSeccionAgrupador]
GO
ALTER TABLE [dbo].[TiTraCatalogo] ADD  CONSTRAINT [DF_TiTraCatalogo_VerStatusBar]  DEFAULT ((0)) FOR [VerStatusBar]
GO
ALTER TABLE [dbo].[TiTraCatalogo] ADD  CONSTRAINT [DF_TiTraCatalogo_Autofiltrado]  DEFAULT ((0)) FOR [Autofiltrado]
GO
ALTER TABLE [dbo].[TiTraCatalogo] ADD  CONSTRAINT [DF_TiTraCatalogo_AccionGuardado]  DEFAULT ((0)) FOR [AccionGuardado]
GO
ALTER TABLE [dbo].[TiTraCatalogoEvento] ADD  CONSTRAINT [DF_TiTraCatalogoEvento_FechaUltimaMod]  DEFAULT (getdate()) FOR [FechaUltimaMod]
GO
ALTER TABLE [dbo].[TiTraCatalogoEvento] ADD  CONSTRAINT [DF_TiTraCatalogoEvento_BajaLogica]  DEFAULT ((0)) FOR [BajaLogica]
GO
ALTER TABLE [dbo].[TiTraCatalogoIdioma] ADD  CONSTRAINT [DF__TiTraCata__BajaL__3B80C458]  DEFAULT ((0)) FOR [BajaLogica]
GO
ALTER TABLE [dbo].[TiTraCatalogoIdioma] ADD  CONSTRAINT [DF__TiTraCata__Fecha__3C74E891]  DEFAULT (getdate()) FOR [FechaUltimaMod]
GO
ALTER TABLE [dbo].[TiTraColumna] ADD  CONSTRAINT [DF__TiTraColu__EsDes__1CF15040]  DEFAULT ((0)) FOR [EsDescripcion]
GO
ALTER TABLE [dbo].[TiTraColumna] ADD  CONSTRAINT [DF__TiTraColu__ClaOb__1DE57479]  DEFAULT (NULL) FOR [ClaObjeto]
GO
ALTER TABLE [dbo].[TiTraColumna] ADD  CONSTRAINT [DF_TiTraColumna_Alto]  DEFAULT ((1)) FOR [Alto]
GO
ALTER TABLE [dbo].[TiTraColumna] ADD  CONSTRAINT [DF__TiTraColu__BajaL__1ED998B2]  DEFAULT ((0)) FOR [BajaLogica]
GO
ALTER TABLE [dbo].[TiTraColumna] ADD  CONSTRAINT [DF__TiTraColu__Fecha__1FCDBCEB]  DEFAULT (NULL) FOR [FechaBajaLogica]
GO
ALTER TABLE [dbo].[TiTraColumna] ADD  CONSTRAINT [DF__TiTraColu__Fecha__20C1E124]  DEFAULT (getdate()) FOR [FechaIns]
GO
ALTER TABLE [dbo].[TiTraColumna] ADD  CONSTRAINT [DF__TiTraColu__Fecha__21B6055D]  DEFAULT (getdate()) FOR [FechaUltimaMod]
GO
ALTER TABLE [dbo].[TiTraColumnaAccion] ADD  CONSTRAINT [DF_TiTraColumnaAccion_FechaUltimaMod]  DEFAULT (getdate()) FOR [FechaUltimaMod]
GO
ALTER TABLE [dbo].[TiTraColumnaAccion] ADD  CONSTRAINT [DF_TiTraColumnaAccion_BajaLogica]  DEFAULT ((0)) FOR [BajaLogica]
GO
ALTER TABLE [dbo].[TiTraColumnaAccion] ADD  CONSTRAINT [DF_TiTraColumnaAccion_NombrePcMod]  DEFAULT (host_name()) FOR [NombrePcMod]
GO
ALTER TABLE [dbo].[TiTraColumnaCompara] ADD  CONSTRAINT [DF_TiTraColumnaCompara_BajaLogica]  DEFAULT ((0)) FOR [BajaLogica]
GO
ALTER TABLE [dbo].[TiTraColumnaCompara] ADD  CONSTRAINT [DF_TiTraColumnaCompara_FechaUltimaMod]  DEFAULT (getdate()) FOR [FechaUltimaMod]
GO
ALTER TABLE [dbo].[TiTraColumnaCompara] ADD  CONSTRAINT [DF_TiTraColumnaCompara_NombrePcMod]  DEFAULT ('''host_namr()') FOR [NombrePcMod]
GO
ALTER TABLE [dbo].[TiTraColumnaDependencia] ADD  CONSTRAINT [DF_TiTraColumnaDependencia_FechaUltimaMod]  DEFAULT (getdate()) FOR [FechaUltimaMod]
GO
ALTER TABLE [dbo].[TiTraColumnaDependencia] ADD  CONSTRAINT [DF_TiTraColumnaDependencia_BajaLogica]  DEFAULT ((0)) FOR [BajaLogica]
GO
ALTER TABLE [dbo].[TiTraColumnaFiltro] ADD  CONSTRAINT [DF_TiTraColumnaFiltro_Editable]  DEFAULT ((1)) FOR [Editable]
GO
ALTER TABLE [dbo].[TiTraColumnaFiltro] ADD  CONSTRAINT [DF_TiTraColumnaFiltro_Accion]  DEFAULT ((0)) FOR [AccionDeCambio]
GO
ALTER TABLE [dbo].[TiTraColumnaFiltro] ADD  CONSTRAINT [DF_TiTraColumnaFiltro_FechaIns]  DEFAULT (getdate()) FOR [FechaIns]
GO
ALTER TABLE [dbo].[TiTraColumnaFiltro] ADD  CONSTRAINT [DF_TiTraColumnaFiltro_FechaUltimaMod]  DEFAULT (getdate()) FOR [FechaUltimaMod]
GO
ALTER TABLE [dbo].[TiTraColumnaFiltro] ADD  CONSTRAINT [DF_TiTraColumnaFiltro_NombrePcMod]  DEFAULT (host_name()) FOR [NombrePcMod]
GO
ALTER TABLE [dbo].[TiTraColumnaIdioma] ADD  DEFAULT ((0)) FOR [BajaLogica]
GO
ALTER TABLE [dbo].[TiTraColumnaIdioma] ADD  DEFAULT (getdate()) FOR [FechaUltimaMod]
GO
ALTER TABLE [dbo].[TiTraConexionCatalogo] ADD  DEFAULT ((0)) FOR [BajaLogica]
GO
ALTER TABLE [dbo].[TiTraConexionCatalogo] ADD  DEFAULT (NULL) FOR [FechaBajaLogica]
GO
ALTER TABLE [dbo].[TiTraConexionCatalogo] ADD  DEFAULT (getdate()) FOR [FechaIns]
GO
ALTER TABLE [dbo].[TiTraConexionCatalogo] ADD  DEFAULT (getdate()) FOR [FechaUltimaMod]
GO
ALTER TABLE [dbo].[TiTraConfiguracion] ADD  CONSTRAINT [DF_TiTraConfiguracionNumIntentosMaxContrasena]  DEFAULT ((0)) FOR [NumIntentosMaxContrasena]
GO
ALTER TABLE [dbo].[TiTraConfiguracion] ADD  CONSTRAINT [DF_TiTraConfiguracionNumIntentosMaxHuella]  DEFAULT ((0)) FOR [NumIntentosMaxHuella]
GO
ALTER TABLE [dbo].[TiTraConfiguracion] ADD  CONSTRAINT [DF_TiTraConfiguracionTiempoExpiracion]  DEFAULT ((0)) FOR [TiempoExpiracion]
GO
ALTER TABLE [dbo].[TiTraConfiguracion] ADD  CONSTRAINT [DF_TiTraConfiguracion_FechaUltimaMod]  DEFAULT (getdate()) FOR [FechaUltimaMod]
GO
ALTER TABLE [dbo].[TiTraItem] ADD  CONSTRAINT [DF__TiTraItem__Abrir__09746778]  DEFAULT ((0)) FOR [AbrirEnNuevaVentana]
GO
ALTER TABLE [dbo].[TiTraItem] ADD  CONSTRAINT [DF__TiTraItem__BajaL__0A688BB1]  DEFAULT ((0)) FOR [BajaLogica]
GO
ALTER TABLE [dbo].[TiTraItem] ADD  CONSTRAINT [DF__TiTraItem__Fecha__0B5CAFEA]  DEFAULT (getdate()) FOR [FechaIns]
GO
ALTER TABLE [dbo].[TiTraItem] ADD  CONSTRAINT [DF__TiTraItem__Fecha__0C50D423]  DEFAULT (getdate()) FOR [FechaUltimaMod]
GO
ALTER TABLE [dbo].[TiTraItemUbicacion] ADD  CONSTRAINT [DF__TiTraItem__BajaL__0E391C95]  DEFAULT ((0)) FOR [BajaLogica]
GO
ALTER TABLE [dbo].[TiTraItemUbicacion] ADD  CONSTRAINT [DF__TiTraItem__Fecha__0F2D40CE]  DEFAULT (getdate()) FOR [FechaIns]
GO
ALTER TABLE [dbo].[TiTraItemUbicacion] ADD  CONSTRAINT [DF__TiTraItem__Fecha__10216507]  DEFAULT (getdate()) FOR [FechaUltimaMod]
GO
ALTER TABLE [dbo].[TiTraMenu] ADD  CONSTRAINT [DF_TiTraMenu_ClaUbicacionDefault]  DEFAULT ((0)) FOR [ClaUbicacionDefault]
GO
ALTER TABLE [dbo].[TiTraMenu] ADD  CONSTRAINT [DF_TiTraMenu_ClaUbicacionValida]  DEFAULT ((0)) FOR [ClaUbicacionValida]
GO
ALTER TABLE [dbo].[TiTraMenu] ADD  CONSTRAINT [DF_TiTraMenu_ClaGrupoMenu]  DEFAULT ((1)) FOR [ClaGrupoMenu]
GO
ALTER TABLE [dbo].[TiTraMenu] ADD  CONSTRAINT [DF_TiTraMenu_ClaSubgrupoMenu]  DEFAULT ((1)) FOR [ClaSubgrupoMenu]
GO
ALTER TABLE [dbo].[TiTraMenu] ADD  CONSTRAINT [DF__TiTraMenu__Orien__1209AD79]  DEFAULT ((1)) FOR [OrientacionMenu]
GO
ALTER TABLE [dbo].[TiTraMenu] ADD  CONSTRAINT [DF__TiTraMenu__BajaL__12FDD1B2]  DEFAULT ((0)) FOR [BajaLogica]
GO
ALTER TABLE [dbo].[TiTraMenu] ADD  CONSTRAINT [DF__TiTraMenu__Fecha__13F1F5EB]  DEFAULT (getdate()) FOR [FechaIns]
GO
ALTER TABLE [dbo].[TiTraMenu] ADD  CONSTRAINT [DF__TiTraMenu__Fecha__14E61A24]  DEFAULT (getdate()) FOR [FechaUltimaMod]
GO
ALTER TABLE [dbo].[TiTraMenuUbicacion] ADD  DEFAULT ((0)) FOR [BajaLogica]
GO
ALTER TABLE [dbo].[TiTraMenuUbicacion] ADD  DEFAULT (getdate()) FOR [FechaIns]
GO
ALTER TABLE [dbo].[TiTraMenuUbicacion] ADD  DEFAULT (getdate()) FOR [FechaUltimaMod]
GO
ALTER TABLE [dbo].[TiTraMenuUsuario] ADD  DEFAULT ((0)) FOR [BajaLogica]
GO
ALTER TABLE [dbo].[TiTraMenuUsuario] ADD  DEFAULT (getdate()) FOR [FechaUltimaMod]
GO
ALTER TABLE [dbo].[TiTraObjeto] ADD  CONSTRAINT [DF_TiTraObjetoMenu]  DEFAULT ((1)) FOR [Menu]
GO
ALTER TABLE [dbo].[TiTraObjeto] ADD  CONSTRAINT [DF__TiTraObjeto_o__en_ma__79C80F94]  DEFAULT ((0)) FOR [EnMantenimiento]
GO
ALTER TABLE [dbo].[TiTraObjeto] ADD  CONSTRAINT [DF_TiTraObjetoNombreModificable]  DEFAULT ((1)) FOR [NombreModificable]
GO
ALTER TABLE [dbo].[TiTraObjeto] ADD  CONSTRAINT [DF_TiTraObjetoPermiso1]  DEFAULT ((0)) FOR [Permiso1]
GO
ALTER TABLE [dbo].[TiTraObjeto] ADD  CONSTRAINT [DF_TiTraObjetoPermiso2]  DEFAULT ((0)) FOR [Permiso2]
GO
ALTER TABLE [dbo].[TiTraObjeto] ADD  CONSTRAINT [DF_TiTraObjetoPermiso3]  DEFAULT ((0)) FOR [Permiso3]
GO
ALTER TABLE [dbo].[TiTraObjeto] ADD  CONSTRAINT [DF_TiTraObjetoPermiso4]  DEFAULT ((0)) FOR [Permiso4]
GO
ALTER TABLE [dbo].[TiTraObjeto] ADD  CONSTRAINT [DF_TiTraObjetoPermiso5]  DEFAULT ((0)) FOR [Permiso5]
GO
ALTER TABLE [dbo].[TiTraObjeto] ADD  CONSTRAINT [DF_TiTraObjetoPermiso6]  DEFAULT ((0)) FOR [Permiso6]
GO
ALTER TABLE [dbo].[TiTraObjeto] ADD  CONSTRAINT [DF_TiTraObjetoPermiso7]  DEFAULT ((0)) FOR [Permiso7]
GO
ALTER TABLE [dbo].[TiTraObjeto] ADD  CONSTRAINT [DF_TiTraObjetoPermiso8]  DEFAULT ((0)) FOR [Permiso8]
GO
ALTER TABLE [dbo].[TiTraObjeto] ADD  CONSTRAINT [DF__TiTraObjeto_o__baja___78D3EB5B]  DEFAULT ((0)) FOR [BajaLogica]
GO
ALTER TABLE [dbo].[TiTraObjeto] ADD  CONSTRAINT [DF_TiTraObjeto_FechaIns]  DEFAULT (getdate()) FOR [FechaIns]
GO
ALTER TABLE [dbo].[TiTraObjeto] ADD  CONSTRAINT [DF_TiTraObjeto_FechaUltimaMod]  DEFAULT (getdate()) FOR [FechaUltimaMod]
GO
ALTER TABLE [dbo].[TiTraObjetoColumna] ADD  CONSTRAINT [DF_TiTraObjetoColumna_FechaUltimaMod]  DEFAULT (getdate()) FOR [FechaUltimaMod]
GO
ALTER TABLE [dbo].[TiTraObjetoColumna] ADD  CONSTRAINT [DF_TiTraObjetoColumna_BajaLogica]  DEFAULT ((0)) FOR [BajaLogica]
GO
ALTER TABLE [dbo].[TiTraObjetoColumna] ADD  CONSTRAINT [DF_TiTraObjetoColumna_NombrePcMod]  DEFAULT (host_name()) FOR [NombrePcMod]
GO
ALTER TABLE [dbo].[TiTraParametrosUsuario] ADD  CONSTRAINT [DF__TiTraPara__Orien__1D7B6025]  DEFAULT ((1)) FOR [OrientacionMenus]
GO
ALTER TABLE [dbo].[TiTraParametrosUsuario] ADD  DEFAULT ((0)) FOR [BajaLogica]
GO
ALTER TABLE [dbo].[TiTraParametrosUsuario] ADD  DEFAULT (getdate()) FOR [FechaIns]
GO
ALTER TABLE [dbo].[TiTraParametrosUsuario] ADD  DEFAULT (getdate()) FOR [FechaUltimaMod]
GO
ALTER TABLE [dbo].[TiTraPermiso] ADD  CONSTRAINT [DF_TiTraPermiso_FechaUltimaMod]  DEFAULT (getdate()) FOR [FechaUltimaMod]
GO
ALTER TABLE [dbo].[TiTraPermisoUbicacion] ADD  CONSTRAINT [DF_TiTraPermisoUbicacion_FechaUltimaMod]  DEFAULT (getdate()) FOR [FechaUltimaMod]
GO
ALTER TABLE [dbo].[TiTraReglaColumna] ADD  DEFAULT ((0)) FOR [RangoInicioIncluyente]
GO
ALTER TABLE [dbo].[TiTraReglaColumna] ADD  DEFAULT ((0)) FOR [RangoFinIncluyente]
GO
ALTER TABLE [dbo].[TiTraReglaColumna] ADD  DEFAULT ((0)) FOR [BajaLogica]
GO
ALTER TABLE [dbo].[TiTraReglaColumna] ADD  DEFAULT (NULL) FOR [FechaBajaLogica]
GO
ALTER TABLE [dbo].[TiTraReglaColumna] ADD  DEFAULT (getdate()) FOR [FechaIns]
GO
ALTER TABLE [dbo].[TiTraReglaColumna] ADD  DEFAULT (getdate()) FOR [FechaUltimaMod]
GO
ALTER TABLE [dbo].[TiTraRenglonValidacion] ADD  CONSTRAINT [DF_TiTraRenglonValidacion_BajaLogica]  DEFAULT ((0)) FOR [BajaLogica]
GO
ALTER TABLE [dbo].[TiTraRenglonValidacion] ADD  CONSTRAINT [DF_TiTraRenglonValidacion_FechaBajaLogica]  DEFAULT (NULL) FOR [FechaBajaLogica]
GO
ALTER TABLE [dbo].[TiTraRenglonValidacion] ADD  CONSTRAINT [DF_TiTraRenglonValidacion_FechaIns]  DEFAULT (getdate()) FOR [FechaIns]
GO
ALTER TABLE [dbo].[TiTraRenglonValidacion] ADD  CONSTRAINT [DF_TiTraRenglonValidacion_FechaUltimaMod]  DEFAULT (getdate()) FOR [FechaUltimaMod]
GO
ALTER TABLE [dbo].[TiTraRenglonValidacionDet] ADD  CONSTRAINT [DF_TiTraRenglonValidacionDet_BajaLogica]  DEFAULT ((0)) FOR [BajaLogica]
GO
ALTER TABLE [dbo].[TiTraRenglonValidacionDet] ADD  CONSTRAINT [DF_TiTraRenglonValidacionDet_FechaBajaLogica]  DEFAULT (NULL) FOR [FechaBajaLogica]
GO
ALTER TABLE [dbo].[TiTraRenglonValidacionDet] ADD  CONSTRAINT [DF_TiTraRenglonValidacionDet_FechaIns]  DEFAULT (getdate()) FOR [FechaIns]
GO
ALTER TABLE [dbo].[TiTraRenglonValidacionDet] ADD  CONSTRAINT [DF_TiTraRenglonValidacionDet_FechaUltimaMod]  DEFAULT (getdate()) FOR [FechaUltimaMod]
GO
ALTER TABLE [dbo].[TiTraUbicacionCatalogo] ADD  CONSTRAINT [DF__TiTraUbic__BajaL__2F10007B]  DEFAULT ((0)) FOR [BajaLogica]
GO
ALTER TABLE [dbo].[TiTraUbicacionCatalogo] ADD  CONSTRAINT [DF__TiTraUbic__Fecha__300424B4]  DEFAULT (NULL) FOR [FechaBajaLogica]
GO
ALTER TABLE [dbo].[TiTraUbicacionCatalogo] ADD  CONSTRAINT [DF__TiTraUbic__Fecha__30F848ED]  DEFAULT (getdate()) FOR [FechaIns]
GO
ALTER TABLE [dbo].[TiTraUbicacionCatalogo] ADD  CONSTRAINT [DF__TiTraUbic__Fecha__31EC6D26]  DEFAULT (getdate()) FOR [FechaUltimaMod]
GO
ALTER TABLE [dbo].[TiTraUsuarioContrasena] ADD  CONSTRAINT [DF_TiTraUsuarioContrasenaHuellaUtiliza]  DEFAULT ((0)) FOR [HuellaUtiliza]
GO
ALTER TABLE [dbo].[TiTraUsuarioContrasena] ADD  CONSTRAINT [DF__TiTraUsua__Token__2838E5BA]  DEFAULT ((0)) FOR [TokenUtiliza]
GO
ALTER TABLE [dbo].[TiTraUsuarioContrasena] ADD  CONSTRAINT [DF__TiTraUsua__Black__292D09F3]  DEFAULT ((0)) FOR [BlackberryUtiliza]
GO
ALTER TABLE [dbo].[TiTraUsuarioContrasena] ADD  CONSTRAINT [DF__TiTraUsua__Opcio__2A212E2C]  DEFAULT ((1)) FOR [OpcionesMultiples]
GO
ALTER TABLE [dbo].[TiTraUsuarioContrasena] ADD  CONSTRAINT [DF_TiTraUsuarioContrasenaHuellaDefault]  DEFAULT ((0)) FOR [HuellaDefault]
GO
ALTER TABLE [dbo].[TiTraUsuarioContrasena] ADD  CONSTRAINT [DF_TiTraUsuarioContrasenaHuellaObligatoria]  DEFAULT ((0)) FOR [HuellaObligatoria]
GO
ALTER TABLE [dbo].[TiTraUsuarioContrasena] ADD  CONSTRAINT [DF_TiTraUsuarioContrasenaBloqueoExtra1]  DEFAULT ((0)) FOR [BloqueoExtra1]
GO
ALTER TABLE [dbo].[TiTraUsuarioContrasena] ADD  CONSTRAINT [DF_TiTraUsuarioContrasenaBloqueoExtra2]  DEFAULT ((0)) FOR [BloqueoExtra2]
GO
ALTER TABLE [dbo].[TiTraUsuarioContrasena] ADD  CONSTRAINT [DF_TiTraUsuarioContrasenaBloqueoHuella]  DEFAULT ((0)) FOR [BloqueoExtraHuella]
GO
ALTER TABLE [dbo].[TiTraUsuarioContrasena] ADD  CONSTRAINT [DF__TiTraUsuarioContrasena__baja___035179CE]  DEFAULT ((0)) FOR [BajaLogica]
GO
ALTER TABLE [dbo].[TiTraUsuarioContrasena] ADD  CONSTRAINT [DF_TiTraUsuarioContrasena_FechaUltimaMod]  DEFAULT (getdate()) FOR [FechaUltimaMod]
GO
ALTER TABLE [dbo].[TiTraUsuarioDireccion] ADD  CONSTRAINT [DF__TiTraUsuarioDireccion__baja___0539C240]  DEFAULT ((0)) FOR [BajaLogica]
GO
ALTER TABLE [dbo].[TiTraUsuarioDireccion] ADD  CONSTRAINT [DF_TiTraUsuarioDireccion_FechaUltimaMod]  DEFAULT (getdate()) FOR [FechaUltimaMod]
GO
ALTER TABLE [dbo].[TiTraValor] ADD  CONSTRAINT [DF__TiTraValo__BajaL__33D4B598]  DEFAULT ((0)) FOR [BajaLogica]
GO
ALTER TABLE [dbo].[TiTraValor] ADD  CONSTRAINT [DF__TiTraValo__Fecha__34C8D9D1]  DEFAULT (NULL) FOR [FechaBajaLogica]
GO
ALTER TABLE [dbo].[TiTraValor] ADD  CONSTRAINT [DF__TiTraValo__Fecha__35BCFE0A]  DEFAULT (getdate()) FOR [FechaIns]
GO
ALTER TABLE [dbo].[TiTraValor] ADD  CONSTRAINT [DF__TiTraValo__Fecha__36B12243]  DEFAULT (getdate()) FOR [FechaUltimaMod]
GO
ALTER TABLE [dbo].[AceCatCausaDesviacion]  WITH CHECK ADD  CONSTRAINT [FK_AceCatCausasDesviacion_AceCatTipoElemento] FOREIGN KEY([ClaTipoElemento])
REFERENCES [dbo].[AceCatTipoElemento] ([ClaTipoElemento])
GO
ALTER TABLE [dbo].[AceCatCausaDesviacion] CHECK CONSTRAINT [FK_AceCatCausasDesviacion_AceCatTipoElemento]
GO
ALTER TABLE [dbo].[AceCatEspecificacionQuimica]  WITH CHECK ADD  CONSTRAINT [FK_AceCatEspecificacionQuimica_AceCatGrado] FOREIGN KEY([ClaGrado])
REFERENCES [dbo].[AceCatGrado] ([ClaGrado])
GO
ALTER TABLE [dbo].[AceCatEspecificacionQuimica] CHECK CONSTRAINT [FK_AceCatEspecificacionQuimica_AceCatGrado]
GO
ALTER TABLE [dbo].[AceCatEspecificacionQuimica]  WITH CHECK ADD  CONSTRAINT [FK_AceCatEspecificacionQuimica_AceCatTipoEspecificacion] FOREIGN KEY([ClaTipoEspecificacion])
REFERENCES [dbo].[AceCatTipoEspecificacion] ([ClaTipoEspecificacion])
GO
ALTER TABLE [dbo].[AceCatEspecificacionQuimica] CHECK CONSTRAINT [FK_AceCatEspecificacionQuimica_AceCatTipoEspecificacion]
GO
ALTER TABLE [dbo].[AceCatGrado]  WITH CHECK ADD  CONSTRAINT [FK_AceCatGrado_AceCatGrupoRecetaChatarra] FOREIGN KEY([ClaGrupoRecetaChatarra])
REFERENCES [dbo].[AceCatGrupoRecetaChatarra] ([ClaGrupoRecetaChatarra])
GO
ALTER TABLE [dbo].[AceCatGrado] CHECK CONSTRAINT [FK_AceCatGrado_AceCatGrupoRecetaChatarra]
GO
ALTER TABLE [dbo].[AceCatGrado]  WITH CHECK ADD  CONSTRAINT [FK_AceCatGrado_AceCatGrupoUsoTipico] FOREIGN KEY([ClaGrupoUsoTipico])
REFERENCES [dbo].[AceCatGrupoUsoTipico] ([ClaGrupoUsoTipico])
GO
ALTER TABLE [dbo].[AceCatGrado] CHECK CONSTRAINT [FK_AceCatGrado_AceCatGrupoUsoTipico]
GO
ALTER TABLE [dbo].[AceCatVersionArticulo]  WITH CHECK ADD  CONSTRAINT [FK_AceCatVersionArticulo_AceCatTipoVersion] FOREIGN KEY([ClaTipoVersionArticulo])
REFERENCES [dbo].[AceCatTipoVersionArticulo] ([ClaTipoVersionArticulo])
GO
ALTER TABLE [dbo].[AceCatVersionArticulo] CHECK CONSTRAINT [FK_AceCatVersionArticulo_AceCatTipoVersion]
GO
ALTER TABLE [dbo].[AceRelEspecificacionElemento]  WITH CHECK ADD  CONSTRAINT [FK_AceRelEspecificacionElemento_AceCatElementoQuimico] FOREIGN KEY([ClaElementoQuimico])
REFERENCES [dbo].[AceCatElementoQuimico] ([ClaElementoQuimico])
GO
ALTER TABLE [dbo].[AceRelEspecificacionElemento] CHECK CONSTRAINT [FK_AceRelEspecificacionElemento_AceCatElementoQuimico]
GO
ALTER TABLE [dbo].[AceRelEspecificacionElemento]  WITH CHECK ADD  CONSTRAINT [FK_AceRelEspecificacionElemento_AceCatEspecificacionQuimica] FOREIGN KEY([ClaGrado], [ClaEspecificacionQuimica])
REFERENCES [dbo].[AceCatEspecificacionQuimica] ([ClaGrado], [ClaEspecificacionQuimica])
GO
ALTER TABLE [dbo].[AceRelEspecificacionElemento] CHECK CONSTRAINT [FK_AceRelEspecificacionElemento_AceCatEspecificacionQuimica]
GO
ALTER TABLE [dbo].[ArtCatArticuloAce]  WITH CHECK ADD  CONSTRAINT [FK_ArtCatArticuloAce_AceCatGrado] FOREIGN KEY([ClaGrado])
REFERENCES [dbo].[AceCatGrado] ([ClaGrado])
GO
ALTER TABLE [dbo].[ArtCatArticuloAce] CHECK CONSTRAINT [FK_ArtCatArticuloAce_AceCatGrado]
GO
ALTER TABLE [dbo].[ArtCatArticuloAce]  WITH CHECK ADD  CONSTRAINT [FK_ArtCatArticuloAce_AceCatGrupoProduccion] FOREIGN KEY([ClaGrupoProduccion])
REFERENCES [dbo].[AceCatGrupoProduccion] ([ClaGrupoProduccion])
GO
ALTER TABLE [dbo].[ArtCatArticuloAce] CHECK CONSTRAINT [FK_ArtCatArticuloAce_AceCatGrupoProduccion]
GO
ALTER TABLE [dbo].[ArtCatArticuloAce]  WITH CHECK ADD  CONSTRAINT [FK_ArtCatArticuloAce_ArtCatArticulo] FOREIGN KEY([ClaTipoInventario], [ClaArticulo])
REFERENCES [dbo].[ArtCatArticulo] ([ClaTipoInventario], [ClaArticulo])
GO
ALTER TABLE [dbo].[ArtCatArticuloAce] CHECK CONSTRAINT [FK_ArtCatArticuloAce_ArtCatArticulo]
GO
ALTER TABLE [dbo].[ArtCatArticuloAce]  WITH CHECK ADD  CONSTRAINT [FK_ArtCatArticuloAce_ArtCatFamiliaAce_desperdicio] FOREIGN KEY([ClaTipoInventario], [ClaFamiliaDesperdicio])
REFERENCES [dbo].[ArtCatFamiliaAce] ([ClaTipoInventario], [ClaFamilia])
GO
ALTER TABLE [dbo].[ArtCatArticuloAce] CHECK CONSTRAINT [FK_ArtCatArticuloAce_ArtCatFamiliaAce_desperdicio]
GO
ALTER TABLE [dbo].[ArtCatArticuloAce]  WITH CHECK ADD  CONSTRAINT [FK_ArtCatArticuloAce_ArtCatFamiliaAce_Uso] FOREIGN KEY([ClaTipoInventario], [ClaFamiliaUso])
REFERENCES [dbo].[ArtCatFamiliaAce] ([ClaTipoInventario], [ClaFamilia])
GO
ALTER TABLE [dbo].[ArtCatArticuloAce] CHECK CONSTRAINT [FK_ArtCatArticuloAce_ArtCatFamiliaAce_Uso]
GO
ALTER TABLE [dbo].[ArtCatFamiliaAce]  WITH CHECK ADD  CONSTRAINT [FK_ArtCatFamiliaAce_ArtCatFamilia] FOREIGN KEY([ClaTipoInventario], [ClaFamilia])
REFERENCES [dbo].[ArtCatFamilia] ([ClaTipoInventario], [ClaFamilia])
GO
ALTER TABLE [dbo].[ArtCatFamiliaAce] CHECK CONSTRAINT [FK_ArtCatFamiliaAce_ArtCatFamilia]
GO
ALTER TABLE [dbo].[CexRelIncotermSufijos]  WITH CHECK ADD  CONSTRAINT [FK_CexRelIncotermSufijos_CexCatIncotermSufijos] FOREIGN KEY([ClaIncotermSufijo])
REFERENCES [dbo].[CexCatIncotermSufijos] ([ClaIncotermSufijo])
GO
ALTER TABLE [dbo].[CexRelIncotermSufijos] CHECK CONSTRAINT [FK_CexRelIncotermSufijos_CexCatIncotermSufijos]
GO
ALTER TABLE [dbo].[CmpCatMotivo]  WITH CHECK ADD  CONSTRAINT [FK_CmpCatMotivo_CmpCatTipoMotivo] FOREIGN KEY([ClaTipoMotivo])
REFERENCES [dbo].[CmpCatTipoMotivo] ([ClaTipoMotivo])
GO
ALTER TABLE [dbo].[CmpCatMotivo] CHECK CONSTRAINT [FK_CmpCatMotivo_CmpCatTipoMotivo]
GO
ALTER TABLE [dbo].[CmpCatProveedorContacto]  WITH NOCHECK ADD  CONSTRAINT [FK_CmpCatProveedorContacto_CmpCatProveedorRefLocal] FOREIGN KEY([ClaUbicacion], [ClaCUP])
REFERENCES [dbo].[CmpCatProveedorRefLocal] ([ClaUbicacion], [ClaCUP])
GO
ALTER TABLE [dbo].[CmpCatProveedorContacto] NOCHECK CONSTRAINT [FK_CmpCatProveedorContacto_CmpCatProveedorRefLocal]
GO
ALTER TABLE [dbo].[FleCatTransporte]  WITH CHECK ADD  CONSTRAINT [FKFleCatTransporteFleCatGrupoTransporte] FOREIGN KEY([ClaGrupoTransporte])
REFERENCES [dbo].[FleCatGrupoTransporte] ([ClaGrupoTransporte])
GO
ALTER TABLE [dbo].[FleCatTransporte] CHECK CONSTRAINT [FKFleCatTransporteFleCatGrupoTransporte]
GO
ALTER TABLE [dbo].[FleCatTransportista]  WITH CHECK ADD  CONSTRAINT [FKFleCatTransportistaFleCatGrupoTransporte] FOREIGN KEY([ClaGrupoTransporte])
REFERENCES [dbo].[FleCatGrupoTransporte] ([ClaGrupoTransporte])
GO
ALTER TABLE [dbo].[FleCatTransportista] CHECK CONSTRAINT [FKFleCatTransportistaFleCatGrupoTransporte]
GO
ALTER TABLE [dbo].[InaCatInvFisico]  WITH CHECK ADD  CONSTRAINT [FKInaCatInvFisicoInaCatEstatusInvFisico] FOREIGN KEY([ClaTipoInventario], [ClaEstatusInventarioFisico])
REFERENCES [dbo].[InaCatEstatusInvFisico] ([ClaTipoInventario], [ClaEstatusInventarioFisico])
GO
ALTER TABLE [dbo].[InaCatInvFisico] CHECK CONSTRAINT [FKInaCatInvFisicoInaCatEstatusInvFisico]
GO
ALTER TABLE [dbo].[InvCatAlmacen]  WITH CHECK ADD  CONSTRAINT [FKInvCatAlmacenInvCatTipoInv] FOREIGN KEY([ClaTipoInventario])
REFERENCES [dbo].[InvCatTipoInv] ([ClaTipoInventario])
GO
ALTER TABLE [dbo].[InvCatAlmacen] CHECK CONSTRAINT [FKInvCatAlmacenInvCatTipoInv]
GO
ALTER TABLE [dbo].[InvCatListaInvDet]  WITH CHECK ADD  CONSTRAINT [FKInvCatListaInvDetInvCatListaInvEnc] FOREIGN KEY([ClaLista], [ClaUbicacion], [ClaTipoInventario])
REFERENCES [dbo].[InvCatListaInvEnc] ([ClaLista], [ClaUbicacion], [ClaTipoInventario])
GO
ALTER TABLE [dbo].[InvCatListaInvDet] CHECK CONSTRAINT [FKInvCatListaInvDetInvCatListaInvEnc]
GO
ALTER TABLE [dbo].[InvCatListaInvEnc]  WITH CHECK ADD  CONSTRAINT [FKInvCatListaInvEncInvCatAlmacen] FOREIGN KEY([ClaAlmacen], [ClaTipoInventario], [ClaUbicacion])
REFERENCES [dbo].[InvCatAlmacen] ([ClaAlmacen], [ClaTipoInventario], [ClaUbicacion])
GO
ALTER TABLE [dbo].[InvCatListaInvEnc] CHECK CONSTRAINT [FKInvCatListaInvEncInvCatAlmacen]
GO
ALTER TABLE [dbo].[InvCatListaInvEnc]  WITH CHECK ADD  CONSTRAINT [FKInvCatListaInvEncInvCatSeccion] FOREIGN KEY([ClaAlmacen], [ClaSubAlmacen], [ClaSubSubAlmacen], [ClaSeccion], [ClaTipoInventario], [ClaUbicacion])
REFERENCES [dbo].[InvCatSeccion] ([ClaAlmacen], [ClaSubAlmacen], [ClaSubSubAlmacen], [ClaSeccion], [ClaTipoInventario], [ClaUbicacion])
GO
ALTER TABLE [dbo].[InvCatListaInvEnc] CHECK CONSTRAINT [FKInvCatListaInvEncInvCatSeccion]
GO
ALTER TABLE [dbo].[InvCatListaInvEnc]  WITH CHECK ADD  CONSTRAINT [FKInvCatListaInvEncInvCatSubAlmacen] FOREIGN KEY([ClaAlmacen], [ClaSubAlmacen], [ClaTipoInventario], [ClaUbicacion])
REFERENCES [dbo].[InvCatSubAlmacen] ([ClaAlmacen], [ClaSubAlmacen], [ClaTipoInventario], [ClaUbicacion])
GO
ALTER TABLE [dbo].[InvCatListaInvEnc] CHECK CONSTRAINT [FKInvCatListaInvEncInvCatSubAlmacen]
GO
ALTER TABLE [dbo].[InvCatListaInvEnc]  WITH CHECK ADD  CONSTRAINT [FKInvCatListaInvEncInvCatSubSubAlmacen] FOREIGN KEY([ClaAlmacen], [ClaSubAlmacen], [ClaSubSubAlmacen], [ClaTipoInventario], [ClaUbicacion])
REFERENCES [dbo].[InvCatSubSubAlmacen] ([ClaAlmacen], [ClaSubAlmacen], [ClaSubSubAlmacen], [ClaTipoInventario], [ClaUbicacion])
GO
ALTER TABLE [dbo].[InvCatListaInvEnc] CHECK CONSTRAINT [FKInvCatListaInvEncInvCatSubSubAlmacen]
GO
ALTER TABLE [dbo].[InvCatMotivosInv]  WITH CHECK ADD  CONSTRAINT [FKInvCatMotivosInvInvCatTipoMotivos] FOREIGN KEY([ClaTipoMotivo], [ClaTipoInventario])
REFERENCES [dbo].[InvCatTipoMotivos] ([ClaTipoMotivo], [ClaTipoInventario])
GO
ALTER TABLE [dbo].[InvCatMotivosInv] CHECK CONSTRAINT [FKInvCatMotivosInvInvCatTipoMotivos]
GO
ALTER TABLE [dbo].[InvCatSeccion]  WITH CHECK ADD  CONSTRAINT [FKInvCatSeccionInvCatSubSubAlmacen] FOREIGN KEY([ClaAlmacen], [ClaSubAlmacen], [ClaSubSubAlmacen], [ClaTipoInventario], [ClaUbicacion])
REFERENCES [dbo].[InvCatSubSubAlmacen] ([ClaAlmacen], [ClaSubAlmacen], [ClaSubSubAlmacen], [ClaTipoInventario], [ClaUbicacion])
GO
ALTER TABLE [dbo].[InvCatSeccion] CHECK CONSTRAINT [FKInvCatSeccionInvCatSubSubAlmacen]
GO
ALTER TABLE [dbo].[InvCatSubAlmacen]  WITH CHECK ADD  CONSTRAINT [FKInvCatSubAlmacenInvCatAlmacen] FOREIGN KEY([ClaAlmacen], [ClaTipoInventario], [ClaUbicacion])
REFERENCES [dbo].[InvCatAlmacen] ([ClaAlmacen], [ClaTipoInventario], [ClaUbicacion])
GO
ALTER TABLE [dbo].[InvCatSubAlmacen] CHECK CONSTRAINT [FKInvCatSubAlmacenInvCatAlmacen]
GO
ALTER TABLE [dbo].[InvCatTMA]  WITH CHECK ADD  CONSTRAINT [FKInvCatTMAInvCatGrupoTMA] FOREIGN KEY([ClaGrupoTMA], [ClaTipoInventario])
REFERENCES [dbo].[InvCatGrupoTMA] ([ClaGrupoTMA], [ClaTipoInventario])
GO
ALTER TABLE [dbo].[InvCatTMA] CHECK CONSTRAINT [FKInvCatTMAInvCatGrupoTMA]
GO
ALTER TABLE [dbo].[InvCatTMA]  WITH CHECK ADD  CONSTRAINT [FKInvCatTMAInvCatGrupoTMA2] FOREIGN KEY([ClaGrupoTMA2], [ClaTipoInventario])
REFERENCES [dbo].[InvCatGrupoTMA2] ([ClaGrupoTMA2], [ClaTipoInventario])
GO
ALTER TABLE [dbo].[InvCatTMA] CHECK CONSTRAINT [FKInvCatTMAInvCatGrupoTMA2]
GO
ALTER TABLE [dbo].[InvRelListaInvResp]  WITH CHECK ADD  CONSTRAINT [FKInvRelListaInvRespInvCatListaInvEnc] FOREIGN KEY([ClaLista], [ClaUbicacion], [ClaTipoInventario])
REFERENCES [dbo].[InvCatListaInvEnc] ([ClaLista], [ClaUbicacion], [ClaTipoInventario])
GO
ALTER TABLE [dbo].[InvRelListaInvResp] CHECK CONSTRAINT [FKInvRelListaInvRespInvCatListaInvEnc]
GO
ALTER TABLE [dbo].[InvRelTipoInventarioUsuario]  WITH CHECK ADD  CONSTRAINT [FK_InvRelTipoInventarioUsuario_InvCatTipoInv] FOREIGN KEY([ClaTipoInventario])
REFERENCES [dbo].[InvCatTipoInv] ([ClaTipoInventario])
GO
ALTER TABLE [dbo].[InvRelTipoInventarioUsuario] CHECK CONSTRAINT [FK_InvRelTipoInventarioUsuario_InvCatTipoInv]
GO
ALTER TABLE [dbo].[RmaCatSituacionMotivo]  WITH CHECK ADD  CONSTRAINT [FK_RmaCatSituacionMotivoRmaCatSituacion] FOREIGN KEY([ClaSituacion])
REFERENCES [dbo].[RmaCatSituacion] ([ClaSituacion])
GO
ALTER TABLE [dbo].[RmaCatSituacionMotivo] CHECK CONSTRAINT [FK_RmaCatSituacionMotivoRmaCatSituacion]
GO
ALTER TABLE [dbo].[TiBitObjeto]  WITH NOCHECK ADD  CONSTRAINT [FK_BitObjetoTipoObjeto] FOREIGN KEY([ClaTipoObjeto])
REFERENCES [dbo].[TiCatTipoObjeto] ([ClaTipoObjeto])
GO
ALTER TABLE [dbo].[TiBitObjeto] CHECK CONSTRAINT [FK_BitObjetoTipoObjeto]
GO
ALTER TABLE [dbo].[TiBitPermiso]  WITH NOCHECK ADD  CONSTRAINT [FK_BitPermisoSistemaObjeto] FOREIGN KEY([idObjeto])
REFERENCES [dbo].[TiTraObjeto] ([IdObjeto])
GO
ALTER TABLE [dbo].[TiBitPermiso] CHECK CONSTRAINT [FK_BitPermisoSistemaObjeto]
GO
ALTER TABLE [dbo].[TiBitPermiso]  WITH NOCHECK ADD  CONSTRAINT [FK_BitPermisoUsuario] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[TiTraUsuario] ([IdUsuario])
GO
ALTER TABLE [dbo].[TiBitPermiso] CHECK CONSTRAINT [FK_BitPermisoUsuario]
GO
ALTER TABLE [dbo].[TiBitPermisoUbicacion]  WITH NOCHECK ADD  CONSTRAINT [FK_BitPermisoUbicacionObjeto] FOREIGN KEY([IdObjeto])
REFERENCES [dbo].[TiTraObjeto] ([IdObjeto])
GO
ALTER TABLE [dbo].[TiBitPermisoUbicacion] CHECK CONSTRAINT [FK_BitPermisoUbicacionObjeto]
GO
ALTER TABLE [dbo].[TiBitPermisoUbicacion]  WITH NOCHECK ADD  CONSTRAINT [FK_BitPermisoUbicacionUsuario] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[TiTraUsuario] ([IdUsuario])
GO
ALTER TABLE [dbo].[TiBitPermisoUbicacion] CHECK CONSTRAINT [FK_BitPermisoUbicacionUsuario]
GO
ALTER TABLE [dbo].[TiBitReferencia]  WITH CHECK ADD  CONSTRAINT [FK_BitReferenciaPerfil] FOREIGN KEY([IdPerfilReferenciado])
REFERENCES [dbo].[TiTraUsuario] ([IdUsuario])
GO
ALTER TABLE [dbo].[TiBitReferencia] CHECK CONSTRAINT [FK_BitReferenciaPerfil]
GO
ALTER TABLE [dbo].[TiBitReferencia]  WITH CHECK ADD  CONSTRAINT [FK_BitReferenciaUsuario] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[TiTraUsuario] ([IdUsuario])
GO
ALTER TABLE [dbo].[TiBitReferencia] CHECK CONSTRAINT [FK_BitReferenciaUsuario]
GO
ALTER TABLE [dbo].[TiCatMascara]  WITH CHECK ADD  CONSTRAINT [FK_TiCatMascara_TiCatTipoDato] FOREIGN KEY([ClaTipoDato])
REFERENCES [dbo].[TiCatTipoDato] ([ClaTipoDato])
GO
ALTER TABLE [dbo].[TiCatMascara] CHECK CONSTRAINT [FK_TiCatMascara_TiCatTipoDato]
GO
ALTER TABLE [dbo].[TiCatRegla]  WITH CHECK ADD  CONSTRAINT [FK_TiCatRegla_TiCatTipoDato] FOREIGN KEY([ClaTipoDato])
REFERENCES [dbo].[TiCatTipoDato] ([ClaTipoDato])
GO
ALTER TABLE [dbo].[TiCatRegla] CHECK CONSTRAINT [FK_TiCatRegla_TiCatTipoDato]
GO
ALTER TABLE [dbo].[TiTraCatalogo]  WITH CHECK ADD  CONSTRAINT [FK_TiTraCatalogo_TiTraConexionCatalogo] FOREIGN KEY([IdCatalogo], [ClaConexionDefault])
REFERENCES [dbo].[TiTraConexionCatalogo] ([IdCatalogo], [IdUbicacion])
GO
ALTER TABLE [dbo].[TiTraCatalogo] CHECK CONSTRAINT [FK_TiTraCatalogo_TiTraConexionCatalogo]
GO
ALTER TABLE [dbo].[TiTraColumna]  WITH CHECK ADD  CONSTRAINT [FK_TiTraColumna_TiCatMascara] FOREIGN KEY([ClaMascara])
REFERENCES [dbo].[TiCatMascara] ([ClaMascara])
GO
ALTER TABLE [dbo].[TiTraColumna] CHECK CONSTRAINT [FK_TiTraColumna_TiCatMascara]
GO
ALTER TABLE [dbo].[TiTraColumna]  WITH CHECK ADD  CONSTRAINT [FK_TiTraColumna_TiCatTipoDato] FOREIGN KEY([ClaTipoDato])
REFERENCES [dbo].[TiCatTipoDato] ([ClaTipoDato])
GO
ALTER TABLE [dbo].[TiTraColumna] CHECK CONSTRAINT [FK_TiTraColumna_TiCatTipoDato]
GO
ALTER TABLE [dbo].[TiTraColumna]  WITH CHECK ADD  CONSTRAINT [FK_TiTraColumna_TiTraCatalogo] FOREIGN KEY([IdCatalogo])
REFERENCES [dbo].[TiTraCatalogo] ([IdCatalogo])
GO
ALTER TABLE [dbo].[TiTraColumna] CHECK CONSTRAINT [FK_TiTraColumna_TiTraCatalogo]
GO
ALTER TABLE [dbo].[TiTraItem]  WITH CHECK ADD  CONSTRAINT [FK_TiTraItem_TiTraMenu] FOREIGN KEY([IdMenu])
REFERENCES [dbo].[TiTraMenu] ([IdMenu])
GO
ALTER TABLE [dbo].[TiTraItem] CHECK CONSTRAINT [FK_TiTraItem_TiTraMenu]
GO
ALTER TABLE [dbo].[TiTraMenuUbicacion]  WITH CHECK ADD  CONSTRAINT [FK_TiTraMenuUbicacion_TiTraMenu] FOREIGN KEY([IdMenu])
REFERENCES [dbo].[TiTraMenu] ([IdMenu])
GO
ALTER TABLE [dbo].[TiTraMenuUbicacion] CHECK CONSTRAINT [FK_TiTraMenuUbicacion_TiTraMenu]
GO
ALTER TABLE [dbo].[TiTraMenuUsuario]  WITH CHECK ADD  CONSTRAINT [FK_TiTraMenuUsuario_TiTraMenu] FOREIGN KEY([IdMenu])
REFERENCES [dbo].[TiTraMenu] ([IdMenu])
GO
ALTER TABLE [dbo].[TiTraMenuUsuario] CHECK CONSTRAINT [FK_TiTraMenuUsuario_TiTraMenu]
GO
ALTER TABLE [dbo].[TiTraObjeto]  WITH CHECK ADD  CONSTRAINT [FK_ObjetoTipoObjeto] FOREIGN KEY([ClaTipoObjeto])
REFERENCES [dbo].[TiCatTipoObjeto] ([ClaTipoObjeto])
GO
ALTER TABLE [dbo].[TiTraObjeto] CHECK CONSTRAINT [FK_ObjetoTipoObjeto]
GO
ALTER TABLE [dbo].[TiTraPermiso]  WITH CHECK ADD  CONSTRAINT [FK_PermisoSistemaObjeto] FOREIGN KEY([idObjeto])
REFERENCES [dbo].[TiTraObjeto] ([IdObjeto])
GO
ALTER TABLE [dbo].[TiTraPermiso] CHECK CONSTRAINT [FK_PermisoSistemaObjeto]
GO
ALTER TABLE [dbo].[TiTraPermiso]  WITH CHECK ADD  CONSTRAINT [FK_PermisoUsuario] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[TiTraUsuario] ([IdUsuario])
GO
ALTER TABLE [dbo].[TiTraPermiso] CHECK CONSTRAINT [FK_PermisoUsuario]
GO
ALTER TABLE [dbo].[TiTraPermisoUbicacion]  WITH CHECK ADD  CONSTRAINT [FK_PermisoUbicacionObjeto] FOREIGN KEY([IdObjeto])
REFERENCES [dbo].[TiTraObjeto] ([IdObjeto])
GO
ALTER TABLE [dbo].[TiTraPermisoUbicacion] CHECK CONSTRAINT [FK_PermisoUbicacionObjeto]
GO
ALTER TABLE [dbo].[TiTraPermisoUbicacion]  WITH CHECK ADD  CONSTRAINT [FK_PermisoUbicacionUsuario] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[TiTraUsuario] ([IdUsuario])
GO
ALTER TABLE [dbo].[TiTraPermisoUbicacion] CHECK CONSTRAINT [FK_PermisoUbicacionUsuario]
GO
ALTER TABLE [dbo].[TiTraReferencia]  WITH CHECK ADD  CONSTRAINT [FK_ReferenciaPerfil] FOREIGN KEY([IdPerfilReferenciado])
REFERENCES [dbo].[TiTraUsuario] ([IdUsuario])
GO
ALTER TABLE [dbo].[TiTraReferencia] CHECK CONSTRAINT [FK_ReferenciaPerfil]
GO
ALTER TABLE [dbo].[TiTraReferencia]  WITH CHECK ADD  CONSTRAINT [FK_ReferenciaUsuario] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[TiTraUsuario] ([IdUsuario])
GO
ALTER TABLE [dbo].[TiTraReferencia] CHECK CONSTRAINT [FK_ReferenciaUsuario]
GO
ALTER TABLE [dbo].[TiTraReglaColumna]  WITH CHECK ADD  CONSTRAINT [FK_TiTraReglaColumna_TiCatRegla] FOREIGN KEY([ClaTipoRegla], [ClaTipoDato])
REFERENCES [dbo].[TiCatRegla] ([ClaRegla], [ClaTipoDato])
GO
ALTER TABLE [dbo].[TiTraReglaColumna] CHECK CONSTRAINT [FK_TiTraReglaColumna_TiCatRegla]
GO
ALTER TABLE [dbo].[TiTraReglaColumna]  WITH CHECK ADD  CONSTRAINT [FK_TiTraReglaColumna_TiTraCatalogo] FOREIGN KEY([IdCatalogo])
REFERENCES [dbo].[TiTraCatalogo] ([IdCatalogo])
GO
ALTER TABLE [dbo].[TiTraReglaColumna] CHECK CONSTRAINT [FK_TiTraReglaColumna_TiTraCatalogo]
GO
ALTER TABLE [dbo].[TiTraReglaColumna]  WITH CHECK ADD  CONSTRAINT [FK_TiTraReglaColumna_TiTraColumna] FOREIGN KEY([IdColumna], [IdCatalogo])
REFERENCES [dbo].[TiTraColumna] ([IdColumna], [IdCatalogo])
GO
ALTER TABLE [dbo].[TiTraReglaColumna] CHECK CONSTRAINT [FK_TiTraReglaColumna_TiTraColumna]
GO
ALTER TABLE [dbo].[TiTraUsuarioContrasena]  WITH CHECK ADD  CONSTRAINT [FK_UsuarioContrasenaUsuario] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[TiTraUsuario] ([IdUsuario])
GO
ALTER TABLE [dbo].[TiTraUsuarioContrasena] CHECK CONSTRAINT [FK_UsuarioContrasenaUsuario]
GO
ALTER TABLE [dbo].[TiTraUsuarioDireccion]  WITH CHECK ADD  CONSTRAINT [FK_UsuarioDireccionUsuario] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[TiTraUsuario] ([IdUsuario])
GO
ALTER TABLE [dbo].[TiTraUsuarioDireccion] CHECK CONSTRAINT [FK_UsuarioDireccionUsuario]
GO
ALTER TABLE [dbo].[TiTraUsuarioUbicacion]  WITH CHECK ADD  CONSTRAINT [FK_UsuarioUbicacionUsuario] FOREIGN KEY([IdUsuario])
REFERENCES [dbo].[TiTraUsuario] ([IdUsuario])
GO
ALTER TABLE [dbo].[TiTraUsuarioUbicacion] CHECK CONSTRAINT [FK_UsuarioUbicacionUsuario]
GO
ALTER TABLE [dbo].[CexCatAduana]  WITH CHECK ADD  CONSTRAINT [Chk_CexCatAduana] CHECK  ((isnull([Descripcion],'')<>'' OR isnull([DescripcionIngles],'')<>'' OR isnull([DescripcionIdioma2],'')<>''))
GO
ALTER TABLE [dbo].[CexCatAduana] CHECK CONSTRAINT [Chk_CexCatAduana]
GO
ALTER TABLE [dbo].[CexCatConcepto]  WITH CHECK ADD  CONSTRAINT [Chk_CexCatConcepto] CHECK  ((isnull([Descripcion],'')<>'' OR isnull([DescripcionIngles],'')<>'' OR isnull([DescripcionIdioma2],'')<>''))
GO
ALTER TABLE [dbo].[CexCatConcepto] CHECK CONSTRAINT [Chk_CexCatConcepto]
GO
ALTER TABLE [dbo].[CexCatRegion]  WITH CHECK ADD  CONSTRAINT [Chk_CexCatRegion] CHECK  ((isnull([Descripcion],'')<>'' OR isnull([DescripcionIngles],'')<>'' OR isnull([DescripcionIdioma2],'')<>''))
GO
ALTER TABLE [dbo].[CexCatRegion] CHECK CONSTRAINT [Chk_CexCatRegion]
GO
ALTER TABLE [dbo].[CexCatTipoOperacion]  WITH CHECK ADD  CONSTRAINT [Chk_CexCatTipoOperacion] CHECK  ((isnull([Descripcion],'')<>'' OR isnull([DescripcionIngles],'')<>'' OR isnull([DescripcionIdioma2],'')<>''))
GO
ALTER TABLE [dbo].[CexCatTipoOperacion] CHECK CONSTRAINT [Chk_CexCatTipoOperacion]
GO
ALTER TABLE [dbo].[CexCatTipoServicio]  WITH CHECK ADD  CONSTRAINT [Chk_CexCatTipoServicio] CHECK  ((isnull([Descripcion],'')<>'' OR isnull([DescripcionIngles],'')<>'' OR isnull([DescripcionIdioma2],'')<>''))
GO
ALTER TABLE [dbo].[CexCatTipoServicio] CHECK CONSTRAINT [Chk_CexCatTipoServicio]
GO
EXEC sys.sp_addextendedproperty @name=N'AutoDeployed', @value=N'yes' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'FUNCTION',@level1name=N'FnDecriptaPassword'
GO
EXEC sys.sp_addextendedproperty @name=N'SqlAssemblyFile', @value=N'FnDecriptaPassword.cs' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'FUNCTION',@level1name=N'FnDecriptaPassword'
GO
EXEC sys.sp_addextendedproperty @name=N'SqlAssemblyFileLine', @value=15 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'FUNCTION',@level1name=N'FnDecriptaPassword'
GO
EXEC sys.sp_addextendedproperty @name=N'AutoDeployed', @value=N'yes' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'FUNCTION',@level1name=N'FnEncriptaPassword'
GO
EXEC sys.sp_addextendedproperty @name=N'SqlAssemblyFile', @value=N'FnEncriptaPassword.cs' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'FUNCTION',@level1name=N'FnEncriptaPassword'
GO
EXEC sys.sp_addextendedproperty @name=N'SqlAssemblyFileLine', @value=15 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'FUNCTION',@level1name=N'FnEncriptaPassword'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Clave del comprador' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CmpCatComprador', @level2type=N'COLUMN',@level2name=N'ClaComprador'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Nombre del comprador' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CmpCatComprador', @level2type=N'COLUMN',@level2name=N'NomComprador'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indica si el comprador es de multiUbicacion' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CmpCatComprador', @level2type=N'COLUMN',@level2name=N'EsMultiUbicacion'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Clave del usuario asociado al comprador' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CmpCatComprador', @level2type=N'COLUMN',@level2name=N'ClaUsuario'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Indica cual ubicacion del comprador es la base. En teoria solo puede tener una ubicacion base' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CmpCatComprador', @level2type=N'COLUMN',@level2name=N'ClaUbicacionBase'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Cuena de correo electronico del comprador' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CmpCatComprador', @level2type=N'COLUMN',@level2name=N'Email'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Firma electronica del comprador' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CmpCatComprador', @level2type=N'COLUMN',@level2name=N'FirmaElectronica'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Borrado Logico' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CmpCatComprador', @level2type=N'COLUMN',@level2name=N'BajaLogica'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Fecha de borrado logico' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CmpCatComprador', @level2type=N'COLUMN',@level2name=N'FechaBajaLogica'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Ultimo usuario que hizo una modificacion' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CmpCatComprador', @level2type=N'COLUMN',@level2name=N'ClaUsuarioMod'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Fecha de ultima modificacion del registro' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CmpCatComprador', @level2type=N'COLUMN',@level2name=N'FechaUltimaMod'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_Description', @value=N'Nombre del equipo donde se hizo la ultima modificacion' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'TABLE',@level1name=N'CmpCatComprador', @level2type=N'COLUMN',@level2name=N'NombrePcMod'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "NomCatTrabajador"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 123
               Right = 222
            End
            DisplayFlags = 280
            TopColumn = 20
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'NomCatTrabajadorVw'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'NomCatTrabajadorVw'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "OInCatClasificacionArticuloABC"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 123
               Right = 256
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'OInCatClasificacionArticuloABCVw'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'OInCatClasificacionArticuloABCVw'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "OInCatClasificacionFrecuencia"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 123
               Right = 260
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'OInCatClasificacionFrecuenciaVw'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'OInCatClasificacionFrecuenciaVw'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "OInCatClasificacionSalida"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 123
               Right = 236
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'OInCatClasificacionSalidaVw'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'OInCatClasificacionSalidaVw'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "OInCatClasificacionValor"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 123
               Right = 232
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'OInCatClasificacionValorVw'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'OInCatClasificacionValorVw'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "TiTraUsuario_1"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 114
               Right = 235
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 33
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'TiCatUsuarioVw'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'TiCatUsuarioVw'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "TiTraUsuario"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 270
               Right = 244
            End
            DisplayFlags = 280
            TopColumn = 0
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'TiCatUsuarioVw2'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'TiCatUsuarioVw2'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "TiTraReferencia"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 123
               Right = 225
            End
            DisplayFlags = 280
            TopColumn = 5
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 1170
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'TiTraReferenciaVw'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'TiTraReferenciaVw'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPane1', @value=N'[0E232FF0-B466-11cf-A24F-00AA00A3EFFF, 1.00]
Begin DesignProperties = 
   Begin PaneConfigurations = 
      Begin PaneConfiguration = 0
         NumPanes = 4
         Configuration = "(H (1[40] 4[20] 2[20] 3) )"
      End
      Begin PaneConfiguration = 1
         NumPanes = 3
         Configuration = "(H (1 [50] 4 [25] 3))"
      End
      Begin PaneConfiguration = 2
         NumPanes = 3
         Configuration = "(H (1 [50] 2 [25] 3))"
      End
      Begin PaneConfiguration = 3
         NumPanes = 3
         Configuration = "(H (4 [30] 2 [40] 3))"
      End
      Begin PaneConfiguration = 4
         NumPanes = 2
         Configuration = "(H (1 [56] 3))"
      End
      Begin PaneConfiguration = 5
         NumPanes = 2
         Configuration = "(H (2 [66] 3))"
      End
      Begin PaneConfiguration = 6
         NumPanes = 2
         Configuration = "(H (4 [50] 3))"
      End
      Begin PaneConfiguration = 7
         NumPanes = 1
         Configuration = "(V (3))"
      End
      Begin PaneConfiguration = 8
         NumPanes = 3
         Configuration = "(H (1[56] 4[18] 2) )"
      End
      Begin PaneConfiguration = 9
         NumPanes = 2
         Configuration = "(H (1 [75] 4))"
      End
      Begin PaneConfiguration = 10
         NumPanes = 2
         Configuration = "(H (1[66] 2) )"
      End
      Begin PaneConfiguration = 11
         NumPanes = 2
         Configuration = "(H (4 [60] 2))"
      End
      Begin PaneConfiguration = 12
         NumPanes = 1
         Configuration = "(H (1) )"
      End
      Begin PaneConfiguration = 13
         NumPanes = 1
         Configuration = "(V (4))"
      End
      Begin PaneConfiguration = 14
         NumPanes = 1
         Configuration = "(V (2))"
      End
      ActivePaneConfig = 0
   End
   Begin DiagramPane = 
      Begin Origin = 
         Top = 0
         Left = 0
      End
      Begin Tables = 
         Begin Table = "VtaCatOrganizacion"
            Begin Extent = 
               Top = 6
               Left = 38
               Bottom = 306
               Right = 610
            End
            DisplayFlags = 280
            TopColumn = 4
         End
      End
   End
   Begin SQLPane = 
   End
   Begin DataPane = 
      Begin ParameterDefaults = ""
      End
      Begin ColumnWidths = 9
         Width = 284
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
         Width = 1500
      End
   End
   Begin CriteriaPane = 
      Begin ColumnWidths = 11
         Column = 1440
         Alias = 900
         Table = 2535
         Output = 720
         Append = 1400
         NewValue = 1170
         SortType = 1350
         SortOrder = 1410
         GroupBy = 1350
         Filter = 1350
         Or = 1350
         Or = 1350
         Or = 1350
      End
   End
End
' , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VtaCatAgenteVw'
GO
EXEC sys.sp_addextendedproperty @name=N'MS_DiagramPaneCount', @value=1 , @level0type=N'SCHEMA',@level0name=N'dbo', @level1type=N'VIEW',@level1name=N'VtaCatAgenteVw'
GO
