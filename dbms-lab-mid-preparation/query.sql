                                                 ################query###################
                                                 
DROP DATABASE IF EXISTS UNIVERSITY;
CREATE DATABASE UNIVERSITY;
USE UNIVERSITY;

-- --------------------
-- TABLES
-- --------------------

CREATE TABLE classroom (
    building VARCHAR(20),
    room_number INT,
    capacity INT,
    PRIMARY KEY (building, room_number)
);

CREATE TABLE department (
    dept_name VARCHAR(20),
    building VARCHAR(20),
    budget INT,
    PRIMARY KEY (dept_name)
);

CREATE TABLE course (
    course_id VARCHAR(20),
    title VARCHAR(50),
    dept_name VARCHAR(20),
    credits INT,
    PRIMARY KEY (course_id),
    FOREIGN KEY (dept_name) REFERENCES department(dept_name)
);

CREATE TABLE instructor (
    ID INT,
    name VARCHAR(20),
    dept_name VARCHAR(20),
    salary INT,
    PRIMARY KEY (ID),
    FOREIGN KEY (dept_name) REFERENCES department(dept_name)
);

CREATE TABLE student (
    ID INT,
    name VARCHAR(20),
    dept_name VARCHAR(20),
    tot_cred INT,
    PRIMARY KEY (ID),
    FOREIGN KEY (dept_name) REFERENCES department(dept_name)
);

CREATE TABLE section (
    course_id VARCHAR(20),
    sec_id INT,
    semester VARCHAR(10),
    `year` YEAR,
    building VARCHAR(20),
    room_number INT,
    time_slot_id CHAR(1),
    PRIMARY KEY (course_id, sec_id, semester, `year`),
    FOREIGN KEY (course_id) REFERENCES course(course_id),
    FOREIGN KEY (building, room_number) REFERENCES classroom(building, room_number)
);

CREATE TABLE teaches (
    ID INT,
    course_id VARCHAR(20),
    sec_id INT,
    semester VARCHAR(10),
    `year` YEAR,
    PRIMARY KEY (ID, course_id, sec_id, semester, `year`),
    FOREIGN KEY (ID) REFERENCES instructor(ID),
    FOREIGN KEY (course_id, sec_id, semester, `year`)
        REFERENCES section(course_id, sec_id, semester, `year`)
);

CREATE TABLE takes (
    ID INT,
    course_id VARCHAR(20),
    sec_id INT,
    semester VARCHAR(10),
    `year` YEAR,
    grade VARCHAR(2),
    PRIMARY KEY (ID, course_id, sec_id, semester, `year`),
    FOREIGN KEY (ID) REFERENCES student(ID),
    FOREIGN KEY (course_id, sec_id, semester, `year`)
        REFERENCES section(course_id, sec_id, semester, `year`)
);

CREATE TABLE advisor (
    s_id INT,
    i_id INT,
    PRIMARY KEY (s_id, i_id),
    FOREIGN KEY (s_id) REFERENCES student(ID),
    FOREIGN KEY (i_id) REFERENCES instructor(ID)
);

CREATE TABLE prereq (
    course_id VARCHAR(20),
    prereq_id VARCHAR(20),
    PRIMARY KEY (course_id, prereq_id),
    FOREIGN KEY (course_id) REFERENCES course(course_id),
    FOREIGN KEY (prereq_id) REFERENCES course(course_id)
);

-- --------------------
-- INSERT DATA
-- --------------------

INSERT INTO classroom VALUES
('Packard', 101, 500),
('Painter', 514, 10),
('Taylor', 3128, 70),
('Watson', 100, 30),
('Watson', 120, 50);

INSERT INTO department VALUES
('Biology', 'Watson', 90000),
('Comp. Sci.', 'Taylor', 100000),
('Elec. Eng.', 'Taylor', 85000),
('Finance', 'Painter', 120000),
('History', 'Painter', 50000),
('Music', 'Packard', 80000),
('Physics', 'Watson', 70000);

