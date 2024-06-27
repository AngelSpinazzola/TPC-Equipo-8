USE TPC

GO

-- PROCEDURE QUE DEVUELVE LISTADO DE FILIALES

CREATE OR ALTER PROCEDURE SP_ListarFiliales 
	@IdFilial INT
AS
BEGIN
	IF @IdFilial = -1
	BEGIN
		SELECT U.IdUsuario, F.*, DU.Calle, DU.Altura, DU.Piso, DU.Departamento, L.Nombre AS Localidad, L.CodigoPostal, C.Nombre AS Ciudad, P.Nombre AS Provincia, U.Estado 
		FROM Filiales F
		INNER JOIN Usuarios U ON U.IdUsuario = F.IdUsuario
		INNER JOIN Direcciones_x_Usuario DU ON DU.IdUsuario = U.IdUsuario
		INNER JOIN Localidades L ON L.IdLocalidad = DU.IdLocalidad
		INNER JOIN Ciudades C ON C.IdCiudad = L.IdCiudad
		INNER JOIN Provincias P ON P.IdProvincia = C.IdProvincia
	END
	ELSE
	BEGIN
		SELECT U.IdUsuario, F.*, DU.Calle, DU.Altura, DU.Piso, DU.Departamento, L.Nombre AS Localidad, L.CodigoPostal, C.Nombre AS Ciudad, P.Nombre AS Provincia, U.Estado 
		FROM Filiales F
		INNER JOIN Usuarios U ON U.IdUsuario = F.IdUsuario
		INNER JOIN Direcciones_x_Usuario DU ON DU.IdUsuario = U.IdUsuario
		INNER JOIN Localidades L ON L.IdLocalidad = DU.IdLocalidad
		INNER JOIN Ciudades C ON C.IdCiudad = L.IdCiudad
		INNER JOIN Provincias P ON P.IdProvincia = C.IdProvincia
		WHERE F.IdFilial = @IdFilial
	END
END

GO

-- PROCEDURE QUE RECIBE UNA FILIAL Y DEVUELVE SU DIRECCION PARA SU CONCATENACION Y BUSQUEDA EN EL MAPA

CREATE OR ALTER PROCEDURE SP_DireccionesCompletas 
	@IdFilial INT
AS
	SELECT DU.Calle, DU.Altura, P.Nombre
	FROM Direcciones_x_Usuario DU
	INNER JOIN Localidades L ON L.IdLocalidad = DU.IdLocalidad
	INNER JOIN Ciudades C ON C.IdCiudad = L.IdCiudad
	INNER JOIN Provincias P ON P.IdProvincia = C.IdProvincia
	INNER JOIN Filiales F ON F.IdUsuario = DU.IdUsuario
	WHERE F.IdFilial = @IdFilial

GO

-- FUNCION QUE RECIBE UN GRUPO SANGUINEO Y DEVUELVE UN STRING DE POSIBLES GRUPOS DONANTES

CREATE OR ALTER FUNCTION FN_PosiblesDonantes
	(@IdGrupoSanguineo INT)
RETURNS NVARCHAR(50)
AS
BEGIN

	DECLARE @Resultado NVARCHAR(50)

	SELECT @Resultado = STRING_AGG(GS.Grupo, ', ')
	FROM GruposSanguineos GS
	INNER JOIN DonacionesPosibles DP ON DP.IdGrupoDonante = GS.IdGrupoSanguineo
	WHERE DP.IdGrupoReceptor = @IdGrupoSanguineo 

	RETURN @Resultado
END

GO

-- PROCEDURE QUE RECIBE UNA FILIAL Y DEVUELVE LISTADO DE SUS PUBLICACIONES
-- SI RECIBE EL VALOR -1 DEVUELVE TODAS LAS PUBLICACIONES

CREATE OR ALTER PROCEDURE SP_ListarPublicaciones 
	@IdFilial INT
