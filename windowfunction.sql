-- SQL window functions
--A Window Function, on the other hand, performs a calculation across a set of rows (a "window") without collapsing them.
--Every single original row stays right where it is, 
--but it gets a brand-new calculated column next to it (like a rank, a running total, or the average of its group).


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

SELECT emp_id, emp_name, department, salary,
        RANK() OVER (PARTITION BY department ORDER BY salary DESC) AS rank_employees
FROM employees;

