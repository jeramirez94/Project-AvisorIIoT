USE [ASW]
GO

/****** Object:  Table [dbo].[RecoleccionAvisorUSA]    Script Date: 14/11/2022 10:10:56 a. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[RecoleccionAvisorUSA](
	[Speed_Header] [int] NULL,
	[Threader_Status] [int] NULL,
	[Collator_Status] [int] NULL,
	[Vision_Strip_Count] [int] NULL,
	[Vision_Strip_Rejectad] [int] NULL,
	[Robot_Status_Arm] [int] NULL,
	[Robot_Speed_Nail_Minutes] [int] NULL,
	[Robot_Nail_Production] [int] NULL,
	[Robot_Box_Production] [int] NULL,
	[Robot_Box_Completed] [int] NULL,
	[Robot_Batch_Completed] [int] NULL,
	[Robot_Count_Counter] [int] NULL,
	[Robot_Sensor_Counter] [int] NULL,
	[FechaHoraAvisor] [datetime] NULL,
	[IdCelda] [int] NULL,
	[Origen] [varchar](20) NULL,
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[Header_Status] [int] NULL
) ON [PRIMARY]
GO


