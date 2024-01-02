USE [ASW]
GO

/****** Object:  Table [FFCCSch].[FFCCCatConfiguracion]    Script Date: 21/02/2020 10:58:18 a. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [ASWSch].[ASWCfgConfiguracion](
	[ClaUbicacion] [int] NOT NULL,
	[ClaConfiguracion] [int] NOT NULL,
	[ClaveConfiguracion] [VARCHAR] (15) NULL,
	[DescConfiguracion] [varchar](250) NOT NULL,
    [DescConfiguracionES] VARCHAR (250) NULL,
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
	[Fecha2] [datetime] NULL,
	[Fecha3] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL,
	[NombrePcMod] [varchar](64) NOT NULL,
	[ClaUsuarioMod] [int] NOT NULL,
	[BajaLogica] [int] NOT NULL,
	[FechaBajaLogica] [datetime] NULL,
 CONSTRAINT [PK_FFCCCatConfiguracion] PRIMARY KEY CLUSTERED 
(
	[ClaUbicacion] ASC,
	[ClaConfiguracion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

