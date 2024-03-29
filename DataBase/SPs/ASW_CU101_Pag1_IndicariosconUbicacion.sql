USE [ASW]
GO
/****** Object:  StoredProcedure [AswSch].[ASW_CU101_Pag1_IndicariosconUbicacion]    Script Date: 14/11/2022 12:56:08 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [AswSch].[ASW_CU101_Pag1_IndicariosconUbicacion] @Celda INT, @idUbicacion INT, @sDate DATETIME, @sDate2 DATETIME

AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	;with tablatemporal as(SELECT Robot_Speed as 'Velocidad' ,
DATEDIFF(SECOND, LAG(FechaHoraAvisor) OVER (ORDER BY FechaHoraAvisor), FechaHoraAvisor) AS 'Segundos en Paro'
FROM [ASW].[AswSch].[AswBitSeñal]
WHERE
  IdCelda = @Celda
  and FechaHoraAvisor >= @sDate and FechaHoraAvisor <= @sDate2),
  tablatemporal2 as (
  SELECT
  DATEDIFF(SECOND, MIN(aswbs.FechaHoraAvisor), MAX(aswbs.FechaHoraAvisor)) as 'Segundos Disponible'
  
FROM
  [ASW].[AswSch].[AswBitSeñal] aswbs

WHERE
	aswbs.IdCelda = @Celda
   and aswbs.FechaHoraAvisor >= @sDate and aswbs.FechaHoraAvisor <= @sDate2

  )

SELECT (tt2.[Segundos Disponible]-(SELECT SUM([Segundos en Paro]) FROM tablatemporal WHERE Velocidad <= 5))*100 / tt2.[Segundos Disponible] FROM tablatemporal2 tt2;
    -- Insert statements for procedure here
end
