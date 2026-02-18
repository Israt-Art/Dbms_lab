-- drop column

create database altercode7;
use altercode7;

create table ddd(
id int primary key,
name varchar(50),
age int
);

insert into ddd values

(1,'Amin',20),
(2,'Sara',30);

alter table ddd
drop column age;

select *from ddd;