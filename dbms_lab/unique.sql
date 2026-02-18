CREATE DATABASE uniqueDB;
USE uniqueDB;

CREATE TABLE Users (
    user_id INT PRIMARY KEY,
    username VARCHAR(50) UNIQUE,
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(20)
);

-- Valid inserts
INSERT INTO Users VALUES (1, 'amin123', 'amin@gmail.com', '01711111111');
INSERT INTO Users VALUES(2, 'sara22', 'sara@gmail.com', '01722222222');

-- ❌ INVALID insert (duplicate username)
INSERT INTO Users VALUES (3, 'amin123', 'newemail@gmail.com', '01733333333');

select *from Users;