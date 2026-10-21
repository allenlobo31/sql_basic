--SELECT

-- used to retrieve data from a database. 
-- It allows you to specify the columns you want to retrieve and the table from which to retrieve them. 
-- You can also use various clauses such as WHERE, ORDER BY, and GROUP BY to filter and sort the results.

CREATE TABLE students (
    student_id SERIAL PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    enrollment_date DATE NOT NULL
);

INSERT INTO students (first_name, last_name, email, enrollment_date) VALUES
('John', 'Doe', 'john.doe@example.com', '2023-01-01');

--select all columns from the students table
select * from students;

--select first and last name columns from the students table
select first_name, last_name from students;


INSERT INTO students (first_name, last_name, email, enrollment_date) VALUES
('Alice', 'Smith', 'jane.smith@example.com', '2023-01-02'),
('Alice', 'Johnson', 'alice.johnson@example.com', '2023-01-03'),
('alice', 'Brown', 'bob.brown@example.com', '2023-01-04'),
('Charlie', 'Davis', 'charlie.davis@example.com', '2023-01-05');

--note
--to select distint or unique values from a column, you can use the DISTINCT keyword in your SELECT statement.
--For example, to select distinct first names from the students table, you can use the following
select distinct first_name from students;


--Where clause
--The WHERE clause is used to filter records based on specified conditions.
--For example, to select all students with the first name 'Alice', you can use the

SELECT * FROM students
WHERE first_name = 'Alice';


--example of using the WHERE clause with a comparison operator
CREATE TABLE NUMBERS (
    number_id SERIAL PRIMARY KEY,
    number_value INT NOT NULL
);

INSERT INTO NUMBERS (number_value) VALUES
(1), (2), (3), (4), (5), (6), (7), (8), (9), (10);


SELECT * FROM NUMBERS
WHERE number_value%2 = 0 AND number_id%3 = 0; 

--NOT keyword
--The NOT keyword is used to negate a condition in the WHERE clause.
--For example, to select all students whose first name is not 'Alice', you can use

SELECT * FROM students
WHERE NOT first_name = 'Alice';

SELECT * FROM numbers
WHERE NOT (number_value%2 = 0 AND number_id%3 = 0); --get all the number except 6


--IN keyword [looping through a list of values]
--The IN keyword is used to specify multiple values in a WHERE clause.
--For example, to select all students whose first name is either 'Alice' or 'Bob', you can use      

SELECT * FROM students
WHERE first_name IN ('Alice', 'alice');

--Like keyword
--The LIKE keyword is used in a WHERE clause to search for a specified pattern in a column
--For example, to select all students whose first name starts with 'A', you can use

SELECT * FROM students
WHERE first_name LIKE 'A%';

SELECT * FROM students
WHERE first_name LIKE '%e'; --get all the names that end with e

SELECT * FROM students
WHERE email LIKE '%@example.com'; --get all the names that contain i

--Get NULL values
--The IS NULL operator is used to test for empty values (NULL values) in a column
--For example,
CREATE TABLE test(
    id SERIAL PRIMARY KEY,
    name VARCHAR(50),
    age INT
);

INSERT INTO test (name, age) VALUES
('John', 25),
('Alice', NULL),
('Bob', 30),
('Charlie', NULL);

SELECT * FROM test
WHERE age IS NULL; --get all the names that have null values

--COALESCE function
--The COALESCE function is used to return the first non-null value from a list of expressions. 
--For example, to select the first non-null value from the age column in the test table, you can use    

SELECT COALESCE(age, '0') AS age 
FROM test; --get all the names that have null values and replace them with 0

--ALIAS
--An alias is a temporary name given to a table or column for the purpose of a specific query. 
--It is often used to make column names more readable or to simplify complex queries.
--For example, to give an alias to the age column in the test table, you can use

SELECT name AS student_name, age AS student_age FROM test;


--ORDER BY clause
--AScending and Descending order
--The ORDER BY clause is used to sort the result set in either ascending or descending order.
--By default, the ORDER BY clause sorts the result set in ascending order.
--For example, to sort the students table by first name in ascending order, you can use

SELECT * FROM students
ORDER BY first_name ASC;

--To sort the students table by first name in descending order, you can use

SELECT * FROM students
ORDER BY first_name DESC;


--for sorting more than one column at a time, you can specify multiple columns in the ORDER BY clause.
--For example, to sort the students table by first name in ascending order and then by last

SELECT * FROM students
ORDER BY first_name ASC, last_name DESC; --using first name dorting takes place then by lastname sorting takes place


--LIMIT clause
--The LIMIT clause is used to specify the maximum number of records to return in the result set
--For example, to retrieve the first 3 records from the students table, you can use

SELECT * FROM students  
LIMIT 3;


--OFFSET clause
--The OFFSET clause is used to skip a specified number of records before starting to return records from the result set. 
--For example, to skip the first 2 records and retrieve the next 3 records from the students table, you can use

SELECT * FROM students
LIMIT 3
OFFSET 2; --skip the first 2 records and retrieve the next
