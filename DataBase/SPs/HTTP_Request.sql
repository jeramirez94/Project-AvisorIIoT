USE [ASW]
GO
/****** Object:  StoredProcedure [dbo].[HTTP_Request]    Script Date: 15/11/2022 04:40:44 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER procedure [dbo].[HTTP_Request]( @sUrl varchar(200))
As


Declare
@obj int
,@hr int
,@msg varchar(255)


 exec @hr = sp_OACreate 'MSXML2.ServerXMLHttp', @obj OUT
if @hr <> 0 begin Raiserror('sp_OACreate MSXML2.ServerXMLHttp.3.0
failed', 16,1) return end


exec @hr = sp_OAMethod @obj, 'open', NULL, 'GET', @sUrl, false
if @hr <>0 begin set @msg = 'sp_OAMethod Open failed' goto eh end


exec @hr = sp_OAMethod @obj, 'setRequestHeader', NULL, 'Content-Type',
'application/x-www-form-urlencoded'
if @hr <>0 begin set @msg = 'sp_OAMethod setRequestHeader failed' goto
eh end

EXEC @hr=sp_OAGetProperty @Obj,'responseBody',@msg OUTPUT
  

exec @hr = sp_OAMethod @obj, send, NULL, ''
if @hr <>0 begin set @msg = 'sp_OAMethod Send failed' goto eh end

 exec @hr = sp_OADestroy @obj

 print @msg
return
eh:
exec @hr = sp_OADestroy @obj
Raiserror(@msg, 16, 1)
return