AS
BEGIN
	IF @IdFilial = -1
	BEGIN
		SELECT P.*, GP.Grupo, dbo.FN_PosiblesDonantes(P.IdGrupoSanguineo) AS PosiblesDonantes, F.Nombre AS NombreFilial, U.Descripcion as DescripcionUrgencia
		FROM Publicaciones P
		INNER JOIN GruposSanguineos GP ON GP.IdGrupoSanguineo = P.IdGrupoSanguineo
		INNER JOIN Filiales F ON F.IdFilial = P.IdFilial
		INNER JOIN Urgencias U ON U.IdUrgencia = P.IdUrgencia
	END
	ELSE
	BEGIN
		SELECT P.*, GP.Grupo, dbo.FN_PosiblesDonantes(P.IdGrupoSanguineo) AS PosiblesDonantes, F.Nombre AS NombreFilial, U.Descripcion AS DescripcionUrgencia
		FROM Publicaciones P
		INNER JOIN GruposSanguineos GP ON GP.IdGrupoSanguineo = P.IdGrupoSanguineo
		INNER JOIN Filiales F ON F.IdFilial = P.IdFilial
		INNER JOIN Urgencias U ON U.IdUrgencia = P.IdUrgencia
		WHERE P.IdFilial = @IdFilial
	END
END

GO

-- PROCEDURE QUE DEVUELVE LISTADO DE DONANTES DE UNA FILIAL

CREATE OR ALTER PROCEDURE SP_ListarDonantes ( @IdFilial INT)
AS

	SELECT Donantes.Nombre, Donantes.Apellido, DR.FechaDonacion FROM DonacionesRealizadas AS DR 
    INNER JOIN Donantes ON DR.IdDonante= Donantes.IdDonante
	WHERE IdFilial = @IdFilial
GO

-- PROCEDURE QUE DEVUELVE LISTADO DE PROXIMAS DONACIONES DE UNA FILIAL

CREATE OR ALTER PROCEDURE SP_ListarProximasDonaciones ( @IdFilial INT)
AS

	SELECT D.Nombre, D.Apellido, D.Dni, GSD.Grupo, PUB.NombreReceptor, GSR.Grupo, PUB.DonantesNecesarios, U.Descripcion, P.FechaRegistro,PUB.FechaLimite  FROM ProximosDonantes P
    INNER JOIN Donantes D ON D.IdDonante = P.IdDonante
    INNER JOIN GruposSanguineos GSD ON GSD.IdGrupoSanguineo = D.IdGrupoSanguineo
    INNER JOIN Publicaciones PUB ON PUB.IdPublicacion = P.IdPublicacion
    INNER JOIN GruposSanguineos GSR ON GSR.IdGrupoSanguineo = PUB.IdGrupoSanguineo
    INNER JOIN Urgencias U ON U.IdUrgencia = PUB.IdUrgencia
	WHERE P.IdFilial = @IdFilial
GO

-- PROCEDURE PARA EDITAR UNA FILIAL

CREATE OR ALTER PROCEDURE SP_ModificarFilial
	@IdUsuario INT,
	@IdFilial INT,
	@Nombre NVARCHAR(50),
	@Telefono NVARCHAR(30),
	@Horario NVARCHAR(100),
	@Correo NVARCHAR(50),
	@UrlImagen NVARCHAR(1000),
	@UrlWeb NVARCHAR(1000),
	@Calle NVARCHAR(100),
	@Altura INT,
	@Piso INT,
	@Departamento NVARCHAR(10),
	@Localidad NVARCHAR(75),
	@CodigoPostal NVARCHAR(10),
	@Ciudad NVARCHAR(75),
	@Provincia NVARCHAR(50)
AS

