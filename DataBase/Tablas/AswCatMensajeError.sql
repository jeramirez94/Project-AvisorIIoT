/****** Object:  Table [dbo].[AswCatMensajeError]    Script Date: 13/04/2023 09:34:38 p. m. ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [AswSch].[AswCatMensajeError](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Idioma] [varchar](20) NOT NULL,
	[ErrorKey] [varchar](50) NOT NULL,
	[Mensaje] [varchar](500) NOT NULL,
 CONSTRAINT [PK_AswCatMensajeError] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO


