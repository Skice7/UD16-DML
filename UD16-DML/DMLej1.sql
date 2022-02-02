/*1*/
SELECT nombre FROM articulos;
/*2*/
SELECT nombre, precio FROM articulos;
/*3*/
SELECT nombre, precio FROM articulos where precio <= 200;
/*4*/
SELECT * FROM articulos where precio between 60 and 120;
/*5*/
SELECT nombre, precio + 166.383 AS PrecioMas from articulos;
/*6*/
SELECT avg(precio) from articulos;
/*7*/
SELECT avg(precio) from articulos where fabricante=2;
/*8*/
SELECT COUNT(*) from articulos where precio >= 180;
/*9*/
SELECT nombre, precio from articulos where precio >= 180 order by precio desc, nombre asc;
/*10*/
SELECT * from articulos inner join fabricantes on articulos.fabricante = fabricantes.codigo;
/*11*/
SELECT articulos.nombre, precio, fabricantes.nombre from articulos inner join fabricantes ON articulos.fabricante = fabricantes.CODIGO;
/*12*/
SELECT avg(precio) as precio, fabricante from articulos group by fabricante;
/*13*/
SELECT avg(precio), fabricantes.nombre from articulos inner join fabricantes on articulos. fabricante = fabricantes.CODIGO group by fabricantes.nombre;
/*14*/
SELECT avg(precio) as preciomedio, fabricantes.nombre from articulos inner join fabricantes on articulos.FABRICANTE = fabricantes.CODIGO group by fabricantes.nombre HAVING preciomedio >= 150;
/*15*/
SELECT nombre, precio from articulos where precio = 
(SELECT MIN(precio) from articulos);
/*16*/
SELECT articulos.nombre, articulos.precio, fabricantes.nombre from articulos inner join fabricantes on articulos.FABRICANTE = fabricantes.CODIGO
AND articulos.precio = 
(SELECT MAX(articulos.PRECIO) from articulos where articulos.FABRICANTE = fabricantes.codigo);
/*17*/
INSERT into articulos(codigo, nombre, precio, fabricante) values (11, "Altavoces", 70, 2);
/*18*/
UPDATE articulos set nombre = "Impresora Laser" where codigo = 8;
/*19*/
UPDATE articulos set precio = precio * 0.9;
/*20*/
UPDATE articulos set precio = precio - 10 where precio >= 120;