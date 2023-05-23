CREATE DATABASE `crud-estudiantes` /*!40100 DEFAULT CHARACTER SET utf8 */;
create table tabestudiante(
id int primary key not null,
documento varchar(30),
apellidos varchar(30),
nombres varchar(30)
);