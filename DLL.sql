--EJERCICIO 1
CREATE DATABASE Pflanze

USE Pflanze

CREATE TABLE PLANTA (Planta_ID INT IDENTITY(1,1) NOT NULL,
					  Nombre VARCHAR(50) NOT NULL,
					  Fecha_Nac DATE NOT NULL,
					  Altura NUMERIC,
					  Fecha_Ult_Medicion DATETIME ,
					  Precio MONEY,
					  CONSTRAINT PK_Planta PRIMARY KEY(Planta_ID),
					  CONSTRAINT CK_Planta_Altura CHECK(Altura BETWEEN 0 AND 12000)
				  )

CREATE TABLE TAGS (Tag_Id INT NOT NULL IDENTITY(1,1) ,
                   Tag_Nombre VARCHAR(50),
				   CONSTRAINT PK_Tags PRIMARY KEY(Tag_Id)
				   )

CREATE TABLE TAGS_DE_PLANTAS (Tag_Id INT NOT NULL,
							  Planta_ID INT NOT NULL,
							  CONSTRAINT FK_Tags_De_Plantas_Planta_ID FOREIGN KEY(Planta_ID) REFERENCES Planta(Planta_Id),
							  CONSTRAINT FK_Tags_De_Plantas_Tag_Id FOREIGN KEY(Tag_Id) REFERENCES Tags(Tag_Id),
)

CREATE TABLE MANTENIMIENTO (Mantenimiento_ID INT IDENTITY(1,1) NOT NULL,
							Planta_ID INT NOT NULL,
							Fecha_Hora_Mant DATETIME NOT NULL,
							Descripcion VARCHAR(60) NOT NULL,
							Tipo_Mantenimiento CHARACTER(1) NOT NULL , 						
							Horas_Empleadas NUMERIC(10,2) ,
							Costo_Mantenimiento MONEY ,							
							CONSTRAINT PK_Mantenimiento PRIMARY KEY(Mantenimiento_ID),
							CONSTRAINT FK_Mantenimiento_Planta_ID FOREIGN KEY(Planta_ID) REFERENCES Planta(Planta_Id),
							CONSTRAINT CK_Tipo_Mantenimiento CHECK(Tipo_Mantenimiento IN('O','N'))
)

CREATE TABLE PRODUCTO (  Codigo_Producto CHARACTER(5) NOT NULL,
						 Descripcion_Producto VARCHAR(60) NOT NULL,
						 Precio_Producto MONEY NOT NULL,
						 CONSTRAINT PK_Productos PRIMARY KEY(Codigo_Producto),
						 CONSTRAINT UK_Productos UNIQUE(Descripcion_Producto)
)

CREATE TABLE PRODUCTOS_USADOS (Mantenimiento_ID INT NOT NULL,
							   Codigo_Producto CHARACTER(5) NOT NULL,
							   Cantidad_Producto NUMERIC(10,2) ,
							   Costo_Apl_Producto MONEY,
							   CONSTRAINT FK_Productos_Usados_Mantenimiento_ID FOREIGN KEY(Mantenimiento_ID) REFERENCES Mantenimiento(Mantenimiento_ID),							   
							   CONSTRAINT FK_Productos_Usados_Codigo_Producto FOREIGN KEY(Codigo_Producto) REFERENCES Producto(Codigo_Producto),

)




