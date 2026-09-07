create database alter3;
use alter3;

-- MODIFY DATA TYPE

create table aaa(

id int primary key,
name varchar(2)
);

insert into aaa values
(1,'Amin'),
(2,'Tanveer');

alter table aaa
modify name varchar(7);

select *from aaa;


