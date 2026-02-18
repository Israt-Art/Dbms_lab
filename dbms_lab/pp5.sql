create database chat2;
use chat2;


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

select dept_id,avg(salary) as avg_salary from Employee
group by dept_id
having avg(salary)>38000;
