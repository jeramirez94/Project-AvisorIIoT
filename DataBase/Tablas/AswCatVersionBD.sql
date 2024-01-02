USE [ASW]
GO

/****** Object:  Table [AswSch].[AswCatGpio]    Script Date: 18/08/2022 11:04:12 a. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [AswSch].[AswCatVersionBD](
	[IdVersion] [int] IDENTITY(1,1) NOT NULL,
	[Version] [varchar](15) NOT NULL,
	[Major] [int] NOT NULL,
	[Minor] [int] NOT NULL,
	[MajorScript] varchar(max),
	[IncrementalScript] varchar(max),
	[RevertScript] varchar(max),
	[NotasVersion] varchar(500),
	[BajaLogica] [int] NULL,
	[FechaBajaLogica] [datetime] NULL,
	[ClaUsuarioMod] [int] NULL,
	[NombrePcMod] [varchar](64) NULL,
	[FechaUltimaMod] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[IdVersion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO


