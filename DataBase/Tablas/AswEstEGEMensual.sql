USE ASW
GO

CREATE TABLE [AswSch].[AswEstEGEMensual](
	[Id] [int] Primary KEY,
	[ClaUbicacion] [int] NULL,
	[ClaveUbicacion] [varchar](50) NULL,
	[Anio] [int] NULL,
	[Mes] [int] NULL,
	[ClaDepartamento] [int] NULL,
	[ClaveDepartamento] [varchar](50) NULL,
	[ClaArea] [int] NULL,
	[ClaveArea] [varchar](50) NULL,
	[ClaMaquina] [int] NULL,
	[ClaveMaquina] [varchar](50) NULL,
	[Nivel] [int] NULL,
	[Efficiencty] [numeric](8, 2) NULL,
	[Availability] [numeric](8, 2) NULL,
	[Utilization] [numeric](8, 2) NULL,
	[Quality] [numeric](8, 2) NULL,
	[OEE] [numeric](8, 2) NULL,
	[BajaLogica] [tinyint] NULL,
	[FechaBajaLogica] [datetime] NULL,
	[FechaUltimaMod] [datetime] NULL,
	[NombrePcMod] [varchar](64) NULL,
	[ClaUsuarioMod] [int] NULL
)

