DECLARE @tFechaDesde DATETIME 
	,@tFechaHasta DATETIME 
	,@pnDepartamento INT
	,@pnTipoCelda INT  --Tipo 3 es Plastic Strip
	,@pnIdCelda INT 
	,@condicion VARCHAR(MAX)


	SET @tFechaDesde = NULL
	SET @tFechaHasta = NULL
	SET @pnDepartamento = NULL
	SET @pnTipoCelda = NULL
	SET @pnIdCelda   = NULL
	SET @condicion   = NULL

	IF @pnDepartamento IS NULL AND @pnTipoCelda IS NULL AND @pnIdCelda IS NULL
		SET @condicion = ' '
	IF @pnDepartamento IS NOT NULL AND @pnTipoCelda IS NULL AND @pnIdCelda  IS NULL
	    SET @condicion = 'WHERE ClaDepartamento ='+CAST (@pnDepartamento AS  varchar(10))+''
	IF @pnDepartamento IS NOT NULL AND @pnTipoCelda IS NOT NULL AND @pnIdCelda IS NULL
		SET @condicion = 'WHERE ClaDepartamento ='+CAST (@pnDepartamento AS  varchar(10))+' AND ClaArea='+CAST (@pnTipoCelda AS varchar(10))+''
	IF @pnDepartamento IS NOT NULL AND @pnTipoCelda IS NULL AND @pnIdCelda IS NOT NULL
		SET @condicion = 'WHERE ClaDepartamento ='+CAST (@pnDepartamento AS  varchar(10))+' AND IdCelda='+CAST (@pnIdCelda AS varchar(10))+''
	IF @pnDepartamento IS NOT NULL AND @pnTipoCelda IS NOT NULL AND @pnIdCelda IS NOT NULL
		SET @condicion = 'WHERE ClaDepartamento ='+CAST (@pnDepartamento AS  varchar(10))+' AND ClaArea='+CAST (@pnTipoCelda AS varchar(10))+'AND IdCelda='+CAST (@pnIdCelda AS varchar(10))+''
	IF @pnDepartamento IS NULL AND @pnTipoCelda IS NOT NULL AND @pnIdCelda IS NULL
		SET @condicion = 'WHERE ClaArea ='+CAST (@pnTipoCelda AS varchar(10))+''
	IF @pnDepartamento IS NULL AND @pnTipoCelda IS NOT NULL AND @pnIdCelda IS NOT NULL
		SET @condicion = 'WHERE ClaArea ='+CAST (@pnTipoCelda AS varchar(10))+' AND IdCelda = '+CAST (@pnIdCelda AS varchar(10))+''
	IF @pnDepartamento IS NULL AND @pnTipoCelda IS NULL AND @pnIdCelda IS NOT NULL
		SET @condicion = 'WHERE IdCelda ='+CAST (@pnIdCelda AS varchar(10))+''
		
	 WHILE @tFechaDesde < @tFechaHasta
		BEGIN
			EXEC [AswSch].[ASW_CU305_Pag1_CalculaEGEJerarquico] 68,@tFechaDesde,1,@condicion
		    SET @tFechaDesde = DATEADD(HOUR, 1, @tFechaDesde)
		END


