-- INNER JOIN

-- An INNER JOIN returns only the rows where there is a matching value in both tables. 
-- Rows without a match are excluded from the result.

-- When to Use INNER JOIN :

-- 1. Fetch related data from two tables. Like here gene_id is in both Gene as well as Protein table 
-- so we joined both table using gene_id and fetch gene_name related to the protein_name

-- 2.


-- Display gene name and protein name for genes that encode proteins.

select g.gene_name, p.protein_name
    from Gene g
    inner join Protein p
    on g.gene_id = p.gene_id ;
    
-- +-----------+---------------+
-- | gene_name | protein_name  |
-- +-----------+---------------+
-- | TP53      | p53 protein   |
-- | BRCA1     | BRCA1 protein |
-- +-----------+---------------+

-- Display gene_name, protein_name, and organism.

select g.gene_name, p.protein_name, g.organism  
from Gene g  
inner join Protein p  
on g.gene_id = p.gene_id;

-- Display:
-- gene_name
-- protein_name
-- tissue
-- expression_level

select g.gene_name, p.protein_name, e.tissue, e.expression_level from Gene g
    inner join Protein p
    on g.gene_id = p.gene_id
    inner join ExpressionData e
    on g.gene_id = e.gene_id ;


-- LEFT JOIN 

-- Display all genes and their proteins, including genes with no protein recorded.

-- here we want to show all rows from one table which is Gene but Gene table has 3 entrie but
-- Protein table has 2 so one entry would be null

select g.gene_name, p.protein_name 
from Gene g 
left join Protein p 
on g.gene_id = p.gene_id;

-- +-----------+---------------+
-- | gene_name | protein_name  |
-- +-----------+---------------+
-- | TP53      | p53 protein   |
-- | BRCA1     | BRCA1 protein |
-- | lacZ      | NULL          |
-- +-----------+---------------+

-- Find genes that appear in ExpressionData but do not have proteins.

SELECT DISTINCT g.gene_name
FROM Gene g
JOIN ExpressionData e ON g.gene_id = e.gene_id
LEFT JOIN Protein p ON g.gene_id = p.gene_id
WHERE p.gene_id IS NULL;

-- Find genes that appear in ExpressionData but do NOT have proteins.
-- That means:
-- Gene must exist in ExpressionData
-- Gene must NOT exist in Protein
-- For this we have to join Gene table and ExpressionData table with normal inner/join
-- then gene must not exist in Protien so all the columns of Protein table should be intact and 
-- Gene table should show Null so left join Protein with Gene Table


-- EXTRA

-- Find genes whose expression level is greater than 7.

select g.gene_name, e.expression_level 
from Gene g 
inner join ExpressionData e
on g.gene_id = e.gene_id
where expression_level > 7 ;


