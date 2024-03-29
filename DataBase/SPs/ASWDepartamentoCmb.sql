USE [ASW]
GO
/****** Object:  StoredProcedure [AswSch].[ASWDepartamentoCmb]    Script Date: 17/01/2023 10:58:29 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
	--**********************************************
	--*Autor:MARTHA RODRIGUEZ CHAVEZ
	--*Fecha:09 Mar 2020
	--**********************************************
	--*----  exec ASWSch.ASWDepartamentoCmb '%',0 
	
	ALTER PROCEDURE [AswSch].[ASWDepartamentoCmb]  
			@psValor	varchar(100),		-- Texto a Buscar  
			@pnTipo		int,				-- 1=Buscar por la ClaveXxxxx  
			@pnModoSel	int = 1,			-- 1=Retorno Clave - Descripcion   <>1  Descripcion  
			@pnBajasSn	int = 0  
			   
	As    
	 
	BEGIN  
	       
		If (@psValor = '' OR @psValor is Null)  
			Select  TOP 500  ClaDepartamento= ClaDepartamento  
						, NomDepartamento=  case @pnModoSel when 1 then ltrim(rtrim(convert(varchar(150), ClaDepartamento))) + '-' + NomDepartamento Else NomDepartamento end  
			From ASWSch.AswCatDepartamentoVw
			Where ( isnull(BajaLogica, 0) != 1  or isnull(@pnBajasSn,0) = 1 )  
			    
	  Order By case  when @pnModoSel = 1 then   ClaDepartamento END,
			   CASE  WHEN  @pnModoSel = 2 THEN  NomDepartamento end  

		Else  
			If @pnTipo  in (1,99)   
				Select TOP 500  ClaDepartamento= ClaDepartamento  
						, NomDepartamento=  case @pnModoSel when 1 then ltrim(rtrim(convert(varchar(150), ClaDepartamento))) + '-' + NomDepartamento Else NomDepartamento end  
				From ASWSch.AswCatDepartamentoVw
				Where ( isnull(BajaLogica, 0) != 1  or isnull(@pnBajasSn,0) = 1 )  
				and  ClaDepartamento = @psValor    
				   
	  Order By case  when @pnModoSel = 1 then   ClaDepartamento END,
			   CASE  WHEN  @pnModoSel = 2 THEN  NomDepartamento end  
			Else  
			begin  
				      
					Select TOP 500  ClaDepartamento= ClaDepartamento  
						, NomDepartamento=  case @pnModoSel when 1 then ltrim(rtrim(convert(varchar(150), ClaDepartamento))) + '-' + NomDepartamento Else NomDepartamento end  
					From ASWSch.AswCatDepartamentoVw
					Where ( isnull(BajaLogica, 0) != 1  or isnull(@pnBajasSn,0) = 1 )  
					and  NomDepartamento like '%' + ltrim(rtrim(@psValor)) + '%'
					   
	  Order By case  when @pnModoSel = 1 then   ClaDepartamento END,
			   CASE  WHEN  @pnModoSel = 2 THEN  NomDepartamento end  
					  
			End  
	END  
	 
	