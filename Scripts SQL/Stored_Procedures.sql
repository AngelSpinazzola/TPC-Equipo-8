USE TPC

GO

CREATE OR ALTER PROCEDURE SP_ListarFiliales AS
SELECT F.*, L.Nombre AS Localidad ,U.Estado 
FROM Filiales F
INNER JOIN Usuarios U ON U.IdUsuario = F.IdUsuario
INNER JOIN Direcciones_x_Usuario DU ON DU.IdUsuario = U.IdUsuario
INNER JOIN Localidades L ON L.IdLocalidad = DU.IdLocalidad

GO

CREATE OR ALTER PROCEDURE SP_DireccionesCompletas 
	@IdFilial INT
AS

BEGIN

	SELECT DU.Calle, DU.Altura, P.Nombre
	FROM Direcciones_x_Usuario DU
	INNER JOIN Localidades L ON L.IdLocalidad = DU.IdLocalidad
	INNER JOIN Ciudades C ON C.IdCiudad = L.IdCiudad
	INNER JOIN Provincias P ON P.IdProvincia = C.IdProvincia
	INNER JOIN Filiales F ON F.IdUsuario = DU.IdUsuario
	WHERE F.IdFilial = @IdFilial

END

GO

CREATE OR ALTER PROCEDURE SP_PosiblesDonantes
	@IdGrupoSanguineo INT
AS

BEGIN
	Select GS.Grupo 
	From GruposSanguineos GS
	INNER JOIN DonacionesPosibles DP ON DP.IdGrupoDonante = GS.IdGrupoSanguineo
	WHERE DP.IdGrupoReceptor = @IdGrupoSanguineo 
END

GO

CREATE OR ALTER PROCEDURE SP_ListarPublicaciones AS

SELECT P.*, GP.Grupo, F.Nombre as NombreFilial, U.Descripcion as DescripcionUrgencia
FROM Publicaciones P
INNER JOIN GruposSanguineos GP ON GP.IdGrupoSanguineo = P.IdGrupoSanguineo
INNER JOIN Filiales F ON F.IdFilial = P.IdFilial
INNER JOIN Urgencias U ON U.IdUrgencia = P.IdUrgencia
