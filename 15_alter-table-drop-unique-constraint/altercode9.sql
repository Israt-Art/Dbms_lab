-- drop uniquee

CREATE DATABASE alterr;
USE alterr;

CREATE TABLE nntt (
    id INT PRIMARY KEY,
    email VARCHAR(50) UNIQUE
);

INSERT INTO nntt VALUES
(1, 'a@gmail.com'),
(2, 'a@gmail.com');

ALTER TABLE nntt
DROP constraint unique_email;


SELECT * FROM nntt;

--  did not run properly