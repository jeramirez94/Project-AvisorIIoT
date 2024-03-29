USE [ASW]
GO
/****** Object:  StoredProcedure [AswSch].[ASW_MonitoreoTablets_Proc]    Script Date: 15/11/2022 04:21:29 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*

DELETE ASWSch.ASWTraAlertasDev
INSERT INTO ASWSch.ASWTraAlertasDev
SELECT 1, 0, '1900-01-01'


SELECT *
FROM ASWSch.ASWTraMonitoreoTabletDev

*/


ALTER PROCEDURE [AswSch].[ASW_MonitoreoTablets_Proc]
AS
BEGIN
	SET NOCOUNT ON
	DECLARE

		@nEstatusAlerta INT,
		@tFechaEnvio DATETIME,
		@tFechaDesconexion DATETIME,
		@tBody VARCHAR(2000)

	SELECT @nEstatusAlerta = Estatus
		,@tFechaEnvio = FechaHoraEnvio
		,@tFechaDesconexion = FechaHoraDesconexion
	FROM ASWSch.ASWTraAlertasDev 
	WHERE Id=1


	DECLARE @Results TABLE(
		id int identity,
		line VARCHAR(500)
	)

	DECLARE @AllResults TABLE(
		id int identity,
		ip VARCHAR(15),
		line VARCHAR(500)
	)

	INSERT INTO @Results
	EXEC master..xp_cmdshell  'ping 192.168.8.115'

	;WITH cteResults AS(
		SELECT row_number() over(order by id) AS Id, line FROM @Results
	)
	INSERT INTO @AllResults
	SELECT '192.168.8.115' AS ip, line FROM cteResults WHERE Id = 3

	DELETE @Results

	INSERT INTO @Results
	EXEC master..xp_cmdshell  'ping 192.168.8.111'

	;WITH cteResults AS(
		SELECT row_number() over(order by id) AS Id, line FROM @Results
	)
	INSERT INTO @AllResults
	SELECT '192.168.8.111' AS ip, line FROM cteResults WHERE Id = 3

	DELETE @Results

	INSERT INTO @Results
	EXEC master..xp_cmdshell  'ping 192.168.8.113'

	;WITH cteResults AS(
		SELECT row_number() over(order by id) AS Id, line FROM @Results
	)
	INSERT INTO @AllResults
	SELECT '192.168.8.113' AS ip, line FROM cteResults WHERE Id = 3

	DELETE @Results

	SELECT * FROM @AllResults

	SET  @tBody = 'Ping results: '+CHAR(13)

	SELECT @tBody = @tBody + ip + ' | ' + line +CHAR(13)
	FROM @AllResults
	ORDER BY Id

	PRINT @tBody

	IF EXISTS (SELECT 1 FROM @AllResults WHERE line NOT LIKE '%TTL%')--no hay comunicación	
	BEGIN	
		IF @nEstatusAlerta = 0
		BEGIN
			EXEC msdb.dbo.sp_send_dbmail
				@profile_name = 'Avisor'
			   ,@recipients = 'mrodriguezc@deacero.com;josari@deacero.com'
			   ,@subject = 'Tablets comuntication lost'
			   ,@body = @tBody
			   ,@importance ='HIGH'

			UPDATE ASWSch.ASWTraAlertasDev
			SET Estatus = 1
				,FechaHoraEnvio = GETDATE()
				,FechaHoraDesconexion = GETDATE()
			WHERE Id=1

			INSERT INTO ASWSch.ASWTraMonitoreoTabletDev
			SELECT GETDATE() AS FechaHora
				,ip
				,line
				,CASE WHEN line NOT LIKE '%TTL%' THEN 0 ELSE 1 END AS Estatus
			FROM @AllResults
		END
		ELSE--@nEstatusAlerta = 1
		BEGIN
			IF DATEDIFF(Hour, @tFechaEnvio, GETDATE()) > 3
			BEGIN
				EXEC msdb.dbo.sp_send_dbmail
					@profile_name = 'Avisor'
				   ,@recipients = 'mrodriguezc@deacero.com;josari@deacero.com'
				   ,@subject = 'Tablets comuntication lost'
				   ,@body = @tBody
				   ,@importance ='HIGH'

				UPDATE ASWSch.ASWTraAlertasDev
				SET FechaHoraEnvio = GETDATE()
				WHERE Id=1
			END
			--ELSE
			--IF DATEPART(MINUTE, GETDATE())<15
			--BEGIN
			--	EXEC msdb.dbo.sp_send_dbmail
			--		@profile_name = 'Avisor'
			--	   ,@recipients = 'mrodriguezc@deacero.com;'
			--	   ,@subject = 'Tablets comuntication lost'
			--	   ,@body = @tBody
			--	   ,@importance ='HIGH'
			--END
		END
	END
	ELSE --si hay comunicacion
	BEGIN
		IF @nEstatusAlerta = 1
		BEGIN
			EXEC msdb.dbo.sp_send_dbmail
				@profile_name = 'Avisor'
				,@recipients = 'mrodriguezc@deacero.com;josari@deacero.com'
				,@subject = 'Tablets comuntication restored'
				,@body = @tBody
				,@importance ='HIGH'

			UPDATE ASWSch.ASWTraAlertasDev
			SET Estatus = 0
				,FechaHoraEnvio = GETDATE()
			WHERE Id=1

			INSERT INTO ASWSch.ASWTraMonitoreoTabletDev
			SELECT GETDATE() AS FechaHora
				,ip
				,line
				,CASE WHEN line NOT LIKE '%TTL%' THEN 0 ELSE 1 END AS Estatus
			FROM @AllResults
		END
	END
END
