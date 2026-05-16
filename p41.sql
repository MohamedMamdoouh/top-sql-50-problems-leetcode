--  Friend Requests II: Who Has the Most Friends

with
    allUsers
    as
    (
                    select requester_id as id
            from RequestAccepted
        union all
            select accepter_id as id
            from RequestAccepted
    )

select id, count(id) as num
from allUsers
group by id
order by count(id) desc
limit 1
