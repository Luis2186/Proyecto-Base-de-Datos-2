USE Pflanze
-- INSERT DATOS
INSERT INTO [dbo].[Planta]
           ([Nombre]
           ,[Fecha_Nac]
           ,[Altura]
           ,[Fecha_Ult_Medicion]
           ,[Precio])
     VALUES ('Nardo','2002-07-23',250,'2012-08-23',188.5),
			('Petunia','2003-05-25',460,'2011-03-15',125),
			('Albacha','2003-07-23',35,'2009-07-28',255.33),
			('Romero','2004-05-15',null,null,285.58),
			('Cala','2006-09-18',80,'2006-11-09',317.83),
			('Calendula','2005-05-13',125,'2015-05-19',null),
			('Camelia','2007-10-09',195,'2008-07-09',382),
			('Clavel','2006-11-01',null,null,414),
			('Dalia','2007-12-01',168,'2017-09-01',446.8),
			('Hibisco','2007-11-01',382,'2014-05-03',479.08),
			('Hortensia','2008-07-01',184,'2008-07-08',511),
			('Lirio','2009-01-30',986,'2009-09-15',543.58),
			('Lavanda','2010-10-05',888,'2015-11-11',null),
			('Margarita','2010-07-23',190,'2017-12-23',608.07),
			('Menta','2011-05-19',null,null,640.1),
			('Orquidea','2011-08-17',394,'2021-09-17',672),
			('Violeta','2011-09-23',960,'2020-07-13',704),
			('Rosa','2012-05-19',798,'2022-02-19',737.25),
			('Tronco de Brasil','2012-11-14',100,'2014-07-14',null),
			('Helecho','2012-07-23',112,'2016-03-13',801.42),
			('Begonia','2013-03-23',134,'2013-08-10',833),
			('Espatifilo','2013-10-12',11105,'2018-11-10',null),
			('Ficus','2013-04-23',null,null,null),
			('Gardenia','2014-10-09',5109,'2019-12-03',935),
			('Hiedra','2014-05-04',1501,'2017-05-17',962.13),
			('Potus','2014-07-15',null,null,995.5),
			('Cactus','2015-05-29',11574,'2018-04-29',1027)
--JUEGO DE PRUBAS
INSERT INTO [dbo].[Tags]
           ([Tag_Nombre])
     VALUES ('FRUTAL'),
			('SIN FLOR'),
			('CON FLOR'),
			('SOMBRA'),
			('HIERBA'),
			('PERFUMA'),
			('TRONCODOBLADO'),
			('ESPINOSA'),
			('ESPECIA'),
			('EXTERIOR')

INSERT INTO [dbo].[Tags_De_Plantas]
           ([Tag_Id]
           ,[Planta_ID])
     VALUES (1,22),
			(2,3),
			(2,4),
			(2,19),
			(2,25),
			(2,27),
			(3,1),
			(3,2),
			(3,5),
			(3,6),
			(3,7),
			(3,8),		
			(3,10),
			(3,11),
			(3,12),
			(3,13),
			(3,14),
			(3,16),
			(3,17),
			(3,18),
			(3,21),			
			(3,26),
			(4,20),
			(5,3),
			(5,4),
			(5,25),
			(6,1),
			(6,2),
			(6,3),
			(6,4),
			(6,5),
			(6,6),
			(6,7),
			(6,8),		
			(6,10),
			(6,11),
			(6,12),
			(6,13),
			(6,14),
			(6,15),
			(6,16),
			(6,17),
			(6,18),			
			(7,19),
			(9,3),
			(9,4),
			(8,27)

