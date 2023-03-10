
SELECT *, COUNT(gender)
FROM employees
GROUP BY  gender;

-- 조건 두개 걸기 
SELECT *, COUNT(hire_date) 
FROM employees
GROUP BY hire_date, gender;

--
SELECT * FROM employees;
-- employees (1) : dept_emp(N)
SELECT * FROM dept_emp;
-- departments(1) : dept_emp(N) --> 1 : N 관계
SELECT * FROM departments;

-- employees : departments -- > N : M 관계 차수를 가진다.
-- 중간 테이블 dept_emp 만들어서 N : M 관계를 표현하고 있다. 

-- employees : dept_emp --> 1 : N 관계로 풀어 진다. 
-- departments : dept_emp --> 1 : N 관계로 풀어 진다. 

-- 1단계 조인해보기
SELECT * 
FROM employees AS e
LEFT JOIN dept_emp AS d
ON e.emp_no = d.emp_no;

-- 2단계 중복 컬럼 제거하기
SELECT * 
FROM employees AS e
LEFT JOIN dept_emp AS d
ON e.emp_no = d.emp_no
LEFT JOIN departments as dp
ON d.dept_no = dp.dept_no;

-- 3단계
SELECT e.emp_no AS '사원번호', e.first_name AS '이름', d.dept_no AS '부서 번호', dp.dept_name AS ' 부서이름'
FROM employees AS e
LEFT JOIN dept_emp AS d
ON e.emp_no = d.emp_no
LEFT JOIN departments as dp
ON d.dept_no = dp.dept_no;

-- 4단계 - 사용 방법 연습
SELECT e.emp_no, e.first_name, d.dept_no, dp.dept_name
FROM employees AS e
LEFT JOIN dept_emp AS d
ON e.emp_no = d.emp_no
LEFT JOIN departments as dp
ON d.dept_no = dp.dept_no
GROUP BY dept_no
HAVING dept_no = 'd001';




SELECT * FROM departments;