/*3.1. Obtener todos los almacenes*/
select* from almacenes;

/*3.2. Obtener todas las cajas cuyo contenido tenga un valor superior a
150 €.*/
select* from cajas where valor >150;

/*3.3. Obtener los tipos de contenidos de las cajas.*/
select distinct contenido from cajas;

/*3.4. Obtener el valor medio de todas las cajas.*/
select avg(valor) from cajas;

/*3.5. Obtener el valor medio de las cajas de cada almacen.*/
select almacen, avg(valor)
from cajas
group by almacen;

/*3.6. Obtener los códigos de los almacenes en los cuales el valor medio
de las cajas sea superior a 150 €.*/
select almacen, avg(valor)
from cajas group by almacen
having avg(valor) >150;

/*3. 7. Obtener el numero de referencia de cada caja junto con el nombre
de la ciudad en el que se encuentra.*/
select numreferencia, lugar
from almacenes inner join cajas
on almacenes.codigo = cajas.almacen;

/*3.8. Obtener el numero de cajas que hay en cada almacén.*/
select almacen, count(*)
from cajas
group by almacen;

/*3.9. Obtener los códigos de los almacenes que están saturados (los
almacenes donde el numero de cajas es superior a la capacidad).*/
select codigo from almacenes
where capacidad<(select count(*)
from cajas
where almacen = codigo);

/*3.10. Obtener los numeras de referencia de las cajas que están en
Bilbao.*/
select numreferencia
from almacenes left join cajas
on almacenes.codigo=cajas.almacen
where lugar = 'Bilbao';

/*3.11. Insertar un nuevo almacén en Barcelona con capacidad para 3
cajas*/
insert into almacenes(Codigo,Lugar,Capacidad) values(6,'Barcelona',3);
/*select * from almacenes;*/

/*3.12. Insertar una nueva caja, con número de referencia 'H5RT', con
contenido 'Papel', valor 200, y situada en el almacén 2.*/
insert into cajas
values('H5RT','Papel',200,2);

/*3.13. Rebajar el valor de todas las cajas un 15 %.*/
update cajas set valor = valor * 0.85;

/*3.14. Rebajar un 20 % el valor de todas las cajas cuyo valor sea
superior al valor medio de todas las cajas.*/

update cajas set valor = valor * 80
where valor > (select avg(valor) from cajas);

/*3.15. Eliminar todas las cajas cuyo valor sea inferior a 100 €.*/
delete from cajas where valor <100;

/*3.16. Vaciar el contenido de los almacenes que están saturados*/
delete from cajas where almacen in (
select codigo from almacenes
where capacidad <(
select count(*)
from cajas
where almacen = codigo)
);
