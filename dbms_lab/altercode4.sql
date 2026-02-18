-- RENAME COLUMN

create database bbb;
use bbb;

create table ccc(

id int primary key,
name varchar(50)

);

insert into ccc values
(1,'Amin'),
(2,'Sara');

alter table ccc
rename column name to student_name;

select *from ccc;
