USE [ASW]
GO
/****** Object:  StoredProcedure [AswSch].[ASWProduccionInicioCmb]    Script Date: 15/11/2022 04:27:09 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



  --  exec ASWSch.ASWDepartamentoCmb '%',0 

--EXEC  ASWSch.ASWProduccionInicioCmb '%',0 
ALTER PROCEDURE [AswSch].[ASWProduccionInicioCmb]
			@psValor	varchar(100),		-- Texto a Buscar  
			@pnTipo		int,				-- 1=Buscar por la ClaveXxxxx  
			@pnModoSel	int = 1,			-- 1=Retorno Clave - Descripcion   <>1  Descripcion  
			@pnBajasSn	int = 0  
	As    
	 
	BEGIN  
	       
		If (@psValor = '' OR @psValor is Null)  
			Select  TOP 500 ClaProduccionInicio= ClaProduccionInicio  
						, NomProduccionInicio=  case @pnModoSel when 1 then ltrim(rtrim(convert(varchar(150), ClaProduccionInicio))) + '-' + NomProduccionInicio Else NomProduccionInicio end  
			From AswSch.AswCatProduccionInicio
			Where ( isnull(BajaLogica, 0) != 1  or isnull(@pnBajasSn,0) = 1 )  
			    
	  Order By case  when @pnModoSel = 1 then   ClaProduccionInicio END,
			   CASE  WHEN  @pnModoSel = 2 THEN  NomProduccionInicio end  

		Else  
			If @pnTipo  in (1,99)   
				Select TOP 500  ClaProduccionInicio= ClaProduccionInicio  
						, NomProduccionInicio=  case @pnModoSel when 1 then ltrim(rtrim(convert(varchar(150), ClaProduccionInicio))) + '-' + NomProduccionInicio Else NomProduccionInicio end  
				From AswSch.AswCatProduccionInicio
				Where ( isnull(BajaLogica, 0) != 1  or isnull(@pnBajasSn,0) = 1 )  
				and  ClaProduccionInicio = @psValor    
				   
	  Order By case  when @pnModoSel = 1 then   ClaProduccionInicio END,
			   CASE  WHEN  @pnModoSel = 2 THEN  NomProduccionInicio end  
			Else  
			begin  
				      
					Select TOP 500  ClaProduccionInicio= ClaProduccionInicio 
						, NomProduccionInicio=  case @pnModoSel when 1 then ltrim(rtrim(convert(varchar(150), ClaProduccionInicio))) + '-' + NomProduccionInicio Else NomProduccionInicio end  
					From AswSch.AswCatProduccionInicio
					Where ( isnull(BajaLogica, 0) != 1  or isnull(@pnBajasSn,0) = 1 )  
					and  NomProduccionInicio like '%' + ltrim(rtrim(@psValor)) + '%'
					   
	  Order By case  when @pnModoSel = 1 then  ClaProduccionInicio END,
			   CASE  WHEN  @pnModoSel = 2 THEN  NomProduccionInicio end  
					  
			End  
	END  
	 
	
