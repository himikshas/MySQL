-- Update the records in book_issues whose books are not returned (Set the fine to 50).

UPDATE Book_issues 
SET Fine = Fine + 50 
WHERE Returned_book = 0;

