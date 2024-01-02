USE [ASW]
GO

/****** Object:  Table [PaiSch].[PAIRelAlertaTipoSeguimientoAlerta]    Script Date: 04/10/2020 10:05:18 p. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [AswSch].[AswRelAlertaTipoSeguimientoAlerta](
	[ClaUbicacion] [int] NOT NULL,
	[ClaSistema] [int] NOT NULL,
	[ClaAlerta] [int] NOT NULL,
	[ClaTipoSeguimientoAlerta] [int] NOT NULL,
	[BajaLogica] [int] NOT NULL DEFAULT ((0)),
	[FechaBajaLogica] [datetime] NULL,
	[ClaUsuarioMod] [int] NOT NULL,
	[FechaUltimaMod] [datetime] NOT NULL DEFAULT (getdate()),
	[NombrePcMod] [varchar](64) NOT NULL DEFAULT (host_name()),
 CONSTRAINT [PK_AlertaTipoSeguimientoAlerta] PRIMARY KEY CLUSTERED 
(
	[ClaUbicacion] ASC,
	[ClaSistema] ASC,
	[ClaAlerta] ASC,
	[ClaTipoSeguimientoAlerta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO


