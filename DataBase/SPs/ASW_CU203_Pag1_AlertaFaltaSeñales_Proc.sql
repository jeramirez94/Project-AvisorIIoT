--USE [ASW]
--GO
/****** Object:  StoredProcedure [AswSch].[ASW_CU203_Pag1_AlertaFaltaSeñales_Proc]    Script Date: 15/11/2022 02:12:38 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROC [AswSch].[ASW_CU203_Pag1_AlertaFaltaSeñales_Proc]
AS
BEGIN
	DECLARE @señalesAnterior TABLE (IdCelda VARCHAR(30))
	DECLARE @señalesActual TABLE (IdCelda VARCHAR(30))

	DECLARE @today VARCHAR(10)
	DECLARE @yesterday VARCHAR(10)
	DECLARE @count INT

	SET @today = (SELECT CONVERT(char(10), GetDate(),126))
	SET @yesterday =(SELECT REPLACE(CONVERT(VARCHAR, DATEADD(dd, -1, GETDATE()), 102), '.', '-'))

	INSERT INTO @señalesAnterior SELECT DISTINCT IdCelda 
	FROM AswSch.AswBitSeñal
	WHERE FechaHoraAvisor >= ''+@yesterday+' 00:00:00' AND FechaHoraAvisor <= ''+@yesterday+' 23:59:59'

	INSERT INTO @señalesActual SELECT DISTINCT IdCelda 
	FROM AswSch.AswBitSeñal
	WHERE FechaHoraAvisor >= ''+@today+' 00:00:00' AND FechaHoraAvisor <= ''+@today+' 23:59:59'

	SET @count = (SELECT DISTINCT COUNT (a.IdCelda)
	FROM @señalesAnterior a LEFT JOIN @señalesActual b ON a.IdCelda = b.IdCelda
	WHERE b.IdCelda IS NULL)

	IF @count > 0
	BEGIN
	DECLARE @body_content nvarchar(max);
	SET @body_content = N'<style>
							td {
								  text-align: center;
								  vertical-align: middle;
							 }
						  </style>
						  <table width=100%><tr class="header" style="background-color:#304f60; font-family:Arial;color:#FFFFFF;font-size:18px;font-weight:bold;">    
							<th style="width: 60%; ">Alerta de pérdida de señales</th>
						  </table>
						  <table border="1" bordercolor="#eeeeee" width=100% style="table-layout: fixed; word-wrap: break-word; font-size:11px; padding:3px">
							<tr style="background-color:#DBDBDB; font-family:Arial; border-collapse:collapse; font-weight:550;">
								<th>IdCelda</th>
									<tr>
	  <tbody>' +
	CAST(
			(SELECT DISTINCT td = a.IdCelda, ''
			FROM @señalesAnterior a LEFT JOIN @señalesActual b ON a.IdCelda = b.IdCelda
			WHERE b.IdCelda IS NULL
			FOR XML PATH('tr'), TYPE   
			) AS nvarchar(max)
		) +
	  N'</tbody></tr>
	</table>';

	DECLARE @sPara VARCHAR(100);
				SELECT @sPara = Svalor1
				FROM AswSch.ASWCfgConfiguracion
				WHERE ClaConfiguracion = 15

	EXEC msdb.dbo.sp_send_dbmail
					@profile_name = 'Avisor'
					,@recipients = @sPara
					,@subject = 'Celdas sin señal'
					,@body = @body_content
					,@body_format = 'html'
					,@importance = 'HIGH'

	END
END