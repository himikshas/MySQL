-- Creating gene table

create table Gene (
    -> gene_id INT PRIMARY KEY,
    -> gene_name VARCHAR(50) NOT NULL,
    -> organism VARCHAR(50),
    -> chromosome VARCHAR(10)
    -> );

-- Describing table
desc Gene; 


-- Creating table Protein 
create table Protein ( 
	protein_id INT PRIMARY KEY, 
	protein_name VARCHAR(50), 
	gene_id INT NOT NULL, 
	protein_function VARCHAR(100), 
	FOREIGN KEY (gene_id) REFERENCES Gene(gene_id) 
	);

-- Foreign key reference is a constraint so should be at last after making every entry and first make entry the do foreign key like here I made gene_id first then 
-- linked means made it foreign key 

-- the nake of the foreign key should be circular brackets otherwise syntax error '( )'

-- do not name any column as a in built keyword like function otherwise error


-- Created expression table 

create table ExpressionData ( 
	exp_id INT PRIMARY KEY, 
	gene_id INT NOT NULL, 
	tissue VARCHAR(50), 
	expression_level FLOAT, 
	FOREIGN KEY (gene_id) REFERENCES Gene(gene_id) 
	);



-- Datatypes

-- VARCHAR(n) => for variable length characters
-- CHAR(n) => for fixed length
-- TEXT => large texts
-- INT => integer value
-- DATE, TIME, DATETIME => according to the name
-- BOOLEAN => TRUE/FALSE
-- FLOAT/ DECIMAL => measurements
-- BINARY => fixed binary 
-- TINYINT => very small integer values


-- insert into tables entries

insert into Gene (gene_id, gene_name, organism) values 
(1, "TP53", "Human"), 
(2, "BRCA1", "Human"), 
(3, "lacZ", "E.coli");

-- " " text data should bein double quotes 

-- inserting entries into Protein table

insert into Protein (protein_id, protein_name, gene_id) values
    (101, "p53 protein", 1),
    (102, "BRCA1 protein", 2) ;


-- Verifying table records :
    select * from Gene ;
    select * from Protein ;

-- Protein table
-- +------------+---------------+---------+------------------+
-- | protein_id | protein_name  | gene_id | protein_function |
-- +------------+---------------+---------+------------------+
-- |        101 | p53 protein   |       1 | NULL             |
-- |        102 | BRCA1 protein |       2 | NULL             |
-- +------------+---------------+---------+------------------+

-- Gene table
-- +---------+-----------+----------+------------+
-- | gene_id | gene_name | organism | chromosome |
-- +---------+-----------+----------+------------+
-- |       1 | TP53      | Human    | NULL       |
-- |       2 | BRCA1     | Human    | NULL       |
-- |       3 | lacZ      | E.coli   | NULL       |
-- +---------+-----------+----------+------------+


-- Find genes that have expression data but do NOT belong to E.coli.

select g.gene_name, e.expression_level 
from Gene g 
join ExpressionData e 
on g.gene_id = e.gene_id 
where g.gene_name != "E.coli";




     


