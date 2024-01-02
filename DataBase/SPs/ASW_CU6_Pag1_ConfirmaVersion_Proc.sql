--USE [ASW]
--GO
/****** Object:  StoredProcedure [AswSch].[ASW_CU6_Pag1_ConfirmaVersion_Proc]    Script Date: 14/11/2022 11:18:41 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


/*
* MRODRIGUEZC
* 2022/08/18
* Confirma la  ultima version actualizada de la bd Sqlite en la tablet
*/
/*
EXECUTE AswSch.ASW_CU6_Pag1_ConfirmaVersion_Proc '0.0', 1
*/
ALTER  PROCEDURE [AswSch].[ASW_CU6_Pag1_ConfirmaVersion_Proc]
	@psIdCelda VARCHAR(30),
	@psVersion VARCHAR(15),
	@psNombrePcMod VARCHAR(64),
	@pnDebug INT = 0
AS
BEGIN
SET NOCOUNT ON

	DECLARE
		@sClient_net_address VARCHAR(25)

	SELECT  @sClient_net_address = CAST( CONNECTIONPROPERTY('client_net_address') AS VARCHAR)
   --CONNECTIONPROPERTY('net_transport') AS net_transport,
   --CONNECTIONPROPERTY('protocol_type') AS protocol_type,
   --CONNECTIONPROPERTY('auth_scheme') AS auth_scheme,
   --CONNECTIONPROPERTY('local_net_address') AS local_net_address,
   --CONNECTIONPROPERTY('local_tcp_port') AS local_tcp_port,
  
	SET @psNombrePcMod = @psNombrePcMod + @sClient_net_address
	
	IF EXISTS (SELECT 1 FROM [AswSch].[AswTraControlVersionAvisor] WHERE IdCelda = @psIdCelda)
	BEGIN
		UPDATE [AswSch].[AswTraControlVersionAvisor] 
		SET [VersionSqlite] = @psVersion
			,[NombrePcMod] = @psNombrePcMod
			,[FechaUltimaMod] = GETDATE()
		WHERE IdCelda = @psIdCelda
	END
	ELSE
	BEGIN
		INSERT INTO [AswSch].[AswTraControlVersionAvisor] ([IdCelda], [VersionSqlite], [NombrePcMod], [FechaUltimaMod])
		VALUES (@psIdCelda, @psVersion, @psNombrePcMod, GETDATE())
	END

	INSERT INTO [AswSch].[AswBitControlVersionAvisor]([IdCelda], [Origen], [Version], [NombrePcMod], [FechaUltimaMod])
	VALUES (@psIdCelda, 'Sqlite', @psVersion, @psNombrePcMod, GETDATE())

END