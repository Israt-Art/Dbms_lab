create database chat;
use chat;


CREATE TABLE Department(
    dept_id INT PRIMARY KEY,
    dept_name VARCHAR(30)
);

CREATE TABLE Employee(
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(30),
    dept_id INT,
    salary INT,
    FOREIGN KEY(dept_id) REFERENCES Department(dept_id)
);

INSERT INTO Department VALUES
(1,'CSE'),
(2,'EEE'),
(3,'BBA');

INSERT INTO Employee VALUES
(101,'Rahim',1,40000),
(102,'Karim',2,35000),
(103,'Sumaiya',1,50000),
(104,'Rima', NULL,30000);

SELECT emp_name, dept_name
FROM Employee
INNER JOIN Department
ON Employee.dept_id = Department.dept_id;
