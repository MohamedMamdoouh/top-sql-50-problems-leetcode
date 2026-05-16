-- Department Top Three Salaries

select Department, Employee, Salary
from
    (
    select d.name as Department, e.name as Employee, e.salary as Salary,
        dense_rank() over (partition by departmentId order by salary desc) as ranked
    from Employee e inner join Department d on e.departmentId = d.id 
) as r1

where ranked < 4