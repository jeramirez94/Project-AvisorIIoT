USE [ASW]
GO
/****** Object:  StoredProcedure [AswSch].[ASW_CU102_Pag1_FragmentarVisionSystem]    Script Date: 14/11/2022 01:14:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [AswSch].[ASW_CU102_Pag1_FragmentarVisionSystem] @celda INT, @fromdate DATETIME, @toDate DATETIME
AS
BEGIN
	;WITH t1 as (SELECT
  MAX(fechaHoraAvisor) as time,
  MAX(Vision_Strip_Count) as 'Quantity',
  MAX(Vision_Strip_Rejectad) as 'Reject'
FROM
  [ASW].[AswSch].[AswBitSeñal]
WHERE
  fechaHoraAvisor >= @fromDate and fechaHoraAvisor <= @toDate and IdCelda = @celda
GROUP BY DATEPART(MONTH,fechaHoraAvisor), DATEPART(DAY, fechaHoraAvisor), DATEPART(HOUR, fechaHoraAvisor)
)

  SELECT time as time, CASE WHEN (Quantity - (LAG(Quantity) OVER (ORDER BY time ASC))) < 0 THEN Quantity ELSE (Quantity - (LAG(Quantity) OVER (ORDER BY time ASC))) END  as 'Quantity',
		CASE WHEN (Reject - (LAG(Reject) OVER (ORDER BY time ASC))) < 0 THEN Reject ELSE (Reject - (LAG(Reject) OVER (ORDER BY time ASC))) END as 'Rejected'
  FROM t1

END
