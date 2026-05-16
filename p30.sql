-- The Number of Employees Which Report to Each Employee

select m.employee_id , m.name, count(e.employee_id) as reports_count ,
    round(avg(e.age)) as average_age
from Employees e
    inner join Employees m
    on e.reports_to = m.employee_id
group by employee_id
order by employee_id 