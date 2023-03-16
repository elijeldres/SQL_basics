# Eliminar base de datos ya existente 
# DROP no sólo elimina los datos, sino que también eliminar la estructura de la tabla.
#DROP TABLE nombre_tabla;

#DROP DATABASE
# Podemos incluir en la sentencia IF EXISTS de forma que evitemos el error en caso de que no exista la base de datos (muy útil a la hora de hacer copias de seguridad de las bases de datos).
# DROP DATABASE [IF EXISTS] nombre_base_datos;

drop database if exists curso_sql; 
create database if not exists curso_sql; 
use curso_sql; 

# primary key 

create table if not exists usuario ( 
nombre varchar(50), 
apellido varchar(50),
email varchar(100), 
primary key(nombre)
); 
insert into usuario values('Juan', 'Perez', 'juan@perez.com');
# insert into usuario values( 'Juan', 'Porres', 'juan@porres.com'); no dejara, xq se duplica el nombre
describe usuario; 

create table if not exists producto (
id int(11) auto_increment, 
mercaderia varchar (50),
descripcion text,
precio float(11,2),
cantidad int(50),
primary key(id)
);
describe producto;
insert into producto values(null,'laptop','la mejor laptop del mercado','128.6',23); 
insert into producto values(null,'mouse','prende luz','5.6',30);
insert into producto values(null,'laptop','la mejor laptop del mundo','128.6',10); # como el primarykey es autoinremental, aunque se repitan los datos no crea error. 
insert into producto values(null,'Teclado', 'teclado ergonometrico', 80.12, 1000); 
insert into producto values (null, 'Pantalla', 'Led', 155.9, 50);
insert into producto values (null,'impresora','impresora multi', 134.3, 20);
insert into producto values ( null, 'camara', 'camara profesional', 100,5); 
select * from producto;

# COLUMNAS CALCULADAS
select mercaderia, precio, cantidad , precio*cantidad from producto; 
select mercaderia, precio, precio*0.9 from producto; #para saber cual es el precio final con un 10% de descuento

# TRUNCATE la diferencia entre TRUNCATE y DELETE es que con Truncate se borra toda la info, y se empieza como de hoja nueva, 
# en cambio con delete, se borra la info, pero se empieza a trabajar desde la fila que quedo. ejemplo: si delete producto, y luego reingreso los 3
# productos escritos, seran autoincrementados desde el ID 4. 
delete from producto; 

# En cambio si usamos el truncate, se borra toda la informacion y partira desde cero 
truncate table producto;

# UNSIGNED
create table persona (
id integer unsigned not null,
nombre varchar (50),
edad integer unsigned, 
primary key(id)
);
describe persona; 

#FUNCIONES DE MANEJO DE CADENAS
select concat ('Hola, ', '','Como estas?'); 
select concat_ws('-','Miguel', 'Lopez', 'Diaz');
select length('Elizabeth Constanza Jeldres Morales');
select left ('buenas noches', 11); 
select right('buenas noches',11); 
 ## para manejo de espacio en blanco
 select trim('            ELitha              ');
select ltrim('            Elitha             ');
select rtrim('             Elitha             '); 
select replace('mmm.elitha.com', 'm', 'w'); 
select repeat('SQL', 3); 
select reverse('Hola'); 
select lower('HolA TU Que HAce?'); 
select lcase('HolA TU Que HAce?'); 
select upper ('HolA TU Que HAce?'); 
select ucase('HolA TU Que HAce?'); 

select concat_ws('-', mercaderia, descripcion) from producto; 
select upper(mercaderia), lower(descripcion) from producto; 

# FUNCIONES MATEMATICAS
select round(2.4); # redondea a lo mas cercano, tanto para arriba como para abajo 

select ceiling (precio ) from producto; 
select floor( precio) from producto; 
select mod(10,3); # da el reciduo de la divicion 
select power(2,3); # base, su potencia 

# ORDER BY  ordena alfabeticamente o por cantidad
select mercaderia, precio, cantidad from producto order by mercaderia;  # por defecto de a-z
select mercaderia, precio, cantidad from producto order by mercaderia desc;  # de z-a 
select mercaderia, precio, cantidad from producto order by cantidad; 
select mercaderia, precio,cantidad from producto order by precio, mercaderia; # el primer iten tiene prioridad

# operadores logicos 
select * from producto where ( mercaderia ='laptop') and ( cantidad<= 25) ; 
select * from producto where ( mercaderia = 'laptop') and ( precio <= 100); 

select * from producto where ( mercaderia ='laptop') or (mercaderia= 'camara'); 
select * from producto where ( mercaderia='laptop') xor(mercaderia = 'camara'); 
select * from producto where not ( mercaderia = 'laptop');

#OPERADORES RELACIONALES BETWEEN IN
select * from producto;
select * from producto where precio >=100 and precio <=130; 
select * from producto where precio between 100 and 130; 
select * from producto where not precio between 100 and 130; 
select * from producto where mercaderia in ( 'laptop', 'la mejor laptop');

# patrones de busqueda like /not like  busca trozos de informacion dentro del codigo  ejemplo:
select * from producto where descripcion ='laptop'; # no da la info, xq tiene que ser = a la desscripcion completa
select * from producto where descripcion like '%laptop%'; 
select * from producto where mercaderia like 'm%'; 

#patron de busqueda REGEXP / nop REGEXP es casi lo mismo que like pero no tenemos que colocar el simbolo de % 
select * from producto where descripcion regexp 'laptop'; 
select *from producto where descripcion regexp'[a]';  # todos contienen letra a en su descripcion
select * from producto where descripcion not regexp'[a]'; # todos los que en su descripcion no contengan la letra a 
select * from producto where descripcion regexp '^p';  # es como ( like p%) 

# funcion para contar registros COUNT
use curso_sql; 
select * from producto; 
select count(*) from producto; 
select count(*) from producto where mercaderia ='laptop'; 
select count(*) from producto where descripcion  regexp 'lap'; 

# funciones de agrupamiento 
select sum(cantidad)  from producto; 
select sum(cantidad) from producto where mercaderia = 'laptop'; 
select min(precio) from producto; # max(precio) 
select avg(precio) from producto; 
select avg(cantidad) from producto where mercaderia = 'laptop'; # son 33 laptos en total

# Registros duplicados DISTINCT
select mercaderia from producto; # toda la mercaderia 
select distinct mercaderia from producto; #toda la mercaderia sin repetir 
select distinct mercaderia from producto group by mercaderia asc; #toda la mercaderia sin repetir en orden alfabetico
