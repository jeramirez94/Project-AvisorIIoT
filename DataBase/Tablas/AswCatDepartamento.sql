CREATE TABLE AswSch.AswCatDepartamento(ClaDepartamento int,ClaveDepartamento int,NomDepartamento varchar(50),NomDepartamentoIngles varchar(50),BajaLogica int)

/****** Object:  Index [UIDX_CatDepartamento]    Script Date: 24/08/2020 06:17:57 a. m. ******/
CREATE UNIQUE NONCLUSTERED INDEX [UIDX_CatDepartamento] ON [AswSch].[AswCatDepartamento]
(
	[ClaDepartamento] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO

