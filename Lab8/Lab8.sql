-- Lab 8

-- Question2 Create tables for this ER diagram. Insert 5 entries (eg. TP53 gene - encodes for p53alpha,
-- p53beta, p53gamma proteins ) . (both create, insert queries are needed).


-- create database Gene
create database Gene;

	show databases;


use Gene;

-- created new table Gene
create table Gene (
    Gene_id INT PRIMARY KEY,
    Gene_name VARCHAR(50) NOT NULL,
    chr VARCHAR(20) NOT NULL,
    start_pos INT NOT NULL,
    end_pos INT NOT NULL
    );

-- created new table protein
CREATE TABLE Protein (
    Protein_id   INT         PRIMARY KEY,
    Protein_name VARCHAR(50) NOT NULL,
    Gene_id      INT         NOT NULL,
    FOREIGN KEY (Gene_id) REFERENCES Gene(Gene_id)
    );

-- inserted entries into Gene table
insert into Gene (Gene_id, Gene_name, chr, start_pos, end_pos)values (1, "TP53", "chr 17", 7668402, 7687490), (2, "BRCA1", "chr 17", 43044294,
43125482), (3, "EGFR", "chr 7", 55019017, 55211628), (4, "APOE", "chr 19",
44905792, 44909393), (5, "HBB", "chr 11", 5246695, 5248300);

-- verify Gene Table
select * from Gene;

-- insert entries into Protein
insert into Protein (Protein_id, Protein_name, Gene_id)values (101,
"p53alpha", 1),  (102, "p53beta", 1), (103, "p53gamma", 1), (104, "BRCA1-isoform1", 2), (105, "BRCA1-isoform2", 2), (106, "EGFR-isoform1", 3), (107, "EGFR-isoform2", 3), (108, "Apoe2", 4), (109, "Apoe3", 4), (110, "Apoe4", 4)
, (111, "HBB(beta-globin)", 5),  (112, "HBD(delta-globin)", 5);

-- verify Protein table
select * from Protein;

-- The Encode relationship has a 1-to-many (1:N) cardinality and one gene encodes many proteins, but each protein is encoded by exactly one gene.
-- Foreign key is placed in Protein table that is enough to show relatioship between two tables withut needing and extra table


-- Question 3 Is a relationship table needed? Why or why not? Create the tables with 5 entries . (both create, insert queries are required)

-- create database University
create database University;

	use University;

-- Student table created 
CREATE TABLE Student (
    Student_id  INT          PRIMARY KEY,
    Programme   ENUM('MSc', 'PhD') NOT NULL,
    DOB         DATE         NOT NULL,
    City        VARCHAR(50)  NOT NULL
    );

-- Course table created
CREATE TABLE Course (
    Course_ID          INT          PRIMARY KEY,
    Course_name        VARCHAR(100) NOT NULL,
    Course_coordinator VARCHAR(100) NOT NULL
    );

-- Students table entries
INSERT INTO Student VALUES (1, 'MSc', '2000-04-12', 'Bangalore');
INSERT INTO Student VALUES (2, 'PhD', '1998-07-23', 'Mumbai');
INSERT INTO Student VALUES (3, 'MSc', '2001-01-05', 'Delhi');
INSERT INTO Student VALUES (4, 'PhD', '1999-08-15', 'Chennai');
INSERT INTO Student VALUES (5, 'MSc', '2002-03-22', 'Hyderabad');

-- Courses table entries
INSERT INTO Course VALUES (101, 'Bioinformatics',   'Dr. Vijayalakshmi');
INSERT INTO Course VALUES (102, 'Genomics',         'Dr. Bibha');
INSERT INTO Course VALUES (103, 'Machine Learning', 'Dr. Shyam');
INSERT INTO Course VALUES (104, 'Biostatistics',    'Dr. R Srivatsan');
INSERT INTO Course VALUES (105, 'DBMS',             'Dr. Nithya');

-- Enrollments table entries
INSERT INTO Enroll VALUES (1, 101);
INSERT INTO Enroll VALUES (2, 102);
INSERT INTO Enroll VALUES (3, 103);
INSERT INTO Enroll VALUES (4, 104);
INSERT INTO Enroll VALUES (5, 105);


-- Question 4 Consider the following table in unnormalized form. Normalize this table and create the
-- autoincrement for order.


-- Created and use a new database
CREATE DATABASE NormalizedOrdersDB;
USE NormalizedOrdersDB;

-- Orders table
CREATE TABLE Orders (
    Order_ID INT AUTO_INCREMENT PRIMARY KEY,
    Customer_Name VARCHAR(100) NOT NULL
);

-- Products table
CREATE TABLE Products (
    Product_ID INT AUTO_INCREMENT PRIMARY KEY,
    Product_Name VARCHAR(100) NOT NULL
);

-- Created Order_Items table
CREATE TABLE Order_Items (
    OrderItem_ID INT AUTO_INCREMENT PRIMARY KEY,
    Order_ID INT NOT NULL,
    Product_ID INT NOT NULL,
    Quantity INT NOT NULL,
    FOREIGN KEY (Order_ID) REFERENCES Orders(Order_ID),
    FOREIGN KEY (Product_ID) REFERENCES Products(Product_ID)
);

-- Insert data into Orders
INSERT INTO Orders (Customer_Name) VALUES
('Kiran'),
('Meena');


-- Insert data into Products
INSERT INTO Products (Product_Name) VALUES
('Pen'),
('Pencil'),
('Eraser'),
('Notebook');

-- Insert data into Order_Items
INSERT INTO Order_Items (Order_ID, Product_ID, Quantity) VALUES
(1, 1, 2),
(1, 2, 3),
(1, 3, 1),
(2, 4, 5),
(2, 1, 1);

-- verify tables
SELECT * FROM Orders;
SELECT * FROM Products;
SELECT * FROM Order_Items;

-- Full join 
SELECT 
    o.Order_ID,
    o.Customer_Name,
    p.Product_Name,
    oi.Quantity
FROM Order_Items oi
JOIN Orders o ON oi.Order_ID = o.Order_ID
JOIN Products p ON oi.Product_ID = p.Product_ID
ORDER BY o.Order_ID, oi.OrderItem_ID;