USE [sincroniza]
GO
/****** Object:  User [transfer]    Script Date: 26/08/2020 10:18:32 a. m. ******/
CREATE USER [transfer] FOR LOGIN [transfer] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_datareader] ADD MEMBER [transfer]
GO
/****** Object:  StoredProcedure [dbo].[sp_transferir]    Script Date: 26/08/2020 10:18:33 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE proc [dbo].[sp_transferir] 
	@grupo  varchar(30), 
	@sub_grupo varchar(30), 
	@server_origen  varchar(2000) = '' ,  
	@fecha_ini datetime = NULL ,  
	@tabla varchar(100) = '', 
	@show int = 0 , 
	@bitacora int = 1, 
	@dias_bitacora int = 31, 
	@Test int = 0, 
	@FechaMinima datetime = null, 
	@BlobFields int = 0,
	@CambiarFecha int = null
as
BEGIN

	Set ansi_nulls on
	Set ansi_warnings on
	set NOCOUNT ON
	set textsize 1000000

	declare @Origen_manual	int,		@multi_tabla	int,		@Num_server	int,
		@l		int,		@lo		int,		@aux		varchar(2000),	
		@p		int,
		@num_tabla	int,		@com		char(1),	@com2		char(1),
		@par1 	varchar(8000),		@cpos_key_ab	varchar(500),	@campos_destino	varchar(8000), @campos_tabla_gato	varchar(8000),
		@cpo		int, 		@par 		varchar(255),	@npar		int,	 
		@ncpos		int,		@campos_origen	varchar(8000),	@campos_upd	varchar(8000), @campos_select	varchar(8000),	
		@st		int,		@ix 		int,		@len1		int,
		@tabla_origen	varchar(100),	@tabla_b	varchar(100),	@tabla_c	varchar(100),	
		@tabla_d	varchar(100),	@tabla_e	varchar(100),	@tablas_adic	varchar(255),
		@where_adic	varchar(255),	@tabla_destino	varchar(100),	@activo		int,
		@db_origen	varchar(30),	@owner_origen	varchar(30),	@ocupado	int,
		@server_destino	varchar(30),	@db_destino	varchar(30),	@owner_destino	varchar(30),
		@fecha		datetime,	@leidos		int,		@updates	int,
		@inserts	int,		@fallos		int,		@campo_origen	varchar(8000),
		@es_key		int,		@existen	int,		@usar_fuc	int,
		@campo_destino	varchar(8000),	@fecha_text	varchar(20),	@error		int,
		@campo_select	varchar(8000),	
		@cmd 		varchar(8000),	@p1		varchar(8000),	@p2		varchar(8000),
		@p3		varchar(8000),	@p4		varchar(8000),	@p5		varchar(8000),
		@p6		varchar(8000),	@p7		varchar(8000),	@p8		varchar(8000),
		@p9		varchar(8000),	@p10		varchar(8000),	@p11		varchar(8000),
		@f1		datetime,	@f2		datetime,	@f3		datetime,
		@f4		datetime,	@f5		datetime,	@f6		datetime,
		@f0		datetime,	@f9		datetime,	@fecha_new	datetime,
		@word 		varchar(30), 	@nword 		varchar(30), 	@where_adic_paso varchar(255),
		@tiempo_seg_tot		int,	@tiempo_seg_leer	int,	@tiempo_seg_act		int,
		@campos_create	varchar(8000),	@es_null		int,	@tipo		varchar(20),
		@tabla_gato	varchar(40),	@fec_null	varchar(8),
		@val_default 	varchar(500),	@tabla_abcde	char(1),	@transferir	int,
		@sp_destino	varchar(60),	@sp_origen	varchar(60),	@ins_upd_1x1	int,		
		@fec_minima	datetime
 

	declare @Max_Usar_fuc	int,
		@Variable_fuc varchar(30),
		@CambiarGetdate	int

	create table #Variables_fuc ( Id int, Variable_fuc varchar(30), CambiarGetdate int ,BuscarVariable int , ValidoParaBusca int)
	select	@Max_Usar_fuc = 21 , @Variable_fuc = ''
	insert  into #Variables_fuc select 1 , 'Fecha_Ultimo_Cambio'	, 1 , 0 , 1
	insert  into #Variables_fuc select 2 , 'FechaUltimaMod' 		, 1 , 1 , 1
	insert  into #Variables_fuc select 3 , 'Fuc' 					, 1 , 1 , 1
	insert  into #Variables_fuc select 4 , 'Fecha_actualiza' 		, 1 , 1 , 1
	insert  into #Variables_fuc select 5 , 'fecha_ult_mod' 			, 1 , 1 , 1
	insert  into #Variables_fuc select 6 , 'fecha_ult_cons' 		, 1 , 1 , 1
	insert  into #Variables_fuc select 20 , 'FechaUltimoCambio' 		, 1 , 1 , 1
	insert  into #Variables_fuc select 21 , 'Fecha'		 		, 1 , 1 , 1

	select @fec_null = '19900101'

	select 	@Origen_manual 	= 0,	@multi_tabla  	= 0,	@num_tabla 	= 0 
	select 	@com = char(39),	@com2	= char(39)


	select @Origen_manual = 0
	create table #servers ( server_origen varchar(30),  db varchar(30), owner varchar(30), server int identity)


	if 	@server_origen 	!= '' 		
	begin
		if @Show = 1	select 'Calculo servidores manuales',@server_origen

		select @Origen_manual = 1
		select  @Aux = @server_origen + ','
		select @l = patindex('%,%',@aux)
		while @l > 0
		begin
			if ltrim(rtrim(substring(@aux,1,@l-1))) != ''
			begin
				select 	@server_origen 	= ltrim(rtrim(substring(@aux,1,@l-1))),
					@db_origen	= '',
					@owner_origen	= ''

				select @p = patindex('%.%',@server_origen)
				if @p > 0 	
				begin
					select @lo = len(@server_origen)
					if @lo > @p
						select 	@db_origen 	= ltrim(rtrim(substring(@server_origen,@p+1,@lo-@p)))
					select	@server_origen	= ltrim(rtrim(substring(@server_origen,1,@p-1)))
				end
				select @p = patindex('%.%', @db_origen )
				if @p > 0 	
				begin
					select @lo = len(@db_origen)
					if @lo > @p
						select 	@owner_origen 	= ltrim(rtrim(substring( @db_origen ,@p+1,@lo-@p)))
					select	@db_origen	= ltrim(rtrim(substring( @db_origen ,1,@p-1)))
				end
				insert into #servers select @server_origen , @db_origen , @owner_origen
			end

			select @lo = len(@aux)
			if @lo > @l 	
				select @Aux = substring(@aux,@l+1, @lo-@l)
			else
				select @Aux = ''

			select @l = patindex('%,%',@aux)
		end
if @show = 1 select * from #servers order by server
	end

	if 	@tabla		= '' 		select @multi_tabla  = 1

	create table #fecha ( fecha datetime )
	if @show = 1	select 'INICIO CICLO DE SERVIDORES', @Origen_manual
	select @Num_server = 0



ciclo_server:

	if 	@Origen_manual = 0
	begin
		select 	@server_origen = min(server_origen)
		from	sincroniza.dbo.transfer_grupos	
		where	grupo		= @grupo
		and	sub_grupo	= @sub_grupo
		and	server_origen	> @server_origen
	
		if isnull(@server_origen,'') = '' 		goto ciclo_server_fin
	end
	else
	begin
		select 	@num_server = min(server) 
		from	#servers
		where	server > @Num_server

	
		if isnull(@num_server,0) <= 0 		goto ciclo_server_fin

		select 	@server_origen = server_origen 
		from	#servers
		where	server = @Num_server

	end


	select 	@db_origen	= ''

	if @Origen_manual = 1
		select 	@db_origen		= isnull(db_origen,''),
				@owner_origen	= isnull(owner_origen,''),
				@server_destino	= isnull(server_destino,''),
				@db_destino		= isnull(db_destino,''),
				@owner_destino	= isnull(owner_destino,'')
		from	sincroniza.dbo.transfer_grupos	
		where	grupo		= @grupo
		and	sub_grupo		= @sub_grupo
	else
		select 	@db_origen		= isnull(db_origen,''),
				@owner_origen	= isnull(owner_origen,''),
				@server_destino	= isnull(server_destino,''),
				@db_destino		= isnull(db_destino,''),
				@owner_destino	= isnull(owner_destino,'')
		from	sincroniza.dbo.transfer_grupos	
		where	grupo			= @grupo
		and		sub_grupo		= @sub_grupo
		and		server_origen	= @server_origen


	if @server_destino != @@servername
		goto  ciclo_server_fin


	if @Origen_manual = 1
	begin
		select 	@db_origen    = ltrim(rtrim(db   )) 
		from 	#servers 
		where 	server = @Num_server	and 	ltrim(rtrim(isnull(db,''))) != ''

		select 	@owner_origen = ltrim(rtrim(owner)) 
		from 	#servers 
		where 	server = @Num_server	and 	ltrim(rtrim(isnull(owner,''))) != ''

		if @show = 1 	select @server_origen, @db_origen, @tabla, @multi_tabla
	end

	if 	isnull(@db_origen,'') = '' 			goto ciclo_server
	if 	@multi_tabla	= 1					select @tabla = '' 
	select	@num_tabla = 0 


    if @show = 1 	select @server_origen, @db_origen, @tabla, @multi_tabla

	-- obtengo las fecha para actualizacion del origen
	select @fecha_new = getdate()
	delete  #fecha


	if ltrim(rtrim(@server_origen))= @@SERVERNAME
		select @cmd 	=  'master.dbo.sp_utilerias_getfecha'
	else
		select @cmd 	=  ltrim(rtrim(@server_origen)) + '.master.dbo.sp_utilerias_getfecha'

	insert into #fecha 
		exec @cmd

    if @show = 1 	select getdate(), * from #fecha


	if not exists ( select 1 from #fecha where fecha > dateadd(dd,-5,getdate()) )
		goto error

	select @fecha_new = fecha from #fecha


ciclo_tabla:
	select 	@f0 = getdate()
	select 	@num_tabla = @num_tabla + 1
	
	if @show = 1 select @multi_tabla, @num_tabla
	if 	@multi_tabla != 1 and @num_tabla > 1 		goto ciclo_tabla_fin
	if 	@multi_tabla = 1	
	begin
		select 	@tabla = min(tabla)
		from	sincroniza.dbo.transfer_tablas
		where	grupo		= @grupo
		and	sub_grupo		= @sub_grupo
		and	tabla			> @tabla

		if @show = 1 select @multi_tabla, @tabla

		if isnull(@tabla,'') = '' 			goto ciclo_tabla_fin
	end

	select 	@tabla_origen	= ''
	select 	@tabla_origen	= isnull(tabla_origen,''),
		@tabla_b	= isnull(tabla_b,''),
		@tabla_c	= isnull(tabla_c,''),
		@tabla_d	= isnull(tabla_d,''),
		@tabla_e	= isnull(tabla_e,''),
		@usar_fuc	= isnull(usar_fuc,0),
		@where_adic	= isnull(where_adic,''),
		@tabla_destino	= isnull(tabla_destino,''),
		@activo		= isnull(activo,0),
		@sp_destino	= isnull(sp_destino,''),
		@sp_origen	= isnull(sp_origen,''),
		@ins_upd_1x1	= isnull(ins_upd_1x1,0)
	from 	sincroniza.dbo.transfer_tablas
	where	grupo		= @grupo
	and	sub_grupo	= @sub_grupo
	and	tabla		= @tabla


	select	@Variable_fuc = '' , @CambiarGetdate = 0 
	if 	@usar_fuc < 1 or @usar_fuc > @Max_Usar_fuc	select @usar_fuc = 0 
	if	@usar_fuc > 0					
	begin
		if exists ( select 1 from #Variables_fuc where Id = @usar_fuc and BuscarVariable = 1 )
			select @usar_fuc = - @Usar_fuc , @Variable_fuc = Variable_fuc from #Variables_fuc where Id = @usar_fuc and BuscarVariable = 1 
		else
			SELECT  @Variable_fuc = Variable_fuc , @CambiarGetdate = isnull(@CambiarFecha,CambiarGetdate) FROM  #Variables_fuc where Id = @usar_fuc

	end

	if @show = 1 select  @usar_fuc 'usar_fuc', @Variable_fuc 'variable_fuc'

	if @show = 1 select isnull(@activo,0) , isnull(@tabla_origen,'')
	if	isnull(@activo,0) != 1 or isnull(@tabla_origen,'') = '' 	goto ciclo_tabla

	if not exists ( 	select 	1 
				from 	sincroniza.dbo.transfer_estatus
				where	grupo		= @grupo
				and	sub_grupo	= @sub_grupo
				and	server_origen	= @server_origen
				and	tabla		= @tabla
			)
		insert into transfer_estatus
			select @grupo, @sub_grupo,@server_origen,@tabla,0,'19000101' ,0,0,0,0,0,0,0,getdate()

	select	@fecha 		= fecha,
		@fallos		= fallos,
		@ocupado 	= ocupado
	from 	sincroniza.dbo.transfer_estatus
	where	grupo		= @grupo
	and	sub_grupo	= @sub_grupo
	and	server_origen	= @server_origen
	and	tabla		= @tabla
	
	if @fecha_ini is not null  	select @fecha = @fecha_ini
	if @FechaMinima is not null  and  @FechaMinima > @Fecha 	select @fecha = @FechaMinima
	select 	@fecha_text = convert(char(20),@fecha,20)


	-- Corrijo el where adic por si tiene @fecha, @anio o @mes
	select @word = '@fecha', @nword = @com2 + @com2 + @fecha_text + @com2 + @com2 
	select @where_adic_paso = ltrim(rtrim(@where_adic))
arreglo:
	select @ix = charindex(@word,@where_adic_paso)
	if @ix >0 
	begin	
		select @len1 = len(@where_adic_paso)
		select @where_adic = left(@where_adic_paso,@ix-1) + @nword + substring(@where_adic_paso,@ix+len(@word),@len1-@ix-len(@word)+1)
		select @where_adic_paso = ltrim(rtrim(@where_adic))			
		goto arreglo
	end
	if @word = '@mes'	select @word = ''
	if @word = '@año'	select @word = '@mes', @nword = convert(char(2),datepart(mm,@fecha))
	if @word = '@anio'	select @word = '@año'
	if @word = '@fecha'	select @word = '@anio', @nword = convert(char(4),datepart(yy,@fecha))

	if @word != ''	goto arreglo


	if @ocupado != 0
	begin
		if datediff(mi,@fecha,getdate()) < 5
	 		goto ciclo_tabla
	end
		
	if @Test != 1
		update transfer_estatus set 	fuc 	= getdate(), 
						ocupado = 1 
		where	grupo		= @grupo
		and	sub_grupo	= @sub_grupo
		and	server_origen	= @server_origen
		and	tabla		= @tabla

	select @tablas_adic = ''
	if @tabla_b != ''	select @tablas_adic = ltrim(rtrim(@tablas_adic)) + ' , ' + ltrim(rtrim(@db_origen))+ '.' + ltrim(rtrim(@owner_origen)) + '.' + ltrim(rtrim(@tabla_b)) + ' b (NOLOCK)'
	if @tabla_c != ''	select @tablas_adic = ltrim(rtrim(@tablas_adic)) + ' , ' + ltrim(rtrim(@db_origen))+ '.' + ltrim(rtrim(@owner_origen)) + '.' + ltrim(rtrim(@tabla_c)) + ' c (NOLOCK)'
	if @tabla_d != ''	select @tablas_adic = ltrim(rtrim(@tablas_adic)) + ' , ' + ltrim(rtrim(@db_origen))+ '.' + ltrim(rtrim(@owner_origen)) + '.' + ltrim(rtrim(@tabla_d)) + ' d (NOLOCK)'
	if @tabla_e != ''	select @tablas_adic = ltrim(rtrim(@tablas_adic)) + ' , ' + ltrim(rtrim(@db_origen))+ '.' + ltrim(rtrim(@owner_origen)) + '.' + ltrim(rtrim(@tabla_e)) + ' e (NOLOCK)'
	
---------------------------------------------------------------------------------------------------------------------
-- Genero en memoria la tabla de paso
	select @f1 = getdate()
----------------------------------------------------------------------------------------------------------------------
-- Insert into la tabla de paso  ( primero armo los campos )
	select @f2 = getdate()
	select 	@p2  = @com + @com + ',' ,	@p3 = @com + @com + ',' ,  	@p4 = @com + @com + ',' ,
	 	@p5  = @com + @com + ',' ,  	@p6 = @com + @com + ',' , 	@p7 = @com + @com + ',' ,
		@p8  = @com + @com + ',' ,  	@p9 = @com + @com + ',' ,  	@p10 = @com + @com + ',' ,
		@p11 = @com + @com 
	select 	@cpo = 0,		@par		= '',		@npar		= 0,	@ncpos	= 0,
		@cpos_key_ab 	= '',	@campos_origen	= '',		@campos_destino	= '',	@campos_upd	= '', @campos_tabla_gato = '',
		@campos_create	= ''

ciclo_cpos:
	select @cpo = min(orden) from sincroniza.dbo.transfer_campos where tabla = @tabla and isnull(transferir,0) != 0 and orden > @cpo
	if isnull(@cpo,0) = 0 goto ciclo_cpos_fin

	select 	@campo_origen 	= campo_origen ,
		@campo_destino	= campo_destino,
		@campo_select	= campo_destino,
		@es_key		= es_key,
		@tipo		= tipo,
		@es_null	= es_null,
		@tabla_abcde	= isnull(tabla_abcde,'a'),
		@val_default	= case when val_default = '=' then objeto else val_default end,
		@transferir	= transferir
 	from 	sincroniza.dbo.transfer_campos 
	where 	tabla = @tabla 
	and 	orden = @cpo 

	if @transferir = 0  goto ciclo_cpos


	select 	@campos_create = ltrim(rtrim(@campos_create))
				+ ltrim(rtrim(@campo_destino))
				+ ' ' + @tipo
				+ case when @es_null = 1 then ' NULL, ' else ' , ' end

	select	@ncpos = @ncpos + 1

	if 	len(@tablas_adic) > 0 	  select @campo_origen = @tabla_abcde + '.' + ltrim(rtrim(@campo_origen))
	if @transferir = 2		  select @campo_origen = ltrim(rtrim(@val_default))

	if @usar_fuc < 0 
	BEGIN
		if exists ( select 1 from #Variables_fuc where ltrim(rtrim(@campo_origen)) = ltrim(rtrim(Variable_fuc)) and ValidoParaBusca = 1 )
			select @usar_fuc = id , @Variable_fuc =  Variable_fuc , @CambiarGetdate = isnull(@CambiarFecha,CambiarGetdate)  from #Variables_fuc where ltrim(rtrim(@campo_origen)) = ltrim(rtrim(Variable_fuc))
	
	end

	if @ncpos = 1
		select	@campos_origen  	= ltrim(rtrim(@campo_origen)),
			@campos_tabla_gato 	= ltrim(rtrim(@campo_destino)),
			@campos_destino 	= case when @usar_fuc > 0 and @CambiarGetdate = 1 and  ltrim(rtrim(@campo_destino)) = ltrim(rtrim(@Variable_fuc)) then   'getdate()' else ltrim(rtrim(@campo_destino)) end,
			@campos_select		= ltrim(rtrim(@campo_select))
	else
		select	@campos_origen  	= ltrim(rtrim(@campos_origen)) 		+ ',' + ltrim(rtrim(@campo_origen)),
			@campos_tabla_gato 	= ltrim(rtrim(@campos_tabla_gato)) 	+ ',' + ltrim(rtrim(@campo_destino)),
			@campos_destino 	= ltrim(rtrim(@campos_destino)) 	+ ',' + case when @usar_fuc > 0 and @CambiarGetdate = 1 and  ltrim(rtrim(@campo_destino)) = ltrim(rtrim(@Variable_fuc)) then   'getdate()' else ltrim(rtrim(@campo_destino)) end,
			@campos_select		= ltrim(rtrim(@campos_select)) 		+ ',' + ltrim(rtrim(@campo_select)) 


	if @es_key = 1
	begin
		if @cpos_key_ab = ''
			select	@cpos_key_ab = ' a.' + ltrim(rtrim(@campo_destino)) + ' = b.' + ltrim(rtrim(@campo_destino))
		else
			select	@cpos_key_ab = ltrim(rtrim(@cpos_key_ab)) + ' and a.' + ltrim(rtrim(@campo_destino)) + ' = b.' + ltrim(rtrim(@campo_destino))
	end
	else
	begin
		if @campos_upd = ''
			select	@campos_upd =  ltrim(rtrim(@campo_destino)) + case when @usar_fuc > 0 and @CambiarGetdate = 1 and  ltrim(rtrim(@campo_destino)) = ltrim(rtrim(@Variable_fuc)) then ' = getdate()' else ' = b.' + ltrim(rtrim(@campo_destino)) end
		else
			select	@campos_upd = ltrim(rtrim(@campos_upd)) + ' , ' + ltrim(rtrim(@campo_destino)) +  case when @usar_fuc > 0 and @CambiarGetdate = 1
				and  ltrim(rtrim(@campo_destino)) = ltrim(rtrim(@Variable_fuc)) then ' = getdate()' else ' = b.' + ltrim(rtrim

(@campo_destino))  end
	end


	if 	len(@par) + len(@campo_origen) > 248
	begin
		select @npar = @npar + 1
		if @npar = 1	select @p2 = @com + ltrim(rtrim(@par)) + @com + ','
		if @npar = 2	select @p3 = @com + ltrim(rtrim(@par)) + @com + ','
		if @npar = 3	select @p4 = @com + ltrim(rtrim(@par)) + @com + ','
		if @npar = 4	select @p5 = @com + ltrim(rtrim(@par)) + @com + ','
		if @npar = 5	select @p6 = @com + ltrim(rtrim(@par)) + @com + ','
		if @npar = 6	select @p7 = @com + ltrim(rtrim(@par)) + @com + ','
		if @npar = 7	select @p8 = @com + ltrim(rtrim(@par)) + @com + ','
		select @par = ''
	end
	if @ncpos 	= 1
		select @par = ltrim(rtrim(@campo_origen))
	else
		select @par = ltrim(rtrim(@par)) + ',' + ltrim(rtrim(@campo_origen))
	goto 	ciclo_cpos

ciclo_cpos_fin:
	select @par =  ltrim(rtrim(@par)) + ',0' 
	select @npar = @npar + 1
	if @npar = 1	select @p2 = @com + ltrim(rtrim(@par)) + @com + ','
	if @npar = 2	select @p3 = @com + ltrim(rtrim(@par)) + @com + ','
	if @npar = 3	select @p4 = @com + ltrim(rtrim(@par)) + @com + ','
	if @npar = 4	select @p5 = @com + ltrim(rtrim(@par)) + @com + ','
	if @npar = 5	select @p6 = @com + ltrim(rtrim(@par)) + @com + ','
	if @npar = 6	select @p7 = @com + ltrim(rtrim(@par)) + @com + ','
	if @npar = 7	select @p8 = @com + ltrim(rtrim(@par)) + @com + ','

	if @BlobFields = 1
	begin
		select 	@p9 	=  ' From ' 
				+  ltrim(rtrim(@server_origen)) + '.' + ltrim(rtrim(@db_origen)) + '.'  + ltrim(rtrim(@owner_origen)) + '.'  + ltrim(rtrim(@tabla_origen)) + ' a (NOLOCK)' 
--				+  ltrim(rtrim(@db_origen)) + '.'  + ltrim(rtrim(@owner_origen)) + '.'  + ltrim(rtrim(@tabla_origen)) + ' a (NOLOCK)' 
				+  ltrim(rtrim(@tablas_adic))
	end
	else
	begin
		select 	@p9 	=  @com + ' From ' 
				+  ltrim(rtrim(@db_origen)) + '.'  + ltrim(rtrim(@owner_origen)) + '.'  + ltrim(rtrim(@tabla_origen)) + ' a (NOLOCK)' 
				+  ltrim(rtrim(@tablas_adic)) + @com + ','
	end


--select where_adic from transfer_tablas where tabla like 'SifAux%'
	if len(@where_adic) > 0
	begin
	
		if 	@usar_fuc <> 0
		begin
			if @BlobFields = 1
			begin
				select @p10 = ' where a.' + ltrim(rtrim(@Variable_fuc))  + ' >= ' + @com + @fecha_text + @com 
				select @p11 = ' and '  + ltrim(rtrim(@where_adic))  
			end
			else
			begin
				select @p10 = @com + ' where a.' + ltrim(rtrim(@Variable_fuc))  + ' >= ' + @com2 + @com2 + @fecha_text + @com2 + @com2 + @com + ',' --  ' and ' + ltrim(rtrim(@where_adic))  + @com + ','
				select @p11 = @com  + ' and '  + ltrim(rtrim(@where_adic))  + @com 
			end
		end
		else
		begin
			select @p10 = @com + ' where ' + ltrim(rtrim(@where_adic)) + @com + ','
		end
			
	end
	else
	begin
		if 	@usar_fuc <> 0
			select @p10 = @com + ' where a.' +  ltrim(rtrim(@Variable_fuc))  + ' >= ' + @com2 + @com2 + @fecha_text + @com2 + @com2 + ' '  + @com + ','
	end


	if @sp_origen <> ''
	begin
		if @where_adic <> ''
		begin
				select @p10 = 	@com 
						+ @com2 + ltrim(rtrim(@fecha_text)) + @com2 + ' , ' 
						+ @com2 + ltrim(rtrim(@tabla)) + @com2 + ' , ' 
						+ @com2 + ltrim(rtrim(@server_destino)) + @com2 + ' , ' 
						+ @com2 + ltrim(rtrim(@db_destino)) + @com2 + ' , ' 
						+ @com,
					@p11 =	@com + + ltrim(rtrim(@where_adic))  + @com
		end
		else
		begin
				select @p10 = 	@com 
						+ @com2 + ltrim(rtrim(@fecha_text)) + @com2 + ' , ' 
						+ @com2 + ltrim(rtrim(@tabla)) + @com2 + ' , ' 
						+ @com2 + ltrim(rtrim(@server_destino)) + @com2 + ' , ' 
						+ @com2 + ltrim(rtrim(@db_destino)) + @com2 
						+ @com
		end
	end


	-- SARX: 26-Mar-08
	-- Modifico la creacion de tablas ## para que el nombre del servidor no tenga guines medios, ya que SQL no permite
	-- ese caracter para creacion de objetos, sin embargo Windows Server si te permite un nombre con guines medios
	-- por lo que genera un error en la creacion de la tabla

	Declare @server_origen_sg varchar(30)

	Select @server_origen_sg = @server_origen

	While CHARINDEX( '-', @server_origen_sg) > 0 
		Select @server_origen_sg = stuff( @server_origen_sg, CHARINDEX( '-', @server_origen_sg), 1, '' )



-- Hago el exec para el Insert en la tabla temporal
	if @show = 1 		
		select  'Generando Informacion de ' + ltrim(rtrim(@server_origen)) + '.' + ltrim(rtrim(@db_origen)) + '.' + ltrim(rtrim(@tabla))

	select	@tabla_gato = '##' + ltrim(rtrim(@grupo)) + '_' + ltrim(rtrim(@sub_grupo)) + '_'  + ltrim(rtrim(@server_origen_sg))
	select @cmd = 'create table ' + ltrim(rtrim(@tabla_gato)) + ' ( '
	if @ins_upd_1x1 = 1
	select 	@campos_create = ltrim(rtrim(@campos_create)) + 'upd_o_ins int, fol_id_1x1 int identity )'
	else
		select 	@campos_create = ltrim(rtrim(@campos_create)) + 'upd_o_ins int )'
	
	if @show = 1	select  @cmd + @campos_create 

	if @test = 1 and @show = 0	select @cmd + @campos_create 

	exec ( @cmd + @campos_create )


	select @leidos = 0 , @inserts = 0, @updates = 0 , @existen = 0 

	if @show >= 100			goto Sin_Lectura

	select @cmd 	=  'insert into ' + ltrim(rtrim(@tabla_gato))
	
	
	
	
	if @sp_origen = ''
	begin
		if ltrim(rtrim(@server_origen))= @@SERVERNAME
			select @p1  	=  '     exec ' + 'master.dbo.sp_utilerias_select ' 
		else
			select @p1  	=  '     exec ' + ltrim(rtrim(@server_origen)) +  '.master.dbo.sp_utilerias_select ' 

		select @par1 	=  @p1 + @p2+ @p3+ @p4+ @p5+ @p6+ @p7+ @p8+ @p9+ @p10 + @p11
	end
	else
	begin
		if ltrim(rtrim(@server_origen))= @@SERVERNAME
			select @p1  	=  '     exec ' + ltrim(rtrim(@db_origen)) + ltrim(rtrim(@sp_origen))
		else
			select @p1  	=  '     exec [' + ltrim(rtrim(@server_origen)) + '].' + ltrim(rtrim(@db_origen)) + ltrim(rtrim(@sp_origen))
		select @par1 	=  @p1 + @p10
	end
	
	if @BlobFields = 1
	begin
		select @campos_select + ',0' as 'campos select'
		select @p10, @p11
		
		select @p1 = '     select '
		select @par1 	=  @p1 + @campos_select + ',0' + @p9 + @p10 + @p11
	end
	
	
	
	if @show = 1
	begin
		select @p1 + @p2+ @p3+ @p4+ @p5+ @p6+ @p7+ @p8+ @p9+ @p10 + @p11
		select @cmd  + ' (' + @campos_tabla_gato + ' , upd_o_ins ) ' +  @par1 
	end

	if @test = 1
		select  @cmd  + ' (' + @campos_tabla_gato + ' , upd_o_ins ) ' +  @par1
	else
		begin
			if @show = 1
				select 'inicio insert tabla gato',getdate()
				/*
			IF HOST_NAME() = 'TERMINALSOP'
			BEGIN
				SELECT 'VSC: ' + @cmd
				SELECT @cmd = 'SET ANSI_NULLS ON ' + ' SET ANSI_WARNINGS ON ' + @cmd
				SELECT 'VSC: ' + @cmd
			END */
			exec  (@cmd  + ' (' + @campos_tabla_gato + ' , upd_o_ins ) ' +  @par1 )	
		end
	select @leidos =  @@rowcount , @error = @@error
	
	if @show = 1
				select 'fin insert tabla gato',getdate()
		
	if @show = 1
	begin
		declare @conteoPaso varchar(100)
		select @conteoPaso = 'select count(1) as conteoGato from ' + ltrim(rtrim(@tabla_gato))
		exec (@conteoPaso)
		select @leidos
	end
