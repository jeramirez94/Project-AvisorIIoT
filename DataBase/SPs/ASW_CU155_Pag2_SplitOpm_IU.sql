USE ASW
GO

CREATE proc [AswSch].[ASW_CU155_Pag2_SplitOpm_IU]
@pnClaubicacion int,
@pnIdMicroProg bigint,
@psIdWorkCenterDestino varchar(100),
@pnCantidadAProducir float,
@psComentarios varchar(8000) = null,
@pnClaUsuario int, 
@psNombrePc Varchar(250) = null,
	@psErrorKey VARCHAR(15) OUT,
    @psErrorMsg VARCHAR(500) OUT,
    @psIdioma VARCHAR(20)
as
BEGIN
	SET @psErrorKey = 'SUCCESS'
    SET @psErrorMsg = ''

	DECLARE @nCantidadOriginal FLOAT, @nNuevaCantidad FLOAT

	IF @pnClaUbicacion IS NULL OR @psIdWorkCenterDestino IS NULL
        BEGIN
            SELECT @psErrorMsg = Mensaje,
                   @psErrorKey = ErrorKey
            FROM [AswSch].[AswCatMensajeError]
            WHERE ErrorKey = 'INCORRECT_PARAMETERS'
                AND Idioma = @psIdioma;

            RETURN;
        END

	-- Validar cantidad nueva mayor que cantidad original

    SELECT @nCantidadOriginal = (cantidadprogramadauds - isnull(cantidadproducida,0) + isnull(cantidadPNC,0)),
               @nNuevaCantidad = (cantidadprogramadauds - isnull(cantidadproducida,0) + isnull(cantidadPNC,0)) - @pnCantidadAProducir -- RESTAR LO QUE QUEDÓ EN LA PARTE aProducir
        FROM ASWSch.AswTraMicroPrograma
        WHERE ClaUbicacion = @pnClaUbicacion
            AND idMicroProg = @pnIdMicroProg;

    IF @pnCantidadAProducir > @nCantidadOriginal
        BEGIN
            SELECT @psErrorMsg = Mensaje,
                   @psErrorKey = ErrorKey
            FROM [AswSch].[AswCatMensajeError]
            WHERE ErrorKey = 'NEW_QUANTITY_HIGHER'
                AND Idioma = @psIdioma;

            RETURN;
        END

    DEclare @MicroPrograma table (
        [ClaUbicacion] [int]  NULL,
	[idMicroProg] [bigint]   NULL,
	[ClaArea] [int]  NULL,
	[ClaveArea] [int]  NULL,
	[NomArea] [varchar](250) NULL,
	[claDepartamento] [int] NULL,
	[claveDepartamento] [int] NULL,
	[NomDepartamento] [varchar](250) NULL,
	[ClaGrupoMaquina] [int]  NULL,
	[ClaveGrupoMaquina] [int]  NULL,
	[NomGrupoMaquina] [varchar](250)  NULL,
	[IdWorkCenter] [varchar](100)  NULL,
	[ClaPeriodo] [int]  NULL,
	[Version] [int]  NULL,
	[ClaArticulo] [int]  NULL,
	[ClaveArticulo] [varchar](150)  NULL,
	[NomArticulo] [varchar](1000)  NULL,
	[ClaUnidad] [int]  NULL,
	[NomUnidad] [varchar](250)  NULL,
	[IdOpm] [int]  NULL,
	[NomOPM] [varchar](250) NULL,
	[CantidadProgramadaKgs] [float]  NULL,
	[CantidadProgramadaUds] [float]  NULL,
	[FechaInicioPlan] [datetime] NULL,
	[FechaPromesaOPM] [datetime]  NULL,
	[ClaEstatus] [tinyint]  NULL,
	[Comentarios] [varchar](8000) NULL,
	[ComentariosProduccion] [varchar](8000) NULL,
	[UnidadesPorPaquete] [float] NULL,
	[FechaInicioReal] [datetime] NULL,
	[FechaFinReal] [datetime] NULL,
	[CantidadProducida] [float] NULL,
	[CantidadPNC] [float] NULL,
	[Ege] [float] NULL,
	[CapacidadKgs] [float] NULL,
	[CapacidadUds] [float] NULL,
	[DuracionEge] [float] NULL,
	[FechaIns] [datetime] NULL,
	[FechaUltimaMod] [datetime] NULL,
	[ClaUsuarioMod] [int] NULL,
	[NombrePcMod] [varchar](250) NULL,
	[IdOpmOrigen] bigint null,
	[Accion] [int] null)
    
    insert into @MicroPrograma 
