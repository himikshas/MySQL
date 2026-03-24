-- Update the records in book_issues, increase the fine to 100 for all students in the Math
-- department

UPDATE Book_issues 
INNER JOIN Student  ON Book_issues.StudentID = Student.StudentID 
SET Book_issues.Fine = 100 
WHERE Student.Department = "Biotechnology";