---------------------------------------------------------------------------------------------------------------------			
-- Marco en la tabla de paso los registros que ya existen en la tabla original

	select @f3 = getdate()
	if @error > 0 or @leidos = 0 		goto Sin_Lectura

	select @cmd 	=  ' update '  + ltrim(rtrim(@tabla_gato)) 
			 + ' set upd_o_ins = 1 '
	select @p1 	=  ' from   ' + ltrim(rtrim(@tabla_gato)) + ' a , '
	select @p2 	=  '        ' + ltrim(rtrim(@db_destino)) + '.' + ltrim(rtrim(@owner_destino)) + '.' + ltrim(rtrim(@tabla_destino)) + ' b '
	select @p3 	=  ' where  ' + @cpos_key_ab
	if @show = 1 	select @cmd + @p1 + @p2 + @p3 
	if @test = 0
		exec  (	@cmd + @p1 + @p2 + @p3 )
	
	select @existen = @@rowcount,  @error = @@error
	if @error > 0 			goto Sin_Lectura

	
---------------------------------------------------------------------------------------------------------------------			
	-- Inserto los registros en la tabla destino
	select @f4 = getdate()
	select @cmd 	=  ' insert into  ' + ltrim(rtrim(@db_destino)) + '.' + ltrim(rtrim(@owner_destino)) + '.' + ltrim(rtrim(@tabla_destino)) 
	select @p9 	=  ' from   ' + ltrim(rtrim(@tabla_gato)) 
			 + '  where upd_o_ins = 0'
	if @show = 1 	select @cmd + ' ( ' + @campos_destino + ' ) select ' + @campos_destino + @p9 
	if @test = 0 
	begin
		if @show = 1
			select 'inicio insert tabla destino',getdate()
		exec  (	@cmd + ' ( ' + @campos_tabla_gato + ' ) select ' + @campos_destino + @p9 )
	end

	select @inserts = @@rowcount, @error = @@error
	if @error > 0 			goto Sin_Lectura

	if @show = 1
		select 'fin insert tabla destino',getdate()

