CREATE DATABASE TPC;

GO

USE TPC;

GO

CREATE TABLE Roles(
	IdRol INT NOT NULL PRIMARY KEY,
	Nombre NVARCHAR(20) NOT NULL
)

CREATE TABLE Provincias(
	IdProvincia INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	Nombre NVARCHAR(50)
)

CREATE TABLE Ciudades(
	IdCiudad INT NOT NULL PRIMARY KEY IDENTITY(1,1), 
	IdProvincia INT NOT NULL FOREIGN KEY REFERENCES Provincias(IdProvincia),
	Nombre NVARCHAR(75)
)

CREATE TABLE Localidades(
	IdLocalidad INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	IdCiudad INT NOT NULL FOREIGN KEY REFERENCES Ciudades(IdCiudad),
	Nombre NVARCHAR(75),
	CodigoPostal NVARCHAR(10)
)

CREATE TABLE Usuarios(
	IdUsuario INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	Username NVARCHAR(30) NOT NULL UNIQUE,
	Pass NVARCHAR(50)NOT NULL,
	IdRol INT NOT NULL FOREIGN KEY REFERENCES Roles(IdRol),
	FechaAlta DATETIME NOT NULL DEFAULT GETDATE(),
	Estado BIT NOT NULL DEFAULT 1
)

CREATE TABLE Direcciones_x_Usuario(
	IdDireccion INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	IdUsuario INT NOT NULL FOREIGN KEY REFERENCES Usuarios(IdUsuario),
	IdLocalidad INT NOT NULL FOREIGN KEY REFERENCES Localidades(IdLocalidad),
	Calle NVARCHAR(100) NOT NULL,
	Altura INT,
	Piso INT,
	Departamento NVARCHAR(10),
	Comentarios NVARCHAR(100)
)

CREATE TABLE GruposSanguineos(
	IdGrupoSanguineo INT NOT NULL PRIMARY KEY,
	Grupo NVARCHAR(10) NOT NULL
)

CREATE TABLE DonacionesPosibles(
	IdDonacionPosible INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    IdGrupoDonante INT NOT NULL FOREIGN KEY REFERENCES GruposSanguineos(IdGrupoSanguineo),
    IdGrupoReceptor INT NOT NULL FOREIGN KEY REFERENCES GruposSanguineos(IdGrupoSanguineo)
)

CREATE TABLE RecepcionesPosibles(
    IdRecepcionPosible INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    IdGrupoReceptor INT NOT NULL FOREIGN KEY REFERENCES GruposSanguineos(IdGrupoSanguineo),
    IdGrupoDonante INT NOT NULL FOREIGN KEY REFERENCES GruposSanguineos(IdGrupoSanguineo)
)

CREATE TABLE Donantes(
	IdDonante INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	IdUsuario INT NOT NULL FOREIGN KEY REFERENCES Usuarios(IdUsuario),
	Nombre NVARCHAR(50) NOT NULL,
	Apellido NVARCHAR(50) NOT NULL,
	Dni NVARCHAR(30) NOT NULL,
	FechaNacimiento DATE NOT NULL,
	IdGrupoSanguineo INT NOT NULL FOREIGN KEY REFERENCES GruposSanguineos(IdGrupoSanguineo),
	UrlFoto NVARCHAR(1000)
)

CREATE TABLE Filiales(
	IdFilial INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	IdUsuario INT NOT NULL FOREIGN KEY REFERENCES Usuarios(IdUsuario),
	Nombre NVARCHAR(50) NOT NULL,
	Telefono NVARCHAR(30) NOT NULL,
	HorarioAtencion NVARCHAR(100),
	Correo NVARCHAR(50),
	UrlImagen NVARCHAR(1000),
	UrlWeb NVARCHAR(1000)
)

CREATE TABLE Administradores(
	IdAdministrador INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	IdUsuario INT NOT NULL FOREIGN KEY REFERENCES Usuarios(IdUsuario),
	Nombre NVARCHAR(30)
)

