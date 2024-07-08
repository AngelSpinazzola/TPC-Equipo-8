USE TPC

GO

-- PROCEDURE QUE DEVUELVE LISTADO DE FILIALES

CREATE OR ALTER PROCEDURE SP_ListarFiliales 
	@IdFilial INT = -1,
	@Habilitado INT = -1,
	@SoloActivas BIT
AS
BEGIN
    SELECT U.IdUsuario, F.*, DU.Calle, DU.Altura, DU.Piso, DU.Departamento, 
           L.Nombre AS Localidad, L.CodigoPostal, C.Nombre AS Ciudad, 
           P.Nombre AS Provincia, U.Estado, F.Habilitado
    FROM Filiales F
    INNER JOIN Usuarios U ON U.IdUsuario = F.IdUsuario
    INNER JOIN Direcciones_x_Usuario DU ON DU.IdUsuario = U.IdUsuario
    INNER JOIN Localidades L ON L.IdLocalidad = DU.IdLocalidad
    INNER JOIN Ciudades C ON C.IdCiudad = L.IdCiudad
    INNER JOIN Provincias P ON P.IdProvincia = C.IdProvincia
    WHERE (@IdFilial = -1 OR F.IdFilial = @IdFilial)
      AND (@Habilitado = -1 OR F.Habilitado = CAST(@Habilitado AS BIT))
	  AND (@SoloActivas = 0 OR U.Estado = 1)
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
	@IdFilial INT,
	@SoloActivas BIT
AS
BEGIN

	SELECT P.*, GP.Grupo, dbo.FN_PosiblesDonantes(P.IdGrupoSanguineo) AS PosiblesDonantes, 
    F.Nombre AS NombreFilial, U.Descripcion as DescripcionUrgencia
    FROM Publicaciones P
    INNER JOIN GruposSanguineos GP ON GP.IdGrupoSanguineo = P.IdGrupoSanguineo
    INNER JOIN Filiales F ON F.IdFilial = P.IdFilial
    INNER JOIN Urgencias U ON U.IdUrgencia = P.IdUrgencia
    WHERE (@IdFilial = -1 OR P.IdFilial = @IdFilial)
    AND (@SoloActivas = 0 OR P.Estado = 1)

END

GO

-- PROCEDURE QUE DEVUELVE LISTADO DE DONANTES DE UNA FILIAL

CREATE OR ALTER PROCEDURE SP_ListarDonantes ( @IdFilial INT)
AS

	SELECT Donantes.Nombre, Donantes.Apellido, DR.FechaDonacion FROM DonacionesRealizadas AS DR 
    INNER JOIN Donantes ON DR.IdDonante= Donantes.IdDonante
	WHERE IdFilial = @IdFilial
	ORDER BY DR.FechaDonacion DESC

GO

-- PROCEDURE QUE DEVUELVE LISTADO DE PROXIMAS DONACIONES DE UNA FILIAL

CREATE OR ALTER PROCEDURE SP_ListarProximasDonaciones 
	@IdFilial INT
AS

	SELECT PD.IdProximoDonante, PD.IdFilial, PD.IdDonante,PD.IdPublicacion, US.Username, D.Dni, GS.Grupo as GrupoDonante, P.NombreReceptor, 
	P.DonantesNecesarios, 
	U.Descripcion AS Urgencia,
	PD.FechaRegistro,
	P.FechaLimite
	FROM Donantes D
	LEFT JOIN GruposSanguineos GS ON GS.IdGrupoSanguineo = D.IdGrupoSanguineo
	LEFT JOIN ProximosDonantes PD ON PD.IdDonante = D.IdDonante
	INNER JOIN Publicaciones P ON P.IdPublicacion = PD.IdPublicacion
	INNER JOIN Urgencias U ON U.IdUrgencia = P.IdUrgencia
	LEFT JOIN Usuarios US ON US.IdUsuario = D.IdUsuario
	WHERE PD.IdFilial = @IdFilial

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

