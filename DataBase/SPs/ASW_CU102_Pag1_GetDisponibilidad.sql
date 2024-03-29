--USE [ASW]
--GO
/****** Object:  StoredProcedure [AswSch].[ASW_CU102_Pag1_GetDisponibilidad]    Script Date: 14/11/2022 01:16:14 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [AswSch].[ASW_CU102_Pag1_GetDisponibilidad] @celda INT, @fromdate DATETIME, @todate DATETIME
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	DECLARE @@globalEfi REAL;
	
;with tablatemporal as(SELECT Robot_Speed as 'Velocidad' ,
DATEDIFF(SECOND, LAG(FechaHoraAvisor) OVER (ORDER BY FechaHoraAvisor), FechaHoraAvisor) AS 'Segundos en Paro'
FROM [ASW].[AswSch].[AswBitSeñal]
WHERE
  IdCelda = @celda
  and FechaHoraAvisor >= @fromdate and FechaHoraAvisor <= @todate),
  tablatemporal2 as (
  SELECT
  DATEDIFF(SECOND, MIN(aswbs.FechaHoraAvisor), MAX(aswbs.FechaHoraAvisor)) as 'Segundos Disponible'
  
FROM
  [ASW].[AswSch].[AswBitSeñal] aswbs

WHERE
	aswbs.IdCelda = @celda
   and aswbs.FechaHoraAvisor >= @fromdate AND aswbs.FechaHoraAvisor <= @todate

  )

SELECT @@globalEfi = (SELECT (tt2.[Segundos Disponible]-(SELECT SUM([Segundos en Paro]) FROM tablatemporal 

WHERE Velocidad <= 5))*100 / tt2.[Segundos Disponible] FROM tablatemporal2 tt2)


END
BEGIN
	;with tablatemporal as(SELECT	 (MAX(Robot_Nail_Production) - MIN(Robot_Nail_Production))  / 
	((CASE WHEN MAX(aswcc.NPM) IS NULL THEN 0 ELSE MAX(aswcc.NPM) END +
  CASE WHEN MAX(aswcc.NPM2) IS NULL THEN 0 ELSE MAX(aswcc.NPM2) END +
  CASE WHEN MAX(aswcc.NPM3) IS NULL THEN 0 ELSE MAX(aswcc.NPM3) END) * MAX(aswcc.CantWafios))*1440   as 'Eficiencia'
  FROM [AswSch].[AswBitSeñal]
  join [AswSch].[AswCatWorkCenterVw] aswcc
on aswcc.IdWorkCenter = @celda

  and FechaHoraAvisor >= @fromdate and FechaHoraAvisor <= @todate),
  tablatemporal2 as (
  SELECT
  DATEDIFF(SECOND, MIN(aswbs.FechaHoraAvisor), MAX(aswbs.FechaHoraAvisor)) as 'Segundos Disponible'
  
FROM
  [ASW].[AswSch].[AswBitSeñal] aswbs


WHERE
	aswbs.IdCelda = @celda
   and aswbs.FechaHoraAvisor >= @fromdate and aswbs.FechaHoraAvisor <= @todate

  )

SELECT CONCAT('Celda #', CONVERT(VARCHAR, aswcc.ClaveWorkCenter)), CASE WHEN @@globalEfi <= 0 OR @@globalEfi IS NULL THEN 0 ELSE (SELECT @@globalEfi) END as 'Disponibilidad', CASE WHEN @@globalEfi <= 0 OR @@globalEfi IS NULL THEN 0 ELSE (tt1.Eficiencia)/100000 END as 'Eficiencia' FROM tablatemporal tt1
JOIN [AswSch].[AswCatWorkCenterVw] aswcc ON aswcc.IdWorkCenter =  @celda

END