CREATE TABLE Urgencias(
	IdUrgencia INT NOT NULL PRIMARY KEY,
	Descripcion NVARCHAR(30)
)

CREATE TABLE Publicaciones(
	IdPublicacion INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	IdFilial INT NOT NULL FOREIGN KEY REFERENCES Filiales(IdFilial),
	NombreReceptor NVARCHAR(50),
	IdGrupoSanguineo INT FOREIGN KEY REFERENCES GruposSanguineos(IdGrupoSanguineo),
	IdUrgencia INT NOT NULL,
	DonantesNecesarios INT,
	Horario NVARCHAR(100),
	FechaLimite DATE,
	Estado BIT NOT NULL DEFAULT 1
)

CREATE TABLE DonacionesRealizadas(
	IdDonacionRealizada INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	IdDonante INT NOT NULL FOREIGN KEY REFERENCES Donantes(IdDonante),
	IdFilial INT NOT NULL FOREIGN KEY REFERENCES Filiales(IdFilial),
	IdPublicacion INT FOREIGN KEY REFERENCES Publicaciones(IdPublicacion),
	FechaDonacion DATETIME NOT NULL
)

GO

Insert Into Roles(IdRol, Nombre)
Values
(1,'Administrador'),
(2,'Donante'),
(3,'Filial')

Insert Into Provincias (Nombre) 
Values ('Buenos Aires'),
('Catamarca'),
('Chaco'),
('Chubut'),
('Córdoba'),
('Corrientes'),
('Entre Ríos'),
('Formosa'),
('Jujuy'),
('La Pampa'),
('La Rioja'),
('Mendoza'),
('Misiones'),
('Neuquén'),
('Río Negro'),
('Salta'),
('San Juan'),
('San Luis'),
('Santa Cruz'),
('Santa Fe'),
('Santiago del Estero'),
('Tierra del Fuego'),
('Tucumán')

INSERT INTO Ciudades (IdProvincia, Nombre) VALUES
(1, 'La Plata'),
(1, 'Mar del Plata'),
(1, 'Bahía Blanca'),
(2, 'San Fernando del Valle de Catamarca'),
(2, 'Belén'),
(2, 'Andalgalá'),
(3, 'Resistencia'),
(3, 'Sáenz Peña'),
(3, 'Villa Ángela'),
(4, 'Rawson'),
(4, 'Comodoro Rivadavia'),
(4, 'Trelew'),
(5, 'Córdoba'),
(5, 'Villa Carlos Paz'),
(5, 'Río Cuarto'),
(6, 'Corrientes'),
(6, 'Goya'),
(6, 'Paso de los Libres'),
(7, 'Paraná'),
(7, 'Concordia'),
(7, 'Gualeguaychú'),
(8, 'Formosa'),
(8, 'Clorinda'),
(8, 'Pirané'),
(9, 'San Salvador de Jujuy'),
(9, 'Palpalá'),
(9, 'Libertador General San Martín'),
(10, 'Santa Rosa'),
(10, 'General Pico'),
(10, 'Toay'),
(11, 'La Rioja'),
(11, 'Chilecito'),
(11, 'Aimogasta'),
(12, 'Mendoza'),
(12, 'San Rafael'),
(12, 'Godoy Cruz'),
(13, 'Posadas'),
(13, 'Oberá'),
(13, 'Eldorado'),
(14, 'Neuquén'),
(14, 'San Martín de los Andes'),
(14, 'Cutral Có'),
(15, 'Viedma'),
(15, 'San Carlos de Bariloche'),
(15, 'General Roca'),
(16, 'Salta'),
(16, 'San Ramón de la Nueva Orán'),
(16, 'Tartagal'),
(17, 'San Juan'),
(17, 'Rawson'),
(17, 'Chimbas'),
(18, 'San Luis'),
(18, 'Villa Mercedes'),
(18, 'Merlo'),
(19, 'Río Gallegos'),
(19, 'Caleta Olivia'),
(19, 'El Calafate'),
(20, 'Santa Fe'),
(20, 'Rosario'),
(20, 'Rafaela'),
(21, 'Santiago del Estero'),
(21, 'La Banda'),
(21, 'Termas de Río Hondo'),
(22, 'Ushuaia'),
(22, 'Río Grande'),
(22, 'Tolhuin'),
(23, 'San Miguel de Tucumán'),
(23, 'Tafí Viejo'),
(23, 'Yerba Buena'),
(1, 'San Isidro'),
(1, 'Ciudad Autonoma de Buenos Aires')