INSERT INTO [dbo].[Mantenimiento]
           ([Planta_ID]
           ,[Fecha_Hora_Mant]
           ,[Descripcion]
           ,[Tipo_Mantenimiento]
           ,[Horas_Empleadas]
           ,[Costo_Mantenimiento])

     VALUES (1,'2021-05-06   15:40','PODA','O',1.20,125.20),
			(2,'2020-07-25 15:41','COSECHA','O',1.21,125.21),
			(5,'2020-07-26 15:44','PODA','O',1.22,125.22),
			(6,'2018-03-15 10:45','COSECHA','O',1.23,125.23),
			(12,'2011-07-21 15:51','PODA','O',1.24,132.24),
			(13,'2011-03-22 15:52','COSECHA','O',1.25,132.25),
			(17,'2019-12-26 14:56','PODA','O',1.26,132.26),
			(18,'2019-05-27 14:57','COSECHA','O',2.27,132.27),
			(22,'2015-05-31 09:01','PODA','O',2.28,132.28),
			(23,'2015-07-12 07:02','COSECHA','O',2.29,150.18),
			(24,'2015-10-3 08:03','PLANTA','O',2.30,150.19),
			(25,'2015-10-21 16:04','PODA','O',2.31,150.20),
			(26,'2015-02-15 12:05','COSECHA','O',2.32,150.21),
			(1,'2015-10-22 08:04','FERTILIZACION,DESINFECCION','N',NULL,NULL),
			(3,'2015-02-16 16:05','FERTILIZACION','N',NULL,NULL),
			(5,'2015-10-23 12:06','FERTILIZACION,DESINFECCION','N',NULL,NULL),
			(7,'2015-02-17 08:05','FERTILIZACION','N',NULL,NULL),
			(8,'2017-10-24 16:06','FERTILIZACION','N',NULL,NULL),
			(9,'2017-10-25 12:07','FERTILIZACION','N',NULL,NULL),
			(10,'2017-10-26 08:06','FERTILIZACION','N',NULL,NULL),
			(11,'2017-10-27 16:07','FERTILIZACION,DESINFECCION','N',NULL,NULL),
			(12,'2017-10-28 12:08','FERTILIZACION,DESINFECCION','N',NULL,NULL),
			(14,'2017-09-29 08:07','FERTILIZACION,DESINFECCION','N',NULL,NULL),
			(15,'2017-09-30 16:08','FERTILIZACION,DESINFECCION','N',NULL,NULL),
			(17,'2017-09-30 12:09','FERTILIZACION,DESINFECCION','N',NULL,NULL),
			(19,'2017-07-01 08:08','FERTILIZACION','N',NULL,NULL),
			(20,'2017-07-02 16:09','FERTILIZACION,DESINFECCION','N',NULL,NULL),
			(21,'2018-07-03 12:10','FERTILIZACION,DESINFECCION','N',NULL,NULL),
			(22,'2018-07-04 08:09','FERTILIZACION,DESINFECCION','N',NULL,NULL),
			(27,'2018-07-05 16:10','FERTILIZACION','N',NULL,NULL),
			(1,'2018-07-06 12:11','PLANTA','O',3.50,182.15),
			(2,'2018-07-07 08:10','PLANTA','O',3.51,182.16),
			(3,'2018-07-08 16:11','PLANTA','O',3.52,182.17),
			(4,'2018-07-09 12:12','PLANTA','O',3.53,182.18),
			(5,'2018-07-10 08:11','PLANTA','O',3.54,182.19),
			(6,'2018-07-11 16:12','PLANTA','O',3.55,182.20),
			(7,'2018-01-12 12:13','PLANTA','O',3.56,182.21),
			(8,'2022-07-13 08:12','PLANTA','O',3.57,282.22),
			(9,'2022-07-14 16:13','PLANTA','O',3.58,282.23),
			(10,'2022-07-15 12:14','PLANTA','O',3.59,282.24),
			(11,'2022-07-16 08:13','PLANTA','O',4.10,282.25),
			(12,'2022-07-17 16:14','PLANTA','O',4.11,282.26),
			(13,'2022-07-18 12:15','PLANTA','O',4.12,282.27),
			(14,'2022-07-19 08:14','PLANTA','O',4.13,282.28),
			(15,'2022-01-20 16:15','PLANTA','O',4.14,282.29),
			(16,'2022-01-21 12:16','PLANTA','O',4.15,282.30),
			(17,'2022-01-22 08:15','PLANTA','O',4.16,282.31),
			(18,'2022-01-23 16:16','PLANTA','O',4.17,282.32),
			(19,'2022-02-24 12:17','PLANTA','O',4.18,282.33),
			(20,'2022-02-25 08:16','PLANTA','O',4.19,282.34),
			(21,'2022-02-26 16:17','PLANTA','O',4.20,282.35),
			(22,'2022-02-27 12:18','PLANTA','O',4.21,282.36),
			(23,'2022-03-28 08:17','PLANTA','O',4.22,282.37),
			(24,'2022-03-29 16:18','PLANTA','O',4.23,282.38),
			(25,'2022-03-30 12:19','PLANTA','O',4.24,282.39),
			(26,'2022-04-11 08:18','PLANTA','O',4.25,282.40),
			(27,'2022-04-12 16:19','PLANTA','O',4.26,282.41)

