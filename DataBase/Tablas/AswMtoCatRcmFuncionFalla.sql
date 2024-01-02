USE ASW;
GO

CREATE TABLE [AswSch].[AswMtoCatRcmFuncionFalla](
	[ClaUbicacion] [int] NOT NULL,
	[ClaEquipo] [int] NOT NULL,
	[ClaRcmFuncion] [int] NOT NULL,
	[ClaRcmFuncionFalla] [int] NOT NULL,
	[ClaveRcmFuncionFalla] [varchar](5) NOT NULL,
	[NomRcmFuncionFalla] [varchar](400) NOT NULL,
	[FechaUltimaMod] [datetime] NOT NULL,
	[NombrePcMod] [varchar](64) NOT NULL,
	[ClaUsuarioMod] [int] NOT NULL,
	[EsCopiaGenerico] [int] NOT NULL,
	[ClaRcmFuncionFPadre] [int] NULL,
	[BajaLogica] [int] NULL,
	[FechaBajaLogica] [datetime] NULL,
	[EsGenericoPadre] [int] NULL,
 CONSTRAINT [PK_MtoCatRcmFuncionFalla] PRIMARY KEY CLUSTERED 
	(
		[ClaUbicacion] ASC,
		[ClaEquipo] ASC,
		[ClaRcmFuncion] ASC,
		[ClaRcmFuncionFalla] ASC
	)
)
