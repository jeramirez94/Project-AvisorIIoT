CREATE TABLE [ASWSch].[ASWCatGpoParo](
	[ClaUbicacion] [int] NOT NULL,
	[ClaGpoParo] [int] NOT NULL,
	[NomGpoParo] [varchar](255) NOT NULL,
	[BajaLogica] [tinyint] NOT NULL,
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NOT NULL,
	[NombrePcMod] [varchar](64) NOT NULL,
	[ClaUsuarioMod] [int] NOT NULL,
 CONSTRAINT [PK_ASWCatGpoParo] PRIMARY KEY CLUSTERED 
(
	[ClaUbicacion] ASC,
	[ClaGpoParo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

ALTER TABLE [ASWSch].[ASWCatGpoParo] ADD  DEFAULT ((0)) FOR [BajaLogica]
GO

ALTER TABLE [ASWSch].[ASWCatGpoParo] ADD  DEFAULT (getdate()) FOR [FechaUltimaMod]
GO

ALTER TABLE [ASWSch].[ASWCatGpoParo] ADD  DEFAULT (host_name()) FOR [NombrePcMod]
GO

