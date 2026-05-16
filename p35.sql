-- Last Person to Fit in the Bus

with
    cte
    as
    (
        select person_name , sum(weight) over (order by turn asc) as totalW
        from Queue
    )

select person_name
from cte
where totalW <= 1000
order by totalW desc
limit 1