INSERT INTO Localidades (IdCiudad, Nombre, CodigoPostal) VALUES
(1, 'Los Hornos', '1900'),
(1, 'City Bell', '1896'),
(1, 'Villa Elisa', '1894'),
(2, 'Punta Mogotes', '7600'),
(2, 'La Perla', '7600'),
(2, 'Batán', '7601'),
(3, 'Villa Mitre', '8000'),
(3, 'Las Villas', '8001'),
(3, 'Tiro Federal', '8002'),
(4, 'Centro', '4700'),
(4, 'La Chacarita', '4700'),
(4, 'Villa Cubas', '4700'),
(5, 'Centro', '4750'),
(5, 'La Puntilla', '4750'),
(5, 'San Antonio', '4750'),
(6, 'Centro', '4740'),
(6, 'Huaco', '4741'),
(6, 'Mallí', '4742'),
(7, 'Centro', '3500'),
(7, 'Villa Río Negro', '3500'),
(7, 'Barranqueras', '3500'),
(8, 'Centro', '3700'),
(8, 'Belgrano', '3700'),
(8, 'San Martín', '3700'),
(9, 'Centro', '3540'),
(9, 'Sarmiento', '3540'),
(9, 'San Martín', '3540'),
(10, 'Centro', '9103'),
(10, 'Área 16', '9103'),
(10, 'Don Bosco', '9103'),
(11, 'Centro', '9000'),
(11, 'Km 3', '9000'),
(11, 'Km 8', '9000'),
(12, 'Centro', '9100'),
(12, 'Barrio Norte', '9100'),
(12, 'Barrio Sur', '9100'),
(13, 'Nueva Córdoba', '5000'),
(13, 'Alberdi', '5001'),
(13, 'Villa Allende', '5105'),
(14, 'Centro', '5152'),
(14, 'Villa del Lago', '5152'),
(14, 'Santa Rita', '5152'),
(15, 'Banda Norte', '5800'),
(15, 'Centro', '5800'),
(15, 'Parque Sarmiento', '5801'),
(16, 'Centro', '3400'),
(16, 'Barrio Camba Cuá', '3400'),
(16, 'Barrio San Martín', '3400'),
(17, 'Centro', '3450'),
(17, 'Barrio Norte', '3450'),
(17, 'Barrio Sur', '3450'),
(18, 'Centro', '3230'),
(18, 'Quinta Sección Palmar', '3230'),
(18, 'Barrio Coviyal', '3230'),
(19, 'Centro', '3100'),
(19, 'San Agustín', '3100'),
(19, 'Bajada Grande', '3100'),
(20, 'Centro', '3200'),
(20, 'Villa Zorraquín', '3200'),
(20, 'Barrio Golf', '3200'),
(21, 'Centro', '2820'),
(21, 'Barrio Parque', '2820'),
(21, 'Barrio Pueblo Nuevo', '2820'),
(22, 'Centro', '3600'),
(22, 'Villa del Carmen', '3600'),
(22, 'San Francisco', '3600'),
(23, 'Centro', '3610'),
(23, 'Barrio 1 de Mayo', '3610'),
(23, 'Barrio Porteño Norte', '3610'),
(24, 'Centro', '3700'),
(24, 'Barrio Norte', '3700'),
(24, 'Barrio Sur', '3700'),
(25, 'Centro', '4600'),
(25, 'Barrio Los Perales', '4600'),
(25, 'Alto Comedero', '4600'),
(26, 'Centro', '4612'),
(26, 'Barrio Sarmiento', '4612'),
(26, 'Barrio San José', '4612'),
(27, 'Centro', '4512'),
(27, 'Barrio Ledesma', '4512'),
(27, 'Barrio Eva Perón', '4512'),
(28, 'Centro', '6300'),
(28, 'Barrio Sur', '6300'),
(28, 'Villa Parque', '6300'),
(29, 'Centro', '6360'),
(29, 'Barrio Este', '6360'),
(29, 'Barrio Norte', '6360'),
(30, 'Centro', '6303'),
(30, 'Barrio Los Hornos', '6303'),
(30, 'Barrio Villa Parque', '6303'),
(31, 'Centro', '5300'),
(31, 'Barrio Matadero', '5300'),
(31, 'Barrio Yacampis', '5300'),
(32, 'Centro', '5360'),
(32, 'Barrio Paimán', '5360'),
(32, 'Barrio San Miguel', '5360'),
(33, 'Centro', '5310'),
(33, 'Barrio Belgrano', '5310'),
(33, 'Barrio La Florida', '5310'),
(34, 'Centro', '5500'),
(34, 'Godoy Cruz', '5501'),
(34, 'Las Heras', '5502'),
(35, 'Ciudad', '5600'),
(35, 'El Cerrito', '5603'),
(35, 'Cuadro Benegas', '5604'),
(36, 'Villa Hipódromo', '5501'),
(36, 'Carrodilla', '5505'),
(36, 'Trapiche', '5501'),
(37, 'Centro', '3300'),
(37, 'Villa Cabello', '3300'),
(37, 'Itaembé Miní', '3300'),
(38, 'Centro', '3360'),
(38, 'Barrio Norte', '3360'),
(38, 'Barrio 100 Hectáreas', '3360'),
(39, 'Centro', '3380'),
(39, 'Km 2', '3380'),
(39, 'Km 18', '3380'),
(40, 'Centro', '8300'),
(40, 'Alta Barda', '8300'),
(40, 'Confluencia', '8300'),
(41, 'Centro', '8370'),
(41, 'Barrio El Arenal', '8370'),
(41, 'Barrio Kaleuche', '8370'),
(42, 'Centro', '8322'),
(42, 'Barrio Pueblo Nuevo', '8322'),
(42, 'Barrio General Enrique Mosconi', '8322'),
(43, 'Centro', '8500'),
(43, 'Barrio San Martín', '8500'),
(43, 'Barrio Parque Independencia', '8500'),
(44, 'Centro', '8400'),
(44, 'Barrio Melipal', '8400'),
(44, 'Barrio Belgrano', '8400'),
(45, 'Centro', '8332'),
(45, 'Barrio Stefenelli', '8332'),
(45, 'Barrio La Rivera', '8332'),
(46, 'Centro', '4400'),
(46, 'Barrio San Bernardo', '4400'),
(46, 'Barrio Grand Bourg', '4400'),
(47, 'Centro', '4530'),
(47, 'Barrio 20 de Febrero', '4530'),
(47, 'Barrio Libertad', '4530'),
(48, 'Centro', '4560'),
(48, 'Barrio Santa María', '4560'),
(48, 'Barrio Villa Saavedra', '4560'),
(49, 'Centro', '5400'),
(49, 'Barrio Centro Cívico', '5400'),
(49, 'Barrio Las Chacritas', '5400'),
(50, 'Centro', '5425'),
(50, 'Barrio Ullum', '5425'),
(50, 'Barrio Santa Lucía', '5425'),
(51, 'Centro', '5413'),
(51, 'Barrio Los Andes', '5413'),
(51, 'Barrio Tránsito', '5413'),
(52, 'Centro', '5700'),
(52, 'Barrio Cuyo', '5700'),
(52, 'Barrio La Florida', '5700'),
(53, 'Centro', '5730'),
(53, 'Barrio Jardín del Sur', '5730'),
(53, 'Barrio La Ribera', '5730'),
(54, 'Centro', '5881'),
(54, 'Barrio Cerro de Oro', '5881'),
(54, 'Barrio Piedras Blancas', '5881'),
(55, 'Centro', '9400'),
(55, 'Barrio Belgrano', '9400'),
(55, 'Barrio Fátima', '9400'),
(56, 'Centro', '9011'),
(56, 'Barrio 26 de Junio', '9011'),
(56, 'Barrio Rotary 23', '9011'),
(57, 'Centro', '9405'),
(57, 'Barrio Las Quintas', '9405'),
(57, 'Barrio Lago Argentino', '9405'),
(58, 'Candioti', '3000'),
(58, 'La Florida', '3001'),
(58, 'Barrio Sur', '3002'),
(59, 'Centro', '2000'),
(59, 'Pichincha', '2000'),
(59, 'Arroyito', '2001'),
(60, 'Barrio 9 de Julio', '2300'),
(60, 'Barrio Alberdi', '2301'),
(60, 'Barrio Pizzurno', '2302'),
(61, 'Centro', '4200'),
(61, 'Barrio Almirante Brown', '4200'),
(61, 'Barrio Belgrano', '4200'),
(62, 'Centro', '4300'),
(62, 'Barrio Salta Prolongación', '4300'),
(62, 'Barrio Tabla Redonda', '4300'),
(63, 'Centro', '4220'),
(63, 'Barrio La Aguada', '4220'),
(63, 'Barrio Centro Termal', '4220'),
(64, 'Centro', '9410'),
(64, 'Barrio Andorra', '9410'),
(64, 'Barrio Los Fueguinos', '9410'),
(65, 'Centro', '9420'),
(65, 'Barrio AGP', '9420'),
(65, 'Barrio Chacra II', '9420'),
(66, 'Centro', '9412'),
(66, 'Barrio 9 de Octubre', '9412'),
(70, 'San Isidro', '1642'),
(70, 'Acassuso', '1641'),
(70, 'Beccar', '1643'),
(71, 'Belgrano', '1430'),
(71, 'Liniers', '1408'),
(71, 'La Boca', '1155'),
(71, 'Palermo', '1425'),
(71, 'Villa Devoto', '1419')

