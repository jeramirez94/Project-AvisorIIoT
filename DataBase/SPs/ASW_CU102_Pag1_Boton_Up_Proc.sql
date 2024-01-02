--USE [ASW]
--GO
/****** Object:  StoredProcedure [AswSch].[ASW_CU102_Pag1_Boton_Up_Proc]    Script Date: 14/11/2022 01:13:23 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--EXEC ASWSch.ASW_CU102_Pag1_Boton_Up_Proc 68, NULL, NULL
ALTER PROCEDURE [AswSch].[ASW_CU102_Pag1_Boton_Up_Proc]
	@pnClaUbicacion INT
	,@pnIdOp INT
	,@pnClaUsuarioMod INT
	,@psNombrePcMod VARCHAR(64)
AS
BEGIN
	DECLARE 
		@nOrden INT
		,@nClaEstatus INT
		,@sIdCelda VARCHAR(30)
		,@nIdOpCambio INT
		,@nOrdenCambio INT
		,@nClaEstatusCambio INT

	--Obtener el orden, status y celda de la orden
	SELECT @nOrden = Orden
		,@nClaEstatus = ClaEstatus
		,@sIdCelda = IdCelda
	FROM [AswSch].[ASWTraOrdenProduccion] 
	WHERE ClaUbicacion=@pnClaUbicacion
		AND IdPO = @pnIdOp

	--Si el estatus es 2-In progress no se puede mover
	IF @nClaEstatus = 2
	BEGIN
		RAISERROR('The order is IN PROGRESS and can not be moved',16, 1)
		RETURN
	END
	--Obtener el orden y status de la orden que va antes
	SELECT TOP 1 
		@nIdOpCambio = IdPO
		,@nOrdenCambio = Orden
		,@nClaEstatusCambio = ClaEstatus
	FROM [AswSch].[ASWTraOrdenProduccion] 
	WHERE ClaUbicacion=@pnClaUbicacion
		AND IdCelda = @sIdCelda
		AND Orden < @nOrden
	ORDER BY Orden DESC

	--Si no hay orden antes no se puede cambiar el orden porque ya es la primera
	IF @nIdOpCambio IS NULL
	BEGIN
		RAISERROR('The order is the first one and can not be moved',16, 1)
		RETURN
	END
	--Si el estatus es 2-In progress no se puede mover
	IF @nClaEstatusCambio = 2
	BEGIN
		RAISERROR('The previous order is IN PROGRESS and can not be moved',16, 1)
		RETURN
	END

	--Actualizar las ordenes con el orden invertido
	UPDATE [AswSch].[ASWTraOrdenProduccion]
	SET Orden = @nOrdenCambio
		,ClaUsuarioMod = @pnClaUsuarioMod
		,NombrePcMod = @psNombrePcMod
		,FechaUltimaMod = GETDATE()
	WHERE ClaUbicacion=@pnClaUbicacion
		AND IdPO = @pnIdOp

	
	UPDATE [AswSch].[ASWTraOrdenProduccion]
	SET Orden = @nOrden
		,ClaUsuarioMod = @pnClaUsuarioMod
		,NombrePcMod = @psNombrePcMod
		,FechaUltimaMod = GETDATE()
	WHERE ClaUbicacion=@pnClaUbicacion
		AND IdPO = @nIdOpCambio

	
END