---------------------------------------------------------------------------------------------------------------------			
	-- Updateo los registros en la tabla destino
	select @f5 = getdate()
	select @cmd 	=  ' update  ' + ltrim(rtrim(@db_destino)) + '.' + ltrim(rtrim(@owner_destino)) + '.' + ltrim(rtrim(@tabla_destino)) + ' set '
	select @p1 	=  ' from   ' + ltrim(rtrim(@db_destino)) + '.' + ltrim(rtrim(@owner_destino)) + '.' + ltrim(rtrim(@tabla_destino)) + ' a , '
	select @p2 	=  '         '  + ltrim(rtrim(@tabla_gato)) + ' b '
			 + '  where upd_o_ins = 1 and ' + @cpos_key_ab
	if @show = 1 	select @cmd +  @campos_upd  + @p1 + @p2

	if @test = 0
	begin
		if @show = 1
			select 'inicio insert tabla destino',getdate()
		exec  (	@cmd +  @campos_upd  + @p1 + @p2 )
	end
	select @updates = @@rowcount, @error = @@error
	if @error > 0 			goto Sin_Lectura

	if @show = 1
		select 'fin insert tabla destino',getdate()
---------------------------------------------------------------------------------------------------------------------			
	-- Verifico que se pasaron todos los que me entrego y grabo la informacion
