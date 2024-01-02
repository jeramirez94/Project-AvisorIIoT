USE [ASW]
GO

/****** Object:  Table [dbo].[ProduccionClavosAvisor]    Script Date: 14/11/2022 10:12:16 a. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[ProduccionClavosAvisor](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdCelda] [int] NULL,
	[Header_Status] [varchar](20) NULL,
	[Header_Speed] [int] NULL,
	[Header_Production] [bigint] NULL,
	[Vision_Status] [varchar](20) NULL,
	[Vision_Strip_Count] [int] NULL,
	[Vision_Nails] [bigint] NULL,
	[Vision_Rejected] [int] NULL,
	[Rejected_Nails] [bigint] NULL,
	[FechaHoraRegistro] [datetime] NULL,
	[IdComponente] [int] NULL
) ON [PRIMARY]
GO


