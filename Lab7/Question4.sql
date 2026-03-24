-- List the student names and the books they borrowed - with inner join



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
