USE [ASW]
GO
/****** Object:  StoredProcedure [AswSch].[ASWArticuloCmb]    Script Date: 15/11/2022 04:22:25 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
	--**********************************************
	--*Autor:MARTHA RODRIGUEZ CHAVEZ
	--*Fecha:09 Mar 2020
	--**********************************************
	--*----  exec ASWSch.ASWArticuloCmb '%',0 
	
	ALTER PROCEDURE [AswSch].[ASWArticuloCmb]  
			@psValor	varchar(100),		-- Texto a Buscar  
			@pnTipo		int,				-- 1=Buscar por la ClaveXxxxx  
			@pnModoSel	int = 1,			-- 1=Retorno Clave - Descripcion   <>1  Descripcion  
			@pnBajasSn	int = 0  
			   
	As    
	 
	BEGIN  
	       
		If (@psValor = '' OR @psValor is Null)  
			Select  TOP 500  ClaArticulo= ClaArticulo  
						, NomArticulo=  case @pnModoSel when 1 then ltrim(rtrim(convert(varchar(150), ClaveArticulo))) + '-' + NomArticulo Else NomArticulo end  
			From ASWSch.AswCatArticuloGeneral
			Where ( isnull(BajaLogica, 0) != 1  or isnull(@pnBajasSn,0) = 1 )  
			    
	  Order By case  when @pnModoSel = 1 then   ClaArticulo END,
			   CASE  WHEN  @pnModoSel = 2 THEN  NomArticulo end  

		Else  
			If @pnTipo  in (1,99)   
				Select TOP 500  ClaArticulo= ClaArticulo  
						, NomArticulo=  case @pnModoSel when 1 then ltrim(rtrim(convert(varchar(150), ClaveArticulo))) + '-' + NomArticulo Else NomArticulo end  
				From ASWSch.AswCatArticuloGeneral
				Where ( isnull(BajaLogica, 0) != 1  or isnull(@pnBajasSn,0) = 1 )  
				and  ClaArticulo = @psValor    
				   
	  Order By case  when @pnModoSel = 1 then   ClaArticulo END,
			   CASE  WHEN  @pnModoSel = 2 THEN  NomArticulo end  
			Else  
			begin  
				      
					Select TOP 500  ClaArticulo= ClaArticulo  
						, NomArticulo=  case @pnModoSel when 1 then ltrim(rtrim(convert(varchar(150), ClaveArticulo))) + '-' + NomArticulo Else NomArticulo end  
					From ASWSch.AswCatArticuloGeneral
					Where ( isnull(BajaLogica, 0) != 1  or isnull(@pnBajasSn,0) = 1 )  
					and  ClaveArticulo + '-' + NomArticulo like '%' + ltrim(rtrim(@psValor)) + '%'
					   
	  Order By case  when @pnModoSel = 1 then   ClaveArticulo END,
			   CASE  WHEN  @pnModoSel = 2 THEN  NomArticulo end  
					  
			End  
	END  
	 
	