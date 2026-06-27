
-- Library Management System
-- Author : Charan Sai
-- Database : LibraryManagementSystem




-- Create Database
CREATE DATABASE LibraryManagementSystem;

-- Use Database
USE LibraryManagementSystem;

-- Create Categories Table

CREATE TABLE Categories (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(100) NOT NULL
);

-- Create Books Table


CREATE TABLE Books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(255) NOT NULL,
    isbn VARCHAR(20) UNIQUE,
    publication_year INT,
    category_id INT,
    FOREIGN KEY (category_id)
        REFERENCES Categories(category_id)
);

-- Create Students Table


CREATE TABLE Students (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    student_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(15)
);


-- Create IssuedBooks Table


CREATE TABLE IssuedBooks (
    issue_id INT AUTO_INCREMENT PRIMARY KEY,
    student_id INT,
    book_id INT,
    issue_date DATE,
    due_date DATE,
    FOREIGN KEY (student_id)
        REFERENCES Students(student_id),
    FOREIGN KEY (book_id)
        REFERENCES Books(book_id)
);

-- Insert Categories


INSERT INTO Categories (category_name)
VALUES
('Programming'),
('Database'),
('Computer Networks'),
('Operating Systems'),
('Artificial Intelligence');


-- Insert Books


INSERT INTO Books
(title, isbn, publication_year, category_id)
VALUES
('Java: The Complete Reference','9781260440232',2021,1),
('Head First Java','9781491910771',2018,1),
('Database System Concepts','9780073523323',2019,2),
('Computer Networking: A Top-Down Approach','9780136681557',2021,3),
('Operating System Concepts','9781119800368',2020,4),
('Artificial Intelligence: A Modern Approach','9780134610993',2021,5),
('Clean Code','9780132350884',2008,1),
('Introduction to Algorithms','9780262046305',2022,1);


-- Insert Students


INSERT INTO Students
(student_name,email,phone)
VALUES
('Rahul Sharma','rahul@gmail.com','9876543210'),
('Priya Reddy','priya@gmail.com','9876543211'),
('Arjun Kumar','arjun@gmail.com','9876543212'),
('Sneha Patel','sneha@gmail.com','9876543213'),
('Kiran Rao','kiran@gmail.com','9876543214'),
('Anjali Verma','anjali@gmail.com','9876543215'),
('Vikram Singh','vikram@gmail.com','9876543216'),
('Meghana Das','meghana@gmail.com','9876543217');


-- Insert Issued Books


INSERT INTO IssuedBooks
(student_id,book_id,issue_date,due_date)
VALUES
(1,1,'2026-06-01','2026-06-15'),
(2,3,'2026-06-03','2026-06-17'),
(3,5,'2026-06-05','2026-06-19'),
(4,2,'2026-06-06','2026-06-20'),
(5,4,'2026-06-08','2026-06-22'),
(6,6,'2026-06-10','2026-06-24'),
(7,7,'2026-06-11','2026-06-25'),
(8,8,'2026-06-12','2026-06-26');


-- Display Tables


SELECT * FROM Categories;

SELECT * FROM Books;

SELECT * FROM Students;

SELECT * FROM IssuedBooks;


-- Sample Queries


-- Display all books
SELECT * FROM Books;

-- Display all students
SELECT * FROM Students;

-- Books in Programming category
SELECT *
FROM Books
WHERE category_id = 1;

-- Count total books
SELECT COUNT(*) AS Total_Books
FROM Books;

-- Count total students
SELECT COUNT(*) AS Total_Students
FROM Students;

-- Display issued books with student names
SELECT
    s.student_name,
    b.title,
    i.issue_date,
    i.due_date
FROM IssuedBooks i
JOIN Students s
ON i.student_id = s.student_id
JOIN Books b
ON i.book_id = b.book_id;

-- Books issued after June 5
SELECT *
FROM IssuedBooks
WHERE issue_date > '2026-06-05';

-- Sort books by publication year
SELECT *
FROM Books
ORDER BY publication_year DESC;

-- Count books in each category
SELECT
    c.category_name,
    COUNT(b.book_id) AS Number_of_Books
FROM Categories c
LEFT JOIN Books b
ON c.category_id = b.category_id
GROUP BY c.category_name;

-- Students who borrowed books
SELECT DISTINCT
    s.student_name
FROM Students s
JOIN IssuedBooks i
ON s.student_id = i.student_id;

-- Total books issued
SELECT COUNT(*) AS Total_Issued_Books
FROM IssuedBooks;