Insert Into Usuarios (Username, Pass, IdRol)
Values 
('juan.admin', 'juan123', 1),
('San.Gabriel.filial', 'sanga2', 3),
('raul.donante', 'raul123', 2),
('un.donante', 'abc123', 2),
('paco.donante', 'soypaco', 2),
('jorgito.donante', '123456', 2),
('pedro.donante', 'aguantedonar', 2),
('pablito.donante', 'donamadonna', 2),
('hospital.pirovano', 'soyfilial', 3),
('velez.sarfield', 'fil123', 3),
('imaginacion.filial', 'img159', 3),
('otra.filial', '159753', 3),
('ultima.filial', 'junio1', 3)

Insert Into Direcciones_x_Usuario (IdUsuario, IdLocalidad, Calle, Altura, Piso, Departamento, Comentarios) 
Values 
(2, 198, 'Blanco Encalada', 158, NULL, NULL, 'Clinica San Gabriel'),
(3, 2, 'Calle 464', 3156, 2, 'C', NULL),
(4, 6, 'Calle 155', 4173, NULL, NULL, NULL),
(5, 201, 'Mendoza', 1767, NULL, NULL, NULL),
(6, 201, 'Migueletes', 2363, NULL, NULL, NULL),
(7, 205, 'Gualeguaychu', 3232, 6, 'A', NULL),
(8, 205, 'Marcos Paz', 3703, NULL, NULL, NULL),
(9, 201, 'Av. Monroe', 3555, NULL, NULL, 'Hospital Pirovano'),
(10, 202, 'Pedro Calderon de la Barca', 1550, NULL, NULL, 'Hospital Pirovano'),
(11, 203, 'Pi y Margall', 750, NULL, NULL, 'Hospital Argerich'),
(12, 204, 'Av. Cerviño', 3356, NULL, NULL, 'Hospital Fernandez'),
(13, 205, 'Nueva York', 3952, NULL, NULL, 'Hospital Pirovano')

