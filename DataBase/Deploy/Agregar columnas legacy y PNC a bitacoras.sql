
ALTER TABLE [AswSch].[AswBitBitacoraParo]
ADD ClaPuntoMedicion VARCHAR(30) NULL

ALTER TABLE [AswSch].[AswBitBitacoraParo]
ADD Anio INT NULL



ALTER TABLE AswSch.AswBitBitacoraProduccion
ADD ClaPuntoMedicion VARCHAR(30) NULL
 
ALTER TABLE AswSch.AswBitBitacoraProduccion
ADD Anio INT NULL


ALTER TABLE AswSch.AswBitBitacoraProduccion
ADD EsPNC TINYINT DEFAULT(0)



ALTER TABLE AswSch.AswRecBitParos
ADD ClaPuntoMedicion VARCHAR(30) NULL

ALTER TABLE AswSch.AswRecBitParos
ADD Anio INT NULL



ALTER TABLE  AswSch.AswRecBitProduccion
ADD ClaPuntoMedicion VARCHAR(30) NULL

ALTER TABLE  AswSch.AswRecBitProduccion
ADD Anio INT NULL



ALTER TABLE AswSch.AswRecBitVariable
ADD ClaPuntoMedicion VARCHAR(30) NULL

ALTER TABLE AswSch.AswRecBitVariable
ADD Anio INT NULL


