USE [ASW]
GO
/****** Object:  UserDefinedFunction [AswSch].[ASWSplitKeyFn]    Script Date: 14/11/2022 10:31:57 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


--*==============================================================
--*Objeto:		[ASWSch].[ASWSplitKeyFn]
--*Autor:		MRODRIGUEZC
--*Fecha:		21/06/2019
--*Objetivo:	Genera una tabla con valores separados por un delimitador
--*Entrada:
--*Salida:		
--*Precondiciones:
--*Revisiones:
--* SELECT Value FROM [ASWSch].[ASWSplitKeyFn]('1,2,3',',')
--*==============================================================
ALTER FUNCTION [AswSch].[ASWSplitKeyFn] (  
 @psString nvarchar (4000),  
 @psDelimiter nvarchar (10)  
 )  
returns @ValueTable TABLE (clave int IDENTITY(1,1), [Value] nvarchar(4000))  
BEGIN  
 DECLARE @sNextString nvarchar(4000)  
 DECLARE @nPos INT  
 DECLARE @nNextPos INT  
 DECLARE @sCommaCheck nvarchar(1)  
   
 --Inicializar  
 SET @sNextString = ''  
 SET @sCommaCheck = RIGHT(@psString,1)   
   
 --Checar por una coma, si no, INSERT  
 --if (@sCommaCheck <> @psDelimiter )  
 SET @psString = @psString + @psDelimiter  
   
 --Obtener posicin de la primera coma  
 SET @nPos = CHARINDEX(@psDelimiter,@psString)  
 SET @nNextPos = 1  
   
 --Iterar mientras exista coma en el string  
 WHILE (@nPos <>  0)    
 BEGIN  
  SET @sNextString = SUBSTRING(@psString, 1, @nPos - 1)  
   
  INSERT INTO @ValueTable ( [Value]) VALUES (@sNextString)  
   
  SET @psString = SUBSTRING(@psString, @nPos + 1, len(@psString))  
    
  set @nNextPos = @nPos  
  SET @nPos  = CHARINDEX(@psDelimiter, @psString)   
 END  
   
 RETURN  
END




