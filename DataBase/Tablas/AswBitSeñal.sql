USE [ASW]
GO

/****** Object:  Table [dbo].[RecoleccionAvisorUSA]    Script Date: 12/04/2022 05:36:59 p. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [AswSch].[AswBitSeñal](
	[id] [bigint] PRIMARY KEY IDENTITY(1,1),	
	[IdCelda] [varchar](30) NOT NULL,
	--[Origen] [varchar](20) NULL,
	[Header_Status] [int] NULL,
	[Header_Speed] [int] NULL,
	[Header_Count] [int] NULL,
	[Threader_Status] [int] NULL,
	[Collator_Status] [int] NULL,
	[Vision_Strip_Status] [int] NULL,
	[Vision_Strip_Count] [int] NULL,
	[Vision_Strip_Rejectad] [int] NULL,
	[Robot_Status] [int] NULL,
	[Robot_Speed] [int] NULL,
	[Robot_Nail_Production] [int] NULL,
	[Robot_Box_Production] [int] NULL,
	[Robot_Box_Completed_Count] [int] NULL,
	[FechaHoraAvisor] [datetime] NULL,
	[FechaServidorBD]  [datetime] default(getdate())
) ON [Bitacora]
GO


GO
CREATE NONCLUSTERED INDEX Idx_IdCelda_FechaHoraAvisor_HeaderStatus_ThreaderStatus_CollatorStatus_RobotStatus ON [AswSch].[AswBitSeñal](IdCelda,FechaHoraAvisor,Header_Status,Threader_Status,Collator_Status,Robot_Status)
GO