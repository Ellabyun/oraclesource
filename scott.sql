--SQL은 대소문자 구별은 안함(쿼리문)
--대소문자 구별은 비밀번호만 함
-- 문자열 표현할 떄 홑따옴표

-- scott 계정에 존재하는 모든 테이블 조회
SELECT
    *
FROM
    tab;

-- 조회(Select) : 행 단위로 조회, 열 단위로 조회

-- emp 테이블의 내용을 전체조회
SELECT
    *
FROM
    emp;

-- emp 테이블의 empno, ename, job만 조회
SELECT
    empno,
    ename,
    job
FROM
    emp;

-- emp 테이블의 empno, deptno조회 
SELECT
    empno,
    deptno
FROM
    emp;

-- 중복 제거 후 조회 : distinct

SELECT DISTINCT
    deptno
FROM
    emp;

-- 별칭을 붙여서 조회 : AS(alais)
SELECT
    empno AS 사원번호
FROM
    emp;

SELECT
    ename           AS 사원명,
    job             AS "직 책",
    sal             AS 급여,
    comm            AS 추가수당,
    sal * 12 + comm AS 연봉
FROM
    emp;

-- 정렬 : ORDER BY 컬럼명 기준(오름차순 ASC, 내림차순 DESC) 

-- ename, sal 조회할 때 sal 내림차순으로 정렬

SELECT
    ename,
    sal
FROM
    emp
ORDER BY
    sal DESC;
 -- 오름차순(생략가능-기본값)
SELECT
    ename,
    sal
FROM
    emp
ORDER BY
    sal ASC;

-- EMP 테이블의 전체 내용을 조회하고, 단 사원번호 내림차순
SELECT
    *
FROM
    emp
ORDER BY
    empno DESC;

-- 전체 내용 조회(부서번호 오름차순, 급여 내림차순)
SELECT
    *
FROM
    emp
ORDER BY
    deptno ASC,
    sal DESC;

-- 조회할 테이블은 EMP 테이블이며 모든 열을 출력한다.
SELECT
    *
FROM
    emp;

-- 출력되는 열의 별칭을 다음과 같이 지정한다.
SELECT
    empno  AS employee_no,
    ename  AS employee_name,
    mgr    AS manager,
    sal    AS salary,
    comm   AS commission,
    deptno AS department_no,
    job,
    hiredate
FROM
    emp;

-- 부서번호를 기준으로 내림차순으로 정렬하되 부서 번호가 같다면 사원 이름을 기준으로 오름차순 정렬
SELECT
    *
FROM
    emp
ORDER BY
    deptno DESC,
    ename;
    
-- 특정 조건을 기준으로 원하는 데이터를 조회 : WHERE절 사용

-- 전체 데이터 조회, 단 부서번호가 30번인 데이터 조회
SELECT
    *
FROM
    emp
WHERE
    deptno = 30;

-- 사원번호가 7782번 조회
SELECT
    *
FROM
    emp
WHERE
    empno = 7782;

-- 부서번호가 30번이고, 사원직책이 SALESMAN인 사원 조회
SELECT
    *
FROM
    emp
WHERE
        deptno = 30
    AND job = 'SALESMAN';

SELECT
    *
FROM
    emp
WHERE
        deptno = 30
    AND job = 'salesman';

-- 사원번호가 7499이고, 부서번호가 30인 사원 조회
SELECT
    *
FROM
    emp
WHERE
        empno = 7499
    AND deptno = 30;

-- 부서번호가 30 이거나 사원직책이 CLERK 조회
SELECT
    *
FROM
    emp
WHERE
    deptno = 30
    OR job = 'CLERK';

-- BETWEEN A AND B
-- 급여가 2000~3000 사이인 사원 조회
SELECT
    *
FROM
    emp
WHERE
        sal >= 2000
    AND sal <= 3000;

SELECT
    *
FROM
    emp
WHERE
    sal BETWEEN 2000 AND 3000;

SELECT
    *
FROM
    emp
WHERE
    sal NOT BETWEEN 2000 AND 3000;
    