(claubicacion, idmicroprog, claarea,clavearea,nomarea, claDepartamento, claveDepartamento, ClaGrupoMaquina, ClaveGrupoMaquina, NomGrupoMaquina, IdWorkCenter, ClaPeriodo, Version, ClaArticulo, ClaveArticulo, NomArticulo, ClaUnidad, NomUnidad, idopm, nomOpm,
 CantidadProgramadaKgs, CantidadProgramadaUds, FechaInicioPlan, FechaPromesaOPM, ClaEstatus, comentarios, ComentariosProduccion, UnidadesPorPaquete, FechaInicioReal, FechaFinReal, CantidadProducida, CantidadPNC, Ege, CapacidadKgs,CapacidadUds, DuracionEge,
 FechaIns, FechaUltimaMod, ClaUsuarioMod, NombrePcMod, IdOpmOrigen, Accion)
 select claubicacion, 
		idmicroprog, 
		claarea,
		clavearea,
		nomarea, 
		claDepartamento, 
		claveDepartamento, 
		ClaGrupoMaquina, 
		ClaveGrupoMaquina, 
		NomGrupoMaquina, 
		IdWorkCenter, 
		ClaPeriodo, 
		Version, 
		ClaArticulo, 
		ClaveArticulo, 
		NomArticulo, 
		ClaUnidad, 
		NomUnidad, 
		idopm, 
		nomOpm,
		CantidadProgramadaKgs , 
		cantidadprogramadauds , 
		FechaInicioPlan, 
		FechaPromesaOPM, 
		ClaEstatus,  --- Al realizar el update esta debe cancelarse pasar a estatus 3
		comentarios, 
		ComentariosProduccion, 
		UnidadesPorPaquete, 
		FechaInicioReal, 
		FechaFinReal, 
		CantidadProducida, 
		CantidadPNC, 
		Ege, 
		CapacidadKgs,
		CapacidadUds, 
		DuracionEge,
		FechaIns, 
		getdatE(), 
		@pnClaUsuario, 
		@psNombrePc, 
		null, 
		1 --- Update
 from ASWSch.AswTraMicroPrograma
 where	ClaUbicacion =  @pnClaubicacion
 and	idMicroProg =  @pnIdMicroProg

 -- Agregar la partida de la misma idworkcenter 
 IF @nNuevaCantidad >= 1
        BEGIN
 insert into @MicroPrograma 
(claubicacion, idmicroprog, claarea,clavearea,nomarea, claDepartamento, claveDepartamento, ClaGrupoMaquina, ClaveGrupoMaquina, NomGrupoMaquina, IdWorkCenter, ClaPeriodo, Version, ClaArticulo, ClaveArticulo, NomArticulo, ClaUnidad, NomUnidad, idopm, nomOpm,
 CantidadProgramadaKgs, CantidadProgramadaUds, FechaInicioPlan, FechaPromesaOPM, ClaEstatus, comentarios, ComentariosProduccion, UnidadesPorPaquete, FechaInicioReal, FechaFinReal, CantidadProducida, CantidadPNC, Ege, CapacidadKgs,CapacidadUds, DuracionEge,
 FechaIns, FechaUltimaMod, ClaUsuarioMod, NombrePcMod, IdOpmOrigen, Accion)
 select claubicacion, 
		null, --- Se generará uno nuevo
		claarea,
		clavearea,
		nomarea, 
		claDepartamento, 
		claveDepartamento, 
		ClaGrupoMaquina, 
		ClaveGrupoMaquina, 
		NomGrupoMaquina, 
		IdWorkCenter, 
		ClaPeriodo, 
		Version + 1,  -----incrementa en uno la version
		ClaArticulo, 
		ClaveArticulo, 
		NomArticulo, 
		ClaUnidad, 
		NomUnidad, 
		idopm, 
		nomOpm,
		(cantidadprogramadauds - isnull(cantidadproducida,0) + isnull(cantidadPNC,0) - @pnCantidadAProducir ) * AswSch.ASWGetPesoTeoricoArticulo(1, claarticulo) ,  ----  Nueva cantidad a producir
		cantidadprogramadauds - isnull(cantidadproducida,0) + isnull(cantidadPNC,0) - @pnCantidadAProducir , ---- Nueva cantidad a producir
		Convert(varchar(8), getdate(),112) ,  -- Fecha inicio plan, es cuando se realiza el movimiento
		FechaPromesaOPM, 
		ClaEstatus,  -- Se conserva el estatus de la original
		isnull(@psComentarios ,'') + ' Orig: ' + convert(varchar(100),@pnIdMicroProg), 
		ComentariosProduccion, 
		UnidadesPorPaquete, 
		FechaInicioReal, 
		FechaFinReal, 
		CantidadProducida, 
		CantidadPNC, 
		Ege, 
		CapacidadKgs,
		CapacidadUds, 
		DuracionEge,
		getdate(), 
		getdate(), 
		@pnClaUsuario, 
		@psNombrePc, 
		@pnIdMicroProg, --- Link del origen 
		2 -- Insert
 from @MicroPrograma 
 where	ClaUbicacion =  @pnClaubicacion
 and	idMicroProg =  @pnIdMicroProg;
 END

 -- Agregar la partida a la idworkcenter destino
  insert into @MicroPrograma 
