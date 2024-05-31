Create Or Alter Procedure SP_ListarFiliales As
Select * From Filiales
Go

CREATE OR ALTER PROCEDURE SP_DireccionesCompletas
	@IdFilial INT
AS
BEGIN

	SELECT DU.Calle Calle, DU.Altura Altura, P.Nombre Nombre
	FROM Direcciones_x_Usuario DU
	INNER JOIN Localidades L ON L.IdLocalidad = DU.IdLocalidad
	INNER JOIN Ciudades C ON C.IdCiudad = L.IdCiudad
	INNER JOIN Provincias P ON P.IdProvincia = C.IdProvincia
	INNER JOIN Filiales F ON F.IdUsuario = DU.IdUsuario
	WHERE F.IdFilial = @IdFilial

END
Go
