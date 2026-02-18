create database alter8;
use alter8;

create table op(

id int primary key,
email varchar(50)
);


INSERT INTO op VALUES
(1, 'x@gmail.com'),
(3, 'x@gmail.com'),
(2, 'y@gmail.com');

ALTER TABLE op
modify email varchar(50) unique;

select *from op;
-- comiler and online compiler didnot provide correct answer