Insert Into GruposSanguineos(IdGrupoSanguineo, Grupo) Values
(1,'A+'),
(2,'A-'),
(3,'B+'),
(4,'B-'),
(5,'AB+'),
(6,'AB-'),
(7,'O+'),
(8,'O-')

INSERT INTO DonacionesPosibles (IdGrupoDonante, IdGrupoReceptor) VALUES 
(1,1),
(1,5),
(2,1),
(2,2),
(2,5),
(2,6),
(3,3),
(3,5),
(4,3),
(4,4),
(4,5),
(4,6),
(5,5),
(6,5),
(6,6),
(7,1),
(7,3),
(7,5),
(7,7),
(8,1),
(8,2),
(8,3),
(8,4),
(8,5),
(8,6),
(8,7),
(8,8)

INSERT INTO RecepcionesPosibles(IdGrupoReceptor, IdGrupoDonante) VALUES 
(1,1),
(1,2),
(1,7),
(1,8),
(2,2),
(2,8),
(3,3),
(3,4),
(3,7),
(3,8),
(4,4),
(4,8),
(5,1),
(5,2),
(5,3),
(5,4),
(5,5),
(5,6),
(5,7),
(5,8),
(6,2),
(6,4),
(6,6),
(6,8),
(7,7),
(7,8),
(8,8)

