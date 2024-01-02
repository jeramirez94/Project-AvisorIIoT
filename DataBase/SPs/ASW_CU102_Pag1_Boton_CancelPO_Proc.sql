--USE [ASW]
--GO
/****** Object:  StoredProcedure [AswSch].[ASW_CU102_Pag1_Boton_CancelPO_Proc]    Script Date: 14/11/2022 01:08:58 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
begin tran
EXEC ASWSch.ASW_CU102_Pag1_Boton_CancelPO_Proc	
	@pnClaUbicacion =68
	,@pnIdOp=10001
	,@pnClaUsuarioMod =0
	,@psNombrePcMod ='mrc'
rollback tran
*/
ALTER PROCEDURE [AswSch].[ASW_CU102_Pag1_Boton_CancelPO_Proc]
	@pnClaUbicacion INT
	,@pnIdOp INT
	,@pnClaUsuarioMod INT
	,@psNombrePcMod VARCHAR(64)
AS
BEGIN
	DECLARE 
		@nOrden INT
		,@nClaEstatus INT

	--Obtener el orden, status y celda de la orden
	SELECT @nClaEstatus = ClaEstatus
	FROM [AswSch].[ASWTraOrdenProduccion] 
	WHERE ClaUbicacion=@pnClaUbicacion
		AND IdPO = @pnIdOp

	--Si el estatus es 2-In progress no se puede mover
	IF @nClaEstatus = 2
	BEGIN
		RAISERROR('The order is IN PROGRESS and can not be canceled',16, 1)
		RETURN
	END

	IF @nClaEstatus = 3
	BEGIN
		RAISERROR('The order is FINISHED and can not be canceled',16, 1)
		RETURN
	END

	IF @nClaEstatus = 4
	BEGIN
		RAISERROR('The order is already CANCELED',16, 1)
		RETURN
	END

	UPDATE [AswSch].[ASWTraOrdenProduccion] 
	SET ClaEstatus = 4
		,ClaUsuarioMod = @pnClaUsuarioMod
		,NombrePcMod = @psNombrePcMod
		,FechaUltimaMod = GETDATE()
	WHERE ClaUbicacion=@pnClaUbicacion
		AND IdPO = @pnIdOp

END