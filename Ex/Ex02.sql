/* 단일행 함수 */

--문자 함수 INICAP(컬럼명)
select  email,
        initcap(email),
        department_id
from employees
where department_id = 100;

--문자 함수 lower(컬럼명)/upper(컬럼명)
select  first_name,
        lower(first_name) l_first_name,
        upper(first_name) u_first_name
from employees
where department_id = 100;

--문자함수 substr(컬럼명, 시작위치, 글자수)
select  first_name,
        substr(first_name,1,3),
        substr(first_name,-4,3)
from employees
where department_id = 100;

--문자함수 lapd(컬럼명, 자리수, '채울문자') / rpad
select  first_name,
        lpad(first_name, 10, '*'),
        rpad(first_name, 10, '*')
from employees;

--문자함수 repalce (컬럼명, 문자1, 문자2)
select  first_name,
        replace(first_name, 'a', '*'),
        replace(first_name, substr(first_name,1,3), '***')
from employees
where department_id = 100; 

--숫자함수 round(숫자, 출력을 원하는 자리수)
select  round(123.346,2) "r2",
        round(123.856,0) "r0",
        round(123.856,-1) "r-1"
from dual; --문단의 구조때문에 아무것도 없는 dual 가상의 테이블을 넣어줌 

--숫자함수
select  trunc(123.346, 2) "r2",
        trunc(123.956, 0) "r0",
        trunc(123.456,-1) "r-1"
from dual;

--날짜함수 
select sysdate
from dual; 

select  sysdate,
        hire_date,
        months_between(sysdate, hire_date),
        round(months_between(sysdate, hire_date),0),
        round(months_between(sysdate, hire_date),0)
from employees
where department_id = 100; 

--변환함수 to_char(숫자, '출력모양') 날짜 -> 문자형으로 변환하기 
select  first_name,
        salary,
        salary*12,
        to_char(salary*12, '$99999'),
        to_char(salary*12, '$99999') 
from employees
where department_id = 100;

--변환함수 to_char(숫자, '출력모양') 날짜 -> 문자형으로 변환하기
select  sysdate,
        to_char(sysdate,'YYYY-MM-DD HH24:MI:SS')
from dual;

--일반함수>NVL(컬럼명, null일때값)/NVL2(컬럼명, null아닐때값, null일때 값)
select  first_name,
        commission_pct, 
        nvl(commission_pct, 0),
        nvl2(commission_pct, 100, 0)
from employees;







--그롭함수 avg()
select avg(salary)
from employees;

--그룹함수 count()
select  count(*),
        count(commission_pct),
        count(department_id)
from employees;

select  count(*)
from EMPLOYEES
where salary > 16000;

select count(*)
from employees
where department_id = 100;

--그룹함수 sum()
select  sum(salary),
        count(*),
        avg(salary)
from employees
where salary > 16000;  --> 3명의 합계 평균 

--group by 절 
select avg(salary), department_id
from employees
group by department_id; --> 그룹으로 묶어놨으니 표현이 가능하다 


select *
from employees;


