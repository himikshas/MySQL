-- List all the student names who have fines and who have not returned the books (highest fine
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