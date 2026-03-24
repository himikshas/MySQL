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