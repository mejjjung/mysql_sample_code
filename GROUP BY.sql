USE employees;

SHOW TABLES;

SELECT * FROM salaries;

-- limit --> 갯수
SELECT * FROM salaries 
limit 10;

-- 그룹 바이절에 조건절을 사용할 때는 having 절을 사용 
SELECT * 
FROM salaries
GROUP BY emp_no
Having emp_no = 10001;

-- 2단계
SELECT *, COUNT(salary)
FROM salaries
GROUP BY emp_no;

-- 3단계 max, min
SELECT *, COUNT(salary) as count, 
		MAX(salary) as max, min(salary) as min,
        sum(salary) as sum, round(avg(salary),2) as avg
FROM salaries
GROUP BY emp_no;

-- 2문제 생성 직접 쿼리 출력

SELECT * FROM departments;
SELECT * FROM employees;
SELECT * FROM titles;
DESC departments;

-- 1 사원번호가 10008번인 사람의 최고 급여와 최소 급여 금액을 출력하세요
SELECT emp_no, MAX(salary) as max , MIN(salary) as min
FROM salaries
GROUP BY emp_no
HAVING emp_no = 10008;

-- 2 title 테이블에서 Engineer는 총 몇명인지 출력하세요
SELECT title, COUNT(title) as count
FROM titles
GROUP BY title
HAVING title = 'Engineer';

 
-- 1. emp_no로 그룹을 나누고 title table에서 title과 salaries table에서 salary를 출력하라. (join 사용)
SELECT t.title, s.salary
FROM titles AS t INNER JOIN salaries AS s
ON t.emp_no = s.emp_no
GROUP BY t.emp_no;

-- 2. 위에서 출력한값에서 연봉이 65000원 이상인 사람만 출력하라. (몇명인지도 출력)
SELECT t.title, s.salary, COUNT(s.salary) AS COUNT
FROM titles AS t INNER JOIN salaries AS s
ON t.emp_no = s.emp_no
GROUP BY t.emp_no
HAVING salary >= 65000;

-- 3. Engineer(시니어, 어시스턴트, 일반 모두 포함)이라는 직책을 가진 사원들의 최고 연봉을 출력해라
SELECT t.title, MAX(s.salary) as '최고연봉'
FROM salaries AS s LEFT JOIN titles AS t
ON s.emp_no = t.emp_no
GROUP BY s.emp_no
HAVING t.title = 'Engineer';

-- 4. 각 부서에는 몇 명이 있는지 출력해보자
SELECT d.dept_name AS '부서', count(emp_no) as '부서원 수'
FROM departments AS d LEFT JOIN dept_emp as de
ON d.dept_no = de.dept_no
GROUP BY d.dept_no;
-- 5. 각 직급 별로 몇 명이 있는지 출력해보자
SELECT title, count(title)
FROM titles 
GROUP BY title;
-- 6. employees 테이블과 salaries 테이블을 활용해서 남자 직원의 최고 연봉을 구하시오.
SELECT *, Max(salary)
FROM employees AS e LEFT JOIN salaries AS s
ON e.emp_no = s.emp_no
GROUP BY gender
HAVING gender = 'M';

SELECT * FROM dept_manager;
SELECT * FROM employees;
SELECT * FROM titles;
SELECT * FROM salaries;
SELECT * FROM departments;
SELECT * FROM dept_emp;

use shopdb;
SELECT * From blog;
SELECT * From user;
SELECT * FROM reply;