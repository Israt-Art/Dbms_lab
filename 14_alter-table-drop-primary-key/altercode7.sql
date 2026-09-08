create database alter10;
use alter10;

create table ii(
id int primary key,
name varchar(50)
);

insert into ii values

(1, 'Amin'),
(3, 'Rafi');

alter table ii
drop primary key;

select *from ii;

-- but it shows two times