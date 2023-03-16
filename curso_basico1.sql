use curso_sql;

create table if not exists libros (
id int (6) zerofill  auto_increment, # zerofill nos llena a la izquierda con numeros 0
titulo varchar(40) not null,
editorial varchar(15),
autor varchar (30) default 'Desconocido', # default no puede ser usado en autoincrementales, ni en text
precio decimal(5,2) unsigned default 8.25,
cantidad mediumint zerofill not null,
primary key (id)
); 

drop table libros; 

insert into libros ( titulo, editorial, autor,precio, cantidad) values('c# es una Hora','sql', 'Miguel','15.2','50');
insert into libros(titulo, editorial, autor, cantidad) values ('la sirenita','santillana','Hugo', 30);

select * from libros; 