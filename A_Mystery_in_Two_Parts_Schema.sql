-- CREATING TABLES to import into dbdiagram.io for ERD file --

CREATE TABLE employees (
	emp_no INT PRIMARY KEY,
	birth_date VARCHAR,
	first_name VARCHAR(20),
	last_name VARCHAR(30),
	gender VARCHAR,
	hire_date VARCHAR(30)
	);

SELECT * FROM employees; 

--************************--

CREATE TABLE dept_manager (
	dept_no VARCHAR,
	emp_no INT,
	from_date VARCHAR(30),
	to_date VARCHAR(30)
	);

SELECT * FROM dept_manager;

--************************--

CREATE TABLE dept_emp (
	emp_no INT,
	dept_no VARCHAR, 
	from_date VARCHAR(30),
	to_date VARCHAR(30)
	);

SELECT * FROM dept_emp;

--************************--

CREATE TABLE titles (
	emp_no INT,
	title VARCHAR(30),
	from_date VARCHAR(30),
	to_date VARCHAR(30)
	);
	
SELECT * FROM titles; 

--************************--

CREATE TABLE salaries (
	emp_no INT,
	salary INT,
	from_date VARCHAR(30),
	to_date VARCHAR(30)
	);

SELECT * FROM salaries;

--************************--

CREATE TABLE departments (
	dept_no VARCHAR PRIMARY KEY,
	dept_name VARCHAR);
	
SELECT * FROM departments;