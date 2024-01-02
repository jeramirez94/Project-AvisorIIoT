USE ASW
GO
--DROP TABLE AswSch.AswBitBitacoraProduccion 
CREATE TABLE AswSch.AswBitBitacoraProduccion(
	Id 	int IDENTITY(1,1) PRIMARY KEY ,
	ClaUbicacion INT,
	ClaPuntoMedicion VARCHAR(30) NULL,
	Anio INT NULL,
    IdBitProduccion   INTEGER,
	IdMultiplo		  INT NOT NULL DEFAULT(1),
    IdCelda           VARCHAR(30) NOT NULL,
    IdComponente      VARCHAR(30) NOT NULL,
    IdPO              INT,
    IdCaja            INT,
    ClaArticulo       INT,
    ClaveCorte        VARCHAR (15),
    FechaHoraInicio   DATETIME,
    FechaHoraFin      DATETIME,
    DuracionSegundos  NUMERIC (8, 2),
    ClavosInicio      INT,
    ClavosFin         INT,
    CajasInicio       INT,
    CajasFin          INT,
	EsPNC			  TINYINT DEFAULT(0),
	EsManual		  TINYINT DEFAULT(0),
    CajasXHora        NUMERIC (8, 2),
	Multiplo		  INT,
    ClaTurno          INT,
    FechaAdm          DATETIME,
    Hora              INT,
    ClaEstatusReplica INT,
    BajaLogica        INT  DEFAULT 0,
    FechaBajaLogica   DATETIME,
    ClaUsuarioMod     INT,
    NombrePCMod       VARCHAR (64),
    FechaUltimaMod    DATETIME
)ON [Bitacora];

CREATE NONCLUSTERED INDEX Idx_ClaUbicacion_IdCelda_IdComponente_IdBitProduccion ON [AswSch].[AswBitBitacoraProduccion](ClaUbicacion,IdCelda,IdComponente,IdBitProduccion)
GO