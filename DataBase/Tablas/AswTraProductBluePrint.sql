USE ASW
GO

CREATE TABLE ASWSch.AswTraProductBluePrint(
	idBluePrint INT PRIMARY KEY,
	ClaArticulo INT,
	Descripcion VARCHAR(250),
	NombreArchivo VARCHAR(50),
	FechaIns DATETIME,
	BajaLogica INT DEFAULT 0,
	FechaBajaLogica DATETIME,
	ClaUsuarioMod INT,
	NombrePcMod VARCHAR(64),
	FechaUltimaMod DATETIME
)

