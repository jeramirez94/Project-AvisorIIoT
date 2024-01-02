
ALTER TABLE [AswSch].[AswBitBitacoraParo]
ADD DEFAULT 0 FOR [ClaEventoCierre]
GO


ALTER TABLE [ASWSch].[ASWCatGpoParo]
ADD CONSTRAINT [PK_ASWCatGpoParo] PRIMARY KEY CLUSTERED 
(
	[ClaUbicacion] ASC,
	[ClaGpoParo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO

ALTER TABLE  [AswSch].[AswCatSeccionParo]
ADD CONSTRAINT [PK_AswCatSeccionParo] PRIMARY KEY CLUSTERED 
(
	[ClaSeccionParo] ASC,
	[ClaUbicacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO

ALTER TABLE [AswSch].[ASWCatTipoParo]
ADD CONSTRAINT [PK_ASWCatTipoParo] PRIMARY KEY CLUSTERED 
(
	[ClaTipoParo] ASC,
	[ClaUbicacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [AswSch].[ASWCatTipoParo]
ALTER COLUMN [ClaUsuarioMod] INT NULL
GO


ALTER TABLE [AswSch].[ASWCatTipoSeguimientoAlertaMCSW]
ADD CONSTRAINT [PK_ASWCatTipoSeguimientoAlertaMCSW] PRIMARY KEY CLUSTERED 
(
	[ClaTipoSeguimientoAlerta] ASC,
	[ClaUbicacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [AswSch].[ASWCatTipoSeguimientoAlertaMCSW]
ALTER COLUMN [ClaUbicacion] INT NOT NULL
GO
ALTER TABLE [AswSch].[ASWCatTipoSeguimientoAlertaMCSW]
ALTER COLUMN[ClaTipoSeguimientoAlerta]  INT NOT NULL
GO


ALTER TABLE [AswSch].[AswRelAlertaSeccionParoMCSW]
ALTER COLUMN [IdRelAlertaSeccionParo] [int] NOT NULL
GO
ALTER TABLE [AswSch].[AswRelAlertaSeccionParoMCSW]
ALTER COLUMN [ClaUbicacion] [int] NOT NULL
GO
ALTER TABLE [AswSch].[AswRelAlertaSeccionParoMCSW]
ALTER COLUMN [ClaSeccionParo] [int] NOT NULL
GO
ALTER TABLE [AswSch].[AswRelAlertaSeccionParoMCSW]
ADD CONSTRAINT [PK_AswRelAlertaSeccionParoMCSW] PRIMARY KEY CLUSTERED 
(
	[IdRelAlertaSeccionParo] ASC,
	[ClaUbicacion] ASC,
	[ClaSeccionParo] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO



ALTER TABLE [AswSch].[AswRelAlertaTipoSeguimientoAlertaMCSW]
ALTER COLUMN [ClaUbicacion] [int] NOT NULL
GO
ALTER TABLE [AswSch].[AswRelAlertaTipoSeguimientoAlertaMCSW]
ALTER COLUMN [ClaAlerta] [int] NOT NULL
GO
ALTER TABLE [AswSch].[AswRelAlertaTipoSeguimientoAlertaMCSW]
ADD CONSTRAINT [PK_AswRelAlertaTipoSeguimientoAlertaMCSW] PRIMARY KEY CLUSTERED 
(
	[ClaUbicacion] ASC,
	[ClaAlerta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO

ALTER TABLE [AswSch].[AswRelDeployRecursoCelda]
DROP COLUMN  [VersionEnviar]
GO
----




ALTER TABLE [AswSch].[ASWRelTipoParoGpoParo]
ALTER COLUMN [IdTipoParoGpoParo] [int] NOT NULL
GO 
ALTER TABLE [AswSch].[ASWRelTipoParoGpoParo]
ALTER COLUMN [ClaTipoParo] [int] NOT NULL
GO 
ALTER TABLE [AswSch].[ASWRelTipoParoGpoParo]
ALTER COLUMN [ClaUbicacion] [int] NOT NULL
GO
ALTER TABLE [AswSch].[ASWRelTipoParoGpoParo]
ADD CONSTRAINT [PK_ASWRelTipoParoGpoParo] PRIMARY KEY CLUSTERED 
(
	[IdTipoParoGpoParo] ASC,
	[ClaTipoParo] ASC,
	[ClaUbicacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO


ALTER TABLE [AswSch].[TraReporteProduccionMCSW]
ALTER COLUMN [ClaTurno]            SMALLINT        NOT NULL
GO
ALTER TABLE [AswSch].[TraReporteProduccionMCSW]
ADD [EnvioCorreoSN]       INT             NULL
GO






RETURN

select schema_name(tab.schema_id) as [schema_name], 
    pk.[name] as pk_name,
    ic.index_column_id as column_id,
    col.[name] as column_name, 
    tab.[name] as table_name
from sys.tables tab
    inner join sys.indexes pk
        on tab.object_id = pk.object_id 
        and pk.is_primary_key = 1
    inner join sys.index_columns ic
        on ic.object_id = pk.object_id
        and ic.index_id = pk.index_id
    inner join sys.columns col
        on pk.object_id = col.object_id
        and col.column_id = ic.column_id
order by schema_name(tab.schema_id),
    pk.[name],
    ic.index_column_id