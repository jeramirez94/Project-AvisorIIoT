CREATE TABLE [ASWSch].[AswSemanaAnio](
	[Anio] [int] NOT NULL,
	[MesAdm] [int] NOT NULL,
	[SemanaDelAnio] [tinyint] NOT NULL,
	[FechaInicioAdm] [datetime] NULL,
	[FechaFinAdm] [datetime] NULL,
 CONSTRAINT [pk_AswSemanaAnio] PRIMARY KEY CLUSTERED 
(
	[Anio] ASC,
	[MesAdm] ASC,
	[SemanaDelAnio] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