INSERT INTO course VALUES
('BIO-101', 'Intro. to Biology', 'Biology', 4),
('BIO-301', 'Genetics', 'Biology', 4),
('BIO-399', 'Computational Biology', 'Biology', 3),
('CS-101', 'Intro. to Computer Science', 'Comp. Sci.', 4),
('CS-190', 'Game Design', 'Comp. Sci.', 4),
('CS-315', 'Robotics', 'Comp. Sci.', 3),
('CS-319', 'Image Processing', 'Comp. Sci.', 3),
('CS-347', 'Database System Concepts', 'Comp. Sci.', 3),
('EE-181', 'Intro. to Digital Systems', 'Elec. Eng.', 3),
('FIN-201', 'Investment Banking', 'Finance', 3),
('HIS-351', 'World History', 'History', 3),
('MU-199', 'Music Video Production', 'Music', 3),
('PHY-101', 'Physical Principles', 'Physics', 4);

INSERT INTO instructor VALUES
(10101, 'Srinivasan', 'Comp. Sci.', 65000),
(12121, 'Wu', 'Finance', 90000),
(15151, 'Mozart', 'Music', 40000),
(22222, 'Einstein', 'Physics', 95000),
(32343, 'El Said', 'History', 60000),
(33456, 'Gold', 'Physics', 87000),
(45565, 'Katz', 'Comp. Sci.', 75000),
(58583, 'Califieri', 'History', 62000),
(76543, 'Singh', 'Finance', 80000),
(76766, 'Crick', 'Biology', 72000),
(83821, 'Brandt', 'Comp. Sci.', 92000),
(98345, 'Kim', 'Elec. Eng.', 80000);

INSERT INTO section VALUES
('BIO-101', 1, 'Summer', 2009, 'Painter', 514, 'B'),
('BIO-301', 1, 'Summer', 2010, 'Painter', 514, 'A'),
('CS-101', 1, 'Fall', 2009, 'Packard', 101, 'H'),
('CS-101', 1, 'Spring', 2010, 'Packard', 101, 'F'),
('CS-190', 1, 'Spring', 2009, 'Taylor', 3128, 'E'),
('CS-190', 2, 'Spring', 2009, 'Taylor', 3128, 'A'),
('CS-315', 1, 'Spring', 2010, 'Watson', 120, 'D'),
('CS-319', 1, 'Spring', 2010, 'Watson', 100, 'B'),
('CS-319', 2, 'Spring', 2010, 'Taylor', 3128, 'C'),
('CS-347', 1, 'Fall', 2009, 'Taylor', 3128, 'A'),
('EE-181', 1, 'Spring', 2009, 'Taylor', 3128, 'C'),
('FIN-201', 1, 'Spring', 2010, 'Packard', 101, 'B'),
('HIS-351', 1, 'Spring', 2010, 'Painter', 514, 'C'),
('MU-199', 1, 'Spring', 2010, 'Packard', 101, 'D'),
('PHY-101', 1, 'Fall', 2009, 'Watson', 100, 'A');

INSERT INTO student VALUES
(128, 'Zhang', 'Comp. Sci.', 102),
(12345, 'Shankar', 'Comp. Sci.', 32),
(19991, 'Brandt', 'History', 80),
(23121, 'Chavez', 'Finance', 110),
(44553, 'Peltier', 'Physics', 56),
(45678, 'Levy', 'Physics', 46),
(54321, 'Williams', 'Comp. Sci.', 54),
(55739, 'Sanchez', 'Music', 38),
(70557, 'Snow', 'Physics', 0),
(76543, 'Brown', 'Comp. Sci.', 58),
(76653, 'Aoi', 'Elec. Eng.', 60),
(98765, 'Bourikas', 'Elec. Eng.', 98),
(98988, 'Tanaka', 'Biology', 120);

