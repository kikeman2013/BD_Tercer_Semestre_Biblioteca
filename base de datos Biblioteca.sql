-- Script para crear la base de datos "Biblioteca"
-- Autor: Enrique Belmarez,Cristian Bajaras,Martin Castruita
-- Fecha de creación: 10 de Noviembre de 2018
-- Fecha de última modificación: 17 de Noviembre de 2018

-- Crear Base de Datos Biblioteca
CREATE DATABASE Biblioteca
go
-- Poner en uso
USE Biblioteca
go
-- Crear tabla Editorial
CREATE TABLE Editorial(
	Nombre_Edi    varchar(30),
	Direccion_Edi varchar(30),
	Telefono_Edi  int,
	primary key (Nombre_Edi))
go
-- Crear tabla Autor
CREATE TABLE Autor(
	Nombre_Aut   varchar(30),
	Telefono_Aut int,
	primary key (Nombre_Aut))
go
-- Crear tabla Libro 
CREATE TABLE Libro(
	Id_Libro   smallInt,
	Titulo     varchar(30),
	Nombre_Edi varchar(30),
	Nombre_Aut varchar(30),
	primary key (Id_Libro))
go
-- Crear tabla Ejemplares
CREATE TABLE Ejemplares(
	Id_Libro    SmallInt,
	No_Ejemplar Smallint,
	primary key (Id_Libro))
go
-- Crear tabla Sucursal
CREATE TABLE Sucursal(
	Id_Suc        SmallInt,
	Nombre_Suc    varchar(30),
	Direccion_Suc varchar(30),
	Id_Libro      SmallInt,
	No_Copias     SmallInt,
	primary key (Id_Suc))
go
-- Crear tabla Lector
CREATE TABLE Lector(
	No_Tarjeta    Int,
	Nombre_Lec    varchar(30),
	Direccion_Lec varchar(30),
	Telefono_Lec  Int,
	primary key (No_Tarjeta))
go

-- Crear tabla Prestado
CREATE TABLE Prestado(
	Id_Libro SmallInt,
	No_Tarjeta int,
	Fecha_Pres datetime,
	Devo_ulti  datetime,
	primary key (Id_libro,No_Tarjeta))
go
--Creación de restricciones
ALTER TABLE Libro ADD CONSTRAINT Chk_NombreEdi
FOREIGN KEY (Nombre_Edi) REFERENCES Editorial(Nombre_Edi)
go
ALTER TABLE Libro ADD CONSTRAINT Chk_NombreAut
FOREIGN KEY (Nombre_Aut) REFERENCES Autor(Nombre_Aut)
go
ALTER TABLE Ejemplares ADD CONSTRAINT Chk_idLribEjem
FOREIGN KEY (Id_Libro) REFERENCES Libro(Id_Libro)
go
ALTER TABLE Sucursal ADD CONSTRAINT Chk_idLibro
FOREIGN KEY (Id_Libro) REFERENCES Libro(Id_Libro)
go
ALTER TABLE Prestado ADD CONSTRAINT Chk_idLibroPres
FOREIGN KEY (Id_Libro) REFERENCES Libro(Id_Libro)
go
ALTER TABLE Prestado ADD CONSTRAINT Chk_NoTarjeta
FOREIGN KEY (No_Tarjeta) REFERENCES Lector(No_Tarjeta)
go

