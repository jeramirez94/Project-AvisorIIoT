USE [ASWH]
GO

/****** Object:  Table [AswSch].[AswCatTablets]    Script Date: 16/01/2023 02:28:36 p. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [AswSch].[AswCatTablets](
	[IdTablet] [int] NOT NULL,
	[ClaUbicacion] [int] NULL,
	[IdCelda] [varchar](15) NULL,
	[DireccionIp] [varchar](15) NULL,
	[DireccionMac] [varchar](18) NULL,
	[Dispositivo] [varchar](25) NULL,
	[BajaLogica] [int] NULL,
	[FechaBajaLogica] [datetime] NULL,
	[ClaUsuarioMod] [int] NULL,
	[NombrePcMod] [varchar](64) NULL,
	[FechaUltimaMod] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdTablet] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [AswSch].[AswCatTablets] ADD  DEFAULT ('Raspberry') FOR [Dispositivo]
GO

ALTER TABLE [AswSch].[AswCatTablets] ADD  DEFAULT ((0)) FOR [BajaLogica]
GO