INSERT INTO teaches VALUES
(10101, 'CS-101', 1, 'Fall', 2009),
(10101, 'CS-315', 1, 'Spring', 2010),
(10101, 'CS-347', 1, 'Fall', 2009),
(12121, 'FIN-201', 1, 'Spring', 2010),
(15151, 'MU-199', 1, 'Spring', 2010),
(22222, 'PHY-101', 1, 'Fall', 2009),
(32343, 'HIS-351', 1, 'Spring', 2010),
(45565, 'CS-101', 1, 'Spring', 2010),
(45565, 'CS-319', 1, 'Spring', 2010),
(76766, 'BIO-101', 1, 'Summer', 2009),
(76766, 'BIO-301', 1, 'Summer', 2010),
(83821, 'CS-190', 1, 'Spring', 2009),
(83821, 'CS-190', 2, 'Spring', 2009),
(83821, 'CS-319', 2, 'Spring', 2010),
(98345, 'EE-181', 1, 'Spring', 2009);

INSERT INTO takes VALUES
(128, 'CS-101', 1, 'Fall', 2009, 'A'),
(128, 'CS-347', 1, 'Fall', 2009, 'A-'),
(12345, 'CS-101', 1, 'Fall', 2009, 'C'),
(12345, 'CS-190', 2, 'Spring', 2009, 'A'),
(12345, 'CS-315', 1, 'Spring', 2010, 'A'),
(12345, 'CS-347', 1, 'Fall', 2009, 'A'),
(19991, 'HIS-351', 1, 'Spring', 2010, 'B'),
(23121, 'FIN-201', 1, 'Spring', 2010, 'C+'),
(44553, 'PHY-101', 1, 'Fall', 2009, 'B-'),
(45678, 'CS-101', 1, 'Fall', 2009, 'F'),
(45678, 'CS-101', 1, 'Spring', 2010, 'B+'),
(45678, 'CS-319', 1, 'Spring', 2010, 'B'),
(54321, 'CS-101', 1, 'Fall', 2009, 'A-'),
(54321, 'CS-190', 2, 'Spring', 2009, 'B+'),
(55739, 'MU-199', 1, 'Spring', 2010, 'A-'),
(76543, 'CS-101', 1, 'Fall', 2009, 'A'),
(76543, 'CS-319', 2, 'Spring', 2010, 'A'),
(76653, 'EE-181', 1, 'Spring', 2009, 'C'),
(98765, 'CS-101', 1, 'Fall', 2009, 'C-'),
(98765, 'CS-315', 1, 'Spring', 2010, 'B'),
(98988, 'BIO-101', 1, 'Summer', 2009, 'A'),
(98988, 'BIO-301', 1, 'Summer', 2010, NULL);

INSERT INTO advisor VALUES
(128, 45565),
(12345, 10101),
(23121, 76543),
(44553, 22222),
(45678, 22222),
(76543, 45565),
(76653, 98345),
(98765, 98345),
(98988, 76766);

INSERT INTO prereq VALUES
('BIO-301', 'BIO-101'),
('BIO-399', 'BIO-101'),
('CS-190', 'CS-101'),
('CS-315', 'CS-101'),
('CS-319', 'CS-101'),
('CS-347', 'CS-101'),
('EE-181', 'PHY-101');


### **1. List All Students and Their Departments**

select ID,name,dept_name from student;


### **2. Find Courses and Their Instructors**

select course.course_id,course.title,instructor.name as instructor_name
from teaches
join course on teaches.course_id=course.course_id
join instructor on teaches.ID=instructor.ID;

### **3. Get All Sections for Course `CS-101`**

select semester,year,building,room_number
from section
where course_id='CS-101';

### **4. List All Instructors and Their Teaching Sections**

select instructor.id, instructor.name,
teaches.course_id,teaches.sec_id,teaches.semester,teaches.year
from teaches
join instructor on teaches.ID=instructor.ID;


### **5. Find Students Enrolled in `BIO-101


select student.ID,student.name,takes.course_id
from student
join takes on student.ID=takes.ID
where takes.course_id='BIO-101';


### 6. Find Students and Their Advisors

SELECT student.ID AS student_id,
       student.name AS student_name,
       instructor.ID AS advisor_id,
       instructor.name AS advisor_name
FROM student
JOIN advisor ON student.ID = advisor.s_id
JOIN instructor ON advisor.i_id = instructor.ID;


