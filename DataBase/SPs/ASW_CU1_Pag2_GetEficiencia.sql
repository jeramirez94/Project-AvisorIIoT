--USE [ASW]
--GO
/****** Object:  StoredProcedure [AswSch].[ASW_CU1_Pag2_GetEficiencia]    Script Date: 14/11/2022 10:41:42 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
ALTER PROCEDURE [AswSch].[ASW_CU1_Pag2_GetEficiencia] @fromDate DATETIME, @toDate DATETIME, @celda VARCHAR(30), @componente varchar(30) 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	;with tablatemporal as(SELECT	CASE WHEN MAX(Robot_Nail_Production) / CASE WHEN ((DATEDIFF(MINUTE, MIN(fechaHoraAvisor), MAX(fechaHoraAvisor))) * AVG(Robot_SPEED)) = 0 THEN - 1 ELSE ((DATEDIFF(MINUTE, MIN(fechaHoraAvisor), MAX(fechaHoraAvisor))) * AVG(Robot_SPEED)) end <= 0 THEN 0 ELSE MAX(Robot_Nail_Production) / CASE WHEN ((DATEDIFF(MINUTE, MIN(fechaHoraAvisor), MAX(fechaHoraAvisor))) * AVG(Robot_SPEED)) = 0 THEN - 1 ELSE ((DATEDIFF(MINUTE, MIN(fechaHoraAvisor), MAX(fechaHoraAvisor))) * AVG(Robot_SPEED)) end END  as 'Eficiencia'
  FROM [ASW].[AswSch].[AswBitSeñal]
WHERE
  IdCelda = @celda
  and FechaHoraAvisor >= @fromDate and FechaHoraAvisor <= @toDate),
  tablatemporal2 as (
  SELECT
  DATEDIFF(SECOND, MIN(aswbs.FechaHoraAvisor), MAX(aswbs.FechaHoraAvisor)) as 'Segundos Disponible'
  
FROM
  [ASW].[AswSch].[AswBitSeñal] aswbs

WHERE
	aswbs.IdCelda = @celda
   and aswbs.FechaHoraAvisor >= @fromDate and aswbs.FechaHoraAvisor <= @toDate

  )

SELECT CONCAT('Eficiencia de Celda #', CONVERT(VARCHAR, aswcc.ClaveWorkCenter)) ,(tt1.Eficiencia) 
FROM tablatemporal tt1
JOIN [AswSch].[AswCatWorkCenterVw] aswcc 
ON aswcc.IdWorkCenter =  @celda

END
