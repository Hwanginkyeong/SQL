--급여를 가장 많이 받는 5명의 직원의 이름을 출력하세요 
/*
select max(salary)
from employees;

select  first_name,
        salary
from employees
where salary = (select max(salary)
                from employees);
*/
select  rownum,
        first_name,
        salary
from employees
order by salary desc;


select  rownum,
        name,
        salary
from (select first_name name,  --> 필요한거 하나하나 더 적어서 넣기 
             salary
        from employees
        order by salary desc);


select  r.rn,
        r.first_name,
        r.salary
from (select rownum rn,       --> 그래서 미리 번호를 정해주면 해결된다  근데 rownum에 이름을 따로 줘야하고..
             o.first_name,    --> 3단으로 짜려면 데이터 위치 설정 
             o.salary
        from (select first_name,
                        salary
             from employees
             order by salary desc) o
     )r
where rn >=2
and   rn <=5 ;     -->and 사용해서 3~5까지 범위를 설정하면 안나옴 이유는 누적된게 없어서 계속해서 1번으로 메겨지기 때문 


--07년에 입사한 직원중 급여가 많은 직원중 3에서 7등의 이름 급여 입사일은?
select  r.rn,
        r.first_name,
        r.salary,
        r.hire_date
from (select rownum rn,
            o.first_name,
            o.salary,
            o.hire_date
      from (select first_name,
                   salary,
                   hire_date
            from employees
            where hire_date >= '07/01/01'
            and hire_date < '08/01/01'
            order by salary desc) o 
      )r
where rn >= 3
and rn <=7;

--07년에 입사한 직원중 급여가 많은 직원중 3에서 7등의 이름 급여 입사일 부서명은? 
select  r.rn,
        r.first_name,
        r.salary,
        r.hire_date,
        r.department_name
from (select  rownum rn,
              o.first_name,
              o.salary,
              o.hire_date,
              o.department_name
      from(select emp.first_name,
                  emp.salary,
                  emp.hire_date,
                  dep.department_name
           from employees emp, departments dep
           where emp.department_id = dep.department_id
           and hire_date >= '07/01/01'
           and hire_date < '08/01/01'
           order by salary desc) o
     )r
where r.rn >=3
and   r.rn <=7;


-----선생님 코드 

select  ort.rn,
        ort.first_name,
        ort.salary,
        ort.hire_date,
        ort.department_name
from (select rownum rn,
             ot.first_name,
             ot.salary,
             ot.hire_date,
             ot.department_name
      from (select  emp.first_name,
                    emp.salary,
                    emp.hire_date,
                    dep.department_name
            from employees emp, departments dep      ---(0) 부서명 때문에 조인
            where emp.department_id = dep.department_id
            and hire_date >= '07/01/01'
            and hire_date < '08/01/01' 
            order by salary desc) ot     ----(1)
      ) ort   ----(2)
where ort.rn >= 3   ----(3)
and ort.rn <=7;