-- PROCEDURE PARA MODIFICAR UNA PUBLICACION

CREATE OR ALTER PROCEDURE SP_ModificarPublicacion
    @IdPublicacion INT,
    @NombreReceptor NVARCHAR(50),
    @IdGrupoSanguineo INT,
    @IdUrgencia INT,
    @DonantesNecesarios INT,
    @Horario NVARCHAR(100),
    @FechaLimite DATE,
    @Estado BIT
AS
BEGIN
    UPDATE Publicaciones
    SET
        NombreReceptor = @NombreReceptor,
        IdGrupoSanguineo = @IdGrupoSanguineo,
        IdUrgencia = @IdUrgencia,
        DonantesNecesarios = @DonantesNecesarios,
        Horario = @Horario,
        FechaLimite = @FechaLimite,
        Estado = @Estado
    WHERE
        IdPublicacion = @IdPublicacion;
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
	@Nombre NVARCHAR(30),
	@Apellido NVARCHAR(30),
	@Email NVARCHAR(50),
	@Pass NVARCHAR(50),
	@Dni NVARCHAR(30)
AS
BEGIN
	INSERT INTO Usuarios (Username, Email, Pass)
	VALUES(@Nombre, @Email, @Pass)
	
	DECLARE @UltimoIdUsuario INT
	SET @UltimoIdUsuario = SCOPE_IDENTITY();
	
	INSERT INTO Donantes (IdUsuario,Nombre,Apellido, Dni)
	OUTPUT inserted.IdUsuario
	VALUES(@UltimoIdUsuario,@Nombre,@Apellido, @Dni)
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
    @IdPublicacion INT
AS
BEGIN
  
   SELECT    
		p.IdPublicacion,
		f.Nombre as NombreFilial,
        p.NombreReceptor,
        g.Grupo,
		u.Descripcion AS Urgencia,
        p.DonantesNecesarios,
        p.Horario,
        p.FechaLimite,
        p.Estado
    FROM 
        Publicaciones p
    INNER JOIN GruposSanguineos g ON p.IdGrupoSanguineo = g.IdGrupoSanguineo
    INNER JOIN Urgencias u ON p.IdUrgencia = u.IdUrgencia
	INNER JOIN Filiales f ON f.IdFilial = p.IdFilial
    WHERE  
        p.IdPublicacion = @IdPublicacion;
END
GO

-- PROCEDURE QUE INSERTA DATOS EN EN DONACIONES REALIZADAS Y ELIMINA DE PROXIMOS DONANTES

CREATE OR ALTER PROCEDURE SP_DonacionRealizada
	@IdDonante INT,
	@IdFilial INT,
	@IdPublicacion INT = NULL
AS
BEGIN
	
	BEGIN TRY
	BEGIN TRANSACTION

	INSERT INTO DonacionesRealizadas (IdDonante, IdFilial, IdPublicacion, FechaDonacion)
	VALUES (@IdDonante, @IdFilial, @IdPublicacion, GETDATE())

	DELETE FROM ProximosDonantes WHERE IdDonante = @IdDonante AND IdPublicacion = @IdPublicacion

	COMMIT TRANSACTION
	END TRY

	BEGIN CATCH
		RAISERROR('ERROR AL CONFIRMAR LA DONACION',16,1)
		ROLLBACK TRANSACTION
	END CATCH
END

GO

-- PROCEDURE QUE ELIMINA UNA PROXIMA DONACION E INSERTA UNA RECHAZADA

CREATE OR ALTER PROCEDURE SP_DonacionRechazada
	@IdDonante INT,
	@IdFilial INT,
	@IdPublicacion INT = NULL,
	@Motivo NVARCHAR(200)
