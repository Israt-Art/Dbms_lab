/* =========================================
   PART A – Database & Table Creation (DDL)
   ========================================= */

-- 1. Create database and switch to it
CREATE DATABASE SmartLibrary;
USE SmartLibrary;

-- 2. Create Books table
CREATE TABLE Books (
    BookID INT PRIMARY KEY,
    Title VARCHAR(100) NOT NULL,
    Author VARCHAR(50),
    Price DECIMAL(6,2) CHECK (Price > 0),
    Category VARCHAR(30)
);

-- 3. Create Members table
CREATE TABLE Members (
    MemberID INT PRIMARY KEY,
    MemberName VARCHAR(50) NOT NULL,
    Email VARCHAR(50) UNIQUE,
    MembershipDate DATE
);

-- 4. Create Issues table
CREATE TABLE Issues (
    IssueID INT PRIMARY KEY,
    BookID INT,
    MemberID INT,
    IssueDate DATE,
    ReturnDate DATE,
    FOREIGN KEY (BookID) REFERENCES Books(BookID),
    FOREIGN KEY (MemberID) REFERENCES Members(MemberID)
);



/* =========================================
   PART B – Table Modification & Constraints
   ========================================= */

-- 5. Add Stock column with default value 5
ALTER TABLE Books
ADD Stock INT DEFAULT 5;

-- 6. Add CHECK constraint for MembershipDate
ALTER TABLE Members
ADD CONSTRAINT chk_membership_date
CHECK (MembershipDate <= CURRENT_DATE);

-- 7. Modify Price column to allow up to 9999.99
ALTER TABLE Books
MODIFY Price DECIMAL(8,2);

-- 8. Remove Category column
ALTER TABLE Books
DROP COLUMN Category;



/* =========================================
   PART C – Data Manipulation (DML)
   ========================================= */

-- 9. Insert three records into Books
INSERT INTO Books (BookID, Title, Author, Price, Stock) VALUES
(101, 'Database Systems', 'C.J. Date', 550.00, 10),
(102, 'Clean Code', 'Robert C. Martin', 650.00, 8),
(103, 'Operating Systems', 'Silberschatz', 750.00, 6);

-- 10. Insert two records into Members
INSERT INTO Members (MemberID, MemberName, Email, MembershipDate) VALUES
(1, 'Alice Johnson', 'alice@example.com', '2021-05-10'),
(2, 'Bob Smith', 'bob@example.com', '2019-08-15');

-- 11. Decrease stock of BookID = 101 by 1
UPDATE Books
SET Stock = Stock - 1
WHERE BookID = 101;

-- 12. Delete members who joined before 1st January 2020
DELETE FROM Members
WHERE MembershipDate < '2020-01-01';



/* =========================================
   PART D – Aggregate Functions & Queries
   ========================================= */

-- 13. Total number of books
SELECT COUNT(*) AS TotalBooks
FROM Books;

-- 14. Average price of all books
SELECT AVG(Price) AS AveragePrice
FROM Books;

-- 15. Maximum and minimum book price
SELECT MAX(Price) AS MaxPrice,
       MIN(Price) AS MinPrice
FROM Books;

-- 16. Count of members
SELECT COUNT(*) AS TotalMembers
FROM Members;

-- 17. Total stock of all books combined
SELECT SUM(Stock) AS TotalStock
FROM Books;