(claubicacion, idmicroprog, claarea,clavearea,nomarea, claDepartamento, claveDepartamento, ClaGrupoMaquina, ClaveGrupoMaquina, NomGrupoMaquina, IdWorkCenter, ClaPeriodo, Version, ClaArticulo, ClaveArticulo, NomArticulo, ClaUnidad, NomUnidad, idopm, nomOpm,
 CantidadProgramadaKgs, CantidadProgramadaUds, FechaInicioPlan, FechaPromesaOPM, ClaEstatus, comentarios, ComentariosProduccion, UnidadesPorPaquete, FechaInicioReal, FechaFinReal, CantidadProducida, CantidadPNC, Ege, CapacidadKgs,CapacidadUds, DuracionEge,
 FechaIns, FechaUltimaMod, ClaUsuarioMod, NombrePcMod, IdOpmOrigen, Accion)
 select claubicacion, 
		null, --- Se generará uno nuevo
		AswSch.ASWGetAreaProduccionMaquina(@pnClaubicacion,@psIdWorkCenterDestino,1),
		AswSch.ASWGetAreaProduccionMaquina(@pnClaubicacion,@psIdWorkCenterDestino,2),
		AswSch.ASWGetAreaProduccionMaquina(@pnClaubicacion,@psIdWorkCenterDestino,3),
		AswSch.ASWGetDptoMaquina(@pnClaubicacion,@psIdWorkCenterDestino,1),
		AswSch.ASWGetDptoMaquina(@pnClaubicacion,@psIdWorkCenterDestino,2),
		AswSch.ASWGetGpoMaquinaMaquina(@pnClaubicacion,@psIdWorkCenterDestino,1),
		AswSch.ASWGetGpoMaquinaMaquina(@pnClaubicacion,@psIdWorkCenterDestino,2),
		AswSch.ASWGetGpoMaquinaMaquina(@pnClaubicacion,@psIdWorkCenterDestino,3),
		@psIdWorkCenterDestino, --- IdWorkCenter Destino
		ClaPeriodo, 
		Version + 1,  -----incrementa en uno la version
		ClaArticulo, 
		ClaveArticulo, 
		NomArticulo, 
		ClaUnidad, 
		NomUnidad, 
		idopm, 
		nomOpm,
		 @pnCantidadAProducir  * AswSch.ASWGetPesoTeoricoArticulo(1, claarticulo) ,  ----  Nueva cantidad a producir
		@pnCantidadAProducir , ---- Nueva cantidad a producir
		Convert(varchar(8), getdate(),112) ,  -- Fecha inicio plan, es cuando se realiza el movimiento
		FechaPromesaOPM, 
		1,  -- Nace programada
		isnull(@psComentarios ,'') + ' Orig: ' + convert(varchar(100),@pnIdMicroProg), 
		ComentariosProduccion, 
		null, 
		null, 
		null, 
		null, 
		null, 
		null, 
		null,
		null, 
		null,
		getdate(), 
		getdate(), 
		@pnClaUsuario, 
		@psNombrePc, 
		@pnIdMicroProg, --- Link del origen 
		2 -- insert
 from @MicroPrograma 
 where	ClaUbicacion =  @pnClaubicacion
 and	idMicroProg =  @pnIdMicroProg;

    -- EL BLOQUE NUEVO LILLY
    BEGIN TRY
        BEGIN TRANSACTION; -- EMPEZAMOS

        -- INSERTAMOS
        INSERT INTO ASWSch.AswTraMicroPrograma (
            claubicacion, 
        --idmicroprog, 
        claarea, 
        clavearea, 
        nomarea, 
        claDepartamento, 
        claveDepartamento, 
        ClaGrupoMaquina, 
        ClaveGrupoMaquina, 
        NomGrupoMaquina, 
        IdWorkCenter, 
        ClaPeriodo, 
        Version, 
        ClaArticulo, 
        ClaveArticulo, 
        NomArticulo, 
        ClaUnidad, 
        NomUnidad, 
        idopm, 
        nomOpm,

        CantidadProgramadaKgs, 
        CantidadProgramadaUds, 
        FechaInicioPlan, 
        FechaPromesaOPM, 
        ClaEstatus, 
        comentarios, 
        ComentariosProduccion, 
        UnidadesPorPaquete, 
        FechaInicioReal, 
        FechaFinReal, 
        CantidadProducida, 
        CantidadPNC, 
        Ege, 
        CapacidadKgs, 
        CapacidadUds, 
        DuracionEge,

        FechaIns, 
        FechaUltimaMod, 
        ClaUsuarioMod, 
        NombrePcMod,
        idMicroProgOrigen --, 
        -- Accion
        )
        SELECT
            claubicacion, 
        -- idmicroprog, 
        claarea, 
        clavearea, 
        nomarea, 
        claDepartamento, 
        claveDepartamento,
        ClaGrupoMaquina, 
        ClaveGrupoMaquina, 
        NomGrupoMaquina, 
        IdWorkCenter, 
        ClaPeriodo, 
        Version, 
        ClaArticulo, 
        ClaveArticulo, 
        NomArticulo, 
        ClaUnidad, 
        NomUnidad, 
        idopm, 
        nomOpm,

        CantidadProgramadaKgs, 
        CantidadProgramadaUds, 
        FechaInicioPlan, 
        FechaPromesaOPM, 
        ClaEstatus, 
        comentarios, 
        ComentariosProduccion, 
        UnidadesPorPaquete, 
        FechaInicioReal, 
        FechaFinReal, 
        CantidadProducida, 
        CantidadPNC, 
        Ege, 
        CapacidadKgs, 
        CapacidadUds, 
        DuracionEge,

        FechaIns, 
        FechaUltimaMod, 
        ClaUsuarioMod, 
        NombrePcMod, 
        IdOpmOrigen --, 
        -- Accion
        FROM @MicroPrograma
        WHERE Accion = 2; -- Insert

        -- HACEMOS EL UPDATE
        UPDATE ASWSch.AswTraMicroPrograma
        SET
            claubicacion = M.claubicacion,
        claarea = M.claarea,
        clavearea = M.clavearea,
        nomarea = M.nomarea,
        claDepartamento = M.claDepartamento,
        claveDepartamento = M.claveDepartamento,
        ClaGrupoMaquina = M.ClaGrupoMaquina,
        ClaveGrupoMaquina = M.ClaveGrupoMaquina,
        NomGrupoMaquina = M.NomGrupoMaquina,
        IdWorkCenter = M.IdWorkCenter,
        ClaPeriodo = M.ClaPeriodo,
        Version = M.Version,
        ClaArticulo = M.ClaArticulo,
        ClaveArticulo = M.ClaveArticulo,
        NomArticulo = M.NomArticulo,
        ClaUnidad = M.ClaUnidad,
        NomUnidad = M.NomUnidad,
        idopm = M.idopm,
        nomOpm = M.nomOpm,
        CantidadProgramadaKgs = M.CantidadProgramadaKgs,
        CantidadProgramadaUds = M.CantidadProgramadaUds,
        FechaInicioPlan = M.FechaInicioPlan,
        FechaPromesaOPM = M.FechaPromesaOPM,
        ClaEstatus = 3,
        comentarios = M.comentarios,
        ComentariosProduccion = M.ComentariosProduccion,
        UnidadesPorPaquete = M.UnidadesPorPaquete,
        FechaInicioReal = M.FechaInicioReal,
        FechaFinReal = M.FechaFinReal,
        CantidadProducida = M.CantidadProducida,
        CantidadPNC = M.CantidadPNC,
        Ege = M.Ege,
        CapacidadKgs = M.CapacidadKgs,
        CapacidadUds = M.CapacidadUds,
        DuracionEge = M.DuracionEge,
        FechaUltimaMod = GETDATE(),
        ClaUsuarioMod = @pnClaUsuario,
        NombrePcMod = @psNombrePc
        FROM @MicroPrograma M
        WHERE ASWSch.AswTraMicroPrograma.claubicacion = M.claubicacion
            AND ASWSch.AswTraMicroPrograma.idmicroprog = M.idmicroprog
            AND M.Accion = 1; -- Update

        -- UN COMMIT Y SI SE REALIZÓ CORRECTO SALE LO SIGUIENTE
        COMMIT;
        -- PRINT 'Transacción confirmada.';
		
    END TRY -- TERMINA TRY
    BEGIN CATCH
        -- SI SALE ERROR SE HACE ROLLBACK DE LA TRANSACCIÓN
        ROLLBACK;

		SELECT @psErrorMsg = ERROR_MESSAGE(),
               @psErrorKey = 'ERROR';
        -- PRINT 'Transacción deshecha debido a un error.';
    END CATCH;
END;
GO

