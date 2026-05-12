CREATE DATABASE lab16;
USE lab16;

-- CREATE TABLES

CREATE TABLE STUDENT (
    student_id INT PRIMARY KEY,
    name VARCHAR(100),
    marks INT,
    department VARCHAR(100)
);

CREATE TABLE EMPLOYEE (
    emp_id INT PRIMARY KEY,
    name VARCHAR(100),
    salary DECIMAL(10,2),
    department VARCHAR(100)
);

CREATE TABLE ACCOUNT (
    acc_no INT PRIMARY KEY,
    holder_name VARCHAR(100),
    balance DECIMAL(10,2)
);

-- INSERT 5 RECORDS INTO TABLES

-- STUDENT TABLE
INSERT INTO STUDENT VALUES
(1,'Himiksha',78,'Physics'),
(2,'Inshika',35,'Chemistry'),
(3,'Ishita',60,'Physics'),
(4,'Anchal',90,'Math'),
(5,'Aisha',25,'Biology');

-- EMPLOYEE
INSERT INTO EMPLOYEE VALUES
(101,'Hemachandra',50000,'HR'),
(102,'Shreyas',45000,'IT'),
(103,'Aheli',60000,'IT'),
(104,'Anshu',55000,'Finance'),
(105,'Atharva',40000,'HR');

-- ACCOUNT
INSERT INTO ACCOUNT VALUES
(1001,'Himiksha',10000),
(1002,'Inshika',15000),
(1003,'Ishita',20000),
(1004,'Anchal',25000),
(1005,'Aisha',30000);


-- 1.) Create a stored procedure to insert a new student record - call the procedure and insert 5 students

DELIMITER //

CREATE PROCEDURE insert_student(
    IN s_id INT,
    IN s_name VARCHAR(100),
    IN s_marks INT,
    IN s_department VARCHAR(100)
)
BEGIN
    INSERT INTO STUDENT
    VALUES(s_id,s_name,s_marks,s_department);
END //

DELIMITER ;

-- CALL 
CALL insert_student(6,'Neha',88,'Physics');
CALL insert_student(7,'Rohan',45,'Math');
CALL insert_student(8,'Divya',67,'Chemistry');
CALL insert_student(9,'Manoj',39,'Biology');
CALL insert_student(10,'Priya',75,'Physics');


-- 2. Write a procedure that increases the salary of all employees in a department by 10%. Input should be department

DELIMITER //

CREATE PROCEDURE increase_salary(
    IN dept_name VARCHAR(100)
)
BEGIN
    UPDATE EMPLOYEE
    SET salary = salary + (salary * 0.10)
    WHERE department = dept_name;
END //

DELIMITER ;

CALL increase_salary('IT');

SELECT * FROM EMPLOYEE;


-- 3. A. Create a function for getting the marks as input and returning PASS if the marks greater than or equal to 40, else return FAIL
-- B. Take the function as input and print PASS or FAIL for all students in the student table in ex 1.

-- 3A
DELIMITER //

CREATE FUNCTION result_status(m INT)
RETURNS VARCHAR(10)
DETERMINISTIC
BEGIN
    DECLARE res VARCHAR(10);

    IF m >= 40 THEN
        SET res = 'PASS';
    ELSE
        SET res = 'FAIL';
    END IF;

    RETURN res;
END //

DELIMITER ;

-- 3B
SELECT student_id,
       name,
       marks,
       result_status(marks) AS Result
FROM STUDENT;


-- 4. Create a unique function called ceil_random() that returns a random number between 1 to 100 (as the ceil of the random number - hence it has to be a whole number)

DELIMITER //

CREATE FUNCTION ceil_random()
RETURNS INT
DETERMINISTIC
BEGIN
    RETURN CEIL(RAND() * 100);
END //

DELIMITER ;

SELECT ceil_random();


-- 5. Create a trigger to convert the employee name to upper case before inserting the record

DELIMITER //

CREATE TRIGGER uppercase_employee_name
BEFORE INSERT ON EMPLOYEE
FOR EACH ROW
BEGIN
    SET NEW.name = UPPER(NEW.name);
END //

DELIMITER ;

-- TEST CASE 
INSERT INTO EMPLOYEE VALUES
(106,'rahul kumar',50000,'Sales');

SELECT * FROM EMPLOYEE;


-- 6. Create a trigger to add 2 marks to all the students in the Physics department - before inserting a new record into the student table

DELIMITER //

CREATE TRIGGER physics_bonus_marks
BEFORE INSERT ON STUDENT
FOR EACH ROW
BEGIN
    IF NEW.department = 'Physics' THEN
        SET NEW.marks = NEW.marks + 2;
    END IF;
END //

DELIMITER ;

-- TEST CASE
INSERT INTO STUDENT VALUES
(11,'Sonia',70,'Physics');

SELECT * FROM STUDENT;


-- 7. Logging updates :
-- a. Create an employee_log table (emp_id, log) .
-- b. Every time a salary update happens on the employee table, enter an entry into the employee_log table as “Salary changed from “$old salary” to “$new salary” .
-- c. Update the employee table (with and without salary) and observe the employee_log table.

-- 7A
CREATE TABLE employee_log (
    emp_id INT,
    log_message VARCHAR(255)
);

-- 7B
DELIMITER //

CREATE TRIGGER salary_update_log
AFTER UPDATE ON EMPLOYEE
FOR EACH ROW
BEGIN
    IF OLD.salary <> NEW.salary THEN
        INSERT INTO employee_log
        VALUES(
            NEW.emp_id,
            CONCAT('Salary changed from ', OLD.salary,
                   ' to ', NEW.salary)
        );
    END IF;
END //

DELIMITER ;

-- 7C
UPDATE EMPLOYEE
SET salary = 70000
WHERE emp_id = 101;

UPDATE EMPLOYEE
SET department = 'Admin'
WHERE emp_id = 102;

SELECT * FROM employee_log;


-- 8. Transactions:
-- a. Update the account of 1 user to increase the balance by 1000 and another user to decrease the balance by 1000. Observe the entries
-- b. Repeat the same updates, this time with a START TRANSACTION command - rollback and observe the values
-- c. Repeat the same updates , commit and observe the values


-- 8A
UPDATE ACCOUNT
SET balance = balance + 1000
WHERE acc_no = 1001;

UPDATE ACCOUNT
SET balance = balance - 1000
WHERE acc_no = 1002;


SELECT * FROM ACCOUNT;


-- 8B
START TRANSACTION;

UPDATE ACCOUNT
SET balance = balance + 1000
WHERE acc_no = 1003;

UPDATE ACCOUNT
SET balance = balance - 1000
WHERE acc_no = 1004;

ROLLBACK;


SELECT * FROM ACCOUNT;


-- 8C
START TRANSACTION;

UPDATE ACCOUNT
SET balance = balance + 1000
WHERE acc_no = 1003;

UPDATE ACCOUNT
SET balance = balance - 1000
WHERE acc_no = 1004;

COMMIT;


SELECT * FROM ACCOUNT;


-- 9. Show the procedures in the current database

SHOW PROCEDURE STATUS WHERE Db = DATABASE();
SHOW FUNCTION STATUS WHERE Db = DATABASE();


-- 10. Drop selected procedures and functions and observe the status

DROP PROCEDURE insert_student;
DROP PROCEDURE increase_salary;

DROP FUNCTION result_status;
DROP FUNCTION ceil_random;

SHOW PROCEDURE STATUS WHERE Db = DATABASE();
SHOW FUNCTION STATUS WHERE Db = DATABASE();