--left outer join 
select  em.first_name,
        em.salary,
        em.department_id,
        de.department_id,
        de.department_name
from employees em left outer join departments de
on em.department_id = de.department_id;


--right outer join 
select  em.first_name,
        em.salary,
        em.department_id,
        de.department_id,
        de.department_name
from employees em right outer join departments de
on em.department_id = de.department_id;

select  em.first_name,
        em.salary,
        em.department_id,
        de.department_id,
        de.department_name
from employees em, departments de
where em.department_id(+) = de.department_id; -->null로 표현되는 곳을 + 

select count(*)
from employees em, departments de
where em.department_id(+) = de.department_id;


--right outer join  ---> left outer join
select  em.first_name,
        em.salary,
        em.department_id,
        de.department_id,
        de.department_name
from departments de left outer join employees em
on de.department_id = em.department_id; 


--self join   --> 직원테이블 부서테이블 조인문과 비교 

select  em.employee_id,
        em.first_name,
        em.salary,
        em.phone_number,
        em.manager_id,
        ma.employee_id,
        ma.phone_number,
        ma.email
from employees em, employees ma
where em.manager_id = ma.employee_id;


select  employee_id,
        first_name,
        phone_number,
        salary,
        manager_id
from employees;



















