USE [ASW]
GO
/****** Object:  StoredProcedure [AswSch].[ASW_CU102_Pag1_Boton_LOAD_Proc]    Script Date: 14/11/2022 01:12:22 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--EXEC ASWSch.ASW_CU102_Pag1_Boton_LOAD_Proc 68
ALTER PROCEDURE [AswSch].[ASW_CU102_Pag1_Boton_LOAD_Proc]
	@pnClaUbicacion INT
	,@ptShowUntil DATETIME OUT
AS
BEGIN

	SELECT  @ptShowUntil = dateadd(week, datediff(week, 0, getdate())+2, 0)-1


END