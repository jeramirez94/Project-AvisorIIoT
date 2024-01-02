USE [ASW]
GO
/****** Object:  StoredProcedure [AswSch].[ASWTurnoCmb]    Script Date: 15/11/2022 04:30:41 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



--EXEC  ASWSch.ASWTurnoCmb '%',0 
ALTER PROCEDURE [AswSch].[ASWTurnoCmb]
    @pnClaUbicacion int,
    @psValor varchar (100),
    @pnTipo int, 
    @pnModosel int = 1,
    @pnBajaLogica int = 0
AS
	
BEGIN

    IF (@psValor='' OR @psValor is Null) 
    SELECT TOP 500 
                   ClaTurno = ClaTurno,
                   NomTurno = case @pnModosel when 1 then ltrim(rtrim(convert(varchar(150), ClaTurno)))+'-' + 
			    NomTurno Else NomTurno end  
    FROM AswSch.AswCatTurno
	   WHERE 
	   (isnull(BajaLogica,0)!=1 or isnull(@pnBajaLogica,0)=1)

	   order By case  when @pnModosel = 1 then ClaTurno  END,
			 CASE WHEN @pnModosel = 2 THEN NomTurno end

				Else

    If @pnTipo in (1,99)
	   SELECT TOP 500 
				ClaTurno = ClaTurno,
				NomTurno = case @pnModosel when 1 then ltrim(rtrim(convert(varchar(150), ClaTurno)))+'-' +
				NomTurno Else NomTurno end  
				FROM AswSch.AswCatTurno

				WHERE (isnull(BajaLogica,0)!= 1 or isnull(@pnBajaLogica,0)= 1) AND
					   ClaTurno = @psValor
			 order By case when @pnModosel = 1 then ClaTurno  END,
			 CASE WHEN @pnModosel = 2 THEN NomTurno end

			 Else
    BEGIN 

	   SELECT TOP 500 
	               ClaTurno = ClaTurno,
				NomTurno = case @pnModosel when 1 then ltrim(rtrim(convert(varchar(150), ClaTurno)))+'-' + 
				NomTurno Else NomTurno end  
				FROM AswSch.AswCatTurno

				WHERE ( isnull(BajaLogica, 0) != 1  or isnull(@pnBajaLogica,0) = 1 ) AND
				      NomTurno like '%' + ltrim(rtrim(@psValor)) + '%'
				order By  case when @pnModosel = 1 then ClaTurno  END,
				CASE WHEN @pnModosel = 2 THEN NomTurno end
				    End

    END



