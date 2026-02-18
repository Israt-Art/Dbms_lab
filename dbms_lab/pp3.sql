create database games;
use games;

create table fav_games(

id int not null,
name varchar(20),
popularity int,
primary key(id)

);

insert into fav_games values(1,"football",10);
insert into fav_games values(2,"cricket",9);
insert into fav_games values(3,"golf",4);

select *from fav_games;