AS
BEGIN

	BEGIN TRY

		BEGIN TRANSACTION

			INSERT INTO DonacionesRechazadas (IdDonante, IdFilial, IdPublicacion, Motivo, FechaRechazo)
			VALUES (@IdDonante, @IdFilial, @IdPublicacion, @Motivo, GETDATE())

			DELETE FROM ProximosDonantes WHERE IdDonante = @IdDonante AND IdPublicacion = @IdPublicacion

		COMMIT TRANSACTION

	END TRY
	BEGIN CATCH

		RAISERROR('ERROR AL RECHAZAR DONANTE', 16, 1)
		ROLLBACK TRANSACTION

	END CATCH

END

GO

-- PROCEDURE PARA LA ELIMINACION LOGICA DE UNA PUBLICACION

CREATE OR ALTER PROCEDURE SP_DesactivarPublicacion
	@IdPublicacion INT
AS
BEGIN
	UPDATE Publicaciones SET Estado = 0 WHERE IdPublicacion = @IdPublicacion
END

GO

-- PROCEDURE PARA LA ELIMINACION LOGICA DE UNA FILIAL
CREATE OR ALTER PROCEDURE SP_DesactivarFilial
	@IdFilial INT
AS
BEGIN

	DECLARE @IdUsuario INT

	SELECT @IdUsuario = IdUsuario FROM Filiales WHERE IdFilial = @IdFilial

	UPDATE Usuarios SET Estado = 0 WHERE IdUsuario = @IdUsuario
END

GO
-- PROCEDURE PARA HABILITAR A UNA FILIAL
CREATE OR ALTER PROCEDURE SP_HabilitarFilial
	@IdFilial INT
AS
BEGIN
	UPDATE Filiales SET Habilitado = 1 WHERE IdFilial = @IdFilial
END

GO

--- PROCEDURE QUE RECIBE ID DE USUARIO, DEVUELVE REGISTRO COMPLETO DEL DONANTE
CREATE OR ALTER PROCEDURE SP_ListarDonante(
	@IdUsuario INT
)
AS
BEGIN
SELECT
	U.Username,
	D.Nombre,
	D.Apellido,
	D.Dni, 
	U.Email, 
	U.Pass, 
	U.FechaAlta,
	GS.Grupo,
	P.Nombre AS nombreProvincia,
	C.Nombre AS nombreCiudad,
	L.Nombre AS nombreLocalidad,
	L.CodigoPostal,
	DXU.Calle,
	DXU.Altura
	FROM Usuarios U
LEFT JOIN Donantes D ON D.IdUsuario = U.IdUsuario
LEFT JOIN Direcciones_x_Usuario DXU ON DXU.IdUsuario = U.IdUsuario
LEFT JOIN Localidades L ON L.IdLocalidad = DXU.IdLocalidad
LEFT JOIN Ciudades C ON C.IdCiudad = L.IdCiudad
LEFT JOIN Provincias P ON P.IdProvincia = C.IdProvincia
INNER JOIN GruposSanguineos GS ON GS.IdGrupoSanguineo = D.IdGrupoSanguineo 
WHERE U.IdUsuario = @IdUsuario
END

GO

--- PROCEDURE QUE RECIBE ID DE USUARIO Y ACTUALIZA EL PERFIL DEL DONANTE 

CREATE OR ALTER PROCEDURE SP_ActualizarDatosDonante(
	@IdUsuario INT,
	@Nombre NVARCHAR(50),
	@Apellido NVARCHAR(50),
	@UrlFoto NVARCHAR(1000)
)
AS
BEGIN
	UPDATE Donantes
	SET
		Nombre = @Nombre,
		Apellido = @Apellido,
		UrlFoto = @UrlFoto
	WHERE IdUsuario = @IdUsuario
END

GO

-- PROCEDURE QUE RECIBE ID DE USUARIO Y DEVUELVE ID DE DONANTE

CREATE OR ALTER PROCEDURE SP_RecibirIdDonante(
	@IdUsuario INT
)
AS
BEGIN
	SELECT IdDonante FROM Donantes WHERE IdUsuario = @IdUsuario
END

GO

-- PROCEDURE QUE RECIBE ID DE DONANTE Y DEVUELVE LOS DATOS DE DONDE DONO