INSERT INTO [dbo].[Producto]
           ([Codigo_Producto]
           ,[Descripcion_Producto]
           ,[Precio_Producto])
     VALUES ('AB001','FERTILIZANTE',5.00),
			('AB002','PESTICIDA',4.50),
			('AB004','ALIMENTO',3.20),
			('AB005','ABONO',2.15)

INSERT INTO [dbo].[Productos_Usados]
           ([Mantenimiento_ID]
           ,[Codigo_Producto]
           ,[Cantidad_Producto]
           ,[Costo_Apl_Producto])
     VALUES (14,'AB001',100.00,500.00),
			(15,'AB001',150.00,750.00),
			(16,'AB001',250.00,1250.00),
			(17,'AB001',125.00,625.00),
			(18,'AB001',132.00,660.00),
			(19,'AB001',179.00,895.00),
			(20,'AB001',502.00,2510.00),
			(27,'AB001',53.00,265.00),
			(28,'AB001',20.00,100.00),
			(29,'AB001',157.00,785.00),
			(30,'AB001',2456.00,12280.00),
			(14,'AB001',215.00,1075.00),
			(15,'AB001',268.00,1340.00),
			(16,'AB001',245.00,1225.00),
			(17,'AB001',302.00,1510.00),
			(18,'AB001',548.00,2740.00),
			(24,'AB001',20.00,100.00),
			(25,'AB001',150.00,750.00),
			(26,'AB001',250.00,1250.00),
			(27,'AB001',125.00,625.00),
			(28,'AB001',132.00,660.00),
			(29,'AB001',179.00,895.00),
			(30,'AB001',245.00,1225.00),
			(14,'AB002',100.00,450.00),
			(15,'AB002',150.00,675.00),
			(16,'AB002',250.00,1125.00),
			(17,'AB002',125.00,562.50),
			(20,'AB002',502.00,2259.00),
			(21,'AB002',302.00,1359.00),
			(22,'AB002',548.00,2466.00),
			(23,'AB002',325.00,1462.50),
			(24,'AB002',987.00,4441.50),
			(17,'AB002',302.00,1359.00),
			(18,'AB002',548.00,2466.00),
			(19,'AB002',325.00,1462.50),
			(20,'AB002',987.00,4441.50),
			(21,'AB002',245.00,1102.50),
			(29,'AB002',179.00,805.50),
			(30,'AB002',245.00,1102.50),
			(24,'AB004',987.00,3158.40),
			(25,'AB004',245.00,784.00),
			(26,'AB004',2383.00,7625.60),
			(27,'AB004',53.00,169.60),
			(28,'AB004',20.00,64.00),
			(29,'AB004',157.00,502.40),
			(30,'AB004',2456.00,7859.20),
			(14,'AB004',215.00,688.00),
			(20,'AB004',987.00,3158.40),
			(21,'AB004',245.00,784.00),
			(22,'AB004',2383.00,7625.60),
			(23,'AB004',53.00,169.60),
			(24,'AB004',20.00,64.00),
			(25,'AB004',150.00,480.00),
			(26,'AB004',250.00,800.00),
			(27,'AB004',125.00,400.00),
			(28,'AB004',132.00,422.40),
			(14,'AB005',100.00,215.00),
			(15,'AB005',150.00,322.50),
			(16,'AB005',250.00,537.50),
			(17,'AB005',125.00,268.75),
			(18,'AB005',132.00,283.80),
			(19,'AB005',179.00,384.85),
			(20,'AB005',502.00,1079.30),
			(21,'AB005',302.00,649.30),
			(23,'AB005',325.00,698.75),
			(30,'AB005',2456.00,5280.40),
			(14,'AB005',215.00,462.25),
			(15,'AB005',268.00,576.20),
			(17,'AB005',302.00,649.30),
			(18,'AB005',548.00,1178.20),
			(19,'AB005',325.00,698.75),
			(20,'AB005',987.00,2122.05),
			(25,'AB005',150.00,322.50),
			(26,'AB005',250.00,537.50),
			(27,'AB005',125.00,268.75),
			(28,'AB005',132.00,283.80),
			(29,'AB005',179.00,384.85),
			(30,'AB005',245.00,526.75)


