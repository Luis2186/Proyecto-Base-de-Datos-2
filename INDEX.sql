-- Indices de Foreign Key
Use Pflanze
-- Tabla Tags_De_Plantas
CREATE INDEX IDX_Tag_Id ON Tags_De_Plantas(Tag_Id)
CREATE INDEX IDX_Planta_Id ON Tags_De_Plantas(Planta_Id)

-- Tabla Mantenimiento
CREATE INDEX IDX_Planta_Id ON Mantenimiento(Planta_Id)

-- Tabla Productos usados
CREATE INDEX IDX_Mantenimiento_ID ON Productos_Usados(Mantenimiento_ID)
CREATE INDEX IDX_Codigo_Producto ON Productos_Usados(Codigo_Producto) 