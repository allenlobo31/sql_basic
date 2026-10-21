-- Create the table
CREATE TABLE employees (
    emp_id INT,
    emp_name VARCHAR(50),
    department VARCHAR(50),
    salary INT
);

-- Insert sample data
INSERT INTO employees (emp_id, emp_name, department, salary) VALUES 
(1, 'Alice', 'Engineering', 85000),
(2, 'Bob', 'Marketing', 50000),
(3, 'Charlie', 'Engineering', 90000),
(4, 'Diana', 'HR', 60000),
(5, 'Ethan', 'Marketing', 55000),
(6, 'Fiona', 'HR', 65000),
(7, 'George', 'Engineering', 95000);

SELECT * FROM employees;

SELECT e.department, SUM(e.salary) AS total_salary
FROM employees as e
GROUP BY e.department;

SELECT e.department, COUNT(e.department) AS total_employees
FROM employees as e
GROUP BY e.department;

SELECT e.department, SUM(e.salary) AS total_salary
FROM employees as e
GROUP BY e.department
HAVING SUM(e.salary) > 110000;

SELECT e.department, SUM(e.salary) AS total_salary
FROM employees as e
WHERE e.salary > 55000
GROUP BY e.department
HAVING SUM(e.salary) > 100000;
