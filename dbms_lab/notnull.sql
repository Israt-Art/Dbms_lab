CREATE DATABASE notNullTest;
USE notNullTest;

CREATE TABLE Employee (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(50) NOT NULL,
    salary DECIMAL(10,2) NOT NULL
);


INSERT INTO Employee VALUES (1, 'Amin', 35000.00);

-- ❌ INVALID INSERT (will cause NOT NULL error)
INSERT INTO Employee VALUES (2, NULL, 40000.00);


select *from Employee;