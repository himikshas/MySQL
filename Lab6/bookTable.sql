-- Create Database 
CREATE DATABASE library;
    SHOW DATABASES;
    USE library;


    CREATE TABLE Books (
        BookID INT PRIMARY KEY NOT NULL,
        Book_Name VARCHAR(100) NOT NULL,
        Publisher VARCHAR(100) NOT NULL,
        Year INT NOT NULL,
        ISBN INT
    );

    Desc Books;

    ALTER TABLE Books DROP COLUMN ISBN;

   Desc Books;

