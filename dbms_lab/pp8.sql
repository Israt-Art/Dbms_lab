create database chat5;
use chat5;


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

select emp_name,salary from Employee
order by salary desc limit 2;