sin_lectura:
	-- Borro la tabla temporal
	select @f6 = getdate()
	select @cmd =  'drop table ' + ltrim(rtrim(@tabla_gato)) 
	if @show = 1 	select @cmd 

	exec ( @cmd  )

	if @leidos = @inserts + @updates and @existen = @updates 
		select @fallos = 0
	else
		select @fallos = @fallos + 1
	select @f9 = getdate()
	select 	@tiempo_seg_tot		= datediff(ss,@f0,@f9)
	select 	@tiempo_seg_leer	= datediff(ss,@f1,@f3)
	select 	@tiempo_seg_act		= @tiempo_seg_tot - @tiempo_seg_leer


	if @bitacora >= 1 and @test != 1
	begin		
		insert into transfer_bitacora 
			(grupo,  sub_grupo,  server_origen,  tabla,  fecha,   leidos ,  updates,   inserts,  fallos,
			 tiempo_seg_leer,  tiempo_seg_act,  tiempo_seg_tot,  fuc  )
		select 	@grupo, @sub_grupo, @server_origen, @tabla, @fecha , @leidos , @updates , @inserts, @fallos,
			@tiempo_seg_leer, @tiempo_seg_act, @tiempo_seg_tot,  getdate()

		if @dias_bitacora != 0 
		begin
			select @fec_minima = dateadd(dd,-@dias_bitacora, getdate())				
			delete transfer_bitacora
			where 	fuc <= @fec_minima
		end
	end


	if @test != 1
		update transfer_estatus set 	fuc 		= getdate(), 
						ocupado 	= 0,
						fecha		= case  when 	@leidos > 0 and @fallos = 0 then @fecha_new 
									else 					 fecha 
								  end,
						leidos 		= @leidos,
						updates		= @updates,
						inserts		= @inserts,
						tiempo_seg_leer	= @tiempo_seg_leer,
						tiempo_seg_act	= @tiempo_seg_act,
						tiempo_seg_tot	= @tiempo_seg_tot,
						fallos		= @fallos
		where	grupo		= @grupo
		and	sub_grupo	= @sub_grupo
		and	server_origen	= @server_origen
		and	tabla		= @tabla


	if @show >= 1	select @tabla as Tabla, @leidos as Leidos, @updates as Updates, @inserts as Inserts, @tiempo_seg_tot as Tiempo_seg_Tot, @fecha_new as Fecha_New

	goto ciclo_tabla


