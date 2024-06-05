CREATE TABLE Categorias (
    IdCategoria INT AUTO_INCREMENT PRIMARY KEY,
    NombreCategoria VARCHAR(255) NOT NULL
);

CREATE TABLE Articulos (
    sku INT PRIMARY KEY,
    Descripcion VARCHAR(255) NOT NULL,
    IdCategoria INT,
    Pzas INT,
    Stock INT
);

ALTER TABLE Articulos
ADD CONSTRAINT FK_IdCategoria
FOREIGN KEY (IdCategoria) REFERENCES Categorias(IdCategoria);

CREATE TABLE Usuarios (
	Usuario VARCHAR(255) NOT NULL,
    Password VARCHAR(255) NOT NULL
);

CREATE TABLE Movimientos (
	sku INT,
    Fecha DATE,
    Usuario VARCHAR(255),	
    Motivo VARCHAR(255)
);

ALTER TABLE Movimientos 
ADD CONSTRAINT FK_Usuario 
FOREIGN KEY (Usuario) REFERENCES Usuarios(Usuario);

ALTER TABLE Movimientos
DROP COLUMN Usuario;

ALTER TABLE Movimientos 
ADD COLUMN IdUsuario INT;

ALTER TABLE Usuarios
ADD COLUMN IdUsuario INT AUTO_INCREMENT PRIMARY KEY;

ALTER TABLE Movimientos 
ADD CONSTRAINT FK_IdUsuario 
FOREIGN KEY (IdUsuario) REFERENCES Usuarios(IdUsuario);

ALTER TABLE Movimientos 
ADD CONSTRAINT FK_sku
FOREIGN KEY (sku) REFERENCES Articulos(sku);

CREATE TABLE Proveedores (
	IdProveedor INT AUTO_INCREMENT PRIMARY KEY,
	NombreProveedor VARCHAR(255)
);

ALTER TABLE Articulos
ADD COLUMN IdProveedor INT ;

CREATE TABLE Ordenes_de_Compra (
	IdOrden INT AUTO_INCREMENT PRIMARY KEY,
    IdProveedor INT NOT NULL,
    sku INT NOT NULL,
    Pzas INT NOT NULL
);

ALTER TABLE Articulos
ADD CONSTRAINT FK_IdProveedor 
FOREIGN KEY (IdProveedor) REFERENCES Proveedores(IdProveedor);

ALTER TABLE Ordenes_de_Compra
ADD CONSTRAINT FK_IdProveedorOrd
FOREIGN KEY (IdProveedor) REFERENCES Proveedores(IdProveedor);

ALTER TABLE Ordenes_de_Compra 
ADD CONSTRAINT FK_skuOrd
FOREIGN KEY (sku) REFERENCES Articulos(sku);