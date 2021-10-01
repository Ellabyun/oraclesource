-- employees 테이블 전체 내용 조회
SELECT
    *
FROM
    employees;
-- employees 테이블의 first_name, last_name, job_id 만 조회
SELECT
    first_name,
    last_name,
    job_id
FROM
    employees;

-- employee_id가 176인 사람의 LAST_NAME과 DEPARTMENT_ID 조회
SELECT
    department_id,
    last_name
FROM
    employees
WHERE
    employee_id = 176; 
-- 연산자 기호 사용 가능 
-- salary가 12000이상 되는 직원들의 last_name, salary조회

SELECT
    last_name,
    salary
FROM
    employees
WHERE
    salary >= 12000;

-- salary가 5000~12000의 범위 이외인 사원들의 last_name, salary조회
SELECT
    last_name,
    salary
FROM
    employees
WHERE
    salary < 5000
    OR salary > 12000;

--20번 및 50번 부서에서 근무하는 모든 사원들의 LAST_NAME 및 DEPARTMENT_ID 조회
SELECT
    last_name,
    department_id
FROM
    employees
WHERE
    department_id IN ( 20, 50 );

--COMMISSION_PCT를 받는 모든 사원들의 LAST_NAME, SALARY, COMMISSION_PCT 조회
--단, SALARY 내림차순, COMMISSION_PCT 내림차순
SELECT
    last_name,
    salary,
    commission_pct
FROM
    employees
WHERE
    commission_pct > 0
ORDER BY
    salary DESC,
    commission_pct DESC;

--SALARY가 2500,3500,7000이 아니며 JOB_ID가 SA_REP, ST_CLERK인 사원 조회
SELECT
    *
FROM
    employees
WHERE
    salary NOT IN ( 2500, 3500, 7000 )
    AND job_id IN ( 'SA_REP', 'ST_CLERK' );
    
    -- 2008/02/20~2008/05/01 사이에 고용된 사원들의 LAST_NAME, EMPLOYEE_ID, HIRE_DATE
    -- 조회한다. HIRE_DATE 내림차순으로 조회

SELECT
    last_name,
    employee_id,
    hire_date
FROM
    employees
WHERE
        hire_date >= '2008/02/20'
    AND hire_date <= '2008/05/01'
ORDER BY
    hire_date DESC;
 -- 2004년도에 고용된 모든 사람들의 LAST_NAME, HIRE_DATE 조회
 -- HIRE_DATE 오름차순 정렬

SELECT
    last_name,
    hire_date
FROM
    employees
WHERE
        hire_date >= '2004/01/01'
    AND hire_date <= '2004/12/31'
ORDER BY
    hire_date;
    
-- salary가 5000~12000의 범위 이외인 사원들의 last_name, salary조회
SELECT
    last_name,
    salary
FROM
    employees
WHERE
    salary NOT BETWEEN 5000 AND 12000;
--20번 및 50번 부서에서 근무하며,salary가 5000~12000인 사원들의 LAST_NAME 및 DEPARTMENT_ID 조회
SELECT
    last_name,
    department_id
FROM
    employees
WHERE
    department_id IN ( 20, 50 )
    AND salary BETWEEN 5000 AND 12000;
-- 2008/02/20~2008/05/01 사이에 고용된 사원들의 LAST_NAME, EMPLOYEE_ID, HIRE_DATE
-- 조회한다. HIRE_DATE 내림차순으로 조회
SELECT
    last_name,
    employee_id,
    hire_date
FROM
    employees
WHERE
    hire_date BETWEEN '2008/02/20' AND '2008/05/01'
ORDER BY
    hire_date DESC;

 -- 2004년도에 고용된 모든 사람들의 LAST_NAME, HIRE_DATE 조회
 -- HIRE_DATE 오름차순 정렬
SELECT
    last_name,
    hire_date
FROM
    employees
WHERE
    hire_date BETWEEN '2004/01/01' AND '2004/12/31'
ORDER BY
    hire_date;
    
-- LIKE 
-- 2004년도에 고용된 모든 사람들의 LAST_NAME, HIRE_DATE 조회
-- HIRE_DATE 오름차순 정렬
SELECT
    last_name,
    hire_date
FROM
    employees
WHERE
    hire_date LIKE '04%'
ORDER BY
    hire_date;
--LAST_NAME에 u가 포함되는 사원들의 사번 및 LAST_NAME 조회
SELECT
    employee_id,
    last_name
FROM
    employees
WHERE
    last_name LIKE '%u%';
--LAST_NAME의 4번쨰 글자가 a인 사원들의 last_name 조회
SELECT
    last_name
FROM
    employees
WHERE
    last_name LIKE '___a%';
