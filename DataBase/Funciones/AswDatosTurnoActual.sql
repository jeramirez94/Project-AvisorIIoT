CREATE FUNCTION ASWSch.AswDatosTurnoActual
	(@PnClaUbicacion INT,
	@PsIdWorkCenter VARCHAR(100))
RETURNS @DatosTurno TABLE(
	FechaAdm date,
	ClaTurno int,
	InicioTurno datetime,
	FinTurno datetime,
	MinutosFinTurno int
)
AS

BEGIN

	DECLARE @nClaDepartamento INT
		   ,@tFechaAdm date
		   ,@nTurno INT
		   ,@ptFechaHora datetime

	set  @ptFechaHora = GETDATE()


	SELECT @nClaDepartamento = ClaDepartamento
	FROM AswSch.AswCatWorkCenterVw
	WHERE IdWorkCenter = @psIdWorkCenter


	SELECT @tFechaAdm = [AswSch].[ASWGetFechaAdm](@PnClaUbicacion,@nClaDepartamento,@ptFechaHora)

	SELECT @nTurno = [AswSch].[ASWGetTurno](@PnClaUbicacion,@nClaDepartamento,@ptFechaHora)

	INSERT INTO @DatosTurno
	select 
	 @tFechaAdm as FechaAdm
	,@nTurno as ClaTurno
	,[AswSch].[ASWGetInicioTurno](@PnClaUbicacion,getdate(),@nTurno,@nClaDepartamento) as InicioTurno
	,[AswSch].[ASWGetFinTurno](@PnClaUbicacion,getdate(),@nTurno,@nClaDepartamento) as FinTurno
	,DATEDIFF(MINUTE,GETDATE(),[AswSch].[ASWGetFinTurno](@PnClaUbicacion,getdate(),@nTurno,@nClaDepartamento))
 
	RETURN 

END
GO

