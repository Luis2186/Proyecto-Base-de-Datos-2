--EJERCICIO 1
CREATE DATABASE Pflanze

USE Pflanze

CREATE TABLE Planta (Planta_ID INT IDENTITY(1,1) NOT NULL,
					  Nombre VARCHAR(50) NOT NULL,
					  Fecha_Nac DATE NOT NULL,
					  Altura NUMERIC,
					  Fecha_Ult_Medicion DATETIME ,
					  Precio NUMERIC(10,2),
					  CONSTRAINT PK_Planta PRIMARY KEY(Planta_ID),
					  CONSTRAINT CK_Planta_Altura CHECK(Altura <=12000)
				  )

CREATE TABLE Tags (Tag_Id INT NOT NULL IDENTITY(1,1) ,
                   Tag_Nombre VARCHAR(50),
				   CONSTRAINT PK_Tags PRIMARY KEY(Tag_Id)
				   )

CREATE TABLE Tags_De_Plantas (Tag_Id INT NOT NULL,
							  Planta_ID INT NOT NULL,
							  CONSTRAINT FK_Tags_De_Plantas_Planta_ID FOREIGN KEY(Planta_ID) REFERENCES Planta(Planta_Id),
							  CONSTRAINT FK_Tags_De_Plantas_Tag_Id FOREIGN KEY(Tag_Id) REFERENCES Tags(Tag_Id),
)

CREATE TABLE Mantenimiento (Mantenimiento_ID INT IDENTITY(1,1) NOT NULL,
							Planta_ID INT NOT NULL,
							Fecha_Hora_Mant DATETIME NOT NULL,
							Descripcion VARCHAR(60) NOT NULL,
							Tipo_Mantenimiento CHARACTER(1) NOT NULL , 						
							Horas_Empleadas NUMERIC(10,2) ,
							Costo_Mantenimiento NUMERIC(10,2) ,							
							CONSTRAINT PK_Mantenimiento PRIMARY KEY(Mantenimiento_ID),
							CONSTRAINT FK_Mantenimiento_Planta_ID FOREIGN KEY(Planta_ID) REFERENCES Planta(Planta_Id),
							CONSTRAINT CK_Tipo_Mantenimiento CHECK(Tipo_Mantenimiento IN('O','N'))
)

CREATE TABLE Producto (  Codigo_Producto CHARACTER(5) NOT NULL,
						 Descripcion_Producto VARCHAR(60) NOT NULL,
						 Precio_Producto NUMERIC(10,2) NOT NULL,
						 CONSTRAINT PK_Productos PRIMARY KEY(Codigo_Producto),
						 CONSTRAINT UK_Productos UNIQUE(Descripcion_Producto)
)

CREATE TABLE Productos_Usados (Mantenimiento_ID INT NOT NULL,
							   Codigo_Producto CHARACTER(5) NOT NULL,
							   Cantidad_Producto NUMERIC(10,2) ,
							   Costo_Apl_Producto NUMERIC(10,2),
							   CONSTRAINT FK_Productos_Usados_Mantenimiento_ID FOREIGN KEY(Mantenimiento_ID) REFERENCES Mantenimiento(Mantenimiento_ID),							   
							   CONSTRAINT FK_Productos_Usados_Codigo_Producto FOREIGN KEY(Codigo_Producto) REFERENCES Producto(Codigo_Producto),

)

-- Indices de Foreign Key

-- Tabla Tags_De_Plantas
CREATE INDEX IDX_Tag_Id ON Tags_De_Plantas(Tag_Id)
CREATE INDEX IDX_Planta_Id ON Tags_De_Plantas(Planta_Id)

-- Tabla Mantenimiento
CREATE INDEX IDX_Planta_Id ON Mantenimiento(Planta_Id)

-- Tabla Productos usados
CREATE INDEX IDX_Mantenimiento_ID ON Productos_Usados(Mantenimiento_ID)
CREATE INDEX IDX_Codigo_Producto ON Productos_Usados(Codigo_Producto) 


