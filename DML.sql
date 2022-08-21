USE Pflanze


--EJERCICIO 2

--PARTE A


SELECT P.NOMBRE, M.DESCRIPCION  
	FROM PLANTA P join MANTENIMIENTO M
		ON P.PLANTA_ID=M.PLANTA_ID
	WHERE DATEPART(YEAR,M.FECHA_HORA_MANT)=DATEPART(YEAR,GETDATE())
		AND M.FECHA_HORA_MANT=(SELECT MAX(FECHA_HORA_MANT) 
									FROM MANTENIMIENTO)

--PARTE B

SELECT P.*
FROM PLANTA P , (SELECT PLANTA_ID FROM MANTENIMIENTO
					GROUP BY Planta_ID
					HAVING COUNT(*)= (SELECT MAX(MR.MANTENIMIENTOS_REALIZADOS) 
										FROM (SELECT PLANTA_ID, COUNT(MANTENIMIENTO_ID) AS MANTENIMIENTOS_REALIZADOS
												FROM MANTENIMIENTO
												GROUP BY PLANTA_ID) MR)) PMR
WHERE P.PLANTA_ID=PMR.PLANTA_ID


-- PARTE C

SELECT P.*
FROM PLANTA P, ( SELECT ANIO_ACTUAL.PLANTA_ID
					FROM
						(SELECT PLANTA_ID, SUM(COSTO_MANTENIMIENTO) COSTO_TOTAL, DATEPART(YEAR,FECHA_HORA_MANT) ANIO_MANT
							FROM MANTENIMIENTO 
								WHERE DATEPART(YEAR,FECHA_HORA_MANT) =  DATEPART(YEAR,GETDATE())
							GROUP BY PLANTA_ID, DATEPART(YEAR,FECHA_HORA_MANT)) ANIO_ACTUAL,
						(SELECT PLANTA_ID, SUM(COSTO_MANTENIMIENTO) COSTO_TOTAL, DATEPART(YEAR,FECHA_HORA_MANT) ANIO_MANT
							FROM MANTENIMIENTO 
								WHERE DATEPART(YEAR,FECHA_HORA_MANT) =  DATEPART(YEAR,GETDATE()) -1
							GROUP BY PLANTA_ID, DATEPART(YEAR,FECHA_HORA_MANT)) ANIO_ANTERIOR
					  WHERE ANIO_ACTUAL.PLANTA_ID= ANIO_ANTERIOR.PLANTA_ID
						AND ANIO_ACTUAL.COSTO_TOTAL > (ANIO_ANTERIOR.COSTO_TOTAL * 20) /100 + ANIO_ANTERIOR.COSTO_TOTAL) PL_AUMENTO_COSTO
WHERE P.PLANTA_ID = PL_AUMENTO_COSTO.PLANTA_ID
	AND DATEPART(YEAR,P.FECHA_NAC) <= 2019


-- PARTE  D
SELECT * 
	FROM PLANTA P, (SELECT TDP.PLANTA_ID 
							FROM TAGS_DE_PLANTAS TDP, TAGS T
							WHERE T.TAG_ID= TDP.TAG_ID
							AND T.TAG_NOMBRE='FRUTAL'
							INTERSECT 
							SELECT TDP.PLANTA_ID 
							FROM TAGS_DE_PLANTAS TDP, TAGS T
							WHERE T.TAG_ID= TDP.TAG_ID
							AND T.TAG_NOMBRE='PERFUMA'
							EXCEPT
							SELECT TDP.PLANTA_ID 
							FROM TAGS_DE_PLANTAS TDP, TAGS T
							WHERE T.TAG_ID= TDP.TAG_ID
							AND T.TAG_NOMBRE='TRONCOROTO') TAGS_PLANTAS
	WHERE P.PLANTA_ID= TAGS_PLANTAS.PLANTA_ID

-- PARTE E 

--OPCION A , UTILIZANDO TRIGGER DE RESTRICCION DE MANTENIMIENTO_ID Y CODIGO_PRODUCTO
/*
1-  Se utiliza la funcion count, para contar la cantidad de tipos de productos usados por manteniento_id ,
teniendo en cuenta que para un mismo mantenimiento no podria haber mas de una fila por cada codigo de producto.
2- Se  utiliza como condicion con la clausula Having  que la cuenta de la tabla productos_usados sea igual a la cuenta 
de productos existentes en la tabla productos.Se guarda la vista con los id de mantenimiento que cumplen 
la condicion en la "tabla,vista" MANT_ID 
3-Se aplica producto cartesiano a la la tabla mantenimiento y  a la vista MANT_ID  comparando los id de mantenimiento, 
para obtener los id de las plantas que cumplen con la condicion.Se guarda en la "tabla,vista" PLANT_ID 
4 - Se aplica producto cartesiano a la la tabla PLANTA y  a la vista PLANT_ID  comparando los id de planta, 
para obtener las plantas que cumplen con la condicion.
*/
 SELECT P.*
FROM PLANTA P, (SELECT M.PLANTA_ID  
					FROM  MANTENIMIENTO M, (SELECT  MANTENIMIENTO_ID
											FROM PRODUCTOS_USADOS 
											GROUP BY MANTENIMIENTO_ID
										HAVING COUNT(CODIGO_PRODUCTO)=(SELECT COUNT(*) 
																		FROM PRODUCTO)) MANT_ID
				WHERE M.MANTENIMIENTO_ID= MANT_ID.MANTENIMIENTO_ID) PLANT_ID
WHERE P.PLANTA_ID= PLANT_ID.PLANTA_ID 

-- OPCION B , SINO NO  HAY CONTROL DE DATOS DUPLICADOS EN LA TABLA PRODUCTOS USADOS
/* A la logica de la opcion a se agrega otra subconsulta usando distin para que el count no cuente registros duplicados*/

SELECT P.* 
FROM PLANTA P , (SELECT M.PLANTA_ID		
					FROM MANTENIMIENTO M, (SELECT  PU.MANTENIMIENTO_ID 
												FROM (SELECT DISTINCT CODIGO_PRODUCTO,MANTENIMIENTO_ID
														FROM Productos_Usados  ) PU 
														GROUP BY Mantenimiento_ID
												HAVING COUNT(PU.CODIGO_PRODUCTO)= (SELECT COUNT(*) 
																						FROM PRODUCTO)) MP
					WHERE M.MANTENIMIENTO_ID=MP.MANTENIMIENTO_ID) MANT_ID
WHERE P.PLANTA_ID= MANT_ID.PLANTA_ID

--PARTE F
 /*
1-Se calcula el total del costo de mantenimiento por planta ( TOTAL_MANTENIMIENTO) aplicando funcion SUM a
la columna COSTO_MANTENIMIENTO de la tabla manteminiento agrupando por id de planta. Se guarda en la "Tabla/vista" llamada  CM 
2- Con producto cartesiano de la CM y la tabla planta se muestra  la planta con su coste total de manteniento, filtrando las 
condiciones indicadas en el ejercicio en la clausula where. */

SELECT P.*, CM.TOTAL_MANTENIMIENTO
FROM Planta P,(SELECT SUM(COSTO_MANTENIMIENTO) TOTAL_MANTENIMIENTO,PLANTA_ID
					FROM MANTENIMIENTO
					GROUP BY PLANTA_ID) CM
WHERE P.PLANTA_ID=CM.PLANTA_ID
	AND CM.TOTAL_MANTENIMIENTO > 151
	AND P.PRECIO >200
	AND DATEPART(YEAR,P.FECHA_NAC) <= DATEPART(YEAR,GETDATE())-2