CREATE OR ALTER PROCEDURE SP_RecibirDatosDonacionDonante(
	@IdDonante INT
)
AS
BEGIN
	SELECT F.Nombre, DR.FechaDonacion 
	FROM DonacionesRealizadas DR
	INNER JOIN Filiales F ON F.IdFilial = DR.IdFilial
	WHERE DR.IdDonante = @IdDonante
END

GO

-- PROCEDURE QUE RECIBE ID DE DONANTE Y DEVUELVE LOS DATOS DE LA PROXIMA DONACION

CREATE OR ALTER PROCEDURE SP_RecibirDatosProximaDonacion(
	@IdDonante INT
)
AS
BEGIN
	SELECT P.NombreReceptor, PD.FechaRegistro, F.Nombre FROM ProximosDonantes PD
	INNER JOIN Publicaciones P ON P.IdPublicacion = PD.IdPublicacion
	INNER JOIN Filiales F ON F.IdFilial = P.IdFilial
	WHERE PD.IdDonante = @IdDonante
END

GO

-- PROCEDURE PARA REGISTRO DE FILIAL

CREATE OR ALTER PROCEDURE SP_RegistroFilial(
	@Nombre NVARCHAR(50),
	@Telefono NVARCHAR(30),
	@Provincia NVARCHAR(50),
	@Ciudad NVARCHAR(75),
	@Localidad NVARCHAR(75),
	@CodigoPostal NVARCHAR(10),
	@Calle NVARCHAR(100),
	@Altura INT,
	@Email NVARCHAR(50),
	@Pass NVARCHAR(50)
)
AS
BEGIN
	BEGIN TRY
		BEGIN TRANSACTION

		INSERT INTO Usuarios (Username, Email, Pass, IdRol)
		VALUES (@Nombre, @Email, @Pass, 3)

		DECLARE @UltimoIdUsuario INT
		SET @UltimoIdUsuario = SCOPE_IDENTITY();

		INSERT INTO Filiales (IdUsuario, Nombre, Telefono, Correo)
		VALUES (@UltimoIdUsuario, @Nombre, @Telefono, @Email)

		-- VERIFICA SI LA PROVINCIA EXISTE

		DECLARE @IdProvincia INT

		SELECT @IdProvincia = IdProvincia FROM Provincias WHERE Nombre = @Provincia

		-- SI NO EXISTE, LA INSERTA

		IF @IdProvincia IS NULL
		BEGIN
			INSERT INTO Provincias (Nombre) 
			VALUES (@Provincia)

			SET @IdProvincia = SCOPE_IDENTITY();
		END

		-- VERIFICA SI LA CIUDAD EXISTE

		DECLARE @IdCiudad INT

		SELECT @IdCiudad = IdCiudad FROM Ciudades WHERE Nombre = @Ciudad

		-- SI NO EXISTE, LA INSERTA

		IF @IdCiudad IS NULL
		BEGIN
			INSERT INTO Ciudades (IdProvincia, Nombre) 
			VALUES ((SELECT IdProvincia FROM Provincias WHERE Nombre = @Provincia), @Ciudad)

			SET @IdCiudad = SCOPE_IDENTITY();
		END

		-- VERIFICA SI LA LOCALIDAD EXISTE

		DECLARE @IdLocalidad INT

		SELECT @IdLocalidad = IdLocalidad FROM Localidades WHERE Nombre = @Localidad

		-- SI NO EXISTE, LA INSERTA

		IF @IdLocalidad IS NULL
		BEGIN
			INSERT INTO Localidades (IdCiudad, Nombre, CodigoPostal) 
			VALUES ((SELECT IdCiudad FROM Ciudades WHERE Nombre = @Ciudad), @Localidad, @CodigoPostal)

			SET @IdLocalidad = SCOPE_IDENTITY();
		END

		INSERT INTO Direcciones_x_Usuario (IdUsuario, IdLocalidad, Calle, Altura)
		VALUES (@UltimoIdUsuario, @IdLocalidad, @Calle, @Altura)

		COMMIT TRANSACTION
	END TRY

	BEGIN CATCH
		ROLLBACK TRANSACTION
	END CATCH
