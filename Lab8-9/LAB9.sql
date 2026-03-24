-- Lab 9

-- Check the number of records in gene and transcripts tables

select count(*) from transcript;

-- Output
-- +----------+
-- | count(*) |
-- +----------+
-- |   279860 |
-- +----------+


select count(*) from gene;


-- Output
-- +----------+
-- | count(*) |
-- +----------+
-- |    71935 |
-- +----------+


-- 4. Check the number of transcripts per each gene - list the first 10 genes

select gene_id, count(*) as count_transcript from transcript  group
by gene_id limit 10;

-- 5. How many unique bio types are present in the gene table, 
-- transcript table?

select count(distinct biotype) as unique_biotypes
    from gene;

-- Output
-- +-----------------+
-- | unique_biotypes |
-- +-----------------+
-- |              40 |
-- +-----------------+

select count(distinct biotype) as unique_transcript
    from transcript;

-- Output
-- +-------------------+
-- | unique_transcript |
-- +-------------------+
-- |                46 |
-- +-------------------+

-- 6. List all the biotypes and the no. of genes in each biotype in the gene table

select biotype, count(*) as gene_count 
    from gene
    group by biotype
    order by gene_count;


-- 7. How many genes are present per chromosome?

select sr.name as chromosome,
    count(g.gene_id) as gene_count
    from gene g
    join seq_region sr on g.seq_region_id = sr.seq_region_id
    group by sr.name
    order by gene_count;


-- ############################################################


create database Cafeteria;

	use Cafeteria;

	create table student_food_subscription (
	    Student_id INT PRIMARY KEY,
	    food_subscribed BOOLEAN NOT NULL);

	create table Student (
	    -> Student_id INT PRIMARY KEY,
	    -> Student_name VARCHAR(50) );


insert into student_food_subscription values (1, TRUE),
(2, FALSE),
(3, TRUE),
(4, TRUE),
(5, FALSE);


insert into Student values 
(1, "Himiksha"), 
(2, "Inshika"), 
(3, "Anchal"), 
(4, "Ishita"), 
(5, "Aisha");

create view student_library_cafetaria as
    select s.Student_name, f.food_subscribed
    from Student s
    join student_food_subscription f
    on s.Student_id = f.Student_id;


    select * from student_library_cafetaria ;


--  +--------------+-----------------+
--  | Student_name | food_subscribed |
--  +--------------+-----------------+
--  | Himiksha     |               1 |
--  | Inshika      |               0 |
--  | Anchal       |               1 |
--  | Ishita       |               1 |
--  | Aisha        |               0 |
--  +--------------+-----------------+
