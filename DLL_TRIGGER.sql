-- EJERCICIO 4
-- Base de dato para Auditorias
--PARTE A
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

Use  

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

CREATE TRIGGER ControlarNuevoMantenimiento
ON MANTENIMIENTO
INSTEAD OF insert
AS
BEGIN
    INSERT INTO Mantenimiento
	SELECT I.Planta_ID, I.Fecha_Hora_Mant,I.Descripcion,I.Tipo_Mantenimiento,I.Horas_Empleadas, I.Costo_Mantenimiento
	FROM inserted I,Planta P
	WHERE 
	I.Planta_ID=P.Planta_ID AND
	I.Fecha_Hora_Mant > P.Fecha_Nac 
END


-- PARTE ADICIONAL
-- CONTROLA QUE INSERT DE MANTINIMIENTO NO SEA NULO CUANDO EL TIPO DE MANTENIMIENTO ES 'N' NUTRIENTES
--SOLO SE PUEDE CREAR UN TRIGGER POR TABLA PERO LO PONEMOS APARTE PORQUE NO ERA REQUERIMIENTO DEL OBLIGATORIO ESTE TRIGGER

CREATE TRIGGER ControlarNuevoMantenimientoNutrientes
ON MANTENIMIENTO
INSTEAD OF insert
AS
BEGIN
   
    INSERT INTO Mantenimiento
	SELECT I.Planta_ID, I.Fecha_Hora_Mant,I.Descripcion,I.Tipo_Mantenimiento,I.Horas_Empleadas, I.Costo_Mantenimiento
	FROM inserted I,Planta P
	WHERE 
	I.Planta_ID=P.Planta_ID AND
	I.Fecha_Hora_Mant > P.Fecha_Nac 	
    EXCEPT
	SELECT I.Planta_ID, I.Fecha_Hora_Mant,I.Descripcion,I.Tipo_Mantenimiento,I.Horas_Empleadas, I.Costo_Mantenimiento
	FROM inserted I,Planta P
	WHERE 
	I.Planta_ID=P.Planta_ID AND
	I.Fecha_Hora_Mant > P.Fecha_Nac AND
	I.Tipo_Mantenimiento='O' AND I.Costo_Mantenimiento= ''

	
END


