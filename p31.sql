-- Primary Department for Each Employee

    select employee_id , department_id
    from Employee
    where primary_flag = 'y'
union
    select employee_id , department_id
    from Employee
    group by employee_id
    having count(employee_id) = 1