-- LIKE 연산자와 와일드 카드
-- 일부 문자열이 포함된 데이터를 조회할때 사용
-- 와일드 카드 : 
-- % : 길이와 상관없이 모든 문자 데이터를 의미
-- _ : 어떤 값이든 상관없이 한 개의 문자 데이터를 의미

-- 사원명이 S로 시작하는 사원 조회
SELECT
    *
FROM
    emp
WHERE
    ename LIKE 'S%';

-- 사원명의 두번째 글자가 L인 사원 조회
SELECT
    *
FROM
    emp
WHERE
    ename LIKE '_L%';

-- 사원명에 AM 문자가 포함되어 있는 사원 조회
SELECT
    *
FROM
    emp
WHERE
    ename LIKE '%AM%';

-- 사원명에 AM 문자가 포함되어 있는 사원 조회
SELECT
    *
FROM
    emp
WHERE
    ename NOT LIKE '%AM%';

-- IS NULL 
SELECT
    *
FROM
    emp
WHERE
    comm IS NULL;

-- NULL은 0과 같은 개념이 아님. 완전히 비어 있는 상태를 의미.
-- MGR이 NULL인 사원 조회
SELECT
    *
FROM
    emp
WHERE
    mgr IS NULL;

-- MGR이 NULL이 아닌 사원 조회
SELECT
    *
FROM
    emp
WHERE
    mgr IS NOT NULL;

-- 집합 연산자 : 합집합 - UNION, UNION ALL(중복값을 제거하지 않음),
--             교집합 - INTERSECT
--             차집합 - MINUS

--EMPNO,ENAME,SAL,DEPTNO 조회(부서번호가 10번이거나 20번인)
SELECT
    empno,
    ename,
    sal,
    deptno
FROM
    emp
WHERE
    deptno = 10
UNION
SELECT
    empno,
    ename,
    sal,
    deptno
FROM
    emp
WHERE
    deptno = 20;

SELECT
    empno,
    ename,
    sal,
    deptno
FROM
    emp
WHERE
    deptno = 10
UNION
SELECT
    empno,
    ename,
    sal,
    deptno
FROM
    emp
WHERE
    deptno = 10;

SELECT
    empno,
    ename,
    sal,
    deptno
FROM
    emp
WHERE
    deptno = 10
UNION ALL
SELECT
    empno,
    ename,
    sal,
    deptno
FROM
    emp
WHERE
    deptno = 10;

SELECT
    empno,
    ename,
    sal,
    deptno
FROM
    emp
WHERE
    deptno = 10
UNION
SELECT
    sal,
    job,
    deptno,
    sal
FROM
    emp
WHERE
    deptno = 20;

SELECT
    empno,
    ename,
    sal,
    deptno
FROM
    emp
MINUS
SELECT
    empno,
    ename,
    sal,
    deptno
FROM
    emp
WHERE
    deptno = 10;

SELECT
    empno,
    ename,
    sal,
    deptno
FROM
    emp
INTERSECT
SELECT
    empno,
    ename,
    sal,
    deptno
FROM
    emp
WHERE
    deptno = 10;

-- 문자열 함수 : 공백제거
--              TRIM : 양쪽 공백 제거
--              LTRIM : 왼쪽 공백 제거
--              RTRIM : 오른쪽 공백 제거



SELECT
    '    이것이    ',
    TRIM('    이것이    ')
FROM
    dual;

