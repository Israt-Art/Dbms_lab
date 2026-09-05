-- =========================
-- Reset Database
-- =========================
DROP DATABASE IF EXISTS LabMid;
CREATE DATABASE LabMid;
USE LabMid;

-- =========================
-- Create Employee Table
-- =========================
CREATE TABLE Employee (
    emp_id INT PRIMARY KEY,
    emp_name VARCHAR(30),
    department VARCHAR(20),
    salary DECIMAL(10,2) CHECK (salary >= 30000)
);

-- =========================
-- Create Project Table
-- =========================
CREATE TABLE Project (
    proj_id INT PRIMARY KEY,
    proj_name VARCHAR(30),
    budget DECIMAL(12,2)
);

-- =========================
-- Create Works_on Table
-- =========================
CREATE TABLE Works_on (
    emp_id INT,
    proj_id INT,
    hours INT,
    FOREIGN KEY (emp_id) REFERENCES Employee(emp_id),
    FOREIGN KEY (proj_id) REFERENCES Project(proj_id)
);

-- =========================
-- Insert Data into Employee
-- =========================
INSERT INTO Employee VALUES
(1, 'Alice', 'HR', 50000),
(2, 'Bob', 'IT', 60000),
(3, 'Charlie', 'IT', 75000),
(4, 'Diana', 'Finance', 65000),
(5, 'Eve', 'HR', 48000);

-- =========================
-- Insert Data into Project
-- =========================
INSERT INTO Project VALUES
(101, 'Payroll', 200000),
(102, 'E-commerce', 500000),
(103, 'Warehouse', 350000);

-- =========================
-- Insert Data into Works_on
-- =========================
INSERT INTO Works_on VALUES
(1,101,20),
(2,101,35),
(2,102,40),
(3,103,50),
(4,102,25),
(5,101,30);

-- =========================
-- Q2: Project with highest budget
-- =========================
SELECT *
FROM Project
ORDER BY budget DESC
LIMIT 1;

-- =========================
-- Q3: Department & Average Salary
-- =========================
SELECT department,
       AVG(salary) AS avg_salary
FROM Employee
GROUP BY department;

-- =========================
-- Q4: Employees working on more than one project
-- =========================
SELECT e.emp_id,
       e.emp_name,
       COUNT(w.proj_id) AS total_projects
FROM Employee e
JOIN Works_on w
ON e.emp_id = w.emp_id
GROUP BY e.emp_id, e.emp_name
HAVING COUNT(w.proj_id) > 1;

-- =========================
-- Q5: Employees & total hours worked
-- =========================
SELECT e.emp_id,
       e.emp_name,
       SUM(w.hours) AS total_hours
FROM Employee e
JOIN Works_on w
ON e.emp_id = w.emp_id
GROUP BY e.emp_id, e.emp_name;

-- =========================
-- Q6: Employees not working on any project
-- =========================
SELECT e.emp_id,
       e.emp_name
FROM Employee e
LEFT JOIN Works_on w
ON e.emp_id = w.emp_id
WHERE w.emp_id IS NULL;

-- =========================
-- Q7: Employees working on projects
-- with budget > 300000
-- =========================
SELECT DISTINCT
       e.emp_id,
       e.emp_name,
       p.proj_name,
       p.budget
FROM Employee e
JOIN Works_on w
ON e.emp_id = w.emp_id
JOIN Project p
ON w.proj_id = p.proj_id
WHERE p.budget > 300000;

-- =========================
-- Q8: Increase IT employees salary by 10%
-- =========================
UPDATE Employee
SET salary = salary * 1.10
WHERE department='IT';

-- Check updated data
SELECT * FROM Employee;

-- =========================
-- Q9: 2nd highest paid employee
-- =========================
SELECT *
FROM Employee
ORDER BY salary DESC
LIMIT 1 OFFSET 1;

-- =========================
-- Q10: 3rd highest paid employee
-- =========================
SELECT *
FROM Employee
ORDER BY salary DESC
LIMIT 1 OFFSET 2;

-- =========================
-- Count employees by department
-- salary > 50000
-- =========================
SELECT department,
       COUNT(emp_id) AS total_employees
FROM Employee
WHERE salary>50000
GROUP BY department
HAVING COUNT(emp_id)<5
ORDER BY total_employees DESC
LIMIT 10;

-- =========================
-- Salary aggregation queries
-- =========================

SELECT emp_id,
       SUM(salary) AS total_salary
FROM Employee
GROUP BY emp_id
HAVING SUM(salary)>5000;

SELECT emp_id,
       SUM(salary) AS total_salary,
       MAX(salary) AS max_salary
FROM Employee
GROUP BY emp_id;

SELECT emp_id,
       COUNT(*) AS total
FROM Employee
WHERE emp_id!=1
GROUP BY emp_id;

SELECT emp_id,
       MAX(salary) AS maxsalary
FROM Employee
WHERE salary>=3000
GROUP BY emp_id
HAVING MAX(salary)>5000;

SELECT emp_id,
       MAX(salary) AS maxsalary,
       MIN(salary) AS minsalary
FROM Employee
GROUP BY emp_id
HAVING SUM(salary)>5000;

SELECT emp_id,
       COUNT(*) AS emp_id_count
FROM Employee
WHERE salary>4000
AND emp_id!=2
GROUP BY emp_id;