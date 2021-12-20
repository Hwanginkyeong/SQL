/*
select 문
  select 절
  from 절;
*/

--직원테이블 전체 조회
SELECT
    *
FROM
    employees;

--부서테이블 전체 조회
SELECT
    *
FROM
    departments;

--원하는 컬럼만 조회
SELECT
    employee_id,
    first_name,
    last_name
FROM
    employees;

--예)
SELECT
    first_name,
    phone_number,
    hire_date,
    salary
FROM
    employees;

SELECT
    first_name,
    last_name,
    salary,
    phone_number,
    email,
    hire_date
FROM
    employees;

--출력할 컬럼명 별명적용하기
SELECT
    employee_id AS empno,
    first_name  AS "f-name",
    salary      AS "연 봉"
FROM
    employees;

--예)
--as 생략가능
SELECT
    first_name   AS 이름,
    phone_number AS 전화번호,
    hire_date    AS 입사일,
    salary       AS 급여
FROM
    employees;

SELECT
    employee_id  AS 사원번호,
    first_name   AS "이름",
    last_name    AS 성,
    salary       AS 급여,
    phone_number AS 전화번호,
    email        AS 이메일,
    hire_date    AS 입사일
FROM
    employees;

--연결 연산자(Concatenation)로 컬럼들 붙이기
SELECT
    first_name,
    last_name
FROM
    employees;

SELECT
    first_name || last_name
FROM
    employees;

SELECT
    first_name
    || ' '
    || last_name
FROM
    employees;

SELECT
    first_name
    || ' 입사일은 '
    || hire_date
FROM
    employees;

--
SELECT
    first_name
    || ' '
    || last_name name
FROM
    employees;

--
--산술 연산자 사용하기
SELECT
    first_name,
    salary      AS 월급,
    salary * 12 AS 연봉,
    ( salary + 300 ) * 12
FROM
    employees;

--예) 
SELECT
    job_id * 12
FROM
    employees;

SELECT
    first_name
    || '-'
    || last_name           "성 명",
    salary                 "급 여",
    salary * 12            연봉,
    ( salary * 12 ) + 5000 연봉2,
    phone_number           전화번호
FROM
    employees;

/* where 절*/
--비교연산자
--부서번호가 10인 사원의 이름을 구하시오
SELECT
    first_name,
    last_name,
    salary department_id  -->확인하는 용으로 두는게 좋음 
FROM
    employees
WHERE
    department_id = 10;

--예제 

--급여가 15000 이상인 사원들의 이름과 월급을 출력하세요
SELECT
    first_name,
    salary
FROM
    employees
WHERE
    salary >= 15000;

--07/01/01 일 이후에 입사한 사원들의 이름과 입사일을 출력하세요
SELECT
    first_name,
    hire_date가
FROM
    employees
WHERE
    hire_date <= '07/01/01';

--이름이 Lex인 직원의 연봉을 출력하세요 
SELECT
    first_name,
    salary
FROM
    employees
WHERE
    first_name = 'Lex';

--조건이 2개이상 일 때 한꺼번에 조회하기
SELECT
    first_name,
    salary
FROM
    employees
WHERE
    salary >= 14000
    AND salary <= 17000; 

--예제 
--연봉이 14000 이하이거나 17000 이상인 사원의 이름과 연봉을 출력하세요
SELECT
    first_name,
    salary
FROM
    employees
WHERE
    salary <= 14000
    OR salary >= 17000;

--입사일이 04/01/01 에서 05/12/31 사이의 이름과 입사일을 출력하세요 
SELECT
    first_name,
    hire_date
FROM
    employees
WHERE
    hire_date >= '04/01/01'
    and hire_date <= '05/12/31';


--between 연산자로 특정구간 값 출력하기 
--연봉이 14000이상 17000이하인 원의 사원의 이름과 연봉을 구하시오 
select  first_name,
        salary
from employees
where salary >= 14000
    and salary <= 17000;
    
    
select  first_name,
        salary
from employees
where salary >= 14000
    and salary <= 17000;
    
    
select  first_name,
        salary
from employees
where salary between 14000 and 17000;

--in 연산자로 여러 조건을 검사하기 
select  first_name,
        last_name,
        salary  
from employees 
where first_name in ('Neena', 'Lex', 'John'); --> = 연산자를 써서 or 로 출력하는 방법 

-- in 예제 
--연봉이 2100, 3100, 4100, 5100 인 사원의 이름과 연봉을 구하시오
select  first_name,
        salary
from employees
where salary in (2100, 3100, 4100, 5100);  --> '2100'이렇게 쓰면 출력은 되는데..


--Like 연산자로 비슷한것들 모두 찾기
select *
from employees
where first_name like 'L%';  -->L로 시작하는 모든 사원들 출력 

--이름에 am을 포함한 사원의이름과 연봉을 출력하세요 
select *
from employees
WHERE first_name like '%am';  --> 블라블라 am 으로 끝나는 사원들 출력 

--이름의 두번째 글자가 a 인 사원의 이름과 연봉을 출력하세요 
SELECT first_name
from employees
WHERE first_name like '_a%'; --> 이름 두번째에 a가 들어있는 사원들 출력 

SELECT first_name
from employees
WHERE first_name like '___a%'; --> 이름 네번째에 a가 들어있는 사원들 출력 

--이름이 4글자인 사원중 끝에서 두번째 글자가 a인 사원의 이름을 출력하세요
select first_name
from employees 
where first_name like '__a_';


--NULL
select  first_name, 
        salary, 
        commission_pct, 
        salary*commission_pct
from employees
where salary between 13000 and 15000;


--is null / is not null 
select *
from employees
where commission_pct is null; 

-- 커미션비율이 있는 사원의 이름과 연봉 커미션비율을 출력하세요 
select  first_name,
        salary,
        commission_pct
from employees
WHERE commission_pct is not null;

--담당매니저가 없고 커미션비율이 없는 직원의 이름을 출력하세요 
SELECT first_name
from employees
where commission_pct is null
and manager_id is null;

--order by 절 
select *
from employees
order by salary asc, first_name desc; --> asc 는 작은거부터 큰거 오름차순 desc는 내림차순 

select  first_name,
        salary
from employees 
where salary >= 9000
order by salary asc;

--예제 
-- 부서번호를 오름차순으로 정렬하고 부서번호, 급여, 이름을 출력하세요
select  department_id,
        salary,
        first_name
from employees
order by department_id asc;

-- 급여가 10000 이상인 직원의 이름 급여를 급여가 큰직원부터 출력하세요
select  first_name,
        salary
from employees
where salary >= 10000
order by salary desc;

-- 부서번호를 오름차순으로 정렬하고 부서번호가 같으면 급여가 높은 사람부터 부서번호 급여 이름을 출력하세요         
select  department_id,
        salary,
        first_name
from employees
order by    department_id asc,
            salary desc;

