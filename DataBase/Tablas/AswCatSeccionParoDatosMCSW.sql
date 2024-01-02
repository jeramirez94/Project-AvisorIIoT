USE [ASW]
GO

/****** Object:  Table [AswSch].[AswCatSeccionParoDatosMCSW]    Script Date: 11/11/2022 05:00:43 p. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [AswSch].[AswCatSeccionParoDatosMCSW](
	[ClaUbicacion] [int] NULL,
	[IdRelAlertaSeccionParo] [int] NULL,
	[ClaGpoParo] [int] NULL,
	[NomGpoParo] [varchar](255) NULL,
	[ClaTipoParo] [int] NULL,
	[IdTipoParoGpoParo] [int] NULL,
	[NomTipoParo] [varchar](255) NULL,
	[ClaSeccionParo] [int] NULL,
	[ClaveSeccion] [varchar](30) NULL,
	[NomSeccionParo] [varchar](255) NULL,
	[ClaAlerta] [int] NULL,
	[NomAlerta] [varchar](50) NULL,
	[ClaArea] [int] NULL,
	[ClaveArea] [varchar](30) NULL,
	[NomArea] [varchar](100) NULL,
	[ClaveDepartamento] [int] NULL,
	[NomDepartamento] [varchar](100) NULL,
	[EsParo] [int] NULL,
	[EsAlerta] [int] NULL,
	[ClaRubroParo] [int] NULL,
	[NomRubroParo] [varchar](255) NULL,
	[BajaLogica] [int] NULL,
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NULL,
	[ClaUsuarioMod] [int] NULL,
	[NombrePcMod] [nvarchar](128) NULL,
	[MinutosAvisoN1] [int] NULL,
	[MinutosAvisoN2] [int] NULL,
	[MinutosAvisoN3] [int] NULL,
	[MinutosAvisoN4] [int] NULL
) ON [PRIMARY]
GO