### **7. Get Courses with Prerequisites**

select course.course_id,course.title,
prereq.prereq_id
from course
join prereq on course.course_id=prereq.course_id;


### **8. List Departments and Their Courses**

select department.dept_name,course.title
from department
join course on department.dept_name=course.dept_name;


### **9. Find Courses Taught by Instructor `83821`**


select course.course_id,course.title,teaches.ID
from teaches
join course on teaches.course_id=course.course_id
where teaches.ID=83821;


### **10. Show Students with Their Grades in `CS-319`**

select student.ID,student.name,takes.grade
from takes
join student on takes.ID=student.ID
where takes.course_id='CS-319';


### **11. Students Who Took *All* Comp. Sci. Courses**

SELECT student.ID, student.name
FROM student
JOIN takes ON student.ID = takes.ID
JOIN course ON takes.course_id = course.course_id
WHERE course.dept_name = 'Comp. Sci.'
GROUP BY student.ID, student.name
HAVING COUNT(DISTINCT course.course_id) = (
    SELECT COUNT(*)
    FROM course
    WHERE dept_name = 'Comp. Sci.'
);



### **12. Instructors Teaching Multiple Courses**

select instructor.ID,instructor.name,
count(distinct teaches.course_id) as course_count
from teaches
join instructor on teaches.ID=instructor.ID
group by instructor.ID,instructor.name
having count(distinct teaches.course_id)>1;


### **13. Students with Advisors from Comp. Sci.**


select student.ID,student.name,instructor.name as advisor_name
from student
join advisor on student.ID=advisor.s_id
join instructor on advisor.i_id=instructor.ID
where instructor.dept_name='Comp. Sci.';


### **14. Departments with No Courses Offered**


SELECT department.dept_name
FROM department
LEFT JOIN course ON department.dept_name = course.dept_name
WHERE course.course_id IS NULL;


### **15. Average Grade for Each Course (Correct GPA Mapping)**

select takes.course_id,course.title,
avg( case takes.grade

WHEN 'A'  THEN 4.0
               WHEN 'A-' THEN 3.7
               WHEN 'B+' THEN 3.3
               WHEN 'B'  THEN 3.0
               WHEN 'B-' THEN 2.7
               WHEN 'C+' THEN 2.3
               WHEN 'C'  THEN 2.0
               WHEN 'C-' THEN 1.7
               WHEN 'D+' THEN 1.3
               WHEN 'D'  THEN 1.0
               WHEN 'F'  THEN 0.0
               ELSE NULL
           END
       ) as average_grade
       from takes
       join course on takes.course_id=course.course_id
       group by takes.course_id,course.title;
       
       
       ### 16. Find the Most Popular Time Slot for Each Course
       
       SELECT s.course_id, s.time_slot_id, COUNT(*) AS frequency
FROM section s
GROUP BY s.course_id, s.time_slot_id
HAVING COUNT(*) = (
    SELECT MAX(cnt)
    FROM (
        SELECT COUNT(*) AS cnt
        FROM section
        WHERE course_id = s.course_id
        GROUP BY time_slot_id
    ) AS temp
);
       
       ### **17. Student with Highest Credits in Each Department**
       
        select s.ID,s.name,s.dept_name,s.tot_cred
from student s
join student s2 on s.dept_name=s2.dept_name
group by s.ID,s.name,s.dept_name,s.tot_cred
having s.tot_cred>=max(s2.tot_cred)
order by s.dept_name;
	
       
       
   ### **18. Courses Not Taught in Spring 2018**
   
SELECT course.course_id, course.title
FROM course
LEFT JOIN section 
  ON course.course_id = section.course_id
 AND section.semester = 'Spring'
 AND section.year = 2018
WHERE section.course_id IS NULL;


### **19. Departments with Most Courses Taught**

select course.dept_name,
count( distinct teaches.course_id) as course_taught
from teaches
join course on teaches.course_id=course.course_id
group by course.dept_name
order by course_taught desc;
   
       





















