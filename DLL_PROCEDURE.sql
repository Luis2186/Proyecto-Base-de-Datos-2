--EJERCICIO 3 
USE Pflanze

-- Parte a
CREATE PROCEDURE UDP_AumentarCostosPlanta 
@Id_Planta INT,
@Porcentaje NUMERIC(10,2), 
@Fecha_Inicial DATE,
@Fecha_Final  DATE
AS 
BEGIN 

Select Planta_ID,(Costo_Mantenimiento * @Porcentaje) /100  AS AUMENTO
from Mantenimiento
where @Id_Planta= Planta_ID and CAST(Fecha_Hora_Mant AS DATE) between  @Fecha_Inicial and @Fecha_Final

Update Mantenimiento
	set Costo_Mantenimiento =  (Costo_Mantenimiento * @Porcentaje) /100 + Costo_Mantenimiento
	where @Id_Planta= Planta_ID and CAST(Fecha_Hora_Mant AS DATE) between  @Fecha_Inicial and @Fecha_Final	
END

EXECUTE UDP_AumentarCostosPlanta 1,10 ,'2018-07-05' ,'2018-07-07'

--Parte B

CREATE FUNCTION UDF_CalculaPromedioMantOperativos(@year int)
RETURNS INT
AS
BEGIN
DECLARE @promedio money

Select @promedio= AVG(Costo_Mantenimiento) 
from Mantenimiento
where DATEPART( YEAR, Fecha_Hora_Mant )=@year
and Tipo_Mantenimiento='O'
RETURN  @promedio
END

Select dbo.UDF_CalculaPromedioMantOperativos(2015) as Promedio_Anual

-- EXTRAS 

-- CALCULA EL COSTO DEL MANTENIMIENTO PARA LOS TIPO DE MANTENIMIENTO NUTRIENTE
CREATE PROCEDURE UDP_CostoMantenimientoNutrientes
AS 
BEGIN 
Update Mantenimiento
set Costo_Mantenimiento= Suma_Costo 
from
(Select  sum(PU.Costo_Apl_Producto) as Suma_Costo,M.Mantenimiento_ID as ID_SC
from Mantenimiento M join Productos_Usados PU
on M.Mantenimiento_ID=PU.Mantenimiento_ID
where M.Tipo_Mantenimiento='N'
group by M.Mantenimiento_ID) AS SC
where Mantenimiento_id=SC.ID_SC
END



