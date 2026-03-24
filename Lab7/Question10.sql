-- List all the students who are in departments Mathematics and Physics (use ‘in’)

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