--Inserciones
--Insercion de Editoriales
INSERT INTO Editorial values('Panamericana','Av. juarez',7321111)
go
INSERT INTO Editorial values('Antilope','Av. hidalgo',7884509)
go
INSERT INTO Editorial values('Textofilia','Av. morelos',7214365)
go
INSERT INTO Editorial values('Tumbona','Blv. revolucion',7097865)
go
INSERT INTO Editorial values('Espiga','Blv. constitucion',7019283)
go
INSERT INTO Editorial values('Acapulco','Blv. Rodriguez',7908854)
go
INSERT INTO Editorial values('Trillas','calle del remate',7558612)
go
INSERT INTO Editorial values('Alphaomega','calle heroes',7650045)
go
INSERT INTO Editorial values('Akal','calle roman',7325540)
go
INSERT INTO Editorial values('Cactus','Blv. revolucion',7115300)
go
--Insercion de Autores
INSERT INTO Autor values('Gabriel Garcia',7141615)
go
INSERT INTO Autor values('Jorge Luis',7181462)
go
INSERT INTO Autor values('Franz Perez',7621418)
go
INSERT INTO Autor values('Mario Vargas',7805275)
go
INSERT INTO Autor values('Federico Garcia',7912753)
go
INSERT INTO Autor values('Julio Cortazar',7357219)
go
INSERT INTO Autor values('Juan Rulfo',7754399)
go
INSERT INTO Autor values('Fernando Pesoa',7112458)
go
INSERT INTO Autor values('Vladimir Salazar',7944376)
go
INSERT INTO Autor values('Carlos Fuentes',7805275)
go
--Insercion de Libros
INSERT INTO Libro values(301,'Crimen y Castigo','Textofilia','Jorge Luis')
go
INSERT INTO Libro values(502,'100 años de soledad','Antilope','Franz Perez')
go
INSERT INTO Libro values(670,'El principito','Alphaomega','Juan Rulfo')
go
INSERT INTO Libro values(120,'Yo vole para el futuro','Tumbona','Vladimir Salazar')
go
INSERT INTO Libro values(300,'Los hornos de hitler','Trillas','Federico Garcia')
go
INSERT INTO Libro values(399,'Atlas','Akal','Mario Vargas')
go
INSERT INTO Libro values(789,'La divina comedia','Cactus','Fernando Pesoa')
go
INSERT INTO Libro values(564,'La cabaña','Acapulco','Carlos Fuentes')
go
INSERT INTO Libro values(298,'El diario de ana frank','Espiga','Julio Cortazar')
go
INSERT INTO Libro values(235,'El asesino en mi','Panamericana','Gabriel Garcia')
go
--Insercion de Ejemplares
INSERT INTO Ejemplares values(300,3542)
go
INSERT INTO Ejemplares values(120,3209)
go
INSERT INTO Ejemplares values(502,4986)
go
INSERT INTO Ejemplares values(789,1288)
go
INSERT INTO Ejemplares values(564,3543)
go
INSERT INTO Ejemplares values(670,9857)
go
INSERT INTO Ejemplares values(298,2112)
go
INSERT INTO Ejemplares values(301,6589)
go
INSERT INTO Ejemplares values(399,4390)
go
INSERT INTO Ejemplares values(235,2453)
go
--Insercion de Sucursal
INSERT INTO Sucursal values(5031,'Soriana','Av. Triana',300,21)
go
INSERT INTO Sucursal values(5013,'Wallmart','Av. andres',120,30)
go
INSERT INTO Sucursal values(5345,'Alsuper','Av. eduardo guerra',502,25)
go
INSERT INTO Sucursal values(1234,'Oxxo','Blv. tajito',789,18)
go
INSERT INTO Sucursal values(4321,'Seven','Blv. union',564,18)
go
INSERT INTO Sucursal values(4567,'Suburbia','Av. felix',670,40)
go
INSERT INTO Sucursal values(7654,'Cimaco','calle del rio',298,35)
go
INSERT INTO Sucursal values(9870,'Liverpol','calle del abasto',301,28)
go
INSERT INTO Sucursal values(0694,'Mercado','calle segunda',399,10)
go
INSERT INTO Sucursal values(3974,'Aurrera','calle del arenal',235,5)
go
--Insercion de Lector
INSERT INTO Lector values(04420617,'Federico Perez','Av. Siglo de Torreon',87111965)
go
INSERT INTO Lector values(98456392,'Martin Flores','Av. la Opinion',87122000)
go
INSERT INTO Lector values(87351104,'Kikeman Lopez','Av. Ramos',87189608)
go
INSERT INTO Lector values(76894327,'Andrea Juarez','calle escondida',87115474)
go
INSERT INTO Lector values(00568461,'Miriam Rios','calle oculta',87130596)
go
INSERT INTO Lector values(12569052,'Rosa Meza','Blv. lazaro',87125498)
go
INSERT INTO Lector values(98763489,'Efrain Gallegos','Av. abasolo',87204587)
go
INSERT INTO Lector values(12548233,'Gabriela Jimenez','Av. acuña',87130966)
go
INSERT INTO Lector values(89542277,'Jose Cerda','Av. colon',87146723)
go
INSERT INTO Lector values(66893455,'Pedro Marquez','calle principal',87148967)
go
--Insercion de Prestado
INSERT INTO Prestado values(502,98456392,'05/05/2017','06/12/2018')
go
INSERT INTO Prestado values(399,12569052,'08/07/2013','07/03/2017')
go
INSERT INTO Prestado values(670,00568461,'11/12/2016','11/09/2018')
go
INSERT INTO Prestado values(298,98763489,'4/08/2014','11/05/2016')
go
INSERT INTO Prestado values(564,89542277,'12/03/2017','7/11/2018')
go
INSERT INTO Prestado values(120,66893455,'1/05/2018','8/07/2018')
go
INSERT INTO Prestado values(301,12548233,'4/02/2011','6/10/2013')
go
INSERT INTO Prestado values(789,12569052,'10/10/2013','7/03/2015')
go
INSERT INTO Prestado values(235,76894327,'12/11/2012','6/01/2016')
go
INSERT INTO Prestado values(300,98456392,'01/12/2016','02/09/2018')
go
--Crear Indices
create index indx_titulo
on libro(Titulo)
go
create index indx_NombreSuc
on Sucursal(Nombre_Suc)
go
--CONSULTAS
select * from Editorial
go
select * from Autor
go
select * from Libro
go
select * from Ejemplares
go
select * from Sucursal
go
select * from Lector
go
select * from Prestado
go
--C1 QUE LIBRO SE LE PRESTO A EFRAIN GALLEGOS
SELECT Titulo from libro
where Id_Libro =(select Id_Libro from Prestado where No_Tarjeta=(select No_Tarjeta from Lector where Nombre_Lec like '%efrain gallegos%'))
go
--C2 CUAL ES LA EDITORIAL DEL LIBRO DEL AUTOR JULIO CORTAZAR
SELECT Nombre_Edi from Libro
where Nombre_Edi=(select Nombre_Edi from Libro where Nombre_Aut like '%julio cortazar%')
go
--C3 DIRECCION Y NOMBRE DE LA SUCURSAR QUE TIENE EL LIBRO ATLAS
SELECT Direccion_Suc,Nombre_Suc from Sucursal
where Id_Libro=(select Id_Libro from Libro where Titulo like '%Atlas%')
go
--C4 NOMBRE DEL LECTOR QUE SE LE PRESTO EL LIBRO LA CABAÑA
SELECT Nombre_Lec from Lector 
where No_Tarjeta in (select No_Tarjeta from Prestado where Id_Libro in(select Id_Libro from Libro where Titulo like '%la cabaña%'))
go
--C5 QUE FECHA FUE REGRESADO EL LIBRO DE LA EDITORIAL ACAPULCO
SELECT Devo_ulti from Prestado
where Id_Libro in (select Id_Libro from Libro where Nombre_Edi like '%acapulco%')
go
--C6 ORDENAR LOS LIBROS SEGUN SU AUTOR
SELECT * from Libro
order by Nombre_Aut
go
--C7 ORDERNAR DE FORMA DESCENDETE LOS LECTORES POR SU DIRECCION
SELECT * from Lector
order by Direccion_Lec desc
go
--C8 TELEFONO DEL AUTOR DEL LIBRO CRIMEN Y CASTIGO
SELECT Telefono_Aut FROM Autor
where Nombre_Aut in(select Nombre_Aut from Libro where Titulo like '%crimen y castigo%')
go
--C9 TITULO Y ID DEL LIBRO SE REPARTIO A LA SUCURSAL SEVEN
SELECT Id_Libro,Titulo FROM LIBRO
where Id_Libro in ( select Id_Libro from Sucursal where Nombre_Suc like '%Seven%')
go
--C10 PROMEDIO DE COPIA DE EJEMPLARES DISTRIBUIDAS EN TODAS LAS SUCURSALES
SELECT AVG(no_copias) from Sucursal
go
--C11 Mostrar Nombre de editorial y Direccion de la Editorial de la tabla editoriales
select Nombre_Edi,Direccion_Edi from Editorial
go
--C12 Mostrar direccion de editores que se situan en una avenida
Select Direccion_Edi  from editorial 
where Direccion_Edi like 'Av.%'
go
--C13 Mostrar nombre de editoriales cuyo nombre empiezen con la letra T
select Nombre_Edi  from Libro
where Nombre_Edi like 'T%'
go
--C14 Mostrar cual es el numero mas alto de ID en la tabla prestado
Select MAX(ID_Libro) from Prestado
go
--C15 ordenar la informacion de libros prestados de manera acendente por ID_Libro
select * from Prestado
order by (ID_Libro)
go
--C16 Contar cuantos ejemplares exixten en la base de datos
select count(*) from Ejemplares
go
--C17 contar cuantos autores tienen la primera letra de su nombre una "F"
select count(*) from Autor
where Nombre_Aut  like 'F%'
go
--C18 sumar los ID_ libro de todos los libros
select sum(ID_Libro) from Libro
go
--C19 CUANTOS EJEMPLARES TIENE EL LIBRO LA DIVINA COMEDIA
SELECT No_Copias from Sucursal
where Id_libro in (select Id_libro from Libro where Titulo like '%La divina comedia%') 
go
--C20 NOMBRE DEL AUTOR DEL LIBRO QUE SE PRESTO EL LA SUCURSAL OXXO
SELECT Nombre_Aut from Autor
where Nombre_Aut in (select Nombre_Aut from Libro where Id_Libro in (select Id_Libro from Sucursal where Nombre_Suc like '%OXXO%'))
go

--PROYECTO DE BASE DE DATOS TERMINANDO EL 17 DE NOVIEMBRE DEL 2018