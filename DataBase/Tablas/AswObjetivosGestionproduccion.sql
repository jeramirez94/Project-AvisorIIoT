CREATE TABLE [ASWSch].[AswObjetivosGestionproduccion](
	[ClaUbicacion] [int] NOT NULL,
	[Anio] [int] NOT NULL,
	[Mes] [int] NOT NULL,
	[ClaDepartamento] [int] NOT NULL,
	[ClaTipo] [int] NOT NULL,
	[EGE_Obj] [real] NOT NULL,
	[Eficiencia_Obj] [real] NULL,
	[Disponibilidad_Obj] [real] NULL,
	[Calidad_Obj] [real] NULL,
	[CumpJidokaAndonJust_Obj] [real] NOT NULL,
	[CumplimientoStdHxH_Obj] [real] NOT NULL,
	[PorcentajePNC_Obj] [real] NOT NULL,
	[CumplimientoAlProg_Obj] [real] NOT NULL,
	[CumpTiempoJidokaAndon_Obj] [real] NOT NULL,
	[ProductividadOperativa] [real] NOT NULL,
 CONSTRAINT [pk_AswObjetivosGestionproduccion] PRIMARY KEY CLUSTERED 
(
	[ClaUbicacion] ASC,
	[Anio] ASC,
	[Mes] ASC,
	[ClaDepartamento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO

