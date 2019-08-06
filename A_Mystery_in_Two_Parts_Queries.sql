-- CREATING TABLES to run Queries --

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

--  QUERIES  --

--1.  List details of each employee: employee number, last name, first name, gender and salary. 
SELECT employees.emp_no, employees.last_name, 
employees.first_name, employees.gender, salaries.salary 
FROM salaries
INNER JOIN employees ON employees.emp_no = salaries.emp_no;

--2.  List employees who were hired in 1986
SELECT * FROM employees
WHERE hire_date LIKE '%1986'; 

--3.  List the manager of each department with:  department number, department name, 
-- manager's employee number, last name, first name and start and end employment dates. 
SELECT departments.dept_no, departments.dept_name, dept_manager.emp_no, 
employees.last_name, employees.first_name,
dept_manager.from_date, dept_manager.to_date 
FROM departments
	JOIN dept_manager
	ON (departments.dept_no = dept_manager.dept_no)
		JOIN employees
		ON (dept_manager.emp_no = employees.emp_no);
		
--4.  List department of each employee with:  employee number, last name, first name and department name. 
SELECT employees.emp_no, employees.last_name, employees.first_name,
departments.dept_name
FROM employees
	JOIN dept_emp
	ON (employees.emp_no = dept_emp.emp_no)
		JOIN departments
		ON (dept_emp.dept_no = departments.dept_no);

--5.  List all employees whose first name is "Hercules" and last names begin with "B".
SELECT first_name, last_name 
FROM employees
WHERE first_name LIKE 'Hercules' 
AND last_name LIKE 'B%';

--6.  List all employees in the Sales department, including their employee number, 
-- last name, first name, and department name.
SELECT employees.emp_no, employees.last_name, employees.first_name, departments.dept_name
FROM employees
	JOIN dept_emp
	ON (employees.emp_no = dept_emp.emp_no)
		JOIN departments
		ON (dept_emp.dept_no = departments.dept_no)
WHERE dept_name LIKE 'Sales';

--7.  List all employees in the Sales and Development departments including their
-- employee number, last name, first name, and department name. 
SELECT employees.emp_no, employees.last_name, employees.first_name,
departments.dept_name
FROM employees
	JOIN dept_emp
	ON (employees.emp_no = dept_emp.emp_no)
		JOIN departments
		ON (dept_emp.dept_no = departments.dept_no)
WHERE dept_name LIKE 'Sales' 
OR dept_name LIKE 'Development';

--  List frequency count of employee last name (how many employees share each last name) 
-- in descending order. 
SELECT last_name, COUNT (*) AS frequency
FROM employees
GROUP BY last_name
ORDER by frequency DESC;
