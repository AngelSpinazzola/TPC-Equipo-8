Create Database TPC

Go

Use TPC

Go

Create table Roles(
	IdRol int Not Null Primary Key Identity(1,1),
	Nombre Varchar(20) Not Null
)

Create Table Provincias(
	IdProvincia int Not Null Primary Key Identity(1,1),
	Nombre varchar(50) Null
)

Create Table Ciudades(
	IdCiudad Int Not Null Primary Key Identity (1,1), 
	IdProvinicia Int Null Foreign Key References Provincias(IdProvincia),
	Nombre Varchar(75) Null
)

Create Table Localidades(
	IdLocalidad Int Not Null Primary Key Identity (1,1),
	IdCiudad Int Not Null Foreign Key References Ciudades(IdCiudad),
	Nombre Varchar(75) Null,
	CodigoPostal varchar(10) Null
)

Create table Usuarios(
	IdUsuario Int Not Null primary key identity(1,1),
	Username Varchar(30) Not Null unique,
	Pass Varchar(30) Not Null,
	IdRol int Not Null Foreign Key references Roles(IdRol),
	IdDireccion Varchar(10) Null,
	Estado bit not null default 1
)

Create Table Direcciones_x_Usuario(
	IdDireccion Int Not Null Primary Key Identity(1,1),
	IdUsuario Int Not Null Foreign Key References Usuarios(IdUsuario),
	IdLocalidad Int Not Null Foreign Key References Localidades(IdLocalidad),
	NombreCalle Varchar(75) Not Null,
	Altura int Not Null,
)

Create Table TiposDeSangre(
	IdTipoSangre int not null primary key identity(1,1),
	Nombre varchar(30) not null
)

Create Table Donantes(
	IdDonante int not null primary key identity(1,1),
	IdUsuario int not null foreign key references Usuarios(IdUsuario),
	Nombre varchar(50) not null,
	Apellido varchar(50) not null,
	Dni varchar(30) not null,
	IdTipoSangre int not null foreign key references TiposDeSangre(IdTipoSangre),
	UrlFoto varchar(1000) null
)

Create Table Filiales(
	IdFilial int not null primary key identity(1,1),
	IdUsuario int not null foreign key references Usuarios(IdUsuario),
	Nombre varchar(50) not null,
	Telefono varchar(30) not null,
	HorarioAtencion varchar(100) null,
	Mail varchar(50) null,
	UrlImagen varchar(1000) null,
	UrlWeb varchar(1000) null
)

Create Table Administradores(
	IdAdministrador int not null primary key identity(1,1),
	IdUsuario int not null foreign key references Usuarios(IdUsuario),
	Nombre varchar(30) null
)

Go

Insert Into Roles (Nombre)
Values
('Administrador'),
('Donante'),
('Filial')

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

INSERT INTO Ciudades (IdProvinicia, Nombre) VALUES 
(1, 'La Plata'),
(2, 'San Fernando del Valle de Catamarca'),
(3, 'Resistencia'),
(4, 'Rawson'),
(5, 'Córdoba'),
(6, 'Corrientes'),
(7, 'Paraná'),
(8, 'Formosa'),
(9, 'San Salvador de Jujuy'),
(10, 'Santa Rosa'),
(11, 'La Rioja'),
(12, 'Mendoza'),
(13, 'Posadas'),
(14, 'Neuquén'),
(15, 'Viedma'),
(16, 'Salta'),
(17, 'San Juan'),
(18, 'San Luis'),
(19, 'Río Gallegos'),
(20, 'Santa Fe'),
(21, 'Santiago del Estero'),
(22, 'Ushuaia'),
(23, 'San Miguel de Tucumán'),
(1, 'Mar del Plata'),
(1, 'Bahía Blanca'),
(1, 'Tandil'),
(1, 'Pergamino'),
(15, 'Bariloche'),
(4, 'Comodoro Rivadavia'),
(4, 'Trelew'),
(4, 'Puerto Madryn'),
(20, 'Rafaela'),
(5, 'Villa María'),
(5, 'Río Cuarto'),
(12, 'San Rafael'),
(18, 'Villa Mercedes'),
(6, 'Goya'),
(13, 'Oberá'),
(13, 'Eldorado'),
(7, 'Gualeguaychú'),
(7, 'Concordia'),
(6, 'Paso de los Libres'),
(8, 'Clorinda'),
(10, 'General Pico'),
(19, 'El Calafate'),
(14, 'Zapala'),
(3, 'Presidencia Roque Sáenz Peña'),
(22, 'Río Grande'),
(9, 'Humahuaca'),
(16, 'Cafayate');