Insert Into Donantes (IdUsuario, Nombre, Apellido, Dni, FechaNacimiento, IdGrupoSanguineo, UrlFoto) Values 
(3, 'Raul', 'Rolon', '30565812', '1990-01-01', 5, 'https://img.freepik.com/foto-gratis/chico-guapo-seguro-posando-contra-pared-blanca_176420-32936.jpg?size=626&ext=jpg&ga=GA1.1.1488620777.1708214400&semt=sph'),
(4, 'Osvaldo', 'Negri', '27653986', '1985-12-16', 2, 'https://images.ecestaticos.com/vU8sC8tLdkx-2YYh1fkOGL8vfeY=/0x0:990x557/1200x900/filters:fill(white):format(jpg)/f.elconfidencial.com%2Foriginal%2F62c%2Fe5d%2F314%2F62ce5d3141c0b670144a692b7f6a21fa.jpg'),
(5, 'MIchael', 'Jordan', '856324', '1993-11-05', 3, 'https://media.gq.com.mx/photos/61780a08f865d472dfcd66c8/master/w_2560%2Cc_limit/GettyImages-1225777369.jpg'),
(6, 'Jorgito', 'Perez', '8623515', '1991-03-01', 1, 'https://media.revistagq.com/photos/621343d2c789a63cc825a58b/16:9/w_2367,h_1331,c_limit/virgen%20a%20lo%2040.jpeg'),
(7, 'Pedro', 'Dominguez', '25326458', '1994-01-06', 8, 'https://us.123rf.com/450wm/carballo/carballo2008/carballo200800131/152787240-joven-adolescente-hombre-apuntando-aislado-sobre-fondo-de-color-con-camiseta-blanca.jpg?ver=6'),
(8, 'Pablito', 'Blood', '38568296', '1975-08-11', 3, 'https://previews.123rf.com/images/warrengoldswain/warrengoldswain1201/warrengoldswain120100216/11900075-retrato-est%C3%A1ndar-de-una-persona-real-isloated-en-blanco.jpg')

