
select * from titles;
-- Staff --> 결과집합으로 Staff 직원에 이력을 결과 집합으로 만들기 
SELECT *
FROM employees AS e 
INNER JOIN titles AS t
ON e.emp_no = t.emp_no
WHERE t.title = 'Staff'
ORDER BY e.emp_no DESC
LIMIT 10;

SELECT 
-- 2단계
SELECT e.emp_no, e.first_name, e.last_name, t.title
FROM employees AS e 
INNER JOIN titles AS t
ON e.emp_no = t.emp_no
WHERE t.title = 'Staff';

DESC employees;
SELECT * FROM employees;
SELECT * FROM salaries;
SELECT * FROM departments;

SELECT count(s.salary) AS count
FROM employees AS e
INNER JOIN salaries AS s
ON e.emp_no = s.emp_no
WHERE e.first_name = 'Kyoich' AND e.last_name = 'Maliniak';
;

SELECT 

		