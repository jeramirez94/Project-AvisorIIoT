CREATE TABLE AswSch.AswTraMateriaPrima(
	Id INT PRIMARY KEY IDENTITY,
	IdBarcode INT,
	IdPO INT,
	IdCelda INT,
	Barcode VARCHAR(50),
	Codigo VARCHAR(50),
	Referencia VARCHAR(30),
	NomAlambre VARCHAR(270),
	NomProvedor VARCHAR(100),
	Colada VARCHAR(50),
	PesoInicial NUMERIC(22, 4),
	PesoFinal NUMERIC(22, 4),
	Peso NUMERIC(22, 4),
	EsEnUso INT,
	EsConsumido INT,
	EsRemovido INT,
	ClaEventoAdd INT,--control para interfaz con MCSW (1 capturado ASW, 2 Capturado MCSW)
	ClaEventoUse INT,--control para interfaz con MCSW (1 capturado ASW, 2 Capturado MCSW)
	ClaEventoConsume INT,--control para interfaz con MCSW (1 capturado ASW, 2 Capturado MCSW)
	ClaEventoRemove INT,--control para interfaz con MCSW (1 capturado ASW, 2 Capturado MCSW)
	ClaEstatusReplica INT,--control para interfaz con MCSW (1 cambio, 2 replicado)
	ClaEstatusMCSW INT,--errores y mensajes de MCSW
	NomEstatusMCSW VARCHAR(500),--errores y mensajes de MCSW
	BajaLogica INT DEFAULT(0),
	FechaBajaLogica DATETIME,
	FechaUltimaMod DATETIME DEFAULT(GETDATE()),
	NombrePcMod VARCHAR(64),
	ClaUsuarioMod INT
)
GO

/****** Object:  Index [Idx-IdPO-Barcode]    Script Date: 01/07/2020 01:04:36 p. m. ******/
CREATE UNIQUE NONCLUSTERED INDEX [Idx-IdPO-Barcode] ON [AswSch].[AswTraMateriaPrima]
(
	[IdPO] ASC,
	[IdBarcode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO

