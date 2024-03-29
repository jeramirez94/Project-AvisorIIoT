--USE [ASW]
--GO
/****** Object:  StoredProcedure [AswSch].[ASW_CU161_Pag1_Configuraciones_Sel]    Script Date: 15/11/2022 12:06:08 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*==========================================
* CU: 161.1
* Descripción: Concentrar las configuraciones requeridas para la tablet
*			 y devolverlas en una consulta. 
* Autor: ngalaz
* Fecha: 2020-05-20
* EXEC: [AswSch].[ASW_CU161_Pag1_Configuraciones_Sel] 'T-04'
*========================================== */

/*DEBE INSERTAR EN ESTA TABLA TEMPORAL LAS CONFIGURACIONES QUE SE REQUIERAN
* DESCARGAR EN LA TABLET
*/
ALTER PROC [AswSch].[ASW_CU161_Pag1_Configuraciones_Sel] 
	@PsIdWorkCenter VARCHAR(30) 
AS
BEGIN

DECLARE  @nClaUbicacionDefault INT
		,@nClaArea INT

SELECT @nClaUbicacionDefault = Valor1
FROM [AswSch].[ASWCfgConfiguracion]
WHERE ClaConfiguracion = 1

--Equivale a ClaArea
SELECT @nClaArea = ClaArea
FROM [AswSch].[AswCatWorkCenterVw]
WHERE IdWorkCenter = @PsIdWorkCenter


DECLARE @Tmp_Conf_RB TABLE( 
	ClaUbicacion       INT           NOT NULL,
    ClaveConfiguracion VARCHAR (15)  NOT NULL ,
    DescConfiguracion  VARCHAR (250) NOT NULL,
    Valor1             INT,
    Valor2             INT,
    Valor3             INT,
    Svalor1            VARCHAR (250),
    Svalor2            VARCHAR (250),
    Svalor3            VARCHAR (250),
    Numero1            FLOAT,
    Numero2            FLOAT,
    Numero3            FLOAT,
    Fecha1             DATETIME,
    Fecha2             DATETIME,
    Fecha3             DATETIME,
    FechaUltimaMod     DATETIME,
    NombrePcMod        VARCHAR (64)  NOT NULL,
    ClaUsuarioMod      INT           NOT NULL,
    BajaLogica         INT           NOT NULL DEFAULT 0,
    FechaBajaLogica    DATETIME,
    EsLocal            INT DEFAULT 0, -- 0 para configuracion general - 1 para configuracion local
	IdWorkCenter            VARCHAR(30)  --si es local especificar celda
	)


INSERT INTO @Tmp_Conf_RB(
	 ClaUbicacion
	,ClaveConfiguracion 
	,DescConfiguracion 
	,Valor1
	,Valor2
	,Valor3
	,Svalor1
	,Svalor2
	,Svalor3
	,Numero1
	,Numero2
	,Numero3
	,Fecha1
	,Fecha2
	,Fecha3
	,FechaUltimaMod
	,NombrePcMod
	,ClaUsuarioMod
	,BajaLogica
	,FechaBajaLogica
	,EsLocal
	,IdWorkCenter)
SELECT ClaUbicacion
      ,ClaveConfiguracion 
      ,DescConfiguracion 
      ,Valor1
      ,Valor2
      ,Valor3
      ,Svalor1
      ,Svalor2
      ,Svalor3
      ,Numero1
      ,Numero2
      ,Numero3
      ,Fecha1
      ,Fecha2
      ,Fecha3
      ,FechaUltimaMod
      ,NombrePcMod
      ,ClaUsuarioMod
      ,BajaLogica
      ,FechaBajaLogica
	  ,0 --NO LOCALES
	  ,null
FROM [AswSch].[ASWCfgConfiguracion]
WHERE ClaveConfiguracion is not null
AND BajaLogica = 0

INSERT INTO @Tmp_Conf_RB(
	 ClaUbicacion
	,ClaveConfiguracion 
	,DescConfiguracion 
	,Valor1
	,FechaUltimaMod
	,NombrePcMod
	,ClaUsuarioMod
	,BajaLogica
	,FechaBajaLogica
	,EsLocal
	,IdWorkCenter)
SELECT ClaUbicacion = @nClaUbicacionDefault
	  ,ClaveConfiguracion = 'ES_SUPER_CELDA'
	  ,DescConfiguracion  = 'Es Super Celda'
	  ,Valor1 = EsSuperCelda
	  ,FechaUltimaMod  = FechaUltimaMod
	  ,NombrePcMod     = ''
	  ,ClaUsuarioMod   = 0
	  ,BajaLogica      = BajaLogica
	  ,FechaBajaLogica = FechaBajaLogica
	  ,EsLocal = 1
	  ,IdWorkCenter = IdWorkCenter
FROM ASWSch.AswCatWorkCenterVw cel
WHERE IdWorkCenter = @PsIdWorkCenter

INSERT INTO @Tmp_Conf_RB(
	 ClaUbicacion
	,ClaveConfiguracion 
	,DescConfiguracion 
	,Valor1
	,Valor2
	,FechaUltimaMod
	,NombrePcMod
	,ClaUsuarioMod
	,BajaLogica
	,FechaBajaLogica
	,EsLocal
	,IdWorkCenter)
SELECT 
ClaUbicacion = @nClaUbicacionDefault
,ClaveConfiguracion = 'CAPACIDAD_CELDA'
,DescConfiguracion = 'Capacidad NPM, NPH'
,Valor1 = (ISNULL(NPM,0)+ISNULL(NPM2,0)+ISNULL(NPM3,0)) * CASE WHEN ISNULL(CantWafios,0) <> 0 THEN CantWafios ELSE 1 END
,Valor2 = (ISNULL(NPM,0)+ISNULL(NPM2,0)+ISNULL(NPM3,0)) * CASE WHEN ISNULL(CantWafios,0) <> 0 THEN CantWafios ELSE 1 END * 60
,FechaUltimaMod = FechaUltimaMod
,NombrePcMod     = ''
,ClaUsuarioMod   = 0
,BajaLogica      = BajaLogica
,FechaBajaLogica = FechaBajaLogica
,EsLocal = 1
,IdWorkCenter = IdWorkCenter
FROM ASWSch.AswCatWorkCenterVw
WHERE IdWorkCenter = @PsIdWorkCenter

/*------NumDepartamento/Area------*/
INSERT INTO @Tmp_Conf_RB(
	 ClaUbicacion
	,ClaveConfiguracion 
	,DescConfiguracion 
	,Valor1
	,FechaUltimaMod
	,NombrePcMod
	,ClaUsuarioMod
	,BajaLogica
	,FechaBajaLogica
	,EsLocal
	,IdWorkCenter)
SELECT 
ClaUbicacion = @nClaUbicacionDefault
,ClaveConfiguracion = 'CLA_AREA_PAL'
,DescConfiguracion = 'Area sistema PAL, correspondiente al departamento'
,Valor1 = ClaDepartamento
,FechaUltimaMod = FechaUltimaMod
,NombrePcMod     = ''
,ClaUsuarioMod   = 0
,BajaLogica      = BajaLogica
,FechaBajaLogica = FechaBajaLogica
,EsLocal = 1
,IdWorkCenter = IdWorkCenter
FROM ASWSch.AswCatWorkCenterVw
WHERE IdWorkCenter = @PsIdWorkCenter

/*----------Limite de velocidad--------------*/
--TODO: obtener limite de velocidad
INSERT INTO @Tmp_Conf_RB(
	 ClaUbicacion
	,ClaveConfiguracion 
	,DescConfiguracion 
	,Valor1
	,Valor2
	,FechaUltimaMod
	,NombrePcMod
	,ClaUsuarioMod
	,BajaLogica
	,FechaBajaLogica
	,EsLocal
	,IdWorkCenter)
