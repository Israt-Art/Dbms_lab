-- ADD NOT NULL COLUMN

CREATE DATABASE alter2;
USE alter2;

CREATE TABLE Stu1 (
    id INT PRIMARY KEY,
    name VARCHAR(50)
);

INSERT INTO Stu1 VALUES
(1, 'Amin'),
(2, 'Amy');

ALTER TABLE Stu1
ADD email VARCHAR(100) NOT NULL;

UPDATE Stu1 SET email='amin@gmail.com' WHERE id=1;
UPDATE Stu1 SET email='null' WHERE id=2;

SELECT * FROM Stu1;
