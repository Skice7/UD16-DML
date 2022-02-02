/*1*/
SELECT nombre from peliculas;
/*2*/
SELECT DISTINCT calificacionedad from peliculas;
/*3*/
SELECT * from peliculas where calificacionedad is NULL;
/*4*/
SELECT * from salas where pelicula is null;
/*5*/
SELECT * from salas left join peliculas on salas.pelicula = peliculas.CODIGO;
/*6*/
SELECT * from salas right join peliculas on salas.pelicula = peliculas.codigo;
/*7*/
SELECT peliculas.nombre from salas right join peliculas on salas.pelicula = peliculas.codigo where salas.pelicula is null;
/*8*/
INSERT INTO peliculas(codigo, nombre, calificacionedad) values(10, "Uno, Dos, Tres", "7");
/*9*/
UPDATE peliculas set calificacionedad="13" where calificacionedad is null;
/*10*/
DELETE from salas where pelicula IN (SELECT codigo from peliculas where calificacionedad = "0");