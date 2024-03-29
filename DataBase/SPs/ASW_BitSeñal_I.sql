--USE [ASW]
--GO
/****** Object:  StoredProcedure [AswSch].[ASW_BitSeñal_I]    Script Date: 14/11/2022 10:38:34 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


ALTER PROCEDURE [AswSch].[ASW_BitSeñal_I]
	@psIdCelda VARCHAR(30)
	--[Origen varchar](20) NULL,
	,@pnHeader_Status int
	,@pnHeader_Speed int
	,@pnHeader_Count int
	,@pnThreader_Status int
	,@pnCollator_Status int
	,@pnVision_Strip_Status int
	,@pnVision_Strip_Count int
	,@pnVision_Strip_Rejectad int
	,@pnRobot_Status int
	,@pnRobot_Speed int
	,@pnRobot_Nail_Production int
	,@pnRobot_Box_Production int
	,@pnRobot_Box_Completed_Count int = null
	,@pnFechaHoraAvisor Datetime
AS
BEGIN
	SET NOCOUNT ON
	
	INSERT INTO [AswSch].[AswBitSeñal](
		IdCelda 
		--[Origen varchar](20) NULL,
		,Header_Status 
		,Header_Speed 
		,Header_Count 
		,Threader_Status 
		,Collator_Status 
		,Vision_Strip_Status 
		,Vision_Strip_Count 
		,Vision_Strip_Rejectad 
		,Robot_Status 
		,Robot_Speed 
		,Robot_Nail_Production 
		,Robot_Box_Production 
		,Robot_Box_Completed_Count 
		,FechaHoraAvisor
	)
	VALUES(
		@psIdCelda 
		--[Origen varchar](20) NULL,
		,@pnHeader_Status 
		,@pnHeader_Speed 
		,@pnHeader_Count 
		,@pnThreader_Status 
		,@pnCollator_Status 
		,@pnVision_Strip_Status 
		,@pnVision_Strip_Count 
		,@pnVision_Strip_Rejectad 
		,@pnRobot_Status 
		,@pnRobot_Speed 
		,@pnRobot_Nail_Production 
		,@pnRobot_Box_Production 
		,@pnRobot_Box_Completed_Count 
		,@pnFechaHoraAvisor
	)

END
