--USE [ASW]
--GO
/****** Object:  StoredProcedure [AswSch].[ASWCeldaCmb]    Script Date: 05/01/2023 10:24:24 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
 
	--**********************************************
	--*Autor:MARTHA RODRIGUEZ CHAVEZ
	--*Fecha:09 Mar 2020
	--**********************************************
	--*----  exec ASWSch.ASWCeldaCmb '%',0 
	
	ALTER PROCEDURE [AswSch].[ASWCeldaCmb]  
			@psValor	varchar(100),		-- Texto a Buscar  
			@pnTipo		int,				-- 1=Buscar por la ClaveXxxxx  
			@pnModoSel	int = 1,			-- 1=Retorno Clave - Descripcion   <>1  Descripcion  
			@pnBajasSn	int = 0,
			@pnwtk0		int = null  
			   
	As    
	 
	BEGIN  
	       
		If (@psValor = '' OR @psValor is Null)  
			Select  TOP 500  ClaCelda= IdWorkCenter  
						, NomCelda=  case @pnModoSel when 1 then ltrim(rtrim(convert(varchar(150), IdWorkCenter))) + '-' + NomWorkCenter Else '#'+ClaveWorkCenter end  
			From ASWSch.AswCatWorkCenterVw C
			--JOIN [AswSch].[AswRelDepartamentoAreaVw] DA
			--	ON C.ClaDepartamento = DA.ClaDepartamento
			Where ( isnull(C.BajaLogica, 0) != 1  or isnull(@pnBajasSn,0) = 1 )  
			AND (@pnwtk0 IS NULL OR ClaDepartamento=@pnwtk0)
			    
	  Order By case  when @pnModoSel = 1 then   IdWorkCenter END,
			   CASE  WHEN  @pnModoSel = 2 THEN  ClaveWorkCenter end  

		Else  
			If @pnTipo  in (1,99)   
				Select TOP 500  ClaCelda= IdWorkCenter  
						, NomCelda=  case @pnModoSel when 1 then ltrim(rtrim(convert(varchar(150), IdWorkCenter))) + '-' + NomWorkCenter Else '#'+ClaveWorkCenter end  
				From ASWSch.AswCatWorkCenterVw C
				--JOIN [AswSch].[AswRelDepartamentoAreaVw] DA
				--	ON C.ClaDepartamento = DA.ClaDepartamento
				Where ( isnull(C.BajaLogica, 0) != 1  or isnull(@pnBajasSn,0) = 1 )  
					and  ClaveWorkCenter like '%' + ltrim(rtrim(@psValor)) + '%'--no debe buscar nunca po id's
				AND (@pnwtk0 IS NULL OR ClaDepartamento=@pnwtk0)
				   
	  Order By case  when @pnModoSel = 1 then   IdWorkCenter END,
			   CASE  WHEN  @pnModoSel = 2 THEN  ClaveWorkCenter end  
			Else  
			begin  
				      
					Select TOP 500  ClaCelda= IdWorkCenter  
						, NomCelda=  case @pnModoSel when 1 then ltrim(rtrim(convert(varchar(150), IdWorkCenter))) + '-' + NomWorkCenter Else '#'+ClaveWorkCenter end  
					From ASWSch.AswCatWorkCenterVw C
					--JOIN [AswSch].[AswRelDepartamentoAreaVw] DA
					--	ON C.ClaDepartamento = DA.ClaDepartamento
					Where ( isnull(C.BajaLogica, 0) != 1  or isnull(@pnBajasSn,0) = 1 )  
					and  ClaveWorkCenter like '%' + ltrim(rtrim(@psValor)) + '%'
					AND (@pnwtk0 IS NULL OR ClaDepartamento=@pnwtk0)
					   
	  Order By case  when @pnModoSel = 1 then   IdWorkCenter END,
			   CASE  WHEN  @pnModoSel = 2 THEN  ClaveWorkCenter end  
					  
			End  
	END  
	 
	