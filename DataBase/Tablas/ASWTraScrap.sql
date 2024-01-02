USE [ASW]
GO

/****** Object:  Table [AswSch].[ASWTraScrap]    Script Date: 11/11/2022 06:09:34 p. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [AswSch].[ASWTraScrap](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdScrap] [int] NOT NULL,
	[IdProduccionCeldaTabletScrap] [int] NULL,
	[IdPo] [int] NOT NULL,
	[IdCelda] [varchar](30) NOT NULL,
	[ClaTurno] [int] NULL,
	[FechaAdmScada] [datetime] NULL,
	[Peso] [numeric](22, 4) NOT NULL,
	[ClaTipoScrapCelda] [int] NULL,
	[MotivoScrap] [varchar](500) NULL,
	[ClaScrapReason] [int] NULL,
	[ClaEventoReplica] [int] NULL,
	[Error] [int] NULL,
	[ErrorMsg] [varchar](500) NULL,
	[FechaBajaLogica] [datetime] NULL,
	[BajaLogica] [int] NULL,
	[ClaUsuarioMod] [int] NOT NULL,
	[NombrePCMod] [varchar](64) NOT NULL,
	[FechaUltimaMod] [datetime] NOT NULL,
	[EnvioCorreoSN] [int] NULL,
 CONSTRAINT [PK_ASWTraScrap] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [AswSch].[ASWTraScrap] ADD  CONSTRAINT [DF__ASWTraScr__BajaL__70FDBF69]  DEFAULT ((0)) FOR [BajaLogica]
GO

ALTER TABLE [AswSch].[ASWTraScrap] ADD  DEFAULT ((0)) FOR [EnvioCorreoSN]
GO