SELECT 
ClaUbicacion = @nClaUbicacionDefault
,ClaveConfiguracion = 'SPEED_LIMIT'
,DescConfiguracion = 'limite inferior de velocidad NPM, NPH'
,Valor1 = (ISNULL(NPM,0)+ISNULL(NPM2,0)+ISNULL(NPM3,0)) * CASE WHEN ISNULL(CantWafios,0) <> 0 THEN CantWafios ELSE 1 END * 0.6
,Valor2 = (ISNULL(NPM,0)+ISNULL(NPM2,0)+ISNULL(NPM3,0)) * CASE WHEN ISNULL(CantWafios,0) <> 0 THEN CantWafios ELSE 1 END * 60 * 0.6
,FechaUltimaMod = FechaUltimaMod
,NombrePcMod     = ''
,ClaUsuarioMod   = 0
,BajaLogica      = BajaLogica
,FechaBajaLogica = FechaBajaLogica
,EsLocal = 1
,IdWorkCenter = IdWorkCenter
FROM ASWSch.AswCatWorkCenterVw
WHERE IdWorkCenter = @PsIdWorkCenter

/*-------SECCION PARO AUTOJUSTIFICACION-------*/
INSERT INTO @Tmp_Conf_RB(
	 ClaUbicacion
	,ClaveConfiguracion 
	,DescConfiguracion 
	,Valor1
	,FechaUltimaMod
	,NombrePcMod
	,ClaUsuarioMod
	,BajaLogica
	,FechaBajaLogica
	,EsLocal
	,IdWorkCenter)
SELECT 
 ClaUbicacion = @nClaUbicacionDefault
,ClaveConfiguracion = 'AUTOJUSTIFICA'
,DescConfiguracion = 'Seccion paro para autojustificar'
,Valor1 = SeccionParo 
,FechaUltimaMod = FechaUltimaMod
,NombrePcMod     = ''
,ClaUsuarioMod   = 0
,BajaLogica      = BajaLogica
,FechaBajaLogica = FechaBajaLogica
,EsLocal = 1
,IdWorkCenter = @PsIdWorkCenter
FROM [AswSch].[AswCfgParametrosOperacion]
WHERE ClaArea = @nClaArea


/*-------Torreta de desempeño-------*/
INSERT INTO @Tmp_Conf_RB(
	 ClaUbicacion
	,ClaveConfiguracion 
	,DescConfiguracion 
	,Valor1
	,Valor2
	,Valor3
	,FechaUltimaMod
	,NombrePcMod
	,ClaUsuarioMod
	,BajaLogica
	,FechaBajaLogica
	,EsLocal
	,IdWorkCenter)
SELECT 
 ClaUbicacion = @nClaUbicacionDefault
,ClaveConfiguracion = 'PERFORM_LIGHT'
,DescConfiguracion = 'configuracion de limites inferiores para torreta de desempeño'
,Valor1 = DesempenoVerde
,Valor2 = DesempenoAmarillo
,Valor3 = DesempenoRojo
,FechaUltimaMod = FechaUltimaMod
,NombrePcMod     = ''
,ClaUsuarioMod   = 0
,BajaLogica      = BajaLogica
,FechaBajaLogica = FechaBajaLogica
,EsLocal = 1
,IdWorkCenter = @PsIdWorkCenter
FROM [AswSch].[AswCfgParametrosOperacion]
WHERE ClaArea = @nClaArea

/*Clave Celda*/
INSERT INTO @Tmp_Conf_RB(
	 ClaUbicacion
	,ClaveConfiguracion 
	,DescConfiguracion 
	,Svalor1
	,FechaUltimaMod
	,NombrePcMod
	,ClaUsuarioMod
	,BajaLogica
	,FechaBajaLogica
	,EsLocal
	,IdWorkCenter)
SELECT @nClaUbicacionDefault
,ClaveConfiguracion = 'CLAVE_CELDA'
,DescConfiguracion = 'CLAVE DE LA CELDA'
,Svalor1 = ClaveWorkCenter
,FechaUltimaMod = FechaUltimaMod
,NombrePcMod = '' 
,ClaUsuarioMod = 0
,BajaLogica = BajaLogica
,FechaBajaLogica = FechaBajaLogica
,EsLocal = 1
,IdWorkCenter = @PsIdWorkCenter
FROM AswSch.AswCatWorkCenterVw 
WHERE  IdWorkCenter = @PsIdWorkCenter

/*Tipo Celda*/
INSERT INTO @Tmp_Conf_RB(
	 ClaUbicacion
	,ClaveConfiguracion 
	,DescConfiguracion 
	,Valor1
	,Svalor1
	,FechaUltimaMod
	,NombrePcMod
	,ClaUsuarioMod
	,BajaLogica
	,FechaBajaLogica
	,EsLocal
	,IdWorkCenter)
