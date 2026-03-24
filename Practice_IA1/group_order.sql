-- GROUP BY

-- 1) Find number of genes per organism.
-- Expected Output:
-- | organism | gene_count |


select organism, count(*) as gene_count
from Gene
group by organism ;


-- +----------+------------+
-- | organism | gene_count |
-- +----------+------------+
-- | Human    |          4 |
-- | E.coli   |          1 |
-- +----------+------------+


-- 2) Find average expression level per tissue.

select tissue, avg(expression_level) as average_expression 
from ExpressionData  
group by tissue;

-- +--------+--------------------+
-- | tissue | average_expression |
-- +--------+--------------------+
-- | Brain  |  7.599999904632568 |
-- | Liver  |  5.300000190734863 |
-- | Breast |  9.100000381469727 |
-- | Lung   |                6.5 |
-- +--------+--------------------+

-- Find maximum expression level for each gene.

select gene_id, max(expression_level) as max_expression
    from ExpressionData
    group by gene_id ;


-- SUBQUERY

-- Find the gene that has the highest expression level.

SELECT g.gene_name, e.expression_level
FROM Gene g
JOIN ExpressionData e ON g.gene_id = e.gene_id
WHERE e.expression_level = (
    SELECT MAX(expression_level)
    FROM ExpressionData
);

-- This is wrong because WHERE clause syntax is wrong it needs a condition
-- something like WHERE column_name = value/condition and dont use AS here


-- Find genes whose expression level is higher than the average expression level.

select g.gene_name, e.expression_level 
    from Gene g
    join ExpressionData e
    on g.gene_id = e.gene_id
    where e.expression_level > (select avg(expression_level) 
    	from ExpressionData) ;







