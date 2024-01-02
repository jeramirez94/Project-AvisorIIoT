
/*
* Vista para seleccionar un turno no compatible con los turnos regulares
*/
CREATE VIEW AswSch.AswCatTurnoExternoVw AS
	SELECT [ClaUbicacion]
		  ,[ClaTurno]
		  ,[NomTurno]
		  ,[Duracion]
		  ,CAST([HoraInicio] AS TIME) AS [HoraInicio]
		  ,CAST([HoraFin] AS TIME) AS [HoraFin]
		  ,[Orden]
		  ,[BajaLogica]
		  ,[FechaBajaLogica]
		  ,[FechaUltimaMod]
		  ,[NombrePcMod]
		  ,[ClaUsuarioMod]
	  FROM [AswSch].[AswPalCatTurno]
GO