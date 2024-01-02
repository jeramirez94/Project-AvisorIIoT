USE ASW;
GO

CREATE TABLE [ASWSch].[AswMtoCatRcmFuncion](
	[ClaUbicacion] [int] NOT NULL,
	[ClaEquipo] [int] NOT NULL,
	[ClaRcmFuncion] [int] NOT NULL,
	[NomRcmFuncion] [varchar](400) NOT NULL,
	[ClaSistema] [int] NULL,
	[FechaUltimaMod] [datetime] NOT NULL,
	[NombrePcMod] [varchar](64) NOT NULL,
	[ClaUsuarioMod] [int] NOT NULL,
	[ClaSubSistema] [int] NULL,
	[ClaveRcmFuncion] [int] NULL,
	[EsCopiaGenerico] [int] NOT NULL,
	[ClaTipoFuncion] [int] NULL,
	[ClaRcmFuncionPadre] [int] NULL,
	[BajaLogica] [int] NULL,
	[FechaBajaLogica] [datetime] NULL,
	[EsGenericoPadre] [int] NULL,
 CONSTRAINT [PK_AswMtoCatRcmFuncion] PRIMARY KEY CLUSTERED 
(
	[ClaUbicacion] ASC,
	[ClaEquipo] ASC,
	[ClaRcmFuncion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [UQ_MtoCatRcmFuncion_NomRcmFuncion] UNIQUE NONCLUSTERED 
(
	[ClaUbicacion] ASC,
	[ClaEquipo] ASC,
	[ClaSistema] ASC,
	[ClaSubSistema] ASC,
	[NomRcmFuncion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

