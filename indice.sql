drop database if exists curso_sql;

create database if not exists curso_sql;

use curso_sql;

#Indice

#Primary
#index
#unique

#show index;

#indice Primary
create table if not exists libro(
id int unsigned auto_increment not null,
titulo varchar(100),
autor varchar(50),
descripcion text,
editorial varchar(15),
primary key(id)
);

select * from libro; 
show index from libro; 

drop table libros;

#tipo index comun
create table if not exists libros(
id int unsigned auto_increment not null,
titulo varchar(100),
autor varchar(50) not null,
descripcion text,
editorial varchar(15) not null,
primary key(id),
index i_editorial (editorial)
#index i_autoreditorial (autor, editorial) # genera 2 index con el mismo key name
);
show index from libros; 

#tipo unique (unico) no permite insertar datos repetidos bajo ese campo
drop table libros; 

create table if not exists libros(
id int unsigned auto_increment not null,
titulo varchar(100),
autor varchar(50) not null,
descripcion text,
editorial varchar(15) not null,
primary key(id),
index i_autor(autor),
unique uq_titulo(titulo) 
);
show index from libros;

insert into libros(titulo, autor, editorial) values('Java en 10 minutos', 'Alejandro', 'La Maravilla');
insert into libros(titulo, autor, editorial) values('Java en 10 minutos', 'Alejandro', 'La Maravilla'); #no permite insertarlo xq el titulo esta bajo la clave unique
insert into libros(titulo, autor, editorial) values('Java', 'Alejandro', 'La Maravilla');

select * from libros; 

#Eliminar un indice
drop index i_autor on libros;
drop index uq_titulo on libros;

#crear un indice en una tabla ya existente 

create table if not exists libros(
id int unsigned auto_increment not null,
titulo varchar(100),
autor varchar(50) not null,
descripcion text,
editorial varchar(15) not null,
primary key(id)
); 

create index i_editorial on libros (editorial);
create unique index uq_titulo on libros (titulo);

show index from libros;

# ALTER TABLE
# como alterar una tabla ya existente sin tener que eliminarla y agregar o borrar cosas de la tabla. 

create table productos (
id int unsigned not null auto_increment,
nombre varchar(50),
primary key (id)
);
describe productos; 


#agregar campos a la tabla ADD
alter table productos add precio int;
alter table productos add cantidad int unsigned not null; 

# eliminar campos de la tabla drop
alter table productos drop precio; 
alter table productos drop precio, drop cantidad;

# modificar datos de una tabla con MODIFY
alter table productos modify nombre varchar (100) not null; 
alter table productos modify precio decimal (5,2) not null; 

# cambiar nombre de un campo CHANGE
alter table productos change precio stock int; 
alter table productos change nombre objeto varchar (50);  

# agregar y eliminar primary key 
# botar y hacer nuevamente la tabla, esta vez sin primary key para agregarsela despues. 

drop table productos; 

create table productos (
id int unsigned not null, # no puede ser auto incremental xq me xq me da error por definicion. 
nombre varchar(50)
);
describe productos; 

alter table productos add primary key (id); 

# para ponerle el auto incremento al primary key 
alter table productos modify id int unsigned auto_increment not null; 

# para eliminar un primary key primero debo eliminar el autoincremental, si no sale error.
 alter table productos modify id int unsigned; 
alter table productos drop primary key; 

# alter table index 
alter table productos add index i_precio(precio); 
alter table productos drop index i_precio; 

show index from productos; 

#renombrar una tabla RENAME
alter table productos rename mercaderia; 
select * from mercaderia; 

rename table mercaderia to cosasavender; 
select * from cosasavender; 