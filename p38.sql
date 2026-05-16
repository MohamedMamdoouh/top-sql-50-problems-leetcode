-- Exchange Seats

select
    (
if(id % 2 = 0, id - 1,
if(id % 2 = 1 and id != (select count(*)
    from seat), id + 1, id))
) 
as id, student
from seat
order by id