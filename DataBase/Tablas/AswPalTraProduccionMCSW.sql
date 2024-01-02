CREATE TABLE ASWSch.AswPalTraProduccionMCSW(
	     IdProduccion int
		,ClaUbicacion int
		,Fecha datetime
		,ClaDepartamento int
		,ClaArea int
		,ClaTurno int
		,ClaMaquina int
		,NumLinInst int
		,Multiplo int
		,HrsProgramadas numeric(19, 5)
		,Duracion numeric(19, 5)
		,DuracionComida numeric(19, 5)
		,CantidadKgs numeric(19, 5)
		,CantidadUnidades numeric(19, 5)
		,NumAtoron numeric(19, 5)
		,NumReventon numeric(19, 5)
		,CantidadHrsParo numeric(19, 5)
		,CantidadHrsParoNumLin numeric(19, 5)
		,CantidadHrsParoEficiencia numeric(19, 5)
		,CantidadHrsParoAprovechamiento numeric(19, 5)
		,CantidadHrsParoProgramado numeric(19, 5)
		,CantidadHrsParoEficienciaHabil numeric(19, 5)
		,CantidadHrsParoAprovechamientoHabil numeric(19, 5)
		,CantidadHrsParoProgramadoHabil numeric(19, 5)
		,ClaTipoReporteProd int
		,ClaGpoMaquina int
		,EsCerrado int
		,EsHabil int
		,EsTurnoDisponible numeric(19, 5)
		,EsTurnoDisponibleEfic numeric(19, 5)
		,Eficiencia numeric(19, 5)
		,Eficiencia2 numeric(19, 5)
		,EficienciaLT2 numeric(19, 5)
		,Aprovechamiento numeric(19, 5)
		,Aprovechamiento2 numeric(19, 5)
		,HrsBajaVelocidad numeric(19, 5)
		,PorcPerdidaVelocidad numeric(19, 5)
		,Disponibilidad numeric(19, 5)
		,EficienciaEGE numeric(19, 5)
		,Calidad numeric(19, 5)
		,OEE numeric(19, 5)
		,EstatusCapturaA1 numeric(19, 5)
		,CantidadPNCKgs numeric(19, 5)
		,Nails_min numeric(19, 5)
		,Nails_minPosibles numeric(19, 5)
		,TotalHrsTurno numeric(19, 5)
		,BajaLogica int
		,FechaBajaLogica datetime
		,FechaUltimaMod datetime
		,NombrePcMod varchar(100)
		,ClaUsuarioMod int
)