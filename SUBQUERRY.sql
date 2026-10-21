--subquerry
--A subquery (also called an inner query or nested query) is simply a query inside another query.



CREATE TABLE employees (
    emp_id INT,
    emp_name VARCHAR(50),
    department VARCHAR(50),
    salary INT
);

INSERT INTO employees (emp_id, emp_name, department, salary) VALUES 
(1, 'Alice', 'Engineering', 85000),
(2, 'Bob', 'Marketing', 50000),
(3, 'Charlie', 'Engineering', 90000),
(4, 'Diana', 'HR', 60000),
(5, 'Ethan', 'Marketing', 55000),
(6, 'Fiona', 'HR', 65000),
(7, 'George', 'Engineering', 95000);


--Write a SQL query to find the names and salaries of all employees who earn more than the average salary of the entire company.
SELECT employees.emp_name, employees.salary
FROM employees
WHERE employees.salary > (SELECT AVG(employees.salary) FROM employees);

