UPDATE Book_issues 
INNER JOIN Student  ON Book_issues.StudentID = Student.StudentID 
SET Book_issues.Fine = 100 
WHERE Student.Department = "Biotechnology";