-- TRIM(삭제옵션(선택), 삭제할 문자(선택), from 원본문자열

SELECT
    '['
    || TRIM('_' FROM '__Oracle__')
    || ']' AS trim,
    '['
    || TRIM(LEADING '_' FROM '__Oracle__')
    || ']' AS trim_leading,
    '['
    || TRIM(TRAILING '_' FROM '__Oracle__')
    || ']' AS trim_trailing,
    '['
    || TRIM(BOTH '_' FROM '__Oracle__')
    || ']' AS trim_both
FROM
    dual;
    
--숫자함수 : ROUND(숫자, 반올림 위치(선택))
--          TRUNK(숫자, 버림 위치(선택))
--          CEIL(숫자) : 입력된 숫자와 가장 가까운 큰 정수
--          FLOOR(숫자) : 입력된 숫자와 가장 가까운 작은 정수
--          MOD(숫자, 나눌숫자) : 나머지 값

SELECT
    trunc(1234.5678)      AS trunc,
    trunc(1234.5678, 0)   AS trunc0,
    trunc(1234.5678, 1)   AS trunc1,
    trunc(1234.5678, 2)   AS trunc2,
    trunc(1234.5678, - 1) AS trunc_minus1,
    trunc(1234.5678, - 2) AS trunc_minus2
FROM
    dual;

SELECT
    ceil(3.14),
    floor(3.14),
    ceil(- 3.14),
    floor(- 3.14)
FROM
    dual;

SELECT
    mod(15, 6),
    mod(10, 2),
    mod(11, 2)
FROM
    dual;

-- 날짜함수
-- SYSDATE : 오라클 데이터베이스 서버가 설치된 os의 현재 날짜와 시간
-- ADD_MONTHS: 몇 개월 이후 날짜를 구하는 함수
SELECT
    sysdate     AS now,
    sysdate - 1 AS yesterday,
    sysdate + 1 AS tomorrow
FROM
    dual;

SELECT
    sysdate,
    add_months(sysdate, 3)
FROM
    dual;

-- 입사 20주년이 되는 날짜 사원들 조회
SELECT
    ename,
    hiredate,
    add_months(hiredate, 240)
FROM
    emp;

-- 현재 날짜를 기준으로 입사 38년 미만인 사원 조회
SELECT
    ename,
    hiredate
FROM
    emp
WHERE
    add_months(hiredate, 480) > sysdate;
    
-- MONTHS_BETWEEN : 두 날짜 간의 개월 수 차이 구하기
SELECT
    empno,
    ename,
    hiredate,
    sysdate,
    months_between(sysdate, hiredate)        AS month1,
    months_between(hiredate, sysdate)        AS month2,
    trunc(months_between(sysdate, hiredate)) AS month3
FROM
    emp;
    
    -- next_day(날짜, 요일문자)
    -- last_day(날짜)

SELECT
    sysdate,
    next_day(sysdate, '월요일'),
    last_day(sysdate)
FROM
    dual;
    
    -- 형변환 함수
    -- TO_CHAR() : 숫자 또는 날짜 데이터를 문자 데이터로 변환
    -- TO_NUMBER() : 문자 데이터를 숫자 데이터로 변환
    -- TO_DATE() : 문자 데이터를 날짜 데이터로 변환
SELECT
    to_char(sysdate, 'YYYY/MM/DD') AS 현재날짜
FROM
    dual;

SELECT
    sysdate,
    to_char(sysdate, 'MM') AS 현재월
FROM
    dual;

SELECT
    sysdate,
    to_char(sysdate, 'MON') AS 현재월
FROM
    dual;

SELECT
    sysdate,
    to_char(sysdate, 'HH:MI:SS') AS 현재시간
FROM
    dual;

SELECT
    sysdate,
    to_char(sysdate, 'HH12:MI:SS AM') AS 현재시간
FROM
    dual;

SELECT
    sysdate,
    to_char(sysdate, 'HH24:MI:SS') AS 현재시간
FROM
    dual;
   
   -- L(Locale) : 지역화폐단위를 붙여서 추력
   -- 9, 0: 숫자의 한 자리를 의미함(9는 빈자리를 채우지 않음, 0 빈자리를 채우는 개념)

SELECT
    sal,
    to_char(sal, '$999,999') AS sal_$,
    to_char(sal, '$000,000') AS sal_$2,
    to_char(sal, 'L999,999') AS sal_l
FROM
    emp;

SELECT
    to_number('1,300', '999,999')
FROM
    dual;

SELECT
    TO_DATE('2021_09_12', 'YYYY-MM-DD') AS todate1,
    TO_DATE('20210912', 'YYYY-MM-DD')   AS todate2
FROM
    dual;
    
    -- 날짜 데이터는 연산이 가능함
    -- 1981-06-01 이후 이사자

SELECT
    *
FROM
    emp
WHERE
    hiredate > TO_DATE('1981/06/01', 'YYYY-MM-DD');
    
    -- 널처리 함수
    -- NVL(널 여부, 데이터, 널이면 처리해야 반환할 값)
SELECT
    empno,
    ename,
    sal,
    comm,
    sal + comm,
    nvl(comm, 0),
    sal + nvl(comm, 0)
FROM
    emp;
    
    --NVL2(데이터, 널이 아닐경우 반환할 값, 널이면 반환할 값)
SELECT
    empno,
    ename,
    sal,
    comm,
    nvl2(comm, 'O', 'X'),
    nvl2(comm, sal * 12 + comm, sal * 12)
FROM
    emp;
    
   -- DECODE 함수
   -- DECODE([검사 대상이 될 열 또는 데이터],
   --       [조건1],[데이터가 조건 1과 일치할 때 반환할 결과],
   --       [조건2],[데이터가 조건 2와 일치할 때 반환할 결과],
   --       ....
   --       [위 조건들 중에서 일치한 경우가 없을 때 반환할 결과])
   
   -- job에 따라 급여의 비율 설정
SELECT
    empno,
    ename,
    job,
    sal,
    decode(job, 'MANAGER', sal * 1.1, 'SALESMAN', sal * 1.05,
           'ANALYST', sal, sal * 1.03) AS upsal
FROM
    emp;
    
-- CASE : DECODE 문으로 작성할 수 있는 것들은 모두 변환 가능
--        = 의 의미로 사용되지만 다른 조건도 가능하다
SELECT
    empno,
    ename,
    job,
    sal,
    CASE job
        WHEN 'MANAGER'  THEN
            sal * 1.1
        WHEN 'SALESMAN' THEN
            sal * 1.05
        WHEN 'ANALYST'  THEN
            sal
        ELSE
            sal * 1.03
    END AS upsal
FROM
    emp;
    
-- COMM 이 Null이면 '해당사항 없음', 0이면 '수당없음', 0보다 크면 '수당 : 2500' 출력

SELECT
    empno,
    ename,
    comm,
    CASE
        WHEN comm IS NULL THEN
            '해당사항 없음'
        WHEN comm = 0 THEN
            '수당 없음'
        WHEN comm > 0 THEN
            '수당 : ' || comm
    END AS comm_text
FROM
    emp;
--[실습1] 다음과 같은 결과가 나오도록 SQL문을 작성하시오. EMP 테이블에서 사원들의 월 평균 근무일수는 21.5일이다. 
-- 하루 근무 시간을 8시간으로 보았을 때 사원들의 하루 급여(DAY_PAY)와 시급(TIME_PAY)를 계산하여 결과를 출력한다. 
-- 단, 하루 급여는 소수점 셋째 자리에서 버리고, 시급은 두 번째 소수점에서 반올림하시오.

SELECT
    empno,
    ename,
    sal,
    trunc((sal / 21.5), 2)     AS day_pay,
    round((sal / 21.5 / 8), 1) AS time_pay
FROM
    emp;
-- [실습2] EMP 테이블에서 사원들은 입사일(HIREDATE)을 기준으로 3개월이 지난 후 첫 월요일에 정직원이 된다. 
-- 사원들이 정직원이 되는 날짜(R_JOB)를 YYYY-MM-DD 형식으로 아래와 같이 출력하시오.
-- 단, 추가수당(COMM)이 없는 사원의 추가 수당은 N/A로 출력하시오.

select comm, nvl(comm,0) from emp;
select comm, nvl(comm,'0') from emp;

select comm, nvl(TO_CHAR(comm),'N/A') from emp;

SELECT
    empno,
    ename,
    hiredate,
    next_day(add_months(hiredate,3), '월요일') AS R_JOB,
    nvl(TO_CHAR(comm),'N/A') AS COMM

FROM
    emp;
    

--[실습3] EMP 테이블의 모든 사원을 대상으로 직속 상관의 사원 번호(MGR)를 다음과 같은 조건을 기준으로 변환해서 CHG_MGR 열에 출력하시오.

--직속상관의 사원 번호가 존재하지 않을 경우 : 0000
--직속상관의 사원 번호 앞 두자리가 75일 경우 : 5555
--직속상관의 사원 번호 앞 두자리가 76일 경우 : 6666
--직속상관의 사원 번호 앞 두자리가 77일 경우 : 7777
--직속상관의 사원 번호 앞 두자리가 78일 경우 : 8888
--그 외 직속 상관 사원 번호의 경우 : 본래 직속 상관의 사원번호 그대로 출력

SELECT
    empno,
    ename,
    mgr,
    decode(substr(to_char(mgr),1,2), 
            NULL, '0000', 
            '75', '5555',
            '76', '6666', 
            '77', '7777', 
            '78', '8888', 
            substr(to_char(mgr),1)) AS chg_mgr
FROM
    emp;
    

SELECT
    empno,
    ename,
    mgr,
    CASE
        WHEN MGR IS NULL THEN '0000'
        WHEN SUBSTR(TO_CHAR(MGR),1,2)='75' THEN '5555' -- WHEN MGR LIKE '75%' THEN '5555'
        WHEN SUBSTR(TO_CHAR(MGR),1,2)='76' THEN '6666'
        WHEN SUBSTR(TO_CHAR(MGR),1,2)='77' THEN '7777'
        WHEN SUBSTR(TO_CHAR(MGR),1,2)='78' THEN '8888'
        ELSE TO_CHAR(MGR)
    END AS CHG_MGR

FROM
    emp;
    
-- 다중행 함수 : SUM(), COUNT(), MAX(), MIN(), AVG()

SELECT SUM(SAL) FROM EMP;
SELECT SUM(SAL), ENAME FROM EMP; -- 에러

-- EMP 테이블의 데이터 개수 조회
SELECT COUNT(*) FROM EMP;

SELECT COUNT(EMPNO) FROM EMP;

SELECT COUNT(SAL) FROM EMP;

SELECT COUNT(DISTINCT SAL) FROM EMP;

-- 부서번호가 10번인 사원의 최대 급여
SELECT MAX(SAL) FROM emp WHERE DEPTNO = 10;

-- 부서번호가 10번인 사원의 최소 급여
SELECT MIN(SAL) FROM emp WHERE DEPTNO = 10;

--부서번호가 20번인 사원 중에서 제일 오래된 입사일 조회
SELECT MIN(HIREDATE) FROM emp WHERE deptno=20; 

--부서번호가 30번인 사원들의 평균 급여 조회
SELECT AVG(DISTINCT sal) FROM emp WHERE deptno=30;

-- GROUP BY 그룹화 할 열 지정(여러개 지정 가능)

-- 부서별 급여의 합 조회
SELECT SUM(SAL),DEPTNO
FROM EMP 
GROUP BY DEPTNO
ORDER BY DEPTNO;

-- 부서별 금여 평균 조회
SELECT AVG(SAL),DEPTNO
FROM EMP 
GROUP BY DEPTNO
ORDER BY DEPTNO;

--부서별, 직무별 급여 평균 조회
SELECT AVG(SAL),DEPTNO, JOB 
FROM EMP 
GROUP BY DEPTNO, JOB
ORDER BY DEPTNO, JOB;

-- GROUP BY ~ HAVING 조건식

-- 부서별, 직무별 급여의 평균 조회(단, 급여의 평균이 2000이상)
-- WHERE AVG(SAL)>=2000 -- 그룹함수는 허가되지 않음

SELECT DEPTNO, JOB, AVG(SAL)
FROM emp
GROUP BY DEPTNO, JOB HAVING AVG(SAL)>=2000
ORDER BY DEPTNO, JOB;

SELECT DEPTNO, JOB, AVG(SAL)
FROM emp
WHERE SAL <= 3000 -- 1. 출력 대상이 되는 행 제한
GROUP BY DEPTNO, JOB HAVING AVG(SAL)>=2000 --2. 그룹화한 행 제한
ORDER BY DEPTNO, JOB;
--[실습1] EMP 테이블을 이용하여 부서번호(DEPTNO), 평균급여(AVG_SAL), 최고급여(MAX_SAL), 최저급여(MIN_SAL), 사원수(CNT)를 출력한다.
-- 단, 평균 급여를 출력할 때 소수점을 제외하고 각 부서번호별로 출력하는 SQL 문을 작성하시오.
SELECT DEPTNO, TRUNC(AVG(SAL),0) AS AVG_SAL, MAX(SAL) MAX_SAL, MIN(SAL) MIN_SAL, COUNT(*) FROM EMP GROUP BY DEPTNO ORDER BY DEPTNO DESC ;

--[실습2] 같은 직책에 종사하는 사원이 3명 이상인 직책과 인원수를 출력하는 SQL문을 작성하시오.
SELECT job, COUNT(*) FROM EMP GROUP BY JOB HAVING COUNT(JOB)>=3;

--[실습3] 사원들의 입사연도(HIRE_YEAR)를 기준으로 부서별로 몇 명이 입사했는지 출력하는 SQL문 작성하시오.
SELECT TO_CHAR(HIREDATE,'yyyy') AS HIRE_YEAR,DEPTNO, count(*) AS CNT FROM EMP GROUP BY TO_CHAR(HIREDATE,'yyyy'), DEPTNO ORDER BY HIRE_YEAR DESC, DEPTNO ASC;

-- 데이터 삽입, 삭제, 수정 : 결과는 실행된 행의 갯수로 넘어옴

-- 실습용 테이블 생성
create table dept_temp as select * from dept;

select * from dept_temp;

-- Insert : 데이터 삽입
-- Insert into 테이블명(필드명....) values(값1, 값2....)
-- Insert into 테이블명 values(값1, 값2...)
insert into dept_temp(deptno, dname, loc) values(50, 'DATABASE', 'SEOUL');

insert into dept_temp values(60, 'NETWORK', 'BUSAN');

insert into dept_temp(dname, loc, DEPTNO) values('NETWORK', 'BUSAN', 70);

-- null 삽입하는 방법(테이블 생성시 널이 가능하도록 열이 설정되어 있는 경우만 사용 가능)
insert into dept_temp(deptno, dname) values(90,'DATABASE');
insert into dept_temp(deptno, dname, loc) values(91,'WEB',NULL);
insert into dept_temp(deptno, dname, loc) values(91,'MOBILE','');
select * from dept_temp;

COMMIT;

-- 실습용 테이블 생성
-- 테이블 구조는 복사하되, 데이터는 복사하고 싶지 않을 때
create table emp_temp as select * from emp where 1<>1;

select * from emp_temp;

--desc : 구조확인
desc emp_temp;

insert into emp_temp(empno,ename,job,mgr,hiredate,sal,comm,deptno)
values(1111, '홍길동', 'manager', null, '2021-09-27',4000,null,10);

insert into emp_temp
values(2222, '성춘향', 'analyst', null, '2021/09/27',5000,null,10);

insert into emp_temp
values(3333, '박보검', 'analyst', null, sysdate,5000,null,10);

select * from emp_temp;

commit;

-- UPDATE : 수정, 변경
-- UPDATE 테이블명 SET 변경할 열=변경할 값, 변경할 열 = 변경할 값....
-- UPDATE 테이블명 SET 변경할 열=변경할 값, 변경할 열 = 변경할 값.... WHERE 수정할 조건

select * from dept_temp;

UPDATE dept_temp SET LOC = 'SEOUL' WHERE DEPTNO=90;

select * from dept_temp;

UPDATE dept_temp SET LOC='BUSAN' WHERE DEPTNO=91;

select * from dept_temp;

COMMIT;

SELECT * FROM emp_temp;

--SAL이 4000이하인 사원만 추가수당을 50으로 변경

UPDATE emp_temp SET COMM=50 WHERE SAL<=4000;
commit;

update emp_temp
set sal = 1500
where empno = 7369;

UPDATE emp_temp SET COMM=100;

ROLLBACK;

-- DELETE : 삭제
-- DELETE 테이블 이름
-- DELETE FROM 테이블 이름 WHERE 삭제할 데이터 조건

create table emp_temp2 as select * from emp;
select * from emp_temp2;

-- JOB이 manage인 사원 삭제
DELETE emp_temp2 WHERE JOB='MANAGER';

-- 전체 사원 삭제
DELETE emp_temp2;

ROLLBACK;

--조인
SELECT COUNT(*) FROM emp;
SELECT COUNT(*) FROM DEPT;

--카테시안 조인 : 나올 수 있는 모든 조합(14행*4행=56)
SELECT * 
FROM emp,dept;

-- 내부조인(inner 조인)
-- 등가조인 : 일치하는 데이터 조인
-- 비등가 조인 : 특정 범위에 있는 데이터 추출

SELECT * 
FROM emp, dept
where emp.deptno = dept.deptno;

--00918. 00000 -  "column ambiguously defined"ORA-00918: 열의 정의가 애매합니다
SELECT empno, ename, deptno, dname
FROM emp, dept
where emp.deptno = dept.deptno;

SELECT empno, ename, emp.deptno, dname
FROM emp, dept
where emp.deptno = dept.deptno;

-- 테이블 별칭 설정

SELECT empno, ename, e.deptno, dname
FROM emp e, dept d
where e.deptno = d.deptno
ORDER BY dname;

-- sal 3000 이상인 사원들의 사범, 이름, 부서번호, 부서명, 급여
SELECT empno, ename, d.deptno, dname, sal 
FROM emp e, dept d 
WHERE e.deptno = d.deptno AND sal>=3000;

-- 급여가 2500 이하이고, 사원번호가 9999 이하인 사원의 사번, 이름, 급여, 부서명, 부서위치
SELECT empno, ename, sal, dname, loc
FROM emp e, dept d
WHERE e.deptno = d.deptno AND sal<=2500 AND empno<=9999;

-- emp 테이블의 급여가 salgrade 특정 범위에 속하면 grade 값 조회
select * from salgrade;
select * from emp;
-- 비등가조인
select *
from emp e, salgrade s
where e.sal between s.losal and s.hisal;

-- 자체 조인(셀프 조인): 본인 자신의 테이블과 다시 조인하는 개념
select * from emp;

select e1.empno, e1.ename, e1.mgr, e2.empno, e2.ename
from emp e1, emp e2
where e1.mgr=e2.empno;

--외부조인(outer join)


--왼쪽외부조인(left outer join)
select e1.empno, e1.ename, e1.mgr, e2.empno, e2.ename
from emp e1, emp e2
where e1.mgr=e2.empno(+);

--오른쪽외부조인(right outer join)
select e1.empno, e1.ename, e1.mgr, e2.empno, e2.ename
from emp e1, emp e2
where e1.mgr(+)=e2.empno;

--양쪽 외부조인(+ 기호는 제공안함)
--ORA-01468: outer-join된 테이블은 1개만 지정할 수 있습니다
--01468. 00000 -  "a predicate may reference only one outer-joined table"
--*Cause:    
--*Action:
--956행, 16열에서 오류 발생
--select e1.empno, e1.ename, e1.mgr, e2.empno, e2.ename
--from emp e1, emp e2
--where e1.mgr(+)=e2.empno(+);

-- 모든 데이터 베이스에서 사용가능한 표준 조인 구문

-- join~on
SELECT empno, ename, emp.deptno, dname
FROM emp join dept on emp.deptno = dept.deptno
ORDER BY dname;

select empno, ename, d.deptno, dname, sal
from emp e join dept d on e.deptno = d.deptno
where sal >= 3000;

SELECT empno, ename, sal, dname, loc
FROM emp e join dept d on e.deptno = d.deptno 
where sal<=2500 AND empno<=9999;

select *
from emp e join salgrade s
on e.sal between s.losal and s.hisal;

-- outer join 표준 구문
select e1.empno, e1.ename, e1.mgr, e2.empno, e2.ename
from emp e1 left outer join emp e2 on e1.mgr=e2.empno;

select e1.empno, e1.ename, e1.mgr, e2.empno, e2.ename
from emp e1 right outer join emp e2 on e1.mgr=e2.empno;

select e1.empno, e1.ename, e1.mgr, e2.empno, e2.ename
from emp e1 full outer join emp e2 on e1.mgr=e2.empno;

desc dept;
--[실습1] 급여가 2000초과인 사원들의 부서 정보, 사원 정보를 아래와 같이 출력하는 SQL 문을 작성하시오.
select d.deptno, dname, empno, ename, sal
from emp e, dept d 
Where d.deptno = e.deptno and sal >2000 order by d.deptno;

select d.deptno, dname, empno, ename, sal
from emp e join dept d on d.deptno = e.deptno where sal >2000 order by d.deptno;

--[실습2] 각 부서별 평균 급여, 최대 급여, 최소 급여, 사원수를 출력하는 SQL문을 작성하시오.
select d.deptno, dname, TRUNC(AVG(sal),0) as AVG_SAL , MAX(sal) MAX_SAL, MIN(sal) MIN_SAL, count(*) CNT
from emp e, dept d where e.deptno = d.deptno
GROUP BY d.deptno, dname ORDER BY d.deptno;

select d.deptno, dname, TRUNC(AVG(sal),0) as AVG_SAL , MAX(sal) MAX_SAL, MIN(sal) MIN_SAL, count(*) CNT
from emp e join dept d on e.deptno = d.deptno
GROUP BY d.deptno, dname ORDER BY d.deptno;

--[실습3] 모든 부서정보와 사원 정보를 아래와 같이 부서번호, 사원이름 순으로 정렬하여 출력하는 SQL문을 작성하시오.
select d.deptno, dname, empno, ename, job, sal 
from dept d, emp e
where d.deptno = e.deptno(+)
order by d.deptno, ename;

select d.deptno, dname, empno, ename, job, sal 
from dept d left outer join emp e on d.deptno = e.deptno
order by d.deptno, ename;

-- 세개 테이블 조인
select *
from emp e1, emp e2, emp e3
where e1.empno=e2.empno and e2.empno=e3.empno;

select *
from emp e1 join emp e2 on e1.empno=e2.empno 
            join emp e3 on e2.empno=e3.empno;

--[실습4] 모든 부서정보와 사원 정보, 급여등급 정보, 각 사원의 직속 상관의 정보 부서번호, 사원번호 순으로 정렬하여 출력하는 SQL문을 작성하시오.

--emp e1 테이블과 dept 테이블 조인 => dept 테이블 기준(dept 테이블 내용 모두 출력)
select * 
from emp e1, dept d1
where e1.deptno(+)=d1.deptno;

--첫번째 연결 결과랑 salgrade와 조인
select * 
from emp e1, dept d1, salgrade s1
where e1.deptno(+)=d1.deptno and e1.sal between s1.losal(+) and s1.hisal(+);

--두번째 연결 결과의 mgr이랑 emp e2 테이블의 empno랑 조인
SELECT
    d.deptno,
    dname,
    e1.empno,
    e1.ename,
    e1.mgr,
    e1.sal,
    losal,
    hisal,
    grade,
    e2.empno AS mgr_empno,
    e2.ename AS mgr_ename
FROM
    dept     d,
    emp      e1,
    salgrade s,
    emp      e2
WHERE
        e1.deptno (+) = d.deptno
    AND e1.sal BETWEEN s.losal(+) AND s.hisal(+)
    AND e1.mgr = e2.empno(+)
order by d.deptno, e1.ename;


SELECT
    d.deptno,
    dname,
    e1.empno,
    e1.ename,
    e1.mgr,
    e1.sal,
    losal,
    hisal,
    grade,
    e2.empno AS mgr_empno,
    e2.ename AS mgr_ename
FROM
    emp e1 right outer join dept d on e1.deptno = d.deptno
        left outer join salgrade s on e1.sal BETWEEN s.losal AND s.hisal
        left outer join emp e2 on e1.mgr = e2.empno
order by d.deptno, e1.ename;



