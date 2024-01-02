USE [ASW]
GO

/****** Object:  Table [AswSch].[AswBitSeñalTrace]    Script Date: 11/11/2022 04:11:46 p. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [AswSch].[AswBitSeñalTrace](
	[IdCelda] [int] NULL,
	[FechaHoraAvisor] [datetime] NULL,
	[net_transport] [varchar](250) NULL,
	[protocol_type] [varchar](250) NULL,
	[auth_scheme] [varchar](250) NULL,
	[local_net_address] [varchar](250) NULL,
	[local_tcp_port] [varchar](250) NULL,
	[client_net_address] [varchar](250) NULL
) ON [PRIMARY]
GO


