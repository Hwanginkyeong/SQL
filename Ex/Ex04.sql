/*******************
--group by 절 
*******************/
select department_id, avg(salary)
from employees
group by department_id
order by department_id;  --> 마지막에 정렬해주는 게 좋음 

select department_id,count(*), avg(salary) -->그룹 기준으로 평균을 낼 수 있음 
from employees
group by department_id;

select department_id, job_id, count(*), avg(salary)
from employees
group by department_id, job_id
order by department_id asc, job_id desc;


--where 절에는 그룹 함수를 슬 수 없다. 
select department_id, count(*), sum(salary)
from employees
where sum(salary) >= 20000
GROUP BY department_id;

--having절 
select department_id, count(*), sum(salary)
from employees
GROUP BY department_id
having sum(salary) >= 20000
and department_id = 100 ;

-- case ~ end 문 
select  employee_id,
        first_name,
        salary,
        case when job_id = 'ac_account' then salary + salary * 0.1
             when job_id = 'sa_rep' then salary + salary*02
             when job_id = 'st_clerk' then salary + salary*0.3
        end realsalary
from employees;

--decode()
select  employee_id,
        first_name,
        salary,
        decode (job_id, 'AC_ACCOUNT', salary + salary * 0,1,
                        'SA_REP', salary + salary * 0.2,
                        'ST_CLERK', salary + salary * 0.2,
                salary) as realSalary
from employees;

--예제 
/***
직원의 이름, 부서, 팀을 출력하세요
팀은 코드로 결정하며 부서코드가 10~50 이면 ‘A-TEAM’
60~100이면 ‘B-TEAM’ 110~150이면 ‘C-TEAM’ 나머지는 ‘팀없음’ 으로 출력하세요.
***/
select  first_name,
        department_id,
        case when   department_id >= 10 and job_id <= 50 then 'A-TEAM'
             when   department_id >= 60 and job_id <= 100 then 'B-TEAM'
             when   department_id >= 110 and job_id <= 150 then 'C-TEAM'
        else '팀없음'
from employees; 


/********************
*JOIN
********************/

--카티젼 프로덕트(cartesian proudct)
select em.employee_id,
        em.first_name,
        em.salary,
        de.department_name
from employees em, departments de
where employees.department_id = departments.department_id;

--예
--모든 직원이름, 부서이름, 업무명 을 출력하세요모든 직원이름, 부서이름, 업무명 을 출력하세요
select  em.first_name,
        de.department_name,
        jo.job_title
from employees em, departments de, jobs jo 
where   em.department_id = de.department_id
and     em.job_id = jo.job_id;



select  em.first_name,
        de.department_name,
        jo.job_title
from employees em, departments de, jobs jo 
where   em.department_id = de.department_id
and     em.job_id = jo.job_id
order by em.first_name asc;


