USE [master]
GO
/****** Object:  StoredProcedure [dbo].[sp_utilerias_getfecha]    Script Date: 26/08/2020 10:27:19 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE  proc [dbo].[sp_utilerias_getfecha]
as
	select getdate()
	
GO
/****** Object:  StoredProcedure [dbo].[sp_utilerias_select]    Script Date: 26/08/2020 10:27:19 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE procedure [dbo].[sp_utilerias_select]
	( @aux1 char(500),    @aux2 char(500)='', @aux3 char(500)='', @aux4 char(500)='',
	  @aux5 char(500)='', @aux6 char(500)='', @aux7 char(500)='', @aux8 char(500)='',
	  @aux9 char(500)='', @aux10 char(500)='' )
as
begin
	Exec ( 'select ' + @aux1 + @aux2 + @aux3 + @aux4 + @aux5 + @aux6 + @aux7 + @aux8 + @aux9 + @aux10 )
end

GO