INSERT INTO Localidades (IdCiudad, Nombre, CodigoPostal) VALUES 
(1, 'Centro', '1900'),
(1, 'Tolosa', '1901'),
(2, 'Centro', '4700'),
(2, 'Villa Cubas', '4701'),
(3, 'Centro', '3500'),
(3, 'Villa San Martín', '3501'),
(4, 'Centro', '9103'),
(4, 'Playa Unión', '9105'),
(5, 'Centro', '5000'),
(5, 'Nueva Córdoba', '5001'),
(6, 'Centro', '3400'),
(6, 'San Benito', '3401'),
(7, 'Centro', '3100'),
(7, 'San Agustín', '3101'),
(8, 'Centro', '3600'),
(8, 'Villa del Carmen', '3601'),
(9, 'Centro', '4600'),
(9, 'Alto Comedero', '4601'),
(10, 'Centro', '6300'),
(10, 'Toay', '6303'),
(11, 'Centro', '5300'),
(11, 'Sanagasta', '5301'),
(12, 'Centro', '5500'),
(12, 'Godoy Cruz', '5501'),
(13, 'Centro', '3300'),
(13, 'Villa Cabello', '3301'),
(14, 'Centro', '8300'),
(14, 'Plottier', '8316'),
(15, 'Centro', '8500'),
(15, 'Las Grutas', '8521'),
(16, 'Centro', '4400'),
(16, 'Cafayate', '4427'),
(17, 'Centro', '5400'),
(17, 'Rivadavia', '5402'),
(18, 'Centro', '5700'),
(18, 'La Punta', '5701'),
(19, 'Centro', '9400'),
(19, 'El Calafate', '9405'),
(20, 'Centro', '3000'),
(20, 'Recreo', '3038'),
(21, 'Centro', '4200'),
(21, 'Termas de Río Hondo', '4220'),
(22, 'Centro', '9410'),
(22, 'Tolhuin', '9412'),
(23, 'Centro', '4000'),
(23, 'Yerba Buena', '4107'),
(24, 'Centro', '7600'),
(24, 'Punta Mogotes', '7601'),
(25, 'Centro', '8000'),
(25, 'Villa Mitre', '8003'),
(26, 'Centro', '7000'),
(26, 'San Nicolás', '7001'),
(27, 'Centro', '7300'),
(27, 'Villa Italia', '7301'),
(28, 'Centro', '2700'),
(28, 'Mariano Moreno', '2701'),
(29, 'Centro', '8400'),
(29, 'Las Grutas', '8521'),
(30, 'Centro', '9000'),
(30, 'Caleta Olivia', '9011'),
(31, 'Centro', '9100'),
(31, 'Rada Tilly', '9001'),
(32, 'Centro', '9120'),
(32, 'Esquel', '9200'),
(33, 'Centro', '2300'),
(33, 'San Pedro', '2930'),
(34, 'Centro', '5900'),
(34, 'Las Playas', '5901'),
(35, 'Centro', '5800'),
(35, 'Banda Norte', '5801'),
(36, 'Centro', '5600'),
(36, 'Bº El Molino', '5601'),
(37, 'Centro', '5730'),
(37, 'Justo Daract', '5731'),
(38, 'Centro', '3450'),
(38, 'Mercedes', '3470'),
(39, 'Centro', '3360'),
(39, 'San Vicente', '3361'),
(40, 'Centro', '3380'),
(40, 'Aristóbulo del Valle', '3381'),
(41, 'Centro', '2820'),
(41, 'Villa Paranacito', '2823'),
(42, 'Centro', '3200'),
(42, 'Chajarí', '3228'),
(43, 'Centro', '3400'),
(43, 'Paso de los Libres', '3340'),
(44, 'Centro', '7000'),
(44, 'La Emilia', '7011'),
(45, 'Centro', '9120'),
(45, 'Trevelin', '9203'),
(46, 'Centro', '4624'),
(46, 'Tilcara', '4620'),
(47, 'Centro', '4400'),
(47, 'San Lorenzo', '4193'),
(48, 'Centro', '4140'),
(48, 'Cachi', '4417'),
(49, 'Centro', '5100'),
(49, 'Alta Gracia', '5186'),
(50, 'Centro', '4427'),
(50, 'Humahuaca', '4630')


Insert Into Usuarios (Username, Pass, IdRol, IdDireccion, Estado)
Values 
('angel.admin', 'angel123', 1, NULL, 1),
('juan.filial', 'juan123', 3, NULL, 1),
('raul.donante', 'raul123', 2, NULL, 1)

Insert Into Direcciones_x_Usuario (IdUsuario, IdLocalidad, NombreCalle, Altura) 
Values 
(1, 13, 'El Aconcagua', 3263),
(2, 26, 'Av. Falucho', 1398),
(3, 2, 'Entre Rios', 1816)

Insert Into TiposDeSangre (Nombre)
Values
('A+'),
('A-'),
('B+'),
('B-'),
('AB+'),
('AB-'),
('O+'),
('O-')

Insert Into Donantes (IdUsuario, Nombre, Apellido, Dni, IdTipoSangre, UrlFoto)
Values (3, 'Raul', 'Rolon', '30565812', 5, 'https://img.freepik.com/foto-gratis/chico-guapo-seguro-posando-contra-pared-blanca_176420-32936.jpg?size=626&ext=jpg&ga=GA1.1.1488620777.1708214400&semt=sph')

Insert Into Filiales (IdUsuario, Nombre, Telefono, HorarioAtencion, Mail, UrlImagen, UrlWeb)
Values (2, 'Clinica San Gabriel', '11-5368-8796', 'Lun a Vie 9:00 a 20:00 - Sab, Dom y Feriados 9:00 a 15:00', 'quiero.donar@clinicasangabriel.com','https://clinicasdelafamilia.com.ar/wp-content/uploads/clinica-san-pablo-revision-y-opiniones.png', 'https://www.instagram.com/clinica.san.gabriel/')

Insert into Administradores (IdUsuario, Nombre)
Values (1, 'Angel')

Go

Update Usuarios Set IdDireccion = 1 Where IdUsuario = 1
Update Usuarios Set IdDireccion = 2 Where IdUsuario = 2
Update Usuarios Set IdDireccion = 3 Where IdUsuario = 3