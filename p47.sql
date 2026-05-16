-- Second Highest Salary

select max(salary) as SecondHighestSalary
from Employee
where salary <> (select max(salary)
from Employee)

-- Another way to find the second highest salary is to use OFFSET and FETCH
select (
select distinct salary
    from Employee
    order by salary desc
offset 1 row fetch next 1 row only) as SecondHighestSalary
