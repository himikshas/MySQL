-- 1) Display unique organisms in the GENE table.

select distinct g.organism from Gene g ;

-- +----------+
-- | organism |
-- +----------+
-- | Human    |
-- | E.coli   |
-- +----------+

-- 2) Find the number of genes present in each organism.

select count(*) from Gene g
    group by organism ;

-- +----------+
-- | count(*) |
-- +----------+
-- |        2 |
-- |        1 |
-- +----------+

-- 3) Display genes belonging to Human organism.

select g.gene_name from Gene g where organism = "Human" ;

-- 4) Display gene_name and chromosome for all genes.

select gene_name, chromosome from Gene ;

-- 5) Display distinct organisms present in the Gene table.

select distinct organism from Gene ;

-- 6) Display genes located on chromosome 7 or 8.

select gene_name from Gene where chromosome = "7" OR chromosome = "8" ;

-- here if u do chromosome = "7" OR "8" then show all gene_name should give full condition

-- 7) Find genes expressed in Brain tissue.

select expression_level from ExpressionData where tissue = "Brain";


