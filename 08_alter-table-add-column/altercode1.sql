-- add column
CREATE DATABASE alter1;
USE alter1; 

CREATE TABLE Stu ( 
    id INT PRIMARY KEY,
    name VARCHAR(50)
);

INSERT INTO Stu VALUES
(1, 'Amin'),
(2, 'Sara');


ALTER TABLE Stu
ADD age INT; 

UPDATE Stu SET age = 20 WHERE id = 1;  -- if we do not update age then age coulum create but it will show null value
UPDATE Stu SET age = 22 WHERE id = 2;

SELECT * FROM Stu;
