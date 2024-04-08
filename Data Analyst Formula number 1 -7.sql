--Number 1 list of emploee with salaries

SELECT e.emp_no, e.last_name, e.first_name, e.sex, s.salary
FROM employee e
LEFT  JOIN salaries s on s.emp_no = e.emp_no;

--Number 2 hired 1986

--select count(*) from public.employee

--formula to give the sequence of date 
--select date_part('year', hire_date) from employee;

-- select first_name, last_name, hire_date 
-- from employee 
-- where date_part('year', hire_date)  = '1986'

SELECT e.last_name, e.first_name, e.hire_date
FROM employee e
WHERE date_part('year',hire_date) = '1986';


--Number 3 List of Manager

-- SELECT		dm.dept_no, 
-- 			d.dept_name,
-- 			dm.emp_no,
-- 			e.last_name,
-- 			e.first_name
-- from		dept_manager dm 
-- inner join	departments d on dm.dept_no = d.dept_no
-- inner join	employee e on dm.emp_no = e.emp_no

SELECT dm.dept_no,d.dept_name,dm.emp_no,e.Last_name,e.first_name
FROM dept_manager dm
LEFT JOIN departments d ON d.dept_no=dm.dept_no
LEFT JOIN employee e ON dm.emp_no = e.emp_no

--Number 4 depart number with employee and dept name

-- SELECT dm.dept_no,dm.emp_no,e.last_name,e.first_name,d.dept_name
-- FROM dept_manager dm
-- LEFT JOIN employee e ON e.emp_no=dm.emp_no
-- LEFT JOIN departments d ON d.dept_no=dm.dept_no;

SELECT dm.dept_no,dm.emp_no,e.last_name,e.first_name,d.dept_name
FROM dept_manager dm
INNER JOIN employee e ON e.emp_no=dm.emp_no
INNER JOIN departments d ON d.dept_no=dm.dept_no;

--Number 5 Hercules with lastname B

-- SELECT e.last_name,e.sex,e.first_name
SELECT e.first_name,e.last_name,e.sex
FROM employee e
WHERE e.first_name = 'Hercules'AND e.last_name LIKE 'B%'

--Number 6 employee in sales

SELECT e.emp_no,e.last_name,e.first_name
FROM dept_emp de
INNER JOIN employee e ON e.emp_no=de.emp_no
INNER JOIN departments d ON d.dept_no=de.dept_no
WHERE d.dept_name = 'Sales'; 

--Number 7 sales and development

SELECT e.emp_no,e.last_name,e.first_name,d.dept_name
FROM dept_emp de
INNER JOIN employee e ON e.emp_no=de.emp_no
INNER JOIN departments d ON d.dept_no=de.dept_no
WHERE d.dept_name in ('Sales','Development');

--Number 8 Frequency last name

SELECT e.last_name,
--COUNT(*) AS frequency
COUNT(last_name) AS Frequency
FROM employee e
GROUP BY last_name
ORDER by e.last_name DESC;


