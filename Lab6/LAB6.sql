-- Lab6



-- Create Database 

CREATE DATABASE library;
    SHOW DATABASES;
    USE library;


    CREATE TABLE Books (
        BookID INT PRIMARY KEY NOT NULL,
        Book_Name VARCHAR(100) NOT NULL,
        Publisher VARCHAR(100) NOT NULL,
        Year INT NOT NULL,
        ISBN INT
    );

    Desc Books;

    ALTER TABLE Books DROP COLUMN ISBN;

   Desc Books;




-- Create table Book Issued 

CREATE TABLE Book_issues( Issue_number INT PRIMARY KEY NOT NULL,
 BookID INT NOT NULL, StudentID INT NOT NULL, 
 Date_of_issue DATE NOT NULL, 
 Date_of_return DATE NOT NULL, 
 Returned_book BOOLEAN NOT NULL,  

 FOREIGN KEY (BookID) REFERENCES Books(BookID), 
 FOREIGN KEY (StudentID) REFERENCES Student(StudentID) 
 );


Desc Book_issues;





-- Create Student Table

CREATE TABLE Student (
    StudentID int PRIMARY KEY,
    Student_Name varchar(100) NOT NULL,
    Department varchar(100) NOT NULL,
    Email varchar(100) NOT NULL,
    DOB date NOT NULL
    );

Desc Student;




-- Insert entries in Books table

INSERT INTO Books (BookID, Book_Name, Publisher, Year) VALUES
    (1, 'Rich Dad Poor Dad', 'Robert Kiyosaki', 1997),
    (2, 'Atomic Habits', 'Avery', 2018),
    (3, 'The Psychology of Money', 'Harriman House', 2020),
    (4, 'Sapiens', 'Harvill Secker', 2011),
    (5, 'Deep Work', 'Grand Central Publishing', 2016),
    (6, 'The Power of Habit', 'Random House', 2012),
    (7, 'Thinking, Fast and Slow', 'Farrar, Straus and Giroux', 2011),
    (8, 'Ikigai', 'Penguin Life', 2016),
    (9, 'Wings of Fire', 'Universities Press', 1999),
    (10, 'Never Lie', 'Independently Published', 2022);




-- Insert entries in student table

INSERT INTO Student (StudentID, Student_Name, Department, Email, DOB) VALUES
(201, 'Himiksha', 'Biotechnology', 'himiksha201@gmail.com', '2002-01-15'),
(202, 'Inshika', 'Microbiology', 'inshika202@gmail.com', '2002-03-22'),
(203, 'Ishita', 'Biochemistry', 'ishita203@gmail.com', '2001-11-05'),
(204, 'Hemachandra', 'Genetics', 'hemachandra204@gmail.com', '2002-07-10'),
(205, 'Anchal', 'Biotechnology', 'anchal205@gmail.com', '2001-12-19'),
(206, 'Aisha', 'Microbiology', 'aisha206@gmail.com', '2002-02-08'),
(207, 'Harish', 'Biochemistry', 'harish207@gmail.com', '2001-09-30'),
(208, 'Hariharan', 'Genetics', 'hariharan208@gmail.com', '2002-05-14'),
(209, 'Disha', 'Biotechnology', 'disha209@gmail.com', '2001-10-25'),
(210, 'Atharva', 'Microbiology', 'atharva210@gmail.com', '2002-06-18');




-- Insert entries into Book issues table

INSERT INTO Book_issues
    (Issue_number, BookID, StudentID, Date_of_issue, Date_of_return, Returned_book)
    VALUES
    (1, 1, 201, '2026-01-05', '2026-01-12', 1),
    (2, 2, 202, '2026-01-06', '2026-01-13', 1),
    (3, 3, 203, '2026-01-07', '2026-01-14', 0),
    (4, 4, 204, '2026-01-08', '2026-01-15', 1),
    (5, 5, 205, '2026-01-09', '2026-01-16', 0),
    (6, 6, 206, '2026-01-10', '2026-01-17', 1),
    (7, 7, 207, '2026-01-11', '2026-01-18', 0),
    (8, 8, 208, '2026-01-12', '2026-01-19', 1),
    (9, 9, 209, '2026-01-13', '2026-01-20', 1),
    (10, 10, 210, '2026-01-14', '2026-01-21', 0);




-- Showing output

SELECT * from Books;

SELECT * from Student;

SELECT * from Book_issues;