--EJERCICIO 2

--PARTE A

Select P.Nombre, M.Descripcion  
from Planta P join Mantenimiento M
on P.Planta_ID=M.Planta_ID
where DATEPART(YEAR,M.Fecha_Hora_Mant)=DATEPART(YEAR,GETDATE())
and M.Fecha_Hora_Mant=(select MAX(Fecha_Hora_Mant) from Mantenimiento)

--PARTE B

 WITH PMC AS 
(Select P.*, MC.CANTIDAD
FROM Planta P,
	(Select P.Planta_ID, COUNT(M.Mantenimiento_ID) CANTIDAD
from Planta P, Mantenimiento M
WHERE P.Planta_ID=M.Planta_ID
group by P.Planta_ID) MC
WHERE MC.Planta_ID =P.Planta_ID) 
SELECT *
        FROM PMC T1
        WHERE CANTIDAD = (SELECT MAX(PMC.CANTIDAD) FROM PMC)
;

-- PARTE C
Select P.*, TM.Total_Mantenimiento, TMLY.Total_Mantenimiento
	FROM Planta P,
	(Select sum(Costo_Mantenimiento) Total_Mantenimiento,Planta_ID
from Mantenimiento
where DATEPART(YEAR,Fecha_Hora_Mant) = DATEPART(YEAR,GETDATE())
group by Planta_ID) TM, 
	(Select sum(Costo_Mantenimiento) Total_Mantenimiento,Planta_ID
	from Mantenimiento
	where DATEPART(YEAR,Fecha_Hora_Mant) = DATEPART(YEAR,GETDATE())-3
	group by Planta_ID) TMLY
where TM.Planta_ID =P.Planta_ID
AND TMLY.Planta_ID =P.Planta_ID
and  TM.Total_Mantenimiento > TMLY.Total_Mantenimiento * 20/100 

-- PARTE D

Select P.*
from Tags_De_Plantas TD  join Tags T
	on TD.Tag_Id=T.Tag_Id
	join Planta P
	on TD.Planta_ID= P.Planta_ID
where t.Tag_Nombre in ('FRUTAL','PERFUMA')
	and t.Tag_Nombre not in ('TRONCOROTO')

-- PARTE E 

--PARTE F

Select P.*, CM.Total_Mantenimiento
	FROM Planta P,(Select sum(Costo_Mantenimiento) Total_Mantenimiento,Planta_ID
	from Mantenimiento
	group by Planta_ID) CM
	where P.Planta_ID=CM.Planta_ID
	and CM.Total_Mantenimiento > 151
	and P.Precio >200
	and DATEPART(YEAR,P.FECHA_NAC) < DATEPART(YEAR,GETDATE())-2