END

GO

-- PROCEDURE QUE DEVUELVE LA CONTRASEÑA DE UN USUARIO CON SU EMAIL

CREATE OR ALTER PROCEDURE SP_RecuperarContraseña
	@Email NVARCHAR(50)
AS 
BEGIN

	SELECT Pass FROM Usuarios WHERE Email = @Email

END

GO

-- PROCEDURE QUE INSERTA UN PROXIMO DONANTE

CREATE OR ALTER PROCEDURE SP_insertProximoDonante
	@IdPublicacion INT,
	@IdUsuario INT
AS
BEGIN

	DECLARE @IdFilial INT
	DECLARE @IdDonante INT

	SELECT @IdFilial = IdFilial FROM Publicaciones WHERE IdPublicacion = @IdPublicacion
	SELECT @IdDonante = IdDonante FROM Donantes WHERE IdUsuario = @IdUsuario

	INSERT INTO ProximosDonantes VALUES (@IdDonante, @IdFilial, @IdPublicacion, GETDATE())

END


GO

CREATE OR ALTER PROCEDURE SP_UpdateDireccionFilial

	@IdUsuario INT,
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

	BEGIN TRY

	BEGIN TRANSACTION

	-- VERIFICA SI LA LOCALIDAD EXISTE

	DECLARE @IdLocalidad INT

	SELECT @IdLocalidad = IdLocalidad
	FROM Localidades
	WHERE Nombre = @Localidad

	-- SI NO EXISTE, LA INSERTA

	IF @IdLocalidad IS NULL
	BEGIN
		INSERT INTO Localidades(Nombre, CodigoPostal) 
		VALUES (@Localidad, @CodigoPostal)

		SET @IdLocalidad = SCOPE_IDENTITY();
	END

	-- VERIFICA SI LA CIUDAD EXISTE

	DECLARE @IdCiudad INT

	SELECT @IdCiudad = IdCiudad
	FROM Ciudades
	WHERE Nombre = @Ciudad

	-- SI NO EXISTE, LA INSERTA

	IF @IdCiudad IS NULL
	BEGIN
		INSERT INTO Ciudades(Nombre) 
		VALUES (@Ciudad)

		SET @IdCiudad = SCOPE_IDENTITY();
	END

	UPDATE Direcciones_x_Usuario SET Calle = @Calle, Altura = @Altura, Piso = @Piso, Departamento = @Departamento, IdLocalidad = @IdLocalidad WHERE IdUsuario = @IdUsuario

	COMMIT TRANSACTION

	END TRY
	BEGIN CATCH

	RAISERROR('ERROR', 16, 0)
	ROLLBACK TRANSACTION

	END CATCH

END

GO

-- PROCEDURE QUE RECIBE ID DE DONANTE Y VERIFICA SI TIENE UN TURNO PARA DONAR PENDIENTE

CREATE OR ALTER PROCEDURE SP_DonanteVerificarTurno(
    @IdDonante INT
)
AS
BEGIN
    DECLARE @IdPublicacion INT

    SELECT TOP 1 @IdPublicacion = P.IdPublicacion 
    FROM Publicaciones P
    INNER JOIN ProximosDonantes PD ON PD.IdPublicacion = P.IdPublicacion
    WHERE PD.IdDonante = @IdDonante

    IF @IdPublicacion IS NOT NULL AND @IdPublicacion NOT IN (SELECT DR.IdPublicacion FROM DonacionesRechazadas DR WHERE DR.IdDonante = @IdDonante) 
    BEGIN
		-- SI RETORNA 1 SIGNIFICA QUE TIENE TURNO PENDIENTE.
        SELECT 1 AS Resultado
    END
    ELSE
    BEGIN
        SELECT 2 AS Resultado
    END
END

GO