--LAST_NAME에 글자가 a 혹은 e 글자가 들어 있는 사원들의 last_name 조회한 후 last_name 오름차순 조회
SELECT
    last_name
FROM
    employees
WHERE
    last_name LIKE '%a%'
    OR last_name LIKE '%e%'
ORDER BY
    last_name;

SELECT
    last_name
FROM
    employees
WHERE
    last_name LIKE '%a%e%'
    OR last_name LIKE '%e%a%'
ORDER BY
    last_name;
    
-- manager_id가 없는 사원들의 last_name, job_id조회
SELECT
    last_name,
    job_id
FROM
    employees
WHERE
    manager_id IS NULL;

-- job_id가 ST_CLERK인 사원의 department_id 조회(단, 부서번호가 null인 것은 제외)
SELECT DISTINCT
    department_id
FROM
    employees
WHERE
    job_id IN 'ST_CLERK'
    AND department_id IS NOT NULL;
-- commission_pct가 null이 아닌 사원들 중에서 commission = salary *commission_pct를 구한 후 
--employee_id, first_name, job_id, commission 조회
SELECT
    employee_id,
    first_name,
    job_id,
    commission_pct * salary AS commission
FROM
    employees
WHERE
    commission_pct IS NOT NULL;
    
-- first_name이 Curtis인 사람의 first_name, last_name email, phone_number, job_id조회
-- 단, job_id 결과는 소문자로 출력한다. 

SELECT first_name, last_name, email, phone_number, lower(job_id) FROM employees WHERE first_name = 'Curtis';

-- job_id가 AD_PRES, PU_CUERK인 사원들의 EMPLOYEE_ID, FIRST_NAME, LAST_NAME,
-- DEPARTMENT_ID, JOB_ID 조회, 단, 사원명은 FIRST_NAME과 LAST_NAME을 연결하여 출력

SELECT EMPLOYEE_ID, CONCAT(FIRST_NAME, CONCAT(' ', LAST_NAME)), DEPARTMENT_ID, JOB_ID 
FROM employees 
WHERE job_id IN('AD_PRES','PU_CUERK');  

SELECT EMPLOYEE_ID, FIRST_NAME ||' '|| LAST_NAME, DEPARTMENT_ID, JOB_ID 
FROM employees 
WHERE job_id IN('AD_PRES','PU_CUERK'); 

--실습] 부서 80의 각 사원에 대해 적용 가능한 세율을 표시하시오.

SELECT LAST_NAME, SALARY, DECODE(TRUNC(salary/2000,0),
                                0, 0.00, 
                                1, 0.09,
                                2, 0.20,
                                3, 0.30, 
                                4, 0.40, 
                                5, 0.42, 
                                6, 0,44, 
                                0.45) AS TAX_RATE
FROM EMPLOYEES WHERE DEPARTMENT_ID=80;

-- 사원들의 최대 급여와 최소 급여의 차이를 조회 
SELECT MAX(salary)-MIN(SALARY) AS GAP FROM employees;

-- 매니저로 근무하는 사원들의 총 수 조회( 단, MANAGER_ID 중복 제고)
SELECT COUNT(DISTINCT MANAGER_ID) FROM employees;

-- 문1] 자신의 담당 매니저의 고용일보다 빠른 입사자 찾기(self join)
select * from employees e1, employees e2 where e1.manager_id = e2.employee_id and e1.hire_date < e2.hire_date;

-- join~on 구문으로 바꾸기
select * from employees e1 join employees e2 on e1.manager_id = e2.employee_id and e1.hire_date < e2.hire_date;

-- 문2] 도시이름이 T로 시작하는 지역에 사는 사원들의 사번, last_name, 부서번호 조회
--employees, department테이블 연결, 연결 결과를 locations테이블과 연결
select employee_id, last_name, e.department_id 
from employees e, departments d, locations l
where e.department_id=d.department_id and d.location_id=l.location_id and city like 'T%';

-- 문3] 위치 id가 1700인 사원들의 last_name, 부서번호, 연봉 조회
--employees, departments 테이블 연결
select last_name, e.department_id, salary 
from employees e, departments d 
where e.department_id=d.department_id and location_id=1700;

-- 문4] Executive 부서에 근무하는 모든 사원들의 부서번호, last_name, job_id 조회
--employees, departments 테이블 연결
select e.department_id, last_name, job_id 
from employees e, departments d 
where e.department_id=d.department_id and department_name='Executive';

-- LAST_NAME에 u가 포함되는 사원들과 동일부서에 근무하는 사원들의 
-- 사번 및 last_name조회

SELECT employee_id, last_name
FROM employees 
WHERE department_id in (SELECT distinct department_id FROM employees WHERE last_name like '%u%');