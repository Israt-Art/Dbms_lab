drop database if exists pet_collection;
create database pet_collection;
use pet_collection;

CREATE TABLE Pets (
    pet_id INT,
    name VARCHAR(50) NOT NULL,
    species VARCHAR(50) NOT NULL,
    age INT NOT NULL CHECK (age >= 0),
    owner_name VARCHAR(100) DEFAULT 'unassigned owner',
    last_visit DATE UNIQUE
);


alter table Pets
add primary key(pet_id);

describe pets;

####or

alter table Pets
add constraint pk_pets primary key(pet_id);

describe Pets;

                   #################
                   
alter table Pets
modify owner_name varchar(100) default 'unassigned owner';

describe Pets;

INSERT INTO Pets (pet_id, name, species, age, last_visit)
VALUES (104, 'Milo', 'Cat', 2, '2024-12-01');

select *from Pets;


                ########################
                
alter table Pets
modify species varchar(50) not null;

describe pets;
                
              ##########################
              
alter table Pets
add column gender varchar(20);

describe Pets;

