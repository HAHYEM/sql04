--문제1
select count(*)
from employees
where salary < (select avg(salary)
                from employees);

--문제2
select employee_id,
       last_name,
       salary,
       department_id
from employees
where (department_id, salary)in (select department_id,
                                         max(salary)
                                  from employees
                                  group by department_id)
order by salary desc;

--문제3
--다시 한번 봐야함
select j.job_title,
       sum(salary)
from jobs j, employees e
where e.job_id = j.job_id
group by j.job_title
order by sum(salary) desc;

--문제4
select e.employee_id,
       e.last_name,
       e.salary
from employees e, (select department_id, avg(salary) salary
                   from employees
                   group by department_id) s
where e.salary > s.salary
    and e.department_id = s.department_id;