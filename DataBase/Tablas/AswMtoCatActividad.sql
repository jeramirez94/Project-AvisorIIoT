CREATE TABLE AswSch.AswMtoCatActividad (ClaUbicacion int
           ,ClaActividad int
           ,NomActividad varchar(250)
           ,ClaEquipo int
           ,ClaRcmFuncion int
           ,ClaRcmFuncionFalla int
           ,ClaRcmModoFalla int
           ,ClaTipoMantenimiento int
           ,ClaFrecuencia int
           ,ClaDisciplina int
           ,RequiereParoMaquina tinyint
           ,TiempoEstimado numeric(22,4)
           ,ClaFuncionPuesto int
           ,BajaLogica int
           ,FechaBajaLogica datetime
           ,FechaUltimaMod datetime
           ,NombrePcMod varchar(64)
           ,ClaUsuarioMod int
           ,EsActividadSeleccionada int
           ,ValPF numeric(22,2)
           ,Archivo varbinary(max)
           ,NombreArchivo varchar(100)
           ,ExtensionArchivo varchar(55)
           ,ActividadActual int
           ,EsMigracion int
           ,FechaUltimaOT datetime
           ,ClaNominaResponsable int
           ,ClaTrabajadorResponsable int
           ,EsMigracionModificado int
           ,EsDeRiesgo int
           ,EsAgrupadorMod int
           ,ClaEstatusActividad int
           ,Nvalor int
           ,ClaTurno int
           ,ClaFrecuenciaOriginal int
           ,EsCopiaGenerico int
           ,DisponibleGuia int
           ,ClaActividadGen int
           ,ClaTipoPlan int
           ,ValorOperacion int
           ,ValorAcumulado int
           ,NARefaccionMaterial int
           ,EsDocumentada int
           ,ClaActividadPadre int
           ,ReqCertificar tinyint
           ,EsGenericoPadre int
           ,FechaDescGen datetime
)


