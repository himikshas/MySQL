-- List all the books - and the names of the students who borrowed them ( NULL in case the book
-- has not been borrowed).


SELECT b.Book_Name, s.Student_Name
    -> FROM Books b
    -> LEFT JOIN Book_issues bi
    -> ON b.BookID = bi.BookID
    -> LEFT JOIN Student s
    -> ON bi.StudentID = s.StudentID;


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