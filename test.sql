DROP TABLE detalle_facturas;
DROP TABLE productos;
DROP TABLE categorias;
DROP TABLE facturas;
DROP TABLE clientes;


CREATE TABLE clientes(
    ID SERIAL PRIMARY KEY,
    NOMBRE VARCHAR(20),
    RUT varchar(12) NOT NULL,
    DIRECCION VARCHAR(25) NOT NULL
);

CREATE TABLE facturas(
    ID SERIAL PRIMARY KEY,
    FECHA DATE NOT NULL,
    SUBTOTAL INT,
    IVA INT DEFAULT 19,
    PRECIO_TOTAL INT,
    ID_CLIENTES INT,
    FOREIGN KEY(ID_CLIENTES) REFERENCES clientes(ID)
    
);


CREATE TABLE categorias(
    ID SERIAL PRIMARY KEY,
    NOMBRE VARCHAR(30) NOT NULL,
    DESCRIPCION VARCHAR(30) NOT NULL

);

CREATE TABLE productos(
    ID SERIAL PRIMARY KEY,
    NOMBRE VARCHAR(20) NOT NULL,
    DESCRIPCION VARCHAR(50) NOT NULL,
    PRECIO INT,
    ID_CATEGORIA INT,
    FOREIGN KEY(ID_CATEGORIA) REFERENCES categorias(ID)
);


CREATE TABLE detalle_facturas(
    ID_FACTURAS INT,
    ID_PRODUCTOS INT,
    CANTIDAD INT,
    TOTAL INT,
    FOREIGN KEY(ID_FACTURAS) REFERENCES facturas(ID),
    FOREIGN KEY(ID_PRODUCTOS) REFERENCES productos(ID)
    
);

--2--


INSERT INTO clientes(
    NOMBRE,
    RUT,
    DIRECCION
)
VALUES
(('JORGE'), ('6923828-5'), ('los alerces 123')),
(('ALICIA'), ('1233455-4'),('calbuco 555')),
(('GONZALO'),('18954765-4'), ('robles 898')),
(('ANDRES'),('13456677-k'), ('bilbao 838')),
(('PATRICIO'), ('8967654-2'), ('coloma 555')
);

INSERT INTO productos(
    NOMBRE,
    DESCRIPCION,
    PRECIO
)
VALUES
(('JUGO'), ('JUGO NATURAL'),(2000)),
(('FRUTA'), ('FRUTA DE TIPO CONSERVA'),(500)),
(('HAMBURGUESA'),('HAMBURGUESA 3 INGREDIENTES'),(1200)),
(('PIZZA'),('FAMILIAR'),(10000)),
(('FAJITAS'), ('FAJITA DE MECHADA'),(8000)),
(('ENSALADA'), ('4 INGREDIENTES'),(3500)),
(('BEBIDA'), ('LATA'),(800)),
(('COMPLETO'), ('COMPLETO ITALIANO'),(1500)
);

INSERT INTO categorias(
    NOMBRE,
    DESCRIPCION
)
VALUES
(('LIQUIDOS'),('JUGO DE FRUTAS')),
(('FRUTAS'),('CONSERVA')),
(('FAJITAS'),('MECHADA')
);

INSERT INTO facturas(
    ID_CLIENTES,
    FECHA,
    SUBTOTAL,
    PRECIO_TOTAL
)
VALUES
((1),('05_05-2020'), (2000),(2380)), 
((1),('05_07-2020'), (1200),(1428)),
((2),('05_05-2020'), (8000),(9520)),
((2),('05_05-2020'), (800),(952)),
((2),('05_05-2020'), (800),(952)),
((1),('05_05-2020'), (1500),(1785)),
((4),('05_05-2020'), (8000),(9520)),
((4),('05_05-2020'), (1500),(1785)),
((4),('05_05-2020'), (800),(952)),
((4),('05_05-2020'), (3500),(4165)
);

INSERT INTO detalle_facturas(
    ID_FACTURAS,
    ID_PRODUCTOS,
    CANTIDAD,
    TOTAL
)
VALUES
((1),(3),(2),(2400)), 
((1),(7),(3),(2400)),
((2),(3),(3),(2400)),
((2),(2),(2),(1000)),
((2),(8),(3),(4500)),
((3),(8),(1),(1500)),
((4),(2),(2),(1000)),
((4),(1),(3),(3600)),
((4),(6),(4),(32000)),
((4),(7),(1),(800)
);

--3--

--3.1--
SELECT NOMBRE
FROM clientes 
JOIN facturas 
ON clientes.ID=facturas.ID
WHERE facturas.PRECIO_TOTAL IN
(SELECT MAX(PRECIO_TOTAL) FROM facturas);

--3.2--

SELECT NOMBRE
FROM facturas
INNER JOIN CLIENTES 
ON clientes.ID = facturas.ID 
where facturas.PRECIO_TOTAL > 100;

--3.3--
-- --
-- SELECT NOMBRE.productos
-- FROM productos
-- INNER JOIN CLIENTES
-- ON clientes.ID = productos.ID 
-- where count(productos.ID) = 6;