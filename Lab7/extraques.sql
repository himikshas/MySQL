-- List all sstudents name with books name they borrowed of Microbiology and Biotechnology departments

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