ciclo_tabla_fin:

	goto ciclo_server
ciclo_server_fin:
	goto final
error:
	select 'Error al obtener la fecha'
final:
      Print 'Se termino'

END





GO
/****** Object:  Table [dbo].[transfer_bitacora]    Script Date: 26/08/2020 10:18:33 a. m. ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[transfer_bitacora](
	[grupo] [varchar](20) NULL,
	[sub_grupo] [varchar](20) NULL,
	[server_origen] [varchar](30) NULL
) ON [PRIMARY]
SET ANSI_PADDING ON
ALTER TABLE [dbo].[transfer_bitacora] ADD [tabla] [varchar](150) NULL
ALTER TABLE [dbo].[transfer_bitacora] ADD [fecha] [datetime] NULL
ALTER TABLE [dbo].[transfer_bitacora] ADD [leidos] [int] NULL
ALTER TABLE [dbo].[transfer_bitacora] ADD [updates] [int] NULL
ALTER TABLE [dbo].[transfer_bitacora] ADD [inserts] [int] NULL
ALTER TABLE [dbo].[transfer_bitacora] ADD [fallos] [int] NULL
ALTER TABLE [dbo].[transfer_bitacora] ADD [tiempo_seg_leer] [int] NULL
ALTER TABLE [dbo].[transfer_bitacora] ADD [tiempo_seg_act] [int] NULL
ALTER TABLE [dbo].[transfer_bitacora] ADD [tiempo_seg_tot] [int] NULL
ALTER TABLE [dbo].[transfer_bitacora] ADD [fuc] [datetime] NULL

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[transfer_campos]    Script Date: 26/08/2020 10:18:34 a. m. ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[transfer_campos](
	[tabla] [varchar](150) NULL,
	[campo_origen] [varchar](50) NULL,
	[campo_destino] [varchar](50) NULL
) ON [PRIMARY]
SET ANSI_PADDING OFF
ALTER TABLE [dbo].[transfer_campos] ADD [tabla_abcde] [varchar](1) NULL
ALTER TABLE [dbo].[transfer_campos] ADD [tipo] [varchar](20) NULL
ALTER TABLE [dbo].[transfer_campos] ADD [tipou] [varchar](20) NULL
ALTER TABLE [dbo].[transfer_campos] ADD [es_null] [int] NULL
ALTER TABLE [dbo].[transfer_campos] ADD [es_key] [int] NULL
ALTER TABLE [dbo].[transfer_campos] ADD [orden] [int] NULL
ALTER TABLE [dbo].[transfer_campos] ADD [val_default] [varchar](30) NULL
ALTER TABLE [dbo].[transfer_campos] ADD [transferir] [int] NULL
ALTER TABLE [dbo].[transfer_campos] ADD [fuc] [datetime] NULL
SET ANSI_PADDING ON
ALTER TABLE [dbo].[transfer_campos] ADD [objeto] [varchar](300) NULL

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[transfer_estatus]    Script Date: 26/08/2020 10:18:34 a. m. ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[transfer_estatus](
	[grupo] [varchar](20) NULL,
	[sub_grupo] [varchar](20) NULL,
	[server_origen] [varchar](30) NULL
) ON [PRIMARY]
SET ANSI_PADDING ON
ALTER TABLE [dbo].[transfer_estatus] ADD [tabla] [varchar](150) NULL
ALTER TABLE [dbo].[transfer_estatus] ADD [ocupado] [int] NULL
ALTER TABLE [dbo].[transfer_estatus] ADD [fecha] [datetime] NULL
ALTER TABLE [dbo].[transfer_estatus] ADD [leidos] [int] NULL
ALTER TABLE [dbo].[transfer_estatus] ADD [updates] [int] NULL
ALTER TABLE [dbo].[transfer_estatus] ADD [inserts] [int] NULL
ALTER TABLE [dbo].[transfer_estatus] ADD [fallos] [int] NULL
ALTER TABLE [dbo].[transfer_estatus] ADD [tiempo_seg_leer] [int] NULL
ALTER TABLE [dbo].[transfer_estatus] ADD [tiempo_seg_act] [int] NULL
ALTER TABLE [dbo].[transfer_estatus] ADD [tiempo_seg_tot] [int] NULL
ALTER TABLE [dbo].[transfer_estatus] ADD [fuc] [datetime] NULL

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[transfer_grupos]    Script Date: 26/08/2020 10:18:34 a. m. ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[transfer_grupos](
	[grupo] [varchar](20) NULL,
	[sub_grupo] [varchar](20) NULL,
	[server_origen] [varchar](30) NULL,
	[db_origen] [varchar](30) NULL,
	[owner_origen] [varchar](30) NULL,
	[server_destino] [varchar](30) NULL,
	[db_destino] [varchar](30) NULL,
	[owner_destino] [varchar](30) NULL,
	[fuc] [datetime] NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[transfer_tablas]    Script Date: 26/08/2020 10:18:34 a. m. ******/
