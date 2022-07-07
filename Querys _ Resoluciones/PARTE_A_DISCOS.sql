USE TP2_Parte_A

-- �Cuantos temas tienen los �lbumes del g�nero rock?
SELECT COUNT(1) AS Cantidad_Rock
FROM Albumes AS A 
	INNER JOIN Generos AS G ON G.codGenero = A.codGenero
WHERE G.descripcion LIKE 'ROCK%'; -- Rock nacional y rock internacional

-- �Cu�ntos artistas distintos hicieron �lbumes del g�nero cl�sico?
SELECT AR.nombre AS Artista
FROM Albumes AS A 
	INNER JOIN Generos AS G ON G.codGenero = A.codGenero
	INNER JOIN Artistas AS AR ON AR.codArtista = A.codArtista
WHERE G.descripcion = 'Clasica'
GROUP BY AR.nombre;

-- �Cu�les son los g�neros que tienen m�s de tres �lbumes?
SELECT G.descripcion AS Genero, COUNT(1) AS Cantidad
FROM Albumes AS A 
	INNER JOIN Generos AS G ON G.codGenero = A.codGenero
GROUP BY G.descripcion
HAVING COUNT(1) > 3;

-- �Cu�l es el �lbum con m�s temas (considere que puede haber m�s de uno)?
WITH Temas_Cantidad AS (
	SELECT A.titulo AS Titulo_Album, COUNT(1) AS Cantidad_Temas
	FROM Albumes AS A
		INNER JOIN Temas AS T ON T.codAlbum = A.codAlbum
	GROUP BY A.titulo
) SELECT * 
	FROM Temas_Cantidad TC
	WHERE TC.Cantidad_Temas = (SELECT MAX(TC1.Cantidad_Temas) 
							   FROM Temas_Cantidad TC1);

-- �Cu�les son los �lbumes que tienen un t�tulo que es igual al t�tulo de alguno de los temas del mismo?
SELECT A.titulo AS Titulo_Album 
FROM Albumes A
	INNER JOIN Temas T ON T.codAlbum = A.codAlbum 
WHERE T.titulo = A.titulo;

-- Determine el nombre de los artistas y de los �lbumes de aquellos �lbumes del g�nero pop con temas que contengan una letra � en el t�tulo.
SELECT AR.nombre AS Nombre_Artista, A.titulo AS Nombre_Album 
FROM Albumes A
	INNER JOIN Generos G ON G.codGenero = A.codGenero 
	INNER JOIN Temas T ON T.codAlbum = A.codAlbum
	INNER JOIN Artistas AR ON AR.codArtista = A.codArtista
WHERE G.descripcion = 'POP' 
	AND T.titulo LIKE '%�%'
GROUP BY AR.nombre, A.titulo;

-- �Cu�les son los clientes con saldo negativo?
SELECT C.*
FROM Clientes C
WHERE C.saldo < 0;

-- Determine si el bruto de las facturas es igual a la sumatoria de sus �tems.
SELECT F.nroFactura, F.bruto, SUM(ITF.precio) AS Sumatoria_Items, 
	IIF(SUM(ITF.precio) = F.bruto, 'Es Igual', 'No es igual')	
FROM Facturas F
	INNER JOIN ItemsFactura ITF ON ITF.nroFactura = F.nroFactura
GROUP BY F.nroFactura, F.bruto;


-- Determine cuales facturas tienen menos cantidad de art�culos vendidos que los pedidos.
WITH Cantidad_Facturados AS (
	SELECT F.nroFactura, COUNT(1) as Cantidad_Facturados
	FROM Facturas F
			INNER JOIN ItemsFactura ITF ON ITF.nroFactura = F.nroFactura
	GROUP BY F.nroFactura
), Cantidad_Pedidos AS (
	SELECT F.nroFactura, COUNT(1) as Cantidad_Pedidos
	FROM Facturas F
			INNER JOIN ItemsPedido ITP ON ITP.codPedido = F.codPedido
	GROUP BY F.nroFactura
)
SELECT F.nroFactura AS Factura, CF.Cantidad_Facturados, CP.Cantidad_Pedidos 
FROM Facturas F
	INNER JOIN Cantidad_Facturados CF ON CF.nroFactura = F.nroFactura
	INNER JOIN Cantidad_Pedidos CP ON CP.nroFactura = F.codPedido
WHERE CF.Cantidad_Facturados <> CP.Cantidad_Pedidos;

-- Determine el art�culo que est� compuesto por m�s componentes.
SELECT P.codProducto as Producto_con_composiciones
FROM Productos P
	INNER JOIN Composiciones C ON C.codProducto = P.codProducto;

-- �Cu�les son los productos que no figuran en ning�n pedido?
SELECT P.* 
FROM Productos P
	LEFT JOIN ItemsPedido IP ON IP.codProducto = P.codProducto
WHERE IP.codPedido IS NULL;

--Determine el cliente con la factura m�s costosa.
SELECT C.codCliente, C.nombre
FROM Facturas F
	INNER JOIN Clientes C ON C.codCliente = F.codCliente
WHERE F.final = (
	SELECT MAX(F1.final) 
	FROM Facturas F1
);

-- �Cu�les son los art�culos cuyo stock es menor al punto de reposici�n?
SELECT *
FROM Productos P
WHERE P.stock < P.puntoReposicion;

-- �Cu�les son los discos que pertenezcan a g�neros que contengan una letra p en la descripci�n pero que no tengan una letra s?
SELECT A.titulo as Disco, G.descripcion 
FROM Albumes A
	INNER JOIN Generos G ON G.codGenero = A.codGenero
WHERE G.descripcion LIKE '%p%' AND G.descripcion NOT LIKE '%s%';

-- �Cu�les son los pedidos que tienen productos con una descripci�n que contenga m�s de 60 caracteres en total?
SELECT P.nroPedido
FROM Pedidos P 
	INNER JOIN ItemsPedido IPE ON IPE.codPedido = P.nroPedido
	INNER JOIN Productos PR ON PR.codProducto = IPE.codProducto
WHERE LEN(PR.descripcion) >= 60
GROUP BY P.nroPedido

-- Determine el total de todas las facturas de cada cliente del mes de febrero del corriente a�o.
SELECT C.nombre as Nombre_Cliente, IIF(F.Final IS NOT NULL, SUM(F.final), 0) AS Factura_Final, YEAR(GETDATE()) AS A�o_Corriente
FROM Clientes C
	LEFT JOIN Facturas F ON F.codCliente = C.codCliente
WHERE MONTH(F.fecha) = 2 AND YEAR(F.fecha) = YEAR(GETDATE())
GROUP BY C.nombre, F.Final