Insert Into Filiales (IdUsuario, Nombre, Telefono, HorarioAtencion, Correo, UrlImagen, UrlWeb) Values 
(2, 'Clinica San Gabriel', '11-5368-8796', 'Lun a Vie 9:00 a 20:00 - Sab, Dom y Feriados 9:00 a 15:00', 'quiero.donar@clinicasangabriel.com','https://lh5.googleusercontent.com/proxy/dyoXByWBDd5w5Otft5ZlobI5Zx-du5WpMrJvgeC09BYXqRP4ZcfQcCSdoQWZp82IE54YQ--621ucLh6wyhDki46V6PS5wiQ17MMsdz8N', 'https://www.instagram.com/clinica.san.gabriel/'),
(9, 'Hospital Pirovano', 'No Tiene', 'Lun a Vie 9:00 a 18:00', 'donacionesr@hospitalpirovano.com','https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS-AkvdiQmfpghcMbRR9YfSalsXgTxknxjyKA&s', 'https://buenosaires.gob.ar/salud/hospitales-y-establecimientos-de-salud/hospitalpirovano'),
(10, 'Hospital Velez Sarfield', '11-4639-8700', 'Abrimos cuando queremos', 'No tenemos','https://www.medmun.org.ar/wp-content/uploads/2024/04/WhatsApp-Image-2024-04-05-at-15.19.39.jpeg', 'https://buenosaires.gob.ar/salud/hospitales-y-establecimientos-de-salud/hospital-velez-sarsfield'),
(11, 'Hospital Argerich', '11-4121-0700', '24 / 7', 'hospitalargerich@gmail.com','https://buenosaires.gob.ar/sites/default/files/media/image/2018/11/29/a96e327336207c2e75861f534b4fa754c96635ca.jpg', 'https://buenosaires.gob.ar/salud/hospitales-y-establecimientos-de-salud/hospital-argerich'),
(12, 'Hospital Fernandez', '11-4808-2600', 'Estamos siempre que nos necesites', 'fernandez@hospital.com','https://upload.wikimedia.org/wikipedia/commons/4/46/DefPuebloCABA_-_hospital_Fernandez.jpg', 'https://buenosaires.gob.ar/salud/hospitales-y-establecimientos-de-salud/hospital-fernandez'),
(13, 'Hospital Dr. Abel Zubizarreta', '11-4501-5985', 'Lunes a Sabados de 9:00 a 22:00', 'elzubi@dona.com','https://buenosaires.gob.ar/sites/default/files/media/image/2015/09/18/b97af68b93dcf75c7bfe1902535506dead9595b2.jpg', 'https://buenosaires.gob.ar/salud/hospitales-y-establecimientos-de-salud/hospital-zubizarreta')


Insert into Administradores (IdUsuario, Nombre) Values 
(1,'Juan')

INSERT INTO Urgencias(IdUrgencia, Descripcion) VALUES
(1, 'Baja'),
(2, 'Media'),
(3, 'Alta')

INSERT INTO Publicaciones(IdFilial, NombreReceptor, IdGrupoSanguineo, IdUrgencia, DonantesNecesarios, Horario, FechaLimite) VALUES
(1, 'Horacio Lopez', 3, 3, 5, 'De 9 a 12 todos los dias', '2024-09-15'),
(1, 'Jorge Rodriguez', 5, 2, 10, 'De 9 a 12 todos los dias', '2024-10-01'),
(1, 'Panco Mido', 8, 1, 3, 'De 9 a 12 todos los dias', '2024-11-02'),
(2, 'Feliza Rampion', 1, 3, 2, '24hs', '2024-07-15'),
(3, 'Osvaldo Laport', 2, 3, 4, 'De Lunes a Viernes de 10 a 14hs', '2024-07-30'),
(3, 'LeBron James', 2, 2, 4, 'De Lunes a Viernes de 10 a 14hs', '2024-06-30'),
(3, 'Flavio Mendoza', 3, 1, 3, 'De Lunes a Viernes de 10 a 14hs', '2024-09-15'),
(3, 'Alberto Fernandez', 6, 1, 2, 'De Lunes a Viernes de 10 a 14hs', '2024-10-17')

INSERT INTO DonacionesRealizadas(IdDonante, IdFilial, IdPublicacion, FechaDonacion) VALUES
(1, 1, 1, '2023-10-01'),
(2, 1, 1, '2023-11-11'),
(3, 1, 1, '2023-07-05'),
(4, 1, 1, '2022-12-21'),
(2, 1, 1, '2023-08-03'),
(4, 1, 1, '2024-03-24'),
(1, 1, 1, '2024-01-10')