SET ANSI_NULLS OFF
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING OFF
GO
CREATE TABLE [dbo].[transfer_tablas](
	[grupo] [varchar](20) NULL,
	[sub_grupo] [varchar](20) NULL
) ON [PRIMARY]
SET ANSI_PADDING ON
ALTER TABLE [dbo].[transfer_tablas] ADD [tabla] [varchar](150) NULL
ALTER TABLE [dbo].[transfer_tablas] ADD [tabla_origen] [varchar](150) NULL
ALTER TABLE [dbo].[transfer_tablas] ADD [tabla_b] [varchar](150) NULL
ALTER TABLE [dbo].[transfer_tablas] ADD [tabla_c] [varchar](150) NULL
ALTER TABLE [dbo].[transfer_tablas] ADD [tabla_d] [varchar](150) NULL
ALTER TABLE [dbo].[transfer_tablas] ADD [tabla_e] [varchar](150) NULL
ALTER TABLE [dbo].[transfer_tablas] ADD [usar_fuc] [int] NULL
SET ANSI_PADDING OFF
ALTER TABLE [dbo].[transfer_tablas] ADD [where_adic] [varchar](255) NULL
SET ANSI_PADDING ON
ALTER TABLE [dbo].[transfer_tablas] ADD [tabla_destino] [varchar](150) NULL
SET ANSI_PADDING OFF
ALTER TABLE [dbo].[transfer_tablas] ADD [sp_destino] [varchar](100) NULL
ALTER TABLE [dbo].[transfer_tablas] ADD [sp_origen] [varchar](100) NULL
ALTER TABLE [dbo].[transfer_tablas] ADD [ins_upd_1x1] [int] NULL
ALTER TABLE [dbo].[transfer_tablas] ADD [activo] [int] NULL
ALTER TABLE [dbo].[transfer_tablas] ADD [fuc] [datetime] NULL
ALTER TABLE [dbo].[transfer_tablas] ADD [objeto] [varchar](100) NULL

GO
SET ANSI_PADDING OFF
GO