BEGIN
	BEGIN TRANSACTION;
	BEGIN TRY

	-- ACTUALIZA LA FILIAL

	UPDATE Filiales
	SET
		Nombre = @Nombre,
		Telefono = @Telefono,
		HorarioAtencion = @Horario,
		Correo = @Correo,
		UrlImagen = @UrlImagen,
		UrlWeb = @UrlWeb
	WHERE IdFilial = @IdFilial

	-- VERIFICA SI LA PROVINCIA EXISTE

	DECLARE @IdProvincia INT

	SELECT @IdProvincia = IdProvincia
	FROM Provincias
	WHERE Nombre = @Provincia

	-- SI NO EXISTE, LA INSERTA

	IF @IdProvincia IS NULL
	BEGIN
		INSERT INTO Provincias (Nombre) 
		VALUES (@Provincia)

		SET @IdProvincia = SCOPE_IDENTITY();
	END

	-- VERIFICA SI LA CIUDAD EXISTE

	DECLARE @IdCiudad INT

	SELECT @IdCiudad = IdCiudad
	FROM Ciudades
	WHERE Nombre = @Ciudad

	-- SI NO EXISTE, LA INSERTA

	IF @IdCiudad IS NULL
	BEGIN
		INSERT INTO Ciudades (IdProvincia, Nombre) 
		VALUES ((SELECT IdProvincia FROM Provincias WHERE Nombre = @Provincia), @Ciudad)

		SET @IdCiudad = SCOPE_IDENTITY();
	END

	-- VERIFICA SI LA LOCALIDAD EXISTE

	DECLARE @IdLocalidad INT

	SELECT @IdLocalidad = IdLocalidad
	FROM Localidades
	WHERE Nombre = @Localidad

	-- SI NO EXISTE, LA INSERTA

	IF @IdLocalidad IS NULL
	BEGIN
		INSERT INTO Localidades (IdCiudad, Nombre, CodigoPostal) 
		VALUES ((SELECT IdCiudad FROM Ciudades WHERE Nombre = @Ciudad), @Localidad, @CodigoPostal)

		SET @IdLocalidad = SCOPE_IDENTITY();
	END


	UPDATE Direcciones_x_Usuario SET IdLocalidad = @IdLocalidad, Calle = @Calle, Altura = @Altura, Piso = @Piso, Departamento = @Departamento 
	WHERE IdUsuario = @IdUsuario


		COMMIT TRANSACTION;
	END TRY
	BEGIN CATCH
		ROLLBACK TRANSACTION
		THROW
	END CATCH
END

GO

-- PROCEDURE PARA CREAR UNA PUBLICACION

CREATE OR ALTER PROCEDURE SP_AgregarPublicacion
    @IdFilial INT,
    @NombreReceptor NVARCHAR(50),
    @IdGrupoSanguineo INT,
    @IdUrgencia INT,
    @DonantesNecesarios INT,
    @Horario NVARCHAR(100),
    @FechaLimite DATE,
    @Estado BIT
AS
BEGIN
    
    INSERT INTO Publicaciones (
        IdFilial,
        NombreReceptor,
        IdGrupoSanguineo,
        IdUrgencia,
        DonantesNecesarios,
        Horario,
        FechaLimite,
        Estado
    ) VALUES (
        @IdFilial,
        @NombreReceptor,
        @IdGrupoSanguineo,
        @IdUrgencia,
        @DonantesNecesarios,
        @Horario,
        @FechaLimite,
        @Estado
    )
END
GO

-- PROCEDURE PARA LOGUEAR

CREATE OR ALTER PROCEDURE SP_Loguear
	@Email NVARCHAR(50),
	@Pass NVARCHAR(50)
AS
BEGIN
	SELECT U.IdUsuario, U.IdRol, U.Username FROM Usuarios U WHERE U.Email = @Email AND U.Pass = @Pass
END
GO

-- PROCEDURE PARA REGISTRO

CREATE OR ALTER PROCEDURE SP_Registro
	@Email NVARCHAR(50),
	@Pass NVARCHAR(50),
	@Dni NVARCHAR(30)
AS
BEGIN

INSERT INTO Usuarios (Email, Pass)
VALUES(@Email, @Pass)

DECLARE @UltimoIdUsuario INT
SET @UltimoIdUsuario = SCOPE_IDENTITY();


INSERT INTO Donantes (IdUsuario, Dni)
OUTPUT inserted.IdUsuario
VALUES(@UltimoIdUsuario, @Dni)
END
GO

-- PROCEDURE PARA OBTENER ID DE FILIAL CON ID DE USIARIO REGRISTRADO 
CREATE OR ALTER PROCEDURE SP_ObtenerIdFilialPorIdUsuario
    @idUser INT
AS
BEGIN
    SELECT F.IdFilial FROM Filiales F
    WHERE F.IdUsuario=@idUser
END
GO

-- PROCEDURE PARA OBTENER UNA PUBLICACION CON SU ID
CREATE  OR ALTER PROCEDURE SP_ObtenerUnaPublicacionPorId
    @IdFilial INT,
    @IdPublicacion INT
AS
BEGIN
  
    SELECT 
        p.IdPublicacion,
        p.IdFilial,
        p.NombreReceptor,
        p.IdGrupoSanguineo,
        p.IdUrgencia,
        p.DonantesNecesarios,
        p.Horario,
        p.FechaLimite,
        p.Estado
    FROM 
        Publicaciones p
    WHERE 
        p.IdFilial = @IdFilial
        AND p.IdPublicacion = @IdPublicacion;
END
GO