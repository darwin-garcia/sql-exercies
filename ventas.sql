CREATE TABLE Empleado
(
	IdEmpleado			int  Primary Key , 
	Apellidos			varchar (40), 
	Nombre			varchar (20), 
	Cargo			varchar (60), 
	Tratamiento			varchar (50), 
	FechaNacimiento			date, 
	FechaContratación			date, 
	Direccion			varchar (120), 
	Ciudad			varchar (30), 
	Region			varchar (30), 
	CodPostal			varchar (20), 
	Pais			varchar (30), 
	TelDomicilio			varchar (48), 
	Extension			varchar (8), 
	Foto			varchar (510), 
	Notas			text (255), 
	Jefe			int



);



CREATE TABLE Cliente
(
	IdCliente			varchar (10)  Primary Key , 
	NombreEmpresa			varchar (80), 
	NombreContacto			varchar (60), 
	CargoContacto			varchar (60), 
	Direccion			varchar (120), 
	Ciudad			varchar (30), 
	Region			varchar (30), 
	CodPostal			varchar (20), 
	Pais			varchar (30), 
	Telefono			varchar (48), 
	Fax			varchar (48));
  





CREATE TABLE EmpresasTransporte
(
	IdEmpresasTransporte			int Primary Key, 
	NombreEmpresa			varchar (80), 
	Telefono			varchar (48)


);



CREATE TABLE Pedido
(
	IdPedido			int , 
	IdCliente			varchar (10), 
	IdEmpleado			int, 
	FechaPedido			date, 
	FechaEntrega			date, 
	FechaEnvio			date, 
	IdEmpresasTransporte			int, 
	Cargo			float, 
	Destinatario			varchar (80), 
	DireccionDestinatario			varchar (120), 
	CiudadDestinatario			varchar (30), 
	RegionDestinatario			varchar (30), 
	CodPostalDestinatario			varchar (20), 
	PaisDestinatario			varchar (30));

Alter table Pedido
ADD constraint FKCliente Foreign key (IdCliente)REFERENCES cliente;
Alter table Pedido
ADD constraint FKEmpleado Foreign key (IdEmpleado)REFERENCES empleado ;
Alter table Pedido
ADD constraint FKEmpresaTransporte Foreign key (IdEmpresaTransporte)REFERENCES empresastransporte;
ALTER TABLE Pedido
ADD PRIMARY KEY (idPedido)



?CREATE TABLE Categoria
(
	IdCategoria			int Primary Key, 
	NombreCategoria			varchar (30), 
	Descripcion			text (255)

);





CREATE TABLE Proveedor
(
	IdProveedor			int Primary Key, 
	NombreEmpresa			varchar (80), 
	NombreContacto			varchar (60), 
	CargoContacto			varchar (60), 
	Direccion			varchar (120), 
	Ciudad			varchar (30), 
	Region			varchar (30), 
	CodPostal			varchar (20), 
	Pais			varchar (30), 
	Telefono			varchar (48), 
	Fax			varchar (48), 
	PaginaPrincipal			text (255)

);






CREATE TABLE Producto
(
	IdProducto			int Primary Key, 
	NombreProducto			varchar (80), 
	IdProveedor			int, 
	IdCategoria			int, 
	CantidadPorUnidad			varchar (40), 
	PrecioUnidad			float, 
	UnidadesEnExistencia			int, 
	UnidadesEnPedido			int, 
	NivelNuevoPedido			int, 
	Suspendido			char
Alter table Pedido
ADD constraint FKCategoria Foreign key (IdCategoria);
Alter table Pedido
ADD constraint FKProvedor Foreign key (IdProvedor);
);





CREATE TABLE Detalles_de_Pedido
(
	IdPedido			int, 
	IdProducto			int, 
	PrecioUnidad			float, 
	Cantidad			int, 
	Descuento			float
Alter table Detalles_de_Pedido
ADD constraint PKDetalles_de_Pedido Primary Key (IdPedido,IdProducto);
);