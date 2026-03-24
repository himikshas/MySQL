-- LAB 7



-- (1) Add a column to the table book_issues (fine). The datatype should be in decimals. (Use Alter
-- table add column_name)

ALTER TABLE Book_issues
ADD Fine DECIMAL(20,5);




-- (2) Modify the column fine to NOT NULL (Use alter table) - Verify the constraint using desc
-- book_issues

UPDATE Book_issues
	SET Fine = 0
	WHERE Fine is NULL
	ALTER TABLE Book_issues
	MODIFY Fine DECIMAL(20,5) NOT NULL;




-- (3) Update book_issues table records - for all the books not returned , set fine = 50.

UPDATE Book_issues
	SET Fine = 50
	WHERE Returned_book IS NULL;




-- (4) List the student names and the books they borrowed - with inner join


SELECT Student.Student_Name, Books.Book_Name 
FROM Student  
INNER JOIN Book_issues 
ON Student.StudentID = Book_issues.StudentID 
INNER JOIN Books 
ON Book_issues.BookID = Books.BookID;

-- +--------------+-------------------------+
-- | Student_Name | Book_Name               |
-- +--------------+-------------------------+
-- | Himiksha     | Rich Dad Poor Dad       |
-- | Inshika      | Atomic Habits           |
-- | Ishita       | The Psychology of Money |
-- | Hemachandra  | Sapiens                 |
-- | Anchal       | Deep Work               |
-- | Aisha        | The Power of Habit      |
-- | Harish       | Thinking, Fast and Slow |
-- | Hariharan    | Ikigai                  |
-- | Disha        | Wings of Fire           |
-- | Atharva      | Never Lie               |
-- +--------------+-------------------------+




-- (5) List all the books - and the names of the students who borrowed them ( NULL in case the book
-- has not been borrowed).


SELECT b.Book_Name, s.Student_Name
     FROM Books b
     LEFT JOIN Book_issues bi
     ON b.BookID = bi.BookID
     LEFT JOIN Student s
     ON bi.StudentID = s.StudentID;

    -- +-------------------------+--------------+
    -- | Book_Name               | Student_Name |
    -- +-------------------------+--------------+
    -- | Rich Dad Poor Dad       | Himiksha     |
    -- | Atomic Habits           | Inshika      |
    -- | The Psychology of Money | Ishita       |
    -- | Sapiens                 | Hemachandra  |
    -- | Deep Work               | Anchal       |
    -- | The Power of Habit      | Aisha        |
    -- | Thinking, Fast and Slow | Harish       |
    -- | Ikigai                  | Hariharan    |
    -- | Wings of Fire           | Disha        |
    -- | Never Lie               | Atharva      |
    -- +-------------------------+--------------+




 -- (6) Update the records in book_issues whose books are not returned (Set the fine to 50).

  UPDATE Book_issues 
    SET Fine = Fine + 50 
    WHERE Returned_book = 0;




 -- (7) Update the records in book_issues, increase the fine to 100 for all students in the Math
 -- department

 UPDATE Book_issues 
 INNER JOIN Student  ON Book_issues.StudentID = Student.StudentID 
 SET Book_issues.Fine = 100 
 WHERE Student.Department = "Biotechnology";




 -- (8) List all the student names who have fines and who have not returned the books (highest fine
 -- first). - Use order by

 SELECT Student.Student_Name, Book_issues.Fine 
      FROM Book_issues
      Join Student ON Book_issues.StudentID = Student.StudentID
      WHERE Book_issues.Returned_book = 0
      AND Book_issues.Fine > 0
      ORDER BY Book_issues.Fine DESC;


 -- OUTPUT
 -- <--+--------------+-----------+
 -- | Student_Name | Fine      |
 -- +--------------+-----------+
 -- | Ishita       | 100.00000 |
 -- | Anchal       | 100.00000 |
 -- | Harish       | 100.00000 |
 -- | Atharva      | 100.00000 |
 -- +--------------+-----------+--




 -- (9) Update the fine to 0 for all the students who have returned the books

 UPDATE Book_issues
     -> SET Fine = 0
     -> WHERE Returned_book = 1;


     -- +--------------+--------+-----------+---------------+----------------+---------------+-----------+
     -- | Issue_number | BookID | StudentID | Date_of_issue | Date_of_return | Returned_book | Fine      |
     -- +--------------+--------+-----------+---------------+----------------+---------------+-----------+
     -- |            1 |      1 |       201 | 2026-01-05    | 2026-01-12     |             1 |   0.00000 |
     -- |            2 |      2 |       202 | 2026-01-06    | 2026-01-13     |             1 |   0.00000 |
     -- |            3 |      3 |       203 | 2026-01-07    | 2026-01-14     |             0 | 100.00000 |
     -- |            4 |      4 |       204 | 2026-01-08    | 2026-01-15     |             1 |   0.00000 |
     -- |            5 |      5 |       205 | 2026-01-09    | 2026-01-16     |             0 | 100.00000 |
     -- |            6 |      6 |       206 | 2026-01-10    | 2026-01-17     |             1 |   0.00000 |
     -- |            7 |      7 |       207 | 2026-01-11    | 2026-01-18     |             0 | 100.00000 |
     -- |            8 |      8 |       208 | 2026-01-12    | 2026-01-19     |             1 |   0.00000 |
     -- |            9 |      9 |       209 | 2026-01-13    | 2026-01-20     |             1 |   0.00000 |
     -- |           10 |     10 |       210 | 2026-01-14    | 2026-01-21     |             0 | 100.00000 |
     -- +--------------+--------+-----------+---------------+----------------+---------------+-----------+



 -- (10) List all the students who are in departments Mathematics and Physics (use ‘in’)

 SELECT Student_Name  
 FROM Student 
 WHERE Department IN ("Biotechnology", "Microbiology");


 -- +--------------+
 -- | Student_Name |
 -- +--------------+
 -- | Himiksha     |
 -- | Inshika      |
 -- | Anchal       |
 -- | Aisha        |
 -- | Disha        |
 -- | Atharva      |
 -- +--------------+




 -- -(extra question) List all sstudents name with books name they borrowed of Microbiology and Biotechnology departments

 select Student.Student_Name, Books.Book_Name 
 from Student  
 inner join Book_issues 
 on Student.StudentID = Book_issues.StudentID 
 inner join Books 
 on Books.BookID = Book_issues.BookID 
 where Department in ("Biotechnology", "Microbiology")
 and Book_issues.Fine > 0;

 -- +--------------+-----------+
 -- | Student_Name | Book_Name |
 -- +--------------+-----------+
 -- | Anchal       | Deep Work |
 -- | Atharva      | Never Lie |
 -- +--------------+-----------+


