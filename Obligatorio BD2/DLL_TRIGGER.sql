--EJERCICIO 4

--Parte A
CREATE DATABASE Auditorias
USE Auditorias
CREATE TABLE Auditorias_Produtos ( Codigo_producto char(5),	
								   Descripcion_Producto varchar(60),
								   Precio_Produto Numeric(10,2),
								   Fecha_Modificacion Datetime,
								   Nombre_Usuario varchar(60),
								   Evento varchar(10),
								   Codigo_producto_ant char(5),	
								   Descripcion_Producto_ant varchar(60),
								   Precio_Produto_ant char(10)															 


									
)

Use Pflanze

CREATE TRIGGER Auditoria_Producto
ON Producto
AFTER DELETE, UPDATE
AS 
BEGIN

If EXISTS( Select * FROM deleted) AND NOT EXISTS (Select * from inserted)

INSERT INTO Auditorias.dbo.Auditorias_Produtos
			Select *,getDate(),host_name(),'DELETE','','',''
			from deleted

If EXISTS( Select * FROM deleted) AND  EXISTS (Select * from inserted)

INSERT INTO Auditorias.dbo.Auditorias_Produtos
			Select i.*,getDate(),host_name(),'UPDATE',d.Codigo_Producto,d.Descripcion_Producto,d.Precio_Producto
			from deleted d, inserted i

END



--Parte B