SELECT @nClaUbicacionDefault
,ClaveConfiguracion = 'TIPO_CELDA'
,DescConfiguracion = 'TIPO DE LA CELDA'
,Valor1 = WC.ClaArea
,Svalor1 = LTRIM(RTRIM(NomArea))
,FechaUltimaMod = WC.FechaUltimaMod
,NombrePcMod = '' 
,ClaUsuarioMod = 0
,BajaLogica = WC.BajaLogica
,FechaBajaLogica = WC.FechaBajaLogica
,EsLocal = 1
,IdWorkCenter = @PsIdWorkCenter
FROM AswSch.AswCatWorkCenterVw WC
LEFT JOIN [AswSch].[AswCatAreaVw] A
	ON WC.ClaArea = A.ClaArea
WHERE  IdWorkCenter = @PsIdWorkCenter



/*Tipo de scrap*/
DECLARE @sTipoScrap VARCHAR(250)

SELECT @sTipoScrap = COALESCE(@sTipoScrap + ',','') + NomTipoScrapCeldaIngles
FROM [AswSch].[AswCatTipoScrapCelda]
WHERE BajaLogica = 0

INSERT INTO @Tmp_Conf_RB(
	 ClaUbicacion
	,ClaveConfiguracion 
	,DescConfiguracion 
	,Svalor1
	,FechaUltimaMod
	,NombrePcMod
	,ClaUsuarioMod)
SELECT @nClaUbicacionDefault
,ClaveConfiguracion = 'SCRAP_TYPE'
,DescConfiguracion = 'Tipo de scrap de la celda'
,Svalor1 = @sTipoScrap
,FechaUltimaMod = GETDATE()
,NombrePcMod = 'cfg' 
,ClaUsuarioMod = 0

/*Intervalo de tiempo para agrupar paros*/
DECLARE @nTiempoMinutosAgrupaParo INT = 3

INSERT INTO @Tmp_Conf_RB(
	 ClaUbicacion
	,ClaveConfiguracion 
	,DescConfiguracion 
	,Valor1
	,FechaUltimaMod
	,NombrePcMod
	,ClaUsuarioMod)
SELECT @nClaUbicacionDefault
,ClaveConfiguracion = 'GROUPING_TIME'
,DescConfiguracion = 'Intervalo de tiempo para agrupar paros'
,Valor1 = @nTiempoMinutosAgrupaParo
,FechaUltimaMod = GETDATE()
,NombrePcMod = 'cfg' 
,ClaUsuarioMod = 0



/*SELECT FINAL*/

--SI ES LOCAL DEBE ESPECIFICAR LA CELDA A LA QUE CORRESPONDE LA CONFIGURACION
--SI NO ES LOCAL IdWorkCenter DEBE SER NULL

SELECT
	  nombretabla = 'ASWLite_CfgConfiguracion'
	  ,keys = 'ClaUbicacion,ClaveConfiguracion'
	  ,fuc = 'FechaUltimaMod'
	  ,ClaUbicacion
	  ,ClaveConfiguracion 
	  ,DescConfiguracion 
	  ,Valor1
	  ,Valor2
	  ,Valor3
	  ,Svalor1
	  ,Svalor2
	  ,Svalor3
	  ,Numero1
	  ,Numero2
	  ,Numero3
	  ,convert(varchar,Fecha1,121)as Fecha1
	  ,convert(varchar,Fecha2,121)as Fecha2
	  ,convert(varchar,Fecha3,121)as Fecha3
	  ,convert(varchar,getdate(),121) as FechaUltimaMod
	  ,NombrePcMod
	  ,ClaUsuarioMod
	  ,BajaLogica
	  ,convert(varchar,FechaBajaLogica,121) as FechaBajaLogica
	  ,EsLocal
	  ,IdWorkCenter AS IdCelda
FROM @Tmp_Conf_RB tmp
WHERE  (ISNULL(tmp.EsLocal,0) = 0 AND tmp.IdWorkCenter IS NULL)
	OR (ISNULL(tmp.EsLocal,0) = 1  AND tmp.IdWorkCenter = @PsIdWorkCenter)

END

