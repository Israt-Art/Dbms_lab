-- ADD PRIMARY KEY

create database alter8;
use alter8;

create table ee(
id int,
name varchar(20)
);

insert into ee values
(1, 'Amin'),
(1,'Amy'),
(2, 'Sara');

alter table ee
add primary key(id);

select *from ee;
