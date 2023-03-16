show databases;
create database curso_sql;
drop database curso; 
use curso_sql;
create table usuario(
nombre varchar(50),
edad int (15)
);

show tables;
describe usuario; 
drop table usuario;

create table alumnos (
nombre varchar (50),
apellido varchar (50),
direccion varchar (100),
telefono varchar (15), 
edad int (11)
);

#INSERT
insert into alumnos(nombre,apellido,direccion,telefono, edad) 
values('Juan', 'Martinez', 'Barrio Duarte', '6033555',35); 
insert into alumnos values ('Pedro', 'Montero','Villa Nuevo Amanecer' ,'6032762', 15);
insert into alumnos(nombre, telefono, edad) values ('Miguel', '8295673', 36); 
insert into alumnos values ('Pedro', 'vasquez','Villa teniente pizzoleo' ,'6032763', 55);

#SELECT + condicion WHERE
select * from alumnos; 
select nombre, direccion from alumnos; 
select * from alumnos where nombre = 'Pedro'; 
select apellido, edad from alumnos where nombre ='Pedro'; 

# OPERADORES RELACIONALES 
# =
# <> (distinto) , >,<, >=, <=

select * from alumnos where nombre <> 'Juan'; 
select nombre, apellido from alumnos where edad > 15; 
select * from alumnos where edad >= 15;  

# DELETE (no recomendable) 
# incluye ir a edit>preferences> SQL editor> desmarcar Safe Updates, sino se hace da error 
 
delete from alumnos ; 

# DELETE + WHERE ( recomendable) 

# recordar que debo volver a cargar los datos, xq los borre ( arriba en INSERT) 
# revisar que se inserten correctamente (Select)
select * from alumnos; 
delete from alumnos where nombre = 'Juan'; 
# cuando se cierra el dia volver a abrir, indicando que Schema  vamos a ocupar
use curso_sql;
select *from alumnos;



# Update sirve para cambiar, o actualizar datos de una tabla. 
update alumnos set apellido = 'Cabezas' where nombre = 'Miguel'; 
update alumnos set direccion = 'Mendoza', telefono = 34568203 where edad = '36';

# funcion de agrupamiento group by 
create table visitantes(
nombre varchar ( 30),
edad tinyint unsigned,
sexo char (1),
domicilio varchar(30),
ciudad varchar (30),
telefono varchar(11),
montocompra decimal (6,2) unsigned
);
select * from visitantes; 
drop table if exists visitantes; 

insert into visitantes ( nombre, edad,sexo,domicilio,ciudad,telefono,montocompra )
values ('Susana Molina', 28, 'f', 'Colon 123', 'Cordoba',  null, 45.50);
insert into visitantes values ( 'Marcela Mercado', 36,'f', 'Avellaneda 345', 'Cordoba', '4545454', 0); 
insert into visitantes values ( 'Alberto Garcia', 35, 'm', 'General paz 123', 'Alta Gracia', '034523456',25);
insert into visitantes values ( 'Teresa Garcia', 33, 'f', 'General paz 123', 'Alta Gracia', '034523456', 0);
insert into visitantes values ( 'Roberto Perez', 45,'m', 'Urquiza 335', 'Cordoba', '41234563', 33.20);
insert into visitantes values ('Marina Torres', 22,'f', 'Colon 222', 'Villa Dolores', '05345256633', 25);
insert into visitantes values ('Julieta Gomez', 24, 'f', 'San Martin 333', 'Alta Gracia', '45245235632', 53.50);
insert into visitantes values ('Roxana Lopez', 20, 'f','Triunvirato 345', 'Alta Gracia', null, 0 );
insert into visitantes values ('Liliana Garcia', 50, 'f','Paso 999', 'Cordoba', '456928273', 48);
insert into visitantes values (' Juan Torres', 43, 'm','Sarmiento 876', 'Cordoba', '4937562745', 15.30);

select count(*) from visitantes; 
select ciudad, count(*) from visitantes group by ciudad; 
select sexo, count(*) from visitantes group by sexo; 
select sexo, sum(montocompra) from visitantes group by sexo; 
select sexo, max(montocompra), min(montocompra) from visitantes group by sexo; 
select ciudad, avg(montocompra) from visitantes group by ciudad; 

select ciudad, sexo, count(*) from visitantes group by ciudad,sexo asc;


